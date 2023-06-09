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
@[Link(ldflags: "/DELAYLOAD:sensapi.dll")]
{% else %}
@[Link("sensapi")]
{% end %}
lib LibWin32
  NETWORK_ALIVE_LAN = 1_u32
  NETWORK_ALIVE_WAN = 2_u32
  NETWORK_ALIVE_AOL = 4_u32
  NETWORK_ALIVE_INTERNET = 8_u32
  CONNECTION_AOL = 4_u32
  SENSGUID_PUBLISHER = "5fee1bd6-5b9b-11d1-8dd2-00aa004abd5e"
  SENSGUID_SUBSCRIBER_LCE = "d3938ab0-5b9d-11d1-8dd2-00aa004abd5e"
  SENSGUID_SUBSCRIBER_WININET = "d3938ab5-5b9d-11d1-8dd2-00aa004abd5e"
  SENSGUID_EVENTCLASS_NETWORK = "d5978620-5b9f-11d1-8dd2-00aa004abd5e"
  SENSGUID_EVENTCLASS_LOGON = "d5978630-5b9f-11d1-8dd2-00aa004abd5e"
  SENSGUID_EVENTCLASS_ONNOW = "d5978640-5b9f-11d1-8dd2-00aa004abd5e"
  SENSGUID_EVENTCLASS_LOGON2 = "d5978650-5b9f-11d1-8dd2-00aa004abd5e"
  CLSID_SENS = LibC::GUID.new(0xd597cafe_u32, 0x5b9f_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0xd2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4a_u8, 0xbd_u8, 0x5e_u8])


  enum SENS_CONNECTION_TYPE : UInt32
    CONNECTION_LAN = 0
    CONNECTION_WAN = 1
  end

  struct QOCINFO
    dw_size : UInt32
    dw_flags : UInt32
    dw_in_speed : UInt32
    dw_out_speed : UInt32
  end
  struct SENS_QOCINFO
    dw_size : UInt32
    dw_flags : UInt32
    dw_out_speed : UInt32
    dw_in_speed : UInt32
  end


  struct ISensNetworkVTbl
    query_interface : Proc(ISensNetwork*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISensNetwork*, UInt32)
    release : Proc(ISensNetwork*, UInt32)
    get_type_info_count : Proc(ISensNetwork*, UInt32*, HRESULT)
    get_type_info : Proc(ISensNetwork*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISensNetwork*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISensNetwork*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    connection_made : Proc(ISensNetwork*, UInt8*, UInt32, SENS_QOCINFO*, HRESULT)
    connection_made_no_qoc_info : Proc(ISensNetwork*, UInt8*, UInt32, HRESULT)
    connection_lost : Proc(ISensNetwork*, UInt8*, SENS_CONNECTION_TYPE, HRESULT)
    destination_reachable : Proc(ISensNetwork*, UInt8*, UInt8*, UInt32, SENS_QOCINFO*, HRESULT)
    destination_reachable_no_qoc_info : Proc(ISensNetwork*, UInt8*, UInt8*, UInt32, HRESULT)
  end

  ISensNetwork_GUID = "d597bab1-5b9f-11d1-8dd2-00aa004abd5e"
  IID_ISensNetwork = LibC::GUID.new(0xd597bab1_u32, 0x5b9f_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0xd2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4a_u8, 0xbd_u8, 0x5e_u8])
  struct ISensNetwork
    lpVtbl : ISensNetworkVTbl*
  end

  struct ISensOnNowVTbl
    query_interface : Proc(ISensOnNow*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISensOnNow*, UInt32)
    release : Proc(ISensOnNow*, UInt32)
    get_type_info_count : Proc(ISensOnNow*, UInt32*, HRESULT)
    get_type_info : Proc(ISensOnNow*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISensOnNow*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISensOnNow*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    on_ac_power : Proc(ISensOnNow*, HRESULT)
    on_battery_power : Proc(ISensOnNow*, UInt32, HRESULT)
    battery_low : Proc(ISensOnNow*, UInt32, HRESULT)
  end

  ISensOnNow_GUID = "d597bab2-5b9f-11d1-8dd2-00aa004abd5e"
  IID_ISensOnNow = LibC::GUID.new(0xd597bab2_u32, 0x5b9f_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0xd2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4a_u8, 0xbd_u8, 0x5e_u8])
  struct ISensOnNow
    lpVtbl : ISensOnNowVTbl*
  end

  struct ISensLogonVTbl
    query_interface : Proc(ISensLogon*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISensLogon*, UInt32)
    release : Proc(ISensLogon*, UInt32)
    get_type_info_count : Proc(ISensLogon*, UInt32*, HRESULT)
    get_type_info : Proc(ISensLogon*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISensLogon*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISensLogon*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    logon : Proc(ISensLogon*, UInt8*, HRESULT)
    logoff : Proc(ISensLogon*, UInt8*, HRESULT)
    start_shell : Proc(ISensLogon*, UInt8*, HRESULT)
    display_lock : Proc(ISensLogon*, UInt8*, HRESULT)
    display_unlock : Proc(ISensLogon*, UInt8*, HRESULT)
    start_screen_saver : Proc(ISensLogon*, UInt8*, HRESULT)
    stop_screen_saver : Proc(ISensLogon*, UInt8*, HRESULT)
  end

  ISensLogon_GUID = "d597bab3-5b9f-11d1-8dd2-00aa004abd5e"
  IID_ISensLogon = LibC::GUID.new(0xd597bab3_u32, 0x5b9f_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0xd2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4a_u8, 0xbd_u8, 0x5e_u8])
  struct ISensLogon
    lpVtbl : ISensLogonVTbl*
  end

  struct ISensLogon2VTbl
    query_interface : Proc(ISensLogon2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISensLogon2*, UInt32)
    release : Proc(ISensLogon2*, UInt32)
    get_type_info_count : Proc(ISensLogon2*, UInt32*, HRESULT)
    get_type_info : Proc(ISensLogon2*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ISensLogon2*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ISensLogon2*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    logon : Proc(ISensLogon2*, UInt8*, UInt32, HRESULT)
    logoff : Proc(ISensLogon2*, UInt8*, UInt32, HRESULT)
    session_disconnect : Proc(ISensLogon2*, UInt8*, UInt32, HRESULT)
    session_reconnect : Proc(ISensLogon2*, UInt8*, UInt32, HRESULT)
    post_shell : Proc(ISensLogon2*, UInt8*, UInt32, HRESULT)
  end

  ISensLogon2_GUID = "d597bab4-5b9f-11d1-8dd2-00aa004abd5e"
  IID_ISensLogon2 = LibC::GUID.new(0xd597bab4_u32, 0x5b9f_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0xd2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4a_u8, 0xbd_u8, 0x5e_u8])
  struct ISensLogon2
    lpVtbl : ISensLogon2VTbl*
  end


  # Params # lpszdestination : PSTR [In],lpqocinfo : QOCINFO* [In]
  fun IsDestinationReachableA(lpszdestination : PSTR, lpqocinfo : QOCINFO*) : LibC::BOOL

  # Params # lpszdestination : LibC::LPWSTR [In],lpqocinfo : QOCINFO* [In]
  fun IsDestinationReachableW(lpszdestination : LibC::LPWSTR, lpqocinfo : QOCINFO*) : LibC::BOOL

  # Params # lpdwflags : UInt32* [In]
  fun IsNetworkAlive(lpdwflags : UInt32*) : LibC::BOOL
