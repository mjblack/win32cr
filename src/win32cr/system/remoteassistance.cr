require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
{% end %}
lib LibWin32
  DISPID_EVENT_ON_STATE_CHANGED = 5_u32
  DISPID_EVENT_ON_TERMINATION = 6_u32
  DISPID_EVENT_ON_CONTEXT_DATA = 7_u32
  DISPID_EVENT_ON_SEND_ERROR = 8_u32
  RendezvousApplication = LibC::GUID.new(0xb7e019a_u32, 0xb5de_u16, 0x47fa_u16, StaticArray[0x89_u8, 0x66_u8, 0x90_u8, 0x82_u8, 0xf8_u8, 0x2f_u8, 0xb1_u8, 0x92_u8])


  enum RENDEZVOUS_SESSION_STATE : Int32
    RSS_UNKNOWN = 0
    RSS_READY = 1
    RSS_INVITATION = 2
    RSS_ACCEPTED = 3
    RSS_CONNECTED = 4
    RSS_CANCELLED = 5
    RSS_DECLINED = 6
    RSS_TERMINATED = 7
  end

  enum RENDEZVOUS_SESSION_FLAGS : Int32
    RSF_NONE = 0
    RSF_INVITER = 1
    RSF_INVITEE = 2
    RSF_ORIGINAL_INVITER = 4
    RSF_REMOTE_LEGACYSESSION = 8
    RSF_REMOTE_WIN7SESSION = 16
  end


  struct IRendezvousSessionVTbl
    query_interface : Proc(IRendezvousSession*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRendezvousSession*, UInt32)
    release : Proc(IRendezvousSession*, UInt32)
    get_state : Proc(IRendezvousSession*, RENDEZVOUS_SESSION_STATE*, HRESULT)
    get_remote_user : Proc(IRendezvousSession*, UInt8**, HRESULT)
    get_flags : Proc(IRendezvousSession*, Int32*, HRESULT)
    send_context_data : Proc(IRendezvousSession*, UInt8*, HRESULT)
    terminate : Proc(IRendezvousSession*, HRESULT, UInt8*, HRESULT)
  end

  IRendezvousSession_GUID = LibC::GUID.new("9ba4b1dd-8b0c-48b7-9e7c-2f25857c8df5")
  CLSID_IRendezvousSession = "9ba4b1dd-8b0c-48b7-9e7c-2f25857c8df5"
  struct IRendezvousSession
    lpVtbl : IRendezvousSessionVTbl*
  end

  struct DRendezvousSessionEventsVTbl
    query_interface : Proc(DRendezvousSessionEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(DRendezvousSessionEvents*, UInt32)
    release : Proc(DRendezvousSessionEvents*, UInt32)
    get_type_info_count : Proc(DRendezvousSessionEvents*, UInt32*, HRESULT)
    get_type_info : Proc(DRendezvousSessionEvents*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(DRendezvousSessionEvents*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(DRendezvousSessionEvents*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
  end

  DRendezvousSessionEvents_GUID = LibC::GUID.new("3fa19cf8-64c4-4f53-ae60-635b3806eca6")
  CLSID_DRendezvousSessionEvents = "3fa19cf8-64c4-4f53-ae60-635b3806eca6"
  struct DRendezvousSessionEvents
    lpVtbl : DRendezvousSessionEventsVTbl*
  end

  struct IRendezvousApplicationVTbl
    query_interface : Proc(IRendezvousApplication*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRendezvousApplication*, UInt32)
    release : Proc(IRendezvousApplication*, UInt32)
    set_rendezvous_session : Proc(IRendezvousApplication*, IUnknown, HRESULT)
  end

  IRendezvousApplication_GUID = LibC::GUID.new("4f4d070b-a275-49fb-b10d-8ec26387b50d")
  CLSID_IRendezvousApplication = "4f4d070b-a275-49fb-b10d-8ec26387b50d"
  struct IRendezvousApplication
    lpVtbl : IRendezvousApplicationVTbl*
  end

end
