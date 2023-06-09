require "../system/com.cr"
require "../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  DISPID_EVENT_ON_STATE_CHANGED = 5_u32
  DISPID_EVENT_ON_TERMINATION = 6_u32
  DISPID_EVENT_ON_CONTEXT_DATA = 7_u32
  DISPID_EVENT_ON_SEND_ERROR = 8_u32
  CLSID_RendezvousApplication = LibC::GUID.new(0xb7e019a_u32, 0xb5de_u16, 0x47fa_u16, StaticArray[0x89_u8, 0x66_u8, 0x90_u8, 0x82_u8, 0xf8_u8, 0x2f_u8, 0xb1_u8, 0x92_u8])


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

  IRendezvousSession_GUID = "9ba4b1dd-8b0c-48b7-9e7c-2f25857c8df5"
  IID_IRendezvousSession = LibC::GUID.new(0x9ba4b1dd_u32, 0x8b0c_u16, 0x48b7_u16, StaticArray[0x9e_u8, 0x7c_u8, 0x2f_u8, 0x25_u8, 0x85_u8, 0x7c_u8, 0x8d_u8, 0xf5_u8])
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

  DRendezvousSessionEvents_GUID = "3fa19cf8-64c4-4f53-ae60-635b3806eca6"
  IID_DRendezvousSessionEvents = LibC::GUID.new(0x3fa19cf8_u32, 0x64c4_u16, 0x4f53_u16, StaticArray[0xae_u8, 0x60_u8, 0x63_u8, 0x5b_u8, 0x38_u8, 0x6_u8, 0xec_u8, 0xa6_u8])
  struct DRendezvousSessionEvents
    lpVtbl : DRendezvousSessionEventsVTbl*
  end

  struct IRendezvousApplicationVTbl
    query_interface : Proc(IRendezvousApplication*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRendezvousApplication*, UInt32)
    release : Proc(IRendezvousApplication*, UInt32)
    set_rendezvous_session : Proc(IRendezvousApplication*, IUnknown, HRESULT)
  end

  IRendezvousApplication_GUID = "4f4d070b-a275-49fb-b10d-8ec26387b50d"
  IID_IRendezvousApplication = LibC::GUID.new(0x4f4d070b_u32, 0xa275_u16, 0x49fb_u16, StaticArray[0xb1_u8, 0xd_u8, 0x8e_u8, 0xc2_u8, 0x63_u8, 0x87_u8, 0xb5_u8, 0xd_u8])
  struct IRendezvousApplication
    lpVtbl : IRendezvousApplicationVTbl*
  end

end
struct LibWin32::IRendezvousSession
  def query_interface(this : IRendezvousSession*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRendezvousSession*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRendezvousSession*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_state(this : IRendezvousSession*, psessionstate : RENDEZVOUS_SESSION_STATE*) : HRESULT
    @lpVtbl.value.get_state.call(this, psessionstate)
  end
  def get_remote_user(this : IRendezvousSession*, bstrusername : UInt8**) : HRESULT
    @lpVtbl.value.get_remote_user.call(this, bstrusername)
  end
  def get_flags(this : IRendezvousSession*, pflags : Int32*) : HRESULT
    @lpVtbl.value.get_flags.call(this, pflags)
  end
  def send_context_data(this : IRendezvousSession*, bstrdata : UInt8*) : HRESULT
    @lpVtbl.value.send_context_data.call(this, bstrdata)
  end
  def terminate(this : IRendezvousSession*, hr : HRESULT, bstrappdata : UInt8*) : HRESULT
    @lpVtbl.value.terminate.call(this, hr, bstrappdata)
  end
end
struct LibWin32::DRendezvousSessionEvents
  def query_interface(this : DRendezvousSessionEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : DRendezvousSessionEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : DRendezvousSessionEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : DRendezvousSessionEvents*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : DRendezvousSessionEvents*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : DRendezvousSessionEvents*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : DRendezvousSessionEvents*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
end
struct LibWin32::IRendezvousApplication
  def query_interface(this : IRendezvousApplication*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRendezvousApplication*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRendezvousApplication*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_rendezvous_session(this : IRendezvousApplication*, prendezvoussession : IUnknown) : HRESULT
    @lpVtbl.value.set_rendezvous_session.call(this, prendezvoussession)
  end
end
