require "./com.cr"
require "./../foundation.cr"

module Win32cr::System::RemoteAssistance
  DISPID_EVENT_ON_STATE_CHANGED = 5_u32
  DISPID_EVENT_ON_TERMINATION = 6_u32
  DISPID_EVENT_ON_CONTEXT_DATA = 7_u32
  DISPID_EVENT_ON_SEND_ERROR = 8_u32

  CLSID_RendezvousApplication = LibC::GUID.new(0xb7e019a_u32, 0xb5de_u16, 0x47fa_u16, StaticArray[0x89_u8, 0x66_u8, 0x90_u8, 0x82_u8, 0xf8_u8, 0x2f_u8, 0xb1_u8, 0x92_u8])

  enum RENDEZVOUS_SESSION_STATE
    RSS_UNKNOWN = 0_i32
    RSS_READY = 1_i32
    RSS_INVITATION = 2_i32
    RSS_ACCEPTED = 3_i32
    RSS_CONNECTED = 4_i32
    RSS_CANCELLED = 5_i32
    RSS_DECLINED = 6_i32
    RSS_TERMINATED = 7_i32
  end
  enum RENDEZVOUS_SESSION_FLAGS
    RSF_NONE = 0_i32
    RSF_INVITER = 1_i32
    RSF_INVITEE = 2_i32
    RSF_ORIGINAL_INVITER = 4_i32
    RSF_REMOTE_LEGACYSESSION = 8_i32
    RSF_REMOTE_WIN7SESSION = 16_i32
  end

  @[Extern]
  record IRendezvousSessionVtbl,
    query_interface : Proc(IRendezvousSession*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRendezvousSession*, UInt32),
    release : Proc(IRendezvousSession*, UInt32),
    get_State : Proc(IRendezvousSession*, Win32cr::System::RemoteAssistance::RENDEZVOUS_SESSION_STATE*, Win32cr::Foundation::HRESULT),
    get_RemoteUser : Proc(IRendezvousSession*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Flags : Proc(IRendezvousSession*, Int32*, Win32cr::Foundation::HRESULT),
    send_context_data : Proc(IRendezvousSession*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    terminate : Proc(IRendezvousSession*, Win32cr::Foundation::HRESULT, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9ba4b1dd-8b0c-48b7-9e7c-2f25857c8df5")]
  record IRendezvousSession, lpVtbl : IRendezvousSessionVtbl* do
    GUID = LibC::GUID.new(0x9ba4b1dd_u32, 0x8b0c_u16, 0x48b7_u16, StaticArray[0x9e_u8, 0x7c_u8, 0x2f_u8, 0x25_u8, 0x85_u8, 0x7c_u8, 0x8d_u8, 0xf5_u8])
    def query_interface(this : IRendezvousSession*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRendezvousSession*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRendezvousSession*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_State(this : IRendezvousSession*, pSessionState : Win32cr::System::RemoteAssistance::RENDEZVOUS_SESSION_STATE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, pSessionState)
    end
    def get_RemoteUser(this : IRendezvousSession*, bstrUserName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteUser.call(this, bstrUserName)
    end
    def get_Flags(this : IRendezvousSession*, pFlags : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Flags.call(this, pFlags)
    end
    def send_context_data(this : IRendezvousSession*, bstrData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_context_data.call(this, bstrData)
    end
    def terminate(this : IRendezvousSession*, hr : Win32cr::Foundation::HRESULT, bstrAppData : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.terminate.call(this, hr, bstrAppData)
    end

  end

  @[Extern]
  record DRendezvousSessionEventsVtbl,
    query_interface : Proc(DRendezvousSessionEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(DRendezvousSessionEvents*, UInt32),
    release : Proc(DRendezvousSessionEvents*, UInt32),
    get_type_info_count : Proc(DRendezvousSessionEvents*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(DRendezvousSessionEvents*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(DRendezvousSessionEvents*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(DRendezvousSessionEvents*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3fa19cf8-64c4-4f53-ae60-635b3806eca6")]
  record DRendezvousSessionEvents, lpVtbl : DRendezvousSessionEventsVtbl* do
    GUID = LibC::GUID.new(0x3fa19cf8_u32, 0x64c4_u16, 0x4f53_u16, StaticArray[0xae_u8, 0x60_u8, 0x63_u8, 0x5b_u8, 0x38_u8, 0x6_u8, 0xec_u8, 0xa6_u8])
    def query_interface(this : DRendezvousSessionEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : DRendezvousSessionEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : DRendezvousSessionEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : DRendezvousSessionEvents*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : DRendezvousSessionEvents*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : DRendezvousSessionEvents*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : DRendezvousSessionEvents*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end

  end

  @[Extern]
  record IRendezvousApplicationVtbl,
    query_interface : Proc(IRendezvousApplication*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRendezvousApplication*, UInt32),
    release : Proc(IRendezvousApplication*, UInt32),
    set_rendezvous_session : Proc(IRendezvousApplication*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4f4d070b-a275-49fb-b10d-8ec26387b50d")]
  record IRendezvousApplication, lpVtbl : IRendezvousApplicationVtbl* do
    GUID = LibC::GUID.new(0x4f4d070b_u32, 0xa275_u16, 0x49fb_u16, StaticArray[0xb1_u8, 0xd_u8, 0x8e_u8, 0xc2_u8, 0x63_u8, 0x87_u8, 0xb5_u8, 0xd_u8])
    def query_interface(this : IRendezvousApplication*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRendezvousApplication*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRendezvousApplication*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_rendezvous_session(this : IRendezvousApplication*, pRendezvousSession : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_rendezvous_session.call(this, pRendezvousSession)
    end

  end

end