end
struct LibWin32::ISensNetwork
  def query_interface(this : ISensNetwork*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISensNetwork*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISensNetwork*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISensNetwork*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISensNetwork*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISensNetwork*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISensNetwork*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def connection_made(this : ISensNetwork*, bstrconnection : UInt8*, ultype : UInt32, lpqocinfo : SENS_QOCINFO*) : HRESULT
    @lpVtbl.value.connection_made.call(this, bstrconnection, ultype, lpqocinfo)
  end
  def connection_made_no_qoc_info(this : ISensNetwork*, bstrconnection : UInt8*, ultype : UInt32) : HRESULT
    @lpVtbl.value.connection_made_no_qoc_info.call(this, bstrconnection, ultype)
  end
  def connection_lost(this : ISensNetwork*, bstrconnection : UInt8*, ultype : SENS_CONNECTION_TYPE) : HRESULT
    @lpVtbl.value.connection_lost.call(this, bstrconnection, ultype)
  end
  def destination_reachable(this : ISensNetwork*, bstrdestination : UInt8*, bstrconnection : UInt8*, ultype : UInt32, lpqocinfo : SENS_QOCINFO*) : HRESULT
    @lpVtbl.value.destination_reachable.call(this, bstrdestination, bstrconnection, ultype, lpqocinfo)
  end
  def destination_reachable_no_qoc_info(this : ISensNetwork*, bstrdestination : UInt8*, bstrconnection : UInt8*, ultype : UInt32) : HRESULT
    @lpVtbl.value.destination_reachable_no_qoc_info.call(this, bstrdestination, bstrconnection, ultype)
  end
end
struct LibWin32::ISensOnNow
  def query_interface(this : ISensOnNow*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISensOnNow*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISensOnNow*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISensOnNow*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISensOnNow*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISensOnNow*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISensOnNow*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def on_ac_power(this : ISensOnNow*) : HRESULT
    @lpVtbl.value.on_ac_power.call(this)
  end
  def on_battery_power(this : ISensOnNow*, dwbatterylifepercent : UInt32) : HRESULT
    @lpVtbl.value.on_battery_power.call(this, dwbatterylifepercent)
  end
  def battery_low(this : ISensOnNow*, dwbatterylifepercent : UInt32) : HRESULT
    @lpVtbl.value.battery_low.call(this, dwbatterylifepercent)
  end
end
struct LibWin32::ISensLogon
  def query_interface(this : ISensLogon*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISensLogon*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISensLogon*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISensLogon*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISensLogon*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISensLogon*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISensLogon*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def logon(this : ISensLogon*, bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.logon.call(this, bstrusername)
  end
  def logoff(this : ISensLogon*, bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.logoff.call(this, bstrusername)
  end
  def start_shell(this : ISensLogon*, bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.start_shell.call(this, bstrusername)
  end
  def display_lock(this : ISensLogon*, bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.display_lock.call(this, bstrusername)
  end
  def display_unlock(this : ISensLogon*, bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.display_unlock.call(this, bstrusername)
  end
  def start_screen_saver(this : ISensLogon*, bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.start_screen_saver.call(this, bstrusername)
  end
  def stop_screen_saver(this : ISensLogon*, bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.stop_screen_saver.call(this, bstrusername)
  end
end
struct LibWin32::ISensLogon2
  def query_interface(this : ISensLogon2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISensLogon2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISensLogon2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ISensLogon2*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ISensLogon2*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ISensLogon2*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ISensLogon2*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def logon(this : ISensLogon2*, bstrusername : UInt8*, dwsessionid : UInt32) : HRESULT
    @lpVtbl.value.logon.call(this, bstrusername, dwsessionid)
  end
  def logoff(this : ISensLogon2*, bstrusername : UInt8*, dwsessionid : UInt32) : HRESULT
    @lpVtbl.value.logoff.call(this, bstrusername, dwsessionid)
  end
  def session_disconnect(this : ISensLogon2*, bstrusername : UInt8*, dwsessionid : UInt32) : HRESULT
    @lpVtbl.value.session_disconnect.call(this, bstrusername, dwsessionid)
  end
  def session_reconnect(this : ISensLogon2*, bstrusername : UInt8*, dwsessionid : UInt32) : HRESULT
    @lpVtbl.value.session_reconnect.call(this, bstrusername, dwsessionid)
  end
  def post_shell(this : ISensLogon2*, bstrusername : UInt8*, dwsessionid : UInt32) : HRESULT
    @lpVtbl.value.post_shell.call(this, bstrusername, dwsessionid)
  end
end
