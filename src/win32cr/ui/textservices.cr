require "../foundation.cr"
require "../system/com.cr"
require "../ui/windowsandmessaging.cr"
require "../graphics/gdi.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:msctfmonitor.dll")]
{% else %}
@[Link("msctfmonitor")]
{% end %}
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
  CLSID_MSAAControl = LibC::GUID.new(0x8cd963f_u32, 0x7a3e_u16, 0x4f5c_u16, StaticArray[0x9b_u8, 0xd8_u8, 0xd6_u8, 0x92_u8, 0xbb_u8, 0x4_u8, 0x3c_u8, 0x5b_u8])
  CLSID_AccStore = LibC::GUID.new(0x5440837f_u32, 0x4bff_u16, 0x4ae5_u16, StaticArray[0xa1_u8, 0xb1_u8, 0x77_u8, 0x22_u8, 0xec_u8, 0xc6_u8, 0x33_u8, 0x2a_u8])
  CLSID_AccDictionary = LibC::GUID.new(0x6572ee16_u32, 0x5fe5_u16, 0x4331_u16, StaticArray[0xbb_u8, 0x6d_u8, 0x76_u8, 0xa4_u8, 0x9c_u8, 0x56_u8, 0xe4_u8, 0x23_u8])
  CLSID_AccServerDocMgr = LibC::GUID.new(0x6089a37e_u32, 0xeb8a_u16, 0x482d_u16, StaticArray[0xbd_u8, 0x6f_u8, 0xf9_u8, 0xf4_u8, 0x69_u8, 0x4_u8, 0xd1_u8, 0x6d_u8])
  CLSID_AccClientDocMgr = LibC::GUID.new(0xfc48cc30_u32, 0x4f3e_u16, 0x4fa1_u16, StaticArray[0x80_u8, 0x3b_u8, 0xad_u8, 0xe_u8, 0x19_u8, 0x6a_u8, 0x83_u8, 0xb1_u8])
  CLSID_DocWrap = LibC::GUID.new(0xbf426f7e_u32, 0x7a5e_u16, 0x44d6_u16, StaticArray[0x83_u8, 0xc_u8, 0xa3_u8, 0x90_u8, 0xea_u8, 0x94_u8, 0x62_u8, 0xa3_u8])


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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise_sink : UInt64
    unadvise_sink : UInt64
    request_lock : UInt64
    get_status : UInt64
    query_insert : UInt64
    get_selection : UInt64
    set_selection : UInt64
    get_text : UInt64
    set_text : UInt64
    get_formatted_text : UInt64
    get_embedded : UInt64
    query_insert_embedded : UInt64
    insert_embedded : UInt64
    insert_text_at_selection : UInt64
    insert_embedded_at_selection : UInt64
    request_supported_attrs : UInt64
    request_attrs_at_position : UInt64
    request_attrs_transitioning_at_position : UInt64
    find_next_attr_transition : UInt64
    retrieve_requested_attrs : UInt64
    get_end_acp : UInt64
    get_active_view : UInt64
    get_acp_from_point : UInt64
    get_text_ext : UInt64
    get_screen_ext : UInt64
    get_wnd : UInt64
  end

  ITextStoreACP_GUID = "28888fe3-c2a0-483a-a3ea-8cb1ce51ff3d"
  IID_ITextStoreACP = LibC::GUID.new(0x28888fe3_u32, 0xc2a0_u16, 0x483a_u16, StaticArray[0xa3_u8, 0xea_u8, 0x8c_u8, 0xb1_u8, 0xce_u8, 0x51_u8, 0xff_u8, 0x3d_u8])
  struct ITextStoreACP
    lpVtbl : ITextStoreACPVTbl*
  end

  struct ITextStoreACP2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise_sink : UInt64
    unadvise_sink : UInt64
    request_lock : UInt64
    get_status : UInt64
    query_insert : UInt64
    get_selection : UInt64
    set_selection : UInt64
    get_text : UInt64
    set_text : UInt64
    get_formatted_text : UInt64
    get_embedded : UInt64
    query_insert_embedded : UInt64
    insert_embedded : UInt64
    insert_text_at_selection : UInt64
    insert_embedded_at_selection : UInt64
    request_supported_attrs : UInt64
    request_attrs_at_position : UInt64
    request_attrs_transitioning_at_position : UInt64
    find_next_attr_transition : UInt64
    retrieve_requested_attrs : UInt64
    get_end_acp : UInt64
    get_active_view : UInt64
    get_acp_from_point : UInt64
    get_text_ext : UInt64
    get_screen_ext : UInt64
  end

  ITextStoreACP2_GUID = "f86ad89f-5fe4-4b8d-bb9f-ef3797a84f1f"
  IID_ITextStoreACP2 = LibC::GUID.new(0xf86ad89f_u32, 0x5fe4_u16, 0x4b8d_u16, StaticArray[0xbb_u8, 0x9f_u8, 0xef_u8, 0x37_u8, 0x97_u8, 0xa8_u8, 0x4f_u8, 0x1f_u8])
  struct ITextStoreACP2
    lpVtbl : ITextStoreACP2VTbl*
  end

  struct ITextStoreACPSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_text_change : UInt64
    on_selection_change : UInt64
    on_layout_change : UInt64
    on_status_change : UInt64
    on_attrs_change : UInt64
    on_lock_granted : UInt64
    on_start_edit_transaction : UInt64
    on_end_edit_transaction : UInt64
  end

  ITextStoreACPSink_GUID = "22d44c94-a419-4542-a272-ae26093ececf"
  IID_ITextStoreACPSink = LibC::GUID.new(0x22d44c94_u32, 0xa419_u16, 0x4542_u16, StaticArray[0xa2_u8, 0x72_u8, 0xae_u8, 0x26_u8, 0x9_u8, 0x3e_u8, 0xce_u8, 0xcf_u8])
  struct ITextStoreACPSink
    lpVtbl : ITextStoreACPSinkVTbl*
  end

  struct IAnchorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_gravity : UInt64
    get_gravity : UInt64
    is_equal : UInt64
    compare : UInt64
    shift : UInt64
    shift_to : UInt64
    shift_region : UInt64
    set_change_history_mask : UInt64
    get_change_history : UInt64
    clear_change_history : UInt64
    clone : UInt64
  end

  IAnchor_GUID = "0feb7e34-5a60-4356-8ef7-abdec2ff7cf8"
  IID_IAnchor = LibC::GUID.new(0xfeb7e34_u32, 0x5a60_u16, 0x4356_u16, StaticArray[0x8e_u8, 0xf7_u8, 0xab_u8, 0xde_u8, 0xc2_u8, 0xff_u8, 0x7c_u8, 0xf8_u8])
  struct IAnchor
    lpVtbl : IAnchorVTbl*
  end

  struct ITextStoreAnchorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise_sink : UInt64
    unadvise_sink : UInt64
    request_lock : UInt64
    get_status : UInt64
    query_insert : UInt64
    get_selection : UInt64
    set_selection : UInt64
    get_text : UInt64
    set_text : UInt64
    get_formatted_text : UInt64
    get_embedded : UInt64
    insert_embedded : UInt64
    request_supported_attrs : UInt64
    request_attrs_at_position : UInt64
    request_attrs_transitioning_at_position : UInt64
    find_next_attr_transition : UInt64
    retrieve_requested_attrs : UInt64
    get_start : UInt64
    get_end : UInt64
    get_active_view : UInt64
    get_anchor_from_point : UInt64
    get_text_ext : UInt64
    get_screen_ext : UInt64
    get_wnd : UInt64
    query_insert_embedded : UInt64
    insert_text_at_selection : UInt64
    insert_embedded_at_selection : UInt64
  end

  ITextStoreAnchor_GUID = "9b2077b0-5f18-4dec-bee9-3cc722f5dfe0"
  IID_ITextStoreAnchor = LibC::GUID.new(0x9b2077b0_u32, 0x5f18_u16, 0x4dec_u16, StaticArray[0xbe_u8, 0xe9_u8, 0x3c_u8, 0xc7_u8, 0x22_u8, 0xf5_u8, 0xdf_u8, 0xe0_u8])
  struct ITextStoreAnchor
    lpVtbl : ITextStoreAnchorVTbl*
  end

  struct ITextStoreAnchorSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_text_change : UInt64
    on_selection_change : UInt64
    on_layout_change : UInt64
    on_status_change : UInt64
    on_attrs_change : UInt64
    on_lock_granted : UInt64
    on_start_edit_transaction : UInt64
    on_end_edit_transaction : UInt64
  end

  ITextStoreAnchorSink_GUID = "aa80e905-2021-11d2-93e0-0060b067b86e"
  IID_ITextStoreAnchorSink = LibC::GUID.new(0xaa80e905_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
  struct ITextStoreAnchorSink
    lpVtbl : ITextStoreAnchorSinkVTbl*
  end

  struct ITfLangBarMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise_event_sink : UInt64
    unadvise_event_sink : UInt64
    get_thread_marshal_interface : UInt64
    get_thread_lang_bar_item_mgr : UInt64
    get_input_processor_profiles : UInt64
    restore_last_focus : UInt64
    set_modal_input : UInt64
    show_floating : UInt64
    get_show_floating_status : UInt64
  end

  ITfLangBarMgr_GUID = "87955690-e627-11d2-8ddb-00105a2799b5"
  IID_ITfLangBarMgr = LibC::GUID.new(0x87955690_u32, 0xe627_u16, 0x11d2_u16, StaticArray[0x8d_u8, 0xdb_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct ITfLangBarMgr
    lpVtbl : ITfLangBarMgrVTbl*
  end

  struct ITfLangBarEventSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_set_focus : UInt64
    on_thread_terminate : UInt64
    on_thread_item_change : UInt64
    on_modal_input : UInt64
    show_floating : UInt64
    get_item_floating_rect : UInt64
  end

  ITfLangBarEventSink_GUID = "18a4e900-e0ae-11d2-afdd-00105a2799b5"
  IID_ITfLangBarEventSink = LibC::GUID.new(0x18a4e900_u32, 0xe0ae_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xdd_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct ITfLangBarEventSink
    lpVtbl : ITfLangBarEventSinkVTbl*
  end

  struct ITfLangBarItemSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_update : UInt64
  end

  ITfLangBarItemSink_GUID = "57dbe1a0-de25-11d2-afdd-00105a2799b5"
  IID_ITfLangBarItemSink = LibC::GUID.new(0x57dbe1a0_u32, 0xde25_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xdd_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct ITfLangBarItemSink
    lpVtbl : ITfLangBarItemSinkVTbl*
  end

  struct IEnumTfLangBarItemsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumTfLangBarItems_GUID = "583f34d0-de25-11d2-afdd-00105a2799b5"
  IID_IEnumTfLangBarItems = LibC::GUID.new(0x583f34d0_u32, 0xde25_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xdd_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct IEnumTfLangBarItems
    lpVtbl : IEnumTfLangBarItemsVTbl*
  end

  struct ITfLangBarItemMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enum_items : UInt64
    get_item : UInt64
    add_item : UInt64
    remove_item : UInt64
    advise_item_sink : UInt64
    unadvise_item_sink : UInt64
    get_item_floating_rect : UInt64
    get_items_status : UInt64
    get_item_num : UInt64
    get_items : UInt64
    advise_items_sink : UInt64
    unadvise_items_sink : UInt64
  end

  ITfLangBarItemMgr_GUID = "ba468c55-9956-4fb1-a59d-52a7dd7cc6aa"
  IID_ITfLangBarItemMgr = LibC::GUID.new(0xba468c55_u32, 0x9956_u16, 0x4fb1_u16, StaticArray[0xa5_u8, 0x9d_u8, 0x52_u8, 0xa7_u8, 0xdd_u8, 0x7c_u8, 0xc6_u8, 0xaa_u8])
  struct ITfLangBarItemMgr
    lpVtbl : ITfLangBarItemMgrVTbl*
  end

  struct ITfLangBarItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_info : UInt64
    get_status : UInt64
    show : UInt64
    get_tooltip_string : UInt64
  end

  ITfLangBarItem_GUID = "73540d69-edeb-4ee9-96c9-23aa30b25916"
  IID_ITfLangBarItem = LibC::GUID.new(0x73540d69_u32, 0xedeb_u16, 0x4ee9_u16, StaticArray[0x96_u8, 0xc9_u8, 0x23_u8, 0xaa_u8, 0x30_u8, 0xb2_u8, 0x59_u8, 0x16_u8])
  struct ITfLangBarItem
    lpVtbl : ITfLangBarItemVTbl*
  end

  struct ITfSystemLangBarItemSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    init_menu : UInt64
    on_menu_select : UInt64
  end

  ITfSystemLangBarItemSink_GUID = "1449d9ab-13cf-4687-aa3e-8d8b18574396"
  IID_ITfSystemLangBarItemSink = LibC::GUID.new(0x1449d9ab_u32, 0x13cf_u16, 0x4687_u16, StaticArray[0xaa_u8, 0x3e_u8, 0x8d_u8, 0x8b_u8, 0x18_u8, 0x57_u8, 0x43_u8, 0x96_u8])
  struct ITfSystemLangBarItemSink
    lpVtbl : ITfSystemLangBarItemSinkVTbl*
  end

  struct ITfSystemLangBarItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_icon : UInt64
    set_tooltip_string : UInt64
  end

  ITfSystemLangBarItem_GUID = "1e13e9ec-6b33-4d4a-b5eb-8a92f029f356"
  IID_ITfSystemLangBarItem = LibC::GUID.new(0x1e13e9ec_u32, 0x6b33_u16, 0x4d4a_u16, StaticArray[0xb5_u8, 0xeb_u8, 0x8a_u8, 0x92_u8, 0xf0_u8, 0x29_u8, 0xf3_u8, 0x56_u8])
  struct ITfSystemLangBarItem
    lpVtbl : ITfSystemLangBarItemVTbl*
  end

  struct ITfSystemLangBarItemTextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_item_text : UInt64
    get_item_text : UInt64
  end

  ITfSystemLangBarItemText_GUID = "5c4ce0e5-ba49-4b52-ac6b-3b397b4f701f"
  IID_ITfSystemLangBarItemText = LibC::GUID.new(0x5c4ce0e5_u32, 0xba49_u16, 0x4b52_u16, StaticArray[0xac_u8, 0x6b_u8, 0x3b_u8, 0x39_u8, 0x7b_u8, 0x4f_u8, 0x70_u8, 0x1f_u8])
  struct ITfSystemLangBarItemText
    lpVtbl : ITfSystemLangBarItemTextVTbl*
  end

  struct ITfSystemDeviceTypeLangBarItemVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_icon_mode : UInt64
    get_icon_mode : UInt64
  end

  ITfSystemDeviceTypeLangBarItem_GUID = "45672eb9-9059-46a2-838d-4530355f6a77"
  IID_ITfSystemDeviceTypeLangBarItem = LibC::GUID.new(0x45672eb9_u32, 0x9059_u16, 0x46a2_u16, StaticArray[0x83_u8, 0x8d_u8, 0x45_u8, 0x30_u8, 0x35_u8, 0x5f_u8, 0x6a_u8, 0x77_u8])
  struct ITfSystemDeviceTypeLangBarItem
    lpVtbl : ITfSystemDeviceTypeLangBarItemVTbl*
  end

  struct ITfLangBarItemButtonVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_info : UInt64
    get_status : UInt64
    show : UInt64
    get_tooltip_string : UInt64
    on_click : UInt64
    init_menu : UInt64
    on_menu_select : UInt64
    get_icon : UInt64
    get_text : UInt64
  end

  ITfLangBarItemButton_GUID = "28c7f1d0-de25-11d2-afdd-00105a2799b5"
  IID_ITfLangBarItemButton = LibC::GUID.new(0x28c7f1d0_u32, 0xde25_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xdd_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct ITfLangBarItemButton
    lpVtbl : ITfLangBarItemButtonVTbl*
  end

  struct ITfLangBarItemBitmapButtonVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_info : UInt64
    get_status : UInt64
    show : UInt64
    get_tooltip_string : UInt64
    on_click : UInt64
    init_menu : UInt64
    on_menu_select : UInt64
    get_preferred_size : UInt64
    draw_bitmap : UInt64
    get_text : UInt64
  end

  ITfLangBarItemBitmapButton_GUID = "a26a0525-3fae-4fa0-89ee-88a964f9f1b5"
  IID_ITfLangBarItemBitmapButton = LibC::GUID.new(0xa26a0525_u32, 0x3fae_u16, 0x4fa0_u16, StaticArray[0x89_u8, 0xee_u8, 0x88_u8, 0xa9_u8, 0x64_u8, 0xf9_u8, 0xf1_u8, 0xb5_u8])
  struct ITfLangBarItemBitmapButton
    lpVtbl : ITfLangBarItemBitmapButtonVTbl*
  end

  struct ITfLangBarItemBitmapVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_info : UInt64
    get_status : UInt64
    show : UInt64
    get_tooltip_string : UInt64
    on_click : UInt64
    get_preferred_size : UInt64
    draw_bitmap : UInt64
  end

  ITfLangBarItemBitmap_GUID = "73830352-d722-4179-ada5-f045c98df355"
  IID_ITfLangBarItemBitmap = LibC::GUID.new(0x73830352_u32, 0xd722_u16, 0x4179_u16, StaticArray[0xad_u8, 0xa5_u8, 0xf0_u8, 0x45_u8, 0xc9_u8, 0x8d_u8, 0xf3_u8, 0x55_u8])
  struct ITfLangBarItemBitmap
    lpVtbl : ITfLangBarItemBitmapVTbl*
  end

  struct ITfLangBarItemBalloonVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_info : UInt64
    get_status : UInt64
    show : UInt64
    get_tooltip_string : UInt64
    on_click : UInt64
    get_preferred_size : UInt64
    get_balloon_info : UInt64
  end

  ITfLangBarItemBalloon_GUID = "01c2d285-d3c7-4b7b-b5b5-d97411d0c283"
  IID_ITfLangBarItemBalloon = LibC::GUID.new(0x1c2d285_u32, 0xd3c7_u16, 0x4b7b_u16, StaticArray[0xb5_u8, 0xb5_u8, 0xd9_u8, 0x74_u8, 0x11_u8, 0xd0_u8, 0xc2_u8, 0x83_u8])
  struct ITfLangBarItemBalloon
    lpVtbl : ITfLangBarItemBalloonVTbl*
  end

  struct ITfMenuVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_menu_item : UInt64
  end

  ITfMenu_GUID = "6f8a98e4-aaa0-4f15-8c5b-07e0df0a3dd8"
  IID_ITfMenu = LibC::GUID.new(0x6f8a98e4_u32, 0xaaa0_u16, 0x4f15_u16, StaticArray[0x8c_u8, 0x5b_u8, 0x7_u8, 0xe0_u8, 0xdf_u8, 0xa_u8, 0x3d_u8, 0xd8_u8])
  struct ITfMenu
    lpVtbl : ITfMenuVTbl*
  end

  struct ITfThreadMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    activate : UInt64
    deactivate : UInt64
    create_document_mgr : UInt64
    enum_document_mgrs : UInt64
    get_focus : UInt64
    set_focus : UInt64
    associate_focus : UInt64
    is_thread_focus : UInt64
    get_function_provider : UInt64
    enum_function_providers : UInt64
    get_global_compartment : UInt64
  end

  ITfThreadMgr_GUID = "aa80e801-2021-11d2-93e0-0060b067b86e"
  IID_ITfThreadMgr = LibC::GUID.new(0xaa80e801_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
  struct ITfThreadMgr
    lpVtbl : ITfThreadMgrVTbl*
  end

  struct ITfThreadMgrExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    activate : UInt64
    deactivate : UInt64
    create_document_mgr : UInt64
    enum_document_mgrs : UInt64
    get_focus : UInt64
    set_focus : UInt64
    associate_focus : UInt64
    is_thread_focus : UInt64
    get_function_provider : UInt64
    enum_function_providers : UInt64
    get_global_compartment : UInt64
    activate_ex : UInt64
    get_active_flags : UInt64
  end

  ITfThreadMgrEx_GUID = "3e90ade3-7594-4cb0-bb58-69628f5f458c"
  IID_ITfThreadMgrEx = LibC::GUID.new(0x3e90ade3_u32, 0x7594_u16, 0x4cb0_u16, StaticArray[0xbb_u8, 0x58_u8, 0x69_u8, 0x62_u8, 0x8f_u8, 0x5f_u8, 0x45_u8, 0x8c_u8])
  struct ITfThreadMgrEx
    lpVtbl : ITfThreadMgrExVTbl*
  end

  struct ITfThreadMgr2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    activate : UInt64
    deactivate : UInt64
    create_document_mgr : UInt64
    enum_document_mgrs : UInt64
    get_focus : UInt64
    set_focus : UInt64
    is_thread_focus : UInt64
    get_function_provider : UInt64
    enum_function_providers : UInt64
    get_global_compartment : UInt64
    activate_ex : UInt64
    get_active_flags : UInt64
    suspend_keystroke_handling : UInt64
    resume_keystroke_handling : UInt64
  end

  ITfThreadMgr2_GUID = "0ab198ef-6477-4ee8-8812-6780edb82d5e"
  IID_ITfThreadMgr2 = LibC::GUID.new(0xab198ef_u32, 0x6477_u16, 0x4ee8_u16, StaticArray[0x88_u8, 0x12_u8, 0x67_u8, 0x80_u8, 0xed_u8, 0xb8_u8, 0x2d_u8, 0x5e_u8])
  struct ITfThreadMgr2
    lpVtbl : ITfThreadMgr2VTbl*
  end

  struct ITfThreadMgrEventSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_init_document_mgr : UInt64
    on_uninit_document_mgr : UInt64
    on_set_focus : UInt64
    on_push_context : UInt64
    on_pop_context : UInt64
  end

  ITfThreadMgrEventSink_GUID = "aa80e80e-2021-11d2-93e0-0060b067b86e"
  IID_ITfThreadMgrEventSink = LibC::GUID.new(0xaa80e80e_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
  struct ITfThreadMgrEventSink
    lpVtbl : ITfThreadMgrEventSinkVTbl*
  end

  struct ITfConfigureSystemKeystrokeFeedVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    disable_system_keystroke_feed : UInt64
    enable_system_keystroke_feed : UInt64
  end

  ITfConfigureSystemKeystrokeFeed_GUID = "0d2c969a-bc9c-437c-84ee-951c49b1a764"
  IID_ITfConfigureSystemKeystrokeFeed = LibC::GUID.new(0xd2c969a_u32, 0xbc9c_u16, 0x437c_u16, StaticArray[0x84_u8, 0xee_u8, 0x95_u8, 0x1c_u8, 0x49_u8, 0xb1_u8, 0xa7_u8, 0x64_u8])
  struct ITfConfigureSystemKeystrokeFeed
    lpVtbl : ITfConfigureSystemKeystrokeFeedVTbl*
  end

  struct IEnumTfDocumentMgrsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumTfDocumentMgrs_GUID = "aa80e808-2021-11d2-93e0-0060b067b86e"
  IID_IEnumTfDocumentMgrs = LibC::GUID.new(0xaa80e808_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
  struct IEnumTfDocumentMgrs
    lpVtbl : IEnumTfDocumentMgrsVTbl*
  end

  struct ITfDocumentMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_context : UInt64
    push : UInt64
    pop : UInt64
    get_top : UInt64
    get_base : UInt64
    enum_contexts : UInt64
  end

  ITfDocumentMgr_GUID = "aa80e7f4-2021-11d2-93e0-0060b067b86e"
  IID_ITfDocumentMgr = LibC::GUID.new(0xaa80e7f4_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
  struct ITfDocumentMgr
    lpVtbl : ITfDocumentMgrVTbl*
  end

  struct IEnumTfContextsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumTfContexts_GUID = "8f1a7ea6-1654-4502-a86e-b2902344d507"
  IID_IEnumTfContexts = LibC::GUID.new(0x8f1a7ea6_u32, 0x1654_u16, 0x4502_u16, StaticArray[0xa8_u8, 0x6e_u8, 0xb2_u8, 0x90_u8, 0x23_u8, 0x44_u8, 0xd5_u8, 0x7_u8])
  struct IEnumTfContexts
    lpVtbl : IEnumTfContextsVTbl*
  end

  struct ITfCompositionViewVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_owner_clsid : UInt64
    get_range : UInt64
  end

  ITfCompositionView_GUID = "d7540241-f9a1-4364-befc-dbcd2c4395b7"
  IID_ITfCompositionView = LibC::GUID.new(0xd7540241_u32, 0xf9a1_u16, 0x4364_u16, StaticArray[0xbe_u8, 0xfc_u8, 0xdb_u8, 0xcd_u8, 0x2c_u8, 0x43_u8, 0x95_u8, 0xb7_u8])
  struct ITfCompositionView
    lpVtbl : ITfCompositionViewVTbl*
  end

  struct IEnumITfCompositionViewVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumITfCompositionView_GUID = "5efd22ba-7838-46cb-88e2-cadb14124f8f"
  IID_IEnumITfCompositionView = LibC::GUID.new(0x5efd22ba_u32, 0x7838_u16, 0x46cb_u16, StaticArray[0x88_u8, 0xe2_u8, 0xca_u8, 0xdb_u8, 0x14_u8, 0x12_u8, 0x4f_u8, 0x8f_u8])
  struct IEnumITfCompositionView
    lpVtbl : IEnumITfCompositionViewVTbl*
  end

  struct ITfCompositionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_range : UInt64
    shift_start : UInt64
    shift_end : UInt64
    end_composition : UInt64
  end

  ITfComposition_GUID = "20168d64-5a8f-4a5a-b7bd-cfa29f4d0fd9"
  IID_ITfComposition = LibC::GUID.new(0x20168d64_u32, 0x5a8f_u16, 0x4a5a_u16, StaticArray[0xb7_u8, 0xbd_u8, 0xcf_u8, 0xa2_u8, 0x9f_u8, 0x4d_u8, 0xf_u8, 0xd9_u8])
  struct ITfComposition
    lpVtbl : ITfCompositionVTbl*
  end

  struct ITfCompositionSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_composition_terminated : UInt64
  end

  ITfCompositionSink_GUID = "a781718c-579a-4b15-a280-32b8577acc5e"
  IID_ITfCompositionSink = LibC::GUID.new(0xa781718c_u32, 0x579a_u16, 0x4b15_u16, StaticArray[0xa2_u8, 0x80_u8, 0x32_u8, 0xb8_u8, 0x57_u8, 0x7a_u8, 0xcc_u8, 0x5e_u8])
  struct ITfCompositionSink
    lpVtbl : ITfCompositionSinkVTbl*
  end

  struct ITfContextCompositionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    start_composition : UInt64
    enum_compositions : UInt64
    find_composition : UInt64
    take_ownership : UInt64
  end

  ITfContextComposition_GUID = "d40c8aae-ac92-4fc7-9a11-0ee0e23aa39b"
  IID_ITfContextComposition = LibC::GUID.new(0xd40c8aae_u32, 0xac92_u16, 0x4fc7_u16, StaticArray[0x9a_u8, 0x11_u8, 0xe_u8, 0xe0_u8, 0xe2_u8, 0x3a_u8, 0xa3_u8, 0x9b_u8])
  struct ITfContextComposition
    lpVtbl : ITfContextCompositionVTbl*
  end

  struct ITfContextOwnerCompositionServicesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    start_composition : UInt64
    enum_compositions : UInt64
    find_composition : UInt64
    take_ownership : UInt64
    terminate_composition : UInt64
  end

  ITfContextOwnerCompositionServices_GUID = "86462810-593b-4916-9764-19c08e9ce110"
  IID_ITfContextOwnerCompositionServices = LibC::GUID.new(0x86462810_u32, 0x593b_u16, 0x4916_u16, StaticArray[0x97_u8, 0x64_u8, 0x19_u8, 0xc0_u8, 0x8e_u8, 0x9c_u8, 0xe1_u8, 0x10_u8])
  struct ITfContextOwnerCompositionServices
    lpVtbl : ITfContextOwnerCompositionServicesVTbl*
  end

  struct ITfContextOwnerCompositionSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_start_composition : UInt64
    on_update_composition : UInt64
    on_end_composition : UInt64
  end

  ITfContextOwnerCompositionSink_GUID = "5f20aa40-b57a-4f34-96ab-3576f377cc79"
  IID_ITfContextOwnerCompositionSink = LibC::GUID.new(0x5f20aa40_u32, 0xb57a_u16, 0x4f34_u16, StaticArray[0x96_u8, 0xab_u8, 0x35_u8, 0x76_u8, 0xf3_u8, 0x77_u8, 0xcc_u8, 0x79_u8])
  struct ITfContextOwnerCompositionSink
    lpVtbl : ITfContextOwnerCompositionSinkVTbl*
  end

  struct ITfContextViewVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_range_from_point : UInt64
    get_text_ext : UInt64
    get_screen_ext : UInt64
    get_wnd : UInt64
  end

  ITfContextView_GUID = "2433bf8e-0f9b-435c-ba2c-180611978c30"
  IID_ITfContextView = LibC::GUID.new(0x2433bf8e_u32, 0xf9b_u16, 0x435c_u16, StaticArray[0xba_u8, 0x2c_u8, 0x18_u8, 0x6_u8, 0x11_u8, 0x97_u8, 0x8c_u8, 0x30_u8])
  struct ITfContextView
    lpVtbl : ITfContextViewVTbl*
  end

  struct IEnumTfContextViewsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumTfContextViews_GUID = "f0c0f8dd-cf38-44e1-bb0f-68cf0d551c78"
  IID_IEnumTfContextViews = LibC::GUID.new(0xf0c0f8dd_u32, 0xcf38_u16, 0x44e1_u16, StaticArray[0xbb_u8, 0xf_u8, 0x68_u8, 0xcf_u8, 0xd_u8, 0x55_u8, 0x1c_u8, 0x78_u8])
  struct IEnumTfContextViews
    lpVtbl : IEnumTfContextViewsVTbl*
  end

  struct ITfContextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    request_edit_session : UInt64
    in_write_session : UInt64
    get_selection : UInt64
    set_selection : UInt64
    get_start : UInt64
    get_end : UInt64
    get_active_view : UInt64
    enum_views : UInt64
    get_status : UInt64
    get_property : UInt64
    get_app_property : UInt64
    track_properties : UInt64
    enum_properties : UInt64
    get_document_mgr : UInt64
    create_range_backup : UInt64
  end

  ITfContext_GUID = "aa80e7fd-2021-11d2-93e0-0060b067b86e"
  IID_ITfContext = LibC::GUID.new(0xaa80e7fd_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
  struct ITfContext
    lpVtbl : ITfContextVTbl*
  end

  struct ITfQueryEmbeddedVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    query_insert_embedded : UInt64
  end

  ITfQueryEmbedded_GUID = "0fab9bdb-d250-4169-84e5-6be118fdd7a8"
  IID_ITfQueryEmbedded = LibC::GUID.new(0xfab9bdb_u32, 0xd250_u16, 0x4169_u16, StaticArray[0x84_u8, 0xe5_u8, 0x6b_u8, 0xe1_u8, 0x18_u8, 0xfd_u8, 0xd7_u8, 0xa8_u8])
  struct ITfQueryEmbedded
    lpVtbl : ITfQueryEmbeddedVTbl*
  end

  struct ITfInsertAtSelectionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    insert_text_at_selection : UInt64
    insert_embedded_at_selection : UInt64
  end

  ITfInsertAtSelection_GUID = "55ce16ba-3014-41c1-9ceb-fade1446ac6c"
  IID_ITfInsertAtSelection = LibC::GUID.new(0x55ce16ba_u32, 0x3014_u16, 0x41c1_u16, StaticArray[0x9c_u8, 0xeb_u8, 0xfa_u8, 0xde_u8, 0x14_u8, 0x46_u8, 0xac_u8, 0x6c_u8])
  struct ITfInsertAtSelection
    lpVtbl : ITfInsertAtSelectionVTbl*
  end

  struct ITfCleanupContextSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_cleanup_context : UInt64
  end

  ITfCleanupContextSink_GUID = "01689689-7acb-4e9b-ab7c-7ea46b12b522"
  IID_ITfCleanupContextSink = LibC::GUID.new(0x1689689_u32, 0x7acb_u16, 0x4e9b_u16, StaticArray[0xab_u8, 0x7c_u8, 0x7e_u8, 0xa4_u8, 0x6b_u8, 0x12_u8, 0xb5_u8, 0x22_u8])
  struct ITfCleanupContextSink
    lpVtbl : ITfCleanupContextSinkVTbl*
  end

  struct ITfCleanupContextDurationSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_start_cleanup_context : UInt64
    on_end_cleanup_context : UInt64
  end

  ITfCleanupContextDurationSink_GUID = "45c35144-154e-4797-bed8-d33ae7bf8794"
  IID_ITfCleanupContextDurationSink = LibC::GUID.new(0x45c35144_u32, 0x154e_u16, 0x4797_u16, StaticArray[0xbe_u8, 0xd8_u8, 0xd3_u8, 0x3a_u8, 0xe7_u8, 0xbf_u8, 0x87_u8, 0x94_u8])
  struct ITfCleanupContextDurationSink
    lpVtbl : ITfCleanupContextDurationSinkVTbl*
  end

  struct ITfReadOnlyPropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type : UInt64
    enum_ranges : UInt64
    get_value : UInt64
    get_context : UInt64
  end

  ITfReadOnlyProperty_GUID = "17d49a3d-f8b8-4b2f-b254-52319dd64c53"
  IID_ITfReadOnlyProperty = LibC::GUID.new(0x17d49a3d_u32, 0xf8b8_u16, 0x4b2f_u16, StaticArray[0xb2_u8, 0x54_u8, 0x52_u8, 0x31_u8, 0x9d_u8, 0xd6_u8, 0x4c_u8, 0x53_u8])
  struct ITfReadOnlyProperty
    lpVtbl : ITfReadOnlyPropertyVTbl*
  end

  struct IEnumTfPropertyValueVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumTfPropertyValue_GUID = "8ed8981b-7c10-4d7d-9fb3-ab72e9c75f72"
  IID_IEnumTfPropertyValue = LibC::GUID.new(0x8ed8981b_u32, 0x7c10_u16, 0x4d7d_u16, StaticArray[0x9f_u8, 0xb3_u8, 0xab_u8, 0x72_u8, 0xe9_u8, 0xc7_u8, 0x5f_u8, 0x72_u8])
  struct IEnumTfPropertyValue
    lpVtbl : IEnumTfPropertyValueVTbl*
  end

  struct ITfMouseTrackerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise_mouse_sink : UInt64
    unadvise_mouse_sink : UInt64
  end

  ITfMouseTracker_GUID = "09d146cd-a544-4132-925b-7afa8ef322d0"
  IID_ITfMouseTracker = LibC::GUID.new(0x9d146cd_u32, 0xa544_u16, 0x4132_u16, StaticArray[0x92_u8, 0x5b_u8, 0x7a_u8, 0xfa_u8, 0x8e_u8, 0xf3_u8, 0x22_u8, 0xd0_u8])
  struct ITfMouseTracker
    lpVtbl : ITfMouseTrackerVTbl*
  end

  struct ITfMouseTrackerACPVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise_mouse_sink : UInt64
    unadvise_mouse_sink : UInt64
  end

  ITfMouseTrackerACP_GUID = "3bdd78e2-c16e-47fd-b883-ce6facc1a208"
  IID_ITfMouseTrackerACP = LibC::GUID.new(0x3bdd78e2_u32, 0xc16e_u16, 0x47fd_u16, StaticArray[0xb8_u8, 0x83_u8, 0xce_u8, 0x6f_u8, 0xac_u8, 0xc1_u8, 0xa2_u8, 0x8_u8])
  struct ITfMouseTrackerACP
    lpVtbl : ITfMouseTrackerACPVTbl*
  end

  struct ITfMouseSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_mouse_event : UInt64
  end

  ITfMouseSink_GUID = "a1adaaa2-3a24-449d-ac96-5183e7f5c217"
  IID_ITfMouseSink = LibC::GUID.new(0xa1adaaa2_u32, 0x3a24_u16, 0x449d_u16, StaticArray[0xac_u8, 0x96_u8, 0x51_u8, 0x83_u8, 0xe7_u8, 0xf5_u8, 0xc2_u8, 0x17_u8])
  struct ITfMouseSink
    lpVtbl : ITfMouseSinkVTbl*
  end

  struct ITfEditRecordVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_selection_status : UInt64
    get_text_and_property_updates : UInt64
  end

  ITfEditRecord_GUID = "42d4d099-7c1a-4a89-b836-6c6f22160df0"
  IID_ITfEditRecord = LibC::GUID.new(0x42d4d099_u32, 0x7c1a_u16, 0x4a89_u16, StaticArray[0xb8_u8, 0x36_u8, 0x6c_u8, 0x6f_u8, 0x22_u8, 0x16_u8, 0xd_u8, 0xf0_u8])
  struct ITfEditRecord
    lpVtbl : ITfEditRecordVTbl*
  end

  struct ITfTextEditSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_end_edit : UInt64
  end

  ITfTextEditSink_GUID = "8127d409-ccd3-4683-967a-b43d5b482bf7"
  IID_ITfTextEditSink = LibC::GUID.new(0x8127d409_u32, 0xccd3_u16, 0x4683_u16, StaticArray[0x96_u8, 0x7a_u8, 0xb4_u8, 0x3d_u8, 0x5b_u8, 0x48_u8, 0x2b_u8, 0xf7_u8])
  struct ITfTextEditSink
    lpVtbl : ITfTextEditSinkVTbl*
  end

  struct ITfTextLayoutSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_layout_change : UInt64
  end

  ITfTextLayoutSink_GUID = "2af2d06a-dd5b-4927-a0b4-54f19c91fade"
  IID_ITfTextLayoutSink = LibC::GUID.new(0x2af2d06a_u32, 0xdd5b_u16, 0x4927_u16, StaticArray[0xa0_u8, 0xb4_u8, 0x54_u8, 0xf1_u8, 0x9c_u8, 0x91_u8, 0xfa_u8, 0xde_u8])
  struct ITfTextLayoutSink
    lpVtbl : ITfTextLayoutSinkVTbl*
  end

  struct ITfStatusSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_status_change : UInt64
  end

  ITfStatusSink_GUID = "6b7d8d73-b267-4f69-b32e-1ca321ce4f45"
  IID_ITfStatusSink = LibC::GUID.new(0x6b7d8d73_u32, 0xb267_u16, 0x4f69_u16, StaticArray[0xb3_u8, 0x2e_u8, 0x1c_u8, 0xa3_u8, 0x21_u8, 0xce_u8, 0x4f_u8, 0x45_u8])
  struct ITfStatusSink
    lpVtbl : ITfStatusSinkVTbl*
  end

  struct ITfEditTransactionSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_start_edit_transaction : UInt64
    on_end_edit_transaction : UInt64
  end

  ITfEditTransactionSink_GUID = "708fbf70-b520-416b-b06c-2c41ab44f8ba"
  IID_ITfEditTransactionSink = LibC::GUID.new(0x708fbf70_u32, 0xb520_u16, 0x416b_u16, StaticArray[0xb0_u8, 0x6c_u8, 0x2c_u8, 0x41_u8, 0xab_u8, 0x44_u8, 0xf8_u8, 0xba_u8])
  struct ITfEditTransactionSink
    lpVtbl : ITfEditTransactionSinkVTbl*
  end

  struct ITfContextOwnerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_acp_from_point : UInt64
    get_text_ext : UInt64
    get_screen_ext : UInt64
    get_status : UInt64
    get_wnd : UInt64
    get_attribute : UInt64
  end

  ITfContextOwner_GUID = "aa80e80c-2021-11d2-93e0-0060b067b86e"
  IID_ITfContextOwner = LibC::GUID.new(0xaa80e80c_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
  struct ITfContextOwner
    lpVtbl : ITfContextOwnerVTbl*
  end

  struct ITfContextOwnerServicesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_layout_change : UInt64
    on_status_change : UInt64
    on_attribute_change : UInt64
    serialize : UInt64
    unserialize : UInt64
    force_load_property : UInt64
    create_range : UInt64
  end

  ITfContextOwnerServices_GUID = "b23eb630-3e1c-11d3-a745-0050040ab407"
  IID_ITfContextOwnerServices = LibC::GUID.new(0xb23eb630_u32, 0x3e1c_u16, 0x11d3_u16, StaticArray[0xa7_u8, 0x45_u8, 0x0_u8, 0x50_u8, 0x4_u8, 0xa_u8, 0xb4_u8, 0x7_u8])
  struct ITfContextOwnerServices
    lpVtbl : ITfContextOwnerServicesVTbl*
  end

  struct ITfContextKeyEventSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_key_down : UInt64
    on_key_up : UInt64
    on_test_key_down : UInt64
    on_test_key_up : UInt64
  end

  ITfContextKeyEventSink_GUID = "0552ba5d-c835-4934-bf50-846aaa67432f"
  IID_ITfContextKeyEventSink = LibC::GUID.new(0x552ba5d_u32, 0xc835_u16, 0x4934_u16, StaticArray[0xbf_u8, 0x50_u8, 0x84_u8, 0x6a_u8, 0xaa_u8, 0x67_u8, 0x43_u8, 0x2f_u8])
  struct ITfContextKeyEventSink
    lpVtbl : ITfContextKeyEventSinkVTbl*
  end

  struct ITfEditSessionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    do_edit_session : UInt64
  end

  ITfEditSession_GUID = "aa80e803-2021-11d2-93e0-0060b067b86e"
  IID_ITfEditSession = LibC::GUID.new(0xaa80e803_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
  struct ITfEditSession
    lpVtbl : ITfEditSessionVTbl*
  end

  struct ITfRangeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_text : UInt64
    set_text : UInt64
    get_formatted_text : UInt64
    get_embedded : UInt64
    insert_embedded : UInt64
    shift_start : UInt64
    shift_end : UInt64
    shift_start_to_range : UInt64
    shift_end_to_range : UInt64
    shift_start_region : UInt64
    shift_end_region : UInt64
    is_empty : UInt64
    collapse : UInt64
    is_equal_start : UInt64
    is_equal_end : UInt64
    compare_start : UInt64
    compare_end : UInt64
    adjust_for_insert : UInt64
    get_gravity : UInt64
    set_gravity : UInt64
    clone : UInt64
    get_context : UInt64
  end

  ITfRange_GUID = "aa80e7ff-2021-11d2-93e0-0060b067b86e"
  IID_ITfRange = LibC::GUID.new(0xaa80e7ff_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
  struct ITfRange
    lpVtbl : ITfRangeVTbl*
  end

  struct ITfRangeACPVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_text : UInt64
    set_text : UInt64
    get_formatted_text : UInt64
    get_embedded : UInt64
    insert_embedded : UInt64
    shift_start : UInt64
    shift_end : UInt64
    shift_start_to_range : UInt64
    shift_end_to_range : UInt64
    shift_start_region : UInt64
    shift_end_region : UInt64
    is_empty : UInt64
    collapse : UInt64
    is_equal_start : UInt64
    is_equal_end : UInt64
    compare_start : UInt64
    compare_end : UInt64
    adjust_for_insert : UInt64
    get_gravity : UInt64
    set_gravity : UInt64
    clone : UInt64
    get_context : UInt64
    get_extent : UInt64
    set_extent : UInt64
  end

  ITfRangeACP_GUID = "057a6296-029b-4154-b79a-0d461d4ea94c"
  IID_ITfRangeACP = LibC::GUID.new(0x57a6296_u32, 0x29b_u16, 0x4154_u16, StaticArray[0xb7_u8, 0x9a_u8, 0xd_u8, 0x46_u8, 0x1d_u8, 0x4e_u8, 0xa9_u8, 0x4c_u8])
  struct ITfRangeACP
    lpVtbl : ITfRangeACPVTbl*
  end

  struct ITextStoreACPServicesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    serialize : UInt64
    unserialize : UInt64
    force_load_property : UInt64
    create_range : UInt64
  end

  ITextStoreACPServices_GUID = "aa80e901-2021-11d2-93e0-0060b067b86e"
  IID_ITextStoreACPServices = LibC::GUID.new(0xaa80e901_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
  struct ITextStoreACPServices
    lpVtbl : ITextStoreACPServicesVTbl*
  end

  struct ITfRangeBackupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    restore : UInt64
  end

  ITfRangeBackup_GUID = "463a506d-6992-49d2-9b88-93d55e70bb16"
  IID_ITfRangeBackup = LibC::GUID.new(0x463a506d_u32, 0x6992_u16, 0x49d2_u16, StaticArray[0x9b_u8, 0x88_u8, 0x93_u8, 0xd5_u8, 0x5e_u8, 0x70_u8, 0xbb_u8, 0x16_u8])
  struct ITfRangeBackup
    lpVtbl : ITfRangeBackupVTbl*
  end

  struct ITfPropertyStoreVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type : UInt64
    get_data_type : UInt64
    get_data : UInt64
    on_text_updated : UInt64
    shrink : UInt64
    divide : UInt64
    clone : UInt64
    get_property_range_creator : UInt64
    serialize : UInt64
  end

  ITfPropertyStore_GUID = "6834b120-88cb-11d2-bf45-00105a2799b5"
  IID_ITfPropertyStore = LibC::GUID.new(0x6834b120_u32, 0x88cb_u16, 0x11d2_u16, StaticArray[0xbf_u8, 0x45_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct ITfPropertyStore
    lpVtbl : ITfPropertyStoreVTbl*
  end

  struct IEnumTfRangesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumTfRanges_GUID = "f99d3f40-8e32-11d2-bf46-00105a2799b5"
  IID_IEnumTfRanges = LibC::GUID.new(0xf99d3f40_u32, 0x8e32_u16, 0x11d2_u16, StaticArray[0xbf_u8, 0x46_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct IEnumTfRanges
    lpVtbl : IEnumTfRangesVTbl*
  end

  struct ITfCreatePropertyStoreVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    is_store_serializable : UInt64
    create_property_store : UInt64
  end

  ITfCreatePropertyStore_GUID = "2463fbf0-b0af-11d2-afc5-00105a2799b5"
  IID_ITfCreatePropertyStore = LibC::GUID.new(0x2463fbf0_u32, 0xb0af_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xc5_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct ITfCreatePropertyStore
    lpVtbl : ITfCreatePropertyStoreVTbl*
  end

  struct ITfPersistentPropertyLoaderACPVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    load_property : UInt64
  end

  ITfPersistentPropertyLoaderACP_GUID = "4ef89150-0807-11d3-8df0-00105a2799b5"
  IID_ITfPersistentPropertyLoaderACP = LibC::GUID.new(0x4ef89150_u32, 0x807_u16, 0x11d3_u16, StaticArray[0x8d_u8, 0xf0_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct ITfPersistentPropertyLoaderACP
    lpVtbl : ITfPersistentPropertyLoaderACPVTbl*
  end

  struct ITfPropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type : UInt64
    enum_ranges : UInt64
    get_value : UInt64
    get_context : UInt64
    find_range : UInt64
    set_value_store : UInt64
    set_value : UInt64
    clear : UInt64
  end

  ITfProperty_GUID = "e2449660-9542-11d2-bf46-00105a2799b5"
  IID_ITfProperty = LibC::GUID.new(0xe2449660_u32, 0x9542_u16, 0x11d2_u16, StaticArray[0xbf_u8, 0x46_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct ITfProperty
    lpVtbl : ITfPropertyVTbl*
  end

  struct IEnumTfPropertiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumTfProperties_GUID = "19188cb0-aca9-11d2-afc5-00105a2799b5"
  IID_IEnumTfProperties = LibC::GUID.new(0x19188cb0_u32, 0xaca9_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xc5_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct IEnumTfProperties
    lpVtbl : IEnumTfPropertiesVTbl*
  end

  struct ITfCompartmentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_value : UInt64
    get_value : UInt64
  end

  ITfCompartment_GUID = "bb08f7a9-607a-4384-8623-056892b64371"
  IID_ITfCompartment = LibC::GUID.new(0xbb08f7a9_u32, 0x607a_u16, 0x4384_u16, StaticArray[0x86_u8, 0x23_u8, 0x5_u8, 0x68_u8, 0x92_u8, 0xb6_u8, 0x43_u8, 0x71_u8])
  struct ITfCompartment
    lpVtbl : ITfCompartmentVTbl*
  end

  struct ITfCompartmentEventSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_change : UInt64
  end

  ITfCompartmentEventSink_GUID = "743abd5f-f26d-48df-8cc5-238492419b64"
  IID_ITfCompartmentEventSink = LibC::GUID.new(0x743abd5f_u32, 0xf26d_u16, 0x48df_u16, StaticArray[0x8c_u8, 0xc5_u8, 0x23_u8, 0x84_u8, 0x92_u8, 0x41_u8, 0x9b_u8, 0x64_u8])
  struct ITfCompartmentEventSink
    lpVtbl : ITfCompartmentEventSinkVTbl*
  end

  struct ITfCompartmentMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_compartment : UInt64
    clear_compartment : UInt64
    enum_compartments : UInt64
  end

  ITfCompartmentMgr_GUID = "7dcf57ac-18ad-438b-824d-979bffb74b7c"
  IID_ITfCompartmentMgr = LibC::GUID.new(0x7dcf57ac_u32, 0x18ad_u16, 0x438b_u16, StaticArray[0x82_u8, 0x4d_u8, 0x97_u8, 0x9b_u8, 0xff_u8, 0xb7_u8, 0x4b_u8, 0x7c_u8])
  struct ITfCompartmentMgr
    lpVtbl : ITfCompartmentMgrVTbl*
  end

  struct ITfFunctionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
  end

  ITfFunction_GUID = "db593490-098f-11d3-8df0-00105a2799b5"
  IID_ITfFunction = LibC::GUID.new(0xdb593490_u32, 0x98f_u16, 0x11d3_u16, StaticArray[0x8d_u8, 0xf0_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct ITfFunction
    lpVtbl : ITfFunctionVTbl*
  end

  struct ITfFunctionProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type : UInt64
    get_description : UInt64
    get_function : UInt64
  end

  ITfFunctionProvider_GUID = "101d6610-0990-11d3-8df0-00105a2799b5"
  IID_ITfFunctionProvider = LibC::GUID.new(0x101d6610_u32, 0x990_u16, 0x11d3_u16, StaticArray[0x8d_u8, 0xf0_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct ITfFunctionProvider
    lpVtbl : ITfFunctionProviderVTbl*
  end

  struct IEnumTfFunctionProvidersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumTfFunctionProviders_GUID = "e4b24db0-0990-11d3-8df0-00105a2799b5"
  IID_IEnumTfFunctionProviders = LibC::GUID.new(0xe4b24db0_u32, 0x990_u16, 0x11d3_u16, StaticArray[0x8d_u8, 0xf0_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct IEnumTfFunctionProviders
    lpVtbl : IEnumTfFunctionProvidersVTbl*
  end

  struct ITfInputProcessorProfilesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register : UInt64
    unregister : UInt64
    add_language_profile : UInt64
    remove_language_profile : UInt64
    enum_input_processor_info : UInt64
    get_default_language_profile : UInt64
    set_default_language_profile : UInt64
    activate_language_profile : UInt64
    get_active_language_profile : UInt64
    get_language_profile_description : UInt64
    get_current_language : UInt64
    change_current_language : UInt64
    get_language_list : UInt64
    enum_language_profiles : UInt64
    enable_language_profile : UInt64
    is_enabled_language_profile : UInt64
    enable_language_profile_by_default : UInt64
    substitute_keyboard_layout : UInt64
  end

  ITfInputProcessorProfiles_GUID = "1f02b6c5-7842-4ee6-8a0b-9a24183a95ca"
  IID_ITfInputProcessorProfiles = LibC::GUID.new(0x1f02b6c5_u32, 0x7842_u16, 0x4ee6_u16, StaticArray[0x8a_u8, 0xb_u8, 0x9a_u8, 0x24_u8, 0x18_u8, 0x3a_u8, 0x95_u8, 0xca_u8])
  struct ITfInputProcessorProfiles
    lpVtbl : ITfInputProcessorProfilesVTbl*
  end

  struct ITfInputProcessorProfilesExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register : UInt64
    unregister : UInt64
    add_language_profile : UInt64
    remove_language_profile : UInt64
    enum_input_processor_info : UInt64
    get_default_language_profile : UInt64
    set_default_language_profile : UInt64
    activate_language_profile : UInt64
    get_active_language_profile : UInt64
    get_language_profile_description : UInt64
    get_current_language : UInt64
    change_current_language : UInt64
    get_language_list : UInt64
    enum_language_profiles : UInt64
    enable_language_profile : UInt64
    is_enabled_language_profile : UInt64
    enable_language_profile_by_default : UInt64
    substitute_keyboard_layout : UInt64
    set_language_profile_display_name : UInt64
  end

  ITfInputProcessorProfilesEx_GUID = "892f230f-fe00-4a41-a98e-fcd6de0d35ef"
  IID_ITfInputProcessorProfilesEx = LibC::GUID.new(0x892f230f_u32, 0xfe00_u16, 0x4a41_u16, StaticArray[0xa9_u8, 0x8e_u8, 0xfc_u8, 0xd6_u8, 0xde_u8, 0xd_u8, 0x35_u8, 0xef_u8])
  struct ITfInputProcessorProfilesEx
    lpVtbl : ITfInputProcessorProfilesExVTbl*
  end

  struct ITfInputProcessorProfileSubstituteLayoutVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_substitute_keyboard_layout : UInt64
  end

  ITfInputProcessorProfileSubstituteLayout_GUID = "4fd67194-1002-4513-bff2-c0ddf6258552"
  IID_ITfInputProcessorProfileSubstituteLayout = LibC::GUID.new(0x4fd67194_u32, 0x1002_u16, 0x4513_u16, StaticArray[0xbf_u8, 0xf2_u8, 0xc0_u8, 0xdd_u8, 0xf6_u8, 0x25_u8, 0x85_u8, 0x52_u8])
  struct ITfInputProcessorProfileSubstituteLayout
    lpVtbl : ITfInputProcessorProfileSubstituteLayoutVTbl*
  end

  struct ITfActiveLanguageProfileNotifySinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_activated : UInt64
  end

  ITfActiveLanguageProfileNotifySink_GUID = "b246cb75-a93e-4652-bf8c-b3fe0cfd7e57"
  IID_ITfActiveLanguageProfileNotifySink = LibC::GUID.new(0xb246cb75_u32, 0xa93e_u16, 0x4652_u16, StaticArray[0xbf_u8, 0x8c_u8, 0xb3_u8, 0xfe_u8, 0xc_u8, 0xfd_u8, 0x7e_u8, 0x57_u8])
  struct ITfActiveLanguageProfileNotifySink
    lpVtbl : ITfActiveLanguageProfileNotifySinkVTbl*
  end

  struct IEnumTfLanguageProfilesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumTfLanguageProfiles_GUID = "3d61bf11-ac5f-42c8-a4cb-931bcc28c744"
  IID_IEnumTfLanguageProfiles = LibC::GUID.new(0x3d61bf11_u32, 0xac5f_u16, 0x42c8_u16, StaticArray[0xa4_u8, 0xcb_u8, 0x93_u8, 0x1b_u8, 0xcc_u8, 0x28_u8, 0xc7_u8, 0x44_u8])
  struct IEnumTfLanguageProfiles
    lpVtbl : IEnumTfLanguageProfilesVTbl*
  end

  struct ITfLanguageProfileNotifySinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_language_change : UInt64
    on_language_changed : UInt64
  end

  ITfLanguageProfileNotifySink_GUID = "43c9fe15-f494-4c17-9de2-b8a4ac350aa8"
  IID_ITfLanguageProfileNotifySink = LibC::GUID.new(0x43c9fe15_u32, 0xf494_u16, 0x4c17_u16, StaticArray[0x9d_u8, 0xe2_u8, 0xb8_u8, 0xa4_u8, 0xac_u8, 0x35_u8, 0xa_u8, 0xa8_u8])
  struct ITfLanguageProfileNotifySink
    lpVtbl : ITfLanguageProfileNotifySinkVTbl*
  end

  struct ITfInputProcessorProfileMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    activate_profile : UInt64
    deactivate_profile : UInt64
    get_profile : UInt64
    enum_profiles : UInt64
    release_input_processor : UInt64
    register_profile : UInt64
    unregister_profile : UInt64
    get_active_profile : UInt64
  end

  ITfInputProcessorProfileMgr_GUID = "71c6e74c-0f28-11d8-a82a-00065b84435c"
  IID_ITfInputProcessorProfileMgr = LibC::GUID.new(0x71c6e74c_u32, 0xf28_u16, 0x11d8_u16, StaticArray[0xa8_u8, 0x2a_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
  struct ITfInputProcessorProfileMgr
    lpVtbl : ITfInputProcessorProfileMgrVTbl*
  end

  struct IEnumTfInputProcessorProfilesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumTfInputProcessorProfiles_GUID = "71c6e74d-0f28-11d8-a82a-00065b84435c"
  IID_IEnumTfInputProcessorProfiles = LibC::GUID.new(0x71c6e74d_u32, 0xf28_u16, 0x11d8_u16, StaticArray[0xa8_u8, 0x2a_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
  struct IEnumTfInputProcessorProfiles
    lpVtbl : IEnumTfInputProcessorProfilesVTbl*
  end

  struct ITfInputProcessorProfileActivationSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_activated : UInt64
  end

  ITfInputProcessorProfileActivationSink_GUID = "71c6e74e-0f28-11d8-a82a-00065b84435c"
  IID_ITfInputProcessorProfileActivationSink = LibC::GUID.new(0x71c6e74e_u32, 0xf28_u16, 0x11d8_u16, StaticArray[0xa8_u8, 0x2a_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
  struct ITfInputProcessorProfileActivationSink
    lpVtbl : ITfInputProcessorProfileActivationSinkVTbl*
  end

  struct ITfKeystrokeMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise_key_event_sink : UInt64
    unadvise_key_event_sink : UInt64
    get_foreground : UInt64
    test_key_down : UInt64
    test_key_up : UInt64
    key_down : UInt64
    key_up : UInt64
    get_preserved_key : UInt64
    is_preserved_key : UInt64
    preserve_key : UInt64
    unpreserve_key : UInt64
    set_preserved_key_description : UInt64
    get_preserved_key_description : UInt64
    simulate_preserved_key : UInt64
  end

  ITfKeystrokeMgr_GUID = "aa80e7f0-2021-11d2-93e0-0060b067b86e"
  IID_ITfKeystrokeMgr = LibC::GUID.new(0xaa80e7f0_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
  struct ITfKeystrokeMgr
    lpVtbl : ITfKeystrokeMgrVTbl*
  end

  struct ITfKeyEventSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_set_focus : UInt64
    on_test_key_down : UInt64
    on_test_key_up : UInt64
    on_key_down : UInt64
    on_key_up : UInt64
    on_preserved_key : UInt64
  end

  ITfKeyEventSink_GUID = "aa80e7f5-2021-11d2-93e0-0060b067b86e"
  IID_ITfKeyEventSink = LibC::GUID.new(0xaa80e7f5_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
  struct ITfKeyEventSink
    lpVtbl : ITfKeyEventSinkVTbl*
  end

  struct ITfKeyTraceEventSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_key_trace_down : UInt64
    on_key_trace_up : UInt64
  end

  ITfKeyTraceEventSink_GUID = "1cd4c13b-1c36-4191-a70a-7f3e611f367d"
  IID_ITfKeyTraceEventSink = LibC::GUID.new(0x1cd4c13b_u32, 0x1c36_u16, 0x4191_u16, StaticArray[0xa7_u8, 0xa_u8, 0x7f_u8, 0x3e_u8, 0x61_u8, 0x1f_u8, 0x36_u8, 0x7d_u8])
  struct ITfKeyTraceEventSink
    lpVtbl : ITfKeyTraceEventSinkVTbl*
  end

  struct ITfPreservedKeyNotifySinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_updated : UInt64
  end

  ITfPreservedKeyNotifySink_GUID = "6f77c993-d2b1-446e-853e-5912efc8a286"
  IID_ITfPreservedKeyNotifySink = LibC::GUID.new(0x6f77c993_u32, 0xd2b1_u16, 0x446e_u16, StaticArray[0x85_u8, 0x3e_u8, 0x59_u8, 0x12_u8, 0xef_u8, 0xc8_u8, 0xa2_u8, 0x86_u8])
  struct ITfPreservedKeyNotifySink
    lpVtbl : ITfPreservedKeyNotifySinkVTbl*
  end

  struct ITfMessagePumpVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    peek_message_a : UInt64
    get_message_a : UInt64
    peek_message_w : UInt64
    get_message_w : UInt64
  end

  ITfMessagePump_GUID = "8f1b8ad8-0b6b-4874-90c5-bd76011e8f7c"
  IID_ITfMessagePump = LibC::GUID.new(0x8f1b8ad8_u32, 0xb6b_u16, 0x4874_u16, StaticArray[0x90_u8, 0xc5_u8, 0xbd_u8, 0x76_u8, 0x1_u8, 0x1e_u8, 0x8f_u8, 0x7c_u8])
  struct ITfMessagePump
    lpVtbl : ITfMessagePumpVTbl*
  end

  struct ITfThreadFocusSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_set_thread_focus : UInt64
    on_kill_thread_focus : UInt64
  end

  ITfThreadFocusSink_GUID = "c0f1db0c-3a20-405c-a303-96b6010a885f"
  IID_ITfThreadFocusSink = LibC::GUID.new(0xc0f1db0c_u32, 0x3a20_u16, 0x405c_u16, StaticArray[0xa3_u8, 0x3_u8, 0x96_u8, 0xb6_u8, 0x1_u8, 0xa_u8, 0x88_u8, 0x5f_u8])
  struct ITfThreadFocusSink
    lpVtbl : ITfThreadFocusSinkVTbl*
  end

  struct ITfTextInputProcessorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    activate : UInt64
    deactivate : UInt64
  end

  ITfTextInputProcessor_GUID = "aa80e7f7-2021-11d2-93e0-0060b067b86e"
  IID_ITfTextInputProcessor = LibC::GUID.new(0xaa80e7f7_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
  struct ITfTextInputProcessor
    lpVtbl : ITfTextInputProcessorVTbl*
  end

  struct ITfTextInputProcessorExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    activate : UInt64
    deactivate : UInt64
    activate_ex : UInt64
  end

  ITfTextInputProcessorEx_GUID = "6e4e2102-f9cd-433d-b496-303ce03a6507"
  IID_ITfTextInputProcessorEx = LibC::GUID.new(0x6e4e2102_u32, 0xf9cd_u16, 0x433d_u16, StaticArray[0xb4_u8, 0x96_u8, 0x30_u8, 0x3c_u8, 0xe0_u8, 0x3a_u8, 0x65_u8, 0x7_u8])
  struct ITfTextInputProcessorEx
    lpVtbl : ITfTextInputProcessorExVTbl*
  end

  struct ITfClientIdVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_client_id : UInt64
  end

  ITfClientId_GUID = "d60a7b49-1b9f-4be2-b702-47e9dc05dec3"
  IID_ITfClientId = LibC::GUID.new(0xd60a7b49_u32, 0x1b9f_u16, 0x4be2_u16, StaticArray[0xb7_u8, 0x2_u8, 0x47_u8, 0xe9_u8, 0xdc_u8, 0x5_u8, 0xde_u8, 0xc3_u8])
  struct ITfClientId
    lpVtbl : ITfClientIdVTbl*
  end

  struct ITfDisplayAttributeInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_guid : UInt64
    get_description : UInt64
    get_attribute_info : UInt64
    set_attribute_info : UInt64
    reset : UInt64
  end

  ITfDisplayAttributeInfo_GUID = "70528852-2f26-4aea-8c96-215150578932"
  IID_ITfDisplayAttributeInfo = LibC::GUID.new(0x70528852_u32, 0x2f26_u16, 0x4aea_u16, StaticArray[0x8c_u8, 0x96_u8, 0x21_u8, 0x51_u8, 0x50_u8, 0x57_u8, 0x89_u8, 0x32_u8])
  struct ITfDisplayAttributeInfo
    lpVtbl : ITfDisplayAttributeInfoVTbl*
  end

  struct IEnumTfDisplayAttributeInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumTfDisplayAttributeInfo_GUID = "7cef04d7-cb75-4e80-a7ab-5f5bc7d332de"
  IID_IEnumTfDisplayAttributeInfo = LibC::GUID.new(0x7cef04d7_u32, 0xcb75_u16, 0x4e80_u16, StaticArray[0xa7_u8, 0xab_u8, 0x5f_u8, 0x5b_u8, 0xc7_u8, 0xd3_u8, 0x32_u8, 0xde_u8])
  struct IEnumTfDisplayAttributeInfo
    lpVtbl : IEnumTfDisplayAttributeInfoVTbl*
  end

  struct ITfDisplayAttributeProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enum_display_attribute_info : UInt64
    get_display_attribute_info : UInt64
  end

  ITfDisplayAttributeProvider_GUID = "fee47777-163c-4769-996a-6e9c50ad8f54"
  IID_ITfDisplayAttributeProvider = LibC::GUID.new(0xfee47777_u32, 0x163c_u16, 0x4769_u16, StaticArray[0x99_u8, 0x6a_u8, 0x6e_u8, 0x9c_u8, 0x50_u8, 0xad_u8, 0x8f_u8, 0x54_u8])
  struct ITfDisplayAttributeProvider
    lpVtbl : ITfDisplayAttributeProviderVTbl*
  end

  struct ITfDisplayAttributeMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_update_info : UInt64
    enum_display_attribute_info : UInt64
    get_display_attribute_info : UInt64
  end

  ITfDisplayAttributeMgr_GUID = "8ded7393-5db1-475c-9e71-a39111b0ff67"
  IID_ITfDisplayAttributeMgr = LibC::GUID.new(0x8ded7393_u32, 0x5db1_u16, 0x475c_u16, StaticArray[0x9e_u8, 0x71_u8, 0xa3_u8, 0x91_u8, 0x11_u8, 0xb0_u8, 0xff_u8, 0x67_u8])
  struct ITfDisplayAttributeMgr
    lpVtbl : ITfDisplayAttributeMgrVTbl*
  end

  struct ITfDisplayAttributeNotifySinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_update_info : UInt64
  end

  ITfDisplayAttributeNotifySink_GUID = "ad56f402-e162-4f25-908f-7d577cf9bda9"
  IID_ITfDisplayAttributeNotifySink = LibC::GUID.new(0xad56f402_u32, 0xe162_u16, 0x4f25_u16, StaticArray[0x90_u8, 0x8f_u8, 0x7d_u8, 0x57_u8, 0x7c_u8, 0xf9_u8, 0xbd_u8, 0xa9_u8])
  struct ITfDisplayAttributeNotifySink
    lpVtbl : ITfDisplayAttributeNotifySinkVTbl*
  end

  struct ITfCategoryMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_category : UInt64
    unregister_category : UInt64
    enum_categories_in_item : UInt64
    enum_items_in_category : UInt64
    find_closest_category : UInt64
    register_guid_description : UInt64
    unregister_guid_description : UInt64
    get_guid_description : UInt64
    register_guiddword : UInt64
    unregister_guiddword : UInt64
    get_guiddword : UInt64
    register_guid : UInt64
    get_guid : UInt64
    is_equal_tf_guid_atom : UInt64
  end

  ITfCategoryMgr_GUID = "c3acefb5-f69d-4905-938f-fcadcf4be830"
  IID_ITfCategoryMgr = LibC::GUID.new(0xc3acefb5_u32, 0xf69d_u16, 0x4905_u16, StaticArray[0x93_u8, 0x8f_u8, 0xfc_u8, 0xad_u8, 0xcf_u8, 0x4b_u8, 0xe8_u8, 0x30_u8])
  struct ITfCategoryMgr
    lpVtbl : ITfCategoryMgrVTbl*
  end

  struct ITfSourceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise_sink : UInt64
    unadvise_sink : UInt64
  end

  ITfSource_GUID = "4ea48a35-60ae-446f-8fd6-e6a8d82459f7"
  IID_ITfSource = LibC::GUID.new(0x4ea48a35_u32, 0x60ae_u16, 0x446f_u16, StaticArray[0x8f_u8, 0xd6_u8, 0xe6_u8, 0xa8_u8, 0xd8_u8, 0x24_u8, 0x59_u8, 0xf7_u8])
  struct ITfSource
    lpVtbl : ITfSourceVTbl*
  end

  struct ITfSourceSingleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise_single_sink : UInt64
    unadvise_single_sink : UInt64
  end

  ITfSourceSingle_GUID = "73131f9c-56a9-49dd-b0ee-d046633f7528"
  IID_ITfSourceSingle = LibC::GUID.new(0x73131f9c_u32, 0x56a9_u16, 0x49dd_u16, StaticArray[0xb0_u8, 0xee_u8, 0xd0_u8, 0x46_u8, 0x63_u8, 0x3f_u8, 0x75_u8, 0x28_u8])
  struct ITfSourceSingle
    lpVtbl : ITfSourceSingleVTbl*
  end

  struct ITfUIElementMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_ui_element : UInt64
    update_ui_element : UInt64
    end_ui_element : UInt64
    get_ui_element : UInt64
    enum_ui_elements : UInt64
  end

  ITfUIElementMgr_GUID = "ea1ea135-19df-11d7-a6d2-00065b84435c"
  IID_ITfUIElementMgr = LibC::GUID.new(0xea1ea135_u32, 0x19df_u16, 0x11d7_u16, StaticArray[0xa6_u8, 0xd2_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
  struct ITfUIElementMgr
    lpVtbl : ITfUIElementMgrVTbl*
  end

  struct IEnumTfUIElementsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumTfUIElements_GUID = "887aa91e-acba-4931-84da-3c5208cf543f"
  IID_IEnumTfUIElements = LibC::GUID.new(0x887aa91e_u32, 0xacba_u16, 0x4931_u16, StaticArray[0x84_u8, 0xda_u8, 0x3c_u8, 0x52_u8, 0x8_u8, 0xcf_u8, 0x54_u8, 0x3f_u8])
  struct IEnumTfUIElements
    lpVtbl : IEnumTfUIElementsVTbl*
  end

  struct ITfUIElementSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    begin_ui_element : UInt64
    update_ui_element : UInt64
    end_ui_element : UInt64
  end

  ITfUIElementSink_GUID = "ea1ea136-19df-11d7-a6d2-00065b84435c"
  IID_ITfUIElementSink = LibC::GUID.new(0xea1ea136_u32, 0x19df_u16, 0x11d7_u16, StaticArray[0xa6_u8, 0xd2_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
  struct ITfUIElementSink
    lpVtbl : ITfUIElementSinkVTbl*
  end

  struct ITfUIElementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_description : UInt64
    get_guid : UInt64
    show : UInt64
    is_shown : UInt64
  end

  ITfUIElement_GUID = "ea1ea137-19df-11d7-a6d2-00065b84435c"
  IID_ITfUIElement = LibC::GUID.new(0xea1ea137_u32, 0x19df_u16, 0x11d7_u16, StaticArray[0xa6_u8, 0xd2_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
  struct ITfUIElement
    lpVtbl : ITfUIElementVTbl*
  end

  struct ITfCandidateListUIElementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_description : UInt64
    get_guid : UInt64
    show : UInt64
    is_shown : UInt64
    get_updated_flags : UInt64
    get_document_mgr : UInt64
    get_count : UInt64
    get_selection : UInt64
    get_string : UInt64
    get_page_index : UInt64
    set_page_index : UInt64
    get_current_page : UInt64
  end

  ITfCandidateListUIElement_GUID = "ea1ea138-19df-11d7-a6d2-00065b84435c"
  IID_ITfCandidateListUIElement = LibC::GUID.new(0xea1ea138_u32, 0x19df_u16, 0x11d7_u16, StaticArray[0xa6_u8, 0xd2_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
  struct ITfCandidateListUIElement
    lpVtbl : ITfCandidateListUIElementVTbl*
  end

  struct ITfCandidateListUIElementBehaviorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_description : UInt64
    get_guid : UInt64
    show : UInt64
    is_shown : UInt64
    get_updated_flags : UInt64
    get_document_mgr : UInt64
    get_count : UInt64
    get_selection : UInt64
    get_string : UInt64
    get_page_index : UInt64
    set_page_index : UInt64
    get_current_page : UInt64
    set_selection : UInt64
    finalize : UInt64
    abort : UInt64
  end

  ITfCandidateListUIElementBehavior_GUID = "85fad185-58ce-497a-9460-355366b64b9a"
  IID_ITfCandidateListUIElementBehavior = LibC::GUID.new(0x85fad185_u32, 0x58ce_u16, 0x497a_u16, StaticArray[0x94_u8, 0x60_u8, 0x35_u8, 0x53_u8, 0x66_u8, 0xb6_u8, 0x4b_u8, 0x9a_u8])
  struct ITfCandidateListUIElementBehavior
    lpVtbl : ITfCandidateListUIElementBehaviorVTbl*
  end

  struct ITfReadingInformationUIElementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_description : UInt64
    get_guid : UInt64
    show : UInt64
    is_shown : UInt64
    get_updated_flags : UInt64
    get_context : UInt64
    get_string : UInt64
    get_max_reading_string_length : UInt64
    get_error_index : UInt64
    is_vertical_order_preferred : UInt64
  end

  ITfReadingInformationUIElement_GUID = "ea1ea139-19df-11d7-a6d2-00065b84435c"
  IID_ITfReadingInformationUIElement = LibC::GUID.new(0xea1ea139_u32, 0x19df_u16, 0x11d7_u16, StaticArray[0xa6_u8, 0xd2_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
  struct ITfReadingInformationUIElement
    lpVtbl : ITfReadingInformationUIElementVTbl*
  end

  struct ITfTransitoryExtensionUIElementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_description : UInt64
    get_guid : UInt64
    show : UInt64
    is_shown : UInt64
    get_document_mgr : UInt64
  end

  ITfTransitoryExtensionUIElement_GUID = "858f956a-972f-42a2-a2f2-0321e1abe209"
  IID_ITfTransitoryExtensionUIElement = LibC::GUID.new(0x858f956a_u32, 0x972f_u16, 0x42a2_u16, StaticArray[0xa2_u8, 0xf2_u8, 0x3_u8, 0x21_u8, 0xe1_u8, 0xab_u8, 0xe2_u8, 0x9_u8])
  struct ITfTransitoryExtensionUIElement
    lpVtbl : ITfTransitoryExtensionUIElementVTbl*
  end

  struct ITfTransitoryExtensionSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_transitory_extension_updated : UInt64
  end

  ITfTransitoryExtensionSink_GUID = "a615096f-1c57-4813-8a15-55ee6e5a839c"
  IID_ITfTransitoryExtensionSink = LibC::GUID.new(0xa615096f_u32, 0x1c57_u16, 0x4813_u16, StaticArray[0x8a_u8, 0x15_u8, 0x55_u8, 0xee_u8, 0x6e_u8, 0x5a_u8, 0x83_u8, 0x9c_u8])
  struct ITfTransitoryExtensionSink
    lpVtbl : ITfTransitoryExtensionSinkVTbl*
  end

  struct ITfToolTipUIElementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_description : UInt64
    get_guid : UInt64
    show : UInt64
    is_shown : UInt64
    get_string : UInt64
  end

  ITfToolTipUIElement_GUID = "52b18b5c-555d-46b2-b00a-fa680144fbdb"
  IID_ITfToolTipUIElement = LibC::GUID.new(0x52b18b5c_u32, 0x555d_u16, 0x46b2_u16, StaticArray[0xb0_u8, 0xa_u8, 0xfa_u8, 0x68_u8, 0x1_u8, 0x44_u8, 0xfb_u8, 0xdb_u8])
  struct ITfToolTipUIElement
    lpVtbl : ITfToolTipUIElementVTbl*
  end

  struct ITfReverseConversionListVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_length : UInt64
    get_string : UInt64
  end

  ITfReverseConversionList_GUID = "151d69f0-86f4-4674-b721-56911e797f47"
  IID_ITfReverseConversionList = LibC::GUID.new(0x151d69f0_u32, 0x86f4_u16, 0x4674_u16, StaticArray[0xb7_u8, 0x21_u8, 0x56_u8, 0x91_u8, 0x1e_u8, 0x79_u8, 0x7f_u8, 0x47_u8])
  struct ITfReverseConversionList
    lpVtbl : ITfReverseConversionListVTbl*
  end

  struct ITfReverseConversionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    do_reverse_conversion : UInt64
  end

  ITfReverseConversion_GUID = "a415e162-157d-417d-8a8c-0ab26c7d2781"
  IID_ITfReverseConversion = LibC::GUID.new(0xa415e162_u32, 0x157d_u16, 0x417d_u16, StaticArray[0x8a_u8, 0x8c_u8, 0xa_u8, 0xb2_u8, 0x6c_u8, 0x7d_u8, 0x27_u8, 0x81_u8])
  struct ITfReverseConversion
    lpVtbl : ITfReverseConversionVTbl*
  end

  struct ITfReverseConversionMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_reverse_conversion : UInt64
  end

  ITfReverseConversionMgr_GUID = "b643c236-c493-41b6-abb3-692412775cc4"
  IID_ITfReverseConversionMgr = LibC::GUID.new(0xb643c236_u32, 0xc493_u16, 0x41b6_u16, StaticArray[0xab_u8, 0xb3_u8, 0x69_u8, 0x24_u8, 0x12_u8, 0x77_u8, 0x5c_u8, 0xc4_u8])
  struct ITfReverseConversionMgr
    lpVtbl : ITfReverseConversionMgrVTbl*
  end

  struct ITfCandidateStringVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_string : UInt64
    get_index : UInt64
  end

  ITfCandidateString_GUID = "581f317e-fd9d-443f-b972-ed00467c5d40"
  IID_ITfCandidateString = LibC::GUID.new(0x581f317e_u32, 0xfd9d_u16, 0x443f_u16, StaticArray[0xb9_u8, 0x72_u8, 0xed_u8, 0x0_u8, 0x46_u8, 0x7c_u8, 0x5d_u8, 0x40_u8])
  struct ITfCandidateString
    lpVtbl : ITfCandidateStringVTbl*
  end

  struct IEnumTfCandidatesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumTfCandidates_GUID = "defb1926-6c80-4ce8-87d4-d6b72b812bde"
  IID_IEnumTfCandidates = LibC::GUID.new(0xdefb1926_u32, 0x6c80_u16, 0x4ce8_u16, StaticArray[0x87_u8, 0xd4_u8, 0xd6_u8, 0xb7_u8, 0x2b_u8, 0x81_u8, 0x2b_u8, 0xde_u8])
  struct IEnumTfCandidates
    lpVtbl : IEnumTfCandidatesVTbl*
  end

  struct ITfCandidateListVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enum_candidates : UInt64
    get_candidate : UInt64
    get_candidate_num : UInt64
    set_result : UInt64
  end

  ITfCandidateList_GUID = "a3ad50fb-9bdb-49e3-a843-6c76520fbf5d"
  IID_ITfCandidateList = LibC::GUID.new(0xa3ad50fb_u32, 0x9bdb_u16, 0x49e3_u16, StaticArray[0xa8_u8, 0x43_u8, 0x6c_u8, 0x76_u8, 0x52_u8, 0xf_u8, 0xbf_u8, 0x5d_u8])
  struct ITfCandidateList
    lpVtbl : ITfCandidateListVTbl*
  end

  struct ITfFnReconversionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    query_range : UInt64
    get_reconversion : UInt64
    reconvert : UInt64
  end

  ITfFnReconversion_GUID = "4cea93c0-0a58-11d3-8df0-00105a2799b5"
  IID_ITfFnReconversion = LibC::GUID.new(0x4cea93c0_u32, 0xa58_u16, 0x11d3_u16, StaticArray[0x8d_u8, 0xf0_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
  struct ITfFnReconversion
    lpVtbl : ITfFnReconversionVTbl*
  end

  struct ITfFnPlayBackVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    query_range : UInt64
    play : UInt64
  end

  ITfFnPlayBack_GUID = "a3a416a4-0f64-11d3-b5b7-00c04fc324a1"
  IID_ITfFnPlayBack = LibC::GUID.new(0xa3a416a4_u32, 0xf64_u16, 0x11d3_u16, StaticArray[0xb5_u8, 0xb7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x24_u8, 0xa1_u8])
  struct ITfFnPlayBack
    lpVtbl : ITfFnPlayBackVTbl*
  end

  struct ITfFnLangProfileUtilVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    register_active_profiles : UInt64
    is_profile_available_for_lang : UInt64
  end

  ITfFnLangProfileUtil_GUID = "a87a8574-a6c1-4e15-99f0-3d3965f548eb"
  IID_ITfFnLangProfileUtil = LibC::GUID.new(0xa87a8574_u32, 0xa6c1_u16, 0x4e15_u16, StaticArray[0x99_u8, 0xf0_u8, 0x3d_u8, 0x39_u8, 0x65_u8, 0xf5_u8, 0x48_u8, 0xeb_u8])
  struct ITfFnLangProfileUtil
    lpVtbl : ITfFnLangProfileUtilVTbl*
  end

  struct ITfFnConfigureVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    show : UInt64
  end

  ITfFnConfigure_GUID = "88f567c6-1757-49f8-a1b2-89234c1eeff9"
  IID_ITfFnConfigure = LibC::GUID.new(0x88f567c6_u32, 0x1757_u16, 0x49f8_u16, StaticArray[0xa1_u8, 0xb2_u8, 0x89_u8, 0x23_u8, 0x4c_u8, 0x1e_u8, 0xef_u8, 0xf9_u8])
  struct ITfFnConfigure
    lpVtbl : ITfFnConfigureVTbl*
  end

  struct ITfFnConfigureRegisterWordVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    show : UInt64
  end

  ITfFnConfigureRegisterWord_GUID = "bb95808a-6d8f-4bca-8400-5390b586aedf"
  IID_ITfFnConfigureRegisterWord = LibC::GUID.new(0xbb95808a_u32, 0x6d8f_u16, 0x4bca_u16, StaticArray[0x84_u8, 0x0_u8, 0x53_u8, 0x90_u8, 0xb5_u8, 0x86_u8, 0xae_u8, 0xdf_u8])
  struct ITfFnConfigureRegisterWord
    lpVtbl : ITfFnConfigureRegisterWordVTbl*
  end

  struct ITfFnConfigureRegisterEudcVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    show : UInt64
  end

  ITfFnConfigureRegisterEudc_GUID = "b5e26ff5-d7ad-4304-913f-21a2ed95a1b0"
  IID_ITfFnConfigureRegisterEudc = LibC::GUID.new(0xb5e26ff5_u32, 0xd7ad_u16, 0x4304_u16, StaticArray[0x91_u8, 0x3f_u8, 0x21_u8, 0xa2_u8, 0xed_u8, 0x95_u8, 0xa1_u8, 0xb0_u8])
  struct ITfFnConfigureRegisterEudc
    lpVtbl : ITfFnConfigureRegisterEudcVTbl*
  end

  struct ITfFnShowHelpVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    show : UInt64
  end

  ITfFnShowHelp_GUID = "5ab1d30c-094d-4c29-8ea5-0bf59be87bf3"
  IID_ITfFnShowHelp = LibC::GUID.new(0x5ab1d30c_u32, 0x94d_u16, 0x4c29_u16, StaticArray[0x8e_u8, 0xa5_u8, 0xb_u8, 0xf5_u8, 0x9b_u8, 0xe8_u8, 0x7b_u8, 0xf3_u8])
  struct ITfFnShowHelp
    lpVtbl : ITfFnShowHelpVTbl*
  end

  struct ITfFnBalloonVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    update_balloon : UInt64
  end

  ITfFnBalloon_GUID = "3bab89e4-5fbe-45f4-a5bc-dca36ad225a8"
  IID_ITfFnBalloon = LibC::GUID.new(0x3bab89e4_u32, 0x5fbe_u16, 0x45f4_u16, StaticArray[0xa5_u8, 0xbc_u8, 0xdc_u8, 0xa3_u8, 0x6a_u8, 0xd2_u8, 0x25_u8, 0xa8_u8])
  struct ITfFnBalloon
    lpVtbl : ITfFnBalloonVTbl*
  end

  struct ITfFnGetSAPIObjectVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    get : UInt64
  end

  ITfFnGetSAPIObject_GUID = "5c0ab7ea-167d-4f59-bfb5-4693755e90ca"
  IID_ITfFnGetSAPIObject = LibC::GUID.new(0x5c0ab7ea_u32, 0x167d_u16, 0x4f59_u16, StaticArray[0xbf_u8, 0xb5_u8, 0x46_u8, 0x93_u8, 0x75_u8, 0x5e_u8, 0x90_u8, 0xca_u8])
  struct ITfFnGetSAPIObject
    lpVtbl : ITfFnGetSAPIObjectVTbl*
  end

  struct ITfFnPropertyUIStatusVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    get_status : UInt64
    set_status : UInt64
  end

  ITfFnPropertyUIStatus_GUID = "2338ac6e-2b9d-44c0-a75e-ee64f256b3bd"
  IID_ITfFnPropertyUIStatus = LibC::GUID.new(0x2338ac6e_u32, 0x2b9d_u16, 0x44c0_u16, StaticArray[0xa7_u8, 0x5e_u8, 0xee_u8, 0x64_u8, 0xf2_u8, 0x56_u8, 0xb3_u8, 0xbd_u8])
  struct ITfFnPropertyUIStatus
    lpVtbl : ITfFnPropertyUIStatusVTbl*
  end

  struct IEnumSpeechCommandsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumSpeechCommands_GUID = "8c5dac4f-083c-4b85-a4c9-71746048adca"
  IID_IEnumSpeechCommands = LibC::GUID.new(0x8c5dac4f_u32, 0x83c_u16, 0x4b85_u16, StaticArray[0xa4_u8, 0xc9_u8, 0x71_u8, 0x74_u8, 0x60_u8, 0x48_u8, 0xad_u8, 0xca_u8])
  struct IEnumSpeechCommands
    lpVtbl : IEnumSpeechCommandsVTbl*
  end

  struct ISpeechCommandProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    enum_speech_commands : UInt64
    process_command : UInt64
  end

  ISpeechCommandProvider_GUID = "38e09d4c-586d-435a-b592-c8a86691dec6"
  IID_ISpeechCommandProvider = LibC::GUID.new(0x38e09d4c_u32, 0x586d_u16, 0x435a_u16, StaticArray[0xb5_u8, 0x92_u8, 0xc8_u8, 0xa8_u8, 0x66_u8, 0x91_u8, 0xde_u8, 0xc6_u8])
  struct ISpeechCommandProvider
    lpVtbl : ISpeechCommandProviderVTbl*
  end

  struct ITfFnCustomSpeechCommandVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    set_speech_command_provider : UInt64
  end

  ITfFnCustomSpeechCommand_GUID = "fca6c349-a12f-43a3-8dd6-5a5a4282577b"
  IID_ITfFnCustomSpeechCommand = LibC::GUID.new(0xfca6c349_u32, 0xa12f_u16, 0x43a3_u16, StaticArray[0x8d_u8, 0xd6_u8, 0x5a_u8, 0x5a_u8, 0x42_u8, 0x82_u8, 0x57_u8, 0x7b_u8])
  struct ITfFnCustomSpeechCommand
    lpVtbl : ITfFnCustomSpeechCommandVTbl*
  end

  struct ITfFnLMProcessorVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    query_range : UInt64
    query_lang_id : UInt64
    get_reconversion : UInt64
    reconvert : UInt64
    query_key : UInt64
    invoke_key : UInt64
    invoke_func : UInt64
  end

  ITfFnLMProcessor_GUID = "7afbf8e7-ac4b-4082-b058-890899d3a010"
  IID_ITfFnLMProcessor = LibC::GUID.new(0x7afbf8e7_u32, 0xac4b_u16, 0x4082_u16, StaticArray[0xb0_u8, 0x58_u8, 0x89_u8, 0x8_u8, 0x99_u8, 0xd3_u8, 0xa0_u8, 0x10_u8])
  struct ITfFnLMProcessor
    lpVtbl : ITfFnLMProcessorVTbl*
  end

  struct ITfFnLMInternalVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    query_range : UInt64
    query_lang_id : UInt64
    get_reconversion : UInt64
    reconvert : UInt64
    query_key : UInt64
    invoke_key : UInt64
    invoke_func : UInt64
    process_lattice : UInt64
  end

  ITfFnLMInternal_GUID = "04b825b1-ac9a-4f7b-b5ad-c7168f1ee445"
  IID_ITfFnLMInternal = LibC::GUID.new(0x4b825b1_u32, 0xac9a_u16, 0x4f7b_u16, StaticArray[0xb5_u8, 0xad_u8, 0xc7_u8, 0x16_u8, 0x8f_u8, 0x1e_u8, 0xe4_u8, 0x45_u8])
  struct ITfFnLMInternal
    lpVtbl : ITfFnLMInternalVTbl*
  end

  struct IEnumTfLatticeElementsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    next : UInt64
    reset : UInt64
    skip : UInt64
  end

  IEnumTfLatticeElements_GUID = "56988052-47da-4a05-911a-e3d941f17145"
  IID_IEnumTfLatticeElements = LibC::GUID.new(0x56988052_u32, 0x47da_u16, 0x4a05_u16, StaticArray[0x91_u8, 0x1a_u8, 0xe3_u8, 0xd9_u8, 0x41_u8, 0xf1_u8, 0x71_u8, 0x45_u8])
  struct IEnumTfLatticeElements
    lpVtbl : IEnumTfLatticeElementsVTbl*
  end

  struct ITfLMLatticeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    query_type : UInt64
    enum_lattice_elements : UInt64
  end

  ITfLMLattice_GUID = "d4236675-a5bf-4570-9d42-5d6d7b02d59b"
  IID_ITfLMLattice = LibC::GUID.new(0xd4236675_u32, 0xa5bf_u16, 0x4570_u16, StaticArray[0x9d_u8, 0x42_u8, 0x5d_u8, 0x6d_u8, 0x7b_u8, 0x2_u8, 0xd5_u8, 0x9b_u8])
  struct ITfLMLattice
    lpVtbl : ITfLMLatticeVTbl*
  end

  struct ITfFnAdviseTextVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    on_text_update : UInt64
    on_lattice_update : UInt64
  end

  ITfFnAdviseText_GUID = "3527268b-7d53-4dd9-92b7-7296ae461249"
  IID_ITfFnAdviseText = LibC::GUID.new(0x3527268b_u32, 0x7d53_u16, 0x4dd9_u16, StaticArray[0x92_u8, 0xb7_u8, 0x72_u8, 0x96_u8, 0xae_u8, 0x46_u8, 0x12_u8, 0x49_u8])
  struct ITfFnAdviseText
    lpVtbl : ITfFnAdviseTextVTbl*
  end

  struct ITfFnSearchCandidateProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    get_search_candidates : UInt64
    set_result : UInt64
  end

  ITfFnSearchCandidateProvider_GUID = "87a2ad8f-f27b-4920-8501-67602280175d"
  IID_ITfFnSearchCandidateProvider = LibC::GUID.new(0x87a2ad8f_u32, 0xf27b_u16, 0x4920_u16, StaticArray[0x85_u8, 0x1_u8, 0x67_u8, 0x60_u8, 0x22_u8, 0x80_u8, 0x17_u8, 0x5d_u8])
  struct ITfFnSearchCandidateProvider
    lpVtbl : ITfFnSearchCandidateProviderVTbl*
  end

  struct ITfIntegratableCandidateListUIElementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_integration_style : UInt64
    get_selection_style : UInt64
    on_key_down : UInt64
    show_candidate_numbers : UInt64
    finalize_exact_composition_string : UInt64
  end

  ITfIntegratableCandidateListUIElement_GUID = "c7a6f54f-b180-416f-b2bf-7bf2e4683d7b"
  IID_ITfIntegratableCandidateListUIElement = LibC::GUID.new(0xc7a6f54f_u32, 0xb180_u16, 0x416f_u16, StaticArray[0xb2_u8, 0xbf_u8, 0x7b_u8, 0xf2_u8, 0xe4_u8, 0x68_u8, 0x3d_u8, 0x7b_u8])
  struct ITfIntegratableCandidateListUIElement
    lpVtbl : ITfIntegratableCandidateListUIElementVTbl*
  end

  struct ITfFnGetPreferredTouchKeyboardLayoutVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    get_layout : UInt64
  end

  ITfFnGetPreferredTouchKeyboardLayout_GUID = "5f309a41-590a-4acc-a97f-d8efff13fdfc"
  IID_ITfFnGetPreferredTouchKeyboardLayout = LibC::GUID.new(0x5f309a41_u32, 0x590a_u16, 0x4acc_u16, StaticArray[0xa9_u8, 0x7f_u8, 0xd8_u8, 0xef_u8, 0xff_u8, 0x13_u8, 0xfd_u8, 0xfc_u8])
  struct ITfFnGetPreferredTouchKeyboardLayout
    lpVtbl : ITfFnGetPreferredTouchKeyboardLayoutVTbl*
  end

  struct ITfFnGetLinguisticAlternatesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_display_name : UInt64
    get_alternates : UInt64
  end

  ITfFnGetLinguisticAlternates_GUID = "ea163ce2-7a65-4506-82a3-c528215da64e"
  IID_ITfFnGetLinguisticAlternates = LibC::GUID.new(0xea163ce2_u32, 0x7a65_u16, 0x4506_u16, StaticArray[0x82_u8, 0xa3_u8, 0xc5_u8, 0x28_u8, 0x21_u8, 0x5d_u8, 0xa6_u8, 0x4e_u8])
  struct ITfFnGetLinguisticAlternates
    lpVtbl : ITfFnGetLinguisticAlternatesVTbl*
  end

  struct IUIManagerEventSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_window_opening : UInt64
    on_window_opened : UInt64
    on_window_updating : UInt64
    on_window_updated : UInt64
    on_window_closing : UInt64
    on_window_closed : UInt64
  end

  IUIManagerEventSink_GUID = "cd91d690-a7e8-4265-9b38-8bb3bbaba7de"
  IID_IUIManagerEventSink = LibC::GUID.new(0xcd91d690_u32, 0xa7e8_u16, 0x4265_u16, StaticArray[0x9b_u8, 0x38_u8, 0x8b_u8, 0xb3_u8, 0xbb_u8, 0xab_u8, 0xa7_u8, 0xde_u8])
  struct IUIManagerEventSink
    lpVtbl : IUIManagerEventSinkVTbl*
  end

  struct ITfInputScopeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_input_scopes : UInt64
    get_phrase : UInt64
    get_regular_expression : UInt64
    get_srgs : UInt64
    get_xml : UInt64
  end

  ITfInputScope_GUID = "fde1eaee-6924-4cdf-91e7-da38cff5559d"
  IID_ITfInputScope = LibC::GUID.new(0xfde1eaee_u32, 0x6924_u16, 0x4cdf_u16, StaticArray[0x91_u8, 0xe7_u8, 0xda_u8, 0x38_u8, 0xcf_u8, 0xf5_u8, 0x55_u8, 0x9d_u8])
  struct ITfInputScope
    lpVtbl : ITfInputScopeVTbl*
  end

  struct ITfInputScope2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_input_scopes : UInt64
    get_phrase : UInt64
    get_regular_expression : UInt64
    get_srgs : UInt64
    get_xml : UInt64
    enum_word_list : UInt64
  end

  ITfInputScope2_GUID = "5731eaa0-6bc2-4681-a532-92fbb74d7c41"
  IID_ITfInputScope2 = LibC::GUID.new(0x5731eaa0_u32, 0x6bc2_u16, 0x4681_u16, StaticArray[0xa5_u8, 0x32_u8, 0x92_u8, 0xfb_u8, 0xb7_u8, 0x4d_u8, 0x7c_u8, 0x41_u8])
  struct ITfInputScope2
    lpVtbl : ITfInputScope2VTbl*
  end

  struct ITfMSAAControlVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    system_enable_msaa : UInt64
    system_disable_msaa : UInt64
  end

  ITfMSAAControl_GUID = "b5f8fb3b-393f-4f7c-84cb-504924c2705a"
  IID_ITfMSAAControl = LibC::GUID.new(0xb5f8fb3b_u32, 0x393f_u16, 0x4f7c_u16, StaticArray[0x84_u8, 0xcb_u8, 0x50_u8, 0x49_u8, 0x24_u8, 0xc2_u8, 0x70_u8, 0x5a_u8])
  struct ITfMSAAControl
    lpVtbl : ITfMSAAControlVTbl*
  end

  struct IInternalDocWrapVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    notify_revoke : UInt64
  end

  IInternalDocWrap_GUID = "e1aa6466-9db4-40ba-be03-77c38e8e60b2"
  IID_IInternalDocWrap = LibC::GUID.new(0xe1aa6466_u32, 0x9db4_u16, 0x40ba_u16, StaticArray[0xbe_u8, 0x3_u8, 0x77_u8, 0xc3_u8, 0x8e_u8, 0x8e_u8, 0x60_u8, 0xb2_u8])
  struct IInternalDocWrap
    lpVtbl : IInternalDocWrapVTbl*
  end

  struct ITextStoreACPExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    scroll_to_rect : UInt64
  end

  ITextStoreACPEx_GUID = "a2de3bc2-3d8e-11d3-81a9-f753fbe61a00"
  IID_ITextStoreACPEx = LibC::GUID.new(0xa2de3bc2_u32, 0x3d8e_u16, 0x11d3_u16, StaticArray[0x81_u8, 0xa9_u8, 0xf7_u8, 0x53_u8, 0xfb_u8, 0xe6_u8, 0x1a_u8, 0x0_u8])
  struct ITextStoreACPEx
    lpVtbl : ITextStoreACPExVTbl*
  end

  struct ITextStoreAnchorExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    scroll_to_rect : UInt64
  end

  ITextStoreAnchorEx_GUID = "a2de3bc1-3d8e-11d3-81a9-f753fbe61a00"
  IID_ITextStoreAnchorEx = LibC::GUID.new(0xa2de3bc1_u32, 0x3d8e_u16, 0x11d3_u16, StaticArray[0x81_u8, 0xa9_u8, 0xf7_u8, 0x53_u8, 0xfb_u8, 0xe6_u8, 0x1a_u8, 0x0_u8])
  struct ITextStoreAnchorEx
    lpVtbl : ITextStoreAnchorExVTbl*
  end

  struct ITextStoreACPSinkExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_text_change : UInt64
    on_selection_change : UInt64
    on_layout_change : UInt64
    on_status_change : UInt64
    on_attrs_change : UInt64
    on_lock_granted : UInt64
    on_start_edit_transaction : UInt64
    on_end_edit_transaction : UInt64
    on_disconnect : UInt64
  end

  ITextStoreACPSinkEx_GUID = "2bdf9464-41e2-43e3-950c-a6865ba25cd4"
  IID_ITextStoreACPSinkEx = LibC::GUID.new(0x2bdf9464_u32, 0x41e2_u16, 0x43e3_u16, StaticArray[0x95_u8, 0xc_u8, 0xa6_u8, 0x86_u8, 0x5b_u8, 0xa2_u8, 0x5c_u8, 0xd4_u8])
  struct ITextStoreACPSinkEx
    lpVtbl : ITextStoreACPSinkExVTbl*
  end

  struct ITextStoreSinkAnchorExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    on_text_change : UInt64
    on_selection_change : UInt64
    on_layout_change : UInt64
    on_status_change : UInt64
    on_attrs_change : UInt64
    on_lock_granted : UInt64
    on_start_edit_transaction : UInt64
    on_end_edit_transaction : UInt64
    on_disconnect : UInt64
  end

  ITextStoreSinkAnchorEx_GUID = "25642426-028d-4474-977b-111bb114fe3e"
  IID_ITextStoreSinkAnchorEx = LibC::GUID.new(0x25642426_u32, 0x28d_u16, 0x4474_u16, StaticArray[0x97_u8, 0x7b_u8, 0x11_u8, 0x1b_u8, 0xb1_u8, 0x14_u8, 0xfe_u8, 0x3e_u8])
  struct ITextStoreSinkAnchorEx
    lpVtbl : ITextStoreSinkAnchorExVTbl*
  end

  struct IAccDictionaryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_localized_string : UInt64
    get_parent_term : UInt64
    get_mnemonic_string : UInt64
    lookup_mnemonic_term : UInt64
    convert_value_to_string : UInt64
  end

  IAccDictionary_GUID = "1dc4cb5f-d737-474d-ade9-5ccfc9bc1cc9"
  IID_IAccDictionary = LibC::GUID.new(0x1dc4cb5f_u32, 0xd737_u16, 0x474d_u16, StaticArray[0xad_u8, 0xe9_u8, 0x5c_u8, 0xcf_u8, 0xc9_u8, 0xbc_u8, 0x1c_u8, 0xc9_u8])
  struct IAccDictionary
    lpVtbl : IAccDictionaryVTbl*
  end

  struct IVersionInfoVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_subcomponent_count : UInt64
    get_implementation_id : UInt64
    get_build_version : UInt64
    get_component_description : UInt64
    get_instance_description : UInt64
  end

  IVersionInfo_GUID = "401518ec-db00-4611-9b29-2a0e4b9afa85"
  IID_IVersionInfo = LibC::GUID.new(0x401518ec_u32, 0xdb00_u16, 0x4611_u16, StaticArray[0x9b_u8, 0x29_u8, 0x2a_u8, 0xe_u8, 0x4b_u8, 0x9a_u8, 0xfa_u8, 0x85_u8])
  struct IVersionInfo
    lpVtbl : IVersionInfoVTbl*
  end

  struct ICoCreateLocallyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    co_create_locally : UInt64
  end

  ICoCreateLocally_GUID = "03de00aa-f272-41e3-99cb-03c5e8114ea0"
  IID_ICoCreateLocally = LibC::GUID.new(0x3de00aa_u32, 0xf272_u16, 0x41e3_u16, StaticArray[0x99_u8, 0xcb_u8, 0x3_u8, 0xc5_u8, 0xe8_u8, 0x11_u8, 0x4e_u8, 0xa0_u8])
  struct ICoCreateLocally
    lpVtbl : ICoCreateLocallyVTbl*
  end

  struct ICoCreatedLocallyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    local_init : UInt64
  end

  ICoCreatedLocally_GUID = "0a53eb6c-1908-4742-8cff-2cee2e93f94c"
  IID_ICoCreatedLocally = LibC::GUID.new(0xa53eb6c_u32, 0x1908_u16, 0x4742_u16, StaticArray[0x8c_u8, 0xff_u8, 0x2c_u8, 0xee_u8, 0x2e_u8, 0x93_u8, 0xf9_u8, 0x4c_u8])
  struct ICoCreatedLocally
    lpVtbl : ICoCreatedLocallyVTbl*
  end

  struct IAccStoreVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register : UInt64
    unregister : UInt64
    get_documents : UInt64
    lookup_by_hwnd : UInt64
    lookup_by_point : UInt64
    on_document_focus : UInt64
    get_focused : UInt64
  end

  IAccStore_GUID = "e2cd4a63-2b72-4d48-b739-95e4765195ba"
  IID_IAccStore = LibC::GUID.new(0xe2cd4a63_u32, 0x2b72_u16, 0x4d48_u16, StaticArray[0xb7_u8, 0x39_u8, 0x95_u8, 0xe4_u8, 0x76_u8, 0x51_u8, 0x95_u8, 0xba_u8])
  struct IAccStore
    lpVtbl : IAccStoreVTbl*
  end

  struct IAccServerDocMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    new_document : UInt64
    revoke_document : UInt64
    on_document_focus : UInt64
  end

  IAccServerDocMgr_GUID = "ad7c73cf-6dd5-4855-abc2-b04bad5b9153"
  IID_IAccServerDocMgr = LibC::GUID.new(0xad7c73cf_u32, 0x6dd5_u16, 0x4855_u16, StaticArray[0xab_u8, 0xc2_u8, 0xb0_u8, 0x4b_u8, 0xad_u8, 0x5b_u8, 0x91_u8, 0x53_u8])
  struct IAccServerDocMgr
    lpVtbl : IAccServerDocMgrVTbl*
  end

  struct IAccClientDocMgrVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_documents : UInt64
    lookup_by_hwnd : UInt64
    lookup_by_point : UInt64
    get_focused : UInt64
  end

  IAccClientDocMgr_GUID = "4c896039-7b6d-49e6-a8c1-45116a98292b"
  IID_IAccClientDocMgr = LibC::GUID.new(0x4c896039_u32, 0x7b6d_u16, 0x49e6_u16, StaticArray[0xa8_u8, 0xc1_u8, 0x45_u8, 0x11_u8, 0x6a_u8, 0x98_u8, 0x29_u8, 0x2b_u8])
  struct IAccClientDocMgr
    lpVtbl : IAccClientDocMgrVTbl*
  end

  struct IDocWrapVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_doc : UInt64
    get_wrapped_doc : UInt64
  end

  IDocWrap_GUID = "dcd285fe-0be0-43bd-99c9-aaaec513c555"
  IID_IDocWrap = LibC::GUID.new(0xdcd285fe_u32, 0xbe0_u16, 0x43bd_u16, StaticArray[0x99_u8, 0xc9_u8, 0xaa_u8, 0xae_u8, 0xc5_u8, 0x13_u8, 0xc5_u8, 0x55_u8])
  struct IDocWrap
    lpVtbl : IDocWrapVTbl*
  end

  struct IClonableWrapperVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone_new_wrapper : UInt64
  end

  IClonableWrapper_GUID = "b33e75ff-e84c-4dca-a25c-33b8dc003374"
  IID_IClonableWrapper = LibC::GUID.new(0xb33e75ff_u32, 0xe84c_u16, 0x4dca_u16, StaticArray[0xa2_u8, 0x5c_u8, 0x33_u8, 0xb8_u8, 0xdc_u8, 0x0_u8, 0x33_u8, 0x74_u8])
  struct IClonableWrapper
    lpVtbl : IClonableWrapperVTbl*
  end

  struct ITfSpeechUIServerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    initialize : UInt64
    show_ui : UInt64
    update_balloon : UInt64
  end

  ITfSpeechUIServer_GUID = "90e9a944-9244-489f-a78f-de67afc013a7"
  IID_ITfSpeechUIServer = LibC::GUID.new(0x90e9a944_u32, 0x9244_u16, 0x489f_u16, StaticArray[0xa7_u8, 0x8f_u8, 0xde_u8, 0x67_u8, 0xaf_u8, 0xc0_u8, 0x13_u8, 0xa7_u8])
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
struct LibWin32::ITextStoreACP
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise_sink(riid : Guid*, punk : IUnknown, dwmask : UInt32) : HRESULT
    @lpVtbl.value.advise_sink.unsafe_as(Proc(Guid*, IUnknown, UInt32, HRESULT)).call(riid, punk, dwmask)
  end
  def unadvise_sink(punk : IUnknown) : HRESULT
    @lpVtbl.value.unadvise_sink.unsafe_as(Proc(IUnknown, HRESULT)).call(punk)
  end
  def request_lock(dwlockflags : UInt32, phrsession : HRESULT*) : HRESULT
    @lpVtbl.value.request_lock.unsafe_as(Proc(UInt32, HRESULT*, HRESULT)).call(dwlockflags, phrsession)
  end
  def get_status(pdcs : TS_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(TS_STATUS*, HRESULT)).call(pdcs)
  end
  def query_insert(acpteststart : Int32, acptestend : Int32, cch : UInt32, pacpresultstart : Int32*, pacpresultend : Int32*) : HRESULT
    @lpVtbl.value.query_insert.unsafe_as(Proc(Int32, Int32, UInt32, Int32*, Int32*, HRESULT)).call(acpteststart, acptestend, cch, pacpresultstart, pacpresultend)
  end
  def get_selection(ulindex : UInt32, ulcount : UInt32, pselection : TS_SELECTION_ACP*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(UInt32, UInt32, TS_SELECTION_ACP*, UInt32*, HRESULT)).call(ulindex, ulcount, pselection, pcfetched)
  end
  def set_selection(ulcount : UInt32, pselection : TS_SELECTION_ACP*) : HRESULT
    @lpVtbl.value.set_selection.unsafe_as(Proc(UInt32, TS_SELECTION_ACP*, HRESULT)).call(ulcount, pselection)
  end
  def get_text(acpstart : Int32, acpend : Int32, pchplain : Char*, cchplainreq : UInt32, pcchplainret : UInt32*, prgruninfo : TS_RUNINFO*, cruninforeq : UInt32, pcruninforet : UInt32*, pacpnext : Int32*) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(Int32, Int32, Char*, UInt32, UInt32*, TS_RUNINFO*, UInt32, UInt32*, Int32*, HRESULT)).call(acpstart, acpend, pchplain, cchplainreq, pcchplainret, prgruninfo, cruninforeq, pcruninforet, pacpnext)
  end
  def set_text(dwflags : UInt32, acpstart : Int32, acpend : Int32, pchtext : Char*, cch : UInt32, pchange : TS_TEXTCHANGE*) : HRESULT
    @lpVtbl.value.set_text.unsafe_as(Proc(UInt32, Int32, Int32, Char*, UInt32, TS_TEXTCHANGE*, HRESULT)).call(dwflags, acpstart, acpend, pchtext, cch, pchange)
  end
  def get_formatted_text(acpstart : Int32, acpend : Int32, ppdataobject : IDataObject*) : HRESULT
    @lpVtbl.value.get_formatted_text.unsafe_as(Proc(Int32, Int32, IDataObject*, HRESULT)).call(acpstart, acpend, ppdataobject)
  end
  def get_embedded(acppos : Int32, rguidservice : Guid*, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_embedded.unsafe_as(Proc(Int32, Guid*, Guid*, IUnknown*, HRESULT)).call(acppos, rguidservice, riid, ppunk)
  end
  def query_insert_embedded(pguidservice : Guid*, pformatetc : FORMATETC*, pfinsertable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_insert_embedded.unsafe_as(Proc(Guid*, FORMATETC*, LibC::BOOL*, HRESULT)).call(pguidservice, pformatetc, pfinsertable)
  end
  def insert_embedded(dwflags : UInt32, acpstart : Int32, acpend : Int32, pdataobject : IDataObject, pchange : TS_TEXTCHANGE*) : HRESULT
    @lpVtbl.value.insert_embedded.unsafe_as(Proc(UInt32, Int32, Int32, IDataObject, TS_TEXTCHANGE*, HRESULT)).call(dwflags, acpstart, acpend, pdataobject, pchange)
  end
  def insert_text_at_selection(dwflags : UInt32, pchtext : Char*, cch : UInt32, pacpstart : Int32*, pacpend : Int32*, pchange : TS_TEXTCHANGE*) : HRESULT
    @lpVtbl.value.insert_text_at_selection.unsafe_as(Proc(UInt32, Char*, UInt32, Int32*, Int32*, TS_TEXTCHANGE*, HRESULT)).call(dwflags, pchtext, cch, pacpstart, pacpend, pchange)
  end
  def insert_embedded_at_selection(dwflags : UInt32, pdataobject : IDataObject, pacpstart : Int32*, pacpend : Int32*, pchange : TS_TEXTCHANGE*) : HRESULT
    @lpVtbl.value.insert_embedded_at_selection.unsafe_as(Proc(UInt32, IDataObject, Int32*, Int32*, TS_TEXTCHANGE*, HRESULT)).call(dwflags, pdataobject, pacpstart, pacpend, pchange)
  end
  def request_supported_attrs(dwflags : UInt32, cfilterattrs : UInt32, pafilterattrs : Guid*) : HRESULT
    @lpVtbl.value.request_supported_attrs.unsafe_as(Proc(UInt32, UInt32, Guid*, HRESULT)).call(dwflags, cfilterattrs, pafilterattrs)
  end
  def request_attrs_at_position(acppos : Int32, cfilterattrs : UInt32, pafilterattrs : Guid*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.request_attrs_at_position.unsafe_as(Proc(Int32, UInt32, Guid*, UInt32, HRESULT)).call(acppos, cfilterattrs, pafilterattrs, dwflags)
  end
  def request_attrs_transitioning_at_position(acppos : Int32, cfilterattrs : UInt32, pafilterattrs : Guid*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.request_attrs_transitioning_at_position.unsafe_as(Proc(Int32, UInt32, Guid*, UInt32, HRESULT)).call(acppos, cfilterattrs, pafilterattrs, dwflags)
  end
  def find_next_attr_transition(acpstart : Int32, acphalt : Int32, cfilterattrs : UInt32, pafilterattrs : Guid*, dwflags : UInt32, pacpnext : Int32*, pffound : LibC::BOOL*, plfoundoffset : Int32*) : HRESULT
    @lpVtbl.value.find_next_attr_transition.unsafe_as(Proc(Int32, Int32, UInt32, Guid*, UInt32, Int32*, LibC::BOOL*, Int32*, HRESULT)).call(acpstart, acphalt, cfilterattrs, pafilterattrs, dwflags, pacpnext, pffound, plfoundoffset)
  end
  def retrieve_requested_attrs(ulcount : UInt32, paattrvals : TS_ATTRVAL*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.retrieve_requested_attrs.unsafe_as(Proc(UInt32, TS_ATTRVAL*, UInt32*, HRESULT)).call(ulcount, paattrvals, pcfetched)
  end
  def get_end_acp(pacp : Int32*) : HRESULT
    @lpVtbl.value.get_end_acp.unsafe_as(Proc(Int32*, HRESULT)).call(pacp)
  end
  def get_active_view(pvcview : UInt32*) : HRESULT
    @lpVtbl.value.get_active_view.unsafe_as(Proc(UInt32*, HRESULT)).call(pvcview)
  end
  def get_acp_from_point(vcview : UInt32, ptscreen : POINT*, dwflags : UInt32, pacp : Int32*) : HRESULT
    @lpVtbl.value.get_acp_from_point.unsafe_as(Proc(UInt32, POINT*, UInt32, Int32*, HRESULT)).call(vcview, ptscreen, dwflags, pacp)
  end
  def get_text_ext(vcview : UInt32, acpstart : Int32, acpend : Int32, prc : RECT*, pfclipped : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_text_ext.unsafe_as(Proc(UInt32, Int32, Int32, RECT*, LibC::BOOL*, HRESULT)).call(vcview, acpstart, acpend, prc, pfclipped)
  end
  def get_screen_ext(vcview : UInt32, prc : RECT*) : HRESULT
    @lpVtbl.value.get_screen_ext.unsafe_as(Proc(UInt32, RECT*, HRESULT)).call(vcview, prc)
  end
  def get_wnd(vcview : UInt32, phwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_wnd.unsafe_as(Proc(UInt32, HANDLE*, HRESULT)).call(vcview, phwnd)
  end
end
struct LibWin32::ITextStoreACP2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise_sink(riid : Guid*, punk : IUnknown, dwmask : UInt32) : HRESULT
    @lpVtbl.value.advise_sink.unsafe_as(Proc(Guid*, IUnknown, UInt32, HRESULT)).call(riid, punk, dwmask)
  end
  def unadvise_sink(punk : IUnknown) : HRESULT
    @lpVtbl.value.unadvise_sink.unsafe_as(Proc(IUnknown, HRESULT)).call(punk)
  end
  def request_lock(dwlockflags : UInt32, phrsession : HRESULT*) : HRESULT
    @lpVtbl.value.request_lock.unsafe_as(Proc(UInt32, HRESULT*, HRESULT)).call(dwlockflags, phrsession)
  end
  def get_status(pdcs : TS_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(TS_STATUS*, HRESULT)).call(pdcs)
  end
  def query_insert(acpteststart : Int32, acptestend : Int32, cch : UInt32, pacpresultstart : Int32*, pacpresultend : Int32*) : HRESULT
    @lpVtbl.value.query_insert.unsafe_as(Proc(Int32, Int32, UInt32, Int32*, Int32*, HRESULT)).call(acpteststart, acptestend, cch, pacpresultstart, pacpresultend)
  end
  def get_selection(ulindex : UInt32, ulcount : UInt32, pselection : TS_SELECTION_ACP*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(UInt32, UInt32, TS_SELECTION_ACP*, UInt32*, HRESULT)).call(ulindex, ulcount, pselection, pcfetched)
  end
  def set_selection(ulcount : UInt32, pselection : TS_SELECTION_ACP*) : HRESULT
    @lpVtbl.value.set_selection.unsafe_as(Proc(UInt32, TS_SELECTION_ACP*, HRESULT)).call(ulcount, pselection)
  end
  def get_text(acpstart : Int32, acpend : Int32, pchplain : Char*, cchplainreq : UInt32, pcchplainret : UInt32*, prgruninfo : TS_RUNINFO*, cruninforeq : UInt32, pcruninforet : UInt32*, pacpnext : Int32*) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(Int32, Int32, Char*, UInt32, UInt32*, TS_RUNINFO*, UInt32, UInt32*, Int32*, HRESULT)).call(acpstart, acpend, pchplain, cchplainreq, pcchplainret, prgruninfo, cruninforeq, pcruninforet, pacpnext)
  end
  def set_text(dwflags : UInt32, acpstart : Int32, acpend : Int32, pchtext : Char*, cch : UInt32, pchange : TS_TEXTCHANGE*) : HRESULT
    @lpVtbl.value.set_text.unsafe_as(Proc(UInt32, Int32, Int32, Char*, UInt32, TS_TEXTCHANGE*, HRESULT)).call(dwflags, acpstart, acpend, pchtext, cch, pchange)
  end
  def get_formatted_text(acpstart : Int32, acpend : Int32, ppdataobject : IDataObject*) : HRESULT
    @lpVtbl.value.get_formatted_text.unsafe_as(Proc(Int32, Int32, IDataObject*, HRESULT)).call(acpstart, acpend, ppdataobject)
  end
  def get_embedded(acppos : Int32, rguidservice : Guid*, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_embedded.unsafe_as(Proc(Int32, Guid*, Guid*, IUnknown*, HRESULT)).call(acppos, rguidservice, riid, ppunk)
  end
  def query_insert_embedded(pguidservice : Guid*, pformatetc : FORMATETC*, pfinsertable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_insert_embedded.unsafe_as(Proc(Guid*, FORMATETC*, LibC::BOOL*, HRESULT)).call(pguidservice, pformatetc, pfinsertable)
  end
  def insert_embedded(dwflags : UInt32, acpstart : Int32, acpend : Int32, pdataobject : IDataObject, pchange : TS_TEXTCHANGE*) : HRESULT
    @lpVtbl.value.insert_embedded.unsafe_as(Proc(UInt32, Int32, Int32, IDataObject, TS_TEXTCHANGE*, HRESULT)).call(dwflags, acpstart, acpend, pdataobject, pchange)
  end
  def insert_text_at_selection(dwflags : UInt32, pchtext : Char*, cch : UInt32, pacpstart : Int32*, pacpend : Int32*, pchange : TS_TEXTCHANGE*) : HRESULT
    @lpVtbl.value.insert_text_at_selection.unsafe_as(Proc(UInt32, Char*, UInt32, Int32*, Int32*, TS_TEXTCHANGE*, HRESULT)).call(dwflags, pchtext, cch, pacpstart, pacpend, pchange)
  end
  def insert_embedded_at_selection(dwflags : UInt32, pdataobject : IDataObject, pacpstart : Int32*, pacpend : Int32*, pchange : TS_TEXTCHANGE*) : HRESULT
    @lpVtbl.value.insert_embedded_at_selection.unsafe_as(Proc(UInt32, IDataObject, Int32*, Int32*, TS_TEXTCHANGE*, HRESULT)).call(dwflags, pdataobject, pacpstart, pacpend, pchange)
  end
  def request_supported_attrs(dwflags : UInt32, cfilterattrs : UInt32, pafilterattrs : Guid*) : HRESULT
    @lpVtbl.value.request_supported_attrs.unsafe_as(Proc(UInt32, UInt32, Guid*, HRESULT)).call(dwflags, cfilterattrs, pafilterattrs)
  end
  def request_attrs_at_position(acppos : Int32, cfilterattrs : UInt32, pafilterattrs : Guid*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.request_attrs_at_position.unsafe_as(Proc(Int32, UInt32, Guid*, UInt32, HRESULT)).call(acppos, cfilterattrs, pafilterattrs, dwflags)
  end
  def request_attrs_transitioning_at_position(acppos : Int32, cfilterattrs : UInt32, pafilterattrs : Guid*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.request_attrs_transitioning_at_position.unsafe_as(Proc(Int32, UInt32, Guid*, UInt32, HRESULT)).call(acppos, cfilterattrs, pafilterattrs, dwflags)
  end
  def find_next_attr_transition(acpstart : Int32, acphalt : Int32, cfilterattrs : UInt32, pafilterattrs : Guid*, dwflags : UInt32, pacpnext : Int32*, pffound : LibC::BOOL*, plfoundoffset : Int32*) : HRESULT
    @lpVtbl.value.find_next_attr_transition.unsafe_as(Proc(Int32, Int32, UInt32, Guid*, UInt32, Int32*, LibC::BOOL*, Int32*, HRESULT)).call(acpstart, acphalt, cfilterattrs, pafilterattrs, dwflags, pacpnext, pffound, plfoundoffset)
  end
  def retrieve_requested_attrs(ulcount : UInt32, paattrvals : TS_ATTRVAL*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.retrieve_requested_attrs.unsafe_as(Proc(UInt32, TS_ATTRVAL*, UInt32*, HRESULT)).call(ulcount, paattrvals, pcfetched)
  end
  def get_end_acp(pacp : Int32*) : HRESULT
    @lpVtbl.value.get_end_acp.unsafe_as(Proc(Int32*, HRESULT)).call(pacp)
  end
  def get_active_view(pvcview : UInt32*) : HRESULT
    @lpVtbl.value.get_active_view.unsafe_as(Proc(UInt32*, HRESULT)).call(pvcview)
  end
  def get_acp_from_point(vcview : UInt32, ptscreen : POINT*, dwflags : UInt32, pacp : Int32*) : HRESULT
    @lpVtbl.value.get_acp_from_point.unsafe_as(Proc(UInt32, POINT*, UInt32, Int32*, HRESULT)).call(vcview, ptscreen, dwflags, pacp)
  end
  def get_text_ext(vcview : UInt32, acpstart : Int32, acpend : Int32, prc : RECT*, pfclipped : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_text_ext.unsafe_as(Proc(UInt32, Int32, Int32, RECT*, LibC::BOOL*, HRESULT)).call(vcview, acpstart, acpend, prc, pfclipped)
  end
  def get_screen_ext(vcview : UInt32, prc : RECT*) : HRESULT
    @lpVtbl.value.get_screen_ext.unsafe_as(Proc(UInt32, RECT*, HRESULT)).call(vcview, prc)
  end
end
struct LibWin32::ITextStoreACPSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_text_change(dwflags : TEXT_STORE_TEXT_CHANGE_FLAGS, pchange : TS_TEXTCHANGE*) : HRESULT
    @lpVtbl.value.on_text_change.unsafe_as(Proc(TEXT_STORE_TEXT_CHANGE_FLAGS, TS_TEXTCHANGE*, HRESULT)).call(dwflags, pchange)
  end
  def on_selection_change : HRESULT
    @lpVtbl.value.on_selection_change.unsafe_as(Proc(HRESULT)).call
  end
  def on_layout_change(lcode : TsLayoutCode, vcview : UInt32) : HRESULT
    @lpVtbl.value.on_layout_change.unsafe_as(Proc(TsLayoutCode, UInt32, HRESULT)).call(lcode, vcview)
  end
  def on_status_change(dwflags : UInt32) : HRESULT
    @lpVtbl.value.on_status_change.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def on_attrs_change(acpstart : Int32, acpend : Int32, cattrs : UInt32, paattrs : Guid*) : HRESULT
    @lpVtbl.value.on_attrs_change.unsafe_as(Proc(Int32, Int32, UInt32, Guid*, HRESULT)).call(acpstart, acpend, cattrs, paattrs)
  end
  def on_lock_granted(dwlockflags : TEXT_STORE_LOCK_FLAGS) : HRESULT
    @lpVtbl.value.on_lock_granted.unsafe_as(Proc(TEXT_STORE_LOCK_FLAGS, HRESULT)).call(dwlockflags)
  end
  def on_start_edit_transaction : HRESULT
    @lpVtbl.value.on_start_edit_transaction.unsafe_as(Proc(HRESULT)).call
  end
  def on_end_edit_transaction : HRESULT
    @lpVtbl.value.on_end_edit_transaction.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IAnchor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_gravity(gravity : TsGravity) : HRESULT
    @lpVtbl.value.set_gravity.unsafe_as(Proc(TsGravity, HRESULT)).call(gravity)
  end
  def get_gravity(pgravity : TsGravity*) : HRESULT
    @lpVtbl.value.get_gravity.unsafe_as(Proc(TsGravity*, HRESULT)).call(pgravity)
  end
  def is_equal(pawith : IAnchor, pfequal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_equal.unsafe_as(Proc(IAnchor, LibC::BOOL*, HRESULT)).call(pawith, pfequal)
  end
  def compare(pawith : IAnchor, plresult : Int32*) : HRESULT
    @lpVtbl.value.compare.unsafe_as(Proc(IAnchor, Int32*, HRESULT)).call(pawith, plresult)
  end
  def shift(dwflags : UInt32, cchreq : Int32, pcch : Int32*, pahaltanchor : IAnchor) : HRESULT
    @lpVtbl.value.shift.unsafe_as(Proc(UInt32, Int32, Int32*, IAnchor, HRESULT)).call(dwflags, cchreq, pcch, pahaltanchor)
  end
  def shift_to(pasite : IAnchor) : HRESULT
    @lpVtbl.value.shift_to.unsafe_as(Proc(IAnchor, HRESULT)).call(pasite)
  end
  def shift_region(dwflags : UInt32, dir : TsShiftDir, pfnoregion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.shift_region.unsafe_as(Proc(UInt32, TsShiftDir, LibC::BOOL*, HRESULT)).call(dwflags, dir, pfnoregion)
  end
  def set_change_history_mask(dwmask : UInt32) : HRESULT
    @lpVtbl.value.set_change_history_mask.unsafe_as(Proc(UInt32, HRESULT)).call(dwmask)
  end
  def get_change_history(pdwhistory : ANCHOR_CHANGE_HISTORY_FLAGS*) : HRESULT
    @lpVtbl.value.get_change_history.unsafe_as(Proc(ANCHOR_CHANGE_HISTORY_FLAGS*, HRESULT)).call(pdwhistory)
  end
  def clear_change_history : HRESULT
    @lpVtbl.value.clear_change_history.unsafe_as(Proc(HRESULT)).call
  end
  def clone(ppaclone : IAnchor*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IAnchor*, HRESULT)).call(ppaclone)
  end
end
struct LibWin32::ITextStoreAnchor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise_sink(riid : Guid*, punk : IUnknown, dwmask : UInt32) : HRESULT
    @lpVtbl.value.advise_sink.unsafe_as(Proc(Guid*, IUnknown, UInt32, HRESULT)).call(riid, punk, dwmask)
  end
  def unadvise_sink(punk : IUnknown) : HRESULT
    @lpVtbl.value.unadvise_sink.unsafe_as(Proc(IUnknown, HRESULT)).call(punk)
  end
  def request_lock(dwlockflags : UInt32, phrsession : HRESULT*) : HRESULT
    @lpVtbl.value.request_lock.unsafe_as(Proc(UInt32, HRESULT*, HRESULT)).call(dwlockflags, phrsession)
  end
  def get_status(pdcs : TS_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(TS_STATUS*, HRESULT)).call(pdcs)
  end
  def query_insert(pateststart : IAnchor, patestend : IAnchor, cch : UInt32, pparesultstart : IAnchor*, pparesultend : IAnchor*) : HRESULT
    @lpVtbl.value.query_insert.unsafe_as(Proc(IAnchor, IAnchor, UInt32, IAnchor*, IAnchor*, HRESULT)).call(pateststart, patestend, cch, pparesultstart, pparesultend)
  end
  def get_selection(ulindex : UInt32, ulcount : UInt32, pselection : TS_SELECTION_ANCHOR*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(UInt32, UInt32, TS_SELECTION_ANCHOR*, UInt32*, HRESULT)).call(ulindex, ulcount, pselection, pcfetched)
  end
  def set_selection(ulcount : UInt32, pselection : TS_SELECTION_ANCHOR*) : HRESULT
    @lpVtbl.value.set_selection.unsafe_as(Proc(UInt32, TS_SELECTION_ANCHOR*, HRESULT)).call(ulcount, pselection)
  end
  def get_text(dwflags : UInt32, pastart : IAnchor, paend : IAnchor, pchtext : Char*, cchreq : UInt32, pcch : UInt32*, fupdateanchor : LibC::BOOL) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt32, IAnchor, IAnchor, Char*, UInt32, UInt32*, LibC::BOOL, HRESULT)).call(dwflags, pastart, paend, pchtext, cchreq, pcch, fupdateanchor)
  end
  def set_text(dwflags : UInt32, pastart : IAnchor, paend : IAnchor, pchtext : Char*, cch : UInt32) : HRESULT
    @lpVtbl.value.set_text.unsafe_as(Proc(UInt32, IAnchor, IAnchor, Char*, UInt32, HRESULT)).call(dwflags, pastart, paend, pchtext, cch)
  end
  def get_formatted_text(pastart : IAnchor, paend : IAnchor, ppdataobject : IDataObject*) : HRESULT
    @lpVtbl.value.get_formatted_text.unsafe_as(Proc(IAnchor, IAnchor, IDataObject*, HRESULT)).call(pastart, paend, ppdataobject)
  end
  def get_embedded(dwflags : UInt32, papos : IAnchor, rguidservice : Guid*, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_embedded.unsafe_as(Proc(UInt32, IAnchor, Guid*, Guid*, IUnknown*, HRESULT)).call(dwflags, papos, rguidservice, riid, ppunk)
  end
  def insert_embedded(dwflags : UInt32, pastart : IAnchor, paend : IAnchor, pdataobject : IDataObject) : HRESULT
    @lpVtbl.value.insert_embedded.unsafe_as(Proc(UInt32, IAnchor, IAnchor, IDataObject, HRESULT)).call(dwflags, pastart, paend, pdataobject)
  end
  def request_supported_attrs(dwflags : UInt32, cfilterattrs : UInt32, pafilterattrs : Guid*) : HRESULT
    @lpVtbl.value.request_supported_attrs.unsafe_as(Proc(UInt32, UInt32, Guid*, HRESULT)).call(dwflags, cfilterattrs, pafilterattrs)
  end
  def request_attrs_at_position(papos : IAnchor, cfilterattrs : UInt32, pafilterattrs : Guid*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.request_attrs_at_position.unsafe_as(Proc(IAnchor, UInt32, Guid*, UInt32, HRESULT)).call(papos, cfilterattrs, pafilterattrs, dwflags)
  end
  def request_attrs_transitioning_at_position(papos : IAnchor, cfilterattrs : UInt32, pafilterattrs : Guid*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.request_attrs_transitioning_at_position.unsafe_as(Proc(IAnchor, UInt32, Guid*, UInt32, HRESULT)).call(papos, cfilterattrs, pafilterattrs, dwflags)
  end
  def find_next_attr_transition(pastart : IAnchor, pahalt : IAnchor, cfilterattrs : UInt32, pafilterattrs : Guid*, dwflags : UInt32, pffound : LibC::BOOL*, plfoundoffset : Int32*) : HRESULT
    @lpVtbl.value.find_next_attr_transition.unsafe_as(Proc(IAnchor, IAnchor, UInt32, Guid*, UInt32, LibC::BOOL*, Int32*, HRESULT)).call(pastart, pahalt, cfilterattrs, pafilterattrs, dwflags, pffound, plfoundoffset)
  end
  def retrieve_requested_attrs(ulcount : UInt32, paattrvals : TS_ATTRVAL*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.retrieve_requested_attrs.unsafe_as(Proc(UInt32, TS_ATTRVAL*, UInt32*, HRESULT)).call(ulcount, paattrvals, pcfetched)
  end
  def get_start(ppastart : IAnchor*) : HRESULT
    @lpVtbl.value.get_start.unsafe_as(Proc(IAnchor*, HRESULT)).call(ppastart)
  end
  def get_end(ppaend : IAnchor*) : HRESULT
    @lpVtbl.value.get_end.unsafe_as(Proc(IAnchor*, HRESULT)).call(ppaend)
  end
  def get_active_view(pvcview : UInt32*) : HRESULT
    @lpVtbl.value.get_active_view.unsafe_as(Proc(UInt32*, HRESULT)).call(pvcview)
  end
  def get_anchor_from_point(vcview : UInt32, ptscreen : POINT*, dwflags : UInt32, ppasite : IAnchor*) : HRESULT
    @lpVtbl.value.get_anchor_from_point.unsafe_as(Proc(UInt32, POINT*, UInt32, IAnchor*, HRESULT)).call(vcview, ptscreen, dwflags, ppasite)
  end
  def get_text_ext(vcview : UInt32, pastart : IAnchor, paend : IAnchor, prc : RECT*, pfclipped : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_text_ext.unsafe_as(Proc(UInt32, IAnchor, IAnchor, RECT*, LibC::BOOL*, HRESULT)).call(vcview, pastart, paend, prc, pfclipped)
  end
  def get_screen_ext(vcview : UInt32, prc : RECT*) : HRESULT
    @lpVtbl.value.get_screen_ext.unsafe_as(Proc(UInt32, RECT*, HRESULT)).call(vcview, prc)
  end
  def get_wnd(vcview : UInt32, phwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_wnd.unsafe_as(Proc(UInt32, HANDLE*, HRESULT)).call(vcview, phwnd)
  end
  def query_insert_embedded(pguidservice : Guid*, pformatetc : FORMATETC*, pfinsertable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_insert_embedded.unsafe_as(Proc(Guid*, FORMATETC*, LibC::BOOL*, HRESULT)).call(pguidservice, pformatetc, pfinsertable)
  end
  def insert_text_at_selection(dwflags : UInt32, pchtext : Char*, cch : UInt32, ppastart : IAnchor*, ppaend : IAnchor*) : HRESULT
    @lpVtbl.value.insert_text_at_selection.unsafe_as(Proc(UInt32, Char*, UInt32, IAnchor*, IAnchor*, HRESULT)).call(dwflags, pchtext, cch, ppastart, ppaend)
  end
  def insert_embedded_at_selection(dwflags : UInt32, pdataobject : IDataObject, ppastart : IAnchor*, ppaend : IAnchor*) : HRESULT
    @lpVtbl.value.insert_embedded_at_selection.unsafe_as(Proc(UInt32, IDataObject, IAnchor*, IAnchor*, HRESULT)).call(dwflags, pdataobject, ppastart, ppaend)
  end
end
struct LibWin32::ITextStoreAnchorSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_text_change(dwflags : TEXT_STORE_CHANGE_FLAGS, pastart : IAnchor, paend : IAnchor) : HRESULT
    @lpVtbl.value.on_text_change.unsafe_as(Proc(TEXT_STORE_CHANGE_FLAGS, IAnchor, IAnchor, HRESULT)).call(dwflags, pastart, paend)
  end
  def on_selection_change : HRESULT
    @lpVtbl.value.on_selection_change.unsafe_as(Proc(HRESULT)).call
  end
  def on_layout_change(lcode : TsLayoutCode, vcview : UInt32) : HRESULT
    @lpVtbl.value.on_layout_change.unsafe_as(Proc(TsLayoutCode, UInt32, HRESULT)).call(lcode, vcview)
  end
  def on_status_change(dwflags : UInt32) : HRESULT
    @lpVtbl.value.on_status_change.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def on_attrs_change(pastart : IAnchor, paend : IAnchor, cattrs : UInt32, paattrs : Guid*) : HRESULT
    @lpVtbl.value.on_attrs_change.unsafe_as(Proc(IAnchor, IAnchor, UInt32, Guid*, HRESULT)).call(pastart, paend, cattrs, paattrs)
  end
  def on_lock_granted(dwlockflags : TEXT_STORE_LOCK_FLAGS) : HRESULT
    @lpVtbl.value.on_lock_granted.unsafe_as(Proc(TEXT_STORE_LOCK_FLAGS, HRESULT)).call(dwlockflags)
  end
  def on_start_edit_transaction : HRESULT
    @lpVtbl.value.on_start_edit_transaction.unsafe_as(Proc(HRESULT)).call
  end
  def on_end_edit_transaction : HRESULT
    @lpVtbl.value.on_end_edit_transaction.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITfLangBarMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise_event_sink(psink : ITfLangBarEventSink, hwnd : LibC::HANDLE, dwflags : UInt32, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.advise_event_sink.unsafe_as(Proc(ITfLangBarEventSink, LibC::HANDLE, UInt32, UInt32*, HRESULT)).call(psink, hwnd, dwflags, pdwcookie)
  end
  def unadvise_event_sink(dwcookie : UInt32) : HRESULT
    @lpVtbl.value.unadvise_event_sink.unsafe_as(Proc(UInt32, HRESULT)).call(dwcookie)
  end
  def get_thread_marshal_interface(dwthreadid : UInt32, dwtype : UInt32, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_thread_marshal_interface.unsafe_as(Proc(UInt32, UInt32, Guid*, IUnknown*, HRESULT)).call(dwthreadid, dwtype, riid, ppunk)
  end
  def get_thread_lang_bar_item_mgr(dwthreadid : UInt32, pplbi : ITfLangBarItemMgr*, pdwthreadid : UInt32*) : HRESULT
    @lpVtbl.value.get_thread_lang_bar_item_mgr.unsafe_as(Proc(UInt32, ITfLangBarItemMgr*, UInt32*, HRESULT)).call(dwthreadid, pplbi, pdwthreadid)
  end
  def get_input_processor_profiles(dwthreadid : UInt32, ppaip : ITfInputProcessorProfiles*, pdwthreadid : UInt32*) : HRESULT
    @lpVtbl.value.get_input_processor_profiles.unsafe_as(Proc(UInt32, ITfInputProcessorProfiles*, UInt32*, HRESULT)).call(dwthreadid, ppaip, pdwthreadid)
  end
  def restore_last_focus(pdwthreadid : UInt32*, fprev : LibC::BOOL) : HRESULT
    @lpVtbl.value.restore_last_focus.unsafe_as(Proc(UInt32*, LibC::BOOL, HRESULT)).call(pdwthreadid, fprev)
  end
  def set_modal_input(psink : ITfLangBarEventSink, dwthreadid : UInt32, dwflags : UInt32) : HRESULT
    @lpVtbl.value.set_modal_input.unsafe_as(Proc(ITfLangBarEventSink, UInt32, UInt32, HRESULT)).call(psink, dwthreadid, dwflags)
  end
  def show_floating(dwflags : UInt32) : HRESULT
    @lpVtbl.value.show_floating.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def get_show_floating_status(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_show_floating_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
end
struct LibWin32::ITfLangBarEventSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_set_focus(dwthreadid : UInt32) : HRESULT
    @lpVtbl.value.on_set_focus.unsafe_as(Proc(UInt32, HRESULT)).call(dwthreadid)
  end
  def on_thread_terminate(dwthreadid : UInt32) : HRESULT
    @lpVtbl.value.on_thread_terminate.unsafe_as(Proc(UInt32, HRESULT)).call(dwthreadid)
  end
  def on_thread_item_change(dwthreadid : UInt32) : HRESULT
    @lpVtbl.value.on_thread_item_change.unsafe_as(Proc(UInt32, HRESULT)).call(dwthreadid)
  end
  def on_modal_input(dwthreadid : UInt32, umsg : UInt32, wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.on_modal_input.unsafe_as(Proc(UInt32, UInt32, LibC::UINT_PTR, LPARAM, HRESULT)).call(dwthreadid, umsg, wparam, lparam)
  end
  def show_floating(dwflags : UInt32) : HRESULT
    @lpVtbl.value.show_floating.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def get_item_floating_rect(dwthreadid : UInt32, rguid : Guid*, prc : RECT*) : HRESULT
    @lpVtbl.value.get_item_floating_rect.unsafe_as(Proc(UInt32, Guid*, RECT*, HRESULT)).call(dwthreadid, rguid, prc)
  end
end
struct LibWin32::ITfLangBarItemSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_update(dwflags : UInt32) : HRESULT
    @lpVtbl.value.on_update.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
end
struct LibWin32::IEnumTfLangBarItems
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumTfLangBarItems*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTfLangBarItems*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, ppitem : ITfLangBarItem*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ITfLangBarItem*, UInt32*, HRESULT)).call(ulcount, ppitem, pcfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfLangBarItemMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enum_items(ppenum : IEnumTfLangBarItems*) : HRESULT
    @lpVtbl.value.enum_items.unsafe_as(Proc(IEnumTfLangBarItems*, HRESULT)).call(ppenum)
  end
  def get_item(rguid : Guid*, ppitem : ITfLangBarItem*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Guid*, ITfLangBarItem*, HRESULT)).call(rguid, ppitem)
  end
  def add_item(punk : ITfLangBarItem) : HRESULT
    @lpVtbl.value.add_item.unsafe_as(Proc(ITfLangBarItem, HRESULT)).call(punk)
  end
  def remove_item(punk : ITfLangBarItem) : HRESULT
    @lpVtbl.value.remove_item.unsafe_as(Proc(ITfLangBarItem, HRESULT)).call(punk)
  end
  def advise_item_sink(punk : ITfLangBarItemSink, pdwcookie : UInt32*, rguiditem : Guid*) : HRESULT
    @lpVtbl.value.advise_item_sink.unsafe_as(Proc(ITfLangBarItemSink, UInt32*, Guid*, HRESULT)).call(punk, pdwcookie, rguiditem)
  end
  def unadvise_item_sink(dwcookie : UInt32) : HRESULT
    @lpVtbl.value.unadvise_item_sink.unsafe_as(Proc(UInt32, HRESULT)).call(dwcookie)
  end
  def get_item_floating_rect(dwthreadid : UInt32, rguid : Guid*, prc : RECT*) : HRESULT
    @lpVtbl.value.get_item_floating_rect.unsafe_as(Proc(UInt32, Guid*, RECT*, HRESULT)).call(dwthreadid, rguid, prc)
  end
  def get_items_status(ulcount : UInt32, prgguid : Guid*, pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_items_status.unsafe_as(Proc(UInt32, Guid*, UInt32*, HRESULT)).call(ulcount, prgguid, pdwstatus)
  end
  def get_item_num(pulcount : UInt32*) : HRESULT
    @lpVtbl.value.get_item_num.unsafe_as(Proc(UInt32*, HRESULT)).call(pulcount)
  end
  def get_items(ulcount : UInt32, ppitem : ITfLangBarItem*, pinfo : TF_LANGBARITEMINFO*, pdwstatus : UInt32*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.get_items.unsafe_as(Proc(UInt32, ITfLangBarItem*, TF_LANGBARITEMINFO*, UInt32*, UInt32*, HRESULT)).call(ulcount, ppitem, pinfo, pdwstatus, pcfetched)
  end
  def advise_items_sink(ulcount : UInt32, ppunk : ITfLangBarItemSink*, pguiditem : Guid*, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.advise_items_sink.unsafe_as(Proc(UInt32, ITfLangBarItemSink*, Guid*, UInt32*, HRESULT)).call(ulcount, ppunk, pguiditem, pdwcookie)
  end
  def unadvise_items_sink(ulcount : UInt32, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.unadvise_items_sink.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(ulcount, pdwcookie)
  end
end
struct LibWin32::ITfLangBarItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_info(pinfo : TF_LANGBARITEMINFO*) : HRESULT
    @lpVtbl.value.get_info.unsafe_as(Proc(TF_LANGBARITEMINFO*, HRESULT)).call(pinfo)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def show(fshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fshow)
  end
  def get_tooltip_string(pbstrtooltip : UInt8**) : HRESULT
    @lpVtbl.value.get_tooltip_string.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtooltip)
  end
end
struct LibWin32::ITfSystemLangBarItemSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def init_menu(pmenu : ITfMenu) : HRESULT
    @lpVtbl.value.init_menu.unsafe_as(Proc(ITfMenu, HRESULT)).call(pmenu)
  end
  def on_menu_select(wid : UInt32) : HRESULT
    @lpVtbl.value.on_menu_select.unsafe_as(Proc(UInt32, HRESULT)).call(wid)
  end
end
struct LibWin32::ITfSystemLangBarItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_icon(hicon : LibC::HANDLE) : HRESULT
    @lpVtbl.value.set_icon.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(hicon)
  end
  def set_tooltip_string(pchtooltip : Char*, cch : UInt32) : HRESULT
    @lpVtbl.value.set_tooltip_string.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pchtooltip, cch)
  end
end
struct LibWin32::ITfSystemLangBarItemText
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_item_text(pch : Char*, cch : UInt32) : HRESULT
    @lpVtbl.value.set_item_text.unsafe_as(Proc(Char*, UInt32, HRESULT)).call(pch, cch)
  end
  def get_item_text(pbstrtext : UInt8**) : HRESULT
    @lpVtbl.value.get_item_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtext)
  end
end
struct LibWin32::ITfSystemDeviceTypeLangBarItem
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_icon_mode(dwflags : LANG_BAR_ITEM_ICON_MODE_FLAGS) : HRESULT
    @lpVtbl.value.set_icon_mode.unsafe_as(Proc(LANG_BAR_ITEM_ICON_MODE_FLAGS, HRESULT)).call(dwflags)
  end
  def get_icon_mode(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_icon_mode.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
end
struct LibWin32::ITfLangBarItemButton
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_info(pinfo : TF_LANGBARITEMINFO*) : HRESULT
    @lpVtbl.value.get_info.unsafe_as(Proc(TF_LANGBARITEMINFO*, HRESULT)).call(pinfo)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def show(fshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fshow)
  end
  def get_tooltip_string(pbstrtooltip : UInt8**) : HRESULT
    @lpVtbl.value.get_tooltip_string.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtooltip)
  end
  def on_click(click : TfLBIClick, pt : POINT, prcarea : RECT*) : HRESULT
    @lpVtbl.value.on_click.unsafe_as(Proc(TfLBIClick, POINT, RECT*, HRESULT)).call(click, pt, prcarea)
  end
  def init_menu(pmenu : ITfMenu) : HRESULT
    @lpVtbl.value.init_menu.unsafe_as(Proc(ITfMenu, HRESULT)).call(pmenu)
  end
  def on_menu_select(wid : UInt32) : HRESULT
    @lpVtbl.value.on_menu_select.unsafe_as(Proc(UInt32, HRESULT)).call(wid)
  end
  def get_icon(phicon : HANDLE*) : HRESULT
    @lpVtbl.value.get_icon.unsafe_as(Proc(HANDLE*, HRESULT)).call(phicon)
  end
  def get_text(pbstrtext : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtext)
  end
end
struct LibWin32::ITfLangBarItemBitmapButton
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_info(pinfo : TF_LANGBARITEMINFO*) : HRESULT
    @lpVtbl.value.get_info.unsafe_as(Proc(TF_LANGBARITEMINFO*, HRESULT)).call(pinfo)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def show(fshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fshow)
  end
  def get_tooltip_string(pbstrtooltip : UInt8**) : HRESULT
    @lpVtbl.value.get_tooltip_string.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtooltip)
  end
  def on_click(click : TfLBIClick, pt : POINT, prcarea : RECT*) : HRESULT
    @lpVtbl.value.on_click.unsafe_as(Proc(TfLBIClick, POINT, RECT*, HRESULT)).call(click, pt, prcarea)
  end
  def init_menu(pmenu : ITfMenu) : HRESULT
    @lpVtbl.value.init_menu.unsafe_as(Proc(ITfMenu, HRESULT)).call(pmenu)
  end
  def on_menu_select(wid : UInt32) : HRESULT
    @lpVtbl.value.on_menu_select.unsafe_as(Proc(UInt32, HRESULT)).call(wid)
  end
  def get_preferred_size(pszdefault : SIZE*, psz : SIZE*) : HRESULT
    @lpVtbl.value.get_preferred_size.unsafe_as(Proc(SIZE*, SIZE*, HRESULT)).call(pszdefault, psz)
  end
  def draw_bitmap(bmwidth : Int32, bmheight : Int32, dwflags : UInt32, phbmp : HBITMAP*, phbmpmask : HBITMAP*) : HRESULT
    @lpVtbl.value.draw_bitmap.unsafe_as(Proc(Int32, Int32, UInt32, HBITMAP*, HBITMAP*, HRESULT)).call(bmwidth, bmheight, dwflags, phbmp, phbmpmask)
  end
  def get_text(pbstrtext : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtext)
  end
end
struct LibWin32::ITfLangBarItemBitmap
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_info(pinfo : TF_LANGBARITEMINFO*) : HRESULT
    @lpVtbl.value.get_info.unsafe_as(Proc(TF_LANGBARITEMINFO*, HRESULT)).call(pinfo)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def show(fshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fshow)
  end
  def get_tooltip_string(pbstrtooltip : UInt8**) : HRESULT
    @lpVtbl.value.get_tooltip_string.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtooltip)
  end
  def on_click(click : TfLBIClick, pt : POINT, prcarea : RECT*) : HRESULT
    @lpVtbl.value.on_click.unsafe_as(Proc(TfLBIClick, POINT, RECT*, HRESULT)).call(click, pt, prcarea)
  end
  def get_preferred_size(pszdefault : SIZE*, psz : SIZE*) : HRESULT
    @lpVtbl.value.get_preferred_size.unsafe_as(Proc(SIZE*, SIZE*, HRESULT)).call(pszdefault, psz)
  end
  def draw_bitmap(bmwidth : Int32, bmheight : Int32, dwflags : UInt32, phbmp : HBITMAP*, phbmpmask : HBITMAP*) : HRESULT
    @lpVtbl.value.draw_bitmap.unsafe_as(Proc(Int32, Int32, UInt32, HBITMAP*, HBITMAP*, HRESULT)).call(bmwidth, bmheight, dwflags, phbmp, phbmpmask)
  end
end
struct LibWin32::ITfLangBarItemBalloon
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_info(pinfo : TF_LANGBARITEMINFO*) : HRESULT
    @lpVtbl.value.get_info.unsafe_as(Proc(TF_LANGBARITEMINFO*, HRESULT)).call(pinfo)
  end
  def get_status(pdwstatus : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstatus)
  end
  def show(fshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fshow)
  end
  def get_tooltip_string(pbstrtooltip : UInt8**) : HRESULT
    @lpVtbl.value.get_tooltip_string.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrtooltip)
  end
  def on_click(click : TfLBIClick, pt : POINT, prcarea : RECT*) : HRESULT
    @lpVtbl.value.on_click.unsafe_as(Proc(TfLBIClick, POINT, RECT*, HRESULT)).call(click, pt, prcarea)
  end
  def get_preferred_size(pszdefault : SIZE*, psz : SIZE*) : HRESULT
    @lpVtbl.value.get_preferred_size.unsafe_as(Proc(SIZE*, SIZE*, HRESULT)).call(pszdefault, psz)
  end
  def get_balloon_info(pinfo : TF_LBBALLOONINFO*) : HRESULT
    @lpVtbl.value.get_balloon_info.unsafe_as(Proc(TF_LBBALLOONINFO*, HRESULT)).call(pinfo)
  end
end
struct LibWin32::ITfMenu
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_menu_item(uid : UInt32, dwflags : UInt32, hbmp : HBITMAP, hbmpmask : HBITMAP, pch : Char*, cch : UInt32, ppmenu : ITfMenu*) : HRESULT
    @lpVtbl.value.add_menu_item.unsafe_as(Proc(UInt32, UInt32, HBITMAP, HBITMAP, Char*, UInt32, ITfMenu*, HRESULT)).call(uid, dwflags, hbmp, hbmpmask, pch, cch, ppmenu)
  end
end
struct LibWin32::ITfThreadMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def activate(ptid : UInt32*) : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(UInt32*, HRESULT)).call(ptid)
  end
  def deactivate : HRESULT
    @lpVtbl.value.deactivate.unsafe_as(Proc(HRESULT)).call
  end
  def create_document_mgr(ppdim : ITfDocumentMgr*) : HRESULT
    @lpVtbl.value.create_document_mgr.unsafe_as(Proc(ITfDocumentMgr*, HRESULT)).call(ppdim)
  end
  def enum_document_mgrs(ppenum : IEnumTfDocumentMgrs*) : HRESULT
    @lpVtbl.value.enum_document_mgrs.unsafe_as(Proc(IEnumTfDocumentMgrs*, HRESULT)).call(ppenum)
  end
  def get_focus(ppdimfocus : ITfDocumentMgr*) : HRESULT
    @lpVtbl.value.get_focus.unsafe_as(Proc(ITfDocumentMgr*, HRESULT)).call(ppdimfocus)
  end
  def set_focus(pdimfocus : ITfDocumentMgr) : HRESULT
    @lpVtbl.value.set_focus.unsafe_as(Proc(ITfDocumentMgr, HRESULT)).call(pdimfocus)
  end
  def associate_focus(hwnd : LibC::HANDLE, pdimnew : ITfDocumentMgr, ppdimprev : ITfDocumentMgr*) : HRESULT
    @lpVtbl.value.associate_focus.unsafe_as(Proc(LibC::HANDLE, ITfDocumentMgr, ITfDocumentMgr*, HRESULT)).call(hwnd, pdimnew, ppdimprev)
  end
  def is_thread_focus(pfthreadfocus : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_thread_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfthreadfocus)
  end
  def get_function_provider(clsid : Guid*, ppfuncprov : ITfFunctionProvider*) : HRESULT
    @lpVtbl.value.get_function_provider.unsafe_as(Proc(Guid*, ITfFunctionProvider*, HRESULT)).call(clsid, ppfuncprov)
  end
  def enum_function_providers(ppenum : IEnumTfFunctionProviders*) : HRESULT
    @lpVtbl.value.enum_function_providers.unsafe_as(Proc(IEnumTfFunctionProviders*, HRESULT)).call(ppenum)
  end
  def get_global_compartment(ppcompmgr : ITfCompartmentMgr*) : HRESULT
    @lpVtbl.value.get_global_compartment.unsafe_as(Proc(ITfCompartmentMgr*, HRESULT)).call(ppcompmgr)
  end
end
struct LibWin32::ITfThreadMgrEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def activate(ptid : UInt32*) : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(UInt32*, HRESULT)).call(ptid)
  end
  def deactivate : HRESULT
    @lpVtbl.value.deactivate.unsafe_as(Proc(HRESULT)).call
  end
  def create_document_mgr(ppdim : ITfDocumentMgr*) : HRESULT
    @lpVtbl.value.create_document_mgr.unsafe_as(Proc(ITfDocumentMgr*, HRESULT)).call(ppdim)
  end
  def enum_document_mgrs(ppenum : IEnumTfDocumentMgrs*) : HRESULT
    @lpVtbl.value.enum_document_mgrs.unsafe_as(Proc(IEnumTfDocumentMgrs*, HRESULT)).call(ppenum)
  end
  def get_focus(ppdimfocus : ITfDocumentMgr*) : HRESULT
    @lpVtbl.value.get_focus.unsafe_as(Proc(ITfDocumentMgr*, HRESULT)).call(ppdimfocus)
  end
  def set_focus(pdimfocus : ITfDocumentMgr) : HRESULT
    @lpVtbl.value.set_focus.unsafe_as(Proc(ITfDocumentMgr, HRESULT)).call(pdimfocus)
  end
  def associate_focus(hwnd : LibC::HANDLE, pdimnew : ITfDocumentMgr, ppdimprev : ITfDocumentMgr*) : HRESULT
    @lpVtbl.value.associate_focus.unsafe_as(Proc(LibC::HANDLE, ITfDocumentMgr, ITfDocumentMgr*, HRESULT)).call(hwnd, pdimnew, ppdimprev)
  end
  def is_thread_focus(pfthreadfocus : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_thread_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfthreadfocus)
  end
  def get_function_provider(clsid : Guid*, ppfuncprov : ITfFunctionProvider*) : HRESULT
    @lpVtbl.value.get_function_provider.unsafe_as(Proc(Guid*, ITfFunctionProvider*, HRESULT)).call(clsid, ppfuncprov)
  end
  def enum_function_providers(ppenum : IEnumTfFunctionProviders*) : HRESULT
    @lpVtbl.value.enum_function_providers.unsafe_as(Proc(IEnumTfFunctionProviders*, HRESULT)).call(ppenum)
  end
  def get_global_compartment(ppcompmgr : ITfCompartmentMgr*) : HRESULT
    @lpVtbl.value.get_global_compartment.unsafe_as(Proc(ITfCompartmentMgr*, HRESULT)).call(ppcompmgr)
  end
  def activate_ex(ptid : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.activate_ex.unsafe_as(Proc(UInt32*, UInt32, HRESULT)).call(ptid, dwflags)
  end
  def get_active_flags(lpdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_active_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(lpdwflags)
  end
end
struct LibWin32::ITfThreadMgr2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def activate(ptid : UInt32*) : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(UInt32*, HRESULT)).call(ptid)
  end
  def deactivate : HRESULT
    @lpVtbl.value.deactivate.unsafe_as(Proc(HRESULT)).call
  end
  def create_document_mgr(ppdim : ITfDocumentMgr*) : HRESULT
    @lpVtbl.value.create_document_mgr.unsafe_as(Proc(ITfDocumentMgr*, HRESULT)).call(ppdim)
  end
  def enum_document_mgrs(ppenum : IEnumTfDocumentMgrs*) : HRESULT
    @lpVtbl.value.enum_document_mgrs.unsafe_as(Proc(IEnumTfDocumentMgrs*, HRESULT)).call(ppenum)
  end
  def get_focus(ppdimfocus : ITfDocumentMgr*) : HRESULT
    @lpVtbl.value.get_focus.unsafe_as(Proc(ITfDocumentMgr*, HRESULT)).call(ppdimfocus)
  end
  def set_focus(pdimfocus : ITfDocumentMgr) : HRESULT
    @lpVtbl.value.set_focus.unsafe_as(Proc(ITfDocumentMgr, HRESULT)).call(pdimfocus)
  end
  def is_thread_focus(pfthreadfocus : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_thread_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfthreadfocus)
  end
  def get_function_provider(clsid : Guid*, ppfuncprov : ITfFunctionProvider*) : HRESULT
    @lpVtbl.value.get_function_provider.unsafe_as(Proc(Guid*, ITfFunctionProvider*, HRESULT)).call(clsid, ppfuncprov)
  end
  def enum_function_providers(ppenum : IEnumTfFunctionProviders*) : HRESULT
    @lpVtbl.value.enum_function_providers.unsafe_as(Proc(IEnumTfFunctionProviders*, HRESULT)).call(ppenum)
  end
  def get_global_compartment(ppcompmgr : ITfCompartmentMgr*) : HRESULT
    @lpVtbl.value.get_global_compartment.unsafe_as(Proc(ITfCompartmentMgr*, HRESULT)).call(ppcompmgr)
  end
  def activate_ex(ptid : UInt32*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.activate_ex.unsafe_as(Proc(UInt32*, UInt32, HRESULT)).call(ptid, dwflags)
  end
  def get_active_flags(lpdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_active_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(lpdwflags)
  end
  def suspend_keystroke_handling : HRESULT
    @lpVtbl.value.suspend_keystroke_handling.unsafe_as(Proc(HRESULT)).call
  end
  def resume_keystroke_handling : HRESULT
    @lpVtbl.value.resume_keystroke_handling.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITfThreadMgrEventSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_init_document_mgr(pdim : ITfDocumentMgr) : HRESULT
    @lpVtbl.value.on_init_document_mgr.unsafe_as(Proc(ITfDocumentMgr, HRESULT)).call(pdim)
  end
  def on_uninit_document_mgr(pdim : ITfDocumentMgr) : HRESULT
    @lpVtbl.value.on_uninit_document_mgr.unsafe_as(Proc(ITfDocumentMgr, HRESULT)).call(pdim)
  end
  def on_set_focus(pdimfocus : ITfDocumentMgr, pdimprevfocus : ITfDocumentMgr) : HRESULT
    @lpVtbl.value.on_set_focus.unsafe_as(Proc(ITfDocumentMgr, ITfDocumentMgr, HRESULT)).call(pdimfocus, pdimprevfocus)
  end
  def on_push_context(pic : ITfContext) : HRESULT
    @lpVtbl.value.on_push_context.unsafe_as(Proc(ITfContext, HRESULT)).call(pic)
  end
  def on_pop_context(pic : ITfContext) : HRESULT
    @lpVtbl.value.on_pop_context.unsafe_as(Proc(ITfContext, HRESULT)).call(pic)
  end
end
struct LibWin32::ITfConfigureSystemKeystrokeFeed
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def disable_system_keystroke_feed : HRESULT
    @lpVtbl.value.disable_system_keystroke_feed.unsafe_as(Proc(HRESULT)).call
  end
  def enable_system_keystroke_feed : HRESULT
    @lpVtbl.value.enable_system_keystroke_feed.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IEnumTfDocumentMgrs
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumTfDocumentMgrs*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTfDocumentMgrs*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, rgdocumentmgr : ITfDocumentMgr*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ITfDocumentMgr*, UInt32*, HRESULT)).call(ulcount, rgdocumentmgr, pcfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfDocumentMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_context(tidowner : UInt32, dwflags : UInt32, punk : IUnknown, ppic : ITfContext*, pectextstore : UInt32*) : HRESULT
    @lpVtbl.value.create_context.unsafe_as(Proc(UInt32, UInt32, IUnknown, ITfContext*, UInt32*, HRESULT)).call(tidowner, dwflags, punk, ppic, pectextstore)
  end
  def push(pic : ITfContext) : HRESULT
    @lpVtbl.value.push.unsafe_as(Proc(ITfContext, HRESULT)).call(pic)
  end
  def pop(dwflags : UInt32) : HRESULT
    @lpVtbl.value.pop.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def get_top(ppic : ITfContext*) : HRESULT
    @lpVtbl.value.get_top.unsafe_as(Proc(ITfContext*, HRESULT)).call(ppic)
  end
  def get_base(ppic : ITfContext*) : HRESULT
    @lpVtbl.value.get_base.unsafe_as(Proc(ITfContext*, HRESULT)).call(ppic)
  end
  def enum_contexts(ppenum : IEnumTfContexts*) : HRESULT
    @lpVtbl.value.enum_contexts.unsafe_as(Proc(IEnumTfContexts*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IEnumTfContexts
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumTfContexts*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTfContexts*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, rgcontext : ITfContext*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ITfContext*, UInt32*, HRESULT)).call(ulcount, rgcontext, pcfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfCompositionView
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_owner_clsid(pclsid : Guid*) : HRESULT
    @lpVtbl.value.get_owner_clsid.unsafe_as(Proc(Guid*, HRESULT)).call(pclsid)
  end
  def get_range(pprange : ITfRange*) : HRESULT
    @lpVtbl.value.get_range.unsafe_as(Proc(ITfRange*, HRESULT)).call(pprange)
  end
end
struct LibWin32::IEnumITfCompositionView
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumITfCompositionView*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumITfCompositionView*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, rgcompositionview : ITfCompositionView*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ITfCompositionView*, UInt32*, HRESULT)).call(ulcount, rgcompositionview, pcfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfComposition
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_range(pprange : ITfRange*) : HRESULT
    @lpVtbl.value.get_range.unsafe_as(Proc(ITfRange*, HRESULT)).call(pprange)
  end
  def shift_start(ecwrite : UInt32, pnewstart : ITfRange) : HRESULT
    @lpVtbl.value.shift_start.unsafe_as(Proc(UInt32, ITfRange, HRESULT)).call(ecwrite, pnewstart)
  end
  def shift_end(ecwrite : UInt32, pnewend : ITfRange) : HRESULT
    @lpVtbl.value.shift_end.unsafe_as(Proc(UInt32, ITfRange, HRESULT)).call(ecwrite, pnewend)
  end
  def end_composition(ecwrite : UInt32) : HRESULT
    @lpVtbl.value.end_composition.unsafe_as(Proc(UInt32, HRESULT)).call(ecwrite)
  end
end
struct LibWin32::ITfCompositionSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_composition_terminated(ecwrite : UInt32, pcomposition : ITfComposition) : HRESULT
    @lpVtbl.value.on_composition_terminated.unsafe_as(Proc(UInt32, ITfComposition, HRESULT)).call(ecwrite, pcomposition)
  end
end
struct LibWin32::ITfContextComposition
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def start_composition(ecwrite : UInt32, pcompositionrange : ITfRange, psink : ITfCompositionSink, ppcomposition : ITfComposition*) : HRESULT
    @lpVtbl.value.start_composition.unsafe_as(Proc(UInt32, ITfRange, ITfCompositionSink, ITfComposition*, HRESULT)).call(ecwrite, pcompositionrange, psink, ppcomposition)
  end
  def enum_compositions(ppenum : IEnumITfCompositionView*) : HRESULT
    @lpVtbl.value.enum_compositions.unsafe_as(Proc(IEnumITfCompositionView*, HRESULT)).call(ppenum)
  end
  def find_composition(ecread : UInt32, ptestrange : ITfRange, ppenum : IEnumITfCompositionView*) : HRESULT
    @lpVtbl.value.find_composition.unsafe_as(Proc(UInt32, ITfRange, IEnumITfCompositionView*, HRESULT)).call(ecread, ptestrange, ppenum)
  end
  def take_ownership(ecwrite : UInt32, pcomposition : ITfCompositionView, psink : ITfCompositionSink, ppcomposition : ITfComposition*) : HRESULT
    @lpVtbl.value.take_ownership.unsafe_as(Proc(UInt32, ITfCompositionView, ITfCompositionSink, ITfComposition*, HRESULT)).call(ecwrite, pcomposition, psink, ppcomposition)
  end
end
struct LibWin32::ITfContextOwnerCompositionServices
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def start_composition(ecwrite : UInt32, pcompositionrange : ITfRange, psink : ITfCompositionSink, ppcomposition : ITfComposition*) : HRESULT
    @lpVtbl.value.start_composition.unsafe_as(Proc(UInt32, ITfRange, ITfCompositionSink, ITfComposition*, HRESULT)).call(ecwrite, pcompositionrange, psink, ppcomposition)
  end
  def enum_compositions(ppenum : IEnumITfCompositionView*) : HRESULT
    @lpVtbl.value.enum_compositions.unsafe_as(Proc(IEnumITfCompositionView*, HRESULT)).call(ppenum)
  end
  def find_composition(ecread : UInt32, ptestrange : ITfRange, ppenum : IEnumITfCompositionView*) : HRESULT
    @lpVtbl.value.find_composition.unsafe_as(Proc(UInt32, ITfRange, IEnumITfCompositionView*, HRESULT)).call(ecread, ptestrange, ppenum)
  end
  def take_ownership(ecwrite : UInt32, pcomposition : ITfCompositionView, psink : ITfCompositionSink, ppcomposition : ITfComposition*) : HRESULT
    @lpVtbl.value.take_ownership.unsafe_as(Proc(UInt32, ITfCompositionView, ITfCompositionSink, ITfComposition*, HRESULT)).call(ecwrite, pcomposition, psink, ppcomposition)
  end
  def terminate_composition(pcomposition : ITfCompositionView) : HRESULT
    @lpVtbl.value.terminate_composition.unsafe_as(Proc(ITfCompositionView, HRESULT)).call(pcomposition)
  end
end
struct LibWin32::ITfContextOwnerCompositionSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_start_composition(pcomposition : ITfCompositionView, pfok : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_start_composition.unsafe_as(Proc(ITfCompositionView, LibC::BOOL*, HRESULT)).call(pcomposition, pfok)
  end
  def on_update_composition(pcomposition : ITfCompositionView, prangenew : ITfRange) : HRESULT
    @lpVtbl.value.on_update_composition.unsafe_as(Proc(ITfCompositionView, ITfRange, HRESULT)).call(pcomposition, prangenew)
  end
  def on_end_composition(pcomposition : ITfCompositionView) : HRESULT
    @lpVtbl.value.on_end_composition.unsafe_as(Proc(ITfCompositionView, HRESULT)).call(pcomposition)
  end
end
struct LibWin32::ITfContextView
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_range_from_point(ec : UInt32, ppt : POINT*, dwflags : UInt32, pprange : ITfRange*) : HRESULT
    @lpVtbl.value.get_range_from_point.unsafe_as(Proc(UInt32, POINT*, UInt32, ITfRange*, HRESULT)).call(ec, ppt, dwflags, pprange)
  end
  def get_text_ext(ec : UInt32, prange : ITfRange, prc : RECT*, pfclipped : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_text_ext.unsafe_as(Proc(UInt32, ITfRange, RECT*, LibC::BOOL*, HRESULT)).call(ec, prange, prc, pfclipped)
  end
  def get_screen_ext(prc : RECT*) : HRESULT
    @lpVtbl.value.get_screen_ext.unsafe_as(Proc(RECT*, HRESULT)).call(prc)
  end
  def get_wnd(phwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_wnd.unsafe_as(Proc(HANDLE*, HRESULT)).call(phwnd)
  end
end
struct LibWin32::IEnumTfContextViews
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumTfContextViews*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTfContextViews*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, rgviews : ITfContextView*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ITfContextView*, UInt32*, HRESULT)).call(ulcount, rgviews, pcfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfContext
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def request_edit_session(tid : UInt32, pes : ITfEditSession, dwflags : TF_CONTEXT_EDIT_CONTEXT_FLAGS, phrsession : HRESULT*) : HRESULT
    @lpVtbl.value.request_edit_session.unsafe_as(Proc(UInt32, ITfEditSession, TF_CONTEXT_EDIT_CONTEXT_FLAGS, HRESULT*, HRESULT)).call(tid, pes, dwflags, phrsession)
  end
  def in_write_session(tid : UInt32, pfwritesession : LibC::BOOL*) : HRESULT
    @lpVtbl.value.in_write_session.unsafe_as(Proc(UInt32, LibC::BOOL*, HRESULT)).call(tid, pfwritesession)
  end
  def get_selection(ec : UInt32, ulindex : UInt32, ulcount : UInt32, pselection : TF_SELECTION*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(UInt32, UInt32, UInt32, TF_SELECTION*, UInt32*, HRESULT)).call(ec, ulindex, ulcount, pselection, pcfetched)
  end
  def set_selection(ec : UInt32, ulcount : UInt32, pselection : TF_SELECTION*) : HRESULT
    @lpVtbl.value.set_selection.unsafe_as(Proc(UInt32, UInt32, TF_SELECTION*, HRESULT)).call(ec, ulcount, pselection)
  end
  def get_start(ec : UInt32, ppstart : ITfRange*) : HRESULT
    @lpVtbl.value.get_start.unsafe_as(Proc(UInt32, ITfRange*, HRESULT)).call(ec, ppstart)
  end
  def get_end(ec : UInt32, ppend : ITfRange*) : HRESULT
    @lpVtbl.value.get_end.unsafe_as(Proc(UInt32, ITfRange*, HRESULT)).call(ec, ppend)
  end
  def get_active_view(ppview : ITfContextView*) : HRESULT
    @lpVtbl.value.get_active_view.unsafe_as(Proc(ITfContextView*, HRESULT)).call(ppview)
  end
  def enum_views(ppenum : IEnumTfContextViews*) : HRESULT
    @lpVtbl.value.enum_views.unsafe_as(Proc(IEnumTfContextViews*, HRESULT)).call(ppenum)
  end
  def get_status(pdcs : TS_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(TS_STATUS*, HRESULT)).call(pdcs)
  end
  def get_property(guidprop : Guid*, ppprop : ITfProperty*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(Guid*, ITfProperty*, HRESULT)).call(guidprop, ppprop)
  end
  def get_app_property(guidprop : Guid*, ppprop : ITfReadOnlyProperty*) : HRESULT
    @lpVtbl.value.get_app_property.unsafe_as(Proc(Guid*, ITfReadOnlyProperty*, HRESULT)).call(guidprop, ppprop)
  end
  def track_properties(prgprop : Guid**, cprop : UInt32, prgappprop : Guid**, cappprop : UInt32, ppproperty : ITfReadOnlyProperty*) : HRESULT
    @lpVtbl.value.track_properties.unsafe_as(Proc(Guid**, UInt32, Guid**, UInt32, ITfReadOnlyProperty*, HRESULT)).call(prgprop, cprop, prgappprop, cappprop, ppproperty)
  end
  def enum_properties(ppenum : IEnumTfProperties*) : HRESULT
    @lpVtbl.value.enum_properties.unsafe_as(Proc(IEnumTfProperties*, HRESULT)).call(ppenum)
  end
  def get_document_mgr(ppdm : ITfDocumentMgr*) : HRESULT
    @lpVtbl.value.get_document_mgr.unsafe_as(Proc(ITfDocumentMgr*, HRESULT)).call(ppdm)
  end
  def create_range_backup(ec : UInt32, prange : ITfRange, ppbackup : ITfRangeBackup*) : HRESULT
    @lpVtbl.value.create_range_backup.unsafe_as(Proc(UInt32, ITfRange, ITfRangeBackup*, HRESULT)).call(ec, prange, ppbackup)
  end
end
struct LibWin32::ITfQueryEmbedded
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def query_insert_embedded(pguidservice : Guid*, pformatetc : FORMATETC*, pfinsertable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_insert_embedded.unsafe_as(Proc(Guid*, FORMATETC*, LibC::BOOL*, HRESULT)).call(pguidservice, pformatetc, pfinsertable)
  end
end
struct LibWin32::ITfInsertAtSelection
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def insert_text_at_selection(ec : UInt32, dwflags : INSERT_TEXT_AT_SELECTION_FLAGS, pchtext : Char*, cch : Int32, pprange : ITfRange*) : HRESULT
    @lpVtbl.value.insert_text_at_selection.unsafe_as(Proc(UInt32, INSERT_TEXT_AT_SELECTION_FLAGS, Char*, Int32, ITfRange*, HRESULT)).call(ec, dwflags, pchtext, cch, pprange)
  end
  def insert_embedded_at_selection(ec : UInt32, dwflags : UInt32, pdataobject : IDataObject, pprange : ITfRange*) : HRESULT
    @lpVtbl.value.insert_embedded_at_selection.unsafe_as(Proc(UInt32, UInt32, IDataObject, ITfRange*, HRESULT)).call(ec, dwflags, pdataobject, pprange)
  end
end
struct LibWin32::ITfCleanupContextSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_cleanup_context(ecwrite : UInt32, pic : ITfContext) : HRESULT
    @lpVtbl.value.on_cleanup_context.unsafe_as(Proc(UInt32, ITfContext, HRESULT)).call(ecwrite, pic)
  end
end
struct LibWin32::ITfCleanupContextDurationSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_start_cleanup_context : HRESULT
    @lpVtbl.value.on_start_cleanup_context.unsafe_as(Proc(HRESULT)).call
  end
  def on_end_cleanup_context : HRESULT
    @lpVtbl.value.on_end_cleanup_context.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITfReadOnlyProperty
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def enum_ranges(ec : UInt32, ppenum : IEnumTfRanges*, ptargetrange : ITfRange) : HRESULT
    @lpVtbl.value.enum_ranges.unsafe_as(Proc(UInt32, IEnumTfRanges*, ITfRange, HRESULT)).call(ec, ppenum, ptargetrange)
  end
  def get_value(ec : UInt32, prange : ITfRange, pvarvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(UInt32, ITfRange, VARIANT*, HRESULT)).call(ec, prange, pvarvalue)
  end
  def get_context(ppcontext : ITfContext*) : HRESULT
    @lpVtbl.value.get_context.unsafe_as(Proc(ITfContext*, HRESULT)).call(ppcontext)
  end
end
struct LibWin32::IEnumTfPropertyValue
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumTfPropertyValue*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTfPropertyValue*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, rgvalues : TF_PROPERTYVAL*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, TF_PROPERTYVAL*, UInt32*, HRESULT)).call(ulcount, rgvalues, pcfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfMouseTracker
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise_mouse_sink(range : ITfRange, psink : ITfMouseSink, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.advise_mouse_sink.unsafe_as(Proc(ITfRange, ITfMouseSink, UInt32*, HRESULT)).call(range, psink, pdwcookie)
  end
  def unadvise_mouse_sink(dwcookie : UInt32) : HRESULT
    @lpVtbl.value.unadvise_mouse_sink.unsafe_as(Proc(UInt32, HRESULT)).call(dwcookie)
  end
end
struct LibWin32::ITfMouseTrackerACP
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise_mouse_sink(range : ITfRangeACP, psink : ITfMouseSink, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.advise_mouse_sink.unsafe_as(Proc(ITfRangeACP, ITfMouseSink, UInt32*, HRESULT)).call(range, psink, pdwcookie)
  end
  def unadvise_mouse_sink(dwcookie : UInt32) : HRESULT
    @lpVtbl.value.unadvise_mouse_sink.unsafe_as(Proc(UInt32, HRESULT)).call(dwcookie)
  end
end
struct LibWin32::ITfMouseSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_mouse_event(uedge : UInt32, uquadrant : UInt32, dwbtnstatus : UInt32, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_mouse_event.unsafe_as(Proc(UInt32, UInt32, UInt32, LibC::BOOL*, HRESULT)).call(uedge, uquadrant, dwbtnstatus, pfeaten)
  end
end
struct LibWin32::ITfEditRecord
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_selection_status(pfchanged : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_selection_status.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfchanged)
  end
  def get_text_and_property_updates(dwflags : GET_TEXT_AND_PROPERTY_UPDATES_FLAGS, prgproperties : Guid**, cproperties : UInt32, ppenum : IEnumTfRanges*) : HRESULT
    @lpVtbl.value.get_text_and_property_updates.unsafe_as(Proc(GET_TEXT_AND_PROPERTY_UPDATES_FLAGS, Guid**, UInt32, IEnumTfRanges*, HRESULT)).call(dwflags, prgproperties, cproperties, ppenum)
  end
end
struct LibWin32::ITfTextEditSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_end_edit(pic : ITfContext, ecreadonly : UInt32, peditrecord : ITfEditRecord) : HRESULT
    @lpVtbl.value.on_end_edit.unsafe_as(Proc(ITfContext, UInt32, ITfEditRecord, HRESULT)).call(pic, ecreadonly, peditrecord)
  end
end
struct LibWin32::ITfTextLayoutSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_layout_change(pic : ITfContext, lcode : TfLayoutCode, pview : ITfContextView) : HRESULT
    @lpVtbl.value.on_layout_change.unsafe_as(Proc(ITfContext, TfLayoutCode, ITfContextView, HRESULT)).call(pic, lcode, pview)
  end
end
struct LibWin32::ITfStatusSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_status_change(pic : ITfContext, dwflags : UInt32) : HRESULT
    @lpVtbl.value.on_status_change.unsafe_as(Proc(ITfContext, UInt32, HRESULT)).call(pic, dwflags)
  end
end
struct LibWin32::ITfEditTransactionSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_start_edit_transaction(pic : ITfContext) : HRESULT
    @lpVtbl.value.on_start_edit_transaction.unsafe_as(Proc(ITfContext, HRESULT)).call(pic)
  end
  def on_end_edit_transaction(pic : ITfContext) : HRESULT
    @lpVtbl.value.on_end_edit_transaction.unsafe_as(Proc(ITfContext, HRESULT)).call(pic)
  end
end
struct LibWin32::ITfContextOwner
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_acp_from_point(ptscreen : POINT*, dwflags : UInt32, pacp : Int32*) : HRESULT
    @lpVtbl.value.get_acp_from_point.unsafe_as(Proc(POINT*, UInt32, Int32*, HRESULT)).call(ptscreen, dwflags, pacp)
  end
  def get_text_ext(acpstart : Int32, acpend : Int32, prc : RECT*, pfclipped : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_text_ext.unsafe_as(Proc(Int32, Int32, RECT*, LibC::BOOL*, HRESULT)).call(acpstart, acpend, prc, pfclipped)
  end
  def get_screen_ext(prc : RECT*) : HRESULT
    @lpVtbl.value.get_screen_ext.unsafe_as(Proc(RECT*, HRESULT)).call(prc)
  end
  def get_status(pdcs : TS_STATUS*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(TS_STATUS*, HRESULT)).call(pdcs)
  end
  def get_wnd(phwnd : HANDLE*) : HRESULT
    @lpVtbl.value.get_wnd.unsafe_as(Proc(HANDLE*, HRESULT)).call(phwnd)
  end
  def get_attribute(rguidattribute : Guid*, pvarvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute.unsafe_as(Proc(Guid*, VARIANT*, HRESULT)).call(rguidattribute, pvarvalue)
  end
end
struct LibWin32::ITfContextOwnerServices
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_layout_change : HRESULT
    @lpVtbl.value.on_layout_change.unsafe_as(Proc(HRESULT)).call
  end
  def on_status_change(dwflags : UInt32) : HRESULT
    @lpVtbl.value.on_status_change.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def on_attribute_change(rguidattribute : Guid*) : HRESULT
    @lpVtbl.value.on_attribute_change.unsafe_as(Proc(Guid*, HRESULT)).call(rguidattribute)
  end
  def serialize(pprop : ITfProperty, prange : ITfRange, phdr : TF_PERSISTENT_PROPERTY_HEADER_ACP*, pstream : IStream) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(ITfProperty, ITfRange, TF_PERSISTENT_PROPERTY_HEADER_ACP*, IStream, HRESULT)).call(pprop, prange, phdr, pstream)
  end
  def unserialize(pprop : ITfProperty, phdr : TF_PERSISTENT_PROPERTY_HEADER_ACP*, pstream : IStream, ploader : ITfPersistentPropertyLoaderACP) : HRESULT
    @lpVtbl.value.unserialize.unsafe_as(Proc(ITfProperty, TF_PERSISTENT_PROPERTY_HEADER_ACP*, IStream, ITfPersistentPropertyLoaderACP, HRESULT)).call(pprop, phdr, pstream, ploader)
  end
  def force_load_property(pprop : ITfProperty) : HRESULT
    @lpVtbl.value.force_load_property.unsafe_as(Proc(ITfProperty, HRESULT)).call(pprop)
  end
  def create_range(acpstart : Int32, acpend : Int32, pprange : ITfRangeACP*) : HRESULT
    @lpVtbl.value.create_range.unsafe_as(Proc(Int32, Int32, ITfRangeACP*, HRESULT)).call(acpstart, acpend, pprange)
  end
end
struct LibWin32::ITfContextKeyEventSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_key_down(wparam : LibC::UINT_PTR, lparam : LPARAM, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_key_down.unsafe_as(Proc(LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(wparam, lparam, pfeaten)
  end
  def on_key_up(wparam : LibC::UINT_PTR, lparam : LPARAM, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_key_up.unsafe_as(Proc(LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(wparam, lparam, pfeaten)
  end
  def on_test_key_down(wparam : LibC::UINT_PTR, lparam : LPARAM, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_test_key_down.unsafe_as(Proc(LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(wparam, lparam, pfeaten)
  end
  def on_test_key_up(wparam : LibC::UINT_PTR, lparam : LPARAM, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_test_key_up.unsafe_as(Proc(LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(wparam, lparam, pfeaten)
  end
end
struct LibWin32::ITfEditSession
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def do_edit_session(ec : UInt32) : HRESULT
    @lpVtbl.value.do_edit_session.unsafe_as(Proc(UInt32, HRESULT)).call(ec)
  end
end
struct LibWin32::ITfRange
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_text(ec : UInt32, dwflags : UInt32, pchtext : Char*, cchmax : UInt32, pcch : UInt32*) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt32, UInt32, Char*, UInt32, UInt32*, HRESULT)).call(ec, dwflags, pchtext, cchmax, pcch)
  end
  def set_text(ec : UInt32, dwflags : UInt32, pchtext : Char*, cch : Int32) : HRESULT
    @lpVtbl.value.set_text.unsafe_as(Proc(UInt32, UInt32, Char*, Int32, HRESULT)).call(ec, dwflags, pchtext, cch)
  end
  def get_formatted_text(ec : UInt32, ppdataobject : IDataObject*) : HRESULT
    @lpVtbl.value.get_formatted_text.unsafe_as(Proc(UInt32, IDataObject*, HRESULT)).call(ec, ppdataobject)
  end
  def get_embedded(ec : UInt32, rguidservice : Guid*, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_embedded.unsafe_as(Proc(UInt32, Guid*, Guid*, IUnknown*, HRESULT)).call(ec, rguidservice, riid, ppunk)
  end
  def insert_embedded(ec : UInt32, dwflags : UInt32, pdataobject : IDataObject) : HRESULT
    @lpVtbl.value.insert_embedded.unsafe_as(Proc(UInt32, UInt32, IDataObject, HRESULT)).call(ec, dwflags, pdataobject)
  end
  def shift_start(ec : UInt32, cchreq : Int32, pcch : Int32*, phalt : TF_HALTCOND*) : HRESULT
    @lpVtbl.value.shift_start.unsafe_as(Proc(UInt32, Int32, Int32*, TF_HALTCOND*, HRESULT)).call(ec, cchreq, pcch, phalt)
  end
  def shift_end(ec : UInt32, cchreq : Int32, pcch : Int32*, phalt : TF_HALTCOND*) : HRESULT
    @lpVtbl.value.shift_end.unsafe_as(Proc(UInt32, Int32, Int32*, TF_HALTCOND*, HRESULT)).call(ec, cchreq, pcch, phalt)
  end
  def shift_start_to_range(ec : UInt32, prange : ITfRange, apos : TfAnchor) : HRESULT
    @lpVtbl.value.shift_start_to_range.unsafe_as(Proc(UInt32, ITfRange, TfAnchor, HRESULT)).call(ec, prange, apos)
  end
  def shift_end_to_range(ec : UInt32, prange : ITfRange, apos : TfAnchor) : HRESULT
    @lpVtbl.value.shift_end_to_range.unsafe_as(Proc(UInt32, ITfRange, TfAnchor, HRESULT)).call(ec, prange, apos)
  end
  def shift_start_region(ec : UInt32, dir : TfShiftDir, pfnoregion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.shift_start_region.unsafe_as(Proc(UInt32, TfShiftDir, LibC::BOOL*, HRESULT)).call(ec, dir, pfnoregion)
  end
  def shift_end_region(ec : UInt32, dir : TfShiftDir, pfnoregion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.shift_end_region.unsafe_as(Proc(UInt32, TfShiftDir, LibC::BOOL*, HRESULT)).call(ec, dir, pfnoregion)
  end
  def is_empty(ec : UInt32, pfempty : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_empty.unsafe_as(Proc(UInt32, LibC::BOOL*, HRESULT)).call(ec, pfempty)
  end
  def collapse(ec : UInt32, apos : TfAnchor) : HRESULT
    @lpVtbl.value.collapse.unsafe_as(Proc(UInt32, TfAnchor, HRESULT)).call(ec, apos)
  end
  def is_equal_start(ec : UInt32, pwith : ITfRange, apos : TfAnchor, pfequal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_equal_start.unsafe_as(Proc(UInt32, ITfRange, TfAnchor, LibC::BOOL*, HRESULT)).call(ec, pwith, apos, pfequal)
  end
  def is_equal_end(ec : UInt32, pwith : ITfRange, apos : TfAnchor, pfequal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_equal_end.unsafe_as(Proc(UInt32, ITfRange, TfAnchor, LibC::BOOL*, HRESULT)).call(ec, pwith, apos, pfequal)
  end
  def compare_start(ec : UInt32, pwith : ITfRange, apos : TfAnchor, plresult : Int32*) : HRESULT
    @lpVtbl.value.compare_start.unsafe_as(Proc(UInt32, ITfRange, TfAnchor, Int32*, HRESULT)).call(ec, pwith, apos, plresult)
  end
  def compare_end(ec : UInt32, pwith : ITfRange, apos : TfAnchor, plresult : Int32*) : HRESULT
    @lpVtbl.value.compare_end.unsafe_as(Proc(UInt32, ITfRange, TfAnchor, Int32*, HRESULT)).call(ec, pwith, apos, plresult)
  end
  def adjust_for_insert(ec : UInt32, cchinsert : UInt32, pfinsertok : LibC::BOOL*) : HRESULT
    @lpVtbl.value.adjust_for_insert.unsafe_as(Proc(UInt32, UInt32, LibC::BOOL*, HRESULT)).call(ec, cchinsert, pfinsertok)
  end
  def get_gravity(pgstart : TfGravity*, pgend : TfGravity*) : HRESULT
    @lpVtbl.value.get_gravity.unsafe_as(Proc(TfGravity*, TfGravity*, HRESULT)).call(pgstart, pgend)
  end
  def set_gravity(ec : UInt32, gstart : TfGravity, gend : TfGravity) : HRESULT
    @lpVtbl.value.set_gravity.unsafe_as(Proc(UInt32, TfGravity, TfGravity, HRESULT)).call(ec, gstart, gend)
  end
  def clone(ppclone : ITfRange*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(ITfRange*, HRESULT)).call(ppclone)
  end
  def get_context(ppcontext : ITfContext*) : HRESULT
    @lpVtbl.value.get_context.unsafe_as(Proc(ITfContext*, HRESULT)).call(ppcontext)
  end
end
struct LibWin32::ITfRangeACP
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_text(ec : UInt32, dwflags : UInt32, pchtext : Char*, cchmax : UInt32, pcch : UInt32*) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(UInt32, UInt32, Char*, UInt32, UInt32*, HRESULT)).call(ec, dwflags, pchtext, cchmax, pcch)
  end
  def set_text(ec : UInt32, dwflags : UInt32, pchtext : Char*, cch : Int32) : HRESULT
    @lpVtbl.value.set_text.unsafe_as(Proc(UInt32, UInt32, Char*, Int32, HRESULT)).call(ec, dwflags, pchtext, cch)
  end
  def get_formatted_text(ec : UInt32, ppdataobject : IDataObject*) : HRESULT
    @lpVtbl.value.get_formatted_text.unsafe_as(Proc(UInt32, IDataObject*, HRESULT)).call(ec, ppdataobject)
  end
  def get_embedded(ec : UInt32, rguidservice : Guid*, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_embedded.unsafe_as(Proc(UInt32, Guid*, Guid*, IUnknown*, HRESULT)).call(ec, rguidservice, riid, ppunk)
  end
  def insert_embedded(ec : UInt32, dwflags : UInt32, pdataobject : IDataObject) : HRESULT
    @lpVtbl.value.insert_embedded.unsafe_as(Proc(UInt32, UInt32, IDataObject, HRESULT)).call(ec, dwflags, pdataobject)
  end
  def shift_start(ec : UInt32, cchreq : Int32, pcch : Int32*, phalt : TF_HALTCOND*) : HRESULT
    @lpVtbl.value.shift_start.unsafe_as(Proc(UInt32, Int32, Int32*, TF_HALTCOND*, HRESULT)).call(ec, cchreq, pcch, phalt)
  end
  def shift_end(ec : UInt32, cchreq : Int32, pcch : Int32*, phalt : TF_HALTCOND*) : HRESULT
    @lpVtbl.value.shift_end.unsafe_as(Proc(UInt32, Int32, Int32*, TF_HALTCOND*, HRESULT)).call(ec, cchreq, pcch, phalt)
  end
  def shift_start_to_range(ec : UInt32, prange : ITfRange, apos : TfAnchor) : HRESULT
    @lpVtbl.value.shift_start_to_range.unsafe_as(Proc(UInt32, ITfRange, TfAnchor, HRESULT)).call(ec, prange, apos)
  end
  def shift_end_to_range(ec : UInt32, prange : ITfRange, apos : TfAnchor) : HRESULT
    @lpVtbl.value.shift_end_to_range.unsafe_as(Proc(UInt32, ITfRange, TfAnchor, HRESULT)).call(ec, prange, apos)
  end
  def shift_start_region(ec : UInt32, dir : TfShiftDir, pfnoregion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.shift_start_region.unsafe_as(Proc(UInt32, TfShiftDir, LibC::BOOL*, HRESULT)).call(ec, dir, pfnoregion)
  end
  def shift_end_region(ec : UInt32, dir : TfShiftDir, pfnoregion : LibC::BOOL*) : HRESULT
    @lpVtbl.value.shift_end_region.unsafe_as(Proc(UInt32, TfShiftDir, LibC::BOOL*, HRESULT)).call(ec, dir, pfnoregion)
  end
  def is_empty(ec : UInt32, pfempty : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_empty.unsafe_as(Proc(UInt32, LibC::BOOL*, HRESULT)).call(ec, pfempty)
  end
  def collapse(ec : UInt32, apos : TfAnchor) : HRESULT
    @lpVtbl.value.collapse.unsafe_as(Proc(UInt32, TfAnchor, HRESULT)).call(ec, apos)
  end
  def is_equal_start(ec : UInt32, pwith : ITfRange, apos : TfAnchor, pfequal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_equal_start.unsafe_as(Proc(UInt32, ITfRange, TfAnchor, LibC::BOOL*, HRESULT)).call(ec, pwith, apos, pfequal)
  end
  def is_equal_end(ec : UInt32, pwith : ITfRange, apos : TfAnchor, pfequal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_equal_end.unsafe_as(Proc(UInt32, ITfRange, TfAnchor, LibC::BOOL*, HRESULT)).call(ec, pwith, apos, pfequal)
  end
  def compare_start(ec : UInt32, pwith : ITfRange, apos : TfAnchor, plresult : Int32*) : HRESULT
    @lpVtbl.value.compare_start.unsafe_as(Proc(UInt32, ITfRange, TfAnchor, Int32*, HRESULT)).call(ec, pwith, apos, plresult)
  end
  def compare_end(ec : UInt32, pwith : ITfRange, apos : TfAnchor, plresult : Int32*) : HRESULT
    @lpVtbl.value.compare_end.unsafe_as(Proc(UInt32, ITfRange, TfAnchor, Int32*, HRESULT)).call(ec, pwith, apos, plresult)
  end
  def adjust_for_insert(ec : UInt32, cchinsert : UInt32, pfinsertok : LibC::BOOL*) : HRESULT
    @lpVtbl.value.adjust_for_insert.unsafe_as(Proc(UInt32, UInt32, LibC::BOOL*, HRESULT)).call(ec, cchinsert, pfinsertok)
  end
  def get_gravity(pgstart : TfGravity*, pgend : TfGravity*) : HRESULT
    @lpVtbl.value.get_gravity.unsafe_as(Proc(TfGravity*, TfGravity*, HRESULT)).call(pgstart, pgend)
  end
  def set_gravity(ec : UInt32, gstart : TfGravity, gend : TfGravity) : HRESULT
    @lpVtbl.value.set_gravity.unsafe_as(Proc(UInt32, TfGravity, TfGravity, HRESULT)).call(ec, gstart, gend)
  end
  def clone(ppclone : ITfRange*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(ITfRange*, HRESULT)).call(ppclone)
  end
  def get_context(ppcontext : ITfContext*) : HRESULT
    @lpVtbl.value.get_context.unsafe_as(Proc(ITfContext*, HRESULT)).call(ppcontext)
  end
  def get_extent(pacpanchor : Int32*, pcch : Int32*) : HRESULT
    @lpVtbl.value.get_extent.unsafe_as(Proc(Int32*, Int32*, HRESULT)).call(pacpanchor, pcch)
  end
  def set_extent(acpanchor : Int32, cch : Int32) : HRESULT
    @lpVtbl.value.set_extent.unsafe_as(Proc(Int32, Int32, HRESULT)).call(acpanchor, cch)
  end
end
struct LibWin32::ITextStoreACPServices
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def serialize(pprop : ITfProperty, prange : ITfRange, phdr : TF_PERSISTENT_PROPERTY_HEADER_ACP*, pstream : IStream) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(ITfProperty, ITfRange, TF_PERSISTENT_PROPERTY_HEADER_ACP*, IStream, HRESULT)).call(pprop, prange, phdr, pstream)
  end
  def unserialize(pprop : ITfProperty, phdr : TF_PERSISTENT_PROPERTY_HEADER_ACP*, pstream : IStream, ploader : ITfPersistentPropertyLoaderACP) : HRESULT
    @lpVtbl.value.unserialize.unsafe_as(Proc(ITfProperty, TF_PERSISTENT_PROPERTY_HEADER_ACP*, IStream, ITfPersistentPropertyLoaderACP, HRESULT)).call(pprop, phdr, pstream, ploader)
  end
  def force_load_property(pprop : ITfProperty) : HRESULT
    @lpVtbl.value.force_load_property.unsafe_as(Proc(ITfProperty, HRESULT)).call(pprop)
  end
  def create_range(acpstart : Int32, acpend : Int32, pprange : ITfRangeACP*) : HRESULT
    @lpVtbl.value.create_range.unsafe_as(Proc(Int32, Int32, ITfRangeACP*, HRESULT)).call(acpstart, acpend, pprange)
  end
end
struct LibWin32::ITfRangeBackup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def restore(ec : UInt32, prange : ITfRange) : HRESULT
    @lpVtbl.value.restore.unsafe_as(Proc(UInt32, ITfRange, HRESULT)).call(ec, prange)
  end
end
struct LibWin32::ITfPropertyStore
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def get_data_type(pdwreserved : UInt32*) : HRESULT
    @lpVtbl.value.get_data_type.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwreserved)
  end
  def get_data(pvarvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_data.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarvalue)
  end
  def on_text_updated(dwflags : UInt32, prangenew : ITfRange, pfaccept : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_text_updated.unsafe_as(Proc(UInt32, ITfRange, LibC::BOOL*, HRESULT)).call(dwflags, prangenew, pfaccept)
  end
  def shrink(prangenew : ITfRange, pffree : LibC::BOOL*) : HRESULT
    @lpVtbl.value.shrink.unsafe_as(Proc(ITfRange, LibC::BOOL*, HRESULT)).call(prangenew, pffree)
  end
  def divide(prangethis : ITfRange, prangenew : ITfRange, pppropstore : ITfPropertyStore*) : HRESULT
    @lpVtbl.value.divide.unsafe_as(Proc(ITfRange, ITfRange, ITfPropertyStore*, HRESULT)).call(prangethis, prangenew, pppropstore)
  end
  def clone(ppropstore : ITfPropertyStore*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(ITfPropertyStore*, HRESULT)).call(ppropstore)
  end
  def get_property_range_creator(pclsid : Guid*) : HRESULT
    @lpVtbl.value.get_property_range_creator.unsafe_as(Proc(Guid*, HRESULT)).call(pclsid)
  end
  def serialize(pstream : IStream, pcb : UInt32*) : HRESULT
    @lpVtbl.value.serialize.unsafe_as(Proc(IStream, UInt32*, HRESULT)).call(pstream, pcb)
  end
end
struct LibWin32::IEnumTfRanges
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumTfRanges*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTfRanges*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, pprange : ITfRange*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ITfRange*, UInt32*, HRESULT)).call(ulcount, pprange, pcfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfCreatePropertyStore
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def is_store_serializable(guidprop : Guid*, prange : ITfRange, ppropstore : ITfPropertyStore, pfserializable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_store_serializable.unsafe_as(Proc(Guid*, ITfRange, ITfPropertyStore, LibC::BOOL*, HRESULT)).call(guidprop, prange, ppropstore, pfserializable)
  end
  def create_property_store(guidprop : Guid*, prange : ITfRange, cb : UInt32, pstream : IStream, ppstore : ITfPropertyStore*) : HRESULT
    @lpVtbl.value.create_property_store.unsafe_as(Proc(Guid*, ITfRange, UInt32, IStream, ITfPropertyStore*, HRESULT)).call(guidprop, prange, cb, pstream, ppstore)
  end
end
struct LibWin32::ITfPersistentPropertyLoaderACP
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def load_property(phdr : TF_PERSISTENT_PROPERTY_HEADER_ACP*, ppstream : IStream*) : HRESULT
    @lpVtbl.value.load_property.unsafe_as(Proc(TF_PERSISTENT_PROPERTY_HEADER_ACP*, IStream*, HRESULT)).call(phdr, ppstream)
  end
end
struct LibWin32::ITfProperty
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def enum_ranges(ec : UInt32, ppenum : IEnumTfRanges*, ptargetrange : ITfRange) : HRESULT
    @lpVtbl.value.enum_ranges.unsafe_as(Proc(UInt32, IEnumTfRanges*, ITfRange, HRESULT)).call(ec, ppenum, ptargetrange)
  end
  def get_value(ec : UInt32, prange : ITfRange, pvarvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(UInt32, ITfRange, VARIANT*, HRESULT)).call(ec, prange, pvarvalue)
  end
  def get_context(ppcontext : ITfContext*) : HRESULT
    @lpVtbl.value.get_context.unsafe_as(Proc(ITfContext*, HRESULT)).call(ppcontext)
  end
  def find_range(ec : UInt32, prange : ITfRange, pprange : ITfRange*, apos : TfAnchor) : HRESULT
    @lpVtbl.value.find_range.unsafe_as(Proc(UInt32, ITfRange, ITfRange*, TfAnchor, HRESULT)).call(ec, prange, pprange, apos)
  end
  def set_value_store(ec : UInt32, prange : ITfRange, ppropstore : ITfPropertyStore) : HRESULT
    @lpVtbl.value.set_value_store.unsafe_as(Proc(UInt32, ITfRange, ITfPropertyStore, HRESULT)).call(ec, prange, ppropstore)
  end
  def set_value(ec : UInt32, prange : ITfRange, pvarvalue : VARIANT*) : HRESULT
    @lpVtbl.value.set_value.unsafe_as(Proc(UInt32, ITfRange, VARIANT*, HRESULT)).call(ec, prange, pvarvalue)
  end
  def clear(ec : UInt32, prange : ITfRange) : HRESULT
    @lpVtbl.value.clear.unsafe_as(Proc(UInt32, ITfRange, HRESULT)).call(ec, prange)
  end
end
struct LibWin32::IEnumTfProperties
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumTfProperties*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTfProperties*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, ppprop : ITfProperty*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ITfProperty*, UInt32*, HRESULT)).call(ulcount, ppprop, pcfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfCompartment
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_value(tid : UInt32, pvarvalue : VARIANT*) : HRESULT
    @lpVtbl.value.set_value.unsafe_as(Proc(UInt32, VARIANT*, HRESULT)).call(tid, pvarvalue)
  end
  def get_value(pvarvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarvalue)
  end
end
struct LibWin32::ITfCompartmentEventSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_change(rguid : Guid*) : HRESULT
    @lpVtbl.value.on_change.unsafe_as(Proc(Guid*, HRESULT)).call(rguid)
  end
end
struct LibWin32::ITfCompartmentMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_compartment(rguid : Guid*, ppcomp : ITfCompartment*) : HRESULT
    @lpVtbl.value.get_compartment.unsafe_as(Proc(Guid*, ITfCompartment*, HRESULT)).call(rguid, ppcomp)
  end
  def clear_compartment(tid : UInt32, rguid : Guid*) : HRESULT
    @lpVtbl.value.clear_compartment.unsafe_as(Proc(UInt32, Guid*, HRESULT)).call(tid, rguid)
  end
  def enum_compartments(ppenum : IEnumGUID*) : HRESULT
    @lpVtbl.value.enum_compartments.unsafe_as(Proc(IEnumGUID*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::ITfFunction
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
end
struct LibWin32::ITfFunctionProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_type.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def get_description(pbstrdesc : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdesc)
  end
  def get_function(rguid : Guid*, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_function.unsafe_as(Proc(Guid*, Guid*, IUnknown*, HRESULT)).call(rguid, riid, ppunk)
  end
end
struct LibWin32::IEnumTfFunctionProviders
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumTfFunctionProviders*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTfFunctionProviders*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, ppcmdobj : ITfFunctionProvider*, pcfetch : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ITfFunctionProvider*, UInt32*, HRESULT)).call(ulcount, ppcmdobj, pcfetch)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfInputProcessorProfiles
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register(rclsid : Guid*) : HRESULT
    @lpVtbl.value.register.unsafe_as(Proc(Guid*, HRESULT)).call(rclsid)
  end
  def unregister(rclsid : Guid*) : HRESULT
    @lpVtbl.value.unregister.unsafe_as(Proc(Guid*, HRESULT)).call(rclsid)
  end
  def add_language_profile(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, pchdesc : Char*, cchdesc : UInt32, pchiconfile : Char*, cchfile : UInt32, uiconindex : UInt32) : HRESULT
    @lpVtbl.value.add_language_profile.unsafe_as(Proc(Guid*, UInt16, Guid*, Char*, UInt32, Char*, UInt32, UInt32, HRESULT)).call(rclsid, langid, guidprofile, pchdesc, cchdesc, pchiconfile, cchfile, uiconindex)
  end
  def remove_language_profile(rclsid : Guid*, langid : UInt16, guidprofile : Guid*) : HRESULT
    @lpVtbl.value.remove_language_profile.unsafe_as(Proc(Guid*, UInt16, Guid*, HRESULT)).call(rclsid, langid, guidprofile)
  end
  def enum_input_processor_info(ppenum : IEnumGUID*) : HRESULT
    @lpVtbl.value.enum_input_processor_info.unsafe_as(Proc(IEnumGUID*, HRESULT)).call(ppenum)
  end
  def get_default_language_profile(langid : UInt16, catid : Guid*, pclsid : Guid*, pguidprofile : Guid*) : HRESULT
    @lpVtbl.value.get_default_language_profile.unsafe_as(Proc(UInt16, Guid*, Guid*, Guid*, HRESULT)).call(langid, catid, pclsid, pguidprofile)
  end
  def set_default_language_profile(langid : UInt16, rclsid : Guid*, guidprofiles : Guid*) : HRESULT
    @lpVtbl.value.set_default_language_profile.unsafe_as(Proc(UInt16, Guid*, Guid*, HRESULT)).call(langid, rclsid, guidprofiles)
  end
  def activate_language_profile(rclsid : Guid*, langid : UInt16, guidprofiles : Guid*) : HRESULT
    @lpVtbl.value.activate_language_profile.unsafe_as(Proc(Guid*, UInt16, Guid*, HRESULT)).call(rclsid, langid, guidprofiles)
  end
  def get_active_language_profile(rclsid : Guid*, plangid : UInt16*, pguidprofile : Guid*) : HRESULT
    @lpVtbl.value.get_active_language_profile.unsafe_as(Proc(Guid*, UInt16*, Guid*, HRESULT)).call(rclsid, plangid, pguidprofile)
  end
  def get_language_profile_description(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, pbstrprofile : UInt8**) : HRESULT
    @lpVtbl.value.get_language_profile_description.unsafe_as(Proc(Guid*, UInt16, Guid*, UInt8**, HRESULT)).call(rclsid, langid, guidprofile, pbstrprofile)
  end
  def get_current_language(plangid : UInt16*) : HRESULT
    @lpVtbl.value.get_current_language.unsafe_as(Proc(UInt16*, HRESULT)).call(plangid)
  end
  def change_current_language(langid : UInt16) : HRESULT
    @lpVtbl.value.change_current_language.unsafe_as(Proc(UInt16, HRESULT)).call(langid)
  end
  def get_language_list(pplangid : UInt16**, pulcount : UInt32*) : HRESULT
    @lpVtbl.value.get_language_list.unsafe_as(Proc(UInt16**, UInt32*, HRESULT)).call(pplangid, pulcount)
  end
  def enum_language_profiles(langid : UInt16, ppenum : IEnumTfLanguageProfiles*) : HRESULT
    @lpVtbl.value.enum_language_profiles.unsafe_as(Proc(UInt16, IEnumTfLanguageProfiles*, HRESULT)).call(langid, ppenum)
  end
  def enable_language_profile(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable_language_profile.unsafe_as(Proc(Guid*, UInt16, Guid*, LibC::BOOL, HRESULT)).call(rclsid, langid, guidprofile, fenable)
  end
  def is_enabled_language_profile(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, pfenable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_enabled_language_profile.unsafe_as(Proc(Guid*, UInt16, Guid*, LibC::BOOL*, HRESULT)).call(rclsid, langid, guidprofile, pfenable)
  end
  def enable_language_profile_by_default(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable_language_profile_by_default.unsafe_as(Proc(Guid*, UInt16, Guid*, LibC::BOOL, HRESULT)).call(rclsid, langid, guidprofile, fenable)
  end
  def substitute_keyboard_layout(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, hkl : HKL) : HRESULT
    @lpVtbl.value.substitute_keyboard_layout.unsafe_as(Proc(Guid*, UInt16, Guid*, HKL, HRESULT)).call(rclsid, langid, guidprofile, hkl)
  end
end
struct LibWin32::ITfInputProcessorProfilesEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register(rclsid : Guid*) : HRESULT
    @lpVtbl.value.register.unsafe_as(Proc(Guid*, HRESULT)).call(rclsid)
  end
  def unregister(rclsid : Guid*) : HRESULT
    @lpVtbl.value.unregister.unsafe_as(Proc(Guid*, HRESULT)).call(rclsid)
  end
  def add_language_profile(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, pchdesc : Char*, cchdesc : UInt32, pchiconfile : Char*, cchfile : UInt32, uiconindex : UInt32) : HRESULT
    @lpVtbl.value.add_language_profile.unsafe_as(Proc(Guid*, UInt16, Guid*, Char*, UInt32, Char*, UInt32, UInt32, HRESULT)).call(rclsid, langid, guidprofile, pchdesc, cchdesc, pchiconfile, cchfile, uiconindex)
  end
  def remove_language_profile(rclsid : Guid*, langid : UInt16, guidprofile : Guid*) : HRESULT
    @lpVtbl.value.remove_language_profile.unsafe_as(Proc(Guid*, UInt16, Guid*, HRESULT)).call(rclsid, langid, guidprofile)
  end
  def enum_input_processor_info(ppenum : IEnumGUID*) : HRESULT
    @lpVtbl.value.enum_input_processor_info.unsafe_as(Proc(IEnumGUID*, HRESULT)).call(ppenum)
  end
  def get_default_language_profile(langid : UInt16, catid : Guid*, pclsid : Guid*, pguidprofile : Guid*) : HRESULT
    @lpVtbl.value.get_default_language_profile.unsafe_as(Proc(UInt16, Guid*, Guid*, Guid*, HRESULT)).call(langid, catid, pclsid, pguidprofile)
  end
  def set_default_language_profile(langid : UInt16, rclsid : Guid*, guidprofiles : Guid*) : HRESULT
    @lpVtbl.value.set_default_language_profile.unsafe_as(Proc(UInt16, Guid*, Guid*, HRESULT)).call(langid, rclsid, guidprofiles)
  end
  def activate_language_profile(rclsid : Guid*, langid : UInt16, guidprofiles : Guid*) : HRESULT
    @lpVtbl.value.activate_language_profile.unsafe_as(Proc(Guid*, UInt16, Guid*, HRESULT)).call(rclsid, langid, guidprofiles)
  end
  def get_active_language_profile(rclsid : Guid*, plangid : UInt16*, pguidprofile : Guid*) : HRESULT
    @lpVtbl.value.get_active_language_profile.unsafe_as(Proc(Guid*, UInt16*, Guid*, HRESULT)).call(rclsid, plangid, pguidprofile)
  end
  def get_language_profile_description(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, pbstrprofile : UInt8**) : HRESULT
    @lpVtbl.value.get_language_profile_description.unsafe_as(Proc(Guid*, UInt16, Guid*, UInt8**, HRESULT)).call(rclsid, langid, guidprofile, pbstrprofile)
  end
  def get_current_language(plangid : UInt16*) : HRESULT
    @lpVtbl.value.get_current_language.unsafe_as(Proc(UInt16*, HRESULT)).call(plangid)
  end
  def change_current_language(langid : UInt16) : HRESULT
    @lpVtbl.value.change_current_language.unsafe_as(Proc(UInt16, HRESULT)).call(langid)
  end
  def get_language_list(pplangid : UInt16**, pulcount : UInt32*) : HRESULT
    @lpVtbl.value.get_language_list.unsafe_as(Proc(UInt16**, UInt32*, HRESULT)).call(pplangid, pulcount)
  end
  def enum_language_profiles(langid : UInt16, ppenum : IEnumTfLanguageProfiles*) : HRESULT
    @lpVtbl.value.enum_language_profiles.unsafe_as(Proc(UInt16, IEnumTfLanguageProfiles*, HRESULT)).call(langid, ppenum)
  end
  def enable_language_profile(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable_language_profile.unsafe_as(Proc(Guid*, UInt16, Guid*, LibC::BOOL, HRESULT)).call(rclsid, langid, guidprofile, fenable)
  end
  def is_enabled_language_profile(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, pfenable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_enabled_language_profile.unsafe_as(Proc(Guid*, UInt16, Guid*, LibC::BOOL*, HRESULT)).call(rclsid, langid, guidprofile, pfenable)
  end
  def enable_language_profile_by_default(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, fenable : LibC::BOOL) : HRESULT
    @lpVtbl.value.enable_language_profile_by_default.unsafe_as(Proc(Guid*, UInt16, Guid*, LibC::BOOL, HRESULT)).call(rclsid, langid, guidprofile, fenable)
  end
  def substitute_keyboard_layout(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, hkl : HKL) : HRESULT
    @lpVtbl.value.substitute_keyboard_layout.unsafe_as(Proc(Guid*, UInt16, Guid*, HKL, HRESULT)).call(rclsid, langid, guidprofile, hkl)
  end
  def set_language_profile_display_name(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, pchfile : Char*, cchfile : UInt32, uresid : UInt32) : HRESULT
    @lpVtbl.value.set_language_profile_display_name.unsafe_as(Proc(Guid*, UInt16, Guid*, Char*, UInt32, UInt32, HRESULT)).call(rclsid, langid, guidprofile, pchfile, cchfile, uresid)
  end
end
struct LibWin32::ITfInputProcessorProfileSubstituteLayout
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_substitute_keyboard_layout(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, phkl : HKL*) : HRESULT
    @lpVtbl.value.get_substitute_keyboard_layout.unsafe_as(Proc(Guid*, UInt16, Guid*, HKL*, HRESULT)).call(rclsid, langid, guidprofile, phkl)
  end
end
struct LibWin32::ITfActiveLanguageProfileNotifySink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_activated(clsid : Guid*, guidprofile : Guid*, factivated : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_activated.unsafe_as(Proc(Guid*, Guid*, LibC::BOOL, HRESULT)).call(clsid, guidprofile, factivated)
  end
end
struct LibWin32::IEnumTfLanguageProfiles
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumTfLanguageProfiles*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTfLanguageProfiles*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, pprofile : TF_LANGUAGEPROFILE*, pcfetch : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, TF_LANGUAGEPROFILE*, UInt32*, HRESULT)).call(ulcount, pprofile, pcfetch)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfLanguageProfileNotifySink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_language_change(langid : UInt16, pfaccept : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_language_change.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(langid, pfaccept)
  end
  def on_language_changed : HRESULT
    @lpVtbl.value.on_language_changed.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITfInputProcessorProfileMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def activate_profile(dwprofiletype : UInt32, langid : UInt16, clsid : Guid*, guidprofile : Guid*, hkl : HKL, dwflags : UInt32) : HRESULT
    @lpVtbl.value.activate_profile.unsafe_as(Proc(UInt32, UInt16, Guid*, Guid*, HKL, UInt32, HRESULT)).call(dwprofiletype, langid, clsid, guidprofile, hkl, dwflags)
  end
  def deactivate_profile(dwprofiletype : UInt32, langid : UInt16, clsid : Guid*, guidprofile : Guid*, hkl : HKL, dwflags : UInt32) : HRESULT
    @lpVtbl.value.deactivate_profile.unsafe_as(Proc(UInt32, UInt16, Guid*, Guid*, HKL, UInt32, HRESULT)).call(dwprofiletype, langid, clsid, guidprofile, hkl, dwflags)
  end
  def get_profile(dwprofiletype : UInt32, langid : UInt16, clsid : Guid*, guidprofile : Guid*, hkl : HKL, pprofile : TF_INPUTPROCESSORPROFILE*) : HRESULT
    @lpVtbl.value.get_profile.unsafe_as(Proc(UInt32, UInt16, Guid*, Guid*, HKL, TF_INPUTPROCESSORPROFILE*, HRESULT)).call(dwprofiletype, langid, clsid, guidprofile, hkl, pprofile)
  end
  def enum_profiles(langid : UInt16, ppenum : IEnumTfInputProcessorProfiles*) : HRESULT
    @lpVtbl.value.enum_profiles.unsafe_as(Proc(UInt16, IEnumTfInputProcessorProfiles*, HRESULT)).call(langid, ppenum)
  end
  def release_input_processor(rclsid : Guid*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.release_input_processor.unsafe_as(Proc(Guid*, UInt32, HRESULT)).call(rclsid, dwflags)
  end
  def register_profile(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, pchdesc : Char*, cchdesc : UInt32, pchiconfile : Char*, cchfile : UInt32, uiconindex : UInt32, hklsubstitute : HKL, dwpreferredlayout : UInt32, benabledbydefault : LibC::BOOL, dwflags : UInt32) : HRESULT
    @lpVtbl.value.register_profile.unsafe_as(Proc(Guid*, UInt16, Guid*, Char*, UInt32, Char*, UInt32, UInt32, HKL, UInt32, LibC::BOOL, UInt32, HRESULT)).call(rclsid, langid, guidprofile, pchdesc, cchdesc, pchiconfile, cchfile, uiconindex, hklsubstitute, dwpreferredlayout, benabledbydefault, dwflags)
  end
  def unregister_profile(rclsid : Guid*, langid : UInt16, guidprofile : Guid*, dwflags : UInt32) : HRESULT
    @lpVtbl.value.unregister_profile.unsafe_as(Proc(Guid*, UInt16, Guid*, UInt32, HRESULT)).call(rclsid, langid, guidprofile, dwflags)
  end
  def get_active_profile(catid : Guid*, pprofile : TF_INPUTPROCESSORPROFILE*) : HRESULT
    @lpVtbl.value.get_active_profile.unsafe_as(Proc(Guid*, TF_INPUTPROCESSORPROFILE*, HRESULT)).call(catid, pprofile)
  end
end
struct LibWin32::IEnumTfInputProcessorProfiles
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumTfInputProcessorProfiles*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTfInputProcessorProfiles*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, pprofile : TF_INPUTPROCESSORPROFILE*, pcfetch : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, TF_INPUTPROCESSORPROFILE*, UInt32*, HRESULT)).call(ulcount, pprofile, pcfetch)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfInputProcessorProfileActivationSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_activated(dwprofiletype : UInt32, langid : UInt16, clsid : Guid*, catid : Guid*, guidprofile : Guid*, hkl : HKL, dwflags : UInt32) : HRESULT
    @lpVtbl.value.on_activated.unsafe_as(Proc(UInt32, UInt16, Guid*, Guid*, Guid*, HKL, UInt32, HRESULT)).call(dwprofiletype, langid, clsid, catid, guidprofile, hkl, dwflags)
  end
end
struct LibWin32::ITfKeystrokeMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise_key_event_sink(tid : UInt32, psink : ITfKeyEventSink, fforeground : LibC::BOOL) : HRESULT
    @lpVtbl.value.advise_key_event_sink.unsafe_as(Proc(UInt32, ITfKeyEventSink, LibC::BOOL, HRESULT)).call(tid, psink, fforeground)
  end
  def unadvise_key_event_sink(tid : UInt32) : HRESULT
    @lpVtbl.value.unadvise_key_event_sink.unsafe_as(Proc(UInt32, HRESULT)).call(tid)
  end
  def get_foreground(pclsid : Guid*) : HRESULT
    @lpVtbl.value.get_foreground.unsafe_as(Proc(Guid*, HRESULT)).call(pclsid)
  end
  def test_key_down(wparam : LibC::UINT_PTR, lparam : LPARAM, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.test_key_down.unsafe_as(Proc(LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(wparam, lparam, pfeaten)
  end
  def test_key_up(wparam : LibC::UINT_PTR, lparam : LPARAM, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.test_key_up.unsafe_as(Proc(LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(wparam, lparam, pfeaten)
  end
  def key_down(wparam : LibC::UINT_PTR, lparam : LPARAM, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.key_down.unsafe_as(Proc(LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(wparam, lparam, pfeaten)
  end
  def key_up(wparam : LibC::UINT_PTR, lparam : LPARAM, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.key_up.unsafe_as(Proc(LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(wparam, lparam, pfeaten)
  end
  def get_preserved_key(pic : ITfContext, pprekey : TF_PRESERVEDKEY*, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_preserved_key.unsafe_as(Proc(ITfContext, TF_PRESERVEDKEY*, Guid*, HRESULT)).call(pic, pprekey, pguid)
  end
  def is_preserved_key(rguid : Guid*, pprekey : TF_PRESERVEDKEY*, pfregistered : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_preserved_key.unsafe_as(Proc(Guid*, TF_PRESERVEDKEY*, LibC::BOOL*, HRESULT)).call(rguid, pprekey, pfregistered)
  end
  def preserve_key(tid : UInt32, rguid : Guid*, prekey : TF_PRESERVEDKEY*, pchdesc : Char*, cchdesc : UInt32) : HRESULT
    @lpVtbl.value.preserve_key.unsafe_as(Proc(UInt32, Guid*, TF_PRESERVEDKEY*, Char*, UInt32, HRESULT)).call(tid, rguid, prekey, pchdesc, cchdesc)
  end
  def unpreserve_key(rguid : Guid*, pprekey : TF_PRESERVEDKEY*) : HRESULT
    @lpVtbl.value.unpreserve_key.unsafe_as(Proc(Guid*, TF_PRESERVEDKEY*, HRESULT)).call(rguid, pprekey)
  end
  def set_preserved_key_description(rguid : Guid*, pchdesc : Char*, cchdesc : UInt32) : HRESULT
    @lpVtbl.value.set_preserved_key_description.unsafe_as(Proc(Guid*, Char*, UInt32, HRESULT)).call(rguid, pchdesc, cchdesc)
  end
  def get_preserved_key_description(rguid : Guid*, pbstrdesc : UInt8**) : HRESULT
    @lpVtbl.value.get_preserved_key_description.unsafe_as(Proc(Guid*, UInt8**, HRESULT)).call(rguid, pbstrdesc)
  end
  def simulate_preserved_key(pic : ITfContext, rguid : Guid*, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.simulate_preserved_key.unsafe_as(Proc(ITfContext, Guid*, LibC::BOOL*, HRESULT)).call(pic, rguid, pfeaten)
  end
end
struct LibWin32::ITfKeyEventSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_set_focus(fforeground : LibC::BOOL) : HRESULT
    @lpVtbl.value.on_set_focus.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fforeground)
  end
  def on_test_key_down(pic : ITfContext, wparam : LibC::UINT_PTR, lparam : LPARAM, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_test_key_down.unsafe_as(Proc(ITfContext, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(pic, wparam, lparam, pfeaten)
  end
  def on_test_key_up(pic : ITfContext, wparam : LibC::UINT_PTR, lparam : LPARAM, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_test_key_up.unsafe_as(Proc(ITfContext, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(pic, wparam, lparam, pfeaten)
  end
  def on_key_down(pic : ITfContext, wparam : LibC::UINT_PTR, lparam : LPARAM, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_key_down.unsafe_as(Proc(ITfContext, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(pic, wparam, lparam, pfeaten)
  end
  def on_key_up(pic : ITfContext, wparam : LibC::UINT_PTR, lparam : LPARAM, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_key_up.unsafe_as(Proc(ITfContext, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(pic, wparam, lparam, pfeaten)
  end
  def on_preserved_key(pic : ITfContext, rguid : Guid*, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_preserved_key.unsafe_as(Proc(ITfContext, Guid*, LibC::BOOL*, HRESULT)).call(pic, rguid, pfeaten)
  end
end
struct LibWin32::ITfKeyTraceEventSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_key_trace_down(wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.on_key_trace_down.unsafe_as(Proc(LibC::UINT_PTR, LPARAM, HRESULT)).call(wparam, lparam)
  end
  def on_key_trace_up(wparam : LibC::UINT_PTR, lparam : LPARAM) : HRESULT
    @lpVtbl.value.on_key_trace_up.unsafe_as(Proc(LibC::UINT_PTR, LPARAM, HRESULT)).call(wparam, lparam)
  end
end
struct LibWin32::ITfPreservedKeyNotifySink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_updated(pprekey : TF_PRESERVEDKEY*) : HRESULT
    @lpVtbl.value.on_updated.unsafe_as(Proc(TF_PRESERVEDKEY*, HRESULT)).call(pprekey)
  end
end
struct LibWin32::ITfMessagePump
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def peek_message_a(pmsg : MSG*, hwnd : LibC::HANDLE, wmsgfiltermin : UInt32, wmsgfiltermax : UInt32, wremovemsg : UInt32, pfresult : LibC::BOOL*) : HRESULT
    @lpVtbl.value.peek_message_a.unsafe_as(Proc(MSG*, LibC::HANDLE, UInt32, UInt32, UInt32, LibC::BOOL*, HRESULT)).call(pmsg, hwnd, wmsgfiltermin, wmsgfiltermax, wremovemsg, pfresult)
  end
  def get_message_a(pmsg : MSG*, hwnd : LibC::HANDLE, wmsgfiltermin : UInt32, wmsgfiltermax : UInt32, pfresult : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_message_a.unsafe_as(Proc(MSG*, LibC::HANDLE, UInt32, UInt32, LibC::BOOL*, HRESULT)).call(pmsg, hwnd, wmsgfiltermin, wmsgfiltermax, pfresult)
  end
  def peek_message_w(pmsg : MSG*, hwnd : LibC::HANDLE, wmsgfiltermin : UInt32, wmsgfiltermax : UInt32, wremovemsg : UInt32, pfresult : LibC::BOOL*) : HRESULT
    @lpVtbl.value.peek_message_w.unsafe_as(Proc(MSG*, LibC::HANDLE, UInt32, UInt32, UInt32, LibC::BOOL*, HRESULT)).call(pmsg, hwnd, wmsgfiltermin, wmsgfiltermax, wremovemsg, pfresult)
  end
  def get_message_w(pmsg : MSG*, hwnd : LibC::HANDLE, wmsgfiltermin : UInt32, wmsgfiltermax : UInt32, pfresult : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_message_w.unsafe_as(Proc(MSG*, LibC::HANDLE, UInt32, UInt32, LibC::BOOL*, HRESULT)).call(pmsg, hwnd, wmsgfiltermin, wmsgfiltermax, pfresult)
  end
end
struct LibWin32::ITfThreadFocusSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_set_thread_focus : HRESULT
    @lpVtbl.value.on_set_thread_focus.unsafe_as(Proc(HRESULT)).call
  end
  def on_kill_thread_focus : HRESULT
    @lpVtbl.value.on_kill_thread_focus.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITfTextInputProcessor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def activate(ptim : ITfThreadMgr, tid : UInt32) : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(ITfThreadMgr, UInt32, HRESULT)).call(ptim, tid)
  end
  def deactivate : HRESULT
    @lpVtbl.value.deactivate.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITfTextInputProcessorEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def activate(ptim : ITfThreadMgr, tid : UInt32) : HRESULT
    @lpVtbl.value.activate.unsafe_as(Proc(ITfThreadMgr, UInt32, HRESULT)).call(ptim, tid)
  end
  def deactivate : HRESULT
    @lpVtbl.value.deactivate.unsafe_as(Proc(HRESULT)).call
  end
  def activate_ex(ptim : ITfThreadMgr, tid : UInt32, dwflags : UInt32) : HRESULT
    @lpVtbl.value.activate_ex.unsafe_as(Proc(ITfThreadMgr, UInt32, UInt32, HRESULT)).call(ptim, tid, dwflags)
  end
end
struct LibWin32::ITfClientId
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_client_id(rclsid : Guid*, ptid : UInt32*) : HRESULT
    @lpVtbl.value.get_client_id.unsafe_as(Proc(Guid*, UInt32*, HRESULT)).call(rclsid, ptid)
  end
end
struct LibWin32::ITfDisplayAttributeInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_guid(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def get_description(pbstrdesc : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdesc)
  end
  def get_attribute_info(pda : TF_DISPLAYATTRIBUTE*) : HRESULT
    @lpVtbl.value.get_attribute_info.unsafe_as(Proc(TF_DISPLAYATTRIBUTE*, HRESULT)).call(pda)
  end
  def set_attribute_info(pda : TF_DISPLAYATTRIBUTE*) : HRESULT
    @lpVtbl.value.set_attribute_info.unsafe_as(Proc(TF_DISPLAYATTRIBUTE*, HRESULT)).call(pda)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IEnumTfDisplayAttributeInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumTfDisplayAttributeInfo*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTfDisplayAttributeInfo*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, rginfo : ITfDisplayAttributeInfo*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ITfDisplayAttributeInfo*, UInt32*, HRESULT)).call(ulcount, rginfo, pcfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfDisplayAttributeProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enum_display_attribute_info(ppenum : IEnumTfDisplayAttributeInfo*) : HRESULT
    @lpVtbl.value.enum_display_attribute_info.unsafe_as(Proc(IEnumTfDisplayAttributeInfo*, HRESULT)).call(ppenum)
  end
  def get_display_attribute_info(guid : Guid*, ppinfo : ITfDisplayAttributeInfo*) : HRESULT
    @lpVtbl.value.get_display_attribute_info.unsafe_as(Proc(Guid*, ITfDisplayAttributeInfo*, HRESULT)).call(guid, ppinfo)
  end
end
struct LibWin32::ITfDisplayAttributeMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_update_info : HRESULT
    @lpVtbl.value.on_update_info.unsafe_as(Proc(HRESULT)).call
  end
  def enum_display_attribute_info(ppenum : IEnumTfDisplayAttributeInfo*) : HRESULT
    @lpVtbl.value.enum_display_attribute_info.unsafe_as(Proc(IEnumTfDisplayAttributeInfo*, HRESULT)).call(ppenum)
  end
  def get_display_attribute_info(guid : Guid*, ppinfo : ITfDisplayAttributeInfo*, pclsidowner : Guid*) : HRESULT
    @lpVtbl.value.get_display_attribute_info.unsafe_as(Proc(Guid*, ITfDisplayAttributeInfo*, Guid*, HRESULT)).call(guid, ppinfo, pclsidowner)
  end
end
struct LibWin32::ITfDisplayAttributeNotifySink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_update_info : HRESULT
    @lpVtbl.value.on_update_info.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITfCategoryMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_category(rclsid : Guid*, rcatid : Guid*, rguid : Guid*) : HRESULT
    @lpVtbl.value.register_category.unsafe_as(Proc(Guid*, Guid*, Guid*, HRESULT)).call(rclsid, rcatid, rguid)
  end
  def unregister_category(rclsid : Guid*, rcatid : Guid*, rguid : Guid*) : HRESULT
    @lpVtbl.value.unregister_category.unsafe_as(Proc(Guid*, Guid*, Guid*, HRESULT)).call(rclsid, rcatid, rguid)
  end
  def enum_categories_in_item(rguid : Guid*, ppenum : IEnumGUID*) : HRESULT
    @lpVtbl.value.enum_categories_in_item.unsafe_as(Proc(Guid*, IEnumGUID*, HRESULT)).call(rguid, ppenum)
  end
  def enum_items_in_category(rcatid : Guid*, ppenum : IEnumGUID*) : HRESULT
    @lpVtbl.value.enum_items_in_category.unsafe_as(Proc(Guid*, IEnumGUID*, HRESULT)).call(rcatid, ppenum)
  end
  def find_closest_category(rguid : Guid*, pcatid : Guid*, ppcatidlist : Guid**, ulcount : UInt32) : HRESULT
    @lpVtbl.value.find_closest_category.unsafe_as(Proc(Guid*, Guid*, Guid**, UInt32, HRESULT)).call(rguid, pcatid, ppcatidlist, ulcount)
  end
  def register_guid_description(rclsid : Guid*, rguid : Guid*, pchdesc : Char*, cch : UInt32) : HRESULT
    @lpVtbl.value.register_guid_description.unsafe_as(Proc(Guid*, Guid*, Char*, UInt32, HRESULT)).call(rclsid, rguid, pchdesc, cch)
  end
  def unregister_guid_description(rclsid : Guid*, rguid : Guid*) : HRESULT
    @lpVtbl.value.unregister_guid_description.unsafe_as(Proc(Guid*, Guid*, HRESULT)).call(rclsid, rguid)
  end
  def get_guid_description(rguid : Guid*, pbstrdesc : UInt8**) : HRESULT
    @lpVtbl.value.get_guid_description.unsafe_as(Proc(Guid*, UInt8**, HRESULT)).call(rguid, pbstrdesc)
  end
  def register_guiddword(rclsid : Guid*, rguid : Guid*, dw : UInt32) : HRESULT
    @lpVtbl.value.register_guiddword.unsafe_as(Proc(Guid*, Guid*, UInt32, HRESULT)).call(rclsid, rguid, dw)
  end
  def unregister_guiddword(rclsid : Guid*, rguid : Guid*) : HRESULT
    @lpVtbl.value.unregister_guiddword.unsafe_as(Proc(Guid*, Guid*, HRESULT)).call(rclsid, rguid)
  end
  def get_guiddword(rguid : Guid*, pdw : UInt32*) : HRESULT
    @lpVtbl.value.get_guiddword.unsafe_as(Proc(Guid*, UInt32*, HRESULT)).call(rguid, pdw)
  end
  def register_guid(rguid : Guid*, pguidatom : UInt32*) : HRESULT
    @lpVtbl.value.register_guid.unsafe_as(Proc(Guid*, UInt32*, HRESULT)).call(rguid, pguidatom)
  end
  def get_guid(guidatom : UInt32, pguid : Guid*) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(UInt32, Guid*, HRESULT)).call(guidatom, pguid)
  end
  def is_equal_tf_guid_atom(guidatom : UInt32, rguid : Guid*, pfequal : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_equal_tf_guid_atom.unsafe_as(Proc(UInt32, Guid*, LibC::BOOL*, HRESULT)).call(guidatom, rguid, pfequal)
  end
end
struct LibWin32::ITfSource
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise_sink(riid : Guid*, punk : IUnknown, pdwcookie : UInt32*) : HRESULT
    @lpVtbl.value.advise_sink.unsafe_as(Proc(Guid*, IUnknown, UInt32*, HRESULT)).call(riid, punk, pdwcookie)
  end
  def unadvise_sink(dwcookie : UInt32) : HRESULT
    @lpVtbl.value.unadvise_sink.unsafe_as(Proc(UInt32, HRESULT)).call(dwcookie)
  end
end
struct LibWin32::ITfSourceSingle
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise_single_sink(tid : UInt32, riid : Guid*, punk : IUnknown) : HRESULT
    @lpVtbl.value.advise_single_sink.unsafe_as(Proc(UInt32, Guid*, IUnknown, HRESULT)).call(tid, riid, punk)
  end
  def unadvise_single_sink(tid : UInt32, riid : Guid*) : HRESULT
    @lpVtbl.value.unadvise_single_sink.unsafe_as(Proc(UInt32, Guid*, HRESULT)).call(tid, riid)
  end
end
struct LibWin32::ITfUIElementMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_ui_element(pelement : ITfUIElement, pbshow : LibC::BOOL*, pdwuielementid : UInt32*) : HRESULT
    @lpVtbl.value.begin_ui_element.unsafe_as(Proc(ITfUIElement, LibC::BOOL*, UInt32*, HRESULT)).call(pelement, pbshow, pdwuielementid)
  end
  def update_ui_element(dwuielementid : UInt32) : HRESULT
    @lpVtbl.value.update_ui_element.unsafe_as(Proc(UInt32, HRESULT)).call(dwuielementid)
  end
  def end_ui_element(dwuielementid : UInt32) : HRESULT
    @lpVtbl.value.end_ui_element.unsafe_as(Proc(UInt32, HRESULT)).call(dwuielementid)
  end
  def get_ui_element(dwuielementid : UInt32, ppelement : ITfUIElement*) : HRESULT
    @lpVtbl.value.get_ui_element.unsafe_as(Proc(UInt32, ITfUIElement*, HRESULT)).call(dwuielementid, ppelement)
  end
  def enum_ui_elements(ppenum : IEnumTfUIElements*) : HRESULT
    @lpVtbl.value.enum_ui_elements.unsafe_as(Proc(IEnumTfUIElements*, HRESULT)).call(ppenum)
  end
end
struct LibWin32::IEnumTfUIElements
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumTfUIElements*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTfUIElements*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, ppelement : ITfUIElement*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ITfUIElement*, UInt32*, HRESULT)).call(ulcount, ppelement, pcfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfUIElementSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def begin_ui_element(dwuielementid : UInt32, pbshow : LibC::BOOL*) : HRESULT
    @lpVtbl.value.begin_ui_element.unsafe_as(Proc(UInt32, LibC::BOOL*, HRESULT)).call(dwuielementid, pbshow)
  end
  def update_ui_element(dwuielementid : UInt32) : HRESULT
    @lpVtbl.value.update_ui_element.unsafe_as(Proc(UInt32, HRESULT)).call(dwuielementid)
  end
  def end_ui_element(dwuielementid : UInt32) : HRESULT
    @lpVtbl.value.end_ui_element.unsafe_as(Proc(UInt32, HRESULT)).call(dwuielementid)
  end
end
struct LibWin32::ITfUIElement
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_description(pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdescription)
  end
  def get_guid(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def show(bshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bshow)
  end
  def is_shown(pbshow : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_shown.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbshow)
  end
end
struct LibWin32::ITfCandidateListUIElement
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_description(pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdescription)
  end
  def get_guid(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def show(bshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bshow)
  end
  def is_shown(pbshow : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_shown.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbshow)
  end
  def get_updated_flags(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_updated_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
  def get_document_mgr(ppdim : ITfDocumentMgr*) : HRESULT
    @lpVtbl.value.get_document_mgr.unsafe_as(Proc(ITfDocumentMgr*, HRESULT)).call(ppdim)
  end
  def get_count(pucount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pucount)
  end
  def get_selection(puindex : UInt32*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(UInt32*, HRESULT)).call(puindex)
  end
  def get_string(uindex : UInt32, pstr : UInt8**) : HRESULT
    @lpVtbl.value.get_string.unsafe_as(Proc(UInt32, UInt8**, HRESULT)).call(uindex, pstr)
  end
  def get_page_index(pindex : UInt32*, usize : UInt32, pupagecnt : UInt32*) : HRESULT
    @lpVtbl.value.get_page_index.unsafe_as(Proc(UInt32*, UInt32, UInt32*, HRESULT)).call(pindex, usize, pupagecnt)
  end
  def set_page_index(pindex : UInt32*, upagecnt : UInt32) : HRESULT
    @lpVtbl.value.set_page_index.unsafe_as(Proc(UInt32*, UInt32, HRESULT)).call(pindex, upagecnt)
  end
  def get_current_page(pupage : UInt32*) : HRESULT
    @lpVtbl.value.get_current_page.unsafe_as(Proc(UInt32*, HRESULT)).call(pupage)
  end
end
struct LibWin32::ITfCandidateListUIElementBehavior
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_description(pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdescription)
  end
  def get_guid(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def show(bshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bshow)
  end
  def is_shown(pbshow : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_shown.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbshow)
  end
  def get_updated_flags(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_updated_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
  def get_document_mgr(ppdim : ITfDocumentMgr*) : HRESULT
    @lpVtbl.value.get_document_mgr.unsafe_as(Proc(ITfDocumentMgr*, HRESULT)).call(ppdim)
  end
  def get_count(pucount : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pucount)
  end
  def get_selection(puindex : UInt32*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(UInt32*, HRESULT)).call(puindex)
  end
  def get_string(uindex : UInt32, pstr : UInt8**) : HRESULT
    @lpVtbl.value.get_string.unsafe_as(Proc(UInt32, UInt8**, HRESULT)).call(uindex, pstr)
  end
  def get_page_index(pindex : UInt32*, usize : UInt32, pupagecnt : UInt32*) : HRESULT
    @lpVtbl.value.get_page_index.unsafe_as(Proc(UInt32*, UInt32, UInt32*, HRESULT)).call(pindex, usize, pupagecnt)
  end
  def set_page_index(pindex : UInt32*, upagecnt : UInt32) : HRESULT
    @lpVtbl.value.set_page_index.unsafe_as(Proc(UInt32*, UInt32, HRESULT)).call(pindex, upagecnt)
  end
  def get_current_page(pupage : UInt32*) : HRESULT
    @lpVtbl.value.get_current_page.unsafe_as(Proc(UInt32*, HRESULT)).call(pupage)
  end
  def set_selection(nindex : UInt32) : HRESULT
    @lpVtbl.value.set_selection.unsafe_as(Proc(UInt32, HRESULT)).call(nindex)
  end
  def finalize : HRESULT
    @lpVtbl.value.finalize.unsafe_as(Proc(HRESULT)).call
  end
  def abort : HRESULT
    @lpVtbl.value.abort.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITfReadingInformationUIElement
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_description(pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdescription)
  end
  def get_guid(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def show(bshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bshow)
  end
  def is_shown(pbshow : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_shown.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbshow)
  end
  def get_updated_flags(pdwflags : UInt32*) : HRESULT
    @lpVtbl.value.get_updated_flags.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwflags)
  end
  def get_context(ppic : ITfContext*) : HRESULT
    @lpVtbl.value.get_context.unsafe_as(Proc(ITfContext*, HRESULT)).call(ppic)
  end
  def get_string(pstr : UInt8**) : HRESULT
    @lpVtbl.value.get_string.unsafe_as(Proc(UInt8**, HRESULT)).call(pstr)
  end
  def get_max_reading_string_length(pcchmax : UInt32*) : HRESULT
    @lpVtbl.value.get_max_reading_string_length.unsafe_as(Proc(UInt32*, HRESULT)).call(pcchmax)
  end
  def get_error_index(perrorindex : UInt32*) : HRESULT
    @lpVtbl.value.get_error_index.unsafe_as(Proc(UInt32*, HRESULT)).call(perrorindex)
  end
  def is_vertical_order_preferred(pfvertical : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_vertical_order_preferred.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfvertical)
  end
end
struct LibWin32::ITfTransitoryExtensionUIElement
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_description(pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdescription)
  end
  def get_guid(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def show(bshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bshow)
  end
  def is_shown(pbshow : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_shown.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbshow)
  end
  def get_document_mgr(ppdim : ITfDocumentMgr*) : HRESULT
    @lpVtbl.value.get_document_mgr.unsafe_as(Proc(ITfDocumentMgr*, HRESULT)).call(ppdim)
  end
end
struct LibWin32::ITfTransitoryExtensionSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_transitory_extension_updated(pic : ITfContext, ecreadonly : UInt32, presultrange : ITfRange, pcompositionrange : ITfRange, pfdeleteresultrange : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_transitory_extension_updated.unsafe_as(Proc(ITfContext, UInt32, ITfRange, ITfRange, LibC::BOOL*, HRESULT)).call(pic, ecreadonly, presultrange, pcompositionrange, pfdeleteresultrange)
  end
end
struct LibWin32::ITfToolTipUIElement
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_description(pbstrdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrdescription)
  end
  def get_guid(pguid : Guid*) : HRESULT
    @lpVtbl.value.get_guid.unsafe_as(Proc(Guid*, HRESULT)).call(pguid)
  end
  def show(bshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(bshow)
  end
  def is_shown(pbshow : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_shown.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pbshow)
  end
  def get_string(pstr : UInt8**) : HRESULT
    @lpVtbl.value.get_string.unsafe_as(Proc(UInt8**, HRESULT)).call(pstr)
  end
end
struct LibWin32::ITfReverseConversionList
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_length(puindex : UInt32*) : HRESULT
    @lpVtbl.value.get_length.unsafe_as(Proc(UInt32*, HRESULT)).call(puindex)
  end
  def get_string(uindex : UInt32, pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_string.unsafe_as(Proc(UInt32, UInt8**, HRESULT)).call(uindex, pbstr)
  end
end
struct LibWin32::ITfReverseConversion
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def do_reverse_conversion(lpstr : LibC::LPWSTR, pplist : ITfReverseConversionList*) : HRESULT
    @lpVtbl.value.do_reverse_conversion.unsafe_as(Proc(LibC::LPWSTR, ITfReverseConversionList*, HRESULT)).call(lpstr, pplist)
  end
end
struct LibWin32::ITfReverseConversionMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_reverse_conversion(langid : UInt16, guidprofile : Guid*, dwflag : UInt32, ppreverseconversion : ITfReverseConversion*) : HRESULT
    @lpVtbl.value.get_reverse_conversion.unsafe_as(Proc(UInt16, Guid*, UInt32, ITfReverseConversion*, HRESULT)).call(langid, guidprofile, dwflag, ppreverseconversion)
  end
end
struct LibWin32::ITfCandidateString
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_string(pbstr : UInt8**) : HRESULT
    @lpVtbl.value.get_string.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstr)
  end
  def get_index(pnindex : UInt32*) : HRESULT
    @lpVtbl.value.get_index.unsafe_as(Proc(UInt32*, HRESULT)).call(pnindex)
  end
end
struct LibWin32::IEnumTfCandidates
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumTfCandidates*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTfCandidates*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, ppcand : ITfCandidateString*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, ITfCandidateString*, UInt32*, HRESULT)).call(ulcount, ppcand, pcfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfCandidateList
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enum_candidates(ppenum : IEnumTfCandidates*) : HRESULT
    @lpVtbl.value.enum_candidates.unsafe_as(Proc(IEnumTfCandidates*, HRESULT)).call(ppenum)
  end
  def get_candidate(nindex : UInt32, ppcand : ITfCandidateString*) : HRESULT
    @lpVtbl.value.get_candidate.unsafe_as(Proc(UInt32, ITfCandidateString*, HRESULT)).call(nindex, ppcand)
  end
  def get_candidate_num(pncnt : UInt32*) : HRESULT
    @lpVtbl.value.get_candidate_num.unsafe_as(Proc(UInt32*, HRESULT)).call(pncnt)
  end
  def set_result(nindex : UInt32, imcr : TfCandidateResult) : HRESULT
    @lpVtbl.value.set_result.unsafe_as(Proc(UInt32, TfCandidateResult, HRESULT)).call(nindex, imcr)
  end
end
struct LibWin32::ITfFnReconversion
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def query_range(prange : ITfRange, ppnewrange : ITfRange*, pfconvertable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_range.unsafe_as(Proc(ITfRange, ITfRange*, LibC::BOOL*, HRESULT)).call(prange, ppnewrange, pfconvertable)
  end
  def get_reconversion(prange : ITfRange, ppcandlist : ITfCandidateList*) : HRESULT
    @lpVtbl.value.get_reconversion.unsafe_as(Proc(ITfRange, ITfCandidateList*, HRESULT)).call(prange, ppcandlist)
  end
  def reconvert(prange : ITfRange) : HRESULT
    @lpVtbl.value.reconvert.unsafe_as(Proc(ITfRange, HRESULT)).call(prange)
  end
end
struct LibWin32::ITfFnPlayBack
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def query_range(prange : ITfRange, ppnewrange : ITfRange*, pfplayable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_range.unsafe_as(Proc(ITfRange, ITfRange*, LibC::BOOL*, HRESULT)).call(prange, ppnewrange, pfplayable)
  end
  def play(prange : ITfRange) : HRESULT
    @lpVtbl.value.play.unsafe_as(Proc(ITfRange, HRESULT)).call(prange)
  end
end
struct LibWin32::ITfFnLangProfileUtil
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def register_active_profiles : HRESULT
    @lpVtbl.value.register_active_profiles.unsafe_as(Proc(HRESULT)).call
  end
  def is_profile_available_for_lang(langid : UInt16, pfavailable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.is_profile_available_for_lang.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(langid, pfavailable)
  end
end
struct LibWin32::ITfFnConfigure
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def show(hwndparent : LibC::HANDLE, langid : UInt16, rguidprofile : Guid*) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::HANDLE, UInt16, Guid*, HRESULT)).call(hwndparent, langid, rguidprofile)
  end
end
struct LibWin32::ITfFnConfigureRegisterWord
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def show(hwndparent : LibC::HANDLE, langid : UInt16, rguidprofile : Guid*, bstrregistered : UInt8*) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::HANDLE, UInt16, Guid*, UInt8*, HRESULT)).call(hwndparent, langid, rguidprofile, bstrregistered)
  end
end
struct LibWin32::ITfFnConfigureRegisterEudc
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def show(hwndparent : LibC::HANDLE, langid : UInt16, rguidprofile : Guid*, bstrregistered : UInt8*) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::HANDLE, UInt16, Guid*, UInt8*, HRESULT)).call(hwndparent, langid, rguidprofile, bstrregistered)
  end
end
struct LibWin32::ITfFnShowHelp
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def show(hwndparent : LibC::HANDLE) : HRESULT
    @lpVtbl.value.show.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(hwndparent)
  end
end
struct LibWin32::ITfFnBalloon
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def update_balloon(style : TfLBBalloonStyle, pch : Char*, cch : UInt32) : HRESULT
    @lpVtbl.value.update_balloon.unsafe_as(Proc(TfLBBalloonStyle, Char*, UInt32, HRESULT)).call(style, pch, cch)
  end
end
struct LibWin32::ITfFnGetSAPIObject
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get(sobj : TfSapiObject, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get.unsafe_as(Proc(TfSapiObject, IUnknown*, HRESULT)).call(sobj, ppunk)
  end
end
struct LibWin32::ITfFnPropertyUIStatus
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_status(refguidprop : Guid*, pdw : UInt32*) : HRESULT
    @lpVtbl.value.get_status.unsafe_as(Proc(Guid*, UInt32*, HRESULT)).call(refguidprop, pdw)
  end
  def set_status(refguidprop : Guid*, dw : UInt32) : HRESULT
    @lpVtbl.value.set_status.unsafe_as(Proc(Guid*, UInt32, HRESULT)).call(refguidprop, dw)
  end
end
struct LibWin32::IEnumSpeechCommands
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumSpeechCommands*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumSpeechCommands*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, pspcmds : UInt16**, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, UInt16**, UInt32*, HRESULT)).call(ulcount, pspcmds, pcfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ISpeechCommandProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def enum_speech_commands(langid : UInt16, ppenum : IEnumSpeechCommands*) : HRESULT
    @lpVtbl.value.enum_speech_commands.unsafe_as(Proc(UInt16, IEnumSpeechCommands*, HRESULT)).call(langid, ppenum)
  end
  def process_command(pszcommand : Char*, cch : UInt32, langid : UInt16) : HRESULT
    @lpVtbl.value.process_command.unsafe_as(Proc(Char*, UInt32, UInt16, HRESULT)).call(pszcommand, cch, langid)
  end
end
struct LibWin32::ITfFnCustomSpeechCommand
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def set_speech_command_provider(pspcmdprovider : IUnknown) : HRESULT
    @lpVtbl.value.set_speech_command_provider.unsafe_as(Proc(IUnknown, HRESULT)).call(pspcmdprovider)
  end
end
struct LibWin32::ITfFnLMProcessor
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def query_range(prange : ITfRange, ppnewrange : ITfRange*, pfaccepted : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_range.unsafe_as(Proc(ITfRange, ITfRange*, LibC::BOOL*, HRESULT)).call(prange, ppnewrange, pfaccepted)
  end
  def query_lang_id(langid : UInt16, pfaccepted : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_lang_id.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(langid, pfaccepted)
  end
  def get_reconversion(prange : ITfRange, ppcandlist : ITfCandidateList*) : HRESULT
    @lpVtbl.value.get_reconversion.unsafe_as(Proc(ITfRange, ITfCandidateList*, HRESULT)).call(prange, ppcandlist)
  end
  def reconvert(prange : ITfRange) : HRESULT
    @lpVtbl.value.reconvert.unsafe_as(Proc(ITfRange, HRESULT)).call(prange)
  end
  def query_key(fup : LibC::BOOL, vkey : LibC::UINT_PTR, lparamkeydata : LPARAM, pfinterested : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_key.unsafe_as(Proc(LibC::BOOL, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(fup, vkey, lparamkeydata, pfinterested)
  end
  def invoke_key(fup : LibC::BOOL, vkey : LibC::UINT_PTR, lparamkeydata : LPARAM) : HRESULT
    @lpVtbl.value.invoke_key.unsafe_as(Proc(LibC::BOOL, LibC::UINT_PTR, LPARAM, HRESULT)).call(fup, vkey, lparamkeydata)
  end
  def invoke_func(pic : ITfContext, refguidfunc : Guid*) : HRESULT
    @lpVtbl.value.invoke_func.unsafe_as(Proc(ITfContext, Guid*, HRESULT)).call(pic, refguidfunc)
  end
end
struct LibWin32::ITfFnLMInternal
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def query_range(prange : ITfRange, ppnewrange : ITfRange*, pfaccepted : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_range.unsafe_as(Proc(ITfRange, ITfRange*, LibC::BOOL*, HRESULT)).call(prange, ppnewrange, pfaccepted)
  end
  def query_lang_id(langid : UInt16, pfaccepted : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_lang_id.unsafe_as(Proc(UInt16, LibC::BOOL*, HRESULT)).call(langid, pfaccepted)
  end
  def get_reconversion(prange : ITfRange, ppcandlist : ITfCandidateList*) : HRESULT
    @lpVtbl.value.get_reconversion.unsafe_as(Proc(ITfRange, ITfCandidateList*, HRESULT)).call(prange, ppcandlist)
  end
  def reconvert(prange : ITfRange) : HRESULT
    @lpVtbl.value.reconvert.unsafe_as(Proc(ITfRange, HRESULT)).call(prange)
  end
  def query_key(fup : LibC::BOOL, vkey : LibC::UINT_PTR, lparamkeydata : LPARAM, pfinterested : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_key.unsafe_as(Proc(LibC::BOOL, LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(fup, vkey, lparamkeydata, pfinterested)
  end
  def invoke_key(fup : LibC::BOOL, vkey : LibC::UINT_PTR, lparamkeydata : LPARAM) : HRESULT
    @lpVtbl.value.invoke_key.unsafe_as(Proc(LibC::BOOL, LibC::UINT_PTR, LPARAM, HRESULT)).call(fup, vkey, lparamkeydata)
  end
  def invoke_func(pic : ITfContext, refguidfunc : Guid*) : HRESULT
    @lpVtbl.value.invoke_func.unsafe_as(Proc(ITfContext, Guid*, HRESULT)).call(pic, refguidfunc)
  end
  def process_lattice(prange : ITfRange) : HRESULT
    @lpVtbl.value.process_lattice.unsafe_as(Proc(ITfRange, HRESULT)).call(prange)
  end
end
struct LibWin32::IEnumTfLatticeElements
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(ppenum : IEnumTfLatticeElements*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IEnumTfLatticeElements*, HRESULT)).call(ppenum)
  end
  def next(ulcount : UInt32, rgselements : TF_LMLATTELEMENT*, pcfetched : UInt32*) : HRESULT
    @lpVtbl.value.next.unsafe_as(Proc(UInt32, TF_LMLATTELEMENT*, UInt32*, HRESULT)).call(ulcount, rgselements, pcfetched)
  end
  def reset : HRESULT
    @lpVtbl.value.reset.unsafe_as(Proc(HRESULT)).call
  end
  def skip(ulcount : UInt32) : HRESULT
    @lpVtbl.value.skip.unsafe_as(Proc(UInt32, HRESULT)).call(ulcount)
  end
end
struct LibWin32::ITfLMLattice
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def query_type(rguidtype : Guid*, pfsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.query_type.unsafe_as(Proc(Guid*, LibC::BOOL*, HRESULT)).call(rguidtype, pfsupported)
  end
  def enum_lattice_elements(dwframestart : UInt32, rguidtype : Guid*, ppenum : IEnumTfLatticeElements*) : HRESULT
    @lpVtbl.value.enum_lattice_elements.unsafe_as(Proc(UInt32, Guid*, IEnumTfLatticeElements*, HRESULT)).call(dwframestart, rguidtype, ppenum)
  end
end
struct LibWin32::ITfFnAdviseText
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def on_text_update(prange : ITfRange, pchtext : Char*, cch : Int32) : HRESULT
    @lpVtbl.value.on_text_update.unsafe_as(Proc(ITfRange, Char*, Int32, HRESULT)).call(prange, pchtext, cch)
  end
  def on_lattice_update(prange : ITfRange, plattice : ITfLMLattice) : HRESULT
    @lpVtbl.value.on_lattice_update.unsafe_as(Proc(ITfRange, ITfLMLattice, HRESULT)).call(prange, plattice)
  end
end
struct LibWin32::ITfFnSearchCandidateProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_search_candidates(bstrquery : UInt8*, bstrapplicationid : UInt8*, pplist : ITfCandidateList*) : HRESULT
    @lpVtbl.value.get_search_candidates.unsafe_as(Proc(UInt8*, UInt8*, ITfCandidateList*, HRESULT)).call(bstrquery, bstrapplicationid, pplist)
  end
  def set_result(bstrquery : UInt8*, bstrapplicationid : UInt8*, bstrresult : UInt8*) : HRESULT
    @lpVtbl.value.set_result.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrquery, bstrapplicationid, bstrresult)
  end
end
struct LibWin32::ITfIntegratableCandidateListUIElement
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_integration_style(guidintegrationstyle : Guid) : HRESULT
    @lpVtbl.value.set_integration_style.unsafe_as(Proc(Guid, HRESULT)).call(guidintegrationstyle)
  end
  def get_selection_style(ptfselectionstyle : TfIntegratableCandidateListSelectionStyle*) : HRESULT
    @lpVtbl.value.get_selection_style.unsafe_as(Proc(TfIntegratableCandidateListSelectionStyle*, HRESULT)).call(ptfselectionstyle)
  end
  def on_key_down(wparam : LibC::UINT_PTR, lparam : LPARAM, pfeaten : LibC::BOOL*) : HRESULT
    @lpVtbl.value.on_key_down.unsafe_as(Proc(LibC::UINT_PTR, LPARAM, LibC::BOOL*, HRESULT)).call(wparam, lparam, pfeaten)
  end
  def show_candidate_numbers(pfshow : LibC::BOOL*) : HRESULT
    @lpVtbl.value.show_candidate_numbers.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pfshow)
  end
  def finalize_exact_composition_string : HRESULT
    @lpVtbl.value.finalize_exact_composition_string.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITfFnGetPreferredTouchKeyboardLayout
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_layout(ptkblayouttype : TKBLayoutType*, pwpreferredlayoutid : UInt16*) : HRESULT
    @lpVtbl.value.get_layout.unsafe_as(Proc(TKBLayoutType*, UInt16*, HRESULT)).call(ptkblayouttype, pwpreferredlayoutid)
  end
end
struct LibWin32::ITfFnGetLinguisticAlternates
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_display_name(pbstrname : UInt8**) : HRESULT
    @lpVtbl.value.get_display_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrname)
  end
  def get_alternates(prange : ITfRange, ppcandidatelist : ITfCandidateList*) : HRESULT
    @lpVtbl.value.get_alternates.unsafe_as(Proc(ITfRange, ITfCandidateList*, HRESULT)).call(prange, ppcandidatelist)
  end
end
struct LibWin32::IUIManagerEventSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_window_opening(prcbounds : RECT*) : HRESULT
    @lpVtbl.value.on_window_opening.unsafe_as(Proc(RECT*, HRESULT)).call(prcbounds)
  end
  def on_window_opened(prcbounds : RECT*) : HRESULT
    @lpVtbl.value.on_window_opened.unsafe_as(Proc(RECT*, HRESULT)).call(prcbounds)
  end
  def on_window_updating(prcupdatedbounds : RECT*) : HRESULT
    @lpVtbl.value.on_window_updating.unsafe_as(Proc(RECT*, HRESULT)).call(prcupdatedbounds)
  end
  def on_window_updated(prcupdatedbounds : RECT*) : HRESULT
    @lpVtbl.value.on_window_updated.unsafe_as(Proc(RECT*, HRESULT)).call(prcupdatedbounds)
  end
  def on_window_closing : HRESULT
    @lpVtbl.value.on_window_closing.unsafe_as(Proc(HRESULT)).call
  end
  def on_window_closed : HRESULT
    @lpVtbl.value.on_window_closed.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITfInputScope
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_input_scopes(pprginputscopes : InputScope**, pccount : UInt32*) : HRESULT
    @lpVtbl.value.get_input_scopes.unsafe_as(Proc(InputScope**, UInt32*, HRESULT)).call(pprginputscopes, pccount)
  end
  def get_phrase(ppbstrphrases : UInt8***, pccount : UInt32*) : HRESULT
    @lpVtbl.value.get_phrase.unsafe_as(Proc(UInt8***, UInt32*, HRESULT)).call(ppbstrphrases, pccount)
  end
  def get_regular_expression(pbstrregexp : UInt8**) : HRESULT
    @lpVtbl.value.get_regular_expression.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrregexp)
  end
  def get_srgs(pbstrsrgs : UInt8**) : HRESULT
    @lpVtbl.value.get_srgs.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsrgs)
  end
  def get_xml(pbstrxml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrxml)
  end
end
struct LibWin32::ITfInputScope2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_input_scopes(pprginputscopes : InputScope**, pccount : UInt32*) : HRESULT
    @lpVtbl.value.get_input_scopes.unsafe_as(Proc(InputScope**, UInt32*, HRESULT)).call(pprginputscopes, pccount)
  end
  def get_phrase(ppbstrphrases : UInt8***, pccount : UInt32*) : HRESULT
    @lpVtbl.value.get_phrase.unsafe_as(Proc(UInt8***, UInt32*, HRESULT)).call(ppbstrphrases, pccount)
  end
  def get_regular_expression(pbstrregexp : UInt8**) : HRESULT
    @lpVtbl.value.get_regular_expression.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrregexp)
  end
  def get_srgs(pbstrsrgs : UInt8**) : HRESULT
    @lpVtbl.value.get_srgs.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrsrgs)
  end
  def get_xml(pbstrxml : UInt8**) : HRESULT
    @lpVtbl.value.get_xml.unsafe_as(Proc(UInt8**, HRESULT)).call(pbstrxml)
  end
  def enum_word_list(ppenumstring : IEnumString*) : HRESULT
    @lpVtbl.value.enum_word_list.unsafe_as(Proc(IEnumString*, HRESULT)).call(ppenumstring)
  end
end
struct LibWin32::ITfMSAAControl
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def system_enable_msaa : HRESULT
    @lpVtbl.value.system_enable_msaa.unsafe_as(Proc(HRESULT)).call
  end
  def system_disable_msaa : HRESULT
    @lpVtbl.value.system_disable_msaa.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IInternalDocWrap
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def notify_revoke : HRESULT
    @lpVtbl.value.notify_revoke.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITextStoreACPEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def scroll_to_rect(acpstart : Int32, acpend : Int32, rc : RECT, dwposition : UInt32) : HRESULT
    @lpVtbl.value.scroll_to_rect.unsafe_as(Proc(Int32, Int32, RECT, UInt32, HRESULT)).call(acpstart, acpend, rc, dwposition)
  end
end
struct LibWin32::ITextStoreAnchorEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def scroll_to_rect(pstart : IAnchor, pend : IAnchor, rc : RECT, dwposition : UInt32) : HRESULT
    @lpVtbl.value.scroll_to_rect.unsafe_as(Proc(IAnchor, IAnchor, RECT, UInt32, HRESULT)).call(pstart, pend, rc, dwposition)
  end
end
struct LibWin32::ITextStoreACPSinkEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_text_change(dwflags : TEXT_STORE_TEXT_CHANGE_FLAGS, pchange : TS_TEXTCHANGE*) : HRESULT
    @lpVtbl.value.on_text_change.unsafe_as(Proc(TEXT_STORE_TEXT_CHANGE_FLAGS, TS_TEXTCHANGE*, HRESULT)).call(dwflags, pchange)
  end
  def on_selection_change : HRESULT
    @lpVtbl.value.on_selection_change.unsafe_as(Proc(HRESULT)).call
  end
  def on_layout_change(lcode : TsLayoutCode, vcview : UInt32) : HRESULT
    @lpVtbl.value.on_layout_change.unsafe_as(Proc(TsLayoutCode, UInt32, HRESULT)).call(lcode, vcview)
  end
  def on_status_change(dwflags : UInt32) : HRESULT
    @lpVtbl.value.on_status_change.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def on_attrs_change(acpstart : Int32, acpend : Int32, cattrs : UInt32, paattrs : Guid*) : HRESULT
    @lpVtbl.value.on_attrs_change.unsafe_as(Proc(Int32, Int32, UInt32, Guid*, HRESULT)).call(acpstart, acpend, cattrs, paattrs)
  end
  def on_lock_granted(dwlockflags : TEXT_STORE_LOCK_FLAGS) : HRESULT
    @lpVtbl.value.on_lock_granted.unsafe_as(Proc(TEXT_STORE_LOCK_FLAGS, HRESULT)).call(dwlockflags)
  end
  def on_start_edit_transaction : HRESULT
    @lpVtbl.value.on_start_edit_transaction.unsafe_as(Proc(HRESULT)).call
  end
  def on_end_edit_transaction : HRESULT
    @lpVtbl.value.on_end_edit_transaction.unsafe_as(Proc(HRESULT)).call
  end
  def on_disconnect : HRESULT
    @lpVtbl.value.on_disconnect.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITextStoreSinkAnchorEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def on_text_change(dwflags : TEXT_STORE_CHANGE_FLAGS, pastart : IAnchor, paend : IAnchor) : HRESULT
    @lpVtbl.value.on_text_change.unsafe_as(Proc(TEXT_STORE_CHANGE_FLAGS, IAnchor, IAnchor, HRESULT)).call(dwflags, pastart, paend)
  end
  def on_selection_change : HRESULT
    @lpVtbl.value.on_selection_change.unsafe_as(Proc(HRESULT)).call
  end
  def on_layout_change(lcode : TsLayoutCode, vcview : UInt32) : HRESULT
    @lpVtbl.value.on_layout_change.unsafe_as(Proc(TsLayoutCode, UInt32, HRESULT)).call(lcode, vcview)
  end
  def on_status_change(dwflags : UInt32) : HRESULT
    @lpVtbl.value.on_status_change.unsafe_as(Proc(UInt32, HRESULT)).call(dwflags)
  end
  def on_attrs_change(pastart : IAnchor, paend : IAnchor, cattrs : UInt32, paattrs : Guid*) : HRESULT
    @lpVtbl.value.on_attrs_change.unsafe_as(Proc(IAnchor, IAnchor, UInt32, Guid*, HRESULT)).call(pastart, paend, cattrs, paattrs)
  end
  def on_lock_granted(dwlockflags : TEXT_STORE_LOCK_FLAGS) : HRESULT
    @lpVtbl.value.on_lock_granted.unsafe_as(Proc(TEXT_STORE_LOCK_FLAGS, HRESULT)).call(dwlockflags)
  end
  def on_start_edit_transaction : HRESULT
    @lpVtbl.value.on_start_edit_transaction.unsafe_as(Proc(HRESULT)).call
  end
  def on_end_edit_transaction : HRESULT
    @lpVtbl.value.on_end_edit_transaction.unsafe_as(Proc(HRESULT)).call
  end
  def on_disconnect : HRESULT
    @lpVtbl.value.on_disconnect.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IAccDictionary
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_localized_string(term : Guid*, lcid : UInt32, presult : UInt8**, plcid : UInt32*) : HRESULT
    @lpVtbl.value.get_localized_string.unsafe_as(Proc(Guid*, UInt32, UInt8**, UInt32*, HRESULT)).call(term, lcid, presult, plcid)
  end
  def get_parent_term(term : Guid*, pparentterm : Guid*) : HRESULT
    @lpVtbl.value.get_parent_term.unsafe_as(Proc(Guid*, Guid*, HRESULT)).call(term, pparentterm)
  end
  def get_mnemonic_string(term : Guid*, presult : UInt8**) : HRESULT
    @lpVtbl.value.get_mnemonic_string.unsafe_as(Proc(Guid*, UInt8**, HRESULT)).call(term, presult)
  end
  def lookup_mnemonic_term(bstrmnemonic : UInt8*, pterm : Guid*) : HRESULT
    @lpVtbl.value.lookup_mnemonic_term.unsafe_as(Proc(UInt8*, Guid*, HRESULT)).call(bstrmnemonic, pterm)
  end
  def convert_value_to_string(term : Guid*, lcid : UInt32, varvalue : VARIANT, pbstrresult : UInt8**, plcid : UInt32*) : HRESULT
    @lpVtbl.value.convert_value_to_string.unsafe_as(Proc(Guid*, UInt32, VARIANT, UInt8**, UInt32*, HRESULT)).call(term, lcid, varvalue, pbstrresult, plcid)
  end
end
struct LibWin32::IVersionInfo
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_subcomponent_count(ulsub : UInt32, ulcount : UInt32*) : HRESULT
    @lpVtbl.value.get_subcomponent_count.unsafe_as(Proc(UInt32, UInt32*, HRESULT)).call(ulsub, ulcount)
  end
  def get_implementation_id(ulsub : UInt32, implid : Guid*) : HRESULT
    @lpVtbl.value.get_implementation_id.unsafe_as(Proc(UInt32, Guid*, HRESULT)).call(ulsub, implid)
  end
  def get_build_version(ulsub : UInt32, pdwmajor : UInt32*, pdwminor : UInt32*) : HRESULT
    @lpVtbl.value.get_build_version.unsafe_as(Proc(UInt32, UInt32*, UInt32*, HRESULT)).call(ulsub, pdwmajor, pdwminor)
  end
  def get_component_description(ulsub : UInt32, pimplstr : UInt8**) : HRESULT
    @lpVtbl.value.get_component_description.unsafe_as(Proc(UInt32, UInt8**, HRESULT)).call(ulsub, pimplstr)
  end
  def get_instance_description(ulsub : UInt32, pimplstr : UInt8**) : HRESULT
    @lpVtbl.value.get_instance_description.unsafe_as(Proc(UInt32, UInt8**, HRESULT)).call(ulsub, pimplstr)
  end
end
struct LibWin32::ICoCreateLocally
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def co_create_locally(rclsid : Guid*, dwclscontext : UInt32, riid : Guid*, punk : IUnknown*, riidparam : Guid*, punkparam : IUnknown, varparam : VARIANT) : HRESULT
    @lpVtbl.value.co_create_locally.unsafe_as(Proc(Guid*, UInt32, Guid*, IUnknown*, Guid*, IUnknown, VARIANT, HRESULT)).call(rclsid, dwclscontext, riid, punk, riidparam, punkparam, varparam)
  end
end
struct LibWin32::ICoCreatedLocally
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def local_init(punklocalobject : IUnknown, riidparam : Guid*, punkparam : IUnknown, varparam : VARIANT) : HRESULT
    @lpVtbl.value.local_init.unsafe_as(Proc(IUnknown, Guid*, IUnknown, VARIANT, HRESULT)).call(punklocalobject, riidparam, punkparam, varparam)
  end
end
struct LibWin32::IAccStore
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register(riid : Guid*, punk : IUnknown) : HRESULT
    @lpVtbl.value.register.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(riid, punk)
  end
  def unregister(punk : IUnknown) : HRESULT
    @lpVtbl.value.unregister.unsafe_as(Proc(IUnknown, HRESULT)).call(punk)
  end
  def get_documents(enumunknown : IEnumUnknown*) : HRESULT
    @lpVtbl.value.get_documents.unsafe_as(Proc(IEnumUnknown*, HRESULT)).call(enumunknown)
  end
  def lookup_by_hwnd(hwnd : LibC::HANDLE, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.lookup_by_hwnd.unsafe_as(Proc(LibC::HANDLE, Guid*, IUnknown*, HRESULT)).call(hwnd, riid, ppunk)
  end
  def lookup_by_point(pt : POINT, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.lookup_by_point.unsafe_as(Proc(POINT, Guid*, IUnknown*, HRESULT)).call(pt, riid, ppunk)
  end
  def on_document_focus(punk : IUnknown) : HRESULT
    @lpVtbl.value.on_document_focus.unsafe_as(Proc(IUnknown, HRESULT)).call(punk)
  end
  def get_focused(riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_focused.unsafe_as(Proc(Guid*, IUnknown*, HRESULT)).call(riid, ppunk)
  end
end
struct LibWin32::IAccServerDocMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def new_document(riid : Guid*, punk : IUnknown) : HRESULT
    @lpVtbl.value.new_document.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(riid, punk)
  end
  def revoke_document(punk : IUnknown) : HRESULT
    @lpVtbl.value.revoke_document.unsafe_as(Proc(IUnknown, HRESULT)).call(punk)
  end
  def on_document_focus(punk : IUnknown) : HRESULT
    @lpVtbl.value.on_document_focus.unsafe_as(Proc(IUnknown, HRESULT)).call(punk)
  end
end
struct LibWin32::IAccClientDocMgr
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_documents(enumunknown : IEnumUnknown*) : HRESULT
    @lpVtbl.value.get_documents.unsafe_as(Proc(IEnumUnknown*, HRESULT)).call(enumunknown)
  end
  def lookup_by_hwnd(hwnd : LibC::HANDLE, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.lookup_by_hwnd.unsafe_as(Proc(LibC::HANDLE, Guid*, IUnknown*, HRESULT)).call(hwnd, riid, ppunk)
  end
  def lookup_by_point(pt : POINT, riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.lookup_by_point.unsafe_as(Proc(POINT, Guid*, IUnknown*, HRESULT)).call(pt, riid, ppunk)
  end
  def get_focused(riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_focused.unsafe_as(Proc(Guid*, IUnknown*, HRESULT)).call(riid, ppunk)
  end
end
struct LibWin32::IDocWrap
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_doc(riid : Guid*, punk : IUnknown) : HRESULT
    @lpVtbl.value.set_doc.unsafe_as(Proc(Guid*, IUnknown, HRESULT)).call(riid, punk)
  end
  def get_wrapped_doc(riid : Guid*, ppunk : IUnknown*) : HRESULT
    @lpVtbl.value.get_wrapped_doc.unsafe_as(Proc(Guid*, IUnknown*, HRESULT)).call(riid, ppunk)
  end
end
struct LibWin32::IClonableWrapper
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone_new_wrapper(riid : Guid*, ppv : Void**) : HRESULT
    @lpVtbl.value.clone_new_wrapper.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppv)
  end
end
struct LibWin32::ITfSpeechUIServer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def initialize : HRESULT
    @lpVtbl.value.initialize.unsafe_as(Proc(HRESULT)).call
  end
  def show_ui(fshow : LibC::BOOL) : HRESULT
    @lpVtbl.value.show_ui.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(fshow)
  end
  def update_balloon(style : TfLBBalloonStyle, pch : Char*, cch : UInt32) : HRESULT
    @lpVtbl.value.update_balloon.unsafe_as(Proc(TfLBBalloonStyle, Char*, UInt32, HRESULT)).call(style, pch, cch)
  end
end
