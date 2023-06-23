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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    connection_made : UInt64
    connection_made_no_qoc_info : UInt64
    connection_lost : UInt64
    destination_reachable : UInt64
    destination_reachable_no_qoc_info : UInt64
  end

  ISensNetwork_GUID = "d597bab1-5b9f-11d1-8dd2-00aa004abd5e"
  IID_ISensNetwork = LibC::GUID.new(0xd597bab1_u32, 0x5b9f_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0xd2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4a_u8, 0xbd_u8, 0x5e_u8])
  struct ISensNetwork
    lpVtbl : ISensNetworkVTbl*
  end

  struct ISensOnNowVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    on_ac_power : UInt64
    on_battery_power : UInt64
    battery_low : UInt64
  end

  ISensOnNow_GUID = "d597bab2-5b9f-11d1-8dd2-00aa004abd5e"
  IID_ISensOnNow = LibC::GUID.new(0xd597bab2_u32, 0x5b9f_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0xd2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4a_u8, 0xbd_u8, 0x5e_u8])
  struct ISensOnNow
    lpVtbl : ISensOnNowVTbl*
  end

  struct ISensLogonVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    logon : UInt64
    logoff : UInt64
    start_shell : UInt64
    display_lock : UInt64
    display_unlock : UInt64
    start_screen_saver : UInt64
    stop_screen_saver : UInt64
  end

  ISensLogon_GUID = "d597bab3-5b9f-11d1-8dd2-00aa004abd5e"
  IID_ISensLogon = LibC::GUID.new(0xd597bab3_u32, 0x5b9f_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0xd2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4a_u8, 0xbd_u8, 0x5e_u8])
  struct ISensLogon
    lpVtbl : ISensLogonVTbl*
  end

  struct ISensLogon2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    logon : UInt64
    logoff : UInt64
    session_disconnect : UInt64
    session_reconnect : UInt64
    post_shell : UInt64
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
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def connection_made(bstrconnection : UInt8*, ultype : UInt32, lpqocinfo : SENS_QOCINFO*) : HRESULT
    @lpVtbl.value.connection_made.unsafe_as(Proc(UInt8*, UInt32, SENS_QOCINFO*, HRESULT)).call(bstrconnection, ultype, lpqocinfo)
  end
  def connection_made_no_qoc_info(bstrconnection : UInt8*, ultype : UInt32) : HRESULT
    @lpVtbl.value.connection_made_no_qoc_info.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(bstrconnection, ultype)
  end
  def connection_lost(bstrconnection : UInt8*, ultype : SENS_CONNECTION_TYPE) : HRESULT
    @lpVtbl.value.connection_lost.unsafe_as(Proc(UInt8*, SENS_CONNECTION_TYPE, HRESULT)).call(bstrconnection, ultype)
  end
  def destination_reachable(bstrdestination : UInt8*, bstrconnection : UInt8*, ultype : UInt32, lpqocinfo : SENS_QOCINFO*) : HRESULT
    @lpVtbl.value.destination_reachable.unsafe_as(Proc(UInt8*, UInt8*, UInt32, SENS_QOCINFO*, HRESULT)).call(bstrdestination, bstrconnection, ultype, lpqocinfo)
  end
  def destination_reachable_no_qoc_info(bstrdestination : UInt8*, bstrconnection : UInt8*, ultype : UInt32) : HRESULT
    @lpVtbl.value.destination_reachable_no_qoc_info.unsafe_as(Proc(UInt8*, UInt8*, UInt32, HRESULT)).call(bstrdestination, bstrconnection, ultype)
  end
end
struct LibWin32::ISensOnNow
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def on_ac_power : HRESULT
    @lpVtbl.value.on_ac_power.unsafe_as(Proc(HRESULT)).call
  end
  def on_battery_power(dwbatterylifepercent : UInt32) : HRESULT
    @lpVtbl.value.on_battery_power.unsafe_as(Proc(UInt32, HRESULT)).call(dwbatterylifepercent)
  end
  def battery_low(dwbatterylifepercent : UInt32) : HRESULT
    @lpVtbl.value.battery_low.unsafe_as(Proc(UInt32, HRESULT)).call(dwbatterylifepercent)
  end
end
struct LibWin32::ISensLogon
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def logon(bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.logon.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrusername)
  end
  def logoff(bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.logoff.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrusername)
  end
  def start_shell(bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.start_shell.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrusername)
  end
  def display_lock(bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.display_lock.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrusername)
  end
  def display_unlock(bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.display_unlock.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrusername)
  end
  def start_screen_saver(bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.start_screen_saver.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrusername)
  end
  def stop_screen_saver(bstrusername : UInt8*) : HRESULT
    @lpVtbl.value.stop_screen_saver.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrusername)
  end
end
struct LibWin32::ISensLogon2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def logon(bstrusername : UInt8*, dwsessionid : UInt32) : HRESULT
    @lpVtbl.value.logon.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(bstrusername, dwsessionid)
  end
  def logoff(bstrusername : UInt8*, dwsessionid : UInt32) : HRESULT
    @lpVtbl.value.logoff.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(bstrusername, dwsessionid)
  end
  def session_disconnect(bstrusername : UInt8*, dwsessionid : UInt32) : HRESULT
    @lpVtbl.value.session_disconnect.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(bstrusername, dwsessionid)
  end
  def session_reconnect(bstrusername : UInt8*, dwsessionid : UInt32) : HRESULT
    @lpVtbl.value.session_reconnect.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(bstrusername, dwsessionid)
  end
  def post_shell(bstrusername : UInt8*, dwsessionid : UInt32) : HRESULT
    @lpVtbl.value.post_shell.unsafe_as(Proc(UInt8*, UInt32, HRESULT)).call(bstrusername, dwsessionid)
  end
end
