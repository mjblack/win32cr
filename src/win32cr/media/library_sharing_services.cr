require "./../system/com.cr"
require "./../foundation.cr"

module Win32cr::Media::LibrarySharingServices

  CLSID_WindowsMediaLibrarySharingServices = LibC::GUID.new(0xad581b00_u32, 0x7b64_u16, 0x4e59_u16, StaticArray[0xa3_u8, 0x8d_u8, 0xd2_u8, 0xc5_u8, 0xbf_u8, 0x51_u8, 0xdd_u8, 0xb3_u8])

  enum WindowsMediaLibrarySharingDeviceAuthorizationStatus
    DEVICE_AUTHORIZATION_UNKNOWN = 0_i32
    DEVICE_AUTHORIZATION_ALLOWED = 1_i32
    DEVICE_AUTHORIZATION_DENIED = 2_i32
  end

  @[Extern]
  record IWindowsMediaLibrarySharingDevicePropertyVtbl,
    query_interface : Proc(IWindowsMediaLibrarySharingDeviceProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsMediaLibrarySharingDeviceProperty*, UInt32),
    release : Proc(IWindowsMediaLibrarySharingDeviceProperty*, UInt32),
    get_type_info_count : Proc(IWindowsMediaLibrarySharingDeviceProperty*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWindowsMediaLibrarySharingDeviceProperty*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWindowsMediaLibrarySharingDeviceProperty*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWindowsMediaLibrarySharingDeviceProperty*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IWindowsMediaLibrarySharingDeviceProperty*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Value : Proc(IWindowsMediaLibrarySharingDeviceProperty*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWindowsMediaLibrarySharingDeviceProperty, lpVtbl : IWindowsMediaLibrarySharingDevicePropertyVtbl* do
    GUID = LibC::GUID.new(0x81e26927_u32, 0x7a7d_u16, 0x40a7_u16, StaticArray[0x81_u8, 0xd4_u8, 0xbd_u8, 0xdc_u8, 0x2_u8, 0x96_u8, 0xe_u8, 0x3e_u8])
    def query_interface(this : IWindowsMediaLibrarySharingDeviceProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsMediaLibrarySharingDeviceProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsMediaLibrarySharingDeviceProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWindowsMediaLibrarySharingDeviceProperty*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWindowsMediaLibrarySharingDeviceProperty*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWindowsMediaLibrarySharingDeviceProperty*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWindowsMediaLibrarySharingDeviceProperty*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IWindowsMediaLibrarySharingDeviceProperty*, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, name)
    end
    def get_Value(this : IWindowsMediaLibrarySharingDeviceProperty*, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, value)
    end

  end

  @[Extern]
  record IWindowsMediaLibrarySharingDevicePropertiesVtbl,
    query_interface : Proc(IWindowsMediaLibrarySharingDeviceProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsMediaLibrarySharingDeviceProperties*, UInt32),
    release : Proc(IWindowsMediaLibrarySharingDeviceProperties*, UInt32),
    get_type_info_count : Proc(IWindowsMediaLibrarySharingDeviceProperties*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWindowsMediaLibrarySharingDeviceProperties*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWindowsMediaLibrarySharingDeviceProperties*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWindowsMediaLibrarySharingDeviceProperties*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IWindowsMediaLibrarySharingDeviceProperties*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IWindowsMediaLibrarySharingDeviceProperties*, Int32*, Win32cr::Foundation::HRESULT),
    get_property : Proc(IWindowsMediaLibrarySharingDeviceProperties*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWindowsMediaLibrarySharingDeviceProperties, lpVtbl : IWindowsMediaLibrarySharingDevicePropertiesVtbl* do
    GUID = LibC::GUID.new(0xc4623214_u32, 0x6b06_u16, 0x40c5_u16, StaticArray[0xa6_u8, 0x23_u8, 0xb2_u8, 0xff_u8, 0x4c_u8, 0x7_u8, 0x6b_u8, 0xfd_u8])
    def query_interface(this : IWindowsMediaLibrarySharingDeviceProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsMediaLibrarySharingDeviceProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsMediaLibrarySharingDeviceProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWindowsMediaLibrarySharingDeviceProperties*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWindowsMediaLibrarySharingDeviceProperties*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWindowsMediaLibrarySharingDeviceProperties*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWindowsMediaLibrarySharingDeviceProperties*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IWindowsMediaLibrarySharingDeviceProperties*, index : Int32, property : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, property)
    end
    def get_Count(this : IWindowsMediaLibrarySharingDeviceProperties*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get_property(this : IWindowsMediaLibrarySharingDeviceProperties*, name : Win32cr::Foundation::BSTR, property : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, name, property)
    end

  end

  @[Extern]
  record IWindowsMediaLibrarySharingDeviceVtbl,
    query_interface : Proc(IWindowsMediaLibrarySharingDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsMediaLibrarySharingDevice*, UInt32),
    release : Proc(IWindowsMediaLibrarySharingDevice*, UInt32),
    get_type_info_count : Proc(IWindowsMediaLibrarySharingDevice*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWindowsMediaLibrarySharingDevice*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWindowsMediaLibrarySharingDevice*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWindowsMediaLibrarySharingDevice*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_DeviceID : Proc(IWindowsMediaLibrarySharingDevice*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Authorization : Proc(IWindowsMediaLibrarySharingDevice*, Win32cr::Media::LibrarySharingServices::WindowsMediaLibrarySharingDeviceAuthorizationStatus*, Win32cr::Foundation::HRESULT),
    put_Authorization : Proc(IWindowsMediaLibrarySharingDevice*, Win32cr::Media::LibrarySharingServices::WindowsMediaLibrarySharingDeviceAuthorizationStatus, Win32cr::Foundation::HRESULT),
    get_Properties : Proc(IWindowsMediaLibrarySharingDevice*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWindowsMediaLibrarySharingDevice, lpVtbl : IWindowsMediaLibrarySharingDeviceVtbl* do
    GUID = LibC::GUID.new(0x3dccc293_u32, 0x4fd9_u16, 0x4191_u16, StaticArray[0xa2_u8, 0x5b_u8, 0x8e_u8, 0x57_u8, 0xc5_u8, 0xd2_u8, 0x7b_u8, 0xd4_u8])
    def query_interface(this : IWindowsMediaLibrarySharingDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsMediaLibrarySharingDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsMediaLibrarySharingDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWindowsMediaLibrarySharingDevice*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWindowsMediaLibrarySharingDevice*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWindowsMediaLibrarySharingDevice*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWindowsMediaLibrarySharingDevice*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_DeviceID(this : IWindowsMediaLibrarySharingDevice*, deviceID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DeviceID.call(this, deviceID)
    end
    def get_Authorization(this : IWindowsMediaLibrarySharingDevice*, authorization : Win32cr::Media::LibrarySharingServices::WindowsMediaLibrarySharingDeviceAuthorizationStatus*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Authorization.call(this, authorization)
    end
    def put_Authorization(this : IWindowsMediaLibrarySharingDevice*, authorization : Win32cr::Media::LibrarySharingServices::WindowsMediaLibrarySharingDeviceAuthorizationStatus) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Authorization.call(this, authorization)
    end
    def get_Properties(this : IWindowsMediaLibrarySharingDevice*, deviceProperties : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Properties.call(this, deviceProperties)
    end

  end

  @[Extern]
  record IWindowsMediaLibrarySharingDevicesVtbl,
    query_interface : Proc(IWindowsMediaLibrarySharingDevices*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsMediaLibrarySharingDevices*, UInt32),
    release : Proc(IWindowsMediaLibrarySharingDevices*, UInt32),
    get_type_info_count : Proc(IWindowsMediaLibrarySharingDevices*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWindowsMediaLibrarySharingDevices*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWindowsMediaLibrarySharingDevices*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWindowsMediaLibrarySharingDevices*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IWindowsMediaLibrarySharingDevices*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IWindowsMediaLibrarySharingDevices*, Int32*, Win32cr::Foundation::HRESULT),
    get_device : Proc(IWindowsMediaLibrarySharingDevices*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWindowsMediaLibrarySharingDevices, lpVtbl : IWindowsMediaLibrarySharingDevicesVtbl* do
    GUID = LibC::GUID.new(0x1803f9d6_u32, 0xfe6d_u16, 0x4546_u16, StaticArray[0xbf_u8, 0x5b_u8, 0x99_u8, 0x2f_u8, 0xe8_u8, 0xec_u8, 0x12_u8, 0xd1_u8])
    def query_interface(this : IWindowsMediaLibrarySharingDevices*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsMediaLibrarySharingDevices*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsMediaLibrarySharingDevices*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWindowsMediaLibrarySharingDevices*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWindowsMediaLibrarySharingDevices*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWindowsMediaLibrarySharingDevices*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWindowsMediaLibrarySharingDevices*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Item(this : IWindowsMediaLibrarySharingDevices*, index : Int32, device : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, index, device)
    end
    def get_Count(this : IWindowsMediaLibrarySharingDevices*, count : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get_device(this : IWindowsMediaLibrarySharingDevices*, deviceID : Win32cr::Foundation::BSTR, device : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_device.call(this, deviceID, device)
    end

  end

  @[Extern]
  record IWindowsMediaLibrarySharingServicesVtbl,
    query_interface : Proc(IWindowsMediaLibrarySharingServices*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowsMediaLibrarySharingServices*, UInt32),
    release : Proc(IWindowsMediaLibrarySharingServices*, UInt32),
    get_type_info_count : Proc(IWindowsMediaLibrarySharingServices*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IWindowsMediaLibrarySharingServices*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IWindowsMediaLibrarySharingServices*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IWindowsMediaLibrarySharingServices*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    showShareMediaCPL : Proc(IWindowsMediaLibrarySharingServices*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_userHomeMediaSharingState : Proc(IWindowsMediaLibrarySharingServices*, Int16*, Win32cr::Foundation::HRESULT),
    put_userHomeMediaSharingState : Proc(IWindowsMediaLibrarySharingServices*, Int16, Win32cr::Foundation::HRESULT),
    get_userHomeMediaSharingLibraryName : Proc(IWindowsMediaLibrarySharingServices*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_userHomeMediaSharingLibraryName : Proc(IWindowsMediaLibrarySharingServices*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_computerHomeMediaSharingAllowedState : Proc(IWindowsMediaLibrarySharingServices*, Int16*, Win32cr::Foundation::HRESULT),
    put_computerHomeMediaSharingAllowedState : Proc(IWindowsMediaLibrarySharingServices*, Int16, Win32cr::Foundation::HRESULT),
    get_userInternetMediaSharingState : Proc(IWindowsMediaLibrarySharingServices*, Int16*, Win32cr::Foundation::HRESULT),
    put_userInternetMediaSharingState : Proc(IWindowsMediaLibrarySharingServices*, Int16, Win32cr::Foundation::HRESULT),
    get_computerInternetMediaSharingAllowedState : Proc(IWindowsMediaLibrarySharingServices*, Int16*, Win32cr::Foundation::HRESULT),
    put_computerInternetMediaSharingAllowedState : Proc(IWindowsMediaLibrarySharingServices*, Int16, Win32cr::Foundation::HRESULT),
    get_internetMediaSharingSecurityGroup : Proc(IWindowsMediaLibrarySharingServices*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_internetMediaSharingSecurityGroup : Proc(IWindowsMediaLibrarySharingServices*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_allowSharingToAllDevices : Proc(IWindowsMediaLibrarySharingServices*, Int16*, Win32cr::Foundation::HRESULT),
    put_allowSharingToAllDevices : Proc(IWindowsMediaLibrarySharingServices*, Int16, Win32cr::Foundation::HRESULT),
    setDefaultAuthorization : Proc(IWindowsMediaLibrarySharingServices*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    setAuthorizationState : Proc(IWindowsMediaLibrarySharingServices*, Win32cr::Foundation::BSTR, Int16, Win32cr::Foundation::HRESULT),
    getAllDevices : Proc(IWindowsMediaLibrarySharingServices*, Void**, Win32cr::Foundation::HRESULT),
    get_customSettingsApplied : Proc(IWindowsMediaLibrarySharingServices*, Int16*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWindowsMediaLibrarySharingServices, lpVtbl : IWindowsMediaLibrarySharingServicesVtbl* do
    GUID = LibC::GUID.new(0x1f5f85e_u32, 0xa81_u16, 0x40da_u16, StaticArray[0xa7_u8, 0xc8_u8, 0x21_u8, 0xef_u8, 0x3a_u8, 0xf8_u8, 0x44_u8, 0xc_u8])
    def query_interface(this : IWindowsMediaLibrarySharingServices*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowsMediaLibrarySharingServices*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowsMediaLibrarySharingServices*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IWindowsMediaLibrarySharingServices*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IWindowsMediaLibrarySharingServices*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IWindowsMediaLibrarySharingServices*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IWindowsMediaLibrarySharingServices*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def showShareMediaCPL(this : IWindowsMediaLibrarySharingServices*, device : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.showShareMediaCPL.call(this, device)
    end
    def get_userHomeMediaSharingState(this : IWindowsMediaLibrarySharingServices*, sharingEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_userHomeMediaSharingState.call(this, sharingEnabled)
    end
    def put_userHomeMediaSharingState(this : IWindowsMediaLibrarySharingServices*, sharingEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_userHomeMediaSharingState.call(this, sharingEnabled)
    end
    def get_userHomeMediaSharingLibraryName(this : IWindowsMediaLibrarySharingServices*, libraryName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_userHomeMediaSharingLibraryName.call(this, libraryName)
    end
    def put_userHomeMediaSharingLibraryName(this : IWindowsMediaLibrarySharingServices*, libraryName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_userHomeMediaSharingLibraryName.call(this, libraryName)
    end
    def get_computerHomeMediaSharingAllowedState(this : IWindowsMediaLibrarySharingServices*, sharingAllowed : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_computerHomeMediaSharingAllowedState.call(this, sharingAllowed)
    end
    def put_computerHomeMediaSharingAllowedState(this : IWindowsMediaLibrarySharingServices*, sharingAllowed : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_computerHomeMediaSharingAllowedState.call(this, sharingAllowed)
    end
    def get_userInternetMediaSharingState(this : IWindowsMediaLibrarySharingServices*, sharingEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_userInternetMediaSharingState.call(this, sharingEnabled)
    end
    def put_userInternetMediaSharingState(this : IWindowsMediaLibrarySharingServices*, sharingEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_userInternetMediaSharingState.call(this, sharingEnabled)
    end
    def get_computerInternetMediaSharingAllowedState(this : IWindowsMediaLibrarySharingServices*, sharingAllowed : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_computerInternetMediaSharingAllowedState.call(this, sharingAllowed)
    end
    def put_computerInternetMediaSharingAllowedState(this : IWindowsMediaLibrarySharingServices*, sharingAllowed : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_computerInternetMediaSharingAllowedState.call(this, sharingAllowed)
    end
    def get_internetMediaSharingSecurityGroup(this : IWindowsMediaLibrarySharingServices*, securityGroup : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_internetMediaSharingSecurityGroup.call(this, securityGroup)
    end
    def put_internetMediaSharingSecurityGroup(this : IWindowsMediaLibrarySharingServices*, securityGroup : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_internetMediaSharingSecurityGroup.call(this, securityGroup)
    end
    def get_allowSharingToAllDevices(this : IWindowsMediaLibrarySharingServices*, sharingEnabled : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_allowSharingToAllDevices.call(this, sharingEnabled)
    end
    def put_allowSharingToAllDevices(this : IWindowsMediaLibrarySharingServices*, sharingEnabled : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_allowSharingToAllDevices.call(this, sharingEnabled)
    end
    def setDefaultAuthorization(this : IWindowsMediaLibrarySharingServices*, mac_addresses : Win32cr::Foundation::BSTR, friendlyName : Win32cr::Foundation::BSTR, authorization : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.setDefaultAuthorization.call(this, mac_addresses, friendlyName, authorization)
    end
    def setAuthorizationState(this : IWindowsMediaLibrarySharingServices*, mac_address : Win32cr::Foundation::BSTR, authorizationState : Int16) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.setAuthorizationState.call(this, mac_address, authorizationState)
    end
    def getAllDevices(this : IWindowsMediaLibrarySharingServices*, devices : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.getAllDevices.call(this, devices)
    end
    def get_customSettingsApplied(this : IWindowsMediaLibrarySharingServices*, customSettingsApplied : Int16*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_customSettingsApplied.call(this, customSettingsApplied)
    end

  end

end