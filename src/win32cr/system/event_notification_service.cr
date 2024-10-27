require "./com.cr"
require "./../foundation.cr"

module Win32cr::System::EventNotificationService
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
    CONNECTION_LAN = 0_u32
    CONNECTION_WAN = 1_u32
  end

  @[Extern]
  record QOCINFO,
    dwSize : UInt32,
    dwFlags : UInt32,
    dwInSpeed : UInt32,
    dwOutSpeed : UInt32

  @[Extern]
  record SENS_QOCINFO,
    dwSize : UInt32,
    dwFlags : UInt32,
    dwOutSpeed : UInt32,
    dwInSpeed : UInt32

  @[Extern]
  record ISensNetworkVtbl,
    query_interface : Proc(ISensNetwork*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensNetwork*, UInt32),
    release : Proc(ISensNetwork*, UInt32),
    get_type_info_count : Proc(ISensNetwork*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISensNetwork*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISensNetwork*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISensNetwork*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    connection_made : Proc(ISensNetwork*, Win32cr::Foundation::BSTR, UInt32, Win32cr::System::EventNotificationService::SENS_QOCINFO*, Win32cr::Foundation::HRESULT),
    connection_made_no_qoc_info : Proc(ISensNetwork*, Win32cr::Foundation::BSTR, UInt32, Win32cr::Foundation::HRESULT),
    connection_lost : Proc(ISensNetwork*, Win32cr::Foundation::BSTR, Win32cr::System::EventNotificationService::SENS_CONNECTION_TYPE, Win32cr::Foundation::HRESULT),
    destination_reachable : Proc(ISensNetwork*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, UInt32, Win32cr::System::EventNotificationService::SENS_QOCINFO*, Win32cr::Foundation::HRESULT),
    destination_reachable_no_qoc_info : Proc(ISensNetwork*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d597bab1-5b9f-11d1-8dd2-00aa004abd5e")]
  record ISensNetwork, lpVtbl : ISensNetworkVtbl* do
    GUID = LibC::GUID.new(0xd597bab1_u32, 0x5b9f_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0xd2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4a_u8, 0xbd_u8, 0x5e_u8])
    def query_interface(this : ISensNetwork*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISensNetwork*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISensNetwork*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISensNetwork*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISensNetwork*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISensNetwork*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISensNetwork*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def connection_made(this : ISensNetwork*, bstrConnection : Win32cr::Foundation::BSTR, ulType : UInt32, lpQOCInfo : Win32cr::System::EventNotificationService::SENS_QOCINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connection_made.call(this, bstrConnection, ulType, lpQOCInfo)
    end
    def connection_made_no_qoc_info(this : ISensNetwork*, bstrConnection : Win32cr::Foundation::BSTR, ulType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connection_made_no_qoc_info.call(this, bstrConnection, ulType)
    end
    def connection_lost(this : ISensNetwork*, bstrConnection : Win32cr::Foundation::BSTR, ulType : Win32cr::System::EventNotificationService::SENS_CONNECTION_TYPE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connection_lost.call(this, bstrConnection, ulType)
    end
    def destination_reachable(this : ISensNetwork*, bstrDestination : Win32cr::Foundation::BSTR, bstrConnection : Win32cr::Foundation::BSTR, ulType : UInt32, lpQOCInfo : Win32cr::System::EventNotificationService::SENS_QOCINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destination_reachable.call(this, bstrDestination, bstrConnection, ulType, lpQOCInfo)
    end
    def destination_reachable_no_qoc_info(this : ISensNetwork*, bstrDestination : Win32cr::Foundation::BSTR, bstrConnection : Win32cr::Foundation::BSTR, ulType : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.destination_reachable_no_qoc_info.call(this, bstrDestination, bstrConnection, ulType)
    end

  end

  @[Extern]
  record ISensOnNowVtbl,
    query_interface : Proc(ISensOnNow*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensOnNow*, UInt32),
    release : Proc(ISensOnNow*, UInt32),
    get_type_info_count : Proc(ISensOnNow*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISensOnNow*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISensOnNow*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISensOnNow*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    on_ac_power : Proc(ISensOnNow*, Win32cr::Foundation::HRESULT),
    on_battery_power : Proc(ISensOnNow*, UInt32, Win32cr::Foundation::HRESULT),
    battery_low : Proc(ISensOnNow*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d597bab2-5b9f-11d1-8dd2-00aa004abd5e")]
  record ISensOnNow, lpVtbl : ISensOnNowVtbl* do
    GUID = LibC::GUID.new(0xd597bab2_u32, 0x5b9f_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0xd2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4a_u8, 0xbd_u8, 0x5e_u8])
    def query_interface(this : ISensOnNow*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISensOnNow*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISensOnNow*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISensOnNow*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISensOnNow*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISensOnNow*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISensOnNow*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def on_ac_power(this : ISensOnNow*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_ac_power.call(this)
    end
    def on_battery_power(this : ISensOnNow*, dwBatteryLifePercent : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.on_battery_power.call(this, dwBatteryLifePercent)
    end
    def battery_low(this : ISensOnNow*, dwBatteryLifePercent : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.battery_low.call(this, dwBatteryLifePercent)
    end

  end

  @[Extern]
  record ISensLogonVtbl,
    query_interface : Proc(ISensLogon*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensLogon*, UInt32),
    release : Proc(ISensLogon*, UInt32),
    get_type_info_count : Proc(ISensLogon*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISensLogon*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISensLogon*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISensLogon*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    logon : Proc(ISensLogon*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    logoff : Proc(ISensLogon*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    start_shell : Proc(ISensLogon*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    display_lock : Proc(ISensLogon*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    display_unlock : Proc(ISensLogon*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    start_screen_saver : Proc(ISensLogon*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    stop_screen_saver : Proc(ISensLogon*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d597bab3-5b9f-11d1-8dd2-00aa004abd5e")]
  record ISensLogon, lpVtbl : ISensLogonVtbl* do
    GUID = LibC::GUID.new(0xd597bab3_u32, 0x5b9f_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0xd2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4a_u8, 0xbd_u8, 0x5e_u8])
    def query_interface(this : ISensLogon*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISensLogon*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISensLogon*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISensLogon*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISensLogon*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISensLogon*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISensLogon*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def logon(this : ISensLogon*, bstrUserName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.logon.call(this, bstrUserName)
    end
    def logoff(this : ISensLogon*, bstrUserName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.logoff.call(this, bstrUserName)
    end
    def start_shell(this : ISensLogon*, bstrUserName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_shell.call(this, bstrUserName)
    end
    def display_lock(this : ISensLogon*, bstrUserName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_lock.call(this, bstrUserName)
    end
    def display_unlock(this : ISensLogon*, bstrUserName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.display_unlock.call(this, bstrUserName)
    end
    def start_screen_saver(this : ISensLogon*, bstrUserName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_screen_saver.call(this, bstrUserName)
    end
    def stop_screen_saver(this : ISensLogon*, bstrUserName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.stop_screen_saver.call(this, bstrUserName)
    end

  end

  @[Extern]
  record ISensLogon2Vtbl,
    query_interface : Proc(ISensLogon2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISensLogon2*, UInt32),
    release : Proc(ISensLogon2*, UInt32),
    get_type_info_count : Proc(ISensLogon2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ISensLogon2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ISensLogon2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ISensLogon2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    logon : Proc(ISensLogon2*, Win32cr::Foundation::BSTR, UInt32, Win32cr::Foundation::HRESULT),
    logoff : Proc(ISensLogon2*, Win32cr::Foundation::BSTR, UInt32, Win32cr::Foundation::HRESULT),
    session_disconnect : Proc(ISensLogon2*, Win32cr::Foundation::BSTR, UInt32, Win32cr::Foundation::HRESULT),
    session_reconnect : Proc(ISensLogon2*, Win32cr::Foundation::BSTR, UInt32, Win32cr::Foundation::HRESULT),
    post_shell : Proc(ISensLogon2*, Win32cr::Foundation::BSTR, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d597bab4-5b9f-11d1-8dd2-00aa004abd5e")]
  record ISensLogon2, lpVtbl : ISensLogon2Vtbl* do
    GUID = LibC::GUID.new(0xd597bab4_u32, 0x5b9f_u16, 0x11d1_u16, StaticArray[0x8d_u8, 0xd2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x4a_u8, 0xbd_u8, 0x5e_u8])
    def query_interface(this : ISensLogon2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISensLogon2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISensLogon2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ISensLogon2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ISensLogon2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ISensLogon2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ISensLogon2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def logon(this : ISensLogon2*, bstrUserName : Win32cr::Foundation::BSTR, dwSessionId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.logon.call(this, bstrUserName, dwSessionId)
    end
    def logoff(this : ISensLogon2*, bstrUserName : Win32cr::Foundation::BSTR, dwSessionId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.logoff.call(this, bstrUserName, dwSessionId)
    end
    def session_disconnect(this : ISensLogon2*, bstrUserName : Win32cr::Foundation::BSTR, dwSessionId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.session_disconnect.call(this, bstrUserName, dwSessionId)
    end
    def session_reconnect(this : ISensLogon2*, bstrUserName : Win32cr::Foundation::BSTR, dwSessionId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.session_reconnect.call(this, bstrUserName, dwSessionId)
    end
    def post_shell(this : ISensLogon2*, bstrUserName : Win32cr::Foundation::BSTR, dwSessionId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.post_shell.call(this, bstrUserName, dwSessionId)
    end

  end

  @[Link("sensapi")]
  lib C
    fun IsDestinationReachableA(lpszDestination : Win32cr::Foundation::PSTR, lpQOCInfo : Win32cr::System::EventNotificationService::QOCINFO*) : Win32cr::Foundation::BOOL

    fun IsDestinationReachableW(lpszDestination : Win32cr::Foundation::PWSTR, lpQOCInfo : Win32cr::System::EventNotificationService::QOCINFO*) : Win32cr::Foundation::BOOL

    fun IsNetworkAlive(lpdwFlags : UInt32*) : Win32cr::Foundation::BOOL

  end
end