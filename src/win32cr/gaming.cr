require "./system/com.cr"
require "./foundation.cr"
require "./system/winrt.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:onecore.dll")]
{% else %}
@[Link("onecore")]
{% end %}
lib LibWin32
  GameExplorer = LibC::GUID.new(0x9a5ea990_u32, 0x3034_u16, 0x4d6f_u16, StaticArray[0x91_u8, 0x28_u8, 0x1_u8, 0xf3_u8, 0xc6_u8, 0x10_u8, 0x22_u8, 0xbc_u8])
  GameStatistics = LibC::GUID.new(0xdbc85a2c_u32, 0xc0dc_u16, 0x4961_u16, StaticArray[0xb6_u8, 0xe2_u8, 0xd2_u8, 0x8b_u8, 0x62_u8, 0xc1_u8, 0x1a_u8, 0xd4_u8])
  XblIdpAuthManager = LibC::GUID.new(0xce23534b_u32, 0x56d8_u16, 0x4978_u16, StaticArray[0x86_u8, 0xa2_u8, 0x7e_u8, 0xe5_u8, 0x70_u8, 0x64_u8, 0x4_u8, 0x68_u8])
  XblIdpAuthTokenResult = LibC::GUID.new(0x9f493441_u32, 0x744a_u16, 0x410c_u16, StaticArray[0xae_u8, 0x2b_u8, 0x9a_u8, 0x22_u8, 0xf7_u8, 0xc7_u8, 0x73_u8, 0x1f_u8])

  alias GameUICompletionRoutine = Proc(HRESULT, Void*, Void)
  alias PlayerPickerUICompletionRoutine = Proc(HRESULT, Void*, HSTRING*, LibC::UINT_PTR, Void)


  enum GAME_INSTALL_SCOPE : Int32
    GIS_NOT_INSTALLED = 1
    GIS_CURRENT_USER = 2
    GIS_ALL_USERS = 3
  end

  enum GAMESTATS_OPEN_TYPE : Int32
    GAMESTATS_OPEN_OPENORCREATE = 0
    GAMESTATS_OPEN_OPENONLY = 1
  end

  enum GAMESTATS_OPEN_RESULT : Int32
    GAMESTATS_OPEN_CREATED = 0
    GAMESTATS_OPEN_OPENED = 1
  end

  enum GAMING_DEVICE_VENDOR_ID : Int32
    GAMING_DEVICE_VENDOR_ID_NONE = 0
    GAMING_DEVICE_VENDOR_ID_MICROSOFT = -1024700366
  end

  enum GAMING_DEVICE_DEVICE_ID : Int32
    GAMING_DEVICE_DEVICE_ID_NONE = 0
    GAMING_DEVICE_DEVICE_ID_XBOX_ONE = 1988865574
    GAMING_DEVICE_DEVICE_ID_XBOX_ONE_S = 712204761
    GAMING_DEVICE_DEVICE_ID_XBOX_ONE_X = 1523980231
    GAMING_DEVICE_DEVICE_ID_XBOX_ONE_X_DEVKIT = 284675555
  end

  enum KnownGamingPrivileges : Int32
    XPRIVILEGE_BROADCAST = 190
    XPRIVILEGE_VIEW_FRIENDS_LIST = 197
    XPRIVILEGE_GAME_DVR = 198
    XPRIVILEGE_SHARE_KINECT_CONTENT = 199
    XPRIVILEGE_MULTIPLAYER_PARTIES = 203
    XPRIVILEGE_COMMUNICATION_VOICE_INGAME = 205
    XPRIVILEGE_COMMUNICATION_VOICE_SKYPE = 206
    XPRIVILEGE_CLOUD_GAMING_MANAGE_SESSION = 207
    XPRIVILEGE_CLOUD_GAMING_JOIN_SESSION = 208
    XPRIVILEGE_CLOUD_SAVED_GAMES = 209
    XPRIVILEGE_SHARE_CONTENT = 211
    XPRIVILEGE_PREMIUM_CONTENT = 214
    XPRIVILEGE_SUBSCRIPTION_CONTENT = 219
    XPRIVILEGE_SOCIAL_NETWORK_SHARING = 220
    XPRIVILEGE_PREMIUM_VIDEO = 224
    XPRIVILEGE_VIDEO_COMMUNICATIONS = 235
    XPRIVILEGE_PURCHASE_CONTENT = 245
    XPRIVILEGE_USER_CREATED_CONTENT = 247
    XPRIVILEGE_PROFILE_VIEWING = 249
    XPRIVILEGE_COMMUNICATIONS = 252
    XPRIVILEGE_MULTIPLAYER_SESSIONS = 254
    XPRIVILEGE_ADD_FRIEND = 255
  end

  enum XBL_IDP_AUTH_TOKEN_STATUS : Int32
    XBL_IDP_AUTH_TOKEN_STATUS_SUCCESS = 0
    XBL_IDP_AUTH_TOKEN_STATUS_OFFLINE_SUCCESS = 1
    XBL_IDP_AUTH_TOKEN_STATUS_NO_ACCOUNT_SET = 2
    XBL_IDP_AUTH_TOKEN_STATUS_LOAD_MSA_ACCOUNT_FAILED = 3
    XBL_IDP_AUTH_TOKEN_STATUS_XBOX_VETO = 4
    XBL_IDP_AUTH_TOKEN_STATUS_MSA_INTERRUPT = 5
    XBL_IDP_AUTH_TOKEN_STATUS_OFFLINE_NO_CONSENT = 6
    XBL_IDP_AUTH_TOKEN_STATUS_VIEW_NOT_SET = 7
    XBL_IDP_AUTH_TOKEN_STATUS_UNKNOWN = -1
  end

  struct GAMING_DEVICE_MODEL_INFORMATION
    vendor_id : GAMING_DEVICE_VENDOR_ID
    device_id : GAMING_DEVICE_DEVICE_ID
  end


  struct IGameExplorerVTbl
    query_interface : Proc(IGameExplorer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGameExplorer*, UInt32)
    release : Proc(IGameExplorer*, UInt32)
    add_game : Proc(IGameExplorer*, UInt8*, UInt8*, GAME_INSTALL_SCOPE, Guid*, HRESULT)
    remove_game : Proc(IGameExplorer*, Guid, HRESULT)
    update_game : Proc(IGameExplorer*, Guid, HRESULT)
    verify_access : Proc(IGameExplorer*, UInt8*, LibC::BOOL*, HRESULT)
  end

  struct IGameExplorer
    lpVtbl : IGameExplorerVTbl*
  end

  struct IGameStatisticsVTbl
    query_interface : Proc(IGameStatistics*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGameStatistics*, UInt32)
    release : Proc(IGameStatistics*, UInt32)
    get_max_category_length : Proc(IGameStatistics*, UInt32*, HRESULT)
    get_max_name_length : Proc(IGameStatistics*, UInt32*, HRESULT)
    get_max_value_length : Proc(IGameStatistics*, UInt32*, HRESULT)
    get_max_categories : Proc(IGameStatistics*, UInt16*, HRESULT)
    get_max_stats_per_category : Proc(IGameStatistics*, UInt16*, HRESULT)
    set_category_title : Proc(IGameStatistics*, UInt16, LibC::LPWSTR, HRESULT)
    get_category_title : Proc(IGameStatistics*, UInt16, LibC::LPWSTR*, HRESULT)
    get_statistic : Proc(IGameStatistics*, UInt16, UInt16, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    set_statistic : Proc(IGameStatistics*, UInt16, UInt16, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    save : Proc(IGameStatistics*, LibC::BOOL, HRESULT)
    set_last_played_category : Proc(IGameStatistics*, UInt32, HRESULT)
    get_last_played_category : Proc(IGameStatistics*, UInt32*, HRESULT)
  end

  struct IGameStatistics
    lpVtbl : IGameStatisticsVTbl*
  end

  struct IGameStatisticsMgrVTbl
    query_interface : Proc(IGameStatisticsMgr*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGameStatisticsMgr*, UInt32)
    release : Proc(IGameStatisticsMgr*, UInt32)
    get_game_statistics : Proc(IGameStatisticsMgr*, LibC::LPWSTR, GAMESTATS_OPEN_TYPE, GAMESTATS_OPEN_RESULT*, IGameStatistics*, HRESULT)
    remove_game_statistics : Proc(IGameStatisticsMgr*, LibC::LPWSTR, HRESULT)
  end

  struct IGameStatisticsMgr
    lpVtbl : IGameStatisticsMgrVTbl*
  end

  struct IGameExplorer2VTbl
    query_interface : Proc(IGameExplorer2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGameExplorer2*, UInt32)
    release : Proc(IGameExplorer2*, UInt32)
    install_game : Proc(IGameExplorer2*, LibC::LPWSTR, LibC::LPWSTR, GAME_INSTALL_SCOPE, HRESULT)
    uninstall_game : Proc(IGameExplorer2*, LibC::LPWSTR, HRESULT)
    check_access : Proc(IGameExplorer2*, LibC::LPWSTR, LibC::BOOL*, HRESULT)
  end

  struct IGameExplorer2
    lpVtbl : IGameExplorer2VTbl*
  end

  struct IXblIdpAuthManagerVTbl
    query_interface : Proc(IXblIdpAuthManager*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXblIdpAuthManager*, UInt32)
    release : Proc(IXblIdpAuthManager*, UInt32)
    set_gamer_account : Proc(IXblIdpAuthManager*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_gamer_account : Proc(IXblIdpAuthManager*, LibC::LPWSTR*, LibC::LPWSTR*, HRESULT)
    set_app_view_initialized : Proc(IXblIdpAuthManager*, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
    get_environment : Proc(IXblIdpAuthManager*, LibC::LPWSTR*, HRESULT)
    get_sandbox : Proc(IXblIdpAuthManager*, LibC::LPWSTR*, HRESULT)
    get_token_and_signature_with_token_result : Proc(IXblIdpAuthManager*, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, LibC::LPWSTR, UInt8*, UInt32, LibC::BOOL, IXblIdpAuthTokenResult*, HRESULT)
  end

  struct IXblIdpAuthManager
    lpVtbl : IXblIdpAuthManagerVTbl*
  end

  struct IXblIdpAuthTokenResultVTbl
    query_interface : Proc(IXblIdpAuthTokenResult*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXblIdpAuthTokenResult*, UInt32)
    release : Proc(IXblIdpAuthTokenResult*, UInt32)
    get_status : Proc(IXblIdpAuthTokenResult*, XBL_IDP_AUTH_TOKEN_STATUS*, HRESULT)
    get_error_code : Proc(IXblIdpAuthTokenResult*, HRESULT*, HRESULT)
    get_token : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_signature : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_sandbox : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_environment : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_msa_account_id : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_xuid : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_gamertag : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_age_group : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_privileges : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_msa_target : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_msa_policy : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_msa_app_id : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_redirect : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_message : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_help_id : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_enforcement_bans : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_restrictions : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
    get_title_restrictions : Proc(IXblIdpAuthTokenResult*, LibC::LPWSTR*, HRESULT)
  end

  struct IXblIdpAuthTokenResult
    lpVtbl : IXblIdpAuthTokenResultVTbl*
  end

  struct IXblIdpAuthTokenResult2VTbl
    query_interface : Proc(IXblIdpAuthTokenResult2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXblIdpAuthTokenResult2*, UInt32)
    release : Proc(IXblIdpAuthTokenResult2*, UInt32)
    get_modern_gamertag : Proc(IXblIdpAuthTokenResult2*, LibC::LPWSTR*, HRESULT)
    get_modern_gamertag_suffix : Proc(IXblIdpAuthTokenResult2*, LibC::LPWSTR*, HRESULT)
    get_unique_modern_gamertag : Proc(IXblIdpAuthTokenResult2*, LibC::LPWSTR*, HRESULT)
  end

  struct IXblIdpAuthTokenResult2
    lpVtbl : IXblIdpAuthTokenResult2VTbl*
  end


  # Params # hasexpandedresources : LibC::BOOL* [In]
  fun HasExpandedResources(hasexpandedresources : LibC::BOOL*) : HRESULT

  # Params # exclusivecpucount : UInt32* [In]
  fun GetExpandedResourceExclusiveCpuCount(exclusivecpucount : UInt32*) : HRESULT

  # Params # 
  fun ReleaseExclusiveCpuSets : HRESULT

  # Params # information : GAMING_DEVICE_MODEL_INFORMATION* [In]
  fun GetGamingDeviceModelInformation(information : GAMING_DEVICE_MODEL_INFORMATION*) : HRESULT

  # Params # serviceconfigurationid : HSTRING [In],sessiontemplatename : HSTRING [In],sessionid : HSTRING [In],invitationdisplaytext : HSTRING [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowGameInviteUI(serviceconfigurationid : HSTRING, sessiontemplatename : HSTRING, sessionid : HSTRING, invitationdisplaytext : HSTRING, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # promptdisplaytext : HSTRING [In],xuids : HSTRING* [In],xuidscount : LibC::UINT_PTR [In],preselectedxuids : HSTRING* [In],preselectedxuidscount : LibC::UINT_PTR [In],minselectioncount : LibC::UINT_PTR [In],maxselectioncount : LibC::UINT_PTR [In],completionroutine : PlayerPickerUICompletionRoutine [In],context : Void* [In]
  fun ShowPlayerPickerUI(promptdisplaytext : HSTRING, xuids : HSTRING*, xuidscount : LibC::UINT_PTR, preselectedxuids : HSTRING*, preselectedxuidscount : LibC::UINT_PTR, minselectioncount : LibC::UINT_PTR, maxselectioncount : LibC::UINT_PTR, completionroutine : PlayerPickerUICompletionRoutine, context : Void*) : HRESULT

  # Params # targetuserxuid : HSTRING [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowProfileCardUI(targetuserxuid : HSTRING, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # targetuserxuid : HSTRING [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowChangeFriendRelationshipUI(targetuserxuid : HSTRING, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # titleid : UInt32 [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowTitleAchievementsUI(titleid : UInt32, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # waitforcompletion : LibC::BOOL [In]
  fun ProcessPendingGameUI(waitforcompletion : LibC::BOOL) : HRESULT

  # Params # 
  fun TryCancelPendingGameUI : LibC::BOOL

  # Params # privilegeid : UInt32 [In],scope : HSTRING [In],policy : HSTRING [In],friendlymessage : HSTRING [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun CheckGamingPrivilegeWithUI(privilegeid : UInt32, scope : HSTRING, policy : HSTRING, friendlymessage : HSTRING, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # privilegeid : UInt32 [In],scope : HSTRING [In],policy : HSTRING [In],hasprivilege : LibC::BOOL* [In]
  fun CheckGamingPrivilegeSilently(privilegeid : UInt32, scope : HSTRING, policy : HSTRING, hasprivilege : LibC::BOOL*) : HRESULT

  # Params # user : IInspectable [In],serviceconfigurationid : HSTRING [In],sessiontemplatename : HSTRING [In],sessionid : HSTRING [In],invitationdisplaytext : HSTRING [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowGameInviteUIForUser(user : IInspectable, serviceconfigurationid : HSTRING, sessiontemplatename : HSTRING, sessionid : HSTRING, invitationdisplaytext : HSTRING, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # user : IInspectable [In],promptdisplaytext : HSTRING [In],xuids : HSTRING* [In],xuidscount : LibC::UINT_PTR [In],preselectedxuids : HSTRING* [In],preselectedxuidscount : LibC::UINT_PTR [In],minselectioncount : LibC::UINT_PTR [In],maxselectioncount : LibC::UINT_PTR [In],completionroutine : PlayerPickerUICompletionRoutine [In],context : Void* [In]
  fun ShowPlayerPickerUIForUser(user : IInspectable, promptdisplaytext : HSTRING, xuids : HSTRING*, xuidscount : LibC::UINT_PTR, preselectedxuids : HSTRING*, preselectedxuidscount : LibC::UINT_PTR, minselectioncount : LibC::UINT_PTR, maxselectioncount : LibC::UINT_PTR, completionroutine : PlayerPickerUICompletionRoutine, context : Void*) : HRESULT

  # Params # user : IInspectable [In],targetuserxuid : HSTRING [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowProfileCardUIForUser(user : IInspectable, targetuserxuid : HSTRING, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # user : IInspectable [In],targetuserxuid : HSTRING [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowChangeFriendRelationshipUIForUser(user : IInspectable, targetuserxuid : HSTRING, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # user : IInspectable [In],titleid : UInt32 [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowTitleAchievementsUIForUser(user : IInspectable, titleid : UInt32, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # user : IInspectable [In],privilegeid : UInt32 [In],scope : HSTRING [In],policy : HSTRING [In],friendlymessage : HSTRING [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun CheckGamingPrivilegeWithUIForUser(user : IInspectable, privilegeid : UInt32, scope : HSTRING, policy : HSTRING, friendlymessage : HSTRING, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # user : IInspectable [In],privilegeid : UInt32 [In],scope : HSTRING [In],policy : HSTRING [In],hasprivilege : LibC::BOOL* [In]
  fun CheckGamingPrivilegeSilentlyForUser(user : IInspectable, privilegeid : UInt32, scope : HSTRING, policy : HSTRING, hasprivilege : LibC::BOOL*) : HRESULT

  # Params # serviceconfigurationid : HSTRING [In],sessiontemplatename : HSTRING [In],sessionid : HSTRING [In],invitationdisplaytext : HSTRING [In],customactivationcontext : HSTRING [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowGameInviteUIWithContext(serviceconfigurationid : HSTRING, sessiontemplatename : HSTRING, sessionid : HSTRING, invitationdisplaytext : HSTRING, customactivationcontext : HSTRING, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # user : IInspectable [In],serviceconfigurationid : HSTRING [In],sessiontemplatename : HSTRING [In],sessionid : HSTRING [In],invitationdisplaytext : HSTRING [In],customactivationcontext : HSTRING [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowGameInviteUIWithContextForUser(user : IInspectable, serviceconfigurationid : HSTRING, sessiontemplatename : HSTRING, sessionid : HSTRING, invitationdisplaytext : HSTRING, customactivationcontext : HSTRING, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # titleid : UInt32 [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowGameInfoUI(titleid : UInt32, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # user : IInspectable [In],titleid : UInt32 [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowGameInfoUIForUser(user : IInspectable, titleid : UInt32, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowFindFriendsUI(completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # user : IInspectable [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowFindFriendsUIForUser(user : IInspectable, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowCustomizeUserProfileUI(completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # user : IInspectable [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowCustomizeUserProfileUIForUser(user : IInspectable, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowUserSettingsUI(completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT

  # Params # user : IInspectable [In],completionroutine : GameUICompletionRoutine [In],context : Void* [In]
  fun ShowUserSettingsUIForUser(user : IInspectable, completionroutine : GameUICompletionRoutine, context : Void*) : HRESULT
end
