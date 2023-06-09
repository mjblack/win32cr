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
  CLSID_GameExplorer = LibC::GUID.new(0x9a5ea990_u32, 0x3034_u16, 0x4d6f_u16, StaticArray[0x91_u8, 0x28_u8, 0x1_u8, 0xf3_u8, 0xc6_u8, 0x10_u8, 0x22_u8, 0xbc_u8])
  CLSID_GameStatistics = LibC::GUID.new(0xdbc85a2c_u32, 0xc0dc_u16, 0x4961_u16, StaticArray[0xb6_u8, 0xe2_u8, 0xd2_u8, 0x8b_u8, 0x62_u8, 0xc1_u8, 0x1a_u8, 0xd4_u8])
  CLSID_XblIdpAuthManager = LibC::GUID.new(0xce23534b_u32, 0x56d8_u16, 0x4978_u16, StaticArray[0x86_u8, 0xa2_u8, 0x7e_u8, 0xe5_u8, 0x70_u8, 0x64_u8, 0x4_u8, 0x68_u8])
  CLSID_XblIdpAuthTokenResult = LibC::GUID.new(0x9f493441_u32, 0x744a_u16, 0x410c_u16, StaticArray[0xae_u8, 0x2b_u8, 0x9a_u8, 0x22_u8, 0xf7_u8, 0xc7_u8, 0x73_u8, 0x1f_u8])

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

  IGameExplorer_GUID = "e7b2fb72-d728-49b3-a5f2-18ebf5f1349e"
  IID_IGameExplorer = LibC::GUID.new(0xe7b2fb72_u32, 0xd728_u16, 0x49b3_u16, StaticArray[0xa5_u8, 0xf2_u8, 0x18_u8, 0xeb_u8, 0xf5_u8, 0xf1_u8, 0x34_u8, 0x9e_u8])
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

  IGameStatistics_GUID = "3887c9ca-04a0-42ae-bc4c-5fa6c7721145"
  IID_IGameStatistics = LibC::GUID.new(0x3887c9ca_u32, 0x4a0_u16, 0x42ae_u16, StaticArray[0xbc_u8, 0x4c_u8, 0x5f_u8, 0xa6_u8, 0xc7_u8, 0x72_u8, 0x11_u8, 0x45_u8])
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

  IGameStatisticsMgr_GUID = "aff3ea11-e70e-407d-95dd-35e612c41ce2"
  IID_IGameStatisticsMgr = LibC::GUID.new(0xaff3ea11_u32, 0xe70e_u16, 0x407d_u16, StaticArray[0x95_u8, 0xdd_u8, 0x35_u8, 0xe6_u8, 0x12_u8, 0xc4_u8, 0x1c_u8, 0xe2_u8])
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

  IGameExplorer2_GUID = "86874aa7-a1ed-450d-a7eb-b89e20b2fff3"
  IID_IGameExplorer2 = LibC::GUID.new(0x86874aa7_u32, 0xa1ed_u16, 0x450d_u16, StaticArray[0xa7_u8, 0xeb_u8, 0xb8_u8, 0x9e_u8, 0x20_u8, 0xb2_u8, 0xff_u8, 0xf3_u8])
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

  IXblIdpAuthManager_GUID = "eb5ddb08-8bbf-449b-ac21-b02ddeb3b136"
  IID_IXblIdpAuthManager = LibC::GUID.new(0xeb5ddb08_u32, 0x8bbf_u16, 0x449b_u16, StaticArray[0xac_u8, 0x21_u8, 0xb0_u8, 0x2d_u8, 0xde_u8, 0xb3_u8, 0xb1_u8, 0x36_u8])
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

  IXblIdpAuthTokenResult_GUID = "46ce0225-f267-4d68-b299-b2762552dec1"
  IID_IXblIdpAuthTokenResult = LibC::GUID.new(0x46ce0225_u32, 0xf267_u16, 0x4d68_u16, StaticArray[0xb2_u8, 0x99_u8, 0xb2_u8, 0x76_u8, 0x25_u8, 0x52_u8, 0xde_u8, 0xc1_u8])
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

  IXblIdpAuthTokenResult2_GUID = "75d760b0-60b9-412d-994f-26b2cd5f7812"
  IID_IXblIdpAuthTokenResult2 = LibC::GUID.new(0x75d760b0_u32, 0x60b9_u16, 0x412d_u16, StaticArray[0x99_u8, 0x4f_u8, 0x26_u8, 0xb2_u8, 0xcd_u8, 0x5f_u8, 0x78_u8, 0x12_u8])
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
struct LibWin32::IGameExplorer
  def query_interface(this : IGameExplorer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGameExplorer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGameExplorer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_game(this : IGameExplorer*, bstrgdfbinarypath : UInt8*, bstrgameinstalldirectory : UInt8*, installscope : GAME_INSTALL_SCOPE, pguidinstanceid : Guid*) : HRESULT
    @lpVtbl.value.add_game.call(this, bstrgdfbinarypath, bstrgameinstalldirectory, installscope, pguidinstanceid)
  end
  def remove_game(this : IGameExplorer*, guidinstanceid : Guid) : HRESULT
    @lpVtbl.value.remove_game.call(this, guidinstanceid)
  end
  def update_game(this : IGameExplorer*, guidinstanceid : Guid) : HRESULT
    @lpVtbl.value.update_game.call(this, guidinstanceid)
  end
  def verify_access(this : IGameExplorer*, bstrgdfbinarypath : UInt8*, pfhasaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.verify_access.call(this, bstrgdfbinarypath, pfhasaccess)
  end
end
struct LibWin32::IGameStatistics
  def query_interface(this : IGameStatistics*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGameStatistics*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGameStatistics*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_max_category_length(this : IGameStatistics*, cch : UInt32*) : HRESULT
    @lpVtbl.value.get_max_category_length.call(this, cch)
  end
  def get_max_name_length(this : IGameStatistics*, cch : UInt32*) : HRESULT
    @lpVtbl.value.get_max_name_length.call(this, cch)
  end
  def get_max_value_length(this : IGameStatistics*, cch : UInt32*) : HRESULT
    @lpVtbl.value.get_max_value_length.call(this, cch)
  end
  def get_max_categories(this : IGameStatistics*, pmax : UInt16*) : HRESULT
    @lpVtbl.value.get_max_categories.call(this, pmax)
  end
  def get_max_stats_per_category(this : IGameStatistics*, pmax : UInt16*) : HRESULT
    @lpVtbl.value.get_max_stats_per_category.call(this, pmax)
  end
  def set_category_title(this : IGameStatistics*, categoryindex : UInt16, title : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_category_title.call(this, categoryindex, title)
  end
  def get_category_title(this : IGameStatistics*, categoryindex : UInt16, ptitle : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_category_title.call(this, categoryindex, ptitle)
  end
  def get_statistic(this : IGameStatistics*, categoryindex : UInt16, statindex : UInt16, pname : LibC::LPWSTR*, pvalue : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_statistic.call(this, categoryindex, statindex, pname, pvalue)
  end
  def set_statistic(this : IGameStatistics*, categoryindex : UInt16, statindex : UInt16, name : LibC::LPWSTR, value : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_statistic.call(this, categoryindex, statindex, name, value)
  end
  def save(this : IGameStatistics*, trackchanges : LibC::BOOL) : HRESULT
    @lpVtbl.value.save.call(this, trackchanges)
  end
  def set_last_played_category(this : IGameStatistics*, categoryindex : UInt32) : HRESULT
    @lpVtbl.value.set_last_played_category.call(this, categoryindex)
  end
  def get_last_played_category(this : IGameStatistics*, pcategoryindex : UInt32*) : HRESULT
    @lpVtbl.value.get_last_played_category.call(this, pcategoryindex)
  end
end
struct LibWin32::IGameStatisticsMgr
  def query_interface(this : IGameStatisticsMgr*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGameStatisticsMgr*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGameStatisticsMgr*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_game_statistics(this : IGameStatisticsMgr*, gdfbinarypath : LibC::LPWSTR, opentype : GAMESTATS_OPEN_TYPE, popenresult : GAMESTATS_OPEN_RESULT*, ppistats : IGameStatistics*) : HRESULT
    @lpVtbl.value.get_game_statistics.call(this, gdfbinarypath, opentype, popenresult, ppistats)
  end
  def remove_game_statistics(this : IGameStatisticsMgr*, gdfbinarypath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.remove_game_statistics.call(this, gdfbinarypath)
  end
end
struct LibWin32::IGameExplorer2
  def query_interface(this : IGameExplorer2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGameExplorer2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGameExplorer2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def install_game(this : IGameExplorer2*, binarygdfpath : LibC::LPWSTR, installdirectory : LibC::LPWSTR, installscope : GAME_INSTALL_SCOPE) : HRESULT
    @lpVtbl.value.install_game.call(this, binarygdfpath, installdirectory, installscope)
  end
  def uninstall_game(this : IGameExplorer2*, binarygdfpath : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.uninstall_game.call(this, binarygdfpath)
  end
  def check_access(this : IGameExplorer2*, binarygdfpath : LibC::LPWSTR, phasaccess : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_access.call(this, binarygdfpath, phasaccess)
  end
end
struct LibWin32::IXblIdpAuthManager
  def query_interface(this : IXblIdpAuthManager*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXblIdpAuthManager*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXblIdpAuthManager*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_gamer_account(this : IXblIdpAuthManager*, msaaccountid : LibC::LPWSTR, xuid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_gamer_account.call(this, msaaccountid, xuid)
  end
  def get_gamer_account(this : IXblIdpAuthManager*, msaaccountid : LibC::LPWSTR*, xuid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_gamer_account.call(this, msaaccountid, xuid)
  end
  def set_app_view_initialized(this : IXblIdpAuthManager*, appsid : LibC::LPWSTR, msaaccountid : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_app_view_initialized.call(this, appsid, msaaccountid)
  end
  def get_environment(this : IXblIdpAuthManager*, environment : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_environment.call(this, environment)
  end
  def get_sandbox(this : IXblIdpAuthManager*, sandbox : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_sandbox.call(this, sandbox)
  end
  def get_token_and_signature_with_token_result(this : IXblIdpAuthManager*, msaaccountid : LibC::LPWSTR, appsid : LibC::LPWSTR, msatarget : LibC::LPWSTR, msapolicy : LibC::LPWSTR, httpmethod : LibC::LPWSTR, uri : LibC::LPWSTR, headers : LibC::LPWSTR, body : UInt8*, bodysize : UInt32, forcerefresh : LibC::BOOL, result : IXblIdpAuthTokenResult*) : HRESULT
    @lpVtbl.value.get_token_and_signature_with_token_result.call(this, msaaccountid, appsid, msatarget, msapolicy, httpmethod, uri, headers, body, bodysize, forcerefresh, result)
  end
end
struct LibWin32::IXblIdpAuthTokenResult
  def query_interface(this : IXblIdpAuthTokenResult*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXblIdpAuthTokenResult*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXblIdpAuthTokenResult*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_status(this : IXblIdpAuthTokenResult*, status : XBL_IDP_AUTH_TOKEN_STATUS*) : HRESULT
    @lpVtbl.value.get_status.call(this, status)
  end
  def get_error_code(this : IXblIdpAuthTokenResult*, errorcode : HRESULT*) : HRESULT
    @lpVtbl.value.get_error_code.call(this, errorcode)
  end
  def get_token(this : IXblIdpAuthTokenResult*, token : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_token.call(this, token)
  end
  def get_signature(this : IXblIdpAuthTokenResult*, signature : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_signature.call(this, signature)
  end
  def get_sandbox(this : IXblIdpAuthTokenResult*, sandbox : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_sandbox.call(this, sandbox)
  end
  def get_environment(this : IXblIdpAuthTokenResult*, environment : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_environment.call(this, environment)
  end
  def get_msa_account_id(this : IXblIdpAuthTokenResult*, msaaccountid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_msa_account_id.call(this, msaaccountid)
  end
  def get_xuid(this : IXblIdpAuthTokenResult*, xuid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_xuid.call(this, xuid)
  end
  def get_gamertag(this : IXblIdpAuthTokenResult*, gamertag : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_gamertag.call(this, gamertag)
  end
  def get_age_group(this : IXblIdpAuthTokenResult*, agegroup : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_age_group.call(this, agegroup)
  end
  def get_privileges(this : IXblIdpAuthTokenResult*, privileges : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_privileges.call(this, privileges)
  end
  def get_msa_target(this : IXblIdpAuthTokenResult*, msatarget : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_msa_target.call(this, msatarget)
  end
  def get_msa_policy(this : IXblIdpAuthTokenResult*, msapolicy : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_msa_policy.call(this, msapolicy)
  end
  def get_msa_app_id(this : IXblIdpAuthTokenResult*, msaappid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_msa_app_id.call(this, msaappid)
  end
  def get_redirect(this : IXblIdpAuthTokenResult*, redirect : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_redirect.call(this, redirect)
  end
  def get_message(this : IXblIdpAuthTokenResult*, message : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_message.call(this, message)
  end
  def get_help_id(this : IXblIdpAuthTokenResult*, helpid : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_help_id.call(this, helpid)
  end
  def get_enforcement_bans(this : IXblIdpAuthTokenResult*, enforcementbans : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_enforcement_bans.call(this, enforcementbans)
  end
  def get_restrictions(this : IXblIdpAuthTokenResult*, restrictions : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_restrictions.call(this, restrictions)
  end
  def get_title_restrictions(this : IXblIdpAuthTokenResult*, titlerestrictions : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_title_restrictions.call(this, titlerestrictions)
  end
end
struct LibWin32::IXblIdpAuthTokenResult2
  def query_interface(this : IXblIdpAuthTokenResult2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXblIdpAuthTokenResult2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXblIdpAuthTokenResult2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_modern_gamertag(this : IXblIdpAuthTokenResult2*, value : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_modern_gamertag.call(this, value)
  end
  def get_modern_gamertag_suffix(this : IXblIdpAuthTokenResult2*, value : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_modern_gamertag_suffix.call(this, value)
  end
  def get_unique_modern_gamertag(this : IXblIdpAuthTokenResult2*, value : LibC::LPWSTR*) : HRESULT
    @lpVtbl.value.get_unique_modern_gamertag.call(this, value)
  end
end
