require "./../foundation.cr"
require "./../system/com.cr"
require "./windows_and_messaging.cr"
require "./../graphics/gdi.cr"

module Win32cr::UI::TextServices
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
  TF_PROCESS_ATOM = "_CTF_PROCESS_ATOM_"
  TF_ENABLE_PROCESS_ATOM = "_CTF_ENABLE_PROCESS_ATOM_"
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
  TF_FLOATINGLANGBAR_WNDTITLEW = "TF_FloatingLangBar_WndTitle"
  TF_FLOATINGLANGBAR_WNDTITLEA = "TF_FloatingLangBar_WndTitle"
  TF_FLOATINGLANGBAR_WNDTITLE = "TF_FloatingLangBar_WndTitle"
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
    TF_DTLBI_NONE = 0_u32
    TF_DTLBI_USEPROFILEICON = 1_u32
  end
  @[Flags]
  enum TEXT_STORE_TEXT_CHANGE_FLAGS : UInt32
    TS_ST_NONE = 0_u32
    TS_ST_CORRECTION = 1_u32
  end
  @[Flags]
  enum TEXT_STORE_CHANGE_FLAGS : UInt32
    TS_TC_NONE = 0_u32
    TS_TC_CORRECTION = 1_u32
  end
  enum INSERT_TEXT_AT_SELECTION_FLAGS : UInt32
    TF_IAS_NOQUERY = 1_u32
    TF_IAS_QUERYONLY = 2_u32
    TF_IAS_NO_DEFAULT_COMPOSITION = 2147483648_u32
  end
  @[Flags]
  enum ANCHOR_CHANGE_HISTORY_FLAGS : UInt32
    TS_CH_PRECEDING_DEL = 1_u32
    TS_CH_FOLLOWING_DEL = 2_u32
  end
  enum TEXT_STORE_LOCK_FLAGS : UInt32
    TS_LF_READ = 2_u32
    TS_LF_READWRITE = 6_u32
  end
  @[Flags]
  enum GET_TEXT_AND_PROPERTY_UPDATES_FLAGS : UInt32
    TF_GTP_NONE = 0_u32
    TF_GTP_INCL_TEXT = 1_u32
  end
  @[Flags]
  enum TF_CONTEXT_EDIT_CONTEXT_FLAGS : UInt32
    TF_ES_ASYNCDONTCARE = 0_u32
    TF_ES_SYNC = 1_u32
    TF_ES_READ = 2_u32
    TF_ES_READWRITE = 6_u32
    TF_ES_ASYNC = 8_u32
  end
  enum TsActiveSelEnd
    TS_AE_NONE = 0_i32
    TS_AE_START = 1_i32
    TS_AE_END = 2_i32
  end
  enum TsLayoutCode
    TS_LC_CREATE = 0_i32
    TS_LC_CHANGE = 1_i32
    TS_LC_DESTROY = 2_i32
  end
  enum TsRunType
    TS_RT_PLAIN = 0_i32
    TS_RT_HIDDEN = 1_i32
    TS_RT_OPAQUE = 2_i32
  end
  enum TsGravity
    TS_GR_BACKWARD = 0_i32
    TS_GR_FORWARD = 1_i32
  end
  enum TsShiftDir
    TS_SD_BACKWARD = 0_i32
    TS_SD_FORWARD = 1_i32
  end
  enum TfLBIClick
    TF_LBI_CLK_RIGHT = 1_i32
    TF_LBI_CLK_LEFT = 2_i32
  end
  enum TfLBBalloonStyle
    TF_LB_BALLOON_RECO = 0_i32
    TF_LB_BALLOON_SHOW = 1_i32
    TF_LB_BALLOON_MISS = 2_i32
  end
  enum TfAnchor
    TF_ANCHOR_START = 0_i32
    TF_ANCHOR_END = 1_i32
  end
  enum TfActiveSelEnd
    TF_AE_NONE = 0_i32
    TF_AE_START = 1_i32
    TF_AE_END = 2_i32
  end
  enum TfLayoutCode
    TF_LC_CREATE = 0_i32
    TF_LC_CHANGE = 1_i32
    TF_LC_DESTROY = 2_i32
  end
  enum TfGravity
    TF_GRAVITY_BACKWARD = 0_i32
    TF_GRAVITY_FORWARD = 1_i32
  end
  enum TfShiftDir
    TF_SD_BACKWARD = 0_i32
    TF_SD_FORWARD = 1_i32
  end
  enum TF_DA_LINESTYLE
    TF_LS_NONE = 0_i32
    TF_LS_SOLID = 1_i32
    TF_LS_DOT = 2_i32
    TF_LS_DASH = 3_i32
    TF_LS_SQUIGGLE = 4_i32
  end
  enum TF_DA_COLORTYPE
    TF_CT_NONE = 0_i32
    TF_CT_SYSCOLOR = 1_i32
    TF_CT_COLORREF = 2_i32
  end
  enum TF_DA_ATTR_INFO
    TF_ATTR_INPUT = 0_i32
    TF_ATTR_TARGET_CONVERTED = 1_i32
    TF_ATTR_CONVERTED = 2_i32
    TF_ATTR_TARGET_NOTCONVERTED = 3_i32
    TF_ATTR_INPUT_ERROR = 4_i32
    TF_ATTR_FIXEDCONVERTED = 5_i32
    TF_ATTR_OTHER = -1_i32
  end
  enum TfCandidateResult
    CAND_FINALIZED = 0_i32
    CAND_SELECTED = 1_i32
    CAND_CANCELED = 2_i32
  end
  enum TfSapiObject
    GETIF_RESMGR = 0_i32
    GETIF_RECOCONTEXT = 1_i32
    GETIF_RECOGNIZER = 2_i32
    GETIF_VOICE = 3_i32
    GETIF_DICTGRAM = 4_i32
    GETIF_RECOGNIZERNOINIT = 5_i32
  end
  enum TfIntegratableCandidateListSelectionStyle
    STYLE_ACTIVE_SELECTION = 0_i32
    STYLE_IMPLIED_SELECTION = 1_i32
  end
  enum TKBLayoutType
    TKBLT_UNDEFINED = 0_i32
    TKBLT_CLASSIC = 1_i32
    TKBLT_OPTIMIZED = 2_i32
  end
  enum InputScope
    IS_DEFAULT = 0_i32
    IS_URL = 1_i32
    IS_FILE_FULLFILEPATH = 2_i32
    IS_FILE_FILENAME = 3_i32
    IS_EMAIL_USERNAME = 4_i32
    IS_EMAIL_SMTPEMAILADDRESS = 5_i32
    IS_LOGINNAME = 6_i32
    IS_PERSONALNAME_FULLNAME = 7_i32
    IS_PERSONALNAME_PREFIX = 8_i32
    IS_PERSONALNAME_GIVENNAME = 9_i32
    IS_PERSONALNAME_MIDDLENAME = 10_i32
    IS_PERSONALNAME_SURNAME = 11_i32
    IS_PERSONALNAME_SUFFIX = 12_i32
    IS_ADDRESS_FULLPOSTALADDRESS = 13_i32
    IS_ADDRESS_POSTALCODE = 14_i32
    IS_ADDRESS_STREET = 15_i32
    IS_ADDRESS_STATEORPROVINCE = 16_i32
    IS_ADDRESS_CITY = 17_i32
    IS_ADDRESS_COUNTRYNAME = 18_i32
    IS_ADDRESS_COUNTRYSHORTNAME = 19_i32
    IS_CURRENCY_AMOUNTANDSYMBOL = 20_i32
    IS_CURRENCY_AMOUNT = 21_i32
    IS_DATE_FULLDATE = 22_i32
    IS_DATE_MONTH = 23_i32
    IS_DATE_DAY = 24_i32
    IS_DATE_YEAR = 25_i32
    IS_DATE_MONTHNAME = 26_i32
    IS_DATE_DAYNAME = 27_i32
    IS_DIGITS = 28_i32
    IS_NUMBER = 29_i32
    IS_ONECHAR = 30_i32
    IS_PASSWORD = 31_i32
    IS_TELEPHONE_FULLTELEPHONENUMBER = 32_i32
    IS_TELEPHONE_COUNTRYCODE = 33_i32
    IS_TELEPHONE_AREACODE = 34_i32
    IS_TELEPHONE_LOCALNUMBER = 35_i32
    IS_TIME_FULLTIME = 36_i32
    IS_TIME_HOUR = 37_i32
    IS_TIME_MINORSEC = 38_i32
    IS_NUMBER_FULLWIDTH = 39_i32
    IS_ALPHANUMERIC_HALFWIDTH = 40_i32
    IS_ALPHANUMERIC_FULLWIDTH = 41_i32
    IS_CURRENCY_CHINESE = 42_i32
    IS_BOPOMOFO = 43_i32
    IS_HIRAGANA = 44_i32
    IS_KATAKANA_HALFWIDTH = 45_i32
    IS_KATAKANA_FULLWIDTH = 46_i32
    IS_HANJA = 47_i32
    IS_HANGUL_HALFWIDTH = 48_i32
    IS_HANGUL_FULLWIDTH = 49_i32
    IS_SEARCH = 50_i32
    IS_FORMULA = 51_i32
    IS_SEARCH_INCREMENTAL = 52_i32
    IS_CHINESE_HALFWIDTH = 53_i32
    IS_CHINESE_FULLWIDTH = 54_i32
    IS_NATIVE_SCRIPT = 55_i32
    IS_YOMI = 56_i32
    IS_TEXT = 57_i32
    IS_CHAT = 58_i32
    IS_NAME_OR_PHONENUMBER = 59_i32
    IS_EMAILNAME_OR_ADDRESS = 60_i32
    IS_PRIVATE = 61_i32
    IS_MAPS = 62_i32
    IS_NUMERIC_PASSWORD = 63_i32
    IS_NUMERIC_PIN = 64_i32
    IS_ALPHANUMERIC_PIN = 65_i32
    IS_ALPHANUMERIC_PIN_SET = 66_i32
    IS_FORMULA_NUMBER = 67_i32
    IS_CHAT_WITHOUT_EMOJI = 68_i32
    IS_PHRASELIST = -1_i32
    IS_REGULAREXPRESSION = -2_i32
    IS_SRGS = -3_i32
    IS_XML = -4_i32
    IS_ENUMSTRING = -5_i32
  end

  @[Extern]
  record TS_STATUS,
    dwDynamicFlags : UInt32,
    dwStaticFlags : UInt32

  @[Extern]
  record TS_TEXTCHANGE,
    acpStart : Int32,
    acpOldEnd : Int32,
    acpNewEnd : Int32

  @[Extern]
  record TS_SELECTIONSTYLE,
    ase : Win32cr::UI::TextServices::TsActiveSelEnd,
    fInterimChar : Win32cr::Foundation::BOOL

  @[Extern]
  record TS_SELECTION_ACP,
    acpStart : Int32,
    acpEnd : Int32,
    style : Win32cr::UI::TextServices::TS_SELECTIONSTYLE

  @[Extern]
  record TS_SELECTION_ANCHOR,
    paStart : Void*,
    paEnd : Void*,
    style : Win32cr::UI::TextServices::TS_SELECTIONSTYLE

  @[Extern]
  record TS_ATTRVAL,
    idAttr : LibC::GUID,
    dwOverlapId : UInt32,
    varValue : Win32cr::System::Com::VARIANT

  @[Extern]
  record TS_RUNINFO,
    uCount : UInt32,
    type__ : Win32cr::UI::TextServices::TsRunType

  @[Extern]
  record TF_LANGBARITEMINFO,
    clsidService : LibC::GUID,
    guidItem : LibC::GUID,
    dwStyle : UInt32,
    ulSort : UInt32,
    szDescription : UInt16[32]

  @[Extern]
  record TF_LBBALLOONINFO,
    style : Win32cr::UI::TextServices::TfLBBalloonStyle,
    bstrText : Win32cr::Foundation::BSTR

  @[Extern]
  record TF_PERSISTENT_PROPERTY_HEADER_ACP,
    guidType : LibC::GUID,
    ichStart : Int32,
    cch : Int32,
    cb : UInt32,
    dwPrivate : UInt32,
    clsidTIP : LibC::GUID

  @[Extern]
  record TF_LANGUAGEPROFILE,
    clsid : LibC::GUID,
    langid : UInt16,
    catid : LibC::GUID,
    fActive : Win32cr::Foundation::BOOL,
    guidProfile : LibC::GUID

  @[Extern]
  record TF_SELECTIONSTYLE,
    ase : Win32cr::UI::TextServices::TfActiveSelEnd,
    fInterimChar : Win32cr::Foundation::BOOL

  @[Extern]
  record TF_SELECTION,
    range : Void*,
    style : Win32cr::UI::TextServices::TF_SELECTIONSTYLE

  @[Extern]
  record TF_PROPERTYVAL,
    guidId : LibC::GUID,
    varValue : Win32cr::System::Com::VARIANT

  @[Extern]
  record TF_HALTCOND,
    pHaltRange : Void*,
    aHaltPos : Win32cr::UI::TextServices::TfAnchor,
    dwFlags : UInt32

  @[Extern]
  record TF_INPUTPROCESSORPROFILE,
    dwProfileType : UInt32,
    langid : UInt16,
    clsid : LibC::GUID,
    guidProfile : LibC::GUID,
    catid : LibC::GUID,
    hklSubstitute : Win32cr::UI::TextServices::HKL,
    dwCaps : UInt32,
    hkl : Win32cr::UI::TextServices::HKL,
    dwFlags : UInt32

  @[Extern]
  record TF_PRESERVEDKEY,
    uVKey : UInt32,
    uModifiers : UInt32

  @[Extern]
  record TF_DA_COLOR,
    type__ : Win32cr::UI::TextServices::TF_DA_COLORTYPE,
    anonymous : Anonymous_e__Union do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      nIndex : Int32,
      cr : UInt32

  end

  @[Extern]
  record TF_DISPLAYATTRIBUTE,
    crText : Win32cr::UI::TextServices::TF_DA_COLOR,
    crBk : Win32cr::UI::TextServices::TF_DA_COLOR,
    lsStyle : Win32cr::UI::TextServices::TF_DA_LINESTYLE,
    fBoldLine : Win32cr::Foundation::BOOL,
    crLine : Win32cr::UI::TextServices::TF_DA_COLOR,
    bAttr : Win32cr::UI::TextServices::TF_DA_ATTR_INFO

  @[Extern]
  record TF_LMLATTELEMENT,
    dwFrameStart : UInt32,
    dwFrameLen : UInt32,
    dwFlags : UInt32,
    anonymous : Anonymous_e__Union,
    bstrText : Win32cr::Foundation::BSTR do

    # Nested Type Anonymous_e__Union
    @[Extern(union: true)]
    record Anonymous_e__Union,
      iCost : Int32

  end

  @[Extern]
  record ITextStoreACPVtbl,
    query_interface : Proc(ITextStoreACP*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextStoreACP*, UInt32),
    release : Proc(ITextStoreACP*, UInt32),
    advise_sink : Proc(ITextStoreACP*, LibC::GUID*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    unadvise_sink : Proc(ITextStoreACP*, Void*, Win32cr::Foundation::HRESULT),
    request_lock : Proc(ITextStoreACP*, UInt32, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_status : Proc(ITextStoreACP*, Win32cr::UI::TextServices::TS_STATUS*, Win32cr::Foundation::HRESULT),
    query_insert : Proc(ITextStoreACP*, Int32, Int32, UInt32, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_selection : Proc(ITextStoreACP*, UInt32, UInt32, Win32cr::UI::TextServices::TS_SELECTION_ACP*, UInt32*, Win32cr::Foundation::HRESULT),
    set_selection : Proc(ITextStoreACP*, UInt32, Win32cr::UI::TextServices::TS_SELECTION_ACP*, Win32cr::Foundation::HRESULT),
    get_text : Proc(ITextStoreACP*, Int32, Int32, UInt16*, UInt32, UInt32*, Win32cr::UI::TextServices::TS_RUNINFO*, UInt32, UInt32*, Int32*, Win32cr::Foundation::HRESULT),
    set_text : Proc(ITextStoreACP*, UInt32, Int32, Int32, UInt16*, UInt32, Win32cr::UI::TextServices::TS_TEXTCHANGE*, Win32cr::Foundation::HRESULT),
    get_formatted_text : Proc(ITextStoreACP*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_embedded : Proc(ITextStoreACP*, Int32, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    query_insert_embedded : Proc(ITextStoreACP*, LibC::GUID*, Win32cr::System::Com::FORMATETC*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    insert_embedded : Proc(ITextStoreACP*, UInt32, Int32, Int32, Void*, Win32cr::UI::TextServices::TS_TEXTCHANGE*, Win32cr::Foundation::HRESULT),
    insert_text_at_selection : Proc(ITextStoreACP*, UInt32, UInt16*, UInt32, Int32*, Int32*, Win32cr::UI::TextServices::TS_TEXTCHANGE*, Win32cr::Foundation::HRESULT),
    insert_embedded_at_selection : Proc(ITextStoreACP*, UInt32, Void*, Int32*, Int32*, Win32cr::UI::TextServices::TS_TEXTCHANGE*, Win32cr::Foundation::HRESULT),
    request_supported_attrs : Proc(ITextStoreACP*, UInt32, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    request_attrs_at_position : Proc(ITextStoreACP*, Int32, UInt32, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    request_attrs_transitioning_at_position : Proc(ITextStoreACP*, Int32, UInt32, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    find_next_attr_transition : Proc(ITextStoreACP*, Int32, Int32, UInt32, LibC::GUID*, UInt32, Int32*, Win32cr::Foundation::BOOL*, Int32*, Win32cr::Foundation::HRESULT),
    retrieve_requested_attrs : Proc(ITextStoreACP*, UInt32, Win32cr::UI::TextServices::TS_ATTRVAL*, UInt32*, Win32cr::Foundation::HRESULT),
    get_end_acp : Proc(ITextStoreACP*, Int32*, Win32cr::Foundation::HRESULT),
    get_active_view : Proc(ITextStoreACP*, UInt32*, Win32cr::Foundation::HRESULT),
    get_acp_from_point : Proc(ITextStoreACP*, UInt32, Win32cr::Foundation::POINT*, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    get_text_ext : Proc(ITextStoreACP*, UInt32, Int32, Int32, Win32cr::Foundation::RECT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_screen_ext : Proc(ITextStoreACP*, UInt32, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_wnd : Proc(ITextStoreACP*, UInt32, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("28888fe3-c2a0-483a-a3ea-8cb1ce51ff3d")]
  record ITextStoreACP, lpVtbl : ITextStoreACPVtbl* do
    GUID = LibC::GUID.new(0x28888fe3_u32, 0xc2a0_u16, 0x483a_u16, StaticArray[0xa3_u8, 0xea_u8, 0x8c_u8, 0xb1_u8, 0xce_u8, 0x51_u8, 0xff_u8, 0x3d_u8])
    def query_interface(this : ITextStoreACP*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextStoreACP*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextStoreACP*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise_sink(this : ITextStoreACP*, riid : LibC::GUID*, punk : Void*, dwMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_sink.call(this, riid, punk, dwMask)
    end
    def unadvise_sink(this : ITextStoreACP*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_sink.call(this, punk)
    end
    def request_lock(this : ITextStoreACP*, dwLockFlags : UInt32, phrSession : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_lock.call(this, dwLockFlags, phrSession)
    end
    def get_status(this : ITextStoreACP*, pdcs : Win32cr::UI::TextServices::TS_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdcs)
    end
    def query_insert(this : ITextStoreACP*, acpTestStart : Int32, acpTestEnd : Int32, cch : UInt32, pacpResultStart : Int32*, pacpResultEnd : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_insert.call(this, acpTestStart, acpTestEnd, cch, pacpResultStart, pacpResultEnd)
    end
    def get_selection(this : ITextStoreACP*, ulIndex : UInt32, ulCount : UInt32, pSelection : Win32cr::UI::TextServices::TS_SELECTION_ACP*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, ulIndex, ulCount, pSelection, pcFetched)
    end
    def set_selection(this : ITextStoreACP*, ulCount : UInt32, pSelection : Win32cr::UI::TextServices::TS_SELECTION_ACP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_selection.call(this, ulCount, pSelection)
    end
    def get_text(this : ITextStoreACP*, acpStart : Int32, acpEnd : Int32, pchPlain : UInt16*, cchPlainReq : UInt32, pcchPlainRet : UInt32*, prgRunInfo : Win32cr::UI::TextServices::TS_RUNINFO*, cRunInfoReq : UInt32, pcRunInfoRet : UInt32*, pacpNext : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, acpStart, acpEnd, pchPlain, cchPlainReq, pcchPlainRet, prgRunInfo, cRunInfoReq, pcRunInfoRet, pacpNext)
    end
    def set_text(this : ITextStoreACP*, dwFlags : UInt32, acpStart : Int32, acpEnd : Int32, pchText : UInt16*, cch : UInt32, pChange : Win32cr::UI::TextServices::TS_TEXTCHANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text.call(this, dwFlags, acpStart, acpEnd, pchText, cch, pChange)
    end
    def get_formatted_text(this : ITextStoreACP*, acpStart : Int32, acpEnd : Int32, ppDataObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_formatted_text.call(this, acpStart, acpEnd, ppDataObject)
    end
    def get_embedded(this : ITextStoreACP*, acpPos : Int32, rguidService : LibC::GUID*, riid : LibC::GUID*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_embedded.call(this, acpPos, rguidService, riid, ppunk)
    end
    def query_insert_embedded(this : ITextStoreACP*, pguidService : LibC::GUID*, pFormatEtc : Win32cr::System::Com::FORMATETC*, pfInsertable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_insert_embedded.call(this, pguidService, pFormatEtc, pfInsertable)
    end
    def insert_embedded(this : ITextStoreACP*, dwFlags : UInt32, acpStart : Int32, acpEnd : Int32, pDataObject : Void*, pChange : Win32cr::UI::TextServices::TS_TEXTCHANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_embedded.call(this, dwFlags, acpStart, acpEnd, pDataObject, pChange)
    end
    def insert_text_at_selection(this : ITextStoreACP*, dwFlags : UInt32, pchText : UInt16*, cch : UInt32, pacpStart : Int32*, pacpEnd : Int32*, pChange : Win32cr::UI::TextServices::TS_TEXTCHANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_text_at_selection.call(this, dwFlags, pchText, cch, pacpStart, pacpEnd, pChange)
    end
    def insert_embedded_at_selection(this : ITextStoreACP*, dwFlags : UInt32, pDataObject : Void*, pacpStart : Int32*, pacpEnd : Int32*, pChange : Win32cr::UI::TextServices::TS_TEXTCHANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_embedded_at_selection.call(this, dwFlags, pDataObject, pacpStart, pacpEnd, pChange)
    end
    def request_supported_attrs(this : ITextStoreACP*, dwFlags : UInt32, cFilterAttrs : UInt32, paFilterAttrs : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_supported_attrs.call(this, dwFlags, cFilterAttrs, paFilterAttrs)
    end
    def request_attrs_at_position(this : ITextStoreACP*, acpPos : Int32, cFilterAttrs : UInt32, paFilterAttrs : LibC::GUID*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_attrs_at_position.call(this, acpPos, cFilterAttrs, paFilterAttrs, dwFlags)
    end
    def request_attrs_transitioning_at_position(this : ITextStoreACP*, acpPos : Int32, cFilterAttrs : UInt32, paFilterAttrs : LibC::GUID*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_attrs_transitioning_at_position.call(this, acpPos, cFilterAttrs, paFilterAttrs, dwFlags)
    end
    def find_next_attr_transition(this : ITextStoreACP*, acpStart : Int32, acpHalt : Int32, cFilterAttrs : UInt32, paFilterAttrs : LibC::GUID*, dwFlags : UInt32, pacpNext : Int32*, pfFound : Win32cr::Foundation::BOOL*, plFoundOffset : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_next_attr_transition.call(this, acpStart, acpHalt, cFilterAttrs, paFilterAttrs, dwFlags, pacpNext, pfFound, plFoundOffset)
    end
    def retrieve_requested_attrs(this : ITextStoreACP*, ulCount : UInt32, paAttrVals : Win32cr::UI::TextServices::TS_ATTRVAL*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retrieve_requested_attrs.call(this, ulCount, paAttrVals, pcFetched)
    end
    def get_end_acp(this : ITextStoreACP*, pacp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_end_acp.call(this, pacp)
    end
    def get_active_view(this : ITextStoreACP*, pvcView : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_view.call(this, pvcView)
    end
    def get_acp_from_point(this : ITextStoreACP*, vcView : UInt32, ptScreen : Win32cr::Foundation::POINT*, dwFlags : UInt32, pacp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_acp_from_point.call(this, vcView, ptScreen, dwFlags, pacp)
    end
    def get_text_ext(this : ITextStoreACP*, vcView : UInt32, acpStart : Int32, acpEnd : Int32, prc : Win32cr::Foundation::RECT*, pfClipped : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text_ext.call(this, vcView, acpStart, acpEnd, prc, pfClipped)
    end
    def get_screen_ext(this : ITextStoreACP*, vcView : UInt32, prc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_screen_ext.call(this, vcView, prc)
    end
    def get_wnd(this : ITextStoreACP*, vcView : UInt32, phwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wnd.call(this, vcView, phwnd)
    end

  end

  @[Extern]
  record ITextStoreACP2Vtbl,
    query_interface : Proc(ITextStoreACP2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextStoreACP2*, UInt32),
    release : Proc(ITextStoreACP2*, UInt32),
    advise_sink : Proc(ITextStoreACP2*, LibC::GUID*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    unadvise_sink : Proc(ITextStoreACP2*, Void*, Win32cr::Foundation::HRESULT),
    request_lock : Proc(ITextStoreACP2*, UInt32, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_status : Proc(ITextStoreACP2*, Win32cr::UI::TextServices::TS_STATUS*, Win32cr::Foundation::HRESULT),
    query_insert : Proc(ITextStoreACP2*, Int32, Int32, UInt32, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    get_selection : Proc(ITextStoreACP2*, UInt32, UInt32, Win32cr::UI::TextServices::TS_SELECTION_ACP*, UInt32*, Win32cr::Foundation::HRESULT),
    set_selection : Proc(ITextStoreACP2*, UInt32, Win32cr::UI::TextServices::TS_SELECTION_ACP*, Win32cr::Foundation::HRESULT),
    get_text : Proc(ITextStoreACP2*, Int32, Int32, UInt16*, UInt32, UInt32*, Win32cr::UI::TextServices::TS_RUNINFO*, UInt32, UInt32*, Int32*, Win32cr::Foundation::HRESULT),
    set_text : Proc(ITextStoreACP2*, UInt32, Int32, Int32, UInt16*, UInt32, Win32cr::UI::TextServices::TS_TEXTCHANGE*, Win32cr::Foundation::HRESULT),
    get_formatted_text : Proc(ITextStoreACP2*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_embedded : Proc(ITextStoreACP2*, Int32, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    query_insert_embedded : Proc(ITextStoreACP2*, LibC::GUID*, Win32cr::System::Com::FORMATETC*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    insert_embedded : Proc(ITextStoreACP2*, UInt32, Int32, Int32, Void*, Win32cr::UI::TextServices::TS_TEXTCHANGE*, Win32cr::Foundation::HRESULT),
    insert_text_at_selection : Proc(ITextStoreACP2*, UInt32, UInt16*, UInt32, Int32*, Int32*, Win32cr::UI::TextServices::TS_TEXTCHANGE*, Win32cr::Foundation::HRESULT),
    insert_embedded_at_selection : Proc(ITextStoreACP2*, UInt32, Void*, Int32*, Int32*, Win32cr::UI::TextServices::TS_TEXTCHANGE*, Win32cr::Foundation::HRESULT),
    request_supported_attrs : Proc(ITextStoreACP2*, UInt32, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    request_attrs_at_position : Proc(ITextStoreACP2*, Int32, UInt32, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    request_attrs_transitioning_at_position : Proc(ITextStoreACP2*, Int32, UInt32, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    find_next_attr_transition : Proc(ITextStoreACP2*, Int32, Int32, UInt32, LibC::GUID*, UInt32, Int32*, Win32cr::Foundation::BOOL*, Int32*, Win32cr::Foundation::HRESULT),
    retrieve_requested_attrs : Proc(ITextStoreACP2*, UInt32, Win32cr::UI::TextServices::TS_ATTRVAL*, UInt32*, Win32cr::Foundation::HRESULT),
    get_end_acp : Proc(ITextStoreACP2*, Int32*, Win32cr::Foundation::HRESULT),
    get_active_view : Proc(ITextStoreACP2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_acp_from_point : Proc(ITextStoreACP2*, UInt32, Win32cr::Foundation::POINT*, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    get_text_ext : Proc(ITextStoreACP2*, UInt32, Int32, Int32, Win32cr::Foundation::RECT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_screen_ext : Proc(ITextStoreACP2*, UInt32, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f86ad89f-5fe4-4b8d-bb9f-ef3797a84f1f")]
  record ITextStoreACP2, lpVtbl : ITextStoreACP2Vtbl* do
    GUID = LibC::GUID.new(0xf86ad89f_u32, 0x5fe4_u16, 0x4b8d_u16, StaticArray[0xbb_u8, 0x9f_u8, 0xef_u8, 0x37_u8, 0x97_u8, 0xa8_u8, 0x4f_u8, 0x1f_u8])
    def query_interface(this : ITextStoreACP2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextStoreACP2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextStoreACP2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise_sink(this : ITextStoreACP2*, riid : LibC::GUID*, punk : Void*, dwMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_sink.call(this, riid, punk, dwMask)
    end
    def unadvise_sink(this : ITextStoreACP2*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_sink.call(this, punk)
    end
    def request_lock(this : ITextStoreACP2*, dwLockFlags : UInt32, phrSession : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_lock.call(this, dwLockFlags, phrSession)
    end
    def get_status(this : ITextStoreACP2*, pdcs : Win32cr::UI::TextServices::TS_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdcs)
    end
    def query_insert(this : ITextStoreACP2*, acpTestStart : Int32, acpTestEnd : Int32, cch : UInt32, pacpResultStart : Int32*, pacpResultEnd : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_insert.call(this, acpTestStart, acpTestEnd, cch, pacpResultStart, pacpResultEnd)
    end
    def get_selection(this : ITextStoreACP2*, ulIndex : UInt32, ulCount : UInt32, pSelection : Win32cr::UI::TextServices::TS_SELECTION_ACP*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, ulIndex, ulCount, pSelection, pcFetched)
    end
    def set_selection(this : ITextStoreACP2*, ulCount : UInt32, pSelection : Win32cr::UI::TextServices::TS_SELECTION_ACP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_selection.call(this, ulCount, pSelection)
    end
    def get_text(this : ITextStoreACP2*, acpStart : Int32, acpEnd : Int32, pchPlain : UInt16*, cchPlainReq : UInt32, pcchPlainRet : UInt32*, prgRunInfo : Win32cr::UI::TextServices::TS_RUNINFO*, cRunInfoReq : UInt32, pcRunInfoRet : UInt32*, pacpNext : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, acpStart, acpEnd, pchPlain, cchPlainReq, pcchPlainRet, prgRunInfo, cRunInfoReq, pcRunInfoRet, pacpNext)
    end
    def set_text(this : ITextStoreACP2*, dwFlags : UInt32, acpStart : Int32, acpEnd : Int32, pchText : UInt16*, cch : UInt32, pChange : Win32cr::UI::TextServices::TS_TEXTCHANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text.call(this, dwFlags, acpStart, acpEnd, pchText, cch, pChange)
    end
    def get_formatted_text(this : ITextStoreACP2*, acpStart : Int32, acpEnd : Int32, ppDataObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_formatted_text.call(this, acpStart, acpEnd, ppDataObject)
    end
    def get_embedded(this : ITextStoreACP2*, acpPos : Int32, rguidService : LibC::GUID*, riid : LibC::GUID*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_embedded.call(this, acpPos, rguidService, riid, ppunk)
    end
    def query_insert_embedded(this : ITextStoreACP2*, pguidService : LibC::GUID*, pFormatEtc : Win32cr::System::Com::FORMATETC*, pfInsertable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_insert_embedded.call(this, pguidService, pFormatEtc, pfInsertable)
    end
    def insert_embedded(this : ITextStoreACP2*, dwFlags : UInt32, acpStart : Int32, acpEnd : Int32, pDataObject : Void*, pChange : Win32cr::UI::TextServices::TS_TEXTCHANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_embedded.call(this, dwFlags, acpStart, acpEnd, pDataObject, pChange)
    end
    def insert_text_at_selection(this : ITextStoreACP2*, dwFlags : UInt32, pchText : UInt16*, cch : UInt32, pacpStart : Int32*, pacpEnd : Int32*, pChange : Win32cr::UI::TextServices::TS_TEXTCHANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_text_at_selection.call(this, dwFlags, pchText, cch, pacpStart, pacpEnd, pChange)
    end
    def insert_embedded_at_selection(this : ITextStoreACP2*, dwFlags : UInt32, pDataObject : Void*, pacpStart : Int32*, pacpEnd : Int32*, pChange : Win32cr::UI::TextServices::TS_TEXTCHANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_embedded_at_selection.call(this, dwFlags, pDataObject, pacpStart, pacpEnd, pChange)
    end
    def request_supported_attrs(this : ITextStoreACP2*, dwFlags : UInt32, cFilterAttrs : UInt32, paFilterAttrs : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_supported_attrs.call(this, dwFlags, cFilterAttrs, paFilterAttrs)
    end
    def request_attrs_at_position(this : ITextStoreACP2*, acpPos : Int32, cFilterAttrs : UInt32, paFilterAttrs : LibC::GUID*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_attrs_at_position.call(this, acpPos, cFilterAttrs, paFilterAttrs, dwFlags)
    end
    def request_attrs_transitioning_at_position(this : ITextStoreACP2*, acpPos : Int32, cFilterAttrs : UInt32, paFilterAttrs : LibC::GUID*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_attrs_transitioning_at_position.call(this, acpPos, cFilterAttrs, paFilterAttrs, dwFlags)
    end
    def find_next_attr_transition(this : ITextStoreACP2*, acpStart : Int32, acpHalt : Int32, cFilterAttrs : UInt32, paFilterAttrs : LibC::GUID*, dwFlags : UInt32, pacpNext : Int32*, pfFound : Win32cr::Foundation::BOOL*, plFoundOffset : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_next_attr_transition.call(this, acpStart, acpHalt, cFilterAttrs, paFilterAttrs, dwFlags, pacpNext, pfFound, plFoundOffset)
    end
    def retrieve_requested_attrs(this : ITextStoreACP2*, ulCount : UInt32, paAttrVals : Win32cr::UI::TextServices::TS_ATTRVAL*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retrieve_requested_attrs.call(this, ulCount, paAttrVals, pcFetched)
    end
    def get_end_acp(this : ITextStoreACP2*, pacp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_end_acp.call(this, pacp)
    end
    def get_active_view(this : ITextStoreACP2*, pvcView : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_view.call(this, pvcView)
    end
    def get_acp_from_point(this : ITextStoreACP2*, vcView : UInt32, ptScreen : Win32cr::Foundation::POINT*, dwFlags : UInt32, pacp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_acp_from_point.call(this, vcView, ptScreen, dwFlags, pacp)
    end
    def get_text_ext(this : ITextStoreACP2*, vcView : UInt32, acpStart : Int32, acpEnd : Int32, prc : Win32cr::Foundation::RECT*, pfClipped : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text_ext.call(this, vcView, acpStart, acpEnd, prc, pfClipped)
    end
    def get_screen_ext(this : ITextStoreACP2*, vcView : UInt32, prc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_screen_ext.call(this, vcView, prc)
    end

  end

  @[Extern]
  record ITextStoreACPSinkVtbl,
    query_interface : Proc(ITextStoreACPSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextStoreACPSink*, UInt32),
    release : Proc(ITextStoreACPSink*, UInt32),
    on_text_change : Proc(ITextStoreACPSink*, Win32cr::UI::TextServices::TEXT_STORE_TEXT_CHANGE_FLAGS, Win32cr::UI::TextServices::TS_TEXTCHANGE*, Win32cr::Foundation::HRESULT),
    on_selection_change : Proc(ITextStoreACPSink*, Win32cr::Foundation::HRESULT),
    on_layout_change : Proc(ITextStoreACPSink*, Win32cr::UI::TextServices::TsLayoutCode, UInt32, Win32cr::Foundation::HRESULT),
    on_status_change : Proc(ITextStoreACPSink*, UInt32, Win32cr::Foundation::HRESULT),
    on_attrs_change : Proc(ITextStoreACPSink*, Int32, Int32, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    on_lock_granted : Proc(ITextStoreACPSink*, Win32cr::UI::TextServices::TEXT_STORE_LOCK_FLAGS, Win32cr::Foundation::HRESULT),
    on_start_edit_transaction : Proc(ITextStoreACPSink*, Win32cr::Foundation::HRESULT),
    on_end_edit_transaction : Proc(ITextStoreACPSink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("22d44c94-a419-4542-a272-ae26093ececf")]
  record ITextStoreACPSink, lpVtbl : ITextStoreACPSinkVtbl* do
    GUID = LibC::GUID.new(0x22d44c94_u32, 0xa419_u16, 0x4542_u16, StaticArray[0xa2_u8, 0x72_u8, 0xae_u8, 0x26_u8, 0x9_u8, 0x3e_u8, 0xce_u8, 0xcf_u8])
    def query_interface(this : ITextStoreACPSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextStoreACPSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextStoreACPSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_text_change(this : ITextStoreACPSink*, dwFlags : Win32cr::UI::TextServices::TEXT_STORE_TEXT_CHANGE_FLAGS, pChange : Win32cr::UI::TextServices::TS_TEXTCHANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_text_change.call(this, dwFlags, pChange)
    end
    def on_selection_change(this : ITextStoreACPSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_selection_change.call(this)
    end
    def on_layout_change(this : ITextStoreACPSink*, lcode : Win32cr::UI::TextServices::TsLayoutCode, vcView : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_layout_change.call(this, lcode, vcView)
    end
    def on_status_change(this : ITextStoreACPSink*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_status_change.call(this, dwFlags)
    end
    def on_attrs_change(this : ITextStoreACPSink*, acpStart : Int32, acpEnd : Int32, cAttrs : UInt32, paAttrs : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_attrs_change.call(this, acpStart, acpEnd, cAttrs, paAttrs)
    end
    def on_lock_granted(this : ITextStoreACPSink*, dwLockFlags : Win32cr::UI::TextServices::TEXT_STORE_LOCK_FLAGS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_lock_granted.call(this, dwLockFlags)
    end
    def on_start_edit_transaction(this : ITextStoreACPSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_start_edit_transaction.call(this)
    end
    def on_end_edit_transaction(this : ITextStoreACPSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_edit_transaction.call(this)
    end

  end

  @[Extern]
  record IAnchorVtbl,
    query_interface : Proc(IAnchor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAnchor*, UInt32),
    release : Proc(IAnchor*, UInt32),
    set_gravity : Proc(IAnchor*, Win32cr::UI::TextServices::TsGravity, Win32cr::Foundation::HRESULT),
    get_gravity : Proc(IAnchor*, Win32cr::UI::TextServices::TsGravity*, Win32cr::Foundation::HRESULT),
    is_equal : Proc(IAnchor*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    compare : Proc(IAnchor*, Void*, Int32*, Win32cr::Foundation::HRESULT),
    shift : Proc(IAnchor*, UInt32, Int32, Int32*, Void*, Win32cr::Foundation::HRESULT),
    shift_to : Proc(IAnchor*, Void*, Win32cr::Foundation::HRESULT),
    shift_region : Proc(IAnchor*, UInt32, Win32cr::UI::TextServices::TsShiftDir, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_change_history_mask : Proc(IAnchor*, UInt32, Win32cr::Foundation::HRESULT),
    get_change_history : Proc(IAnchor*, Win32cr::UI::TextServices::ANCHOR_CHANGE_HISTORY_FLAGS*, Win32cr::Foundation::HRESULT),
    clear_change_history : Proc(IAnchor*, Win32cr::Foundation::HRESULT),
    clone : Proc(IAnchor*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0feb7e34-5a60-4356-8ef7-abdec2ff7cf8")]
  record IAnchor, lpVtbl : IAnchorVtbl* do
    GUID = LibC::GUID.new(0xfeb7e34_u32, 0x5a60_u16, 0x4356_u16, StaticArray[0x8e_u8, 0xf7_u8, 0xab_u8, 0xde_u8, 0xc2_u8, 0xff_u8, 0x7c_u8, 0xf8_u8])
    def query_interface(this : IAnchor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAnchor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAnchor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_gravity(this : IAnchor*, gravity : Win32cr::UI::TextServices::TsGravity) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gravity.call(this, gravity)
    end
    def get_gravity(this : IAnchor*, pgravity : Win32cr::UI::TextServices::TsGravity*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gravity.call(this, pgravity)
    end
    def is_equal(this : IAnchor*, paWith : Void*, pfEqual : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal.call(this, paWith, pfEqual)
    end
    def compare(this : IAnchor*, paWith : Void*, plResult : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare.call(this, paWith, plResult)
    end
    def shift(this : IAnchor*, dwFlags : UInt32, cchReq : Int32, pcch : Int32*, paHaltAnchor : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift.call(this, dwFlags, cchReq, pcch, paHaltAnchor)
    end
    def shift_to(this : IAnchor*, paSite : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_to.call(this, paSite)
    end
    def shift_region(this : IAnchor*, dwFlags : UInt32, dir : Win32cr::UI::TextServices::TsShiftDir, pfNoRegion : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_region.call(this, dwFlags, dir, pfNoRegion)
    end
    def set_change_history_mask(this : IAnchor*, dwMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_change_history_mask.call(this, dwMask)
    end
    def get_change_history(this : IAnchor*, pdwHistory : Win32cr::UI::TextServices::ANCHOR_CHANGE_HISTORY_FLAGS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_change_history.call(this, pdwHistory)
    end
    def clear_change_history(this : IAnchor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_change_history.call(this)
    end
    def clone(this : IAnchor*, ppaClone : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppaClone)
    end

  end

  @[Extern]
  record ITextStoreAnchorVtbl,
    query_interface : Proc(ITextStoreAnchor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextStoreAnchor*, UInt32),
    release : Proc(ITextStoreAnchor*, UInt32),
    advise_sink : Proc(ITextStoreAnchor*, LibC::GUID*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    unadvise_sink : Proc(ITextStoreAnchor*, Void*, Win32cr::Foundation::HRESULT),
    request_lock : Proc(ITextStoreAnchor*, UInt32, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_status : Proc(ITextStoreAnchor*, Win32cr::UI::TextServices::TS_STATUS*, Win32cr::Foundation::HRESULT),
    query_insert : Proc(ITextStoreAnchor*, Void*, Void*, UInt32, Void**, Void**, Win32cr::Foundation::HRESULT),
    get_selection : Proc(ITextStoreAnchor*, UInt32, UInt32, Win32cr::UI::TextServices::TS_SELECTION_ANCHOR*, UInt32*, Win32cr::Foundation::HRESULT),
    set_selection : Proc(ITextStoreAnchor*, UInt32, Win32cr::UI::TextServices::TS_SELECTION_ANCHOR*, Win32cr::Foundation::HRESULT),
    get_text : Proc(ITextStoreAnchor*, UInt32, Void*, Void*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_text : Proc(ITextStoreAnchor*, UInt32, Void*, Void*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_formatted_text : Proc(ITextStoreAnchor*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_embedded : Proc(ITextStoreAnchor*, UInt32, Void*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    insert_embedded : Proc(ITextStoreAnchor*, UInt32, Void*, Void*, Void*, Win32cr::Foundation::HRESULT),
    request_supported_attrs : Proc(ITextStoreAnchor*, UInt32, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    request_attrs_at_position : Proc(ITextStoreAnchor*, Void*, UInt32, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    request_attrs_transitioning_at_position : Proc(ITextStoreAnchor*, Void*, UInt32, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    find_next_attr_transition : Proc(ITextStoreAnchor*, Void*, Void*, UInt32, LibC::GUID*, UInt32, Win32cr::Foundation::BOOL*, Int32*, Win32cr::Foundation::HRESULT),
    retrieve_requested_attrs : Proc(ITextStoreAnchor*, UInt32, Win32cr::UI::TextServices::TS_ATTRVAL*, UInt32*, Win32cr::Foundation::HRESULT),
    get_start : Proc(ITextStoreAnchor*, Void**, Win32cr::Foundation::HRESULT),
    get_end : Proc(ITextStoreAnchor*, Void**, Win32cr::Foundation::HRESULT),
    get_active_view : Proc(ITextStoreAnchor*, UInt32*, Win32cr::Foundation::HRESULT),
    get_anchor_from_point : Proc(ITextStoreAnchor*, UInt32, Win32cr::Foundation::POINT*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_text_ext : Proc(ITextStoreAnchor*, UInt32, Void*, Void*, Win32cr::Foundation::RECT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_screen_ext : Proc(ITextStoreAnchor*, UInt32, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_wnd : Proc(ITextStoreAnchor*, UInt32, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    query_insert_embedded : Proc(ITextStoreAnchor*, LibC::GUID*, Win32cr::System::Com::FORMATETC*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    insert_text_at_selection : Proc(ITextStoreAnchor*, UInt32, UInt16*, UInt32, Void**, Void**, Win32cr::Foundation::HRESULT),
    insert_embedded_at_selection : Proc(ITextStoreAnchor*, UInt32, Void*, Void**, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9b2077b0-5f18-4dec-bee9-3cc722f5dfe0")]
  record ITextStoreAnchor, lpVtbl : ITextStoreAnchorVtbl* do
    GUID = LibC::GUID.new(0x9b2077b0_u32, 0x5f18_u16, 0x4dec_u16, StaticArray[0xbe_u8, 0xe9_u8, 0x3c_u8, 0xc7_u8, 0x22_u8, 0xf5_u8, 0xdf_u8, 0xe0_u8])
    def query_interface(this : ITextStoreAnchor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextStoreAnchor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextStoreAnchor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise_sink(this : ITextStoreAnchor*, riid : LibC::GUID*, punk : Void*, dwMask : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_sink.call(this, riid, punk, dwMask)
    end
    def unadvise_sink(this : ITextStoreAnchor*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_sink.call(this, punk)
    end
    def request_lock(this : ITextStoreAnchor*, dwLockFlags : UInt32, phrSession : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_lock.call(this, dwLockFlags, phrSession)
    end
    def get_status(this : ITextStoreAnchor*, pdcs : Win32cr::UI::TextServices::TS_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdcs)
    end
    def query_insert(this : ITextStoreAnchor*, paTestStart : Void*, paTestEnd : Void*, cch : UInt32, ppaResultStart : Void**, ppaResultEnd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_insert.call(this, paTestStart, paTestEnd, cch, ppaResultStart, ppaResultEnd)
    end
    def get_selection(this : ITextStoreAnchor*, ulIndex : UInt32, ulCount : UInt32, pSelection : Win32cr::UI::TextServices::TS_SELECTION_ANCHOR*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, ulIndex, ulCount, pSelection, pcFetched)
    end
    def set_selection(this : ITextStoreAnchor*, ulCount : UInt32, pSelection : Win32cr::UI::TextServices::TS_SELECTION_ANCHOR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_selection.call(this, ulCount, pSelection)
    end
    def get_text(this : ITextStoreAnchor*, dwFlags : UInt32, paStart : Void*, paEnd : Void*, pchText : UInt16*, cchReq : UInt32, pcch : UInt32*, fUpdateAnchor : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, dwFlags, paStart, paEnd, pchText, cchReq, pcch, fUpdateAnchor)
    end
    def set_text(this : ITextStoreAnchor*, dwFlags : UInt32, paStart : Void*, paEnd : Void*, pchText : UInt16*, cch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text.call(this, dwFlags, paStart, paEnd, pchText, cch)
    end
    def get_formatted_text(this : ITextStoreAnchor*, paStart : Void*, paEnd : Void*, ppDataObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_formatted_text.call(this, paStart, paEnd, ppDataObject)
    end
    def get_embedded(this : ITextStoreAnchor*, dwFlags : UInt32, paPos : Void*, rguidService : LibC::GUID*, riid : LibC::GUID*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_embedded.call(this, dwFlags, paPos, rguidService, riid, ppunk)
    end
    def insert_embedded(this : ITextStoreAnchor*, dwFlags : UInt32, paStart : Void*, paEnd : Void*, pDataObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_embedded.call(this, dwFlags, paStart, paEnd, pDataObject)
    end
    def request_supported_attrs(this : ITextStoreAnchor*, dwFlags : UInt32, cFilterAttrs : UInt32, paFilterAttrs : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_supported_attrs.call(this, dwFlags, cFilterAttrs, paFilterAttrs)
    end
    def request_attrs_at_position(this : ITextStoreAnchor*, paPos : Void*, cFilterAttrs : UInt32, paFilterAttrs : LibC::GUID*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_attrs_at_position.call(this, paPos, cFilterAttrs, paFilterAttrs, dwFlags)
    end
    def request_attrs_transitioning_at_position(this : ITextStoreAnchor*, paPos : Void*, cFilterAttrs : UInt32, paFilterAttrs : LibC::GUID*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_attrs_transitioning_at_position.call(this, paPos, cFilterAttrs, paFilterAttrs, dwFlags)
    end
    def find_next_attr_transition(this : ITextStoreAnchor*, paStart : Void*, paHalt : Void*, cFilterAttrs : UInt32, paFilterAttrs : LibC::GUID*, dwFlags : UInt32, pfFound : Win32cr::Foundation::BOOL*, plFoundOffset : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_next_attr_transition.call(this, paStart, paHalt, cFilterAttrs, paFilterAttrs, dwFlags, pfFound, plFoundOffset)
    end
    def retrieve_requested_attrs(this : ITextStoreAnchor*, ulCount : UInt32, paAttrVals : Win32cr::UI::TextServices::TS_ATTRVAL*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.retrieve_requested_attrs.call(this, ulCount, paAttrVals, pcFetched)
    end
    def get_start(this : ITextStoreAnchor*, ppaStart : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_start.call(this, ppaStart)
    end
    def get_end(this : ITextStoreAnchor*, ppaEnd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_end.call(this, ppaEnd)
    end
    def get_active_view(this : ITextStoreAnchor*, pvcView : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_view.call(this, pvcView)
    end
    def get_anchor_from_point(this : ITextStoreAnchor*, vcView : UInt32, ptScreen : Win32cr::Foundation::POINT*, dwFlags : UInt32, ppaSite : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_anchor_from_point.call(this, vcView, ptScreen, dwFlags, ppaSite)
    end
    def get_text_ext(this : ITextStoreAnchor*, vcView : UInt32, paStart : Void*, paEnd : Void*, prc : Win32cr::Foundation::RECT*, pfClipped : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text_ext.call(this, vcView, paStart, paEnd, prc, pfClipped)
    end
    def get_screen_ext(this : ITextStoreAnchor*, vcView : UInt32, prc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_screen_ext.call(this, vcView, prc)
    end
    def get_wnd(this : ITextStoreAnchor*, vcView : UInt32, phwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wnd.call(this, vcView, phwnd)
    end
    def query_insert_embedded(this : ITextStoreAnchor*, pguidService : LibC::GUID*, pFormatEtc : Win32cr::System::Com::FORMATETC*, pfInsertable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_insert_embedded.call(this, pguidService, pFormatEtc, pfInsertable)
    end
    def insert_text_at_selection(this : ITextStoreAnchor*, dwFlags : UInt32, pchText : UInt16*, cch : UInt32, ppaStart : Void**, ppaEnd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_text_at_selection.call(this, dwFlags, pchText, cch, ppaStart, ppaEnd)
    end
    def insert_embedded_at_selection(this : ITextStoreAnchor*, dwFlags : UInt32, pDataObject : Void*, ppaStart : Void**, ppaEnd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_embedded_at_selection.call(this, dwFlags, pDataObject, ppaStart, ppaEnd)
    end

  end

  @[Extern]
  record ITextStoreAnchorSinkVtbl,
    query_interface : Proc(ITextStoreAnchorSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextStoreAnchorSink*, UInt32),
    release : Proc(ITextStoreAnchorSink*, UInt32),
    on_text_change : Proc(ITextStoreAnchorSink*, Win32cr::UI::TextServices::TEXT_STORE_CHANGE_FLAGS, Void*, Void*, Win32cr::Foundation::HRESULT),
    on_selection_change : Proc(ITextStoreAnchorSink*, Win32cr::Foundation::HRESULT),
    on_layout_change : Proc(ITextStoreAnchorSink*, Win32cr::UI::TextServices::TsLayoutCode, UInt32, Win32cr::Foundation::HRESULT),
    on_status_change : Proc(ITextStoreAnchorSink*, UInt32, Win32cr::Foundation::HRESULT),
    on_attrs_change : Proc(ITextStoreAnchorSink*, Void*, Void*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    on_lock_granted : Proc(ITextStoreAnchorSink*, Win32cr::UI::TextServices::TEXT_STORE_LOCK_FLAGS, Win32cr::Foundation::HRESULT),
    on_start_edit_transaction : Proc(ITextStoreAnchorSink*, Win32cr::Foundation::HRESULT),
    on_end_edit_transaction : Proc(ITextStoreAnchorSink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aa80e905-2021-11d2-93e0-0060b067b86e")]
  record ITextStoreAnchorSink, lpVtbl : ITextStoreAnchorSinkVtbl* do
    GUID = LibC::GUID.new(0xaa80e905_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : ITextStoreAnchorSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextStoreAnchorSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextStoreAnchorSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_text_change(this : ITextStoreAnchorSink*, dwFlags : Win32cr::UI::TextServices::TEXT_STORE_CHANGE_FLAGS, paStart : Void*, paEnd : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_text_change.call(this, dwFlags, paStart, paEnd)
    end
    def on_selection_change(this : ITextStoreAnchorSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_selection_change.call(this)
    end
    def on_layout_change(this : ITextStoreAnchorSink*, lcode : Win32cr::UI::TextServices::TsLayoutCode, vcView : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_layout_change.call(this, lcode, vcView)
    end
    def on_status_change(this : ITextStoreAnchorSink*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_status_change.call(this, dwFlags)
    end
    def on_attrs_change(this : ITextStoreAnchorSink*, paStart : Void*, paEnd : Void*, cAttrs : UInt32, paAttrs : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_attrs_change.call(this, paStart, paEnd, cAttrs, paAttrs)
    end
    def on_lock_granted(this : ITextStoreAnchorSink*, dwLockFlags : Win32cr::UI::TextServices::TEXT_STORE_LOCK_FLAGS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_lock_granted.call(this, dwLockFlags)
    end
    def on_start_edit_transaction(this : ITextStoreAnchorSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_start_edit_transaction.call(this)
    end
    def on_end_edit_transaction(this : ITextStoreAnchorSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_edit_transaction.call(this)
    end

  end

  @[Extern]
  record ITfLangBarMgrVtbl,
    query_interface : Proc(ITfLangBarMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfLangBarMgr*, UInt32),
    release : Proc(ITfLangBarMgr*, UInt32),
    advise_event_sink : Proc(ITfLangBarMgr*, Void*, Win32cr::Foundation::HWND, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    unadvise_event_sink : Proc(ITfLangBarMgr*, UInt32, Win32cr::Foundation::HRESULT),
    get_thread_marshal_interface : Proc(ITfLangBarMgr*, UInt32, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_thread_lang_bar_item_mgr : Proc(ITfLangBarMgr*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    get_input_processor_profiles : Proc(ITfLangBarMgr*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    restore_last_focus : Proc(ITfLangBarMgr*, UInt32*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_modal_input : Proc(ITfLangBarMgr*, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    show_floating : Proc(ITfLangBarMgr*, UInt32, Win32cr::Foundation::HRESULT),
    get_show_floating_status : Proc(ITfLangBarMgr*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("87955690-e627-11d2-8ddb-00105a2799b5")]
  record ITfLangBarMgr, lpVtbl : ITfLangBarMgrVtbl* do
    GUID = LibC::GUID.new(0x87955690_u32, 0xe627_u16, 0x11d2_u16, StaticArray[0x8d_u8, 0xdb_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : ITfLangBarMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfLangBarMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfLangBarMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise_event_sink(this : ITfLangBarMgr*, pSink : Void*, hwnd : Win32cr::Foundation::HWND, dwFlags : UInt32, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_event_sink.call(this, pSink, hwnd, dwFlags, pdwCookie)
    end
    def unadvise_event_sink(this : ITfLangBarMgr*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_event_sink.call(this, dwCookie)
    end
    def get_thread_marshal_interface(this : ITfLangBarMgr*, dwThreadId : UInt32, dwType : UInt32, riid : LibC::GUID*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_marshal_interface.call(this, dwThreadId, dwType, riid, ppunk)
    end
    def get_thread_lang_bar_item_mgr(this : ITfLangBarMgr*, dwThreadId : UInt32, pplbi : Void**, pdwThreadid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_thread_lang_bar_item_mgr.call(this, dwThreadId, pplbi, pdwThreadid)
    end
    def get_input_processor_profiles(this : ITfLangBarMgr*, dwThreadId : UInt32, ppaip : Void**, pdwThreadid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_processor_profiles.call(this, dwThreadId, ppaip, pdwThreadid)
    end
    def restore_last_focus(this : ITfLangBarMgr*, pdwThreadId : UInt32*, fPrev : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_last_focus.call(this, pdwThreadId, fPrev)
    end
    def set_modal_input(this : ITfLangBarMgr*, pSink : Void*, dwThreadId : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_modal_input.call(this, pSink, dwThreadId, dwFlags)
    end
    def show_floating(this : ITfLangBarMgr*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_floating.call(this, dwFlags)
    end
    def get_show_floating_status(this : ITfLangBarMgr*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_show_floating_status.call(this, pdwFlags)
    end

  end

  @[Extern]
  record ITfLangBarEventSinkVtbl,
    query_interface : Proc(ITfLangBarEventSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfLangBarEventSink*, UInt32),
    release : Proc(ITfLangBarEventSink*, UInt32),
    on_set_focus : Proc(ITfLangBarEventSink*, UInt32, Win32cr::Foundation::HRESULT),
    on_thread_terminate : Proc(ITfLangBarEventSink*, UInt32, Win32cr::Foundation::HRESULT),
    on_thread_item_change : Proc(ITfLangBarEventSink*, UInt32, Win32cr::Foundation::HRESULT),
    on_modal_input : Proc(ITfLangBarEventSink*, UInt32, UInt32, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    show_floating : Proc(ITfLangBarEventSink*, UInt32, Win32cr::Foundation::HRESULT),
    get_item_floating_rect : Proc(ITfLangBarEventSink*, UInt32, LibC::GUID*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("18a4e900-e0ae-11d2-afdd-00105a2799b5")]
  record ITfLangBarEventSink, lpVtbl : ITfLangBarEventSinkVtbl* do
    GUID = LibC::GUID.new(0x18a4e900_u32, 0xe0ae_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xdd_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : ITfLangBarEventSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfLangBarEventSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfLangBarEventSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_set_focus(this : ITfLangBarEventSink*, dwThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_focus.call(this, dwThreadId)
    end
    def on_thread_terminate(this : ITfLangBarEventSink*, dwThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_thread_terminate.call(this, dwThreadId)
    end
    def on_thread_item_change(this : ITfLangBarEventSink*, dwThreadId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_thread_item_change.call(this, dwThreadId)
    end
    def on_modal_input(this : ITfLangBarEventSink*, dwThreadId : UInt32, uMsg : UInt32, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_modal_input.call(this, dwThreadId, uMsg, wParam, lParam)
    end
    def show_floating(this : ITfLangBarEventSink*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_floating.call(this, dwFlags)
    end
    def get_item_floating_rect(this : ITfLangBarEventSink*, dwThreadId : UInt32, rguid : LibC::GUID*, prc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_floating_rect.call(this, dwThreadId, rguid, prc)
    end

  end

  @[Extern]
  record ITfLangBarItemSinkVtbl,
    query_interface : Proc(ITfLangBarItemSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfLangBarItemSink*, UInt32),
    release : Proc(ITfLangBarItemSink*, UInt32),
    on_update : Proc(ITfLangBarItemSink*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("57dbe1a0-de25-11d2-afdd-00105a2799b5")]
  record ITfLangBarItemSink, lpVtbl : ITfLangBarItemSinkVtbl* do
    GUID = LibC::GUID.new(0x57dbe1a0_u32, 0xde25_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xdd_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : ITfLangBarItemSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfLangBarItemSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfLangBarItemSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_update(this : ITfLangBarItemSink*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_update.call(this, dwFlags)
    end

  end

  @[Extern]
  record IEnumTfLangBarItemsVtbl,
    query_interface : Proc(IEnumTfLangBarItems*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTfLangBarItems*, UInt32),
    release : Proc(IEnumTfLangBarItems*, UInt32),
    clone : Proc(IEnumTfLangBarItems*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumTfLangBarItems*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTfLangBarItems*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTfLangBarItems*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("583f34d0-de25-11d2-afdd-00105a2799b5")]
  record IEnumTfLangBarItems, lpVtbl : IEnumTfLangBarItemsVtbl* do
    GUID = LibC::GUID.new(0x583f34d0_u32, 0xde25_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xdd_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : IEnumTfLangBarItems*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTfLangBarItems*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTfLangBarItems*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumTfLangBarItems*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumTfLangBarItems*, ulCount : UInt32, ppItem : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, ppItem, pcFetched)
    end
    def reset(this : IEnumTfLangBarItems*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumTfLangBarItems*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfLangBarItemMgrVtbl,
    query_interface : Proc(ITfLangBarItemMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfLangBarItemMgr*, UInt32),
    release : Proc(ITfLangBarItemMgr*, UInt32),
    enum_items : Proc(ITfLangBarItemMgr*, Void**, Win32cr::Foundation::HRESULT),
    get_item : Proc(ITfLangBarItemMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_item : Proc(ITfLangBarItemMgr*, Void*, Win32cr::Foundation::HRESULT),
    remove_item : Proc(ITfLangBarItemMgr*, Void*, Win32cr::Foundation::HRESULT),
    advise_item_sink : Proc(ITfLangBarItemMgr*, Void*, UInt32*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    unadvise_item_sink : Proc(ITfLangBarItemMgr*, UInt32, Win32cr::Foundation::HRESULT),
    get_item_floating_rect : Proc(ITfLangBarItemMgr*, UInt32, LibC::GUID*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_items_status : Proc(ITfLangBarItemMgr*, UInt32, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_item_num : Proc(ITfLangBarItemMgr*, UInt32*, Win32cr::Foundation::HRESULT),
    get_items : Proc(ITfLangBarItemMgr*, UInt32, Void**, Win32cr::UI::TextServices::TF_LANGBARITEMINFO*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    advise_items_sink : Proc(ITfLangBarItemMgr*, UInt32, Void**, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    unadvise_items_sink : Proc(ITfLangBarItemMgr*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ba468c55-9956-4fb1-a59d-52a7dd7cc6aa")]
  record ITfLangBarItemMgr, lpVtbl : ITfLangBarItemMgrVtbl* do
    GUID = LibC::GUID.new(0xba468c55_u32, 0x9956_u16, 0x4fb1_u16, StaticArray[0xa5_u8, 0x9d_u8, 0x52_u8, 0xa7_u8, 0xdd_u8, 0x7c_u8, 0xc6_u8, 0xaa_u8])
    def query_interface(this : ITfLangBarItemMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfLangBarItemMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfLangBarItemMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_items(this : ITfLangBarItemMgr*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_items.call(this, ppEnum)
    end
    def get_item(this : ITfLangBarItemMgr*, rguid : LibC::GUID*, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item.call(this, rguid, ppItem)
    end
    def add_item(this : ITfLangBarItemMgr*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_item.call(this, punk)
    end
    def remove_item(this : ITfLangBarItemMgr*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_item.call(this, punk)
    end
    def advise_item_sink(this : ITfLangBarItemMgr*, punk : Void*, pdwCookie : UInt32*, rguidItem : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_item_sink.call(this, punk, pdwCookie, rguidItem)
    end
    def unadvise_item_sink(this : ITfLangBarItemMgr*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_item_sink.call(this, dwCookie)
    end
    def get_item_floating_rect(this : ITfLangBarItemMgr*, dwThreadId : UInt32, rguid : LibC::GUID*, prc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_floating_rect.call(this, dwThreadId, rguid, prc)
    end
    def get_items_status(this : ITfLangBarItemMgr*, ulCount : UInt32, prgguid : LibC::GUID*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_items_status.call(this, ulCount, prgguid, pdwStatus)
    end
    def get_item_num(this : ITfLangBarItemMgr*, pulCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_num.call(this, pulCount)
    end
    def get_items(this : ITfLangBarItemMgr*, ulCount : UInt32, ppItem : Void**, pInfo : Win32cr::UI::TextServices::TF_LANGBARITEMINFO*, pdwStatus : UInt32*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_items.call(this, ulCount, ppItem, pInfo, pdwStatus, pcFetched)
    end
    def advise_items_sink(this : ITfLangBarItemMgr*, ulCount : UInt32, ppunk : Void**, pguidItem : LibC::GUID*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_items_sink.call(this, ulCount, ppunk, pguidItem, pdwCookie)
    end
    def unadvise_items_sink(this : ITfLangBarItemMgr*, ulCount : UInt32, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_items_sink.call(this, ulCount, pdwCookie)
    end

  end

  @[Extern]
  record ITfLangBarItemVtbl,
    query_interface : Proc(ITfLangBarItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfLangBarItem*, UInt32),
    release : Proc(ITfLangBarItem*, UInt32),
    get_info : Proc(ITfLangBarItem*, Win32cr::UI::TextServices::TF_LANGBARITEMINFO*, Win32cr::Foundation::HRESULT),
    get_status : Proc(ITfLangBarItem*, UInt32*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfLangBarItem*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_tooltip_string : Proc(ITfLangBarItem*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("73540d69-edeb-4ee9-96c9-23aa30b25916")]
  record ITfLangBarItem, lpVtbl : ITfLangBarItemVtbl* do
    GUID = LibC::GUID.new(0x73540d69_u32, 0xedeb_u16, 0x4ee9_u16, StaticArray[0x96_u8, 0xc9_u8, 0x23_u8, 0xaa_u8, 0x30_u8, 0xb2_u8, 0x59_u8, 0x16_u8])
    def query_interface(this : ITfLangBarItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfLangBarItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfLangBarItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_info(this : ITfLangBarItem*, pInfo : Win32cr::UI::TextServices::TF_LANGBARITEMINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info.call(this, pInfo)
    end
    def get_status(this : ITfLangBarItem*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def show(this : ITfLangBarItem*, fShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, fShow)
    end
    def get_tooltip_string(this : ITfLangBarItem*, pbstrToolTip : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tooltip_string.call(this, pbstrToolTip)
    end

  end

  @[Extern]
  record ITfSystemLangBarItemSinkVtbl,
    query_interface : Proc(ITfSystemLangBarItemSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfSystemLangBarItemSink*, UInt32),
    release : Proc(ITfSystemLangBarItemSink*, UInt32),
    init_menu : Proc(ITfSystemLangBarItemSink*, Void*, Win32cr::Foundation::HRESULT),
    on_menu_select : Proc(ITfSystemLangBarItemSink*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1449d9ab-13cf-4687-aa3e-8d8b18574396")]
  record ITfSystemLangBarItemSink, lpVtbl : ITfSystemLangBarItemSinkVtbl* do
    GUID = LibC::GUID.new(0x1449d9ab_u32, 0x13cf_u16, 0x4687_u16, StaticArray[0xaa_u8, 0x3e_u8, 0x8d_u8, 0x8b_u8, 0x18_u8, 0x57_u8, 0x43_u8, 0x96_u8])
    def query_interface(this : ITfSystemLangBarItemSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfSystemLangBarItemSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfSystemLangBarItemSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def init_menu(this : ITfSystemLangBarItemSink*, pMenu : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_menu.call(this, pMenu)
    end
    def on_menu_select(this : ITfSystemLangBarItemSink*, wID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_menu_select.call(this, wID)
    end

  end

  @[Extern]
  record ITfSystemLangBarItemVtbl,
    query_interface : Proc(ITfSystemLangBarItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfSystemLangBarItem*, UInt32),
    release : Proc(ITfSystemLangBarItem*, UInt32),
    set_icon : Proc(ITfSystemLangBarItem*, Win32cr::UI::WindowsAndMessaging::HICON, Win32cr::Foundation::HRESULT),
    set_tooltip_string : Proc(ITfSystemLangBarItem*, UInt16*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1e13e9ec-6b33-4d4a-b5eb-8a92f029f356")]
  record ITfSystemLangBarItem, lpVtbl : ITfSystemLangBarItemVtbl* do
    GUID = LibC::GUID.new(0x1e13e9ec_u32, 0x6b33_u16, 0x4d4a_u16, StaticArray[0xb5_u8, 0xeb_u8, 0x8a_u8, 0x92_u8, 0xf0_u8, 0x29_u8, 0xf3_u8, 0x56_u8])
    def query_interface(this : ITfSystemLangBarItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfSystemLangBarItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfSystemLangBarItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_icon(this : ITfSystemLangBarItem*, hIcon : Win32cr::UI::WindowsAndMessaging::HICON) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_icon.call(this, hIcon)
    end
    def set_tooltip_string(this : ITfSystemLangBarItem*, pchToolTip : UInt16*, cch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_tooltip_string.call(this, pchToolTip, cch)
    end

  end

  @[Extern]
  record ITfSystemLangBarItemTextVtbl,
    query_interface : Proc(ITfSystemLangBarItemText*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfSystemLangBarItemText*, UInt32),
    release : Proc(ITfSystemLangBarItemText*, UInt32),
    set_item_text : Proc(ITfSystemLangBarItemText*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_item_text : Proc(ITfSystemLangBarItemText*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5c4ce0e5-ba49-4b52-ac6b-3b397b4f701f")]
  record ITfSystemLangBarItemText, lpVtbl : ITfSystemLangBarItemTextVtbl* do
    GUID = LibC::GUID.new(0x5c4ce0e5_u32, 0xba49_u16, 0x4b52_u16, StaticArray[0xac_u8, 0x6b_u8, 0x3b_u8, 0x39_u8, 0x7b_u8, 0x4f_u8, 0x70_u8, 0x1f_u8])
    def query_interface(this : ITfSystemLangBarItemText*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfSystemLangBarItemText*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfSystemLangBarItemText*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_item_text(this : ITfSystemLangBarItemText*, pch : UInt16*, cch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_item_text.call(this, pch, cch)
    end
    def get_item_text(this : ITfSystemLangBarItemText*, pbstrText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_text.call(this, pbstrText)
    end

  end

  @[Extern]
  record ITfSystemDeviceTypeLangBarItemVtbl,
    query_interface : Proc(ITfSystemDeviceTypeLangBarItem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfSystemDeviceTypeLangBarItem*, UInt32),
    release : Proc(ITfSystemDeviceTypeLangBarItem*, UInt32),
    set_icon_mode : Proc(ITfSystemDeviceTypeLangBarItem*, Win32cr::UI::TextServices::LANG_BAR_ITEM_ICON_MODE_FLAGS, Win32cr::Foundation::HRESULT),
    get_icon_mode : Proc(ITfSystemDeviceTypeLangBarItem*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("45672eb9-9059-46a2-838d-4530355f6a77")]
  record ITfSystemDeviceTypeLangBarItem, lpVtbl : ITfSystemDeviceTypeLangBarItemVtbl* do
    GUID = LibC::GUID.new(0x45672eb9_u32, 0x9059_u16, 0x46a2_u16, StaticArray[0x83_u8, 0x8d_u8, 0x45_u8, 0x30_u8, 0x35_u8, 0x5f_u8, 0x6a_u8, 0x77_u8])
    def query_interface(this : ITfSystemDeviceTypeLangBarItem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfSystemDeviceTypeLangBarItem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfSystemDeviceTypeLangBarItem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_icon_mode(this : ITfSystemDeviceTypeLangBarItem*, dwFlags : Win32cr::UI::TextServices::LANG_BAR_ITEM_ICON_MODE_FLAGS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_icon_mode.call(this, dwFlags)
    end
    def get_icon_mode(this : ITfSystemDeviceTypeLangBarItem*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_icon_mode.call(this, pdwFlags)
    end

  end

  @[Extern]
  record ITfLangBarItemButtonVtbl,
    query_interface : Proc(ITfLangBarItemButton*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfLangBarItemButton*, UInt32),
    release : Proc(ITfLangBarItemButton*, UInt32),
    get_info : Proc(ITfLangBarItemButton*, Win32cr::UI::TextServices::TF_LANGBARITEMINFO*, Win32cr::Foundation::HRESULT),
    get_status : Proc(ITfLangBarItemButton*, UInt32*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfLangBarItemButton*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_tooltip_string : Proc(ITfLangBarItemButton*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    on_click : Proc(ITfLangBarItemButton*, Win32cr::UI::TextServices::TfLBIClick, Win32cr::Foundation::POINT, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    init_menu : Proc(ITfLangBarItemButton*, Void*, Win32cr::Foundation::HRESULT),
    on_menu_select : Proc(ITfLangBarItemButton*, UInt32, Win32cr::Foundation::HRESULT),
    get_icon : Proc(ITfLangBarItemButton*, Win32cr::UI::WindowsAndMessaging::HICON*, Win32cr::Foundation::HRESULT),
    get_text : Proc(ITfLangBarItemButton*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("28c7f1d0-de25-11d2-afdd-00105a2799b5")]
  record ITfLangBarItemButton, lpVtbl : ITfLangBarItemButtonVtbl* do
    GUID = LibC::GUID.new(0x28c7f1d0_u32, 0xde25_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xdd_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : ITfLangBarItemButton*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfLangBarItemButton*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfLangBarItemButton*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_info(this : ITfLangBarItemButton*, pInfo : Win32cr::UI::TextServices::TF_LANGBARITEMINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info.call(this, pInfo)
    end
    def get_status(this : ITfLangBarItemButton*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def show(this : ITfLangBarItemButton*, fShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, fShow)
    end
    def get_tooltip_string(this : ITfLangBarItemButton*, pbstrToolTip : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tooltip_string.call(this, pbstrToolTip)
    end
    def on_click(this : ITfLangBarItemButton*, click : Win32cr::UI::TextServices::TfLBIClick, pt : Win32cr::Foundation::POINT, prcArea : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_click.call(this, click, pt, prcArea)
    end
    def init_menu(this : ITfLangBarItemButton*, pMenu : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_menu.call(this, pMenu)
    end
    def on_menu_select(this : ITfLangBarItemButton*, wID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_menu_select.call(this, wID)
    end
    def get_icon(this : ITfLangBarItemButton*, phIcon : Win32cr::UI::WindowsAndMessaging::HICON*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_icon.call(this, phIcon)
    end
    def get_text(this : ITfLangBarItemButton*, pbstrText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, pbstrText)
    end

  end

  @[Extern]
  record ITfLangBarItemBitmapButtonVtbl,
    query_interface : Proc(ITfLangBarItemBitmapButton*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfLangBarItemBitmapButton*, UInt32),
    release : Proc(ITfLangBarItemBitmapButton*, UInt32),
    get_info : Proc(ITfLangBarItemBitmapButton*, Win32cr::UI::TextServices::TF_LANGBARITEMINFO*, Win32cr::Foundation::HRESULT),
    get_status : Proc(ITfLangBarItemBitmapButton*, UInt32*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfLangBarItemBitmapButton*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_tooltip_string : Proc(ITfLangBarItemBitmapButton*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    on_click : Proc(ITfLangBarItemBitmapButton*, Win32cr::UI::TextServices::TfLBIClick, Win32cr::Foundation::POINT, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    init_menu : Proc(ITfLangBarItemBitmapButton*, Void*, Win32cr::Foundation::HRESULT),
    on_menu_select : Proc(ITfLangBarItemBitmapButton*, UInt32, Win32cr::Foundation::HRESULT),
    get_preferred_size : Proc(ITfLangBarItemBitmapButton*, Win32cr::Foundation::SIZE*, Win32cr::Foundation::SIZE*, Win32cr::Foundation::HRESULT),
    draw_bitmap : Proc(ITfLangBarItemBitmapButton*, Int32, Int32, UInt32, Win32cr::Graphics::Gdi::HBITMAP*, Win32cr::Graphics::Gdi::HBITMAP*, Win32cr::Foundation::HRESULT),
    get_text : Proc(ITfLangBarItemBitmapButton*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a26a0525-3fae-4fa0-89ee-88a964f9f1b5")]
  record ITfLangBarItemBitmapButton, lpVtbl : ITfLangBarItemBitmapButtonVtbl* do
    GUID = LibC::GUID.new(0xa26a0525_u32, 0x3fae_u16, 0x4fa0_u16, StaticArray[0x89_u8, 0xee_u8, 0x88_u8, 0xa9_u8, 0x64_u8, 0xf9_u8, 0xf1_u8, 0xb5_u8])
    def query_interface(this : ITfLangBarItemBitmapButton*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfLangBarItemBitmapButton*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfLangBarItemBitmapButton*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_info(this : ITfLangBarItemBitmapButton*, pInfo : Win32cr::UI::TextServices::TF_LANGBARITEMINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info.call(this, pInfo)
    end
    def get_status(this : ITfLangBarItemBitmapButton*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def show(this : ITfLangBarItemBitmapButton*, fShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, fShow)
    end
    def get_tooltip_string(this : ITfLangBarItemBitmapButton*, pbstrToolTip : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tooltip_string.call(this, pbstrToolTip)
    end
    def on_click(this : ITfLangBarItemBitmapButton*, click : Win32cr::UI::TextServices::TfLBIClick, pt : Win32cr::Foundation::POINT, prcArea : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_click.call(this, click, pt, prcArea)
    end
    def init_menu(this : ITfLangBarItemBitmapButton*, pMenu : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.init_menu.call(this, pMenu)
    end
    def on_menu_select(this : ITfLangBarItemBitmapButton*, wID : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_menu_select.call(this, wID)
    end
    def get_preferred_size(this : ITfLangBarItemBitmapButton*, pszDefault : Win32cr::Foundation::SIZE*, psz : Win32cr::Foundation::SIZE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preferred_size.call(this, pszDefault, psz)
    end
    def draw_bitmap(this : ITfLangBarItemBitmapButton*, bmWidth : Int32, bmHeight : Int32, dwFlags : UInt32, phbmp : Win32cr::Graphics::Gdi::HBITMAP*, phbmpMask : Win32cr::Graphics::Gdi::HBITMAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.draw_bitmap.call(this, bmWidth, bmHeight, dwFlags, phbmp, phbmpMask)
    end
    def get_text(this : ITfLangBarItemBitmapButton*, pbstrText : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, pbstrText)
    end

  end

  @[Extern]
  record ITfLangBarItemBitmapVtbl,
    query_interface : Proc(ITfLangBarItemBitmap*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfLangBarItemBitmap*, UInt32),
    release : Proc(ITfLangBarItemBitmap*, UInt32),
    get_info : Proc(ITfLangBarItemBitmap*, Win32cr::UI::TextServices::TF_LANGBARITEMINFO*, Win32cr::Foundation::HRESULT),
    get_status : Proc(ITfLangBarItemBitmap*, UInt32*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfLangBarItemBitmap*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_tooltip_string : Proc(ITfLangBarItemBitmap*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    on_click : Proc(ITfLangBarItemBitmap*, Win32cr::UI::TextServices::TfLBIClick, Win32cr::Foundation::POINT, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_preferred_size : Proc(ITfLangBarItemBitmap*, Win32cr::Foundation::SIZE*, Win32cr::Foundation::SIZE*, Win32cr::Foundation::HRESULT),
    draw_bitmap : Proc(ITfLangBarItemBitmap*, Int32, Int32, UInt32, Win32cr::Graphics::Gdi::HBITMAP*, Win32cr::Graphics::Gdi::HBITMAP*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("73830352-d722-4179-ada5-f045c98df355")]
  record ITfLangBarItemBitmap, lpVtbl : ITfLangBarItemBitmapVtbl* do
    GUID = LibC::GUID.new(0x73830352_u32, 0xd722_u16, 0x4179_u16, StaticArray[0xad_u8, 0xa5_u8, 0xf0_u8, 0x45_u8, 0xc9_u8, 0x8d_u8, 0xf3_u8, 0x55_u8])
    def query_interface(this : ITfLangBarItemBitmap*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfLangBarItemBitmap*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfLangBarItemBitmap*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_info(this : ITfLangBarItemBitmap*, pInfo : Win32cr::UI::TextServices::TF_LANGBARITEMINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info.call(this, pInfo)
    end
    def get_status(this : ITfLangBarItemBitmap*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def show(this : ITfLangBarItemBitmap*, fShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, fShow)
    end
    def get_tooltip_string(this : ITfLangBarItemBitmap*, pbstrToolTip : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tooltip_string.call(this, pbstrToolTip)
    end
    def on_click(this : ITfLangBarItemBitmap*, click : Win32cr::UI::TextServices::TfLBIClick, pt : Win32cr::Foundation::POINT, prcArea : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_click.call(this, click, pt, prcArea)
    end
    def get_preferred_size(this : ITfLangBarItemBitmap*, pszDefault : Win32cr::Foundation::SIZE*, psz : Win32cr::Foundation::SIZE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preferred_size.call(this, pszDefault, psz)
    end
    def draw_bitmap(this : ITfLangBarItemBitmap*, bmWidth : Int32, bmHeight : Int32, dwFlags : UInt32, phbmp : Win32cr::Graphics::Gdi::HBITMAP*, phbmpMask : Win32cr::Graphics::Gdi::HBITMAP*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.draw_bitmap.call(this, bmWidth, bmHeight, dwFlags, phbmp, phbmpMask)
    end

  end

  @[Extern]
  record ITfLangBarItemBalloonVtbl,
    query_interface : Proc(ITfLangBarItemBalloon*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfLangBarItemBalloon*, UInt32),
    release : Proc(ITfLangBarItemBalloon*, UInt32),
    get_info : Proc(ITfLangBarItemBalloon*, Win32cr::UI::TextServices::TF_LANGBARITEMINFO*, Win32cr::Foundation::HRESULT),
    get_status : Proc(ITfLangBarItemBalloon*, UInt32*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfLangBarItemBalloon*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_tooltip_string : Proc(ITfLangBarItemBalloon*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    on_click : Proc(ITfLangBarItemBalloon*, Win32cr::UI::TextServices::TfLBIClick, Win32cr::Foundation::POINT, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_preferred_size : Proc(ITfLangBarItemBalloon*, Win32cr::Foundation::SIZE*, Win32cr::Foundation::SIZE*, Win32cr::Foundation::HRESULT),
    get_balloon_info : Proc(ITfLangBarItemBalloon*, Win32cr::UI::TextServices::TF_LBBALLOONINFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("01c2d285-d3c7-4b7b-b5b5-d97411d0c283")]
  record ITfLangBarItemBalloon, lpVtbl : ITfLangBarItemBalloonVtbl* do
    GUID = LibC::GUID.new(0x1c2d285_u32, 0xd3c7_u16, 0x4b7b_u16, StaticArray[0xb5_u8, 0xb5_u8, 0xd9_u8, 0x74_u8, 0x11_u8, 0xd0_u8, 0xc2_u8, 0x83_u8])
    def query_interface(this : ITfLangBarItemBalloon*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfLangBarItemBalloon*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfLangBarItemBalloon*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_info(this : ITfLangBarItemBalloon*, pInfo : Win32cr::UI::TextServices::TF_LANGBARITEMINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_info.call(this, pInfo)
    end
    def get_status(this : ITfLangBarItemBalloon*, pdwStatus : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdwStatus)
    end
    def show(this : ITfLangBarItemBalloon*, fShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, fShow)
    end
    def get_tooltip_string(this : ITfLangBarItemBalloon*, pbstrToolTip : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_tooltip_string.call(this, pbstrToolTip)
    end
    def on_click(this : ITfLangBarItemBalloon*, click : Win32cr::UI::TextServices::TfLBIClick, pt : Win32cr::Foundation::POINT, prcArea : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_click.call(this, click, pt, prcArea)
    end
    def get_preferred_size(this : ITfLangBarItemBalloon*, pszDefault : Win32cr::Foundation::SIZE*, psz : Win32cr::Foundation::SIZE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preferred_size.call(this, pszDefault, psz)
    end
    def get_balloon_info(this : ITfLangBarItemBalloon*, pInfo : Win32cr::UI::TextServices::TF_LBBALLOONINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_balloon_info.call(this, pInfo)
    end

  end

  @[Extern]
  record ITfMenuVtbl,
    query_interface : Proc(ITfMenu*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfMenu*, UInt32),
    release : Proc(ITfMenu*, UInt32),
    add_menu_item : Proc(ITfMenu*, UInt32, UInt32, Win32cr::Graphics::Gdi::HBITMAP, Win32cr::Graphics::Gdi::HBITMAP, UInt16*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6f8a98e4-aaa0-4f15-8c5b-07e0df0a3dd8")]
  record ITfMenu, lpVtbl : ITfMenuVtbl* do
    GUID = LibC::GUID.new(0x6f8a98e4_u32, 0xaaa0_u16, 0x4f15_u16, StaticArray[0x8c_u8, 0x5b_u8, 0x7_u8, 0xe0_u8, 0xdf_u8, 0xa_u8, 0x3d_u8, 0xd8_u8])
    def query_interface(this : ITfMenu*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfMenu*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfMenu*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_menu_item(this : ITfMenu*, uId : UInt32, dwFlags : UInt32, hbmp : Win32cr::Graphics::Gdi::HBITMAP, hbmpMask : Win32cr::Graphics::Gdi::HBITMAP, pch : UInt16*, cch : UInt32, ppMenu : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_menu_item.call(this, uId, dwFlags, hbmp, hbmpMask, pch, cch, ppMenu)
    end

  end

  @[Extern]
  record ITfThreadMgrVtbl,
    query_interface : Proc(ITfThreadMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfThreadMgr*, UInt32),
    release : Proc(ITfThreadMgr*, UInt32),
    activate : Proc(ITfThreadMgr*, UInt32*, Win32cr::Foundation::HRESULT),
    deactivate : Proc(ITfThreadMgr*, Win32cr::Foundation::HRESULT),
    create_document_mgr : Proc(ITfThreadMgr*, Void**, Win32cr::Foundation::HRESULT),
    enum_document_mgrs : Proc(ITfThreadMgr*, Void**, Win32cr::Foundation::HRESULT),
    get_focus : Proc(ITfThreadMgr*, Void**, Win32cr::Foundation::HRESULT),
    set_focus : Proc(ITfThreadMgr*, Void*, Win32cr::Foundation::HRESULT),
    associate_focus : Proc(ITfThreadMgr*, Win32cr::Foundation::HWND, Void*, Void**, Win32cr::Foundation::HRESULT),
    is_thread_focus : Proc(ITfThreadMgr*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_function_provider : Proc(ITfThreadMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_function_providers : Proc(ITfThreadMgr*, Void**, Win32cr::Foundation::HRESULT),
    get_global_compartment : Proc(ITfThreadMgr*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aa80e801-2021-11d2-93e0-0060b067b86e")]
  record ITfThreadMgr, lpVtbl : ITfThreadMgrVtbl* do
    GUID = LibC::GUID.new(0xaa80e801_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : ITfThreadMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfThreadMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfThreadMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def activate(this : ITfThreadMgr*, ptid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, ptid)
    end
    def deactivate(this : ITfThreadMgr*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate.call(this)
    end
    def create_document_mgr(this : ITfThreadMgr*, ppdim : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_document_mgr.call(this, ppdim)
    end
    def enum_document_mgrs(this : ITfThreadMgr*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_document_mgrs.call(this, ppEnum)
    end
    def get_focus(this : ITfThreadMgr*, ppdimFocus : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focus.call(this, ppdimFocus)
    end
    def set_focus(this : ITfThreadMgr*, pdimFocus : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_focus.call(this, pdimFocus)
    end
    def associate_focus(this : ITfThreadMgr*, hwnd : Win32cr::Foundation::HWND, pdimNew : Void*, ppdimPrev : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.associate_focus.call(this, hwnd, pdimNew, ppdimPrev)
    end
    def is_thread_focus(this : ITfThreadMgr*, pfThreadFocus : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_thread_focus.call(this, pfThreadFocus)
    end
    def get_function_provider(this : ITfThreadMgr*, clsid : LibC::GUID*, ppFuncProv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_provider.call(this, clsid, ppFuncProv)
    end
    def enum_function_providers(this : ITfThreadMgr*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_function_providers.call(this, ppEnum)
    end
    def get_global_compartment(this : ITfThreadMgr*, ppCompMgr : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_global_compartment.call(this, ppCompMgr)
    end

  end

  @[Extern]
  record ITfThreadMgrExVtbl,
    query_interface : Proc(ITfThreadMgrEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfThreadMgrEx*, UInt32),
    release : Proc(ITfThreadMgrEx*, UInt32),
    activate : Proc(ITfThreadMgrEx*, UInt32*, Win32cr::Foundation::HRESULT),
    deactivate : Proc(ITfThreadMgrEx*, Win32cr::Foundation::HRESULT),
    create_document_mgr : Proc(ITfThreadMgrEx*, Void**, Win32cr::Foundation::HRESULT),
    enum_document_mgrs : Proc(ITfThreadMgrEx*, Void**, Win32cr::Foundation::HRESULT),
    get_focus : Proc(ITfThreadMgrEx*, Void**, Win32cr::Foundation::HRESULT),
    set_focus : Proc(ITfThreadMgrEx*, Void*, Win32cr::Foundation::HRESULT),
    associate_focus : Proc(ITfThreadMgrEx*, Win32cr::Foundation::HWND, Void*, Void**, Win32cr::Foundation::HRESULT),
    is_thread_focus : Proc(ITfThreadMgrEx*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_function_provider : Proc(ITfThreadMgrEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_function_providers : Proc(ITfThreadMgrEx*, Void**, Win32cr::Foundation::HRESULT),
    get_global_compartment : Proc(ITfThreadMgrEx*, Void**, Win32cr::Foundation::HRESULT),
    activate_ex : Proc(ITfThreadMgrEx*, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    get_active_flags : Proc(ITfThreadMgrEx*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3e90ade3-7594-4cb0-bb58-69628f5f458c")]
  record ITfThreadMgrEx, lpVtbl : ITfThreadMgrExVtbl* do
    GUID = LibC::GUID.new(0x3e90ade3_u32, 0x7594_u16, 0x4cb0_u16, StaticArray[0xbb_u8, 0x58_u8, 0x69_u8, 0x62_u8, 0x8f_u8, 0x5f_u8, 0x45_u8, 0x8c_u8])
    def query_interface(this : ITfThreadMgrEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfThreadMgrEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfThreadMgrEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def activate(this : ITfThreadMgrEx*, ptid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, ptid)
    end
    def deactivate(this : ITfThreadMgrEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate.call(this)
    end
    def create_document_mgr(this : ITfThreadMgrEx*, ppdim : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_document_mgr.call(this, ppdim)
    end
    def enum_document_mgrs(this : ITfThreadMgrEx*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_document_mgrs.call(this, ppEnum)
    end
    def get_focus(this : ITfThreadMgrEx*, ppdimFocus : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focus.call(this, ppdimFocus)
    end
    def set_focus(this : ITfThreadMgrEx*, pdimFocus : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_focus.call(this, pdimFocus)
    end
    def associate_focus(this : ITfThreadMgrEx*, hwnd : Win32cr::Foundation::HWND, pdimNew : Void*, ppdimPrev : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.associate_focus.call(this, hwnd, pdimNew, ppdimPrev)
    end
    def is_thread_focus(this : ITfThreadMgrEx*, pfThreadFocus : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_thread_focus.call(this, pfThreadFocus)
    end
    def get_function_provider(this : ITfThreadMgrEx*, clsid : LibC::GUID*, ppFuncProv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_provider.call(this, clsid, ppFuncProv)
    end
    def enum_function_providers(this : ITfThreadMgrEx*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_function_providers.call(this, ppEnum)
    end
    def get_global_compartment(this : ITfThreadMgrEx*, ppCompMgr : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_global_compartment.call(this, ppCompMgr)
    end
    def activate_ex(this : ITfThreadMgrEx*, ptid : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate_ex.call(this, ptid, dwFlags)
    end
    def get_active_flags(this : ITfThreadMgrEx*, lpdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_flags.call(this, lpdwFlags)
    end

  end

  @[Extern]
  record ITfThreadMgr2Vtbl,
    query_interface : Proc(ITfThreadMgr2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfThreadMgr2*, UInt32),
    release : Proc(ITfThreadMgr2*, UInt32),
    activate : Proc(ITfThreadMgr2*, UInt32*, Win32cr::Foundation::HRESULT),
    deactivate : Proc(ITfThreadMgr2*, Win32cr::Foundation::HRESULT),
    create_document_mgr : Proc(ITfThreadMgr2*, Void**, Win32cr::Foundation::HRESULT),
    enum_document_mgrs : Proc(ITfThreadMgr2*, Void**, Win32cr::Foundation::HRESULT),
    get_focus : Proc(ITfThreadMgr2*, Void**, Win32cr::Foundation::HRESULT),
    set_focus : Proc(ITfThreadMgr2*, Void*, Win32cr::Foundation::HRESULT),
    is_thread_focus : Proc(ITfThreadMgr2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_function_provider : Proc(ITfThreadMgr2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_function_providers : Proc(ITfThreadMgr2*, Void**, Win32cr::Foundation::HRESULT),
    get_global_compartment : Proc(ITfThreadMgr2*, Void**, Win32cr::Foundation::HRESULT),
    activate_ex : Proc(ITfThreadMgr2*, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    get_active_flags : Proc(ITfThreadMgr2*, UInt32*, Win32cr::Foundation::HRESULT),
    suspend_keystroke_handling : Proc(ITfThreadMgr2*, Win32cr::Foundation::HRESULT),
    resume_keystroke_handling : Proc(ITfThreadMgr2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0ab198ef-6477-4ee8-8812-6780edb82d5e")]
  record ITfThreadMgr2, lpVtbl : ITfThreadMgr2Vtbl* do
    GUID = LibC::GUID.new(0xab198ef_u32, 0x6477_u16, 0x4ee8_u16, StaticArray[0x88_u8, 0x12_u8, 0x67_u8, 0x80_u8, 0xed_u8, 0xb8_u8, 0x2d_u8, 0x5e_u8])
    def query_interface(this : ITfThreadMgr2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfThreadMgr2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfThreadMgr2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def activate(this : ITfThreadMgr2*, ptid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, ptid)
    end
    def deactivate(this : ITfThreadMgr2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate.call(this)
    end
    def create_document_mgr(this : ITfThreadMgr2*, ppdim : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_document_mgr.call(this, ppdim)
    end
    def enum_document_mgrs(this : ITfThreadMgr2*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_document_mgrs.call(this, ppEnum)
    end
    def get_focus(this : ITfThreadMgr2*, ppdimFocus : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focus.call(this, ppdimFocus)
    end
    def set_focus(this : ITfThreadMgr2*, pdimFocus : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_focus.call(this, pdimFocus)
    end
    def is_thread_focus(this : ITfThreadMgr2*, pfThreadFocus : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_thread_focus.call(this, pfThreadFocus)
    end
    def get_function_provider(this : ITfThreadMgr2*, clsid : LibC::GUID*, ppFuncProv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function_provider.call(this, clsid, ppFuncProv)
    end
    def enum_function_providers(this : ITfThreadMgr2*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_function_providers.call(this, ppEnum)
    end
    def get_global_compartment(this : ITfThreadMgr2*, ppCompMgr : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_global_compartment.call(this, ppCompMgr)
    end
    def activate_ex(this : ITfThreadMgr2*, ptid : UInt32*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate_ex.call(this, ptid, dwFlags)
    end
    def get_active_flags(this : ITfThreadMgr2*, lpdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_flags.call(this, lpdwFlags)
    end
    def suspend_keystroke_handling(this : ITfThreadMgr2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend_keystroke_handling.call(this)
    end
    def resume_keystroke_handling(this : ITfThreadMgr2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_keystroke_handling.call(this)
    end

  end

  @[Extern]
  record ITfThreadMgrEventSinkVtbl,
    query_interface : Proc(ITfThreadMgrEventSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfThreadMgrEventSink*, UInt32),
    release : Proc(ITfThreadMgrEventSink*, UInt32),
    on_init_document_mgr : Proc(ITfThreadMgrEventSink*, Void*, Win32cr::Foundation::HRESULT),
    on_uninit_document_mgr : Proc(ITfThreadMgrEventSink*, Void*, Win32cr::Foundation::HRESULT),
    on_set_focus : Proc(ITfThreadMgrEventSink*, Void*, Void*, Win32cr::Foundation::HRESULT),
    on_push_context : Proc(ITfThreadMgrEventSink*, Void*, Win32cr::Foundation::HRESULT),
    on_pop_context : Proc(ITfThreadMgrEventSink*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aa80e80e-2021-11d2-93e0-0060b067b86e")]
  record ITfThreadMgrEventSink, lpVtbl : ITfThreadMgrEventSinkVtbl* do
    GUID = LibC::GUID.new(0xaa80e80e_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : ITfThreadMgrEventSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfThreadMgrEventSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfThreadMgrEventSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_init_document_mgr(this : ITfThreadMgrEventSink*, pdim : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_init_document_mgr.call(this, pdim)
    end
    def on_uninit_document_mgr(this : ITfThreadMgrEventSink*, pdim : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_uninit_document_mgr.call(this, pdim)
    end
    def on_set_focus(this : ITfThreadMgrEventSink*, pdimFocus : Void*, pdimPrevFocus : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_focus.call(this, pdimFocus, pdimPrevFocus)
    end
    def on_push_context(this : ITfThreadMgrEventSink*, pic : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_push_context.call(this, pic)
    end
    def on_pop_context(this : ITfThreadMgrEventSink*, pic : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_pop_context.call(this, pic)
    end

  end

  @[Extern]
  record ITfConfigureSystemKeystrokeFeedVtbl,
    query_interface : Proc(ITfConfigureSystemKeystrokeFeed*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfConfigureSystemKeystrokeFeed*, UInt32),
    release : Proc(ITfConfigureSystemKeystrokeFeed*, UInt32),
    disable_system_keystroke_feed : Proc(ITfConfigureSystemKeystrokeFeed*, Win32cr::Foundation::HRESULT),
    enable_system_keystroke_feed : Proc(ITfConfigureSystemKeystrokeFeed*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0d2c969a-bc9c-437c-84ee-951c49b1a764")]
  record ITfConfigureSystemKeystrokeFeed, lpVtbl : ITfConfigureSystemKeystrokeFeedVtbl* do
    GUID = LibC::GUID.new(0xd2c969a_u32, 0xbc9c_u16, 0x437c_u16, StaticArray[0x84_u8, 0xee_u8, 0x95_u8, 0x1c_u8, 0x49_u8, 0xb1_u8, 0xa7_u8, 0x64_u8])
    def query_interface(this : ITfConfigureSystemKeystrokeFeed*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfConfigureSystemKeystrokeFeed*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfConfigureSystemKeystrokeFeed*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def disable_system_keystroke_feed(this : ITfConfigureSystemKeystrokeFeed*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_system_keystroke_feed.call(this)
    end
    def enable_system_keystroke_feed(this : ITfConfigureSystemKeystrokeFeed*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_system_keystroke_feed.call(this)
    end

  end

  @[Extern]
  record IEnumTfDocumentMgrsVtbl,
    query_interface : Proc(IEnumTfDocumentMgrs*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTfDocumentMgrs*, UInt32),
    release : Proc(IEnumTfDocumentMgrs*, UInt32),
    clone : Proc(IEnumTfDocumentMgrs*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumTfDocumentMgrs*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTfDocumentMgrs*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTfDocumentMgrs*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aa80e808-2021-11d2-93e0-0060b067b86e")]
  record IEnumTfDocumentMgrs, lpVtbl : IEnumTfDocumentMgrsVtbl* do
    GUID = LibC::GUID.new(0xaa80e808_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : IEnumTfDocumentMgrs*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTfDocumentMgrs*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTfDocumentMgrs*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumTfDocumentMgrs*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumTfDocumentMgrs*, ulCount : UInt32, rgDocumentMgr : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, rgDocumentMgr, pcFetched)
    end
    def reset(this : IEnumTfDocumentMgrs*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumTfDocumentMgrs*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfDocumentMgrVtbl,
    query_interface : Proc(ITfDocumentMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfDocumentMgr*, UInt32),
    release : Proc(ITfDocumentMgr*, UInt32),
    create_context : Proc(ITfDocumentMgr*, UInt32, UInt32, Void*, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    push : Proc(ITfDocumentMgr*, Void*, Win32cr::Foundation::HRESULT),
    pop : Proc(ITfDocumentMgr*, UInt32, Win32cr::Foundation::HRESULT),
    get_top : Proc(ITfDocumentMgr*, Void**, Win32cr::Foundation::HRESULT),
    get_base : Proc(ITfDocumentMgr*, Void**, Win32cr::Foundation::HRESULT),
    enum_contexts : Proc(ITfDocumentMgr*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aa80e7f4-2021-11d2-93e0-0060b067b86e")]
  record ITfDocumentMgr, lpVtbl : ITfDocumentMgrVtbl* do
    GUID = LibC::GUID.new(0xaa80e7f4_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : ITfDocumentMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfDocumentMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfDocumentMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_context(this : ITfDocumentMgr*, tidOwner : UInt32, dwFlags : UInt32, punk : Void*, ppic : Void**, pecTextStore : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_context.call(this, tidOwner, dwFlags, punk, ppic, pecTextStore)
    end
    def push(this : ITfDocumentMgr*, pic : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.push.call(this, pic)
    end
    def pop(this : ITfDocumentMgr*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.pop.call(this, dwFlags)
    end
    def get_top(this : ITfDocumentMgr*, ppic : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_top.call(this, ppic)
    end
    def get_base(this : ITfDocumentMgr*, ppic : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_base.call(this, ppic)
    end
    def enum_contexts(this : ITfDocumentMgr*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_contexts.call(this, ppEnum)
    end

  end

  @[Extern]
  record IEnumTfContextsVtbl,
    query_interface : Proc(IEnumTfContexts*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTfContexts*, UInt32),
    release : Proc(IEnumTfContexts*, UInt32),
    clone : Proc(IEnumTfContexts*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumTfContexts*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTfContexts*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTfContexts*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8f1a7ea6-1654-4502-a86e-b2902344d507")]
  record IEnumTfContexts, lpVtbl : IEnumTfContextsVtbl* do
    GUID = LibC::GUID.new(0x8f1a7ea6_u32, 0x1654_u16, 0x4502_u16, StaticArray[0xa8_u8, 0x6e_u8, 0xb2_u8, 0x90_u8, 0x23_u8, 0x44_u8, 0xd5_u8, 0x7_u8])
    def query_interface(this : IEnumTfContexts*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTfContexts*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTfContexts*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumTfContexts*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumTfContexts*, ulCount : UInt32, rgContext : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, rgContext, pcFetched)
    end
    def reset(this : IEnumTfContexts*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumTfContexts*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfCompositionViewVtbl,
    query_interface : Proc(ITfCompositionView*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfCompositionView*, UInt32),
    release : Proc(ITfCompositionView*, UInt32),
    get_owner_clsid : Proc(ITfCompositionView*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_range : Proc(ITfCompositionView*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d7540241-f9a1-4364-befc-dbcd2c4395b7")]
  record ITfCompositionView, lpVtbl : ITfCompositionViewVtbl* do
    GUID = LibC::GUID.new(0xd7540241_u32, 0xf9a1_u16, 0x4364_u16, StaticArray[0xbe_u8, 0xfc_u8, 0xdb_u8, 0xcd_u8, 0x2c_u8, 0x43_u8, 0x95_u8, 0xb7_u8])
    def query_interface(this : ITfCompositionView*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfCompositionView*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfCompositionView*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_owner_clsid(this : ITfCompositionView*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_owner_clsid.call(this, pclsid)
    end
    def get_range(this : ITfCompositionView*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_range.call(this, ppRange)
    end

  end

  @[Extern]
  record IEnumITfCompositionViewVtbl,
    query_interface : Proc(IEnumITfCompositionView*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumITfCompositionView*, UInt32),
    release : Proc(IEnumITfCompositionView*, UInt32),
    clone : Proc(IEnumITfCompositionView*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumITfCompositionView*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumITfCompositionView*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumITfCompositionView*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5efd22ba-7838-46cb-88e2-cadb14124f8f")]
  record IEnumITfCompositionView, lpVtbl : IEnumITfCompositionViewVtbl* do
    GUID = LibC::GUID.new(0x5efd22ba_u32, 0x7838_u16, 0x46cb_u16, StaticArray[0x88_u8, 0xe2_u8, 0xca_u8, 0xdb_u8, 0x14_u8, 0x12_u8, 0x4f_u8, 0x8f_u8])
    def query_interface(this : IEnumITfCompositionView*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumITfCompositionView*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumITfCompositionView*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumITfCompositionView*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumITfCompositionView*, ulCount : UInt32, rgCompositionView : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, rgCompositionView, pcFetched)
    end
    def reset(this : IEnumITfCompositionView*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumITfCompositionView*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfCompositionVtbl,
    query_interface : Proc(ITfComposition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfComposition*, UInt32),
    release : Proc(ITfComposition*, UInt32),
    get_range : Proc(ITfComposition*, Void**, Win32cr::Foundation::HRESULT),
    shift_start : Proc(ITfComposition*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    shift_end : Proc(ITfComposition*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    end_composition : Proc(ITfComposition*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("20168d64-5a8f-4a5a-b7bd-cfa29f4d0fd9")]
  record ITfComposition, lpVtbl : ITfCompositionVtbl* do
    GUID = LibC::GUID.new(0x20168d64_u32, 0x5a8f_u16, 0x4a5a_u16, StaticArray[0xb7_u8, 0xbd_u8, 0xcf_u8, 0xa2_u8, 0x9f_u8, 0x4d_u8, 0xf_u8, 0xd9_u8])
    def query_interface(this : ITfComposition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfComposition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfComposition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_range(this : ITfComposition*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_range.call(this, ppRange)
    end
    def shift_start(this : ITfComposition*, ecWrite : UInt32, pNewStart : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_start.call(this, ecWrite, pNewStart)
    end
    def shift_end(this : ITfComposition*, ecWrite : UInt32, pNewEnd : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_end.call(this, ecWrite, pNewEnd)
    end
    def end_composition(this : ITfComposition*, ecWrite : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_composition.call(this, ecWrite)
    end

  end

  @[Extern]
  record ITfCompositionSinkVtbl,
    query_interface : Proc(ITfCompositionSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfCompositionSink*, UInt32),
    release : Proc(ITfCompositionSink*, UInt32),
    on_composition_terminated : Proc(ITfCompositionSink*, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a781718c-579a-4b15-a280-32b8577acc5e")]
  record ITfCompositionSink, lpVtbl : ITfCompositionSinkVtbl* do
    GUID = LibC::GUID.new(0xa781718c_u32, 0x579a_u16, 0x4b15_u16, StaticArray[0xa2_u8, 0x80_u8, 0x32_u8, 0xb8_u8, 0x57_u8, 0x7a_u8, 0xcc_u8, 0x5e_u8])
    def query_interface(this : ITfCompositionSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfCompositionSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfCompositionSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_composition_terminated(this : ITfCompositionSink*, ecWrite : UInt32, pComposition : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_composition_terminated.call(this, ecWrite, pComposition)
    end

  end

  @[Extern]
  record ITfContextCompositionVtbl,
    query_interface : Proc(ITfContextComposition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfContextComposition*, UInt32),
    release : Proc(ITfContextComposition*, UInt32),
    start_composition : Proc(ITfContextComposition*, UInt32, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    enum_compositions : Proc(ITfContextComposition*, Void**, Win32cr::Foundation::HRESULT),
    find_composition : Proc(ITfContextComposition*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    take_ownership : Proc(ITfContextComposition*, UInt32, Void*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d40c8aae-ac92-4fc7-9a11-0ee0e23aa39b")]
  record ITfContextComposition, lpVtbl : ITfContextCompositionVtbl* do
    GUID = LibC::GUID.new(0xd40c8aae_u32, 0xac92_u16, 0x4fc7_u16, StaticArray[0x9a_u8, 0x11_u8, 0xe_u8, 0xe0_u8, 0xe2_u8, 0x3a_u8, 0xa3_u8, 0x9b_u8])
    def query_interface(this : ITfContextComposition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfContextComposition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfContextComposition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_composition(this : ITfContextComposition*, ecWrite : UInt32, pCompositionRange : Void*, pSink : Void*, ppComposition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_composition.call(this, ecWrite, pCompositionRange, pSink, ppComposition)
    end
    def enum_compositions(this : ITfContextComposition*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_compositions.call(this, ppEnum)
    end
    def find_composition(this : ITfContextComposition*, ecRead : UInt32, pTestRange : Void*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_composition.call(this, ecRead, pTestRange, ppEnum)
    end
    def take_ownership(this : ITfContextComposition*, ecWrite : UInt32, pComposition : Void*, pSink : Void*, ppComposition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.take_ownership.call(this, ecWrite, pComposition, pSink, ppComposition)
    end

  end

  @[Extern]
  record ITfContextOwnerCompositionServicesVtbl,
    query_interface : Proc(ITfContextOwnerCompositionServices*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfContextOwnerCompositionServices*, UInt32),
    release : Proc(ITfContextOwnerCompositionServices*, UInt32),
    start_composition : Proc(ITfContextOwnerCompositionServices*, UInt32, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    enum_compositions : Proc(ITfContextOwnerCompositionServices*, Void**, Win32cr::Foundation::HRESULT),
    find_composition : Proc(ITfContextOwnerCompositionServices*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT),
    take_ownership : Proc(ITfContextOwnerCompositionServices*, UInt32, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    terminate_composition : Proc(ITfContextOwnerCompositionServices*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("86462810-593b-4916-9764-19c08e9ce110")]
  record ITfContextOwnerCompositionServices, lpVtbl : ITfContextOwnerCompositionServicesVtbl* do
    GUID = LibC::GUID.new(0x86462810_u32, 0x593b_u16, 0x4916_u16, StaticArray[0x97_u8, 0x64_u8, 0x19_u8, 0xc0_u8, 0x8e_u8, 0x9c_u8, 0xe1_u8, 0x10_u8])
    def query_interface(this : ITfContextOwnerCompositionServices*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfContextOwnerCompositionServices*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfContextOwnerCompositionServices*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_composition(this : ITfContextOwnerCompositionServices*, ecWrite : UInt32, pCompositionRange : Void*, pSink : Void*, ppComposition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_composition.call(this, ecWrite, pCompositionRange, pSink, ppComposition)
    end
    def enum_compositions(this : ITfContextOwnerCompositionServices*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_compositions.call(this, ppEnum)
    end
    def find_composition(this : ITfContextOwnerCompositionServices*, ecRead : UInt32, pTestRange : Void*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_composition.call(this, ecRead, pTestRange, ppEnum)
    end
    def take_ownership(this : ITfContextOwnerCompositionServices*, ecWrite : UInt32, pComposition : Void*, pSink : Void*, ppComposition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.take_ownership.call(this, ecWrite, pComposition, pSink, ppComposition)
    end
    def terminate_composition(this : ITfContextOwnerCompositionServices*, pComposition : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate_composition.call(this, pComposition)
    end

  end

  @[Extern]
  record ITfContextOwnerCompositionSinkVtbl,
    query_interface : Proc(ITfContextOwnerCompositionSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfContextOwnerCompositionSink*, UInt32),
    release : Proc(ITfContextOwnerCompositionSink*, UInt32),
    on_start_composition : Proc(ITfContextOwnerCompositionSink*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    on_update_composition : Proc(ITfContextOwnerCompositionSink*, Void*, Void*, Win32cr::Foundation::HRESULT),
    on_end_composition : Proc(ITfContextOwnerCompositionSink*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5f20aa40-b57a-4f34-96ab-3576f377cc79")]
  record ITfContextOwnerCompositionSink, lpVtbl : ITfContextOwnerCompositionSinkVtbl* do
    GUID = LibC::GUID.new(0x5f20aa40_u32, 0xb57a_u16, 0x4f34_u16, StaticArray[0x96_u8, 0xab_u8, 0x35_u8, 0x76_u8, 0xf3_u8, 0x77_u8, 0xcc_u8, 0x79_u8])
    def query_interface(this : ITfContextOwnerCompositionSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfContextOwnerCompositionSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfContextOwnerCompositionSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_start_composition(this : ITfContextOwnerCompositionSink*, pComposition : Void*, pfOk : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_start_composition.call(this, pComposition, pfOk)
    end
    def on_update_composition(this : ITfContextOwnerCompositionSink*, pComposition : Void*, pRangeNew : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_update_composition.call(this, pComposition, pRangeNew)
    end
    def on_end_composition(this : ITfContextOwnerCompositionSink*, pComposition : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_composition.call(this, pComposition)
    end

  end

  @[Extern]
  record ITfContextViewVtbl,
    query_interface : Proc(ITfContextView*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfContextView*, UInt32),
    release : Proc(ITfContextView*, UInt32),
    get_range_from_point : Proc(ITfContextView*, UInt32, Win32cr::Foundation::POINT*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_text_ext : Proc(ITfContextView*, UInt32, Void*, Win32cr::Foundation::RECT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_screen_ext : Proc(ITfContextView*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_wnd : Proc(ITfContextView*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2433bf8e-0f9b-435c-ba2c-180611978c30")]
  record ITfContextView, lpVtbl : ITfContextViewVtbl* do
    GUID = LibC::GUID.new(0x2433bf8e_u32, 0xf9b_u16, 0x435c_u16, StaticArray[0xba_u8, 0x2c_u8, 0x18_u8, 0x6_u8, 0x11_u8, 0x97_u8, 0x8c_u8, 0x30_u8])
    def query_interface(this : ITfContextView*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfContextView*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfContextView*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_range_from_point(this : ITfContextView*, ec : UInt32, ppt : Win32cr::Foundation::POINT*, dwFlags : UInt32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_range_from_point.call(this, ec, ppt, dwFlags, ppRange)
    end
    def get_text_ext(this : ITfContextView*, ec : UInt32, pRange : Void*, prc : Win32cr::Foundation::RECT*, pfClipped : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text_ext.call(this, ec, pRange, prc, pfClipped)
    end
    def get_screen_ext(this : ITfContextView*, prc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_screen_ext.call(this, prc)
    end
    def get_wnd(this : ITfContextView*, phwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wnd.call(this, phwnd)
    end

  end

  @[Extern]
  record IEnumTfContextViewsVtbl,
    query_interface : Proc(IEnumTfContextViews*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTfContextViews*, UInt32),
    release : Proc(IEnumTfContextViews*, UInt32),
    clone : Proc(IEnumTfContextViews*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumTfContextViews*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTfContextViews*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTfContextViews*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f0c0f8dd-cf38-44e1-bb0f-68cf0d551c78")]
  record IEnumTfContextViews, lpVtbl : IEnumTfContextViewsVtbl* do
    GUID = LibC::GUID.new(0xf0c0f8dd_u32, 0xcf38_u16, 0x44e1_u16, StaticArray[0xbb_u8, 0xf_u8, 0x68_u8, 0xcf_u8, 0xd_u8, 0x55_u8, 0x1c_u8, 0x78_u8])
    def query_interface(this : IEnumTfContextViews*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTfContextViews*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTfContextViews*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumTfContextViews*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumTfContextViews*, ulCount : UInt32, rgViews : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, rgViews, pcFetched)
    end
    def reset(this : IEnumTfContextViews*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumTfContextViews*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfContextVtbl,
    query_interface : Proc(ITfContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfContext*, UInt32),
    release : Proc(ITfContext*, UInt32),
    request_edit_session : Proc(ITfContext*, UInt32, Void*, Win32cr::UI::TextServices::TF_CONTEXT_EDIT_CONTEXT_FLAGS, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    in_write_session : Proc(ITfContext*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_selection : Proc(ITfContext*, UInt32, UInt32, UInt32, Win32cr::UI::TextServices::TF_SELECTION*, UInt32*, Win32cr::Foundation::HRESULT),
    set_selection : Proc(ITfContext*, UInt32, UInt32, Win32cr::UI::TextServices::TF_SELECTION*, Win32cr::Foundation::HRESULT),
    get_start : Proc(ITfContext*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_end : Proc(ITfContext*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_active_view : Proc(ITfContext*, Void**, Win32cr::Foundation::HRESULT),
    enum_views : Proc(ITfContext*, Void**, Win32cr::Foundation::HRESULT),
    get_status : Proc(ITfContext*, Win32cr::UI::TextServices::TS_STATUS*, Win32cr::Foundation::HRESULT),
    get_property : Proc(ITfContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_app_property : Proc(ITfContext*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    track_properties : Proc(ITfContext*, LibC::GUID**, UInt32, LibC::GUID**, UInt32, Void**, Win32cr::Foundation::HRESULT),
    enum_properties : Proc(ITfContext*, Void**, Win32cr::Foundation::HRESULT),
    get_document_mgr : Proc(ITfContext*, Void**, Win32cr::Foundation::HRESULT),
    create_range_backup : Proc(ITfContext*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aa80e7fd-2021-11d2-93e0-0060b067b86e")]
  record ITfContext, lpVtbl : ITfContextVtbl* do
    GUID = LibC::GUID.new(0xaa80e7fd_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : ITfContext*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfContext*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfContext*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def request_edit_session(this : ITfContext*, tid : UInt32, pes : Void*, dwFlags : Win32cr::UI::TextServices::TF_CONTEXT_EDIT_CONTEXT_FLAGS, phrSession : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.request_edit_session.call(this, tid, pes, dwFlags, phrSession)
    end
    def in_write_session(this : ITfContext*, tid : UInt32, pfWriteSession : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.in_write_session.call(this, tid, pfWriteSession)
    end
    def get_selection(this : ITfContext*, ec : UInt32, ulIndex : UInt32, ulCount : UInt32, pSelection : Win32cr::UI::TextServices::TF_SELECTION*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, ec, ulIndex, ulCount, pSelection, pcFetched)
    end
    def set_selection(this : ITfContext*, ec : UInt32, ulCount : UInt32, pSelection : Win32cr::UI::TextServices::TF_SELECTION*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_selection.call(this, ec, ulCount, pSelection)
    end
    def get_start(this : ITfContext*, ec : UInt32, ppStart : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_start.call(this, ec, ppStart)
    end
    def get_end(this : ITfContext*, ec : UInt32, ppEnd : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_end.call(this, ec, ppEnd)
    end
    def get_active_view(this : ITfContext*, ppView : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_view.call(this, ppView)
    end
    def enum_views(this : ITfContext*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_views.call(this, ppEnum)
    end
    def get_status(this : ITfContext*, pdcs : Win32cr::UI::TextServices::TS_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdcs)
    end
    def get_property(this : ITfContext*, guidProp : LibC::GUID*, ppProp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, guidProp, ppProp)
    end
    def get_app_property(this : ITfContext*, guidProp : LibC::GUID*, ppProp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_app_property.call(this, guidProp, ppProp)
    end
    def track_properties(this : ITfContext*, prgProp : LibC::GUID**, cProp : UInt32, prgAppProp : LibC::GUID**, cAppProp : UInt32, ppProperty : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.track_properties.call(this, prgProp, cProp, prgAppProp, cAppProp, ppProperty)
    end
    def enum_properties(this : ITfContext*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_properties.call(this, ppEnum)
    end
    def get_document_mgr(this : ITfContext*, ppDm : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_mgr.call(this, ppDm)
    end
    def create_range_backup(this : ITfContext*, ec : UInt32, pRange : Void*, ppBackup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_range_backup.call(this, ec, pRange, ppBackup)
    end

  end

  @[Extern]
  record ITfQueryEmbeddedVtbl,
    query_interface : Proc(ITfQueryEmbedded*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfQueryEmbedded*, UInt32),
    release : Proc(ITfQueryEmbedded*, UInt32),
    query_insert_embedded : Proc(ITfQueryEmbedded*, LibC::GUID*, Win32cr::System::Com::FORMATETC*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0fab9bdb-d250-4169-84e5-6be118fdd7a8")]
  record ITfQueryEmbedded, lpVtbl : ITfQueryEmbeddedVtbl* do
    GUID = LibC::GUID.new(0xfab9bdb_u32, 0xd250_u16, 0x4169_u16, StaticArray[0x84_u8, 0xe5_u8, 0x6b_u8, 0xe1_u8, 0x18_u8, 0xfd_u8, 0xd7_u8, 0xa8_u8])
    def query_interface(this : ITfQueryEmbedded*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfQueryEmbedded*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfQueryEmbedded*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_insert_embedded(this : ITfQueryEmbedded*, pguidService : LibC::GUID*, pFormatEtc : Win32cr::System::Com::FORMATETC*, pfInsertable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_insert_embedded.call(this, pguidService, pFormatEtc, pfInsertable)
    end

  end

  @[Extern]
  record ITfInsertAtSelectionVtbl,
    query_interface : Proc(ITfInsertAtSelection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfInsertAtSelection*, UInt32),
    release : Proc(ITfInsertAtSelection*, UInt32),
    insert_text_at_selection : Proc(ITfInsertAtSelection*, UInt32, Win32cr::UI::TextServices::INSERT_TEXT_AT_SELECTION_FLAGS, UInt16*, Int32, Void**, Win32cr::Foundation::HRESULT),
    insert_embedded_at_selection : Proc(ITfInsertAtSelection*, UInt32, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("55ce16ba-3014-41c1-9ceb-fade1446ac6c")]
  record ITfInsertAtSelection, lpVtbl : ITfInsertAtSelectionVtbl* do
    GUID = LibC::GUID.new(0x55ce16ba_u32, 0x3014_u16, 0x41c1_u16, StaticArray[0x9c_u8, 0xeb_u8, 0xfa_u8, 0xde_u8, 0x14_u8, 0x46_u8, 0xac_u8, 0x6c_u8])
    def query_interface(this : ITfInsertAtSelection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfInsertAtSelection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfInsertAtSelection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def insert_text_at_selection(this : ITfInsertAtSelection*, ec : UInt32, dwFlags : Win32cr::UI::TextServices::INSERT_TEXT_AT_SELECTION_FLAGS, pchText : UInt16*, cch : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_text_at_selection.call(this, ec, dwFlags, pchText, cch, ppRange)
    end
    def insert_embedded_at_selection(this : ITfInsertAtSelection*, ec : UInt32, dwFlags : UInt32, pDataObject : Void*, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_embedded_at_selection.call(this, ec, dwFlags, pDataObject, ppRange)
    end

  end

  @[Extern]
  record ITfCleanupContextSinkVtbl,
    query_interface : Proc(ITfCleanupContextSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfCleanupContextSink*, UInt32),
    release : Proc(ITfCleanupContextSink*, UInt32),
    on_cleanup_context : Proc(ITfCleanupContextSink*, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("01689689-7acb-4e9b-ab7c-7ea46b12b522")]
  record ITfCleanupContextSink, lpVtbl : ITfCleanupContextSinkVtbl* do
    GUID = LibC::GUID.new(0x1689689_u32, 0x7acb_u16, 0x4e9b_u16, StaticArray[0xab_u8, 0x7c_u8, 0x7e_u8, 0xa4_u8, 0x6b_u8, 0x12_u8, 0xb5_u8, 0x22_u8])
    def query_interface(this : ITfCleanupContextSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfCleanupContextSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfCleanupContextSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_cleanup_context(this : ITfCleanupContextSink*, ecWrite : UInt32, pic : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_cleanup_context.call(this, ecWrite, pic)
    end

  end

  @[Extern]
  record ITfCleanupContextDurationSinkVtbl,
    query_interface : Proc(ITfCleanupContextDurationSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfCleanupContextDurationSink*, UInt32),
    release : Proc(ITfCleanupContextDurationSink*, UInt32),
    on_start_cleanup_context : Proc(ITfCleanupContextDurationSink*, Win32cr::Foundation::HRESULT),
    on_end_cleanup_context : Proc(ITfCleanupContextDurationSink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("45c35144-154e-4797-bed8-d33ae7bf8794")]
  record ITfCleanupContextDurationSink, lpVtbl : ITfCleanupContextDurationSinkVtbl* do
    GUID = LibC::GUID.new(0x45c35144_u32, 0x154e_u16, 0x4797_u16, StaticArray[0xbe_u8, 0xd8_u8, 0xd3_u8, 0x3a_u8, 0xe7_u8, 0xbf_u8, 0x87_u8, 0x94_u8])
    def query_interface(this : ITfCleanupContextDurationSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfCleanupContextDurationSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfCleanupContextDurationSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_start_cleanup_context(this : ITfCleanupContextDurationSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_start_cleanup_context.call(this)
    end
    def on_end_cleanup_context(this : ITfCleanupContextDurationSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_cleanup_context.call(this)
    end

  end

  @[Extern]
  record ITfReadOnlyPropertyVtbl,
    query_interface : Proc(ITfReadOnlyProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfReadOnlyProperty*, UInt32),
    release : Proc(ITfReadOnlyProperty*, UInt32),
    get_type : Proc(ITfReadOnlyProperty*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    enum_ranges : Proc(ITfReadOnlyProperty*, UInt32, Void**, Void*, Win32cr::Foundation::HRESULT),
    get_value : Proc(ITfReadOnlyProperty*, UInt32, Void*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_context : Proc(ITfReadOnlyProperty*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("17d49a3d-f8b8-4b2f-b254-52319dd64c53")]
  record ITfReadOnlyProperty, lpVtbl : ITfReadOnlyPropertyVtbl* do
    GUID = LibC::GUID.new(0x17d49a3d_u32, 0xf8b8_u16, 0x4b2f_u16, StaticArray[0xb2_u8, 0x54_u8, 0x52_u8, 0x31_u8, 0x9d_u8, 0xd6_u8, 0x4c_u8, 0x53_u8])
    def query_interface(this : ITfReadOnlyProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfReadOnlyProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfReadOnlyProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type(this : ITfReadOnlyProperty*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pguid)
    end
    def enum_ranges(this : ITfReadOnlyProperty*, ec : UInt32, ppEnum : Void**, pTargetRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ranges.call(this, ec, ppEnum, pTargetRange)
    end
    def get_value(this : ITfReadOnlyProperty*, ec : UInt32, pRange : Void*, pvarValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, ec, pRange, pvarValue)
    end
    def get_context(this : ITfReadOnlyProperty*, ppContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context.call(this, ppContext)
    end

  end

  @[Extern]
  record IEnumTfPropertyValueVtbl,
    query_interface : Proc(IEnumTfPropertyValue*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTfPropertyValue*, UInt32),
    release : Proc(IEnumTfPropertyValue*, UInt32),
    clone : Proc(IEnumTfPropertyValue*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumTfPropertyValue*, UInt32, Win32cr::UI::TextServices::TF_PROPERTYVAL*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTfPropertyValue*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTfPropertyValue*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8ed8981b-7c10-4d7d-9fb3-ab72e9c75f72")]
  record IEnumTfPropertyValue, lpVtbl : IEnumTfPropertyValueVtbl* do
    GUID = LibC::GUID.new(0x8ed8981b_u32, 0x7c10_u16, 0x4d7d_u16, StaticArray[0x9f_u8, 0xb3_u8, 0xab_u8, 0x72_u8, 0xe9_u8, 0xc7_u8, 0x5f_u8, 0x72_u8])
    def query_interface(this : IEnumTfPropertyValue*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTfPropertyValue*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTfPropertyValue*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumTfPropertyValue*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumTfPropertyValue*, ulCount : UInt32, rgValues : Win32cr::UI::TextServices::TF_PROPERTYVAL*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, rgValues, pcFetched)
    end
    def reset(this : IEnumTfPropertyValue*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumTfPropertyValue*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfMouseTrackerVtbl,
    query_interface : Proc(ITfMouseTracker*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfMouseTracker*, UInt32),
    release : Proc(ITfMouseTracker*, UInt32),
    advise_mouse_sink : Proc(ITfMouseTracker*, Void*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unadvise_mouse_sink : Proc(ITfMouseTracker*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("09d146cd-a544-4132-925b-7afa8ef322d0")]
  record ITfMouseTracker, lpVtbl : ITfMouseTrackerVtbl* do
    GUID = LibC::GUID.new(0x9d146cd_u32, 0xa544_u16, 0x4132_u16, StaticArray[0x92_u8, 0x5b_u8, 0x7a_u8, 0xfa_u8, 0x8e_u8, 0xf3_u8, 0x22_u8, 0xd0_u8])
    def query_interface(this : ITfMouseTracker*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfMouseTracker*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfMouseTracker*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise_mouse_sink(this : ITfMouseTracker*, range : Void*, pSink : Void*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_mouse_sink.call(this, range, pSink, pdwCookie)
    end
    def unadvise_mouse_sink(this : ITfMouseTracker*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_mouse_sink.call(this, dwCookie)
    end

  end

  @[Extern]
  record ITfMouseTrackerACPVtbl,
    query_interface : Proc(ITfMouseTrackerACP*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfMouseTrackerACP*, UInt32),
    release : Proc(ITfMouseTrackerACP*, UInt32),
    advise_mouse_sink : Proc(ITfMouseTrackerACP*, Void*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unadvise_mouse_sink : Proc(ITfMouseTrackerACP*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3bdd78e2-c16e-47fd-b883-ce6facc1a208")]
  record ITfMouseTrackerACP, lpVtbl : ITfMouseTrackerACPVtbl* do
    GUID = LibC::GUID.new(0x3bdd78e2_u32, 0xc16e_u16, 0x47fd_u16, StaticArray[0xb8_u8, 0x83_u8, 0xce_u8, 0x6f_u8, 0xac_u8, 0xc1_u8, 0xa2_u8, 0x8_u8])
    def query_interface(this : ITfMouseTrackerACP*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfMouseTrackerACP*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfMouseTrackerACP*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise_mouse_sink(this : ITfMouseTrackerACP*, range : Void*, pSink : Void*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_mouse_sink.call(this, range, pSink, pdwCookie)
    end
    def unadvise_mouse_sink(this : ITfMouseTrackerACP*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_mouse_sink.call(this, dwCookie)
    end

  end

  @[Extern]
  record ITfMouseSinkVtbl,
    query_interface : Proc(ITfMouseSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfMouseSink*, UInt32),
    release : Proc(ITfMouseSink*, UInt32),
    on_mouse_event : Proc(ITfMouseSink*, UInt32, UInt32, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a1adaaa2-3a24-449d-ac96-5183e7f5c217")]
  record ITfMouseSink, lpVtbl : ITfMouseSinkVtbl* do
    GUID = LibC::GUID.new(0xa1adaaa2_u32, 0x3a24_u16, 0x449d_u16, StaticArray[0xac_u8, 0x96_u8, 0x51_u8, 0x83_u8, 0xe7_u8, 0xf5_u8, 0xc2_u8, 0x17_u8])
    def query_interface(this : ITfMouseSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfMouseSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfMouseSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_mouse_event(this : ITfMouseSink*, uEdge : UInt32, uQuadrant : UInt32, dwBtnStatus : UInt32, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_mouse_event.call(this, uEdge, uQuadrant, dwBtnStatus, pfEaten)
    end

  end

  @[Extern]
  record ITfEditRecordVtbl,
    query_interface : Proc(ITfEditRecord*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfEditRecord*, UInt32),
    release : Proc(ITfEditRecord*, UInt32),
    get_selection_status : Proc(ITfEditRecord*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_text_and_property_updates : Proc(ITfEditRecord*, Win32cr::UI::TextServices::GET_TEXT_AND_PROPERTY_UPDATES_FLAGS, LibC::GUID**, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("42d4d099-7c1a-4a89-b836-6c6f22160df0")]
  record ITfEditRecord, lpVtbl : ITfEditRecordVtbl* do
    GUID = LibC::GUID.new(0x42d4d099_u32, 0x7c1a_u16, 0x4a89_u16, StaticArray[0xb8_u8, 0x36_u8, 0x6c_u8, 0x6f_u8, 0x22_u8, 0x16_u8, 0xd_u8, 0xf0_u8])
    def query_interface(this : ITfEditRecord*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfEditRecord*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfEditRecord*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_selection_status(this : ITfEditRecord*, pfChanged : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection_status.call(this, pfChanged)
    end
    def get_text_and_property_updates(this : ITfEditRecord*, dwFlags : Win32cr::UI::TextServices::GET_TEXT_AND_PROPERTY_UPDATES_FLAGS, prgProperties : LibC::GUID**, cProperties : UInt32, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text_and_property_updates.call(this, dwFlags, prgProperties, cProperties, ppEnum)
    end

  end

  @[Extern]
  record ITfTextEditSinkVtbl,
    query_interface : Proc(ITfTextEditSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfTextEditSink*, UInt32),
    release : Proc(ITfTextEditSink*, UInt32),
    on_end_edit : Proc(ITfTextEditSink*, Void*, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8127d409-ccd3-4683-967a-b43d5b482bf7")]
  record ITfTextEditSink, lpVtbl : ITfTextEditSinkVtbl* do
    GUID = LibC::GUID.new(0x8127d409_u32, 0xccd3_u16, 0x4683_u16, StaticArray[0x96_u8, 0x7a_u8, 0xb4_u8, 0x3d_u8, 0x5b_u8, 0x48_u8, 0x2b_u8, 0xf7_u8])
    def query_interface(this : ITfTextEditSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfTextEditSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfTextEditSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_end_edit(this : ITfTextEditSink*, pic : Void*, ecReadOnly : UInt32, pEditRecord : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_edit.call(this, pic, ecReadOnly, pEditRecord)
    end

  end

  @[Extern]
  record ITfTextLayoutSinkVtbl,
    query_interface : Proc(ITfTextLayoutSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfTextLayoutSink*, UInt32),
    release : Proc(ITfTextLayoutSink*, UInt32),
    on_layout_change : Proc(ITfTextLayoutSink*, Void*, Win32cr::UI::TextServices::TfLayoutCode, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2af2d06a-dd5b-4927-a0b4-54f19c91fade")]
  record ITfTextLayoutSink, lpVtbl : ITfTextLayoutSinkVtbl* do
    GUID = LibC::GUID.new(0x2af2d06a_u32, 0xdd5b_u16, 0x4927_u16, StaticArray[0xa0_u8, 0xb4_u8, 0x54_u8, 0xf1_u8, 0x9c_u8, 0x91_u8, 0xfa_u8, 0xde_u8])
    def query_interface(this : ITfTextLayoutSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfTextLayoutSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfTextLayoutSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_layout_change(this : ITfTextLayoutSink*, pic : Void*, lcode : Win32cr::UI::TextServices::TfLayoutCode, pView : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_layout_change.call(this, pic, lcode, pView)
    end

  end

  @[Extern]
  record ITfStatusSinkVtbl,
    query_interface : Proc(ITfStatusSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfStatusSink*, UInt32),
    release : Proc(ITfStatusSink*, UInt32),
    on_status_change : Proc(ITfStatusSink*, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6b7d8d73-b267-4f69-b32e-1ca321ce4f45")]
  record ITfStatusSink, lpVtbl : ITfStatusSinkVtbl* do
    GUID = LibC::GUID.new(0x6b7d8d73_u32, 0xb267_u16, 0x4f69_u16, StaticArray[0xb3_u8, 0x2e_u8, 0x1c_u8, 0xa3_u8, 0x21_u8, 0xce_u8, 0x4f_u8, 0x45_u8])
    def query_interface(this : ITfStatusSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfStatusSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfStatusSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_status_change(this : ITfStatusSink*, pic : Void*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_status_change.call(this, pic, dwFlags)
    end

  end

  @[Extern]
  record ITfEditTransactionSinkVtbl,
    query_interface : Proc(ITfEditTransactionSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfEditTransactionSink*, UInt32),
    release : Proc(ITfEditTransactionSink*, UInt32),
    on_start_edit_transaction : Proc(ITfEditTransactionSink*, Void*, Win32cr::Foundation::HRESULT),
    on_end_edit_transaction : Proc(ITfEditTransactionSink*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("708fbf70-b520-416b-b06c-2c41ab44f8ba")]
  record ITfEditTransactionSink, lpVtbl : ITfEditTransactionSinkVtbl* do
    GUID = LibC::GUID.new(0x708fbf70_u32, 0xb520_u16, 0x416b_u16, StaticArray[0xb0_u8, 0x6c_u8, 0x2c_u8, 0x41_u8, 0xab_u8, 0x44_u8, 0xf8_u8, 0xba_u8])
    def query_interface(this : ITfEditTransactionSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfEditTransactionSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfEditTransactionSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_start_edit_transaction(this : ITfEditTransactionSink*, pic : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_start_edit_transaction.call(this, pic)
    end
    def on_end_edit_transaction(this : ITfEditTransactionSink*, pic : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_edit_transaction.call(this, pic)
    end

  end

  @[Extern]
  record ITfContextOwnerVtbl,
    query_interface : Proc(ITfContextOwner*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfContextOwner*, UInt32),
    release : Proc(ITfContextOwner*, UInt32),
    get_acp_from_point : Proc(ITfContextOwner*, Win32cr::Foundation::POINT*, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    get_text_ext : Proc(ITfContextOwner*, Int32, Int32, Win32cr::Foundation::RECT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_screen_ext : Proc(ITfContextOwner*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_status : Proc(ITfContextOwner*, Win32cr::UI::TextServices::TS_STATUS*, Win32cr::Foundation::HRESULT),
    get_wnd : Proc(ITfContextOwner*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_attribute : Proc(ITfContextOwner*, LibC::GUID*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aa80e80c-2021-11d2-93e0-0060b067b86e")]
  record ITfContextOwner, lpVtbl : ITfContextOwnerVtbl* do
    GUID = LibC::GUID.new(0xaa80e80c_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : ITfContextOwner*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfContextOwner*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfContextOwner*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_acp_from_point(this : ITfContextOwner*, ptScreen : Win32cr::Foundation::POINT*, dwFlags : UInt32, pacp : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_acp_from_point.call(this, ptScreen, dwFlags, pacp)
    end
    def get_text_ext(this : ITfContextOwner*, acpStart : Int32, acpEnd : Int32, prc : Win32cr::Foundation::RECT*, pfClipped : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text_ext.call(this, acpStart, acpEnd, prc, pfClipped)
    end
    def get_screen_ext(this : ITfContextOwner*, prc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_screen_ext.call(this, prc)
    end
    def get_status(this : ITfContextOwner*, pdcs : Win32cr::UI::TextServices::TS_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, pdcs)
    end
    def get_wnd(this : ITfContextOwner*, phwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wnd.call(this, phwnd)
    end
    def get_attribute(this : ITfContextOwner*, rguidAttribute : LibC::GUID*, pvarValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute.call(this, rguidAttribute, pvarValue)
    end

  end

  @[Extern]
  record ITfContextOwnerServicesVtbl,
    query_interface : Proc(ITfContextOwnerServices*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfContextOwnerServices*, UInt32),
    release : Proc(ITfContextOwnerServices*, UInt32),
    on_layout_change : Proc(ITfContextOwnerServices*, Win32cr::Foundation::HRESULT),
    on_status_change : Proc(ITfContextOwnerServices*, UInt32, Win32cr::Foundation::HRESULT),
    on_attribute_change : Proc(ITfContextOwnerServices*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    serialize : Proc(ITfContextOwnerServices*, Void*, Void*, Win32cr::UI::TextServices::TF_PERSISTENT_PROPERTY_HEADER_ACP*, Void*, Win32cr::Foundation::HRESULT),
    unserialize : Proc(ITfContextOwnerServices*, Void*, Win32cr::UI::TextServices::TF_PERSISTENT_PROPERTY_HEADER_ACP*, Void*, Void*, Win32cr::Foundation::HRESULT),
    force_load_property : Proc(ITfContextOwnerServices*, Void*, Win32cr::Foundation::HRESULT),
    create_range : Proc(ITfContextOwnerServices*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b23eb630-3e1c-11d3-a745-0050040ab407")]
  record ITfContextOwnerServices, lpVtbl : ITfContextOwnerServicesVtbl* do
    GUID = LibC::GUID.new(0xb23eb630_u32, 0x3e1c_u16, 0x11d3_u16, StaticArray[0xa7_u8, 0x45_u8, 0x0_u8, 0x50_u8, 0x4_u8, 0xa_u8, 0xb4_u8, 0x7_u8])
    def query_interface(this : ITfContextOwnerServices*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfContextOwnerServices*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfContextOwnerServices*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_layout_change(this : ITfContextOwnerServices*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_layout_change.call(this)
    end
    def on_status_change(this : ITfContextOwnerServices*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_status_change.call(this, dwFlags)
    end
    def on_attribute_change(this : ITfContextOwnerServices*, rguidAttribute : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_attribute_change.call(this, rguidAttribute)
    end
    def serialize(this : ITfContextOwnerServices*, pProp : Void*, pRange : Void*, pHdr : Win32cr::UI::TextServices::TF_PERSISTENT_PROPERTY_HEADER_ACP*, pStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pProp, pRange, pHdr, pStream)
    end
    def unserialize(this : ITfContextOwnerServices*, pProp : Void*, pHdr : Win32cr::UI::TextServices::TF_PERSISTENT_PROPERTY_HEADER_ACP*, pStream : Void*, pLoader : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unserialize.call(this, pProp, pHdr, pStream, pLoader)
    end
    def force_load_property(this : ITfContextOwnerServices*, pProp : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_load_property.call(this, pProp)
    end
    def create_range(this : ITfContextOwnerServices*, acpStart : Int32, acpEnd : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_range.call(this, acpStart, acpEnd, ppRange)
    end

  end

  @[Extern]
  record ITfContextKeyEventSinkVtbl,
    query_interface : Proc(ITfContextKeyEventSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfContextKeyEventSink*, UInt32),
    release : Proc(ITfContextKeyEventSink*, UInt32),
    on_key_down : Proc(ITfContextKeyEventSink*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    on_key_up : Proc(ITfContextKeyEventSink*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    on_test_key_down : Proc(ITfContextKeyEventSink*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    on_test_key_up : Proc(ITfContextKeyEventSink*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0552ba5d-c835-4934-bf50-846aaa67432f")]
  record ITfContextKeyEventSink, lpVtbl : ITfContextKeyEventSinkVtbl* do
    GUID = LibC::GUID.new(0x552ba5d_u32, 0xc835_u16, 0x4934_u16, StaticArray[0xbf_u8, 0x50_u8, 0x84_u8, 0x6a_u8, 0xaa_u8, 0x67_u8, 0x43_u8, 0x2f_u8])
    def query_interface(this : ITfContextKeyEventSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfContextKeyEventSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfContextKeyEventSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_key_down(this : ITfContextKeyEventSink*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_key_down.call(this, wParam, lParam, pfEaten)
    end
    def on_key_up(this : ITfContextKeyEventSink*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_key_up.call(this, wParam, lParam, pfEaten)
    end
    def on_test_key_down(this : ITfContextKeyEventSink*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_test_key_down.call(this, wParam, lParam, pfEaten)
    end
    def on_test_key_up(this : ITfContextKeyEventSink*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_test_key_up.call(this, wParam, lParam, pfEaten)
    end

  end

  @[Extern]
  record ITfEditSessionVtbl,
    query_interface : Proc(ITfEditSession*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfEditSession*, UInt32),
    release : Proc(ITfEditSession*, UInt32),
    do_edit_session : Proc(ITfEditSession*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aa80e803-2021-11d2-93e0-0060b067b86e")]
  record ITfEditSession, lpVtbl : ITfEditSessionVtbl* do
    GUID = LibC::GUID.new(0xaa80e803_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : ITfEditSession*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfEditSession*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfEditSession*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def do_edit_session(this : ITfEditSession*, ec : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_edit_session.call(this, ec)
    end

  end

  @[Extern]
  record ITfRangeVtbl,
    query_interface : Proc(ITfRange*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfRange*, UInt32),
    release : Proc(ITfRange*, UInt32),
    get_text : Proc(ITfRange*, UInt32, UInt32, UInt16*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_text : Proc(ITfRange*, UInt32, UInt32, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    get_formatted_text : Proc(ITfRange*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_embedded : Proc(ITfRange*, UInt32, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    insert_embedded : Proc(ITfRange*, UInt32, UInt32, Void*, Win32cr::Foundation::HRESULT),
    shift_start : Proc(ITfRange*, UInt32, Int32, Int32*, Win32cr::UI::TextServices::TF_HALTCOND*, Win32cr::Foundation::HRESULT),
    shift_end : Proc(ITfRange*, UInt32, Int32, Int32*, Win32cr::UI::TextServices::TF_HALTCOND*, Win32cr::Foundation::HRESULT),
    shift_start_to_range : Proc(ITfRange*, UInt32, Void*, Win32cr::UI::TextServices::TfAnchor, Win32cr::Foundation::HRESULT),
    shift_end_to_range : Proc(ITfRange*, UInt32, Void*, Win32cr::UI::TextServices::TfAnchor, Win32cr::Foundation::HRESULT),
    shift_start_region : Proc(ITfRange*, UInt32, Win32cr::UI::TextServices::TfShiftDir, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    shift_end_region : Proc(ITfRange*, UInt32, Win32cr::UI::TextServices::TfShiftDir, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_empty : Proc(ITfRange*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    collapse : Proc(ITfRange*, UInt32, Win32cr::UI::TextServices::TfAnchor, Win32cr::Foundation::HRESULT),
    is_equal_start : Proc(ITfRange*, UInt32, Void*, Win32cr::UI::TextServices::TfAnchor, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_equal_end : Proc(ITfRange*, UInt32, Void*, Win32cr::UI::TextServices::TfAnchor, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    compare_start : Proc(ITfRange*, UInt32, Void*, Win32cr::UI::TextServices::TfAnchor, Int32*, Win32cr::Foundation::HRESULT),
    compare_end : Proc(ITfRange*, UInt32, Void*, Win32cr::UI::TextServices::TfAnchor, Int32*, Win32cr::Foundation::HRESULT),
    adjust_for_insert : Proc(ITfRange*, UInt32, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_gravity : Proc(ITfRange*, Win32cr::UI::TextServices::TfGravity*, Win32cr::UI::TextServices::TfGravity*, Win32cr::Foundation::HRESULT),
    set_gravity : Proc(ITfRange*, UInt32, Win32cr::UI::TextServices::TfGravity, Win32cr::UI::TextServices::TfGravity, Win32cr::Foundation::HRESULT),
    clone : Proc(ITfRange*, Void**, Win32cr::Foundation::HRESULT),
    get_context : Proc(ITfRange*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aa80e7ff-2021-11d2-93e0-0060b067b86e")]
  record ITfRange, lpVtbl : ITfRangeVtbl* do
    GUID = LibC::GUID.new(0xaa80e7ff_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : ITfRange*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfRange*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfRange*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_text(this : ITfRange*, ec : UInt32, dwFlags : UInt32, pchText : UInt16*, cchMax : UInt32, pcch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, ec, dwFlags, pchText, cchMax, pcch)
    end
    def set_text(this : ITfRange*, ec : UInt32, dwFlags : UInt32, pchText : UInt16*, cch : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text.call(this, ec, dwFlags, pchText, cch)
    end
    def get_formatted_text(this : ITfRange*, ec : UInt32, ppDataObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_formatted_text.call(this, ec, ppDataObject)
    end
    def get_embedded(this : ITfRange*, ec : UInt32, rguidService : LibC::GUID*, riid : LibC::GUID*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_embedded.call(this, ec, rguidService, riid, ppunk)
    end
    def insert_embedded(this : ITfRange*, ec : UInt32, dwFlags : UInt32, pDataObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_embedded.call(this, ec, dwFlags, pDataObject)
    end
    def shift_start(this : ITfRange*, ec : UInt32, cchReq : Int32, pcch : Int32*, pHalt : Win32cr::UI::TextServices::TF_HALTCOND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_start.call(this, ec, cchReq, pcch, pHalt)
    end
    def shift_end(this : ITfRange*, ec : UInt32, cchReq : Int32, pcch : Int32*, pHalt : Win32cr::UI::TextServices::TF_HALTCOND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_end.call(this, ec, cchReq, pcch, pHalt)
    end
    def shift_start_to_range(this : ITfRange*, ec : UInt32, pRange : Void*, aPos : Win32cr::UI::TextServices::TfAnchor) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_start_to_range.call(this, ec, pRange, aPos)
    end
    def shift_end_to_range(this : ITfRange*, ec : UInt32, pRange : Void*, aPos : Win32cr::UI::TextServices::TfAnchor) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_end_to_range.call(this, ec, pRange, aPos)
    end
    def shift_start_region(this : ITfRange*, ec : UInt32, dir : Win32cr::UI::TextServices::TfShiftDir, pfNoRegion : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_start_region.call(this, ec, dir, pfNoRegion)
    end
    def shift_end_region(this : ITfRange*, ec : UInt32, dir : Win32cr::UI::TextServices::TfShiftDir, pfNoRegion : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_end_region.call(this, ec, dir, pfNoRegion)
    end
    def is_empty(this : ITfRange*, ec : UInt32, pfEmpty : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_empty.call(this, ec, pfEmpty)
    end
    def collapse(this : ITfRange*, ec : UInt32, aPos : Win32cr::UI::TextServices::TfAnchor) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collapse.call(this, ec, aPos)
    end
    def is_equal_start(this : ITfRange*, ec : UInt32, pWith : Void*, aPos : Win32cr::UI::TextServices::TfAnchor, pfEqual : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal_start.call(this, ec, pWith, aPos, pfEqual)
    end
    def is_equal_end(this : ITfRange*, ec : UInt32, pWith : Void*, aPos : Win32cr::UI::TextServices::TfAnchor, pfEqual : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal_end.call(this, ec, pWith, aPos, pfEqual)
    end
    def compare_start(this : ITfRange*, ec : UInt32, pWith : Void*, aPos : Win32cr::UI::TextServices::TfAnchor, plResult : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_start.call(this, ec, pWith, aPos, plResult)
    end
    def compare_end(this : ITfRange*, ec : UInt32, pWith : Void*, aPos : Win32cr::UI::TextServices::TfAnchor, plResult : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_end.call(this, ec, pWith, aPos, plResult)
    end
    def adjust_for_insert(this : ITfRange*, ec : UInt32, cchInsert : UInt32, pfInsertOk : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.adjust_for_insert.call(this, ec, cchInsert, pfInsertOk)
    end
    def get_gravity(this : ITfRange*, pgStart : Win32cr::UI::TextServices::TfGravity*, pgEnd : Win32cr::UI::TextServices::TfGravity*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gravity.call(this, pgStart, pgEnd)
    end
    def set_gravity(this : ITfRange*, ec : UInt32, gStart : Win32cr::UI::TextServices::TfGravity, gEnd : Win32cr::UI::TextServices::TfGravity) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gravity.call(this, ec, gStart, gEnd)
    end
    def clone(this : ITfRange*, ppClone : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppClone)
    end
    def get_context(this : ITfRange*, ppContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context.call(this, ppContext)
    end

  end

  @[Extern]
  record ITfRangeACPVtbl,
    query_interface : Proc(ITfRangeACP*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfRangeACP*, UInt32),
    release : Proc(ITfRangeACP*, UInt32),
    get_text : Proc(ITfRangeACP*, UInt32, UInt32, UInt16*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_text : Proc(ITfRangeACP*, UInt32, UInt32, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    get_formatted_text : Proc(ITfRangeACP*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_embedded : Proc(ITfRangeACP*, UInt32, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    insert_embedded : Proc(ITfRangeACP*, UInt32, UInt32, Void*, Win32cr::Foundation::HRESULT),
    shift_start : Proc(ITfRangeACP*, UInt32, Int32, Int32*, Win32cr::UI::TextServices::TF_HALTCOND*, Win32cr::Foundation::HRESULT),
    shift_end : Proc(ITfRangeACP*, UInt32, Int32, Int32*, Win32cr::UI::TextServices::TF_HALTCOND*, Win32cr::Foundation::HRESULT),
    shift_start_to_range : Proc(ITfRangeACP*, UInt32, Void*, Win32cr::UI::TextServices::TfAnchor, Win32cr::Foundation::HRESULT),
    shift_end_to_range : Proc(ITfRangeACP*, UInt32, Void*, Win32cr::UI::TextServices::TfAnchor, Win32cr::Foundation::HRESULT),
    shift_start_region : Proc(ITfRangeACP*, UInt32, Win32cr::UI::TextServices::TfShiftDir, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    shift_end_region : Proc(ITfRangeACP*, UInt32, Win32cr::UI::TextServices::TfShiftDir, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_empty : Proc(ITfRangeACP*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    collapse : Proc(ITfRangeACP*, UInt32, Win32cr::UI::TextServices::TfAnchor, Win32cr::Foundation::HRESULT),
    is_equal_start : Proc(ITfRangeACP*, UInt32, Void*, Win32cr::UI::TextServices::TfAnchor, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    is_equal_end : Proc(ITfRangeACP*, UInt32, Void*, Win32cr::UI::TextServices::TfAnchor, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    compare_start : Proc(ITfRangeACP*, UInt32, Void*, Win32cr::UI::TextServices::TfAnchor, Int32*, Win32cr::Foundation::HRESULT),
    compare_end : Proc(ITfRangeACP*, UInt32, Void*, Win32cr::UI::TextServices::TfAnchor, Int32*, Win32cr::Foundation::HRESULT),
    adjust_for_insert : Proc(ITfRangeACP*, UInt32, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_gravity : Proc(ITfRangeACP*, Win32cr::UI::TextServices::TfGravity*, Win32cr::UI::TextServices::TfGravity*, Win32cr::Foundation::HRESULT),
    set_gravity : Proc(ITfRangeACP*, UInt32, Win32cr::UI::TextServices::TfGravity, Win32cr::UI::TextServices::TfGravity, Win32cr::Foundation::HRESULT),
    clone : Proc(ITfRangeACP*, Void**, Win32cr::Foundation::HRESULT),
    get_context : Proc(ITfRangeACP*, Void**, Win32cr::Foundation::HRESULT),
    get_extent : Proc(ITfRangeACP*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    set_extent : Proc(ITfRangeACP*, Int32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("057a6296-029b-4154-b79a-0d461d4ea94c")]
  record ITfRangeACP, lpVtbl : ITfRangeACPVtbl* do
    GUID = LibC::GUID.new(0x57a6296_u32, 0x29b_u16, 0x4154_u16, StaticArray[0xb7_u8, 0x9a_u8, 0xd_u8, 0x46_u8, 0x1d_u8, 0x4e_u8, 0xa9_u8, 0x4c_u8])
    def query_interface(this : ITfRangeACP*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfRangeACP*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfRangeACP*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_text(this : ITfRangeACP*, ec : UInt32, dwFlags : UInt32, pchText : UInt16*, cchMax : UInt32, pcch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, ec, dwFlags, pchText, cchMax, pcch)
    end
    def set_text(this : ITfRangeACP*, ec : UInt32, dwFlags : UInt32, pchText : UInt16*, cch : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_text.call(this, ec, dwFlags, pchText, cch)
    end
    def get_formatted_text(this : ITfRangeACP*, ec : UInt32, ppDataObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_formatted_text.call(this, ec, ppDataObject)
    end
    def get_embedded(this : ITfRangeACP*, ec : UInt32, rguidService : LibC::GUID*, riid : LibC::GUID*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_embedded.call(this, ec, rguidService, riid, ppunk)
    end
    def insert_embedded(this : ITfRangeACP*, ec : UInt32, dwFlags : UInt32, pDataObject : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_embedded.call(this, ec, dwFlags, pDataObject)
    end
    def shift_start(this : ITfRangeACP*, ec : UInt32, cchReq : Int32, pcch : Int32*, pHalt : Win32cr::UI::TextServices::TF_HALTCOND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_start.call(this, ec, cchReq, pcch, pHalt)
    end
    def shift_end(this : ITfRangeACP*, ec : UInt32, cchReq : Int32, pcch : Int32*, pHalt : Win32cr::UI::TextServices::TF_HALTCOND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_end.call(this, ec, cchReq, pcch, pHalt)
    end
    def shift_start_to_range(this : ITfRangeACP*, ec : UInt32, pRange : Void*, aPos : Win32cr::UI::TextServices::TfAnchor) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_start_to_range.call(this, ec, pRange, aPos)
    end
    def shift_end_to_range(this : ITfRangeACP*, ec : UInt32, pRange : Void*, aPos : Win32cr::UI::TextServices::TfAnchor) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_end_to_range.call(this, ec, pRange, aPos)
    end
    def shift_start_region(this : ITfRangeACP*, ec : UInt32, dir : Win32cr::UI::TextServices::TfShiftDir, pfNoRegion : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_start_region.call(this, ec, dir, pfNoRegion)
    end
    def shift_end_region(this : ITfRangeACP*, ec : UInt32, dir : Win32cr::UI::TextServices::TfShiftDir, pfNoRegion : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shift_end_region.call(this, ec, dir, pfNoRegion)
    end
    def is_empty(this : ITfRangeACP*, ec : UInt32, pfEmpty : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_empty.call(this, ec, pfEmpty)
    end
    def collapse(this : ITfRangeACP*, ec : UInt32, aPos : Win32cr::UI::TextServices::TfAnchor) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collapse.call(this, ec, aPos)
    end
    def is_equal_start(this : ITfRangeACP*, ec : UInt32, pWith : Void*, aPos : Win32cr::UI::TextServices::TfAnchor, pfEqual : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal_start.call(this, ec, pWith, aPos, pfEqual)
    end
    def is_equal_end(this : ITfRangeACP*, ec : UInt32, pWith : Void*, aPos : Win32cr::UI::TextServices::TfAnchor, pfEqual : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal_end.call(this, ec, pWith, aPos, pfEqual)
    end
    def compare_start(this : ITfRangeACP*, ec : UInt32, pWith : Void*, aPos : Win32cr::UI::TextServices::TfAnchor, plResult : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_start.call(this, ec, pWith, aPos, plResult)
    end
    def compare_end(this : ITfRangeACP*, ec : UInt32, pWith : Void*, aPos : Win32cr::UI::TextServices::TfAnchor, plResult : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_end.call(this, ec, pWith, aPos, plResult)
    end
    def adjust_for_insert(this : ITfRangeACP*, ec : UInt32, cchInsert : UInt32, pfInsertOk : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.adjust_for_insert.call(this, ec, cchInsert, pfInsertOk)
    end
    def get_gravity(this : ITfRangeACP*, pgStart : Win32cr::UI::TextServices::TfGravity*, pgEnd : Win32cr::UI::TextServices::TfGravity*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gravity.call(this, pgStart, pgEnd)
    end
    def set_gravity(this : ITfRangeACP*, ec : UInt32, gStart : Win32cr::UI::TextServices::TfGravity, gEnd : Win32cr::UI::TextServices::TfGravity) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gravity.call(this, ec, gStart, gEnd)
    end
    def clone(this : ITfRangeACP*, ppClone : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppClone)
    end
    def get_context(this : ITfRangeACP*, ppContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context.call(this, ppContext)
    end
    def get_extent(this : ITfRangeACP*, pacpAnchor : Int32*, pcch : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_extent.call(this, pacpAnchor, pcch)
    end
    def set_extent(this : ITfRangeACP*, acpAnchor : Int32, cch : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_extent.call(this, acpAnchor, cch)
    end

  end

  @[Extern]
  record ITextStoreACPServicesVtbl,
    query_interface : Proc(ITextStoreACPServices*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextStoreACPServices*, UInt32),
    release : Proc(ITextStoreACPServices*, UInt32),
    serialize : Proc(ITextStoreACPServices*, Void*, Void*, Win32cr::UI::TextServices::TF_PERSISTENT_PROPERTY_HEADER_ACP*, Void*, Win32cr::Foundation::HRESULT),
    unserialize : Proc(ITextStoreACPServices*, Void*, Win32cr::UI::TextServices::TF_PERSISTENT_PROPERTY_HEADER_ACP*, Void*, Void*, Win32cr::Foundation::HRESULT),
    force_load_property : Proc(ITextStoreACPServices*, Void*, Win32cr::Foundation::HRESULT),
    create_range : Proc(ITextStoreACPServices*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aa80e901-2021-11d2-93e0-0060b067b86e")]
  record ITextStoreACPServices, lpVtbl : ITextStoreACPServicesVtbl* do
    GUID = LibC::GUID.new(0xaa80e901_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : ITextStoreACPServices*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextStoreACPServices*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextStoreACPServices*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def serialize(this : ITextStoreACPServices*, pProp : Void*, pRange : Void*, pHdr : Win32cr::UI::TextServices::TF_PERSISTENT_PROPERTY_HEADER_ACP*, pStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pProp, pRange, pHdr, pStream)
    end
    def unserialize(this : ITextStoreACPServices*, pProp : Void*, pHdr : Win32cr::UI::TextServices::TF_PERSISTENT_PROPERTY_HEADER_ACP*, pStream : Void*, pLoader : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unserialize.call(this, pProp, pHdr, pStream, pLoader)
    end
    def force_load_property(this : ITextStoreACPServices*, pProp : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.force_load_property.call(this, pProp)
    end
    def create_range(this : ITextStoreACPServices*, acpStart : Int32, acpEnd : Int32, ppRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_range.call(this, acpStart, acpEnd, ppRange)
    end

  end

  @[Extern]
  record ITfRangeBackupVtbl,
    query_interface : Proc(ITfRangeBackup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfRangeBackup*, UInt32),
    release : Proc(ITfRangeBackup*, UInt32),
    restore : Proc(ITfRangeBackup*, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("463a506d-6992-49d2-9b88-93d55e70bb16")]
  record ITfRangeBackup, lpVtbl : ITfRangeBackupVtbl* do
    GUID = LibC::GUID.new(0x463a506d_u32, 0x6992_u16, 0x49d2_u16, StaticArray[0x9b_u8, 0x88_u8, 0x93_u8, 0xd5_u8, 0x5e_u8, 0x70_u8, 0xbb_u8, 0x16_u8])
    def query_interface(this : ITfRangeBackup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfRangeBackup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfRangeBackup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def restore(this : ITfRangeBackup*, ec : UInt32, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore.call(this, ec, pRange)
    end

  end

  @[Extern]
  record ITfPropertyStoreVtbl,
    query_interface : Proc(ITfPropertyStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfPropertyStore*, UInt32),
    release : Proc(ITfPropertyStore*, UInt32),
    get_type : Proc(ITfPropertyStore*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_data_type : Proc(ITfPropertyStore*, UInt32*, Win32cr::Foundation::HRESULT),
    get_data : Proc(ITfPropertyStore*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    on_text_updated : Proc(ITfPropertyStore*, UInt32, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    shrink : Proc(ITfPropertyStore*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    divide : Proc(ITfPropertyStore*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    clone : Proc(ITfPropertyStore*, Void**, Win32cr::Foundation::HRESULT),
    get_property_range_creator : Proc(ITfPropertyStore*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    serialize : Proc(ITfPropertyStore*, Void*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6834b120-88cb-11d2-bf45-00105a2799b5")]
  record ITfPropertyStore, lpVtbl : ITfPropertyStoreVtbl* do
    GUID = LibC::GUID.new(0x6834b120_u32, 0x88cb_u16, 0x11d2_u16, StaticArray[0xbf_u8, 0x45_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : ITfPropertyStore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfPropertyStore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfPropertyStore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type(this : ITfPropertyStore*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pguid)
    end
    def get_data_type(this : ITfPropertyStore*, pdwReserved : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data_type.call(this, pdwReserved)
    end
    def get_data(this : ITfPropertyStore*, pvarValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_data.call(this, pvarValue)
    end
    def on_text_updated(this : ITfPropertyStore*, dwFlags : UInt32, pRangeNew : Void*, pfAccept : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_text_updated.call(this, dwFlags, pRangeNew, pfAccept)
    end
    def shrink(this : ITfPropertyStore*, pRangeNew : Void*, pfFree : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shrink.call(this, pRangeNew, pfFree)
    end
    def divide(this : ITfPropertyStore*, pRangeThis : Void*, pRangeNew : Void*, ppPropStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.divide.call(this, pRangeThis, pRangeNew, ppPropStore)
    end
    def clone(this : ITfPropertyStore*, pPropStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, pPropStore)
    end
    def get_property_range_creator(this : ITfPropertyStore*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_range_creator.call(this, pclsid)
    end
    def serialize(this : ITfPropertyStore*, pStream : Void*, pcb : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.serialize.call(this, pStream, pcb)
    end

  end

  @[Extern]
  record IEnumTfRangesVtbl,
    query_interface : Proc(IEnumTfRanges*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTfRanges*, UInt32),
    release : Proc(IEnumTfRanges*, UInt32),
    clone : Proc(IEnumTfRanges*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumTfRanges*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTfRanges*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTfRanges*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f99d3f40-8e32-11d2-bf46-00105a2799b5")]
  record IEnumTfRanges, lpVtbl : IEnumTfRangesVtbl* do
    GUID = LibC::GUID.new(0xf99d3f40_u32, 0x8e32_u16, 0x11d2_u16, StaticArray[0xbf_u8, 0x46_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : IEnumTfRanges*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTfRanges*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTfRanges*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumTfRanges*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumTfRanges*, ulCount : UInt32, ppRange : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, ppRange, pcFetched)
    end
    def reset(this : IEnumTfRanges*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumTfRanges*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfCreatePropertyStoreVtbl,
    query_interface : Proc(ITfCreatePropertyStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfCreatePropertyStore*, UInt32),
    release : Proc(ITfCreatePropertyStore*, UInt32),
    is_store_serializable : Proc(ITfCreatePropertyStore*, LibC::GUID*, Void*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    create_property_store : Proc(ITfCreatePropertyStore*, LibC::GUID*, Void*, UInt32, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2463fbf0-b0af-11d2-afc5-00105a2799b5")]
  record ITfCreatePropertyStore, lpVtbl : ITfCreatePropertyStoreVtbl* do
    GUID = LibC::GUID.new(0x2463fbf0_u32, 0xb0af_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xc5_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : ITfCreatePropertyStore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfCreatePropertyStore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfCreatePropertyStore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def is_store_serializable(this : ITfCreatePropertyStore*, guidProp : LibC::GUID*, pRange : Void*, pPropStore : Void*, pfSerializable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_store_serializable.call(this, guidProp, pRange, pPropStore, pfSerializable)
    end
    def create_property_store(this : ITfCreatePropertyStore*, guidProp : LibC::GUID*, pRange : Void*, cb : UInt32, pStream : Void*, ppStore : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_store.call(this, guidProp, pRange, cb, pStream, ppStore)
    end

  end

  @[Extern]
  record ITfPersistentPropertyLoaderACPVtbl,
    query_interface : Proc(ITfPersistentPropertyLoaderACP*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfPersistentPropertyLoaderACP*, UInt32),
    release : Proc(ITfPersistentPropertyLoaderACP*, UInt32),
    load_property : Proc(ITfPersistentPropertyLoaderACP*, Win32cr::UI::TextServices::TF_PERSISTENT_PROPERTY_HEADER_ACP*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4ef89150-0807-11d3-8df0-00105a2799b5")]
  record ITfPersistentPropertyLoaderACP, lpVtbl : ITfPersistentPropertyLoaderACPVtbl* do
    GUID = LibC::GUID.new(0x4ef89150_u32, 0x807_u16, 0x11d3_u16, StaticArray[0x8d_u8, 0xf0_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : ITfPersistentPropertyLoaderACP*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfPersistentPropertyLoaderACP*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfPersistentPropertyLoaderACP*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def load_property(this : ITfPersistentPropertyLoaderACP*, pHdr : Win32cr::UI::TextServices::TF_PERSISTENT_PROPERTY_HEADER_ACP*, ppStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load_property.call(this, pHdr, ppStream)
    end

  end

  @[Extern]
  record ITfPropertyVtbl,
    query_interface : Proc(ITfProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfProperty*, UInt32),
    release : Proc(ITfProperty*, UInt32),
    get_type : Proc(ITfProperty*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    enum_ranges : Proc(ITfProperty*, UInt32, Void**, Void*, Win32cr::Foundation::HRESULT),
    get_value : Proc(ITfProperty*, UInt32, Void*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_context : Proc(ITfProperty*, Void**, Win32cr::Foundation::HRESULT),
    find_range : Proc(ITfProperty*, UInt32, Void*, Void**, Win32cr::UI::TextServices::TfAnchor, Win32cr::Foundation::HRESULT),
    set_value_store : Proc(ITfProperty*, UInt32, Void*, Void*, Win32cr::Foundation::HRESULT),
    set_value : Proc(ITfProperty*, UInt32, Void*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    clear : Proc(ITfProperty*, UInt32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e2449660-9542-11d2-bf46-00105a2799b5")]
  record ITfProperty, lpVtbl : ITfPropertyVtbl* do
    GUID = LibC::GUID.new(0xe2449660_u32, 0x9542_u16, 0x11d2_u16, StaticArray[0xbf_u8, 0x46_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : ITfProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type(this : ITfProperty*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pguid)
    end
    def enum_ranges(this : ITfProperty*, ec : UInt32, ppEnum : Void**, pTargetRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ranges.call(this, ec, ppEnum, pTargetRange)
    end
    def get_value(this : ITfProperty*, ec : UInt32, pRange : Void*, pvarValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, ec, pRange, pvarValue)
    end
    def get_context(this : ITfProperty*, ppContext : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context.call(this, ppContext)
    end
    def find_range(this : ITfProperty*, ec : UInt32, pRange : Void*, ppRange : Void**, aPos : Win32cr::UI::TextServices::TfAnchor) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_range.call(this, ec, pRange, ppRange, aPos)
    end
    def set_value_store(this : ITfProperty*, ec : UInt32, pRange : Void*, pPropStore : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value_store.call(this, ec, pRange, pPropStore)
    end
    def set_value(this : ITfProperty*, ec : UInt32, pRange : Void*, pvarValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, ec, pRange, pvarValue)
    end
    def clear(this : ITfProperty*, ec : UInt32, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear.call(this, ec, pRange)
    end

  end

  @[Extern]
  record IEnumTfPropertiesVtbl,
    query_interface : Proc(IEnumTfProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTfProperties*, UInt32),
    release : Proc(IEnumTfProperties*, UInt32),
    clone : Proc(IEnumTfProperties*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumTfProperties*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTfProperties*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTfProperties*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("19188cb0-aca9-11d2-afc5-00105a2799b5")]
  record IEnumTfProperties, lpVtbl : IEnumTfPropertiesVtbl* do
    GUID = LibC::GUID.new(0x19188cb0_u32, 0xaca9_u16, 0x11d2_u16, StaticArray[0xaf_u8, 0xc5_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : IEnumTfProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTfProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTfProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumTfProperties*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumTfProperties*, ulCount : UInt32, ppProp : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, ppProp, pcFetched)
    end
    def reset(this : IEnumTfProperties*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumTfProperties*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfCompartmentVtbl,
    query_interface : Proc(ITfCompartment*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfCompartment*, UInt32),
    release : Proc(ITfCompartment*, UInt32),
    set_value : Proc(ITfCompartment*, UInt32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_value : Proc(ITfCompartment*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bb08f7a9-607a-4384-8623-056892b64371")]
  record ITfCompartment, lpVtbl : ITfCompartmentVtbl* do
    GUID = LibC::GUID.new(0xbb08f7a9_u32, 0x607a_u16, 0x4384_u16, StaticArray[0x86_u8, 0x23_u8, 0x5_u8, 0x68_u8, 0x92_u8, 0xb6_u8, 0x43_u8, 0x71_u8])
    def query_interface(this : ITfCompartment*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfCompartment*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfCompartment*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_value(this : ITfCompartment*, tid : UInt32, pvarValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, tid, pvarValue)
    end
    def get_value(this : ITfCompartment*, pvarValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_value.call(this, pvarValue)
    end

  end

  @[Extern]
  record ITfCompartmentEventSinkVtbl,
    query_interface : Proc(ITfCompartmentEventSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfCompartmentEventSink*, UInt32),
    release : Proc(ITfCompartmentEventSink*, UInt32),
    on_change : Proc(ITfCompartmentEventSink*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("743abd5f-f26d-48df-8cc5-238492419b64")]
  record ITfCompartmentEventSink, lpVtbl : ITfCompartmentEventSinkVtbl* do
    GUID = LibC::GUID.new(0x743abd5f_u32, 0xf26d_u16, 0x48df_u16, StaticArray[0x8c_u8, 0xc5_u8, 0x23_u8, 0x84_u8, 0x92_u8, 0x41_u8, 0x9b_u8, 0x64_u8])
    def query_interface(this : ITfCompartmentEventSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfCompartmentEventSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfCompartmentEventSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_change(this : ITfCompartmentEventSink*, rguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_change.call(this, rguid)
    end

  end

  @[Extern]
  record ITfCompartmentMgrVtbl,
    query_interface : Proc(ITfCompartmentMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfCompartmentMgr*, UInt32),
    release : Proc(ITfCompartmentMgr*, UInt32),
    get_compartment : Proc(ITfCompartmentMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    clear_compartment : Proc(ITfCompartmentMgr*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    enum_compartments : Proc(ITfCompartmentMgr*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7dcf57ac-18ad-438b-824d-979bffb74b7c")]
  record ITfCompartmentMgr, lpVtbl : ITfCompartmentMgrVtbl* do
    GUID = LibC::GUID.new(0x7dcf57ac_u32, 0x18ad_u16, 0x438b_u16, StaticArray[0x82_u8, 0x4d_u8, 0x97_u8, 0x9b_u8, 0xff_u8, 0xb7_u8, 0x4b_u8, 0x7c_u8])
    def query_interface(this : ITfCompartmentMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfCompartmentMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfCompartmentMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_compartment(this : ITfCompartmentMgr*, rguid : LibC::GUID*, ppcomp : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_compartment.call(this, rguid, ppcomp)
    end
    def clear_compartment(this : ITfCompartmentMgr*, tid : UInt32, rguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_compartment.call(this, tid, rguid)
    end
    def enum_compartments(this : ITfCompartmentMgr*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_compartments.call(this, ppEnum)
    end

  end

  @[Extern]
  record ITfFunctionVtbl,
    query_interface : Proc(ITfFunction*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFunction*, UInt32),
    release : Proc(ITfFunction*, UInt32),
    get_display_name : Proc(ITfFunction*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("db593490-098f-11d3-8df0-00105a2799b5")]
  record ITfFunction, lpVtbl : ITfFunctionVtbl* do
    GUID = LibC::GUID.new(0xdb593490_u32, 0x98f_u16, 0x11d3_u16, StaticArray[0x8d_u8, 0xf0_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : ITfFunction*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFunction*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFunction*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFunction*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end

  end

  @[Extern]
  record ITfFunctionProviderVtbl,
    query_interface : Proc(ITfFunctionProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFunctionProvider*, UInt32),
    release : Proc(ITfFunctionProvider*, UInt32),
    get_type : Proc(ITfFunctionProvider*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_description : Proc(ITfFunctionProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_function : Proc(ITfFunctionProvider*, LibC::GUID*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("101d6610-0990-11d3-8df0-00105a2799b5")]
  record ITfFunctionProvider, lpVtbl : ITfFunctionProviderVtbl* do
    GUID = LibC::GUID.new(0x101d6610_u32, 0x990_u16, 0x11d3_u16, StaticArray[0x8d_u8, 0xf0_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : ITfFunctionProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFunctionProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFunctionProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type(this : ITfFunctionProvider*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type.call(this, pguid)
    end
    def get_description(this : ITfFunctionProvider*, pbstrDesc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pbstrDesc)
    end
    def get_function(this : ITfFunctionProvider*, rguid : LibC::GUID*, riid : LibC::GUID*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_function.call(this, rguid, riid, ppunk)
    end

  end

  @[Extern]
  record IEnumTfFunctionProvidersVtbl,
    query_interface : Proc(IEnumTfFunctionProviders*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTfFunctionProviders*, UInt32),
    release : Proc(IEnumTfFunctionProviders*, UInt32),
    clone : Proc(IEnumTfFunctionProviders*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumTfFunctionProviders*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTfFunctionProviders*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTfFunctionProviders*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e4b24db0-0990-11d3-8df0-00105a2799b5")]
  record IEnumTfFunctionProviders, lpVtbl : IEnumTfFunctionProvidersVtbl* do
    GUID = LibC::GUID.new(0xe4b24db0_u32, 0x990_u16, 0x11d3_u16, StaticArray[0x8d_u8, 0xf0_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : IEnumTfFunctionProviders*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTfFunctionProviders*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTfFunctionProviders*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumTfFunctionProviders*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumTfFunctionProviders*, ulCount : UInt32, ppCmdobj : Void**, pcFetch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, ppCmdobj, pcFetch)
    end
    def reset(this : IEnumTfFunctionProviders*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumTfFunctionProviders*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfInputProcessorProfilesVtbl,
    query_interface : Proc(ITfInputProcessorProfiles*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfInputProcessorProfiles*, UInt32),
    release : Proc(ITfInputProcessorProfiles*, UInt32),
    register : Proc(ITfInputProcessorProfiles*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    unregister : Proc(ITfInputProcessorProfiles*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    add_language_profile : Proc(ITfInputProcessorProfiles*, LibC::GUID*, UInt16, LibC::GUID*, UInt16*, UInt32, UInt16*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    remove_language_profile : Proc(ITfInputProcessorProfiles*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::Foundation::HRESULT),
    enum_input_processor_info : Proc(ITfInputProcessorProfiles*, Void**, Win32cr::Foundation::HRESULT),
    get_default_language_profile : Proc(ITfInputProcessorProfiles*, UInt16, LibC::GUID*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_default_language_profile : Proc(ITfInputProcessorProfiles*, UInt16, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    activate_language_profile : Proc(ITfInputProcessorProfiles*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_active_language_profile : Proc(ITfInputProcessorProfiles*, LibC::GUID*, UInt16*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_language_profile_description : Proc(ITfInputProcessorProfiles*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_current_language : Proc(ITfInputProcessorProfiles*, UInt16*, Win32cr::Foundation::HRESULT),
    change_current_language : Proc(ITfInputProcessorProfiles*, UInt16, Win32cr::Foundation::HRESULT),
    get_language_list : Proc(ITfInputProcessorProfiles*, UInt16**, UInt32*, Win32cr::Foundation::HRESULT),
    enum_language_profiles : Proc(ITfInputProcessorProfiles*, UInt16, Void**, Win32cr::Foundation::HRESULT),
    enable_language_profile : Proc(ITfInputProcessorProfiles*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_enabled_language_profile : Proc(ITfInputProcessorProfiles*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    enable_language_profile_by_default : Proc(ITfInputProcessorProfiles*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    substitute_keyboard_layout : Proc(ITfInputProcessorProfiles*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1f02b6c5-7842-4ee6-8a0b-9a24183a95ca")]
  record ITfInputProcessorProfiles, lpVtbl : ITfInputProcessorProfilesVtbl* do
    GUID = LibC::GUID.new(0x1f02b6c5_u32, 0x7842_u16, 0x4ee6_u16, StaticArray[0x8a_u8, 0xb_u8, 0x9a_u8, 0x24_u8, 0x18_u8, 0x3a_u8, 0x95_u8, 0xca_u8])
    def query_interface(this : ITfInputProcessorProfiles*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfInputProcessorProfiles*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfInputProcessorProfiles*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register(this : ITfInputProcessorProfiles*, rclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register.call(this, rclsid)
    end
    def unregister(this : ITfInputProcessorProfiles*, rclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister.call(this, rclsid)
    end
    def add_language_profile(this : ITfInputProcessorProfiles*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, pchDesc : UInt16*, cchDesc : UInt32, pchIconFile : UInt16*, cchFile : UInt32, uIconIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_language_profile.call(this, rclsid, langid, guidProfile, pchDesc, cchDesc, pchIconFile, cchFile, uIconIndex)
    end
    def remove_language_profile(this : ITfInputProcessorProfiles*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_language_profile.call(this, rclsid, langid, guidProfile)
    end
    def enum_input_processor_info(this : ITfInputProcessorProfiles*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_input_processor_info.call(this, ppEnum)
    end
    def get_default_language_profile(this : ITfInputProcessorProfiles*, langid : UInt16, catid : LibC::GUID*, pclsid : LibC::GUID*, pguidProfile : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_language_profile.call(this, langid, catid, pclsid, pguidProfile)
    end
    def set_default_language_profile(this : ITfInputProcessorProfiles*, langid : UInt16, rclsid : LibC::GUID*, guidProfiles : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_language_profile.call(this, langid, rclsid, guidProfiles)
    end
    def activate_language_profile(this : ITfInputProcessorProfiles*, rclsid : LibC::GUID*, langid : UInt16, guidProfiles : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate_language_profile.call(this, rclsid, langid, guidProfiles)
    end
    def get_active_language_profile(this : ITfInputProcessorProfiles*, rclsid : LibC::GUID*, plangid : UInt16*, pguidProfile : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_language_profile.call(this, rclsid, plangid, pguidProfile)
    end
    def get_language_profile_description(this : ITfInputProcessorProfiles*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, pbstrProfile : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_profile_description.call(this, rclsid, langid, guidProfile, pbstrProfile)
    end
    def get_current_language(this : ITfInputProcessorProfiles*, plangid : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_language.call(this, plangid)
    end
    def change_current_language(this : ITfInputProcessorProfiles*, langid : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_current_language.call(this, langid)
    end
    def get_language_list(this : ITfInputProcessorProfiles*, ppLangId : UInt16**, pulCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_list.call(this, ppLangId, pulCount)
    end
    def enum_language_profiles(this : ITfInputProcessorProfiles*, langid : UInt16, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_language_profiles.call(this, langid, ppEnum)
    end
    def enable_language_profile(this : ITfInputProcessorProfiles*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_language_profile.call(this, rclsid, langid, guidProfile, fEnable)
    end
    def is_enabled_language_profile(this : ITfInputProcessorProfiles*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, pfEnable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_enabled_language_profile.call(this, rclsid, langid, guidProfile, pfEnable)
    end
    def enable_language_profile_by_default(this : ITfInputProcessorProfiles*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_language_profile_by_default.call(this, rclsid, langid, guidProfile, fEnable)
    end
    def substitute_keyboard_layout(this : ITfInputProcessorProfiles*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, hKL : Win32cr::UI::TextServices::HKL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.substitute_keyboard_layout.call(this, rclsid, langid, guidProfile, hKL)
    end

  end

  @[Extern]
  record ITfInputProcessorProfilesExVtbl,
    query_interface : Proc(ITfInputProcessorProfilesEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfInputProcessorProfilesEx*, UInt32),
    release : Proc(ITfInputProcessorProfilesEx*, UInt32),
    register : Proc(ITfInputProcessorProfilesEx*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    unregister : Proc(ITfInputProcessorProfilesEx*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    add_language_profile : Proc(ITfInputProcessorProfilesEx*, LibC::GUID*, UInt16, LibC::GUID*, UInt16*, UInt32, UInt16*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    remove_language_profile : Proc(ITfInputProcessorProfilesEx*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::Foundation::HRESULT),
    enum_input_processor_info : Proc(ITfInputProcessorProfilesEx*, Void**, Win32cr::Foundation::HRESULT),
    get_default_language_profile : Proc(ITfInputProcessorProfilesEx*, UInt16, LibC::GUID*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    set_default_language_profile : Proc(ITfInputProcessorProfilesEx*, UInt16, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    activate_language_profile : Proc(ITfInputProcessorProfilesEx*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_active_language_profile : Proc(ITfInputProcessorProfilesEx*, LibC::GUID*, UInt16*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_language_profile_description : Proc(ITfInputProcessorProfilesEx*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_current_language : Proc(ITfInputProcessorProfilesEx*, UInt16*, Win32cr::Foundation::HRESULT),
    change_current_language : Proc(ITfInputProcessorProfilesEx*, UInt16, Win32cr::Foundation::HRESULT),
    get_language_list : Proc(ITfInputProcessorProfilesEx*, UInt16**, UInt32*, Win32cr::Foundation::HRESULT),
    enum_language_profiles : Proc(ITfInputProcessorProfilesEx*, UInt16, Void**, Win32cr::Foundation::HRESULT),
    enable_language_profile : Proc(ITfInputProcessorProfilesEx*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_enabled_language_profile : Proc(ITfInputProcessorProfilesEx*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    enable_language_profile_by_default : Proc(ITfInputProcessorProfilesEx*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    substitute_keyboard_layout : Proc(ITfInputProcessorProfilesEx*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::UI::TextServices::HKL, Win32cr::Foundation::HRESULT),
    set_language_profile_display_name : Proc(ITfInputProcessorProfilesEx*, LibC::GUID*, UInt16, LibC::GUID*, UInt16*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("892f230f-fe00-4a41-a98e-fcd6de0d35ef")]
  record ITfInputProcessorProfilesEx, lpVtbl : ITfInputProcessorProfilesExVtbl* do
    GUID = LibC::GUID.new(0x892f230f_u32, 0xfe00_u16, 0x4a41_u16, StaticArray[0xa9_u8, 0x8e_u8, 0xfc_u8, 0xd6_u8, 0xde_u8, 0xd_u8, 0x35_u8, 0xef_u8])
    def query_interface(this : ITfInputProcessorProfilesEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfInputProcessorProfilesEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfInputProcessorProfilesEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register(this : ITfInputProcessorProfilesEx*, rclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register.call(this, rclsid)
    end
    def unregister(this : ITfInputProcessorProfilesEx*, rclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister.call(this, rclsid)
    end
    def add_language_profile(this : ITfInputProcessorProfilesEx*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, pchDesc : UInt16*, cchDesc : UInt32, pchIconFile : UInt16*, cchFile : UInt32, uIconIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_language_profile.call(this, rclsid, langid, guidProfile, pchDesc, cchDesc, pchIconFile, cchFile, uIconIndex)
    end
    def remove_language_profile(this : ITfInputProcessorProfilesEx*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_language_profile.call(this, rclsid, langid, guidProfile)
    end
    def enum_input_processor_info(this : ITfInputProcessorProfilesEx*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_input_processor_info.call(this, ppEnum)
    end
    def get_default_language_profile(this : ITfInputProcessorProfilesEx*, langid : UInt16, catid : LibC::GUID*, pclsid : LibC::GUID*, pguidProfile : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_language_profile.call(this, langid, catid, pclsid, pguidProfile)
    end
    def set_default_language_profile(this : ITfInputProcessorProfilesEx*, langid : UInt16, rclsid : LibC::GUID*, guidProfiles : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_language_profile.call(this, langid, rclsid, guidProfiles)
    end
    def activate_language_profile(this : ITfInputProcessorProfilesEx*, rclsid : LibC::GUID*, langid : UInt16, guidProfiles : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate_language_profile.call(this, rclsid, langid, guidProfiles)
    end
    def get_active_language_profile(this : ITfInputProcessorProfilesEx*, rclsid : LibC::GUID*, plangid : UInt16*, pguidProfile : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_language_profile.call(this, rclsid, plangid, pguidProfile)
    end
    def get_language_profile_description(this : ITfInputProcessorProfilesEx*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, pbstrProfile : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_profile_description.call(this, rclsid, langid, guidProfile, pbstrProfile)
    end
    def get_current_language(this : ITfInputProcessorProfilesEx*, plangid : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_language.call(this, plangid)
    end
    def change_current_language(this : ITfInputProcessorProfilesEx*, langid : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.change_current_language.call(this, langid)
    end
    def get_language_list(this : ITfInputProcessorProfilesEx*, ppLangId : UInt16**, pulCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_language_list.call(this, ppLangId, pulCount)
    end
    def enum_language_profiles(this : ITfInputProcessorProfilesEx*, langid : UInt16, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_language_profiles.call(this, langid, ppEnum)
    end
    def enable_language_profile(this : ITfInputProcessorProfilesEx*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_language_profile.call(this, rclsid, langid, guidProfile, fEnable)
    end
    def is_enabled_language_profile(this : ITfInputProcessorProfilesEx*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, pfEnable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_enabled_language_profile.call(this, rclsid, langid, guidProfile, pfEnable)
    end
    def enable_language_profile_by_default(this : ITfInputProcessorProfilesEx*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, fEnable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_language_profile_by_default.call(this, rclsid, langid, guidProfile, fEnable)
    end
    def substitute_keyboard_layout(this : ITfInputProcessorProfilesEx*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, hKL : Win32cr::UI::TextServices::HKL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.substitute_keyboard_layout.call(this, rclsid, langid, guidProfile, hKL)
    end
    def set_language_profile_display_name(this : ITfInputProcessorProfilesEx*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, pchFile : UInt16*, cchFile : UInt32, uResId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_language_profile_display_name.call(this, rclsid, langid, guidProfile, pchFile, cchFile, uResId)
    end

  end

  @[Extern]
  record ITfInputProcessorProfileSubstituteLayoutVtbl,
    query_interface : Proc(ITfInputProcessorProfileSubstituteLayout*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfInputProcessorProfileSubstituteLayout*, UInt32),
    release : Proc(ITfInputProcessorProfileSubstituteLayout*, UInt32),
    get_substitute_keyboard_layout : Proc(ITfInputProcessorProfileSubstituteLayout*, LibC::GUID*, UInt16, LibC::GUID*, Win32cr::UI::TextServices::HKL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4fd67194-1002-4513-bff2-c0ddf6258552")]
  record ITfInputProcessorProfileSubstituteLayout, lpVtbl : ITfInputProcessorProfileSubstituteLayoutVtbl* do
    GUID = LibC::GUID.new(0x4fd67194_u32, 0x1002_u16, 0x4513_u16, StaticArray[0xbf_u8, 0xf2_u8, 0xc0_u8, 0xdd_u8, 0xf6_u8, 0x25_u8, 0x85_u8, 0x52_u8])
    def query_interface(this : ITfInputProcessorProfileSubstituteLayout*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfInputProcessorProfileSubstituteLayout*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfInputProcessorProfileSubstituteLayout*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_substitute_keyboard_layout(this : ITfInputProcessorProfileSubstituteLayout*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, phKL : Win32cr::UI::TextServices::HKL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_substitute_keyboard_layout.call(this, rclsid, langid, guidProfile, phKL)
    end

  end

  @[Extern]
  record ITfActiveLanguageProfileNotifySinkVtbl,
    query_interface : Proc(ITfActiveLanguageProfileNotifySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfActiveLanguageProfileNotifySink*, UInt32),
    release : Proc(ITfActiveLanguageProfileNotifySink*, UInt32),
    on_activated : Proc(ITfActiveLanguageProfileNotifySink*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b246cb75-a93e-4652-bf8c-b3fe0cfd7e57")]
  record ITfActiveLanguageProfileNotifySink, lpVtbl : ITfActiveLanguageProfileNotifySinkVtbl* do
    GUID = LibC::GUID.new(0xb246cb75_u32, 0xa93e_u16, 0x4652_u16, StaticArray[0xbf_u8, 0x8c_u8, 0xb3_u8, 0xfe_u8, 0xc_u8, 0xfd_u8, 0x7e_u8, 0x57_u8])
    def query_interface(this : ITfActiveLanguageProfileNotifySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfActiveLanguageProfileNotifySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfActiveLanguageProfileNotifySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_activated(this : ITfActiveLanguageProfileNotifySink*, clsid : LibC::GUID*, guidProfile : LibC::GUID*, fActivated : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_activated.call(this, clsid, guidProfile, fActivated)
    end

  end

  @[Extern]
  record IEnumTfLanguageProfilesVtbl,
    query_interface : Proc(IEnumTfLanguageProfiles*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTfLanguageProfiles*, UInt32),
    release : Proc(IEnumTfLanguageProfiles*, UInt32),
    clone : Proc(IEnumTfLanguageProfiles*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumTfLanguageProfiles*, UInt32, Win32cr::UI::TextServices::TF_LANGUAGEPROFILE*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTfLanguageProfiles*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTfLanguageProfiles*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3d61bf11-ac5f-42c8-a4cb-931bcc28c744")]
  record IEnumTfLanguageProfiles, lpVtbl : IEnumTfLanguageProfilesVtbl* do
    GUID = LibC::GUID.new(0x3d61bf11_u32, 0xac5f_u16, 0x42c8_u16, StaticArray[0xa4_u8, 0xcb_u8, 0x93_u8, 0x1b_u8, 0xcc_u8, 0x28_u8, 0xc7_u8, 0x44_u8])
    def query_interface(this : IEnumTfLanguageProfiles*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTfLanguageProfiles*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTfLanguageProfiles*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumTfLanguageProfiles*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumTfLanguageProfiles*, ulCount : UInt32, pProfile : Win32cr::UI::TextServices::TF_LANGUAGEPROFILE*, pcFetch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, pProfile, pcFetch)
    end
    def reset(this : IEnumTfLanguageProfiles*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumTfLanguageProfiles*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfLanguageProfileNotifySinkVtbl,
    query_interface : Proc(ITfLanguageProfileNotifySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfLanguageProfileNotifySink*, UInt32),
    release : Proc(ITfLanguageProfileNotifySink*, UInt32),
    on_language_change : Proc(ITfLanguageProfileNotifySink*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    on_language_changed : Proc(ITfLanguageProfileNotifySink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("43c9fe15-f494-4c17-9de2-b8a4ac350aa8")]
  record ITfLanguageProfileNotifySink, lpVtbl : ITfLanguageProfileNotifySinkVtbl* do
    GUID = LibC::GUID.new(0x43c9fe15_u32, 0xf494_u16, 0x4c17_u16, StaticArray[0x9d_u8, 0xe2_u8, 0xb8_u8, 0xa4_u8, 0xac_u8, 0x35_u8, 0xa_u8, 0xa8_u8])
    def query_interface(this : ITfLanguageProfileNotifySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfLanguageProfileNotifySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfLanguageProfileNotifySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_language_change(this : ITfLanguageProfileNotifySink*, langid : UInt16, pfAccept : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_language_change.call(this, langid, pfAccept)
    end
    def on_language_changed(this : ITfLanguageProfileNotifySink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_language_changed.call(this)
    end

  end

  @[Extern]
  record ITfInputProcessorProfileMgrVtbl,
    query_interface : Proc(ITfInputProcessorProfileMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfInputProcessorProfileMgr*, UInt32),
    release : Proc(ITfInputProcessorProfileMgr*, UInt32),
    activate_profile : Proc(ITfInputProcessorProfileMgr*, UInt32, UInt16, LibC::GUID*, LibC::GUID*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::Foundation::HRESULT),
    deactivate_profile : Proc(ITfInputProcessorProfileMgr*, UInt32, UInt16, LibC::GUID*, LibC::GUID*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::Foundation::HRESULT),
    get_profile : Proc(ITfInputProcessorProfileMgr*, UInt32, UInt16, LibC::GUID*, LibC::GUID*, Win32cr::UI::TextServices::HKL, Win32cr::UI::TextServices::TF_INPUTPROCESSORPROFILE*, Win32cr::Foundation::HRESULT),
    enum_profiles : Proc(ITfInputProcessorProfileMgr*, UInt16, Void**, Win32cr::Foundation::HRESULT),
    release_input_processor : Proc(ITfInputProcessorProfileMgr*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    register_profile : Proc(ITfInputProcessorProfileMgr*, LibC::GUID*, UInt16, LibC::GUID*, UInt16*, UInt32, UInt16*, UInt32, UInt32, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::Foundation::BOOL, UInt32, Win32cr::Foundation::HRESULT),
    unregister_profile : Proc(ITfInputProcessorProfileMgr*, LibC::GUID*, UInt16, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    get_active_profile : Proc(ITfInputProcessorProfileMgr*, LibC::GUID*, Win32cr::UI::TextServices::TF_INPUTPROCESSORPROFILE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("71c6e74c-0f28-11d8-a82a-00065b84435c")]
  record ITfInputProcessorProfileMgr, lpVtbl : ITfInputProcessorProfileMgrVtbl* do
    GUID = LibC::GUID.new(0x71c6e74c_u32, 0xf28_u16, 0x11d8_u16, StaticArray[0xa8_u8, 0x2a_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
    def query_interface(this : ITfInputProcessorProfileMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfInputProcessorProfileMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfInputProcessorProfileMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def activate_profile(this : ITfInputProcessorProfileMgr*, dwProfileType : UInt32, langid : UInt16, clsid : LibC::GUID*, guidProfile : LibC::GUID*, hkl : Win32cr::UI::TextServices::HKL, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate_profile.call(this, dwProfileType, langid, clsid, guidProfile, hkl, dwFlags)
    end
    def deactivate_profile(this : ITfInputProcessorProfileMgr*, dwProfileType : UInt32, langid : UInt16, clsid : LibC::GUID*, guidProfile : LibC::GUID*, hkl : Win32cr::UI::TextServices::HKL, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate_profile.call(this, dwProfileType, langid, clsid, guidProfile, hkl, dwFlags)
    end
    def get_profile(this : ITfInputProcessorProfileMgr*, dwProfileType : UInt32, langid : UInt16, clsid : LibC::GUID*, guidProfile : LibC::GUID*, hkl : Win32cr::UI::TextServices::HKL, pProfile : Win32cr::UI::TextServices::TF_INPUTPROCESSORPROFILE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_profile.call(this, dwProfileType, langid, clsid, guidProfile, hkl, pProfile)
    end
    def enum_profiles(this : ITfInputProcessorProfileMgr*, langid : UInt16, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_profiles.call(this, langid, ppEnum)
    end
    def release_input_processor(this : ITfInputProcessorProfileMgr*, rclsid : LibC::GUID*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_input_processor.call(this, rclsid, dwFlags)
    end
    def register_profile(this : ITfInputProcessorProfileMgr*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, pchDesc : UInt16*, cchDesc : UInt32, pchIconFile : UInt16*, cchFile : UInt32, uIconIndex : UInt32, hklsubstitute : Win32cr::UI::TextServices::HKL, dwPreferredLayout : UInt32, bEnabledByDefault : Win32cr::Foundation::BOOL, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_profile.call(this, rclsid, langid, guidProfile, pchDesc, cchDesc, pchIconFile, cchFile, uIconIndex, hklsubstitute, dwPreferredLayout, bEnabledByDefault, dwFlags)
    end
    def unregister_profile(this : ITfInputProcessorProfileMgr*, rclsid : LibC::GUID*, langid : UInt16, guidProfile : LibC::GUID*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_profile.call(this, rclsid, langid, guidProfile, dwFlags)
    end
    def get_active_profile(this : ITfInputProcessorProfileMgr*, catid : LibC::GUID*, pProfile : Win32cr::UI::TextServices::TF_INPUTPROCESSORPROFILE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_profile.call(this, catid, pProfile)
    end

  end

  @[Extern]
  record IEnumTfInputProcessorProfilesVtbl,
    query_interface : Proc(IEnumTfInputProcessorProfiles*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTfInputProcessorProfiles*, UInt32),
    release : Proc(IEnumTfInputProcessorProfiles*, UInt32),
    clone : Proc(IEnumTfInputProcessorProfiles*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumTfInputProcessorProfiles*, UInt32, Win32cr::UI::TextServices::TF_INPUTPROCESSORPROFILE*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTfInputProcessorProfiles*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTfInputProcessorProfiles*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("71c6e74d-0f28-11d8-a82a-00065b84435c")]
  record IEnumTfInputProcessorProfiles, lpVtbl : IEnumTfInputProcessorProfilesVtbl* do
    GUID = LibC::GUID.new(0x71c6e74d_u32, 0xf28_u16, 0x11d8_u16, StaticArray[0xa8_u8, 0x2a_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
    def query_interface(this : IEnumTfInputProcessorProfiles*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTfInputProcessorProfiles*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTfInputProcessorProfiles*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumTfInputProcessorProfiles*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumTfInputProcessorProfiles*, ulCount : UInt32, pProfile : Win32cr::UI::TextServices::TF_INPUTPROCESSORPROFILE*, pcFetch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, pProfile, pcFetch)
    end
    def reset(this : IEnumTfInputProcessorProfiles*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumTfInputProcessorProfiles*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfInputProcessorProfileActivationSinkVtbl,
    query_interface : Proc(ITfInputProcessorProfileActivationSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfInputProcessorProfileActivationSink*, UInt32),
    release : Proc(ITfInputProcessorProfileActivationSink*, UInt32),
    on_activated : Proc(ITfInputProcessorProfileActivationSink*, UInt32, UInt16, LibC::GUID*, LibC::GUID*, LibC::GUID*, Win32cr::UI::TextServices::HKL, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("71c6e74e-0f28-11d8-a82a-00065b84435c")]
  record ITfInputProcessorProfileActivationSink, lpVtbl : ITfInputProcessorProfileActivationSinkVtbl* do
    GUID = LibC::GUID.new(0x71c6e74e_u32, 0xf28_u16, 0x11d8_u16, StaticArray[0xa8_u8, 0x2a_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
    def query_interface(this : ITfInputProcessorProfileActivationSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfInputProcessorProfileActivationSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfInputProcessorProfileActivationSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_activated(this : ITfInputProcessorProfileActivationSink*, dwProfileType : UInt32, langid : UInt16, clsid : LibC::GUID*, catid : LibC::GUID*, guidProfile : LibC::GUID*, hkl : Win32cr::UI::TextServices::HKL, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_activated.call(this, dwProfileType, langid, clsid, catid, guidProfile, hkl, dwFlags)
    end

  end

  @[Extern]
  record ITfKeystrokeMgrVtbl,
    query_interface : Proc(ITfKeystrokeMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfKeystrokeMgr*, UInt32),
    release : Proc(ITfKeystrokeMgr*, UInt32),
    advise_key_event_sink : Proc(ITfKeystrokeMgr*, UInt32, Void*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    unadvise_key_event_sink : Proc(ITfKeystrokeMgr*, UInt32, Win32cr::Foundation::HRESULT),
    get_foreground : Proc(ITfKeystrokeMgr*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    test_key_down : Proc(ITfKeystrokeMgr*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    test_key_up : Proc(ITfKeystrokeMgr*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    key_down : Proc(ITfKeystrokeMgr*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    key_up : Proc(ITfKeystrokeMgr*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_preserved_key : Proc(ITfKeystrokeMgr*, Void*, Win32cr::UI::TextServices::TF_PRESERVEDKEY*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_preserved_key : Proc(ITfKeystrokeMgr*, LibC::GUID*, Win32cr::UI::TextServices::TF_PRESERVEDKEY*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    preserve_key : Proc(ITfKeystrokeMgr*, UInt32, LibC::GUID*, Win32cr::UI::TextServices::TF_PRESERVEDKEY*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    unpreserve_key : Proc(ITfKeystrokeMgr*, LibC::GUID*, Win32cr::UI::TextServices::TF_PRESERVEDKEY*, Win32cr::Foundation::HRESULT),
    set_preserved_key_description : Proc(ITfKeystrokeMgr*, LibC::GUID*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    get_preserved_key_description : Proc(ITfKeystrokeMgr*, LibC::GUID*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    simulate_preserved_key : Proc(ITfKeystrokeMgr*, Void*, LibC::GUID*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aa80e7f0-2021-11d2-93e0-0060b067b86e")]
  record ITfKeystrokeMgr, lpVtbl : ITfKeystrokeMgrVtbl* do
    GUID = LibC::GUID.new(0xaa80e7f0_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : ITfKeystrokeMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfKeystrokeMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfKeystrokeMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise_key_event_sink(this : ITfKeystrokeMgr*, tid : UInt32, pSink : Void*, fForeground : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_key_event_sink.call(this, tid, pSink, fForeground)
    end
    def unadvise_key_event_sink(this : ITfKeystrokeMgr*, tid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_key_event_sink.call(this, tid)
    end
    def get_foreground(this : ITfKeystrokeMgr*, pclsid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_foreground.call(this, pclsid)
    end
    def test_key_down(this : ITfKeystrokeMgr*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.test_key_down.call(this, wParam, lParam, pfEaten)
    end
    def test_key_up(this : ITfKeystrokeMgr*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.test_key_up.call(this, wParam, lParam, pfEaten)
    end
    def key_down(this : ITfKeystrokeMgr*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.key_down.call(this, wParam, lParam, pfEaten)
    end
    def key_up(this : ITfKeystrokeMgr*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.key_up.call(this, wParam, lParam, pfEaten)
    end
    def get_preserved_key(this : ITfKeystrokeMgr*, pic : Void*, pprekey : Win32cr::UI::TextServices::TF_PRESERVEDKEY*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preserved_key.call(this, pic, pprekey, pguid)
    end
    def is_preserved_key(this : ITfKeystrokeMgr*, rguid : LibC::GUID*, pprekey : Win32cr::UI::TextServices::TF_PRESERVEDKEY*, pfRegistered : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_preserved_key.call(this, rguid, pprekey, pfRegistered)
    end
    def preserve_key(this : ITfKeystrokeMgr*, tid : UInt32, rguid : LibC::GUID*, prekey : Win32cr::UI::TextServices::TF_PRESERVEDKEY*, pchDesc : UInt16*, cchDesc : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.preserve_key.call(this, tid, rguid, prekey, pchDesc, cchDesc)
    end
    def unpreserve_key(this : ITfKeystrokeMgr*, rguid : LibC::GUID*, pprekey : Win32cr::UI::TextServices::TF_PRESERVEDKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unpreserve_key.call(this, rguid, pprekey)
    end
    def set_preserved_key_description(this : ITfKeystrokeMgr*, rguid : LibC::GUID*, pchDesc : UInt16*, cchDesc : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_preserved_key_description.call(this, rguid, pchDesc, cchDesc)
    end
    def get_preserved_key_description(this : ITfKeystrokeMgr*, rguid : LibC::GUID*, pbstrDesc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_preserved_key_description.call(this, rguid, pbstrDesc)
    end
    def simulate_preserved_key(this : ITfKeystrokeMgr*, pic : Void*, rguid : LibC::GUID*, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.simulate_preserved_key.call(this, pic, rguid, pfEaten)
    end

  end

  @[Extern]
  record ITfKeyEventSinkVtbl,
    query_interface : Proc(ITfKeyEventSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfKeyEventSink*, UInt32),
    release : Proc(ITfKeyEventSink*, UInt32),
    on_set_focus : Proc(ITfKeyEventSink*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    on_test_key_down : Proc(ITfKeyEventSink*, Void*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    on_test_key_up : Proc(ITfKeyEventSink*, Void*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    on_key_down : Proc(ITfKeyEventSink*, Void*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    on_key_up : Proc(ITfKeyEventSink*, Void*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    on_preserved_key : Proc(ITfKeyEventSink*, Void*, LibC::GUID*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aa80e7f5-2021-11d2-93e0-0060b067b86e")]
  record ITfKeyEventSink, lpVtbl : ITfKeyEventSinkVtbl* do
    GUID = LibC::GUID.new(0xaa80e7f5_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : ITfKeyEventSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfKeyEventSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfKeyEventSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_set_focus(this : ITfKeyEventSink*, fForeground : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_focus.call(this, fForeground)
    end
    def on_test_key_down(this : ITfKeyEventSink*, pic : Void*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_test_key_down.call(this, pic, wParam, lParam, pfEaten)
    end
    def on_test_key_up(this : ITfKeyEventSink*, pic : Void*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_test_key_up.call(this, pic, wParam, lParam, pfEaten)
    end
    def on_key_down(this : ITfKeyEventSink*, pic : Void*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_key_down.call(this, pic, wParam, lParam, pfEaten)
    end
    def on_key_up(this : ITfKeyEventSink*, pic : Void*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_key_up.call(this, pic, wParam, lParam, pfEaten)
    end
    def on_preserved_key(this : ITfKeyEventSink*, pic : Void*, rguid : LibC::GUID*, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_preserved_key.call(this, pic, rguid, pfEaten)
    end

  end

  @[Extern]
  record ITfKeyTraceEventSinkVtbl,
    query_interface : Proc(ITfKeyTraceEventSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfKeyTraceEventSink*, UInt32),
    release : Proc(ITfKeyTraceEventSink*, UInt32),
    on_key_trace_down : Proc(ITfKeyTraceEventSink*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    on_key_trace_up : Proc(ITfKeyTraceEventSink*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1cd4c13b-1c36-4191-a70a-7f3e611f367d")]
  record ITfKeyTraceEventSink, lpVtbl : ITfKeyTraceEventSinkVtbl* do
    GUID = LibC::GUID.new(0x1cd4c13b_u32, 0x1c36_u16, 0x4191_u16, StaticArray[0xa7_u8, 0xa_u8, 0x7f_u8, 0x3e_u8, 0x61_u8, 0x1f_u8, 0x36_u8, 0x7d_u8])
    def query_interface(this : ITfKeyTraceEventSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfKeyTraceEventSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfKeyTraceEventSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_key_trace_down(this : ITfKeyTraceEventSink*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_key_trace_down.call(this, wParam, lParam)
    end
    def on_key_trace_up(this : ITfKeyTraceEventSink*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_key_trace_up.call(this, wParam, lParam)
    end

  end

  @[Extern]
  record ITfPreservedKeyNotifySinkVtbl,
    query_interface : Proc(ITfPreservedKeyNotifySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfPreservedKeyNotifySink*, UInt32),
    release : Proc(ITfPreservedKeyNotifySink*, UInt32),
    on_updated : Proc(ITfPreservedKeyNotifySink*, Win32cr::UI::TextServices::TF_PRESERVEDKEY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6f77c993-d2b1-446e-853e-5912efc8a286")]
  record ITfPreservedKeyNotifySink, lpVtbl : ITfPreservedKeyNotifySinkVtbl* do
    GUID = LibC::GUID.new(0x6f77c993_u32, 0xd2b1_u16, 0x446e_u16, StaticArray[0x85_u8, 0x3e_u8, 0x59_u8, 0x12_u8, 0xef_u8, 0xc8_u8, 0xa2_u8, 0x86_u8])
    def query_interface(this : ITfPreservedKeyNotifySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfPreservedKeyNotifySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfPreservedKeyNotifySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_updated(this : ITfPreservedKeyNotifySink*, pprekey : Win32cr::UI::TextServices::TF_PRESERVEDKEY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_updated.call(this, pprekey)
    end

  end

  @[Extern]
  record ITfMessagePumpVtbl,
    query_interface : Proc(ITfMessagePump*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfMessagePump*, UInt32),
    release : Proc(ITfMessagePump*, UInt32),
    peek_message_a : Proc(ITfMessagePump*, Win32cr::UI::WindowsAndMessaging::MSG*, Win32cr::Foundation::HWND, UInt32, UInt32, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_message_a : Proc(ITfMessagePump*, Win32cr::UI::WindowsAndMessaging::MSG*, Win32cr::Foundation::HWND, UInt32, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    peek_message_w : Proc(ITfMessagePump*, Win32cr::UI::WindowsAndMessaging::MSG*, Win32cr::Foundation::HWND, UInt32, UInt32, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_message_w : Proc(ITfMessagePump*, Win32cr::UI::WindowsAndMessaging::MSG*, Win32cr::Foundation::HWND, UInt32, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8f1b8ad8-0b6b-4874-90c5-bd76011e8f7c")]
  record ITfMessagePump, lpVtbl : ITfMessagePumpVtbl* do
    GUID = LibC::GUID.new(0x8f1b8ad8_u32, 0xb6b_u16, 0x4874_u16, StaticArray[0x90_u8, 0xc5_u8, 0xbd_u8, 0x76_u8, 0x1_u8, 0x1e_u8, 0x8f_u8, 0x7c_u8])
    def query_interface(this : ITfMessagePump*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfMessagePump*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfMessagePump*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def peek_message_a(this : ITfMessagePump*, pMsg : Win32cr::UI::WindowsAndMessaging::MSG*, hwnd : Win32cr::Foundation::HWND, wMsgFilterMin : UInt32, wMsgFilterMax : UInt32, wRemoveMsg : UInt32, pfResult : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_message_a.call(this, pMsg, hwnd, wMsgFilterMin, wMsgFilterMax, wRemoveMsg, pfResult)
    end
    def get_message_a(this : ITfMessagePump*, pMsg : Win32cr::UI::WindowsAndMessaging::MSG*, hwnd : Win32cr::Foundation::HWND, wMsgFilterMin : UInt32, wMsgFilterMax : UInt32, pfResult : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_message_a.call(this, pMsg, hwnd, wMsgFilterMin, wMsgFilterMax, pfResult)
    end
    def peek_message_w(this : ITfMessagePump*, pMsg : Win32cr::UI::WindowsAndMessaging::MSG*, hwnd : Win32cr::Foundation::HWND, wMsgFilterMin : UInt32, wMsgFilterMax : UInt32, wRemoveMsg : UInt32, pfResult : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.peek_message_w.call(this, pMsg, hwnd, wMsgFilterMin, wMsgFilterMax, wRemoveMsg, pfResult)
    end
    def get_message_w(this : ITfMessagePump*, pMsg : Win32cr::UI::WindowsAndMessaging::MSG*, hwnd : Win32cr::Foundation::HWND, wMsgFilterMin : UInt32, wMsgFilterMax : UInt32, pfResult : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_message_w.call(this, pMsg, hwnd, wMsgFilterMin, wMsgFilterMax, pfResult)
    end

  end

  @[Extern]
  record ITfThreadFocusSinkVtbl,
    query_interface : Proc(ITfThreadFocusSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfThreadFocusSink*, UInt32),
    release : Proc(ITfThreadFocusSink*, UInt32),
    on_set_thread_focus : Proc(ITfThreadFocusSink*, Win32cr::Foundation::HRESULT),
    on_kill_thread_focus : Proc(ITfThreadFocusSink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c0f1db0c-3a20-405c-a303-96b6010a885f")]
  record ITfThreadFocusSink, lpVtbl : ITfThreadFocusSinkVtbl* do
    GUID = LibC::GUID.new(0xc0f1db0c_u32, 0x3a20_u16, 0x405c_u16, StaticArray[0xa3_u8, 0x3_u8, 0x96_u8, 0xb6_u8, 0x1_u8, 0xa_u8, 0x88_u8, 0x5f_u8])
    def query_interface(this : ITfThreadFocusSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfThreadFocusSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfThreadFocusSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_set_thread_focus(this : ITfThreadFocusSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_set_thread_focus.call(this)
    end
    def on_kill_thread_focus(this : ITfThreadFocusSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_kill_thread_focus.call(this)
    end

  end

  @[Extern]
  record ITfTextInputProcessorVtbl,
    query_interface : Proc(ITfTextInputProcessor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfTextInputProcessor*, UInt32),
    release : Proc(ITfTextInputProcessor*, UInt32),
    activate : Proc(ITfTextInputProcessor*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    deactivate : Proc(ITfTextInputProcessor*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("aa80e7f7-2021-11d2-93e0-0060b067b86e")]
  record ITfTextInputProcessor, lpVtbl : ITfTextInputProcessorVtbl* do
    GUID = LibC::GUID.new(0xaa80e7f7_u32, 0x2021_u16, 0x11d2_u16, StaticArray[0x93_u8, 0xe0_u8, 0x0_u8, 0x60_u8, 0xb0_u8, 0x67_u8, 0xb8_u8, 0x6e_u8])
    def query_interface(this : ITfTextInputProcessor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfTextInputProcessor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfTextInputProcessor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def activate(this : ITfTextInputProcessor*, ptim : Void*, tid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, ptim, tid)
    end
    def deactivate(this : ITfTextInputProcessor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate.call(this)
    end

  end

  @[Extern]
  record ITfTextInputProcessorExVtbl,
    query_interface : Proc(ITfTextInputProcessorEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfTextInputProcessorEx*, UInt32),
    release : Proc(ITfTextInputProcessorEx*, UInt32),
    activate : Proc(ITfTextInputProcessorEx*, Void*, UInt32, Win32cr::Foundation::HRESULT),
    deactivate : Proc(ITfTextInputProcessorEx*, Win32cr::Foundation::HRESULT),
    activate_ex : Proc(ITfTextInputProcessorEx*, Void*, UInt32, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6e4e2102-f9cd-433d-b496-303ce03a6507")]
  record ITfTextInputProcessorEx, lpVtbl : ITfTextInputProcessorExVtbl* do
    GUID = LibC::GUID.new(0x6e4e2102_u32, 0xf9cd_u16, 0x433d_u16, StaticArray[0xb4_u8, 0x96_u8, 0x30_u8, 0x3c_u8, 0xe0_u8, 0x3a_u8, 0x65_u8, 0x7_u8])
    def query_interface(this : ITfTextInputProcessorEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfTextInputProcessorEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfTextInputProcessorEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def activate(this : ITfTextInputProcessorEx*, ptim : Void*, tid : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate.call(this, ptim, tid)
    end
    def deactivate(this : ITfTextInputProcessorEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.deactivate.call(this)
    end
    def activate_ex(this : ITfTextInputProcessorEx*, ptim : Void*, tid : UInt32, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.activate_ex.call(this, ptim, tid, dwFlags)
    end

  end

  @[Extern]
  record ITfClientIdVtbl,
    query_interface : Proc(ITfClientId*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfClientId*, UInt32),
    release : Proc(ITfClientId*, UInt32),
    get_client_id : Proc(ITfClientId*, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d60a7b49-1b9f-4be2-b702-47e9dc05dec3")]
  record ITfClientId, lpVtbl : ITfClientIdVtbl* do
    GUID = LibC::GUID.new(0xd60a7b49_u32, 0x1b9f_u16, 0x4be2_u16, StaticArray[0xb7_u8, 0x2_u8, 0x47_u8, 0xe9_u8, 0xdc_u8, 0x5_u8, 0xde_u8, 0xc3_u8])
    def query_interface(this : ITfClientId*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfClientId*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfClientId*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_client_id(this : ITfClientId*, rclsid : LibC::GUID*, ptid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_client_id.call(this, rclsid, ptid)
    end

  end

  @[Extern]
  record ITfDisplayAttributeInfoVtbl,
    query_interface : Proc(ITfDisplayAttributeInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfDisplayAttributeInfo*, UInt32),
    release : Proc(ITfDisplayAttributeInfo*, UInt32),
    get_guid : Proc(ITfDisplayAttributeInfo*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_description : Proc(ITfDisplayAttributeInfo*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_attribute_info : Proc(ITfDisplayAttributeInfo*, Win32cr::UI::TextServices::TF_DISPLAYATTRIBUTE*, Win32cr::Foundation::HRESULT),
    set_attribute_info : Proc(ITfDisplayAttributeInfo*, Win32cr::UI::TextServices::TF_DISPLAYATTRIBUTE*, Win32cr::Foundation::HRESULT),
    reset : Proc(ITfDisplayAttributeInfo*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("70528852-2f26-4aea-8c96-215150578932")]
  record ITfDisplayAttributeInfo, lpVtbl : ITfDisplayAttributeInfoVtbl* do
    GUID = LibC::GUID.new(0x70528852_u32, 0x2f26_u16, 0x4aea_u16, StaticArray[0x8c_u8, 0x96_u8, 0x21_u8, 0x51_u8, 0x50_u8, 0x57_u8, 0x89_u8, 0x32_u8])
    def query_interface(this : ITfDisplayAttributeInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfDisplayAttributeInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfDisplayAttributeInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_guid(this : ITfDisplayAttributeInfo*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid.call(this, pguid)
    end
    def get_description(this : ITfDisplayAttributeInfo*, pbstrDesc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pbstrDesc)
    end
    def get_attribute_info(this : ITfDisplayAttributeInfo*, pda : Win32cr::UI::TextServices::TF_DISPLAYATTRIBUTE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_info.call(this, pda)
    end
    def set_attribute_info(this : ITfDisplayAttributeInfo*, pda : Win32cr::UI::TextServices::TF_DISPLAYATTRIBUTE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_attribute_info.call(this, pda)
    end
    def reset(this : ITfDisplayAttributeInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end

  end

  @[Extern]
  record IEnumTfDisplayAttributeInfoVtbl,
    query_interface : Proc(IEnumTfDisplayAttributeInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTfDisplayAttributeInfo*, UInt32),
    release : Proc(IEnumTfDisplayAttributeInfo*, UInt32),
    clone : Proc(IEnumTfDisplayAttributeInfo*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumTfDisplayAttributeInfo*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTfDisplayAttributeInfo*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTfDisplayAttributeInfo*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7cef04d7-cb75-4e80-a7ab-5f5bc7d332de")]
  record IEnumTfDisplayAttributeInfo, lpVtbl : IEnumTfDisplayAttributeInfoVtbl* do
    GUID = LibC::GUID.new(0x7cef04d7_u32, 0xcb75_u16, 0x4e80_u16, StaticArray[0xa7_u8, 0xab_u8, 0x5f_u8, 0x5b_u8, 0xc7_u8, 0xd3_u8, 0x32_u8, 0xde_u8])
    def query_interface(this : IEnumTfDisplayAttributeInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTfDisplayAttributeInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTfDisplayAttributeInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumTfDisplayAttributeInfo*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumTfDisplayAttributeInfo*, ulCount : UInt32, rgInfo : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, rgInfo, pcFetched)
    end
    def reset(this : IEnumTfDisplayAttributeInfo*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumTfDisplayAttributeInfo*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfDisplayAttributeProviderVtbl,
    query_interface : Proc(ITfDisplayAttributeProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfDisplayAttributeProvider*, UInt32),
    release : Proc(ITfDisplayAttributeProvider*, UInt32),
    enum_display_attribute_info : Proc(ITfDisplayAttributeProvider*, Void**, Win32cr::Foundation::HRESULT),
    get_display_attribute_info : Proc(ITfDisplayAttributeProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fee47777-163c-4769-996a-6e9c50ad8f54")]
  record ITfDisplayAttributeProvider, lpVtbl : ITfDisplayAttributeProviderVtbl* do
    GUID = LibC::GUID.new(0xfee47777_u32, 0x163c_u16, 0x4769_u16, StaticArray[0x99_u8, 0x6a_u8, 0x6e_u8, 0x9c_u8, 0x50_u8, 0xad_u8, 0x8f_u8, 0x54_u8])
    def query_interface(this : ITfDisplayAttributeProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfDisplayAttributeProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfDisplayAttributeProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_display_attribute_info(this : ITfDisplayAttributeProvider*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_display_attribute_info.call(this, ppEnum)
    end
    def get_display_attribute_info(this : ITfDisplayAttributeProvider*, guid : LibC::GUID*, ppInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_attribute_info.call(this, guid, ppInfo)
    end

  end

  @[Extern]
  record ITfDisplayAttributeMgrVtbl,
    query_interface : Proc(ITfDisplayAttributeMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfDisplayAttributeMgr*, UInt32),
    release : Proc(ITfDisplayAttributeMgr*, UInt32),
    on_update_info : Proc(ITfDisplayAttributeMgr*, Win32cr::Foundation::HRESULT),
    enum_display_attribute_info : Proc(ITfDisplayAttributeMgr*, Void**, Win32cr::Foundation::HRESULT),
    get_display_attribute_info : Proc(ITfDisplayAttributeMgr*, LibC::GUID*, Void**, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8ded7393-5db1-475c-9e71-a39111b0ff67")]
  record ITfDisplayAttributeMgr, lpVtbl : ITfDisplayAttributeMgrVtbl* do
    GUID = LibC::GUID.new(0x8ded7393_u32, 0x5db1_u16, 0x475c_u16, StaticArray[0x9e_u8, 0x71_u8, 0xa3_u8, 0x91_u8, 0x11_u8, 0xb0_u8, 0xff_u8, 0x67_u8])
    def query_interface(this : ITfDisplayAttributeMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfDisplayAttributeMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfDisplayAttributeMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_update_info(this : ITfDisplayAttributeMgr*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_update_info.call(this)
    end
    def enum_display_attribute_info(this : ITfDisplayAttributeMgr*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_display_attribute_info.call(this, ppEnum)
    end
    def get_display_attribute_info(this : ITfDisplayAttributeMgr*, guid : LibC::GUID*, ppInfo : Void**, pclsidOwner : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_attribute_info.call(this, guid, ppInfo, pclsidOwner)
    end

  end

  @[Extern]
  record ITfDisplayAttributeNotifySinkVtbl,
    query_interface : Proc(ITfDisplayAttributeNotifySink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfDisplayAttributeNotifySink*, UInt32),
    release : Proc(ITfDisplayAttributeNotifySink*, UInt32),
    on_update_info : Proc(ITfDisplayAttributeNotifySink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ad56f402-e162-4f25-908f-7d577cf9bda9")]
  record ITfDisplayAttributeNotifySink, lpVtbl : ITfDisplayAttributeNotifySinkVtbl* do
    GUID = LibC::GUID.new(0xad56f402_u32, 0xe162_u16, 0x4f25_u16, StaticArray[0x90_u8, 0x8f_u8, 0x7d_u8, 0x57_u8, 0x7c_u8, 0xf9_u8, 0xbd_u8, 0xa9_u8])
    def query_interface(this : ITfDisplayAttributeNotifySink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfDisplayAttributeNotifySink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfDisplayAttributeNotifySink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_update_info(this : ITfDisplayAttributeNotifySink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_update_info.call(this)
    end

  end

  @[Extern]
  record ITfCategoryMgrVtbl,
    query_interface : Proc(ITfCategoryMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfCategoryMgr*, UInt32),
    release : Proc(ITfCategoryMgr*, UInt32),
    register_category : Proc(ITfCategoryMgr*, LibC::GUID*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    unregister_category : Proc(ITfCategoryMgr*, LibC::GUID*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    enum_categories_in_item : Proc(ITfCategoryMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    enum_items_in_category : Proc(ITfCategoryMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    find_closest_category : Proc(ITfCategoryMgr*, LibC::GUID*, LibC::GUID*, LibC::GUID**, UInt32, Win32cr::Foundation::HRESULT),
    register_guid_description : Proc(ITfCategoryMgr*, LibC::GUID*, LibC::GUID*, UInt16*, UInt32, Win32cr::Foundation::HRESULT),
    unregister_guid_description : Proc(ITfCategoryMgr*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_guid_description : Proc(ITfCategoryMgr*, LibC::GUID*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    register_guiddword : Proc(ITfCategoryMgr*, LibC::GUID*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT),
    unregister_guiddword : Proc(ITfCategoryMgr*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_guiddword : Proc(ITfCategoryMgr*, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    register_guid : Proc(ITfCategoryMgr*, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    get_guid : Proc(ITfCategoryMgr*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    is_equal_tf_guid_atom : Proc(ITfCategoryMgr*, UInt32, LibC::GUID*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c3acefb5-f69d-4905-938f-fcadcf4be830")]
  record ITfCategoryMgr, lpVtbl : ITfCategoryMgrVtbl* do
    GUID = LibC::GUID.new(0xc3acefb5_u32, 0xf69d_u16, 0x4905_u16, StaticArray[0x93_u8, 0x8f_u8, 0xfc_u8, 0xad_u8, 0xcf_u8, 0x4b_u8, 0xe8_u8, 0x30_u8])
    def query_interface(this : ITfCategoryMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfCategoryMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfCategoryMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_category(this : ITfCategoryMgr*, rclsid : LibC::GUID*, rcatid : LibC::GUID*, rguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_category.call(this, rclsid, rcatid, rguid)
    end
    def unregister_category(this : ITfCategoryMgr*, rclsid : LibC::GUID*, rcatid : LibC::GUID*, rguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_category.call(this, rclsid, rcatid, rguid)
    end
    def enum_categories_in_item(this : ITfCategoryMgr*, rguid : LibC::GUID*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_categories_in_item.call(this, rguid, ppEnum)
    end
    def enum_items_in_category(this : ITfCategoryMgr*, rcatid : LibC::GUID*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_items_in_category.call(this, rcatid, ppEnum)
    end
    def find_closest_category(this : ITfCategoryMgr*, rguid : LibC::GUID*, pcatid : LibC::GUID*, ppcatidList : LibC::GUID**, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_closest_category.call(this, rguid, pcatid, ppcatidList, ulCount)
    end
    def register_guid_description(this : ITfCategoryMgr*, rclsid : LibC::GUID*, rguid : LibC::GUID*, pchDesc : UInt16*, cch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_guid_description.call(this, rclsid, rguid, pchDesc, cch)
    end
    def unregister_guid_description(this : ITfCategoryMgr*, rclsid : LibC::GUID*, rguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_guid_description.call(this, rclsid, rguid)
    end
    def get_guid_description(this : ITfCategoryMgr*, rguid : LibC::GUID*, pbstrDesc : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid_description.call(this, rguid, pbstrDesc)
    end
    def register_guiddword(this : ITfCategoryMgr*, rclsid : LibC::GUID*, rguid : LibC::GUID*, dw : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_guiddword.call(this, rclsid, rguid, dw)
    end
    def unregister_guiddword(this : ITfCategoryMgr*, rclsid : LibC::GUID*, rguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister_guiddword.call(this, rclsid, rguid)
    end
    def get_guiddword(this : ITfCategoryMgr*, rguid : LibC::GUID*, pdw : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guiddword.call(this, rguid, pdw)
    end
    def register_guid(this : ITfCategoryMgr*, rguid : LibC::GUID*, pguidatom : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_guid.call(this, rguid, pguidatom)
    end
    def get_guid(this : ITfCategoryMgr*, guidatom : UInt32, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid.call(this, guidatom, pguid)
    end
    def is_equal_tf_guid_atom(this : ITfCategoryMgr*, guidatom : UInt32, rguid : LibC::GUID*, pfEqual : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_equal_tf_guid_atom.call(this, guidatom, rguid, pfEqual)
    end

  end

  @[Extern]
  record ITfSourceVtbl,
    query_interface : Proc(ITfSource*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfSource*, UInt32),
    release : Proc(ITfSource*, UInt32),
    advise_sink : Proc(ITfSource*, LibC::GUID*, Void*, UInt32*, Win32cr::Foundation::HRESULT),
    unadvise_sink : Proc(ITfSource*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4ea48a35-60ae-446f-8fd6-e6a8d82459f7")]
  record ITfSource, lpVtbl : ITfSourceVtbl* do
    GUID = LibC::GUID.new(0x4ea48a35_u32, 0x60ae_u16, 0x446f_u16, StaticArray[0x8f_u8, 0xd6_u8, 0xe6_u8, 0xa8_u8, 0xd8_u8, 0x24_u8, 0x59_u8, 0xf7_u8])
    def query_interface(this : ITfSource*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfSource*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfSource*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise_sink(this : ITfSource*, riid : LibC::GUID*, punk : Void*, pdwCookie : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_sink.call(this, riid, punk, pdwCookie)
    end
    def unadvise_sink(this : ITfSource*, dwCookie : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_sink.call(this, dwCookie)
    end

  end

  @[Extern]
  record ITfSourceSingleVtbl,
    query_interface : Proc(ITfSourceSingle*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfSourceSingle*, UInt32),
    release : Proc(ITfSourceSingle*, UInt32),
    advise_single_sink : Proc(ITfSourceSingle*, UInt32, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    unadvise_single_sink : Proc(ITfSourceSingle*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("73131f9c-56a9-49dd-b0ee-d046633f7528")]
  record ITfSourceSingle, lpVtbl : ITfSourceSingleVtbl* do
    GUID = LibC::GUID.new(0x73131f9c_u32, 0x56a9_u16, 0x49dd_u16, StaticArray[0xb0_u8, 0xee_u8, 0xd0_u8, 0x46_u8, 0x63_u8, 0x3f_u8, 0x75_u8, 0x28_u8])
    def query_interface(this : ITfSourceSingle*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfSourceSingle*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfSourceSingle*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise_single_sink(this : ITfSourceSingle*, tid : UInt32, riid : LibC::GUID*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_single_sink.call(this, tid, riid, punk)
    end
    def unadvise_single_sink(this : ITfSourceSingle*, tid : UInt32, riid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unadvise_single_sink.call(this, tid, riid)
    end

  end

  @[Extern]
  record ITfUIElementMgrVtbl,
    query_interface : Proc(ITfUIElementMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfUIElementMgr*, UInt32),
    release : Proc(ITfUIElementMgr*, UInt32),
    begin_ui_element : Proc(ITfUIElementMgr*, Void*, Win32cr::Foundation::BOOL*, UInt32*, Win32cr::Foundation::HRESULT),
    update_ui_element : Proc(ITfUIElementMgr*, UInt32, Win32cr::Foundation::HRESULT),
    end_ui_element : Proc(ITfUIElementMgr*, UInt32, Win32cr::Foundation::HRESULT),
    get_ui_element : Proc(ITfUIElementMgr*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    enum_ui_elements : Proc(ITfUIElementMgr*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ea1ea135-19df-11d7-a6d2-00065b84435c")]
  record ITfUIElementMgr, lpVtbl : ITfUIElementMgrVtbl* do
    GUID = LibC::GUID.new(0xea1ea135_u32, 0x19df_u16, 0x11d7_u16, StaticArray[0xa6_u8, 0xd2_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
    def query_interface(this : ITfUIElementMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfUIElementMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfUIElementMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_ui_element(this : ITfUIElementMgr*, pElement : Void*, pbShow : Win32cr::Foundation::BOOL*, pdwUIElementId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_ui_element.call(this, pElement, pbShow, pdwUIElementId)
    end
    def update_ui_element(this : ITfUIElementMgr*, dwUIElementId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_ui_element.call(this, dwUIElementId)
    end
    def end_ui_element(this : ITfUIElementMgr*, dwUIElementId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_ui_element.call(this, dwUIElementId)
    end
    def get_ui_element(this : ITfUIElementMgr*, dwUIELementId : UInt32, ppElement : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ui_element.call(this, dwUIELementId, ppElement)
    end
    def enum_ui_elements(this : ITfUIElementMgr*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_ui_elements.call(this, ppEnum)
    end

  end

  @[Extern]
  record IEnumTfUIElementsVtbl,
    query_interface : Proc(IEnumTfUIElements*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTfUIElements*, UInt32),
    release : Proc(IEnumTfUIElements*, UInt32),
    clone : Proc(IEnumTfUIElements*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumTfUIElements*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTfUIElements*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTfUIElements*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("887aa91e-acba-4931-84da-3c5208cf543f")]
  record IEnumTfUIElements, lpVtbl : IEnumTfUIElementsVtbl* do
    GUID = LibC::GUID.new(0x887aa91e_u32, 0xacba_u16, 0x4931_u16, StaticArray[0x84_u8, 0xda_u8, 0x3c_u8, 0x52_u8, 0x8_u8, 0xcf_u8, 0x54_u8, 0x3f_u8])
    def query_interface(this : IEnumTfUIElements*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTfUIElements*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTfUIElements*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumTfUIElements*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumTfUIElements*, ulCount : UInt32, ppElement : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, ppElement, pcFetched)
    end
    def reset(this : IEnumTfUIElements*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumTfUIElements*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfUIElementSinkVtbl,
    query_interface : Proc(ITfUIElementSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfUIElementSink*, UInt32),
    release : Proc(ITfUIElementSink*, UInt32),
    begin_ui_element : Proc(ITfUIElementSink*, UInt32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    update_ui_element : Proc(ITfUIElementSink*, UInt32, Win32cr::Foundation::HRESULT),
    end_ui_element : Proc(ITfUIElementSink*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ea1ea136-19df-11d7-a6d2-00065b84435c")]
  record ITfUIElementSink, lpVtbl : ITfUIElementSinkVtbl* do
    GUID = LibC::GUID.new(0xea1ea136_u32, 0x19df_u16, 0x11d7_u16, StaticArray[0xa6_u8, 0xd2_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
    def query_interface(this : ITfUIElementSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfUIElementSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfUIElementSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_ui_element(this : ITfUIElementSink*, dwUIElementId : UInt32, pbShow : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_ui_element.call(this, dwUIElementId, pbShow)
    end
    def update_ui_element(this : ITfUIElementSink*, dwUIElementId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_ui_element.call(this, dwUIElementId)
    end
    def end_ui_element(this : ITfUIElementSink*, dwUIElementId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_ui_element.call(this, dwUIElementId)
    end

  end

  @[Extern]
  record ITfUIElementVtbl,
    query_interface : Proc(ITfUIElement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfUIElement*, UInt32),
    release : Proc(ITfUIElement*, UInt32),
    get_description : Proc(ITfUIElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_guid : Proc(ITfUIElement*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfUIElement*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_shown : Proc(ITfUIElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ea1ea137-19df-11d7-a6d2-00065b84435c")]
  record ITfUIElement, lpVtbl : ITfUIElementVtbl* do
    GUID = LibC::GUID.new(0xea1ea137_u32, 0x19df_u16, 0x11d7_u16, StaticArray[0xa6_u8, 0xd2_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
    def query_interface(this : ITfUIElement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfUIElement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfUIElement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_description(this : ITfUIElement*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pbstrDescription)
    end
    def get_guid(this : ITfUIElement*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid.call(this, pguid)
    end
    def show(this : ITfUIElement*, bShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, bShow)
    end
    def is_shown(this : ITfUIElement*, pbShow : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_shown.call(this, pbShow)
    end

  end

  @[Extern]
  record ITfCandidateListUIElementVtbl,
    query_interface : Proc(ITfCandidateListUIElement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfCandidateListUIElement*, UInt32),
    release : Proc(ITfCandidateListUIElement*, UInt32),
    get_description : Proc(ITfCandidateListUIElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_guid : Proc(ITfCandidateListUIElement*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfCandidateListUIElement*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_shown : Proc(ITfCandidateListUIElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_updated_flags : Proc(ITfCandidateListUIElement*, UInt32*, Win32cr::Foundation::HRESULT),
    get_document_mgr : Proc(ITfCandidateListUIElement*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(ITfCandidateListUIElement*, UInt32*, Win32cr::Foundation::HRESULT),
    get_selection : Proc(ITfCandidateListUIElement*, UInt32*, Win32cr::Foundation::HRESULT),
    get_string : Proc(ITfCandidateListUIElement*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_page_index : Proc(ITfCandidateListUIElement*, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_page_index : Proc(ITfCandidateListUIElement*, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    get_current_page : Proc(ITfCandidateListUIElement*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ea1ea138-19df-11d7-a6d2-00065b84435c")]
  record ITfCandidateListUIElement, lpVtbl : ITfCandidateListUIElementVtbl* do
    GUID = LibC::GUID.new(0xea1ea138_u32, 0x19df_u16, 0x11d7_u16, StaticArray[0xa6_u8, 0xd2_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
    def query_interface(this : ITfCandidateListUIElement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfCandidateListUIElement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfCandidateListUIElement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_description(this : ITfCandidateListUIElement*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pbstrDescription)
    end
    def get_guid(this : ITfCandidateListUIElement*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid.call(this, pguid)
    end
    def show(this : ITfCandidateListUIElement*, bShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, bShow)
    end
    def is_shown(this : ITfCandidateListUIElement*, pbShow : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_shown.call(this, pbShow)
    end
    def get_updated_flags(this : ITfCandidateListUIElement*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_updated_flags.call(this, pdwFlags)
    end
    def get_document_mgr(this : ITfCandidateListUIElement*, ppdim : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_mgr.call(this, ppdim)
    end
    def get_count(this : ITfCandidateListUIElement*, puCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, puCount)
    end
    def get_selection(this : ITfCandidateListUIElement*, puIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, puIndex)
    end
    def get_string(this : ITfCandidateListUIElement*, uIndex : UInt32, pstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string.call(this, uIndex, pstr)
    end
    def get_page_index(this : ITfCandidateListUIElement*, pIndex : UInt32*, uSize : UInt32, puPageCnt : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_page_index.call(this, pIndex, uSize, puPageCnt)
    end
    def set_page_index(this : ITfCandidateListUIElement*, pIndex : UInt32*, uPageCnt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_page_index.call(this, pIndex, uPageCnt)
    end
    def get_current_page(this : ITfCandidateListUIElement*, puPage : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_page.call(this, puPage)
    end

  end

  @[Extern]
  record ITfCandidateListUIElementBehaviorVtbl,
    query_interface : Proc(ITfCandidateListUIElementBehavior*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfCandidateListUIElementBehavior*, UInt32),
    release : Proc(ITfCandidateListUIElementBehavior*, UInt32),
    get_description : Proc(ITfCandidateListUIElementBehavior*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_guid : Proc(ITfCandidateListUIElementBehavior*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfCandidateListUIElementBehavior*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_shown : Proc(ITfCandidateListUIElementBehavior*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_updated_flags : Proc(ITfCandidateListUIElementBehavior*, UInt32*, Win32cr::Foundation::HRESULT),
    get_document_mgr : Proc(ITfCandidateListUIElementBehavior*, Void**, Win32cr::Foundation::HRESULT),
    get_count : Proc(ITfCandidateListUIElementBehavior*, UInt32*, Win32cr::Foundation::HRESULT),
    get_selection : Proc(ITfCandidateListUIElementBehavior*, UInt32*, Win32cr::Foundation::HRESULT),
    get_string : Proc(ITfCandidateListUIElementBehavior*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_page_index : Proc(ITfCandidateListUIElementBehavior*, UInt32*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_page_index : Proc(ITfCandidateListUIElementBehavior*, UInt32*, UInt32, Win32cr::Foundation::HRESULT),
    get_current_page : Proc(ITfCandidateListUIElementBehavior*, UInt32*, Win32cr::Foundation::HRESULT),
    set_selection : Proc(ITfCandidateListUIElementBehavior*, UInt32, Win32cr::Foundation::HRESULT),
    finalize__ : Proc(ITfCandidateListUIElementBehavior*, Win32cr::Foundation::HRESULT),
    abort : Proc(ITfCandidateListUIElementBehavior*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("85fad185-58ce-497a-9460-355366b64b9a")]
  record ITfCandidateListUIElementBehavior, lpVtbl : ITfCandidateListUIElementBehaviorVtbl* do
    GUID = LibC::GUID.new(0x85fad185_u32, 0x58ce_u16, 0x497a_u16, StaticArray[0x94_u8, 0x60_u8, 0x35_u8, 0x53_u8, 0x66_u8, 0xb6_u8, 0x4b_u8, 0x9a_u8])
    def query_interface(this : ITfCandidateListUIElementBehavior*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfCandidateListUIElementBehavior*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfCandidateListUIElementBehavior*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_description(this : ITfCandidateListUIElementBehavior*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pbstrDescription)
    end
    def get_guid(this : ITfCandidateListUIElementBehavior*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid.call(this, pguid)
    end
    def show(this : ITfCandidateListUIElementBehavior*, bShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, bShow)
    end
    def is_shown(this : ITfCandidateListUIElementBehavior*, pbShow : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_shown.call(this, pbShow)
    end
    def get_updated_flags(this : ITfCandidateListUIElementBehavior*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_updated_flags.call(this, pdwFlags)
    end
    def get_document_mgr(this : ITfCandidateListUIElementBehavior*, ppdim : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_mgr.call(this, ppdim)
    end
    def get_count(this : ITfCandidateListUIElementBehavior*, puCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_count.call(this, puCount)
    end
    def get_selection(this : ITfCandidateListUIElementBehavior*, puIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, puIndex)
    end
    def get_string(this : ITfCandidateListUIElementBehavior*, uIndex : UInt32, pstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string.call(this, uIndex, pstr)
    end
    def get_page_index(this : ITfCandidateListUIElementBehavior*, pIndex : UInt32*, uSize : UInt32, puPageCnt : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_page_index.call(this, pIndex, uSize, puPageCnt)
    end
    def set_page_index(this : ITfCandidateListUIElementBehavior*, pIndex : UInt32*, uPageCnt : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_page_index.call(this, pIndex, uPageCnt)
    end
    def get_current_page(this : ITfCandidateListUIElementBehavior*, puPage : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_page.call(this, puPage)
    end
    def set_selection(this : ITfCandidateListUIElementBehavior*, nIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_selection.call(this, nIndex)
    end
    def finalize__(this : ITfCandidateListUIElementBehavior*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finalize__.call(this)
    end
    def abort(this : ITfCandidateListUIElementBehavior*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.abort.call(this)
    end

  end

  @[Extern]
  record ITfReadingInformationUIElementVtbl,
    query_interface : Proc(ITfReadingInformationUIElement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfReadingInformationUIElement*, UInt32),
    release : Proc(ITfReadingInformationUIElement*, UInt32),
    get_description : Proc(ITfReadingInformationUIElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_guid : Proc(ITfReadingInformationUIElement*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfReadingInformationUIElement*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_shown : Proc(ITfReadingInformationUIElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_updated_flags : Proc(ITfReadingInformationUIElement*, UInt32*, Win32cr::Foundation::HRESULT),
    get_context : Proc(ITfReadingInformationUIElement*, Void**, Win32cr::Foundation::HRESULT),
    get_string : Proc(ITfReadingInformationUIElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_max_reading_string_length : Proc(ITfReadingInformationUIElement*, UInt32*, Win32cr::Foundation::HRESULT),
    get_error_index : Proc(ITfReadingInformationUIElement*, UInt32*, Win32cr::Foundation::HRESULT),
    is_vertical_order_preferred : Proc(ITfReadingInformationUIElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ea1ea139-19df-11d7-a6d2-00065b84435c")]
  record ITfReadingInformationUIElement, lpVtbl : ITfReadingInformationUIElementVtbl* do
    GUID = LibC::GUID.new(0xea1ea139_u32, 0x19df_u16, 0x11d7_u16, StaticArray[0xa6_u8, 0xd2_u8, 0x0_u8, 0x6_u8, 0x5b_u8, 0x84_u8, 0x43_u8, 0x5c_u8])
    def query_interface(this : ITfReadingInformationUIElement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfReadingInformationUIElement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfReadingInformationUIElement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_description(this : ITfReadingInformationUIElement*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pbstrDescription)
    end
    def get_guid(this : ITfReadingInformationUIElement*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid.call(this, pguid)
    end
    def show(this : ITfReadingInformationUIElement*, bShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, bShow)
    end
    def is_shown(this : ITfReadingInformationUIElement*, pbShow : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_shown.call(this, pbShow)
    end
    def get_updated_flags(this : ITfReadingInformationUIElement*, pdwFlags : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_updated_flags.call(this, pdwFlags)
    end
    def get_context(this : ITfReadingInformationUIElement*, ppic : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_context.call(this, ppic)
    end
    def get_string(this : ITfReadingInformationUIElement*, pstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string.call(this, pstr)
    end
    def get_max_reading_string_length(this : ITfReadingInformationUIElement*, pcchMax : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_reading_string_length.call(this, pcchMax)
    end
    def get_error_index(this : ITfReadingInformationUIElement*, pErrorIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_index.call(this, pErrorIndex)
    end
    def is_vertical_order_preferred(this : ITfReadingInformationUIElement*, pfVertical : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_vertical_order_preferred.call(this, pfVertical)
    end

  end

  @[Extern]
  record ITfTransitoryExtensionUIElementVtbl,
    query_interface : Proc(ITfTransitoryExtensionUIElement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfTransitoryExtensionUIElement*, UInt32),
    release : Proc(ITfTransitoryExtensionUIElement*, UInt32),
    get_description : Proc(ITfTransitoryExtensionUIElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_guid : Proc(ITfTransitoryExtensionUIElement*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfTransitoryExtensionUIElement*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_shown : Proc(ITfTransitoryExtensionUIElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_document_mgr : Proc(ITfTransitoryExtensionUIElement*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("858f956a-972f-42a2-a2f2-0321e1abe209")]
  record ITfTransitoryExtensionUIElement, lpVtbl : ITfTransitoryExtensionUIElementVtbl* do
    GUID = LibC::GUID.new(0x858f956a_u32, 0x972f_u16, 0x42a2_u16, StaticArray[0xa2_u8, 0xf2_u8, 0x3_u8, 0x21_u8, 0xe1_u8, 0xab_u8, 0xe2_u8, 0x9_u8])
    def query_interface(this : ITfTransitoryExtensionUIElement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfTransitoryExtensionUIElement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfTransitoryExtensionUIElement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_description(this : ITfTransitoryExtensionUIElement*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pbstrDescription)
    end
    def get_guid(this : ITfTransitoryExtensionUIElement*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid.call(this, pguid)
    end
    def show(this : ITfTransitoryExtensionUIElement*, bShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, bShow)
    end
    def is_shown(this : ITfTransitoryExtensionUIElement*, pbShow : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_shown.call(this, pbShow)
    end
    def get_document_mgr(this : ITfTransitoryExtensionUIElement*, ppdim : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_document_mgr.call(this, ppdim)
    end

  end

  @[Extern]
  record ITfTransitoryExtensionSinkVtbl,
    query_interface : Proc(ITfTransitoryExtensionSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfTransitoryExtensionSink*, UInt32),
    release : Proc(ITfTransitoryExtensionSink*, UInt32),
    on_transitory_extension_updated : Proc(ITfTransitoryExtensionSink*, Void*, UInt32, Void*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a615096f-1c57-4813-8a15-55ee6e5a839c")]
  record ITfTransitoryExtensionSink, lpVtbl : ITfTransitoryExtensionSinkVtbl* do
    GUID = LibC::GUID.new(0xa615096f_u32, 0x1c57_u16, 0x4813_u16, StaticArray[0x8a_u8, 0x15_u8, 0x55_u8, 0xee_u8, 0x6e_u8, 0x5a_u8, 0x83_u8, 0x9c_u8])
    def query_interface(this : ITfTransitoryExtensionSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfTransitoryExtensionSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfTransitoryExtensionSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_transitory_extension_updated(this : ITfTransitoryExtensionSink*, pic : Void*, ecReadOnly : UInt32, pResultRange : Void*, pCompositionRange : Void*, pfDeleteResultRange : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_transitory_extension_updated.call(this, pic, ecReadOnly, pResultRange, pCompositionRange, pfDeleteResultRange)
    end

  end

  @[Extern]
  record ITfToolTipUIElementVtbl,
    query_interface : Proc(ITfToolTipUIElement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfToolTipUIElement*, UInt32),
    release : Proc(ITfToolTipUIElement*, UInt32),
    get_description : Proc(ITfToolTipUIElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_guid : Proc(ITfToolTipUIElement*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfToolTipUIElement*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    is_shown : Proc(ITfToolTipUIElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_string : Proc(ITfToolTipUIElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("52b18b5c-555d-46b2-b00a-fa680144fbdb")]
  record ITfToolTipUIElement, lpVtbl : ITfToolTipUIElementVtbl* do
    GUID = LibC::GUID.new(0x52b18b5c_u32, 0x555d_u16, 0x46b2_u16, StaticArray[0xb0_u8, 0xa_u8, 0xfa_u8, 0x68_u8, 0x1_u8, 0x44_u8, 0xfb_u8, 0xdb_u8])
    def query_interface(this : ITfToolTipUIElement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfToolTipUIElement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfToolTipUIElement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_description(this : ITfToolTipUIElement*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_description.call(this, pbstrDescription)
    end
    def get_guid(this : ITfToolTipUIElement*, pguid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_guid.call(this, pguid)
    end
    def show(this : ITfToolTipUIElement*, bShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, bShow)
    end
    def is_shown(this : ITfToolTipUIElement*, pbShow : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_shown.call(this, pbShow)
    end
    def get_string(this : ITfToolTipUIElement*, pstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string.call(this, pstr)
    end

  end

  @[Extern]
  record ITfReverseConversionListVtbl,
    query_interface : Proc(ITfReverseConversionList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfReverseConversionList*, UInt32),
    release : Proc(ITfReverseConversionList*, UInt32),
    get_length : Proc(ITfReverseConversionList*, UInt32*, Win32cr::Foundation::HRESULT),
    get_string : Proc(ITfReverseConversionList*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("151d69f0-86f4-4674-b721-56911e797f47")]
  record ITfReverseConversionList, lpVtbl : ITfReverseConversionListVtbl* do
    GUID = LibC::GUID.new(0x151d69f0_u32, 0x86f4_u16, 0x4674_u16, StaticArray[0xb7_u8, 0x21_u8, 0x56_u8, 0x91_u8, 0x1e_u8, 0x79_u8, 0x7f_u8, 0x47_u8])
    def query_interface(this : ITfReverseConversionList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfReverseConversionList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfReverseConversionList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_length(this : ITfReverseConversionList*, puIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_length.call(this, puIndex)
    end
    def get_string(this : ITfReverseConversionList*, uIndex : UInt32, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string.call(this, uIndex, pbstr)
    end

  end

  @[Extern]
  record ITfReverseConversionVtbl,
    query_interface : Proc(ITfReverseConversion*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfReverseConversion*, UInt32),
    release : Proc(ITfReverseConversion*, UInt32),
    do_reverse_conversion : Proc(ITfReverseConversion*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a415e162-157d-417d-8a8c-0ab26c7d2781")]
  record ITfReverseConversion, lpVtbl : ITfReverseConversionVtbl* do
    GUID = LibC::GUID.new(0xa415e162_u32, 0x157d_u16, 0x417d_u16, StaticArray[0x8a_u8, 0x8c_u8, 0xa_u8, 0xb2_u8, 0x6c_u8, 0x7d_u8, 0x27_u8, 0x81_u8])
    def query_interface(this : ITfReverseConversion*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfReverseConversion*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfReverseConversion*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def do_reverse_conversion(this : ITfReverseConversion*, lpstr : Win32cr::Foundation::PWSTR, ppList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_reverse_conversion.call(this, lpstr, ppList)
    end

  end

  @[Extern]
  record ITfReverseConversionMgrVtbl,
    query_interface : Proc(ITfReverseConversionMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfReverseConversionMgr*, UInt32),
    release : Proc(ITfReverseConversionMgr*, UInt32),
    get_reverse_conversion : Proc(ITfReverseConversionMgr*, UInt16, LibC::GUID*, UInt32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b643c236-c493-41b6-abb3-692412775cc4")]
  record ITfReverseConversionMgr, lpVtbl : ITfReverseConversionMgrVtbl* do
    GUID = LibC::GUID.new(0xb643c236_u32, 0xc493_u16, 0x41b6_u16, StaticArray[0xab_u8, 0xb3_u8, 0x69_u8, 0x24_u8, 0x12_u8, 0x77_u8, 0x5c_u8, 0xc4_u8])
    def query_interface(this : ITfReverseConversionMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfReverseConversionMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfReverseConversionMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_reverse_conversion(this : ITfReverseConversionMgr*, langid : UInt16, guidProfile : LibC::GUID*, dwflag : UInt32, ppReverseConversion : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reverse_conversion.call(this, langid, guidProfile, dwflag, ppReverseConversion)
    end

  end

  @[Extern]
  record ITfCandidateStringVtbl,
    query_interface : Proc(ITfCandidateString*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfCandidateString*, UInt32),
    release : Proc(ITfCandidateString*, UInt32),
    get_string : Proc(ITfCandidateString*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_index : Proc(ITfCandidateString*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("581f317e-fd9d-443f-b972-ed00467c5d40")]
  record ITfCandidateString, lpVtbl : ITfCandidateStringVtbl* do
    GUID = LibC::GUID.new(0x581f317e_u32, 0xfd9d_u16, 0x443f_u16, StaticArray[0xb9_u8, 0x72_u8, 0xed_u8, 0x0_u8, 0x46_u8, 0x7c_u8, 0x5d_u8, 0x40_u8])
    def query_interface(this : ITfCandidateString*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfCandidateString*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfCandidateString*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_string(this : ITfCandidateString*, pbstr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string.call(this, pbstr)
    end
    def get_index(this : ITfCandidateString*, pnIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_index.call(this, pnIndex)
    end

  end

  @[Extern]
  record IEnumTfCandidatesVtbl,
    query_interface : Proc(IEnumTfCandidates*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTfCandidates*, UInt32),
    release : Proc(IEnumTfCandidates*, UInt32),
    clone : Proc(IEnumTfCandidates*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumTfCandidates*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTfCandidates*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTfCandidates*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("defb1926-6c80-4ce8-87d4-d6b72b812bde")]
  record IEnumTfCandidates, lpVtbl : IEnumTfCandidatesVtbl* do
    GUID = LibC::GUID.new(0xdefb1926_u32, 0x6c80_u16, 0x4ce8_u16, StaticArray[0x87_u8, 0xd4_u8, 0xd6_u8, 0xb7_u8, 0x2b_u8, 0x81_u8, 0x2b_u8, 0xde_u8])
    def query_interface(this : IEnumTfCandidates*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTfCandidates*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTfCandidates*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumTfCandidates*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumTfCandidates*, ulCount : UInt32, ppCand : Void**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, ppCand, pcFetched)
    end
    def reset(this : IEnumTfCandidates*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumTfCandidates*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfCandidateListVtbl,
    query_interface : Proc(ITfCandidateList*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfCandidateList*, UInt32),
    release : Proc(ITfCandidateList*, UInt32),
    enum_candidates : Proc(ITfCandidateList*, Void**, Win32cr::Foundation::HRESULT),
    get_candidate : Proc(ITfCandidateList*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_candidate_num : Proc(ITfCandidateList*, UInt32*, Win32cr::Foundation::HRESULT),
    set_result : Proc(ITfCandidateList*, UInt32, Win32cr::UI::TextServices::TfCandidateResult, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a3ad50fb-9bdb-49e3-a843-6c76520fbf5d")]
  record ITfCandidateList, lpVtbl : ITfCandidateListVtbl* do
    GUID = LibC::GUID.new(0xa3ad50fb_u32, 0x9bdb_u16, 0x49e3_u16, StaticArray[0xa8_u8, 0x43_u8, 0x6c_u8, 0x76_u8, 0x52_u8, 0xf_u8, 0xbf_u8, 0x5d_u8])
    def query_interface(this : ITfCandidateList*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfCandidateList*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfCandidateList*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_candidates(this : ITfCandidateList*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_candidates.call(this, ppEnum)
    end
    def get_candidate(this : ITfCandidateList*, nIndex : UInt32, ppCand : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_candidate.call(this, nIndex, ppCand)
    end
    def get_candidate_num(this : ITfCandidateList*, pnCnt : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_candidate_num.call(this, pnCnt)
    end
    def set_result(this : ITfCandidateList*, nIndex : UInt32, imcr : Win32cr::UI::TextServices::TfCandidateResult) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_result.call(this, nIndex, imcr)
    end

  end

  @[Extern]
  record ITfFnReconversionVtbl,
    query_interface : Proc(ITfFnReconversion*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnReconversion*, UInt32),
    release : Proc(ITfFnReconversion*, UInt32),
    get_display_name : Proc(ITfFnReconversion*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    query_range : Proc(ITfFnReconversion*, Void*, Void**, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_reconversion : Proc(ITfFnReconversion*, Void*, Void**, Win32cr::Foundation::HRESULT),
    reconvert : Proc(ITfFnReconversion*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4cea93c0-0a58-11d3-8df0-00105a2799b5")]
  record ITfFnReconversion, lpVtbl : ITfFnReconversionVtbl* do
    GUID = LibC::GUID.new(0x4cea93c0_u32, 0xa58_u16, 0x11d3_u16, StaticArray[0x8d_u8, 0xf0_u8, 0x0_u8, 0x10_u8, 0x5a_u8, 0x27_u8, 0x99_u8, 0xb5_u8])
    def query_interface(this : ITfFnReconversion*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnReconversion*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnReconversion*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnReconversion*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def query_range(this : ITfFnReconversion*, pRange : Void*, ppNewRange : Void**, pfConvertable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_range.call(this, pRange, ppNewRange, pfConvertable)
    end
    def get_reconversion(this : ITfFnReconversion*, pRange : Void*, ppCandList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reconversion.call(this, pRange, ppCandList)
    end
    def reconvert(this : ITfFnReconversion*, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reconvert.call(this, pRange)
    end

  end

  @[Extern]
  record ITfFnPlayBackVtbl,
    query_interface : Proc(ITfFnPlayBack*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnPlayBack*, UInt32),
    release : Proc(ITfFnPlayBack*, UInt32),
    get_display_name : Proc(ITfFnPlayBack*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    query_range : Proc(ITfFnPlayBack*, Void*, Void**, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    play : Proc(ITfFnPlayBack*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a3a416a4-0f64-11d3-b5b7-00c04fc324a1")]
  record ITfFnPlayBack, lpVtbl : ITfFnPlayBackVtbl* do
    GUID = LibC::GUID.new(0xa3a416a4_u32, 0xf64_u16, 0x11d3_u16, StaticArray[0xb5_u8, 0xb7_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xc3_u8, 0x24_u8, 0xa1_u8])
    def query_interface(this : ITfFnPlayBack*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnPlayBack*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnPlayBack*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnPlayBack*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def query_range(this : ITfFnPlayBack*, pRange : Void*, ppNewRange : Void**, pfPlayable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_range.call(this, pRange, ppNewRange, pfPlayable)
    end
    def play(this : ITfFnPlayBack*, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.play.call(this, pRange)
    end

  end

  @[Extern]
  record ITfFnLangProfileUtilVtbl,
    query_interface : Proc(ITfFnLangProfileUtil*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnLangProfileUtil*, UInt32),
    release : Proc(ITfFnLangProfileUtil*, UInt32),
    get_display_name : Proc(ITfFnLangProfileUtil*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    register_active_profiles : Proc(ITfFnLangProfileUtil*, Win32cr::Foundation::HRESULT),
    is_profile_available_for_lang : Proc(ITfFnLangProfileUtil*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a87a8574-a6c1-4e15-99f0-3d3965f548eb")]
  record ITfFnLangProfileUtil, lpVtbl : ITfFnLangProfileUtilVtbl* do
    GUID = LibC::GUID.new(0xa87a8574_u32, 0xa6c1_u16, 0x4e15_u16, StaticArray[0x99_u8, 0xf0_u8, 0x3d_u8, 0x39_u8, 0x65_u8, 0xf5_u8, 0x48_u8, 0xeb_u8])
    def query_interface(this : ITfFnLangProfileUtil*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnLangProfileUtil*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnLangProfileUtil*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnLangProfileUtil*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def register_active_profiles(this : ITfFnLangProfileUtil*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_active_profiles.call(this)
    end
    def is_profile_available_for_lang(this : ITfFnLangProfileUtil*, langid : UInt16, pfAvailable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_profile_available_for_lang.call(this, langid, pfAvailable)
    end

  end

  @[Extern]
  record ITfFnConfigureVtbl,
    query_interface : Proc(ITfFnConfigure*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnConfigure*, UInt32),
    release : Proc(ITfFnConfigure*, UInt32),
    get_display_name : Proc(ITfFnConfigure*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfFnConfigure*, Win32cr::Foundation::HWND, UInt16, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("88f567c6-1757-49f8-a1b2-89234c1eeff9")]
  record ITfFnConfigure, lpVtbl : ITfFnConfigureVtbl* do
    GUID = LibC::GUID.new(0x88f567c6_u32, 0x1757_u16, 0x49f8_u16, StaticArray[0xa1_u8, 0xb2_u8, 0x89_u8, 0x23_u8, 0x4c_u8, 0x1e_u8, 0xef_u8, 0xf9_u8])
    def query_interface(this : ITfFnConfigure*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnConfigure*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnConfigure*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnConfigure*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def show(this : ITfFnConfigure*, hwndParent : Win32cr::Foundation::HWND, langid : UInt16, rguidProfile : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, hwndParent, langid, rguidProfile)
    end

  end

  @[Extern]
  record ITfFnConfigureRegisterWordVtbl,
    query_interface : Proc(ITfFnConfigureRegisterWord*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnConfigureRegisterWord*, UInt32),
    release : Proc(ITfFnConfigureRegisterWord*, UInt32),
    get_display_name : Proc(ITfFnConfigureRegisterWord*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfFnConfigureRegisterWord*, Win32cr::Foundation::HWND, UInt16, LibC::GUID*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bb95808a-6d8f-4bca-8400-5390b586aedf")]
  record ITfFnConfigureRegisterWord, lpVtbl : ITfFnConfigureRegisterWordVtbl* do
    GUID = LibC::GUID.new(0xbb95808a_u32, 0x6d8f_u16, 0x4bca_u16, StaticArray[0x84_u8, 0x0_u8, 0x53_u8, 0x90_u8, 0xb5_u8, 0x86_u8, 0xae_u8, 0xdf_u8])
    def query_interface(this : ITfFnConfigureRegisterWord*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnConfigureRegisterWord*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnConfigureRegisterWord*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnConfigureRegisterWord*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def show(this : ITfFnConfigureRegisterWord*, hwndParent : Win32cr::Foundation::HWND, langid : UInt16, rguidProfile : LibC::GUID*, bstrRegistered : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, hwndParent, langid, rguidProfile, bstrRegistered)
    end

  end

  @[Extern]
  record ITfFnConfigureRegisterEudcVtbl,
    query_interface : Proc(ITfFnConfigureRegisterEudc*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnConfigureRegisterEudc*, UInt32),
    release : Proc(ITfFnConfigureRegisterEudc*, UInt32),
    get_display_name : Proc(ITfFnConfigureRegisterEudc*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfFnConfigureRegisterEudc*, Win32cr::Foundation::HWND, UInt16, LibC::GUID*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b5e26ff5-d7ad-4304-913f-21a2ed95a1b0")]
  record ITfFnConfigureRegisterEudc, lpVtbl : ITfFnConfigureRegisterEudcVtbl* do
    GUID = LibC::GUID.new(0xb5e26ff5_u32, 0xd7ad_u16, 0x4304_u16, StaticArray[0x91_u8, 0x3f_u8, 0x21_u8, 0xa2_u8, 0xed_u8, 0x95_u8, 0xa1_u8, 0xb0_u8])
    def query_interface(this : ITfFnConfigureRegisterEudc*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnConfigureRegisterEudc*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnConfigureRegisterEudc*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnConfigureRegisterEudc*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def show(this : ITfFnConfigureRegisterEudc*, hwndParent : Win32cr::Foundation::HWND, langid : UInt16, rguidProfile : LibC::GUID*, bstrRegistered : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, hwndParent, langid, rguidProfile, bstrRegistered)
    end

  end

  @[Extern]
  record ITfFnShowHelpVtbl,
    query_interface : Proc(ITfFnShowHelp*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnShowHelp*, UInt32),
    release : Proc(ITfFnShowHelp*, UInt32),
    get_display_name : Proc(ITfFnShowHelp*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    show : Proc(ITfFnShowHelp*, Win32cr::Foundation::HWND, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5ab1d30c-094d-4c29-8ea5-0bf59be87bf3")]
  record ITfFnShowHelp, lpVtbl : ITfFnShowHelpVtbl* do
    GUID = LibC::GUID.new(0x5ab1d30c_u32, 0x94d_u16, 0x4c29_u16, StaticArray[0x8e_u8, 0xa5_u8, 0xb_u8, 0xf5_u8, 0x9b_u8, 0xe8_u8, 0x7b_u8, 0xf3_u8])
    def query_interface(this : ITfFnShowHelp*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnShowHelp*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnShowHelp*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnShowHelp*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def show(this : ITfFnShowHelp*, hwndParent : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show.call(this, hwndParent)
    end

  end

  @[Extern]
  record ITfFnBalloonVtbl,
    query_interface : Proc(ITfFnBalloon*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnBalloon*, UInt32),
    release : Proc(ITfFnBalloon*, UInt32),
    update_balloon : Proc(ITfFnBalloon*, Win32cr::UI::TextServices::TfLBBalloonStyle, UInt16*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3bab89e4-5fbe-45f4-a5bc-dca36ad225a8")]
  record ITfFnBalloon, lpVtbl : ITfFnBalloonVtbl* do
    GUID = LibC::GUID.new(0x3bab89e4_u32, 0x5fbe_u16, 0x45f4_u16, StaticArray[0xa5_u8, 0xbc_u8, 0xdc_u8, 0xa3_u8, 0x6a_u8, 0xd2_u8, 0x25_u8, 0xa8_u8])
    def query_interface(this : ITfFnBalloon*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnBalloon*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnBalloon*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def update_balloon(this : ITfFnBalloon*, style : Win32cr::UI::TextServices::TfLBBalloonStyle, pch : UInt16*, cch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_balloon.call(this, style, pch, cch)
    end

  end

  @[Extern]
  record ITfFnGetSAPIObjectVtbl,
    query_interface : Proc(ITfFnGetSAPIObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnGetSAPIObject*, UInt32),
    release : Proc(ITfFnGetSAPIObject*, UInt32),
    get_display_name : Proc(ITfFnGetSAPIObject*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get : Proc(ITfFnGetSAPIObject*, Win32cr::UI::TextServices::TfSapiObject, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5c0ab7ea-167d-4f59-bfb5-4693755e90ca")]
  record ITfFnGetSAPIObject, lpVtbl : ITfFnGetSAPIObjectVtbl* do
    GUID = LibC::GUID.new(0x5c0ab7ea_u32, 0x167d_u16, 0x4f59_u16, StaticArray[0xbf_u8, 0xb5_u8, 0x46_u8, 0x93_u8, 0x75_u8, 0x5e_u8, 0x90_u8, 0xca_u8])
    def query_interface(this : ITfFnGetSAPIObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnGetSAPIObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnGetSAPIObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnGetSAPIObject*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def get(this : ITfFnGetSAPIObject*, sObj : Win32cr::UI::TextServices::TfSapiObject, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get.call(this, sObj, ppunk)
    end

  end

  @[Extern]
  record ITfFnPropertyUIStatusVtbl,
    query_interface : Proc(ITfFnPropertyUIStatus*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnPropertyUIStatus*, UInt32),
    release : Proc(ITfFnPropertyUIStatus*, UInt32),
    get_display_name : Proc(ITfFnPropertyUIStatus*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_status : Proc(ITfFnPropertyUIStatus*, LibC::GUID*, UInt32*, Win32cr::Foundation::HRESULT),
    set_status : Proc(ITfFnPropertyUIStatus*, LibC::GUID*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2338ac6e-2b9d-44c0-a75e-ee64f256b3bd")]
  record ITfFnPropertyUIStatus, lpVtbl : ITfFnPropertyUIStatusVtbl* do
    GUID = LibC::GUID.new(0x2338ac6e_u32, 0x2b9d_u16, 0x44c0_u16, StaticArray[0xa7_u8, 0x5e_u8, 0xee_u8, 0x64_u8, 0xf2_u8, 0x56_u8, 0xb3_u8, 0xbd_u8])
    def query_interface(this : ITfFnPropertyUIStatus*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnPropertyUIStatus*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnPropertyUIStatus*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnPropertyUIStatus*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def get_status(this : ITfFnPropertyUIStatus*, refguidProp : LibC::GUID*, pdw : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, refguidProp, pdw)
    end
    def set_status(this : ITfFnPropertyUIStatus*, refguidProp : LibC::GUID*, dw : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_status.call(this, refguidProp, dw)
    end

  end

  @[Extern]
  record IEnumSpeechCommandsVtbl,
    query_interface : Proc(IEnumSpeechCommands*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumSpeechCommands*, UInt32),
    release : Proc(IEnumSpeechCommands*, UInt32),
    clone : Proc(IEnumSpeechCommands*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumSpeechCommands*, UInt32, UInt16**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumSpeechCommands*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumSpeechCommands*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("8c5dac4f-083c-4b85-a4c9-71746048adca")]
  record IEnumSpeechCommands, lpVtbl : IEnumSpeechCommandsVtbl* do
    GUID = LibC::GUID.new(0x8c5dac4f_u32, 0x83c_u16, 0x4b85_u16, StaticArray[0xa4_u8, 0xc9_u8, 0x71_u8, 0x74_u8, 0x60_u8, 0x48_u8, 0xad_u8, 0xca_u8])
    def query_interface(this : IEnumSpeechCommands*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumSpeechCommands*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumSpeechCommands*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumSpeechCommands*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumSpeechCommands*, ulCount : UInt32, pSpCmds : UInt16**, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, pSpCmds, pcFetched)
    end
    def reset(this : IEnumSpeechCommands*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumSpeechCommands*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ISpeechCommandProviderVtbl,
    query_interface : Proc(ISpeechCommandProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpeechCommandProvider*, UInt32),
    release : Proc(ISpeechCommandProvider*, UInt32),
    enum_speech_commands : Proc(ISpeechCommandProvider*, UInt16, Void**, Win32cr::Foundation::HRESULT),
    process_command : Proc(ISpeechCommandProvider*, UInt16*, UInt32, UInt16, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("38e09d4c-586d-435a-b592-c8a86691dec6")]
  record ISpeechCommandProvider, lpVtbl : ISpeechCommandProviderVtbl* do
    GUID = LibC::GUID.new(0x38e09d4c_u32, 0x586d_u16, 0x435a_u16, StaticArray[0xb5_u8, 0x92_u8, 0xc8_u8, 0xa8_u8, 0x66_u8, 0x91_u8, 0xde_u8, 0xc6_u8])
    def query_interface(this : ISpeechCommandProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpeechCommandProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpeechCommandProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enum_speech_commands(this : ISpeechCommandProvider*, langid : UInt16, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_speech_commands.call(this, langid, ppEnum)
    end
    def process_command(this : ISpeechCommandProvider*, pszCommand : UInt16*, cch : UInt32, langid : UInt16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_command.call(this, pszCommand, cch, langid)
    end

  end

  @[Extern]
  record ITfFnCustomSpeechCommandVtbl,
    query_interface : Proc(ITfFnCustomSpeechCommand*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnCustomSpeechCommand*, UInt32),
    release : Proc(ITfFnCustomSpeechCommand*, UInt32),
    get_display_name : Proc(ITfFnCustomSpeechCommand*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_speech_command_provider : Proc(ITfFnCustomSpeechCommand*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fca6c349-a12f-43a3-8dd6-5a5a4282577b")]
  record ITfFnCustomSpeechCommand, lpVtbl : ITfFnCustomSpeechCommandVtbl* do
    GUID = LibC::GUID.new(0xfca6c349_u32, 0xa12f_u16, 0x43a3_u16, StaticArray[0x8d_u8, 0xd6_u8, 0x5a_u8, 0x5a_u8, 0x42_u8, 0x82_u8, 0x57_u8, 0x7b_u8])
    def query_interface(this : ITfFnCustomSpeechCommand*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnCustomSpeechCommand*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnCustomSpeechCommand*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnCustomSpeechCommand*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def set_speech_command_provider(this : ITfFnCustomSpeechCommand*, pspcmdProvider : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_speech_command_provider.call(this, pspcmdProvider)
    end

  end

  @[Extern]
  record ITfFnLMProcessorVtbl,
    query_interface : Proc(ITfFnLMProcessor*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnLMProcessor*, UInt32),
    release : Proc(ITfFnLMProcessor*, UInt32),
    get_display_name : Proc(ITfFnLMProcessor*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    query_range : Proc(ITfFnLMProcessor*, Void*, Void**, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    query_lang_id : Proc(ITfFnLMProcessor*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_reconversion : Proc(ITfFnLMProcessor*, Void*, Void**, Win32cr::Foundation::HRESULT),
    reconvert : Proc(ITfFnLMProcessor*, Void*, Win32cr::Foundation::HRESULT),
    query_key : Proc(ITfFnLMProcessor*, Win32cr::Foundation::BOOL, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    invoke_key : Proc(ITfFnLMProcessor*, Win32cr::Foundation::BOOL, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    invoke_func : Proc(ITfFnLMProcessor*, Void*, LibC::GUID*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7afbf8e7-ac4b-4082-b058-890899d3a010")]
  record ITfFnLMProcessor, lpVtbl : ITfFnLMProcessorVtbl* do
    GUID = LibC::GUID.new(0x7afbf8e7_u32, 0xac4b_u16, 0x4082_u16, StaticArray[0xb0_u8, 0x58_u8, 0x89_u8, 0x8_u8, 0x99_u8, 0xd3_u8, 0xa0_u8, 0x10_u8])
    def query_interface(this : ITfFnLMProcessor*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnLMProcessor*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnLMProcessor*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnLMProcessor*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def query_range(this : ITfFnLMProcessor*, pRange : Void*, ppNewRange : Void**, pfAccepted : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_range.call(this, pRange, ppNewRange, pfAccepted)
    end
    def query_lang_id(this : ITfFnLMProcessor*, langid : UInt16, pfAccepted : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_lang_id.call(this, langid, pfAccepted)
    end
    def get_reconversion(this : ITfFnLMProcessor*, pRange : Void*, ppCandList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reconversion.call(this, pRange, ppCandList)
    end
    def reconvert(this : ITfFnLMProcessor*, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reconvert.call(this, pRange)
    end
    def query_key(this : ITfFnLMProcessor*, fUp : Win32cr::Foundation::BOOL, vKey : Win32cr::Foundation::WPARAM, lparamKeydata : Win32cr::Foundation::LPARAM, pfInterested : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_key.call(this, fUp, vKey, lparamKeydata, pfInterested)
    end
    def invoke_key(this : ITfFnLMProcessor*, fUp : Win32cr::Foundation::BOOL, vKey : Win32cr::Foundation::WPARAM, lparamKeyData : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_key.call(this, fUp, vKey, lparamKeyData)
    end
    def invoke_func(this : ITfFnLMProcessor*, pic : Void*, refguidFunc : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_func.call(this, pic, refguidFunc)
    end

  end

  @[Extern]
  record ITfFnLMInternalVtbl,
    query_interface : Proc(ITfFnLMInternal*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnLMInternal*, UInt32),
    release : Proc(ITfFnLMInternal*, UInt32),
    get_display_name : Proc(ITfFnLMInternal*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    query_range : Proc(ITfFnLMInternal*, Void*, Void**, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    query_lang_id : Proc(ITfFnLMInternal*, UInt16, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_reconversion : Proc(ITfFnLMInternal*, Void*, Void**, Win32cr::Foundation::HRESULT),
    reconvert : Proc(ITfFnLMInternal*, Void*, Win32cr::Foundation::HRESULT),
    query_key : Proc(ITfFnLMInternal*, Win32cr::Foundation::BOOL, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    invoke_key : Proc(ITfFnLMInternal*, Win32cr::Foundation::BOOL, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::HRESULT),
    invoke_func : Proc(ITfFnLMInternal*, Void*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    process_lattice : Proc(ITfFnLMInternal*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("04b825b1-ac9a-4f7b-b5ad-c7168f1ee445")]
  record ITfFnLMInternal, lpVtbl : ITfFnLMInternalVtbl* do
    GUID = LibC::GUID.new(0x4b825b1_u32, 0xac9a_u16, 0x4f7b_u16, StaticArray[0xb5_u8, 0xad_u8, 0xc7_u8, 0x16_u8, 0x8f_u8, 0x1e_u8, 0xe4_u8, 0x45_u8])
    def query_interface(this : ITfFnLMInternal*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnLMInternal*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnLMInternal*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnLMInternal*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def query_range(this : ITfFnLMInternal*, pRange : Void*, ppNewRange : Void**, pfAccepted : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_range.call(this, pRange, ppNewRange, pfAccepted)
    end
    def query_lang_id(this : ITfFnLMInternal*, langid : UInt16, pfAccepted : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_lang_id.call(this, langid, pfAccepted)
    end
    def get_reconversion(this : ITfFnLMInternal*, pRange : Void*, ppCandList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_reconversion.call(this, pRange, ppCandList)
    end
    def reconvert(this : ITfFnLMInternal*, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reconvert.call(this, pRange)
    end
    def query_key(this : ITfFnLMInternal*, fUp : Win32cr::Foundation::BOOL, vKey : Win32cr::Foundation::WPARAM, lparamKeydata : Win32cr::Foundation::LPARAM, pfInterested : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_key.call(this, fUp, vKey, lparamKeydata, pfInterested)
    end
    def invoke_key(this : ITfFnLMInternal*, fUp : Win32cr::Foundation::BOOL, vKey : Win32cr::Foundation::WPARAM, lparamKeyData : Win32cr::Foundation::LPARAM) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_key.call(this, fUp, vKey, lparamKeyData)
    end
    def invoke_func(this : ITfFnLMInternal*, pic : Void*, refguidFunc : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_func.call(this, pic, refguidFunc)
    end
    def process_lattice(this : ITfFnLMInternal*, pRange : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.process_lattice.call(this, pRange)
    end

  end

  @[Extern]
  record IEnumTfLatticeElementsVtbl,
    query_interface : Proc(IEnumTfLatticeElements*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumTfLatticeElements*, UInt32),
    release : Proc(IEnumTfLatticeElements*, UInt32),
    clone : Proc(IEnumTfLatticeElements*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumTfLatticeElements*, UInt32, Win32cr::UI::TextServices::TF_LMLATTELEMENT*, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumTfLatticeElements*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumTfLatticeElements*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("56988052-47da-4a05-911a-e3d941f17145")]
  record IEnumTfLatticeElements, lpVtbl : IEnumTfLatticeElementsVtbl* do
    GUID = LibC::GUID.new(0x56988052_u32, 0x47da_u16, 0x4a05_u16, StaticArray[0x91_u8, 0x1a_u8, 0xe3_u8, 0xd9_u8, 0x41_u8, 0xf1_u8, 0x71_u8, 0x45_u8])
    def query_interface(this : IEnumTfLatticeElements*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumTfLatticeElements*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumTfLatticeElements*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumTfLatticeElements*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppEnum)
    end
    def next__(this : IEnumTfLatticeElements*, ulCount : UInt32, rgsElements : Win32cr::UI::TextServices::TF_LMLATTELEMENT*, pcFetched : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, ulCount, rgsElements, pcFetched)
    end
    def reset(this : IEnumTfLatticeElements*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumTfLatticeElements*, ulCount : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, ulCount)
    end

  end

  @[Extern]
  record ITfLMLatticeVtbl,
    query_interface : Proc(ITfLMLattice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfLMLattice*, UInt32),
    release : Proc(ITfLMLattice*, UInt32),
    query_type : Proc(ITfLMLattice*, LibC::GUID*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    enum_lattice_elements : Proc(ITfLMLattice*, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d4236675-a5bf-4570-9d42-5d6d7b02d59b")]
  record ITfLMLattice, lpVtbl : ITfLMLatticeVtbl* do
    GUID = LibC::GUID.new(0xd4236675_u32, 0xa5bf_u16, 0x4570_u16, StaticArray[0x9d_u8, 0x42_u8, 0x5d_u8, 0x6d_u8, 0x7b_u8, 0x2_u8, 0xd5_u8, 0x9b_u8])
    def query_interface(this : ITfLMLattice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfLMLattice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfLMLattice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def query_type(this : ITfLMLattice*, rguidType : LibC::GUID*, pfSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_type.call(this, rguidType, pfSupported)
    end
    def enum_lattice_elements(this : ITfLMLattice*, dwFrameStart : UInt32, rguidType : LibC::GUID*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_lattice_elements.call(this, dwFrameStart, rguidType, ppEnum)
    end

  end

  @[Extern]
  record ITfFnAdviseTextVtbl,
    query_interface : Proc(ITfFnAdviseText*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnAdviseText*, UInt32),
    release : Proc(ITfFnAdviseText*, UInt32),
    get_display_name : Proc(ITfFnAdviseText*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    on_text_update : Proc(ITfFnAdviseText*, Void*, UInt16*, Int32, Win32cr::Foundation::HRESULT),
    on_lattice_update : Proc(ITfFnAdviseText*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3527268b-7d53-4dd9-92b7-7296ae461249")]
  record ITfFnAdviseText, lpVtbl : ITfFnAdviseTextVtbl* do
    GUID = LibC::GUID.new(0x3527268b_u32, 0x7d53_u16, 0x4dd9_u16, StaticArray[0x92_u8, 0xb7_u8, 0x72_u8, 0x96_u8, 0xae_u8, 0x46_u8, 0x12_u8, 0x49_u8])
    def query_interface(this : ITfFnAdviseText*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnAdviseText*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnAdviseText*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnAdviseText*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def on_text_update(this : ITfFnAdviseText*, pRange : Void*, pchText : UInt16*, cch : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_text_update.call(this, pRange, pchText, cch)
    end
    def on_lattice_update(this : ITfFnAdviseText*, pRange : Void*, pLattice : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_lattice_update.call(this, pRange, pLattice)
    end

  end

  @[Extern]
  record ITfFnSearchCandidateProviderVtbl,
    query_interface : Proc(ITfFnSearchCandidateProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnSearchCandidateProvider*, UInt32),
    release : Proc(ITfFnSearchCandidateProvider*, UInt32),
    get_display_name : Proc(ITfFnSearchCandidateProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_search_candidates : Proc(ITfFnSearchCandidateProvider*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    set_result : Proc(ITfFnSearchCandidateProvider*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("87a2ad8f-f27b-4920-8501-67602280175d")]
  record ITfFnSearchCandidateProvider, lpVtbl : ITfFnSearchCandidateProviderVtbl* do
    GUID = LibC::GUID.new(0x87a2ad8f_u32, 0xf27b_u16, 0x4920_u16, StaticArray[0x85_u8, 0x1_u8, 0x67_u8, 0x60_u8, 0x22_u8, 0x80_u8, 0x17_u8, 0x5d_u8])
    def query_interface(this : ITfFnSearchCandidateProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnSearchCandidateProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnSearchCandidateProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnSearchCandidateProvider*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def get_search_candidates(this : ITfFnSearchCandidateProvider*, bstrQuery : Win32cr::Foundation::BSTR, bstrApplicationId : Win32cr::Foundation::BSTR, pplist : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_search_candidates.call(this, bstrQuery, bstrApplicationId, pplist)
    end
    def set_result(this : ITfFnSearchCandidateProvider*, bstrQuery : Win32cr::Foundation::BSTR, bstrApplicationID : Win32cr::Foundation::BSTR, bstrResult : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_result.call(this, bstrQuery, bstrApplicationID, bstrResult)
    end

  end

  @[Extern]
  record ITfIntegratableCandidateListUIElementVtbl,
    query_interface : Proc(ITfIntegratableCandidateListUIElement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfIntegratableCandidateListUIElement*, UInt32),
    release : Proc(ITfIntegratableCandidateListUIElement*, UInt32),
    set_integration_style : Proc(ITfIntegratableCandidateListUIElement*, LibC::GUID, Win32cr::Foundation::HRESULT),
    get_selection_style : Proc(ITfIntegratableCandidateListUIElement*, Win32cr::UI::TextServices::TfIntegratableCandidateListSelectionStyle*, Win32cr::Foundation::HRESULT),
    on_key_down : Proc(ITfIntegratableCandidateListUIElement*, Win32cr::Foundation::WPARAM, Win32cr::Foundation::LPARAM, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    show_candidate_numbers : Proc(ITfIntegratableCandidateListUIElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    finalize_exact_composition_string : Proc(ITfIntegratableCandidateListUIElement*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c7a6f54f-b180-416f-b2bf-7bf2e4683d7b")]
  record ITfIntegratableCandidateListUIElement, lpVtbl : ITfIntegratableCandidateListUIElementVtbl* do
    GUID = LibC::GUID.new(0xc7a6f54f_u32, 0xb180_u16, 0x416f_u16, StaticArray[0xb2_u8, 0xbf_u8, 0x7b_u8, 0xf2_u8, 0xe4_u8, 0x68_u8, 0x3d_u8, 0x7b_u8])
    def query_interface(this : ITfIntegratableCandidateListUIElement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfIntegratableCandidateListUIElement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfIntegratableCandidateListUIElement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_integration_style(this : ITfIntegratableCandidateListUIElement*, guidIntegrationStyle : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_integration_style.call(this, guidIntegrationStyle)
    end
    def get_selection_style(this : ITfIntegratableCandidateListUIElement*, ptfSelectionStyle : Win32cr::UI::TextServices::TfIntegratableCandidateListSelectionStyle*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection_style.call(this, ptfSelectionStyle)
    end
    def on_key_down(this : ITfIntegratableCandidateListUIElement*, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, pfEaten : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_key_down.call(this, wParam, lParam, pfEaten)
    end
    def show_candidate_numbers(this : ITfIntegratableCandidateListUIElement*, pfShow : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_candidate_numbers.call(this, pfShow)
    end
    def finalize_exact_composition_string(this : ITfIntegratableCandidateListUIElement*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.finalize_exact_composition_string.call(this)
    end

  end

  @[Extern]
  record ITfFnGetPreferredTouchKeyboardLayoutVtbl,
    query_interface : Proc(ITfFnGetPreferredTouchKeyboardLayout*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnGetPreferredTouchKeyboardLayout*, UInt32),
    release : Proc(ITfFnGetPreferredTouchKeyboardLayout*, UInt32),
    get_display_name : Proc(ITfFnGetPreferredTouchKeyboardLayout*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_layout : Proc(ITfFnGetPreferredTouchKeyboardLayout*, Win32cr::UI::TextServices::TKBLayoutType*, UInt16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5f309a41-590a-4acc-a97f-d8efff13fdfc")]
  record ITfFnGetPreferredTouchKeyboardLayout, lpVtbl : ITfFnGetPreferredTouchKeyboardLayoutVtbl* do
    GUID = LibC::GUID.new(0x5f309a41_u32, 0x590a_u16, 0x4acc_u16, StaticArray[0xa9_u8, 0x7f_u8, 0xd8_u8, 0xef_u8, 0xff_u8, 0x13_u8, 0xfd_u8, 0xfc_u8])
    def query_interface(this : ITfFnGetPreferredTouchKeyboardLayout*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnGetPreferredTouchKeyboardLayout*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnGetPreferredTouchKeyboardLayout*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnGetPreferredTouchKeyboardLayout*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def get_layout(this : ITfFnGetPreferredTouchKeyboardLayout*, pTKBLayoutType : Win32cr::UI::TextServices::TKBLayoutType*, pwPreferredLayoutId : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_layout.call(this, pTKBLayoutType, pwPreferredLayoutId)
    end

  end

  @[Extern]
  record ITfFnGetLinguisticAlternatesVtbl,
    query_interface : Proc(ITfFnGetLinguisticAlternates*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfFnGetLinguisticAlternates*, UInt32),
    release : Proc(ITfFnGetLinguisticAlternates*, UInt32),
    get_display_name : Proc(ITfFnGetLinguisticAlternates*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_alternates : Proc(ITfFnGetLinguisticAlternates*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ea163ce2-7a65-4506-82a3-c528215da64e")]
  record ITfFnGetLinguisticAlternates, lpVtbl : ITfFnGetLinguisticAlternatesVtbl* do
    GUID = LibC::GUID.new(0xea163ce2_u32, 0x7a65_u16, 0x4506_u16, StaticArray[0x82_u8, 0xa3_u8, 0xc5_u8, 0x28_u8, 0x21_u8, 0x5d_u8, 0xa6_u8, 0x4e_u8])
    def query_interface(this : ITfFnGetLinguisticAlternates*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfFnGetLinguisticAlternates*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfFnGetLinguisticAlternates*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_display_name(this : ITfFnGetLinguisticAlternates*, pbstrName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_display_name.call(this, pbstrName)
    end
    def get_alternates(this : ITfFnGetLinguisticAlternates*, pRange : Void*, ppCandidateList : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_alternates.call(this, pRange, ppCandidateList)
    end

  end

  @[Extern]
  record IUIManagerEventSinkVtbl,
    query_interface : Proc(IUIManagerEventSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIManagerEventSink*, UInt32),
    release : Proc(IUIManagerEventSink*, UInt32),
    on_window_opening : Proc(IUIManagerEventSink*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    on_window_opened : Proc(IUIManagerEventSink*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    on_window_updating : Proc(IUIManagerEventSink*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    on_window_updated : Proc(IUIManagerEventSink*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    on_window_closing : Proc(IUIManagerEventSink*, Win32cr::Foundation::HRESULT),
    on_window_closed : Proc(IUIManagerEventSink*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cd91d690-a7e8-4265-9b38-8bb3bbaba7de")]
  record IUIManagerEventSink, lpVtbl : IUIManagerEventSinkVtbl* do
    GUID = LibC::GUID.new(0xcd91d690_u32, 0xa7e8_u16, 0x4265_u16, StaticArray[0x9b_u8, 0x38_u8, 0x8b_u8, 0xb3_u8, 0xbb_u8, 0xab_u8, 0xa7_u8, 0xde_u8])
    def query_interface(this : IUIManagerEventSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIManagerEventSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIManagerEventSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_window_opening(this : IUIManagerEventSink*, prcBounds : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_window_opening.call(this, prcBounds)
    end
    def on_window_opened(this : IUIManagerEventSink*, prcBounds : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_window_opened.call(this, prcBounds)
    end
    def on_window_updating(this : IUIManagerEventSink*, prcUpdatedBounds : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_window_updating.call(this, prcUpdatedBounds)
    end
    def on_window_updated(this : IUIManagerEventSink*, prcUpdatedBounds : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_window_updated.call(this, prcUpdatedBounds)
    end
    def on_window_closing(this : IUIManagerEventSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_window_closing.call(this)
    end
    def on_window_closed(this : IUIManagerEventSink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_window_closed.call(this)
    end

  end

  @[Extern]
  record ITfInputScopeVtbl,
    query_interface : Proc(ITfInputScope*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfInputScope*, UInt32),
    release : Proc(ITfInputScope*, UInt32),
    get_input_scopes : Proc(ITfInputScope*, Win32cr::UI::TextServices::InputScope**, UInt32*, Win32cr::Foundation::HRESULT),
    get_phrase : Proc(ITfInputScope*, Win32cr::Foundation::BSTR**, UInt32*, Win32cr::Foundation::HRESULT),
    get_regular_expression : Proc(ITfInputScope*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_srgs : Proc(ITfInputScope*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_xml : Proc(ITfInputScope*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fde1eaee-6924-4cdf-91e7-da38cff5559d")]
  record ITfInputScope, lpVtbl : ITfInputScopeVtbl* do
    GUID = LibC::GUID.new(0xfde1eaee_u32, 0x6924_u16, 0x4cdf_u16, StaticArray[0x91_u8, 0xe7_u8, 0xda_u8, 0x38_u8, 0xcf_u8, 0xf5_u8, 0x55_u8, 0x9d_u8])
    def query_interface(this : ITfInputScope*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfInputScope*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfInputScope*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_input_scopes(this : ITfInputScope*, pprgInputScopes : Win32cr::UI::TextServices::InputScope**, pcCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_scopes.call(this, pprgInputScopes, pcCount)
    end
    def get_phrase(this : ITfInputScope*, ppbstrPhrases : Win32cr::Foundation::BSTR**, pcCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_phrase.call(this, ppbstrPhrases, pcCount)
    end
    def get_regular_expression(this : ITfInputScope*, pbstrRegExp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_regular_expression.call(this, pbstrRegExp)
    end
    def get_srgs(this : ITfInputScope*, pbstrSRGS : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_srgs.call(this, pbstrSRGS)
    end
    def get_xml(this : ITfInputScope*, pbstrXML : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xml.call(this, pbstrXML)
    end

  end

  @[Extern]
  record ITfInputScope2Vtbl,
    query_interface : Proc(ITfInputScope2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfInputScope2*, UInt32),
    release : Proc(ITfInputScope2*, UInt32),
    get_input_scopes : Proc(ITfInputScope2*, Win32cr::UI::TextServices::InputScope**, UInt32*, Win32cr::Foundation::HRESULT),
    get_phrase : Proc(ITfInputScope2*, Win32cr::Foundation::BSTR**, UInt32*, Win32cr::Foundation::HRESULT),
    get_regular_expression : Proc(ITfInputScope2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_srgs : Proc(ITfInputScope2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_xml : Proc(ITfInputScope2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    enum_word_list : Proc(ITfInputScope2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5731eaa0-6bc2-4681-a532-92fbb74d7c41")]
  record ITfInputScope2, lpVtbl : ITfInputScope2Vtbl* do
    GUID = LibC::GUID.new(0x5731eaa0_u32, 0x6bc2_u16, 0x4681_u16, StaticArray[0xa5_u8, 0x32_u8, 0x92_u8, 0xfb_u8, 0xb7_u8, 0x4d_u8, 0x7c_u8, 0x41_u8])
    def query_interface(this : ITfInputScope2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfInputScope2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfInputScope2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_input_scopes(this : ITfInputScope2*, pprgInputScopes : Win32cr::UI::TextServices::InputScope**, pcCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_input_scopes.call(this, pprgInputScopes, pcCount)
    end
    def get_phrase(this : ITfInputScope2*, ppbstrPhrases : Win32cr::Foundation::BSTR**, pcCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_phrase.call(this, ppbstrPhrases, pcCount)
    end
    def get_regular_expression(this : ITfInputScope2*, pbstrRegExp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_regular_expression.call(this, pbstrRegExp)
    end
    def get_srgs(this : ITfInputScope2*, pbstrSRGS : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_srgs.call(this, pbstrSRGS)
    end
    def get_xml(this : ITfInputScope2*, pbstrXML : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xml.call(this, pbstrXML)
    end
    def enum_word_list(this : ITfInputScope2*, ppEnumString : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enum_word_list.call(this, ppEnumString)
    end

  end

  @[Extern]
  record ITfMSAAControlVtbl,
    query_interface : Proc(ITfMSAAControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfMSAAControl*, UInt32),
    release : Proc(ITfMSAAControl*, UInt32),
    system_enable_msaa : Proc(ITfMSAAControl*, Win32cr::Foundation::HRESULT),
    system_disable_msaa : Proc(ITfMSAAControl*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b5f8fb3b-393f-4f7c-84cb-504924c2705a")]
  record ITfMSAAControl, lpVtbl : ITfMSAAControlVtbl* do
    GUID = LibC::GUID.new(0xb5f8fb3b_u32, 0x393f_u16, 0x4f7c_u16, StaticArray[0x84_u8, 0xcb_u8, 0x50_u8, 0x49_u8, 0x24_u8, 0xc2_u8, 0x70_u8, 0x5a_u8])
    def query_interface(this : ITfMSAAControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfMSAAControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfMSAAControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def system_enable_msaa(this : ITfMSAAControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.system_enable_msaa.call(this)
    end
    def system_disable_msaa(this : ITfMSAAControl*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.system_disable_msaa.call(this)
    end

  end

  @[Extern]
  record IInternalDocWrapVtbl,
    query_interface : Proc(IInternalDocWrap*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInternalDocWrap*, UInt32),
    release : Proc(IInternalDocWrap*, UInt32),
    notify_revoke : Proc(IInternalDocWrap*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e1aa6466-9db4-40ba-be03-77c38e8e60b2")]
  record IInternalDocWrap, lpVtbl : IInternalDocWrapVtbl* do
    GUID = LibC::GUID.new(0xe1aa6466_u32, 0x9db4_u16, 0x40ba_u16, StaticArray[0xbe_u8, 0x3_u8, 0x77_u8, 0xc3_u8, 0x8e_u8, 0x8e_u8, 0x60_u8, 0xb2_u8])
    def query_interface(this : IInternalDocWrap*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInternalDocWrap*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInternalDocWrap*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def notify_revoke(this : IInternalDocWrap*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.notify_revoke.call(this)
    end

  end

  @[Extern]
  record ITextStoreACPExVtbl,
    query_interface : Proc(ITextStoreACPEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextStoreACPEx*, UInt32),
    release : Proc(ITextStoreACPEx*, UInt32),
    scroll_to_rect : Proc(ITextStoreACPEx*, Int32, Int32, Win32cr::Foundation::RECT, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a2de3bc2-3d8e-11d3-81a9-f753fbe61a00")]
  record ITextStoreACPEx, lpVtbl : ITextStoreACPExVtbl* do
    GUID = LibC::GUID.new(0xa2de3bc2_u32, 0x3d8e_u16, 0x11d3_u16, StaticArray[0x81_u8, 0xa9_u8, 0xf7_u8, 0x53_u8, 0xfb_u8, 0xe6_u8, 0x1a_u8, 0x0_u8])
    def query_interface(this : ITextStoreACPEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextStoreACPEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextStoreACPEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def scroll_to_rect(this : ITextStoreACPEx*, acpStart : Int32, acpEnd : Int32, rc : Win32cr::Foundation::RECT, dwPosition : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll_to_rect.call(this, acpStart, acpEnd, rc, dwPosition)
    end

  end

  @[Extern]
  record ITextStoreAnchorExVtbl,
    query_interface : Proc(ITextStoreAnchorEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextStoreAnchorEx*, UInt32),
    release : Proc(ITextStoreAnchorEx*, UInt32),
    scroll_to_rect : Proc(ITextStoreAnchorEx*, Void*, Void*, Win32cr::Foundation::RECT, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a2de3bc1-3d8e-11d3-81a9-f753fbe61a00")]
  record ITextStoreAnchorEx, lpVtbl : ITextStoreAnchorExVtbl* do
    GUID = LibC::GUID.new(0xa2de3bc1_u32, 0x3d8e_u16, 0x11d3_u16, StaticArray[0x81_u8, 0xa9_u8, 0xf7_u8, 0x53_u8, 0xfb_u8, 0xe6_u8, 0x1a_u8, 0x0_u8])
    def query_interface(this : ITextStoreAnchorEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextStoreAnchorEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextStoreAnchorEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def scroll_to_rect(this : ITextStoreAnchorEx*, pStart : Void*, pEnd : Void*, rc : Win32cr::Foundation::RECT, dwPosition : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll_to_rect.call(this, pStart, pEnd, rc, dwPosition)
    end

  end

  @[Extern]
  record ITextStoreACPSinkExVtbl,
    query_interface : Proc(ITextStoreACPSinkEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextStoreACPSinkEx*, UInt32),
    release : Proc(ITextStoreACPSinkEx*, UInt32),
    on_text_change : Proc(ITextStoreACPSinkEx*, Win32cr::UI::TextServices::TEXT_STORE_TEXT_CHANGE_FLAGS, Win32cr::UI::TextServices::TS_TEXTCHANGE*, Win32cr::Foundation::HRESULT),
    on_selection_change : Proc(ITextStoreACPSinkEx*, Win32cr::Foundation::HRESULT),
    on_layout_change : Proc(ITextStoreACPSinkEx*, Win32cr::UI::TextServices::TsLayoutCode, UInt32, Win32cr::Foundation::HRESULT),
    on_status_change : Proc(ITextStoreACPSinkEx*, UInt32, Win32cr::Foundation::HRESULT),
    on_attrs_change : Proc(ITextStoreACPSinkEx*, Int32, Int32, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    on_lock_granted : Proc(ITextStoreACPSinkEx*, Win32cr::UI::TextServices::TEXT_STORE_LOCK_FLAGS, Win32cr::Foundation::HRESULT),
    on_start_edit_transaction : Proc(ITextStoreACPSinkEx*, Win32cr::Foundation::HRESULT),
    on_end_edit_transaction : Proc(ITextStoreACPSinkEx*, Win32cr::Foundation::HRESULT),
    on_disconnect : Proc(ITextStoreACPSinkEx*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2bdf9464-41e2-43e3-950c-a6865ba25cd4")]
  record ITextStoreACPSinkEx, lpVtbl : ITextStoreACPSinkExVtbl* do
    GUID = LibC::GUID.new(0x2bdf9464_u32, 0x41e2_u16, 0x43e3_u16, StaticArray[0x95_u8, 0xc_u8, 0xa6_u8, 0x86_u8, 0x5b_u8, 0xa2_u8, 0x5c_u8, 0xd4_u8])
    def query_interface(this : ITextStoreACPSinkEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextStoreACPSinkEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextStoreACPSinkEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_text_change(this : ITextStoreACPSinkEx*, dwFlags : Win32cr::UI::TextServices::TEXT_STORE_TEXT_CHANGE_FLAGS, pChange : Win32cr::UI::TextServices::TS_TEXTCHANGE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_text_change.call(this, dwFlags, pChange)
    end
    def on_selection_change(this : ITextStoreACPSinkEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_selection_change.call(this)
    end
    def on_layout_change(this : ITextStoreACPSinkEx*, lcode : Win32cr::UI::TextServices::TsLayoutCode, vcView : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_layout_change.call(this, lcode, vcView)
    end
    def on_status_change(this : ITextStoreACPSinkEx*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_status_change.call(this, dwFlags)
    end
    def on_attrs_change(this : ITextStoreACPSinkEx*, acpStart : Int32, acpEnd : Int32, cAttrs : UInt32, paAttrs : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_attrs_change.call(this, acpStart, acpEnd, cAttrs, paAttrs)
    end
    def on_lock_granted(this : ITextStoreACPSinkEx*, dwLockFlags : Win32cr::UI::TextServices::TEXT_STORE_LOCK_FLAGS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_lock_granted.call(this, dwLockFlags)
    end
    def on_start_edit_transaction(this : ITextStoreACPSinkEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_start_edit_transaction.call(this)
    end
    def on_end_edit_transaction(this : ITextStoreACPSinkEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_edit_transaction.call(this)
    end
    def on_disconnect(this : ITextStoreACPSinkEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_disconnect.call(this)
    end

  end

  @[Extern]
  record ITextStoreSinkAnchorExVtbl,
    query_interface : Proc(ITextStoreSinkAnchorEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextStoreSinkAnchorEx*, UInt32),
    release : Proc(ITextStoreSinkAnchorEx*, UInt32),
    on_text_change : Proc(ITextStoreSinkAnchorEx*, Win32cr::UI::TextServices::TEXT_STORE_CHANGE_FLAGS, Void*, Void*, Win32cr::Foundation::HRESULT),
    on_selection_change : Proc(ITextStoreSinkAnchorEx*, Win32cr::Foundation::HRESULT),
    on_layout_change : Proc(ITextStoreSinkAnchorEx*, Win32cr::UI::TextServices::TsLayoutCode, UInt32, Win32cr::Foundation::HRESULT),
    on_status_change : Proc(ITextStoreSinkAnchorEx*, UInt32, Win32cr::Foundation::HRESULT),
    on_attrs_change : Proc(ITextStoreSinkAnchorEx*, Void*, Void*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    on_lock_granted : Proc(ITextStoreSinkAnchorEx*, Win32cr::UI::TextServices::TEXT_STORE_LOCK_FLAGS, Win32cr::Foundation::HRESULT),
    on_start_edit_transaction : Proc(ITextStoreSinkAnchorEx*, Win32cr::Foundation::HRESULT),
    on_end_edit_transaction : Proc(ITextStoreSinkAnchorEx*, Win32cr::Foundation::HRESULT),
    on_disconnect : Proc(ITextStoreSinkAnchorEx*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("25642426-028d-4474-977b-111bb114fe3e")]
  record ITextStoreSinkAnchorEx, lpVtbl : ITextStoreSinkAnchorExVtbl* do
    GUID = LibC::GUID.new(0x25642426_u32, 0x28d_u16, 0x4474_u16, StaticArray[0x97_u8, 0x7b_u8, 0x11_u8, 0x1b_u8, 0xb1_u8, 0x14_u8, 0xfe_u8, 0x3e_u8])
    def query_interface(this : ITextStoreSinkAnchorEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextStoreSinkAnchorEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextStoreSinkAnchorEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def on_text_change(this : ITextStoreSinkAnchorEx*, dwFlags : Win32cr::UI::TextServices::TEXT_STORE_CHANGE_FLAGS, paStart : Void*, paEnd : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_text_change.call(this, dwFlags, paStart, paEnd)
    end
    def on_selection_change(this : ITextStoreSinkAnchorEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_selection_change.call(this)
    end
    def on_layout_change(this : ITextStoreSinkAnchorEx*, lcode : Win32cr::UI::TextServices::TsLayoutCode, vcView : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_layout_change.call(this, lcode, vcView)
    end
    def on_status_change(this : ITextStoreSinkAnchorEx*, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_status_change.call(this, dwFlags)
    end
    def on_attrs_change(this : ITextStoreSinkAnchorEx*, paStart : Void*, paEnd : Void*, cAttrs : UInt32, paAttrs : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_attrs_change.call(this, paStart, paEnd, cAttrs, paAttrs)
    end
    def on_lock_granted(this : ITextStoreSinkAnchorEx*, dwLockFlags : Win32cr::UI::TextServices::TEXT_STORE_LOCK_FLAGS) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_lock_granted.call(this, dwLockFlags)
    end
    def on_start_edit_transaction(this : ITextStoreSinkAnchorEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_start_edit_transaction.call(this)
    end
    def on_end_edit_transaction(this : ITextStoreSinkAnchorEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_end_edit_transaction.call(this)
    end
    def on_disconnect(this : ITextStoreSinkAnchorEx*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_disconnect.call(this)
    end

  end

  @[Extern]
  record IAccDictionaryVtbl,
    query_interface : Proc(IAccDictionary*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccDictionary*, UInt32),
    release : Proc(IAccDictionary*, UInt32),
    get_localized_string : Proc(IAccDictionary*, LibC::GUID*, UInt32, Win32cr::Foundation::BSTR*, UInt32*, Win32cr::Foundation::HRESULT),
    get_parent_term : Proc(IAccDictionary*, LibC::GUID*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_mnemonic_string : Proc(IAccDictionary*, LibC::GUID*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    lookup_mnemonic_term : Proc(IAccDictionary*, Win32cr::Foundation::BSTR, LibC::GUID*, Win32cr::Foundation::HRESULT),
    convert_value_to_string : Proc(IAccDictionary*, LibC::GUID*, UInt32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("1dc4cb5f-d737-474d-ade9-5ccfc9bc1cc9")]
  record IAccDictionary, lpVtbl : IAccDictionaryVtbl* do
    GUID = LibC::GUID.new(0x1dc4cb5f_u32, 0xd737_u16, 0x474d_u16, StaticArray[0xad_u8, 0xe9_u8, 0x5c_u8, 0xcf_u8, 0xc9_u8, 0xbc_u8, 0x1c_u8, 0xc9_u8])
    def query_interface(this : IAccDictionary*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccDictionary*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccDictionary*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_localized_string(this : IAccDictionary*, term : LibC::GUID*, lcid : UInt32, pResult : Win32cr::Foundation::BSTR*, plcid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_localized_string.call(this, term, lcid, pResult, plcid)
    end
    def get_parent_term(this : IAccDictionary*, term : LibC::GUID*, pParentTerm : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_term.call(this, term, pParentTerm)
    end
    def get_mnemonic_string(this : IAccDictionary*, term : LibC::GUID*, pResult : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_mnemonic_string.call(this, term, pResult)
    end
    def lookup_mnemonic_term(this : IAccDictionary*, bstrMnemonic : Win32cr::Foundation::BSTR, pTerm : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_mnemonic_term.call(this, bstrMnemonic, pTerm)
    end
    def convert_value_to_string(this : IAccDictionary*, term : LibC::GUID*, lcid : UInt32, varValue : Win32cr::System::Com::VARIANT, pbstrResult : Win32cr::Foundation::BSTR*, plcid : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_value_to_string.call(this, term, lcid, varValue, pbstrResult, plcid)
    end

  end

  @[Extern]
  record IVersionInfoVtbl,
    query_interface : Proc(IVersionInfo*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVersionInfo*, UInt32),
    release : Proc(IVersionInfo*, UInt32),
    get_subcomponent_count : Proc(IVersionInfo*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_implementation_id : Proc(IVersionInfo*, UInt32, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_build_version : Proc(IVersionInfo*, UInt32, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    get_component_description : Proc(IVersionInfo*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_instance_description : Proc(IVersionInfo*, UInt32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("401518ec-db00-4611-9b29-2a0e4b9afa85")]
  record IVersionInfo, lpVtbl : IVersionInfoVtbl* do
    GUID = LibC::GUID.new(0x401518ec_u32, 0xdb00_u16, 0x4611_u16, StaticArray[0x9b_u8, 0x29_u8, 0x2a_u8, 0xe_u8, 0x4b_u8, 0x9a_u8, 0xfa_u8, 0x85_u8])
    def query_interface(this : IVersionInfo*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVersionInfo*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVersionInfo*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_subcomponent_count(this : IVersionInfo*, ulSub : UInt32, ulCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_subcomponent_count.call(this, ulSub, ulCount)
    end
    def get_implementation_id(this : IVersionInfo*, ulSub : UInt32, implid : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_implementation_id.call(this, ulSub, implid)
    end
    def get_build_version(this : IVersionInfo*, ulSub : UInt32, pdwMajor : UInt32*, pdwMinor : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_build_version.call(this, ulSub, pdwMajor, pdwMinor)
    end
    def get_component_description(this : IVersionInfo*, ulSub : UInt32, pImplStr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_description.call(this, ulSub, pImplStr)
    end
    def get_instance_description(this : IVersionInfo*, ulSub : UInt32, pImplStr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_instance_description.call(this, ulSub, pImplStr)
    end

  end

  @[Extern]
  record ICoCreateLocallyVtbl,
    query_interface : Proc(ICoCreateLocally*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICoCreateLocally*, UInt32),
    release : Proc(ICoCreateLocally*, UInt32),
    co_create_locally : Proc(ICoCreateLocally*, LibC::GUID*, UInt32, LibC::GUID*, Void**, LibC::GUID*, Void*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("03de00aa-f272-41e3-99cb-03c5e8114ea0")]
  record ICoCreateLocally, lpVtbl : ICoCreateLocallyVtbl* do
    GUID = LibC::GUID.new(0x3de00aa_u32, 0xf272_u16, 0x41e3_u16, StaticArray[0x99_u8, 0xcb_u8, 0x3_u8, 0xc5_u8, 0xe8_u8, 0x11_u8, 0x4e_u8, 0xa0_u8])
    def query_interface(this : ICoCreateLocally*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICoCreateLocally*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICoCreateLocally*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def co_create_locally(this : ICoCreateLocally*, rclsid : LibC::GUID*, dwClsContext : UInt32, riid : LibC::GUID*, punk : Void**, riidParam : LibC::GUID*, punkParam : Void*, varParam : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.co_create_locally.call(this, rclsid, dwClsContext, riid, punk, riidParam, punkParam, varParam)
    end

  end

  @[Extern]
  record ICoCreatedLocallyVtbl,
    query_interface : Proc(ICoCreatedLocally*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICoCreatedLocally*, UInt32),
    release : Proc(ICoCreatedLocally*, UInt32),
    local_init : Proc(ICoCreatedLocally*, Void*, LibC::GUID*, Void*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0a53eb6c-1908-4742-8cff-2cee2e93f94c")]
  record ICoCreatedLocally, lpVtbl : ICoCreatedLocallyVtbl* do
    GUID = LibC::GUID.new(0xa53eb6c_u32, 0x1908_u16, 0x4742_u16, StaticArray[0x8c_u8, 0xff_u8, 0x2c_u8, 0xee_u8, 0x2e_u8, 0x93_u8, 0xf9_u8, 0x4c_u8])
    def query_interface(this : ICoCreatedLocally*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICoCreatedLocally*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICoCreatedLocally*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def local_init(this : ICoCreatedLocally*, punkLocalObject : Void*, riidParam : LibC::GUID*, punkParam : Void*, varParam : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.local_init.call(this, punkLocalObject, riidParam, punkParam, varParam)
    end

  end

  @[Extern]
  record IAccStoreVtbl,
    query_interface : Proc(IAccStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccStore*, UInt32),
    release : Proc(IAccStore*, UInt32),
    register : Proc(IAccStore*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    unregister : Proc(IAccStore*, Void*, Win32cr::Foundation::HRESULT),
    get_documents : Proc(IAccStore*, Void**, Win32cr::Foundation::HRESULT),
    lookup_by_hwnd : Proc(IAccStore*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    lookup_by_point : Proc(IAccStore*, Win32cr::Foundation::POINT, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    on_document_focus : Proc(IAccStore*, Void*, Win32cr::Foundation::HRESULT),
    get_focused : Proc(IAccStore*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e2cd4a63-2b72-4d48-b739-95e4765195ba")]
  record IAccStore, lpVtbl : IAccStoreVtbl* do
    GUID = LibC::GUID.new(0xe2cd4a63_u32, 0x2b72_u16, 0x4d48_u16, StaticArray[0xb7_u8, 0x39_u8, 0x95_u8, 0xe4_u8, 0x76_u8, 0x51_u8, 0x95_u8, 0xba_u8])
    def query_interface(this : IAccStore*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccStore*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccStore*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register(this : IAccStore*, riid : LibC::GUID*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register.call(this, riid, punk)
    end
    def unregister(this : IAccStore*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unregister.call(this, punk)
    end
    def get_documents(this : IAccStore*, enumUnknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_documents.call(this, enumUnknown)
    end
    def lookup_by_hwnd(this : IAccStore*, hWnd : Win32cr::Foundation::HWND, riid : LibC::GUID*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_by_hwnd.call(this, hWnd, riid, ppunk)
    end
    def lookup_by_point(this : IAccStore*, pt : Win32cr::Foundation::POINT, riid : LibC::GUID*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_by_point.call(this, pt, riid, ppunk)
    end
    def on_document_focus(this : IAccStore*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_document_focus.call(this, punk)
    end
    def get_focused(this : IAccStore*, riid : LibC::GUID*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focused.call(this, riid, ppunk)
    end

  end

  @[Extern]
  record IAccServerDocMgrVtbl,
    query_interface : Proc(IAccServerDocMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccServerDocMgr*, UInt32),
    release : Proc(IAccServerDocMgr*, UInt32),
    new_document : Proc(IAccServerDocMgr*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    revoke_document : Proc(IAccServerDocMgr*, Void*, Win32cr::Foundation::HRESULT),
    on_document_focus : Proc(IAccServerDocMgr*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ad7c73cf-6dd5-4855-abc2-b04bad5b9153")]
  record IAccServerDocMgr, lpVtbl : IAccServerDocMgrVtbl* do
    GUID = LibC::GUID.new(0xad7c73cf_u32, 0x6dd5_u16, 0x4855_u16, StaticArray[0xab_u8, 0xc2_u8, 0xb0_u8, 0x4b_u8, 0xad_u8, 0x5b_u8, 0x91_u8, 0x53_u8])
    def query_interface(this : IAccServerDocMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccServerDocMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccServerDocMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def new_document(this : IAccServerDocMgr*, riid : LibC::GUID*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.new_document.call(this, riid, punk)
    end
    def revoke_document(this : IAccServerDocMgr*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.revoke_document.call(this, punk)
    end
    def on_document_focus(this : IAccServerDocMgr*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_document_focus.call(this, punk)
    end

  end

  @[Extern]
  record IAccClientDocMgrVtbl,
    query_interface : Proc(IAccClientDocMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccClientDocMgr*, UInt32),
    release : Proc(IAccClientDocMgr*, UInt32),
    get_documents : Proc(IAccClientDocMgr*, Void**, Win32cr::Foundation::HRESULT),
    lookup_by_hwnd : Proc(IAccClientDocMgr*, Win32cr::Foundation::HWND, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    lookup_by_point : Proc(IAccClientDocMgr*, Win32cr::Foundation::POINT, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_focused : Proc(IAccClientDocMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4c896039-7b6d-49e6-a8c1-45116a98292b")]
  record IAccClientDocMgr, lpVtbl : IAccClientDocMgrVtbl* do
    GUID = LibC::GUID.new(0x4c896039_u32, 0x7b6d_u16, 0x49e6_u16, StaticArray[0xa8_u8, 0xc1_u8, 0x45_u8, 0x11_u8, 0x6a_u8, 0x98_u8, 0x29_u8, 0x2b_u8])
    def query_interface(this : IAccClientDocMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccClientDocMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccClientDocMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_documents(this : IAccClientDocMgr*, enumUnknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_documents.call(this, enumUnknown)
    end
    def lookup_by_hwnd(this : IAccClientDocMgr*, hWnd : Win32cr::Foundation::HWND, riid : LibC::GUID*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_by_hwnd.call(this, hWnd, riid, ppunk)
    end
    def lookup_by_point(this : IAccClientDocMgr*, pt : Win32cr::Foundation::POINT, riid : LibC::GUID*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.lookup_by_point.call(this, pt, riid, ppunk)
    end
    def get_focused(this : IAccClientDocMgr*, riid : LibC::GUID*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focused.call(this, riid, ppunk)
    end

  end

  @[Extern]
  record IDocWrapVtbl,
    query_interface : Proc(IDocWrap*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDocWrap*, UInt32),
    release : Proc(IDocWrap*, UInt32),
    set_doc : Proc(IDocWrap*, LibC::GUID*, Void*, Win32cr::Foundation::HRESULT),
    get_wrapped_doc : Proc(IDocWrap*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("dcd285fe-0be0-43bd-99c9-aaaec513c555")]
  record IDocWrap, lpVtbl : IDocWrapVtbl* do
    GUID = LibC::GUID.new(0xdcd285fe_u32, 0xbe0_u16, 0x43bd_u16, StaticArray[0x99_u8, 0xc9_u8, 0xaa_u8, 0xae_u8, 0xc5_u8, 0x13_u8, 0xc5_u8, 0x55_u8])
    def query_interface(this : IDocWrap*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDocWrap*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDocWrap*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_doc(this : IDocWrap*, riid : LibC::GUID*, punk : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_doc.call(this, riid, punk)
    end
    def get_wrapped_doc(this : IDocWrap*, riid : LibC::GUID*, ppunk : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_wrapped_doc.call(this, riid, ppunk)
    end

  end

  @[Extern]
  record IClonableWrapperVtbl,
    query_interface : Proc(IClonableWrapper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IClonableWrapper*, UInt32),
    release : Proc(IClonableWrapper*, UInt32),
    clone_new_wrapper : Proc(IClonableWrapper*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("b33e75ff-e84c-4dca-a25c-33b8dc003374")]
  record IClonableWrapper, lpVtbl : IClonableWrapperVtbl* do
    GUID = LibC::GUID.new(0xb33e75ff_u32, 0xe84c_u16, 0x4dca_u16, StaticArray[0xa2_u8, 0x5c_u8, 0x33_u8, 0xb8_u8, 0xdc_u8, 0x0_u8, 0x33_u8, 0x74_u8])
    def query_interface(this : IClonableWrapper*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IClonableWrapper*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IClonableWrapper*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone_new_wrapper(this : IClonableWrapper*, riid : LibC::GUID*, ppv : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone_new_wrapper.call(this, riid, ppv)
    end

  end

  @[Extern]
  record ITfSpeechUIServerVtbl,
    query_interface : Proc(ITfSpeechUIServer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITfSpeechUIServer*, UInt32),
    release : Proc(ITfSpeechUIServer*, UInt32),
    initialize__ : Proc(ITfSpeechUIServer*, Win32cr::Foundation::HRESULT),
    show_ui : Proc(ITfSpeechUIServer*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    update_balloon : Proc(ITfSpeechUIServer*, Win32cr::UI::TextServices::TfLBBalloonStyle, UInt16*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("90e9a944-9244-489f-a78f-de67afc013a7")]
  record ITfSpeechUIServer, lpVtbl : ITfSpeechUIServerVtbl* do
    GUID = LibC::GUID.new(0x90e9a944_u32, 0x9244_u16, 0x489f_u16, StaticArray[0xa7_u8, 0x8f_u8, 0xde_u8, 0x67_u8, 0xaf_u8, 0xc0_u8, 0x13_u8, 0xa7_u8])
    def query_interface(this : ITfSpeechUIServer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITfSpeechUIServer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITfSpeechUIServer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : ITfSpeechUIServer*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this)
    end
    def show_ui(this : ITfSpeechUIServer*, fShow : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_ui.call(this, fShow)
    end
    def update_balloon(this : ITfSpeechUIServer*, style : Win32cr::UI::TextServices::TfLBBalloonStyle, pch : UInt16*, cch : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_balloon.call(this, style, pch, cch)
    end

  end

  @[Link("msctfmonitor")]
  lib C
    fun DoMsCtfMonitor(dwFlags : UInt32, hEventForServiceStop : Win32cr::Foundation::HANDLE) : Win32cr::Foundation::BOOL

    fun InitLocalMsCtfMonitor(dwFlags : UInt32) : Win32cr::Foundation::HRESULT

    fun UninitLocalMsCtfMonitor : Win32cr::Foundation::HRESULT

  end
end