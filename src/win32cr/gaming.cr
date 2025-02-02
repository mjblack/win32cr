require "./system/com.cr"
require "./foundation.cr"
require "./system/win_rt.cr"

module Win32cr::Gaming
  extend self
  alias GameUICompletionRoutine = Proc(Win32cr::Foundation::HRESULT, Void*, Void)

  alias PlayerPickerUICompletionRoutine = Proc(Win32cr::Foundation::HRESULT, Void*, Win32cr::System::WinRT::HSTRING*, LibC::UIntPtrT, Void)

  ID_GDF_XML_STR = "__GDF_XML"
  ID_GDF_THUMBNAIL_STR = "__GDF_THUMBNAIL"

  CLSID_GameExplorer = LibC::GUID.new(0x9a5ea990_u32, 0x3034_u16, 0x4d6f_u16, StaticArray[0x91_u8, 0x28_u8, 0x1_u8, 0xf3_u8, 0xc6_u8, 0x10_u8, 0x22_u8, 0xbc_u8])

  CLSID_GameStatistics = LibC::GUID.new(0xdbc85a2c_u32, 0xc0dc_u16, 0x4961_u16, StaticArray[0xb6_u8, 0xe2_u8, 0xd2_u8, 0x8b_u8, 0x62_u8, 0xc1_u8, 0x1a_u8, 0xd4_u8])

  CLSID_XblIdpAuthManager = LibC::GUID.new(0xce23534b_u32, 0x56d8_u16, 0x4978_u16, StaticArray[0x86_u8, 0xa2_u8, 0x7e_u8, 0xe5_u8, 0x70_u8, 0x64_u8, 0x4_u8, 0x68_u8])

  CLSID_XblIdpAuthTokenResult = LibC::GUID.new(0x9f493441_u32, 0x744a_u16, 0x410c_u16, StaticArray[0xae_u8, 0x2b_u8, 0x9a_u8, 0x22_u8, 0xf7_u8, 0xc7_u8, 0x73_u8, 0x1f_u8])

  enum GAME_INSTALL_SCOPE
    GIS_NOT_INSTALLED = 1_i32
    GIS_CURRENT_USER = 2_i32
    GIS_ALL_USERS = 3_i32
  end
  enum GAMESTATS_OPEN_TYPE
    GAMESTATS_OPEN_OPENORCREATE = 0_i32
    GAMESTATS_OPEN_OPENONLY = 1_i32
  end
  enum GAMESTATS_OPEN_RESULT
    GAMESTATS_OPEN_CREATED = 0_i32
    GAMESTATS_OPEN_OPENED = 1_i32
  end
  enum GAMING_DEVICE_VENDOR_ID
    GAMING_DEVICE_VENDOR_ID_NONE = 0_i32
    GAMING_DEVICE_VENDOR_ID_MICROSOFT = -1024700366_i32
  end
  enum GAMING_DEVICE_DEVICE_ID
    GAMING_DEVICE_DEVICE_ID_NONE = 0_i32
    GAMING_DEVICE_DEVICE_ID_XBOX_ONE = 1988865574_i32
    GAMING_DEVICE_DEVICE_ID_XBOX_ONE_S = 712204761_i32
    GAMING_DEVICE_DEVICE_ID_XBOX_ONE_X = 1523980231_i32
    GAMING_DEVICE_DEVICE_ID_XBOX_ONE_X_DEVKIT = 284675555_i32
  end
  enum KnownGamingPrivileges
    XPRIVILEGE_BROADCAST = 190_i32
    XPRIVILEGE_VIEW_FRIENDS_LIST = 197_i32
    XPRIVILEGE_GAME_DVR = 198_i32
    XPRIVILEGE_SHARE_KINECT_CONTENT = 199_i32
    XPRIVILEGE_MULTIPLAYER_PARTIES = 203_i32
    XPRIVILEGE_COMMUNICATION_VOICE_INGAME = 205_i32
    XPRIVILEGE_COMMUNICATION_VOICE_SKYPE = 206_i32
    XPRIVILEGE_CLOUD_GAMING_MANAGE_SESSION = 207_i32
    XPRIVILEGE_CLOUD_GAMING_JOIN_SESSION = 208_i32
    XPRIVILEGE_CLOUD_SAVED_GAMES = 209_i32
    XPRIVILEGE_SHARE_CONTENT = 211_i32
    XPRIVILEGE_PREMIUM_CONTENT = 214_i32
    XPRIVILEGE_SUBSCRIPTION_CONTENT = 219_i32
    XPRIVILEGE_SOCIAL_NETWORK_SHARING = 220_i32
    XPRIVILEGE_PREMIUM_VIDEO = 224_i32
    XPRIVILEGE_VIDEO_COMMUNICATIONS = 235_i32
    XPRIVILEGE_PURCHASE_CONTENT = 245_i32
    XPRIVILEGE_USER_CREATED_CONTENT = 247_i32
    XPRIVILEGE_PROFILE_VIEWING = 249_i32
    XPRIVILEGE_COMMUNICATIONS = 252_i32
    XPRIVILEGE_MULTIPLAYER_SESSIONS = 254_i32
    XPRIVILEGE_ADD_FRIEND = 255_i32
  end
  enum XBL_IDP_AUTH_TOKEN_STATUS
    XBL_IDP_AUTH_TOKEN_STATUS_SUCCESS = 0_i32
    XBL_IDP_AUTH_TOKEN_STATUS_OFFLINE_SUCCESS = 1_i32
    XBL_IDP_AUTH_TOKEN_STATUS_NO_ACCOUNT_SET = 2_i32
    XBL_IDP_AUTH_TOKEN_STATUS_LOAD_MSA_ACCOUNT_FAILED = 3_i32
    XBL_IDP_AUTH_TOKEN_STATUS_XBOX_VETO = 4_i32
    XBL_IDP_AUTH_TOKEN_STATUS_MSA_INTERRUPT = 5_i32
    XBL_IDP_AUTH_TOKEN_STATUS_OFFLINE_NO_CONSENT = 6_i32
    XBL_IDP_AUTH_TOKEN_STATUS_VIEW_NOT_SET = 7_i32
    XBL_IDP_AUTH_TOKEN_STATUS_UNKNOWN = -1_i32
  end

  @[Extern]
  struct GAMING_DEVICE_MODEL_INFORMATION
    property vendorId : Win32cr::Gaming::GAMING_DEVICE_VENDOR_ID
    property deviceId : Win32cr::Gaming::GAMING_DEVICE_DEVICE_ID
    def initialize(@vendorId : Win32cr::Gaming::GAMING_DEVICE_VENDOR_ID, @deviceId : Win32cr::Gaming::GAMING_DEVICE_DEVICE_ID)
    end
  end

  @[Extern]
  record IGameExplorerVtbl,
    query_interface : Proc(IGameExplorer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGameExplorer*, UInt32),
    release : Proc(IGameExplorer*, UInt32),
    add_game : Proc(IGameExplorer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Gaming::GAME_INSTALL_SCOPE, LibC::GUID*, Win32cr::Foundation::HRESULT),
    remove_game : Proc(IGameExplorer*, LibC::GUID, Win32cr::Foundation::HRESULT),
    update_game : Proc(IGameExplorer*, LibC::GUID, Win32cr::Foundation::HRESULT),
    verify_access : Proc(IGameExplorer*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGameExplorer, lpVtbl : IGameExplorerVtbl* do
    GUID = LibC::GUID.new(0xe7b2fb72_u32, 0xd728_u16, 0x49b3_u16, StaticArray[0xa5_u8, 0xf2_u8, 0x18_u8, 0xeb_u8, 0xf5_u8, 0xf1_u8, 0x34_u8, 0x9e_u8])
    def query_interface(this : IGameExplorer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGameExplorer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGameExplorer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_game(this : IGameExplorer*, bstrGDFBinaryPath : Win32cr::Foundation::BSTR, bstrGameInstallDirectory : Win32cr::Foundation::BSTR, installScope : Win32cr::Gaming::GAME_INSTALL_SCOPE, pguidInstanceID : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_game.call(this, bstrGDFBinaryPath, bstrGameInstallDirectory, installScope, pguidInstanceID)
    end
    def remove_game(this : IGameExplorer*, guidInstanceID : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_game.call(this, guidInstanceID)
    end
    def update_game(this : IGameExplorer*, guidInstanceID : LibC::GUID) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.update_game.call(this, guidInstanceID)
    end
    def verify_access(this : IGameExplorer*, bstrGDFBinaryPath : Win32cr::Foundation::BSTR, pfHasAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.verify_access.call(this, bstrGDFBinaryPath, pfHasAccess)
    end

  end

  @[Extern]
  record IGameStatisticsVtbl,
    query_interface : Proc(IGameStatistics*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGameStatistics*, UInt32),
    release : Proc(IGameStatistics*, UInt32),
    get_max_category_length : Proc(IGameStatistics*, UInt32*, Win32cr::Foundation::HRESULT),
    get_max_name_length : Proc(IGameStatistics*, UInt32*, Win32cr::Foundation::HRESULT),
    get_max_value_length : Proc(IGameStatistics*, UInt32*, Win32cr::Foundation::HRESULT),
    get_max_categories : Proc(IGameStatistics*, UInt16*, Win32cr::Foundation::HRESULT),
    get_max_stats_per_category : Proc(IGameStatistics*, UInt16*, Win32cr::Foundation::HRESULT),
    set_category_title : Proc(IGameStatistics*, UInt16, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_category_title : Proc(IGameStatistics*, UInt16, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_statistic : Proc(IGameStatistics*, UInt16, UInt16, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_statistic : Proc(IGameStatistics*, UInt16, UInt16, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    save : Proc(IGameStatistics*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_last_played_category : Proc(IGameStatistics*, UInt32, Win32cr::Foundation::HRESULT),
    get_last_played_category : Proc(IGameStatistics*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGameStatistics, lpVtbl : IGameStatisticsVtbl* do
    GUID = LibC::GUID.new(0x3887c9ca_u32, 0x4a0_u16, 0x42ae_u16, StaticArray[0xbc_u8, 0x4c_u8, 0x5f_u8, 0xa6_u8, 0xc7_u8, 0x72_u8, 0x11_u8, 0x45_u8])
    def query_interface(this : IGameStatistics*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGameStatistics*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGameStatistics*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_max_category_length(this : IGameStatistics*, cch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_category_length.call(this, cch)
    end
    def get_max_name_length(this : IGameStatistics*, cch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_name_length.call(this, cch)
    end
    def get_max_value_length(this : IGameStatistics*, cch : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_value_length.call(this, cch)
    end
    def get_max_categories(this : IGameStatistics*, pMax : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_categories.call(this, pMax)
    end
    def get_max_stats_per_category(this : IGameStatistics*, pMax : UInt16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_max_stats_per_category.call(this, pMax)
    end
    def set_category_title(this : IGameStatistics*, categoryIndex : UInt16, title : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_category_title.call(this, categoryIndex, title)
    end
    def get_category_title(this : IGameStatistics*, categoryIndex : UInt16, pTitle : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_category_title.call(this, categoryIndex, pTitle)
    end
    def get_statistic(this : IGameStatistics*, categoryIndex : UInt16, statIndex : UInt16, pName : Win32cr::Foundation::PWSTR*, pValue : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_statistic.call(this, categoryIndex, statIndex, pName, pValue)
    end
    def set_statistic(this : IGameStatistics*, categoryIndex : UInt16, statIndex : UInt16, name : Win32cr::Foundation::PWSTR, value : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_statistic.call(this, categoryIndex, statIndex, name, value)
    end
    def save(this : IGameStatistics*, trackChanges : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this, trackChanges)
    end
    def set_last_played_category(this : IGameStatistics*, categoryIndex : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_last_played_category.call(this, categoryIndex)
    end
    def get_last_played_category(this : IGameStatistics*, pCategoryIndex : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_played_category.call(this, pCategoryIndex)
    end

  end

  @[Extern]
  record IGameStatisticsMgrVtbl,
    query_interface : Proc(IGameStatisticsMgr*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGameStatisticsMgr*, UInt32),
    release : Proc(IGameStatisticsMgr*, UInt32),
    get_game_statistics : Proc(IGameStatisticsMgr*, Win32cr::Foundation::PWSTR, Win32cr::Gaming::GAMESTATS_OPEN_TYPE, Win32cr::Gaming::GAMESTATS_OPEN_RESULT*, Void**, Win32cr::Foundation::HRESULT),
    remove_game_statistics : Proc(IGameStatisticsMgr*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGameStatisticsMgr, lpVtbl : IGameStatisticsMgrVtbl* do
    GUID = LibC::GUID.new(0xaff3ea11_u32, 0xe70e_u16, 0x407d_u16, StaticArray[0x95_u8, 0xdd_u8, 0x35_u8, 0xe6_u8, 0x12_u8, 0xc4_u8, 0x1c_u8, 0xe2_u8])
    def query_interface(this : IGameStatisticsMgr*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGameStatisticsMgr*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGameStatisticsMgr*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_game_statistics(this : IGameStatisticsMgr*, gdf_binary_path : Win32cr::Foundation::PWSTR, openType : Win32cr::Gaming::GAMESTATS_OPEN_TYPE, pOpenResult : Win32cr::Gaming::GAMESTATS_OPEN_RESULT*, ppiStats : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_game_statistics.call(this, gdf_binary_path, openType, pOpenResult, ppiStats)
    end
    def remove_game_statistics(this : IGameStatisticsMgr*, gdf_binary_path : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_game_statistics.call(this, gdf_binary_path)
    end

  end

  @[Extern]
  record IGameExplorer2Vtbl,
    query_interface : Proc(IGameExplorer2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGameExplorer2*, UInt32),
    release : Proc(IGameExplorer2*, UInt32),
    install_game : Proc(IGameExplorer2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Gaming::GAME_INSTALL_SCOPE, Win32cr::Foundation::HRESULT),
    uninstall_game : Proc(IGameExplorer2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    check_access : Proc(IGameExplorer2*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGameExplorer2, lpVtbl : IGameExplorer2Vtbl* do
    GUID = LibC::GUID.new(0x86874aa7_u32, 0xa1ed_u16, 0x450d_u16, StaticArray[0xa7_u8, 0xeb_u8, 0xb8_u8, 0x9e_u8, 0x20_u8, 0xb2_u8, 0xff_u8, 0xf3_u8])
    def query_interface(this : IGameExplorer2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGameExplorer2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGameExplorer2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def install_game(this : IGameExplorer2*, binaryGDFPath : Win32cr::Foundation::PWSTR, installDirectory : Win32cr::Foundation::PWSTR, installScope : Win32cr::Gaming::GAME_INSTALL_SCOPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_game.call(this, binaryGDFPath, installDirectory, installScope)
    end
    def uninstall_game(this : IGameExplorer2*, binaryGDFPath : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.uninstall_game.call(this, binaryGDFPath)
    end
    def check_access(this : IGameExplorer2*, binaryGDFPath : Win32cr::Foundation::PWSTR, pHasAccess : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_access.call(this, binaryGDFPath, pHasAccess)
    end

  end

  @[Extern]
  record IXblIdpAuthManagerVtbl,
    query_interface : Proc(IXblIdpAuthManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXblIdpAuthManager*, UInt32),
    release : Proc(IXblIdpAuthManager*, UInt32),
    set_gamer_account : Proc(IXblIdpAuthManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_gamer_account : Proc(IXblIdpAuthManager*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    set_app_view_initialized : Proc(IXblIdpAuthManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_environment : Proc(IXblIdpAuthManager*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_sandbox : Proc(IXblIdpAuthManager*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_token_and_signature_with_token_result : Proc(IXblIdpAuthManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, UInt8*, UInt32, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXblIdpAuthManager, lpVtbl : IXblIdpAuthManagerVtbl* do
    GUID = LibC::GUID.new(0xeb5ddb08_u32, 0x8bbf_u16, 0x449b_u16, StaticArray[0xac_u8, 0x21_u8, 0xb0_u8, 0x2d_u8, 0xde_u8, 0xb3_u8, 0xb1_u8, 0x36_u8])
    def query_interface(this : IXblIdpAuthManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXblIdpAuthManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXblIdpAuthManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_gamer_account(this : IXblIdpAuthManager*, msaAccountId : Win32cr::Foundation::PWSTR, xuid : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_gamer_account.call(this, msaAccountId, xuid)
    end
    def get_gamer_account(this : IXblIdpAuthManager*, msaAccountId : Win32cr::Foundation::PWSTR*, xuid : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamer_account.call(this, msaAccountId, xuid)
    end
    def set_app_view_initialized(this : IXblIdpAuthManager*, appSid : Win32cr::Foundation::PWSTR, msaAccountId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_app_view_initialized.call(this, appSid, msaAccountId)
    end
    def get_environment(this : IXblIdpAuthManager*, environment : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_environment.call(this, environment)
    end
    def get_sandbox(this : IXblIdpAuthManager*, sandbox : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sandbox.call(this, sandbox)
    end
    def get_token_and_signature_with_token_result(this : IXblIdpAuthManager*, msaAccountId : Win32cr::Foundation::PWSTR, appSid : Win32cr::Foundation::PWSTR, msaTarget : Win32cr::Foundation::PWSTR, msaPolicy : Win32cr::Foundation::PWSTR, httpMethod : Win32cr::Foundation::PWSTR, uri : Win32cr::Foundation::PWSTR, headers : Win32cr::Foundation::PWSTR, body : UInt8*, bodySize : UInt32, forceRefresh : Win32cr::Foundation::BOOL, result : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token_and_signature_with_token_result.call(this, msaAccountId, appSid, msaTarget, msaPolicy, httpMethod, uri, headers, body, bodySize, forceRefresh, result)
    end

  end

  @[Extern]
  record IXblIdpAuthTokenResultVtbl,
    query_interface : Proc(IXblIdpAuthTokenResult*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXblIdpAuthTokenResult*, UInt32),
    release : Proc(IXblIdpAuthTokenResult*, UInt32),
    get_status : Proc(IXblIdpAuthTokenResult*, Win32cr::Gaming::XBL_IDP_AUTH_TOKEN_STATUS*, Win32cr::Foundation::HRESULT),
    get_error_code : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::HRESULT*, Win32cr::Foundation::HRESULT),
    get_token : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_signature : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_sandbox : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_environment : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_msa_account_id : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_xuid : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_gamertag : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_age_group : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_privileges : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_msa_target : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_msa_policy : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_msa_app_id : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_redirect : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_message : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_help_id : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_enforcement_bans : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_restrictions : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_title_restrictions : Proc(IXblIdpAuthTokenResult*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXblIdpAuthTokenResult, lpVtbl : IXblIdpAuthTokenResultVtbl* do
    GUID = LibC::GUID.new(0x46ce0225_u32, 0xf267_u16, 0x4d68_u16, StaticArray[0xb2_u8, 0x99_u8, 0xb2_u8, 0x76_u8, 0x25_u8, 0x52_u8, 0xde_u8, 0xc1_u8])
    def query_interface(this : IXblIdpAuthTokenResult*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXblIdpAuthTokenResult*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXblIdpAuthTokenResult*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_status(this : IXblIdpAuthTokenResult*, status : Win32cr::Gaming::XBL_IDP_AUTH_TOKEN_STATUS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_status.call(this, status)
    end
    def get_error_code(this : IXblIdpAuthTokenResult*, errorCode : Win32cr::Foundation::HRESULT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_error_code.call(this, errorCode)
    end
    def get_token(this : IXblIdpAuthTokenResult*, token : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_token.call(this, token)
    end
    def get_signature(this : IXblIdpAuthTokenResult*, signature : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_signature.call(this, signature)
    end
    def get_sandbox(this : IXblIdpAuthTokenResult*, sandbox : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_sandbox.call(this, sandbox)
    end
    def get_environment(this : IXblIdpAuthTokenResult*, environment : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_environment.call(this, environment)
    end
    def get_msa_account_id(this : IXblIdpAuthTokenResult*, msaAccountId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_msa_account_id.call(this, msaAccountId)
    end
    def get_xuid(this : IXblIdpAuthTokenResult*, xuid : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_xuid.call(this, xuid)
    end
    def get_gamertag(this : IXblIdpAuthTokenResult*, gamertag : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_gamertag.call(this, gamertag)
    end
    def get_age_group(this : IXblIdpAuthTokenResult*, ageGroup : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_age_group.call(this, ageGroup)
    end
    def get_privileges(this : IXblIdpAuthTokenResult*, privileges : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_privileges.call(this, privileges)
    end
    def get_msa_target(this : IXblIdpAuthTokenResult*, msaTarget : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_msa_target.call(this, msaTarget)
    end
    def get_msa_policy(this : IXblIdpAuthTokenResult*, msaPolicy : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_msa_policy.call(this, msaPolicy)
    end
    def get_msa_app_id(this : IXblIdpAuthTokenResult*, msaAppId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_msa_app_id.call(this, msaAppId)
    end
    def get_redirect(this : IXblIdpAuthTokenResult*, redirect : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_redirect.call(this, redirect)
    end
    def get_message(this : IXblIdpAuthTokenResult*, message : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_message.call(this, message)
    end
    def get_help_id(this : IXblIdpAuthTokenResult*, helpId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_help_id.call(this, helpId)
    end
    def get_enforcement_bans(this : IXblIdpAuthTokenResult*, enforcementBans : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enforcement_bans.call(this, enforcementBans)
    end
    def get_restrictions(this : IXblIdpAuthTokenResult*, restrictions : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_restrictions.call(this, restrictions)
    end
    def get_title_restrictions(this : IXblIdpAuthTokenResult*, titleRestrictions : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_title_restrictions.call(this, titleRestrictions)
    end

  end

  @[Extern]
  record IXblIdpAuthTokenResult2Vtbl,
    query_interface : Proc(IXblIdpAuthTokenResult2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXblIdpAuthTokenResult2*, UInt32),
    release : Proc(IXblIdpAuthTokenResult2*, UInt32),
    get_modern_gamertag : Proc(IXblIdpAuthTokenResult2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_modern_gamertag_suffix : Proc(IXblIdpAuthTokenResult2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_unique_modern_gamertag : Proc(IXblIdpAuthTokenResult2*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXblIdpAuthTokenResult2, lpVtbl : IXblIdpAuthTokenResult2Vtbl* do
    GUID = LibC::GUID.new(0x75d760b0_u32, 0x60b9_u16, 0x412d_u16, StaticArray[0x99_u8, 0x4f_u8, 0x26_u8, 0xb2_u8, 0xcd_u8, 0x5f_u8, 0x78_u8, 0x12_u8])
    def query_interface(this : IXblIdpAuthTokenResult2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXblIdpAuthTokenResult2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXblIdpAuthTokenResult2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_modern_gamertag(this : IXblIdpAuthTokenResult2*, value : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_modern_gamertag.call(this, value)
    end
    def get_modern_gamertag_suffix(this : IXblIdpAuthTokenResult2*, value : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_modern_gamertag_suffix.call(this, value)
    end
    def get_unique_modern_gamertag(this : IXblIdpAuthTokenResult2*, value : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_unique_modern_gamertag.call(this, value)
    end

  end

  def hasExpandedResources(hasExpandedResources : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.HasExpandedResources(hasExpandedResources)
  end

  def getExpandedResourceExclusiveCpuCount(exclusiveCpuCount : UInt32*) : Win32cr::Foundation::HRESULT
    C.GetExpandedResourceExclusiveCpuCount(exclusiveCpuCount)
  end

  def releaseExclusiveCpuSets : Win32cr::Foundation::HRESULT
    C.ReleaseExclusiveCpuSets
  end

  def getGamingDeviceModelInformation(information : Win32cr::Gaming::GAMING_DEVICE_MODEL_INFORMATION*) : Win32cr::Foundation::HRESULT
    C.GetGamingDeviceModelInformation(information)
  end

  def showGameInviteUI(serviceConfigurationId : Win32cr::System::WinRT::HSTRING, sessionTemplateName : Win32cr::System::WinRT::HSTRING, sessionId : Win32cr::System::WinRT::HSTRING, invitationDisplayText : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowGameInviteUI(serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, completionRoutine, context)
  end

  def showPlayerPickerUI(promptDisplayText : Win32cr::System::WinRT::HSTRING, xuids : Win32cr::System::WinRT::HSTRING*, xuidsCount : LibC::UIntPtrT, preSelectedXuids : Win32cr::System::WinRT::HSTRING*, preSelectedXuidsCount : LibC::UIntPtrT, minSelectionCount : LibC::UIntPtrT, maxSelectionCount : LibC::UIntPtrT, completionRoutine : Win32cr::Gaming::PlayerPickerUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowPlayerPickerUI(promptDisplayText, xuids, xuidsCount, preSelectedXuids, preSelectedXuidsCount, minSelectionCount, maxSelectionCount, completionRoutine, context)
  end

  def showProfileCardUI(targetUserXuid : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowProfileCardUI(targetUserXuid, completionRoutine, context)
  end

  def showChangeFriendRelationshipUI(targetUserXuid : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowChangeFriendRelationshipUI(targetUserXuid, completionRoutine, context)
  end

  def showTitleAchievementsUI(titleId : UInt32, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowTitleAchievementsUI(titleId, completionRoutine, context)
  end

  def processPendingGameUI(waitForCompletion : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
    C.ProcessPendingGameUI(waitForCompletion)
  end

  def tryCancelPendingGameUI : Win32cr::Foundation::BOOL
    C.TryCancelPendingGameUI
  end

  def checkGamingPrivilegeWithUI(privilegeId : UInt32, scope : Win32cr::System::WinRT::HSTRING, policy : Win32cr::System::WinRT::HSTRING, friendlyMessage : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.CheckGamingPrivilegeWithUI(privilegeId, scope, policy, friendlyMessage, completionRoutine, context)
  end

  def checkGamingPrivilegeSilently(privilegeId : UInt32, scope : Win32cr::System::WinRT::HSTRING, policy : Win32cr::System::WinRT::HSTRING, hasPrivilege : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.CheckGamingPrivilegeSilently(privilegeId, scope, policy, hasPrivilege)
  end

  def showGameInviteUIForUser(user : Void*, serviceConfigurationId : Win32cr::System::WinRT::HSTRING, sessionTemplateName : Win32cr::System::WinRT::HSTRING, sessionId : Win32cr::System::WinRT::HSTRING, invitationDisplayText : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowGameInviteUIForUser(user, serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, completionRoutine, context)
  end

  def showPlayerPickerUIForUser(user : Void*, promptDisplayText : Win32cr::System::WinRT::HSTRING, xuids : Win32cr::System::WinRT::HSTRING*, xuidsCount : LibC::UIntPtrT, preSelectedXuids : Win32cr::System::WinRT::HSTRING*, preSelectedXuidsCount : LibC::UIntPtrT, minSelectionCount : LibC::UIntPtrT, maxSelectionCount : LibC::UIntPtrT, completionRoutine : Win32cr::Gaming::PlayerPickerUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowPlayerPickerUIForUser(user, promptDisplayText, xuids, xuidsCount, preSelectedXuids, preSelectedXuidsCount, minSelectionCount, maxSelectionCount, completionRoutine, context)
  end

  def showProfileCardUIForUser(user : Void*, targetUserXuid : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowProfileCardUIForUser(user, targetUserXuid, completionRoutine, context)
  end

  def showChangeFriendRelationshipUIForUser(user : Void*, targetUserXuid : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowChangeFriendRelationshipUIForUser(user, targetUserXuid, completionRoutine, context)
  end

  def showTitleAchievementsUIForUser(user : Void*, titleId : UInt32, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowTitleAchievementsUIForUser(user, titleId, completionRoutine, context)
  end

  def checkGamingPrivilegeWithUIForUser(user : Void*, privilegeId : UInt32, scope : Win32cr::System::WinRT::HSTRING, policy : Win32cr::System::WinRT::HSTRING, friendlyMessage : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.CheckGamingPrivilegeWithUIForUser(user, privilegeId, scope, policy, friendlyMessage, completionRoutine, context)
  end

  def checkGamingPrivilegeSilentlyForUser(user : Void*, privilegeId : UInt32, scope : Win32cr::System::WinRT::HSTRING, policy : Win32cr::System::WinRT::HSTRING, hasPrivilege : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
    C.CheckGamingPrivilegeSilentlyForUser(user, privilegeId, scope, policy, hasPrivilege)
  end

  def showGameInviteUIWithContext(serviceConfigurationId : Win32cr::System::WinRT::HSTRING, sessionTemplateName : Win32cr::System::WinRT::HSTRING, sessionId : Win32cr::System::WinRT::HSTRING, invitationDisplayText : Win32cr::System::WinRT::HSTRING, customActivationContext : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowGameInviteUIWithContext(serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, customActivationContext, completionRoutine, context)
  end

  def showGameInviteUIWithContextForUser(user : Void*, serviceConfigurationId : Win32cr::System::WinRT::HSTRING, sessionTemplateName : Win32cr::System::WinRT::HSTRING, sessionId : Win32cr::System::WinRT::HSTRING, invitationDisplayText : Win32cr::System::WinRT::HSTRING, customActivationContext : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowGameInviteUIWithContextForUser(user, serviceConfigurationId, sessionTemplateName, sessionId, invitationDisplayText, customActivationContext, completionRoutine, context)
  end

  def showGameInfoUI(titleId : UInt32, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowGameInfoUI(titleId, completionRoutine, context)
  end

  def showGameInfoUIForUser(user : Void*, titleId : UInt32, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowGameInfoUIForUser(user, titleId, completionRoutine, context)
  end

  def showFindFriendsUI(completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowFindFriendsUI(completionRoutine, context)
  end

  def showFindFriendsUIForUser(user : Void*, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowFindFriendsUIForUser(user, completionRoutine, context)
  end

  def showCustomizeUserProfileUI(completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowCustomizeUserProfileUI(completionRoutine, context)
  end

  def showCustomizeUserProfileUIForUser(user : Void*, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowCustomizeUserProfileUIForUser(user, completionRoutine, context)
  end

  def showUserSettingsUI(completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowUserSettingsUI(completionRoutine, context)
  end

  def showUserSettingsUIForUser(user : Void*, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT
    C.ShowUserSettingsUIForUser(user, completionRoutine, context)
  end

  lib C
    # :nodoc:
    fun HasExpandedResources(hasExpandedResources : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetExpandedResourceExclusiveCpuCount(exclusiveCpuCount : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ReleaseExclusiveCpuSets : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun GetGamingDeviceModelInformation(information : Win32cr::Gaming::GAMING_DEVICE_MODEL_INFORMATION*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowGameInviteUI(serviceConfigurationId : Win32cr::System::WinRT::HSTRING, sessionTemplateName : Win32cr::System::WinRT::HSTRING, sessionId : Win32cr::System::WinRT::HSTRING, invitationDisplayText : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowPlayerPickerUI(promptDisplayText : Win32cr::System::WinRT::HSTRING, xuids : Win32cr::System::WinRT::HSTRING*, xuidsCount : LibC::UIntPtrT, preSelectedXuids : Win32cr::System::WinRT::HSTRING*, preSelectedXuidsCount : LibC::UIntPtrT, minSelectionCount : LibC::UIntPtrT, maxSelectionCount : LibC::UIntPtrT, completionRoutine : Win32cr::Gaming::PlayerPickerUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowProfileCardUI(targetUserXuid : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowChangeFriendRelationshipUI(targetUserXuid : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowTitleAchievementsUI(titleId : UInt32, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ProcessPendingGameUI(waitForCompletion : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun TryCancelPendingGameUI : Win32cr::Foundation::BOOL

    # :nodoc:
    fun CheckGamingPrivilegeWithUI(privilegeId : UInt32, scope : Win32cr::System::WinRT::HSTRING, policy : Win32cr::System::WinRT::HSTRING, friendlyMessage : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CheckGamingPrivilegeSilently(privilegeId : UInt32, scope : Win32cr::System::WinRT::HSTRING, policy : Win32cr::System::WinRT::HSTRING, hasPrivilege : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowGameInviteUIForUser(user : Void*, serviceConfigurationId : Win32cr::System::WinRT::HSTRING, sessionTemplateName : Win32cr::System::WinRT::HSTRING, sessionId : Win32cr::System::WinRT::HSTRING, invitationDisplayText : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowPlayerPickerUIForUser(user : Void*, promptDisplayText : Win32cr::System::WinRT::HSTRING, xuids : Win32cr::System::WinRT::HSTRING*, xuidsCount : LibC::UIntPtrT, preSelectedXuids : Win32cr::System::WinRT::HSTRING*, preSelectedXuidsCount : LibC::UIntPtrT, minSelectionCount : LibC::UIntPtrT, maxSelectionCount : LibC::UIntPtrT, completionRoutine : Win32cr::Gaming::PlayerPickerUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowProfileCardUIForUser(user : Void*, targetUserXuid : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowChangeFriendRelationshipUIForUser(user : Void*, targetUserXuid : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowTitleAchievementsUIForUser(user : Void*, titleId : UInt32, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CheckGamingPrivilegeWithUIForUser(user : Void*, privilegeId : UInt32, scope : Win32cr::System::WinRT::HSTRING, policy : Win32cr::System::WinRT::HSTRING, friendlyMessage : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun CheckGamingPrivilegeSilentlyForUser(user : Void*, privilegeId : UInt32, scope : Win32cr::System::WinRT::HSTRING, policy : Win32cr::System::WinRT::HSTRING, hasPrivilege : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowGameInviteUIWithContext(serviceConfigurationId : Win32cr::System::WinRT::HSTRING, sessionTemplateName : Win32cr::System::WinRT::HSTRING, sessionId : Win32cr::System::WinRT::HSTRING, invitationDisplayText : Win32cr::System::WinRT::HSTRING, customActivationContext : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowGameInviteUIWithContextForUser(user : Void*, serviceConfigurationId : Win32cr::System::WinRT::HSTRING, sessionTemplateName : Win32cr::System::WinRT::HSTRING, sessionId : Win32cr::System::WinRT::HSTRING, invitationDisplayText : Win32cr::System::WinRT::HSTRING, customActivationContext : Win32cr::System::WinRT::HSTRING, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowGameInfoUI(titleId : UInt32, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowGameInfoUIForUser(user : Void*, titleId : UInt32, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowFindFriendsUI(completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowFindFriendsUIForUser(user : Void*, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowCustomizeUserProfileUI(completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowCustomizeUserProfileUIForUser(user : Void*, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowUserSettingsUI(completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun ShowUserSettingsUIForUser(user : Void*, completionRoutine : Win32cr::Gaming::GameUICompletionRoutine, context : Void*) : Win32cr::Foundation::HRESULT

  end
end