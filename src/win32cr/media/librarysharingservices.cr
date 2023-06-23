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
  CLSID_WindowsMediaLibrarySharingServices = LibC::GUID.new(0xad581b00_u32, 0x7b64_u16, 0x4e59_u16, StaticArray[0xa3_u8, 0x8d_u8, 0xd2_u8, 0xc5_u8, 0xbf_u8, 0x51_u8, 0xdd_u8, 0xb3_u8])


  enum WindowsMediaLibrarySharingDeviceAuthorizationStatus : Int32
    DEVICE_AUTHORIZATION_UNKNOWN = 0
    DEVICE_AUTHORIZATION_ALLOWED = 1
    DEVICE_AUTHORIZATION_DENIED = 2
  end


  struct IWindowsMediaLibrarySharingDevicePropertyVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_name : UInt64
    get_value : UInt64
  end

  IWindowsMediaLibrarySharingDeviceProperty_GUID = "81e26927-7a7d-40a7-81d4-bddc02960e3e"
  IID_IWindowsMediaLibrarySharingDeviceProperty = LibC::GUID.new(0x81e26927_u32, 0x7a7d_u16, 0x40a7_u16, StaticArray[0x81_u8, 0xd4_u8, 0xbd_u8, 0xdc_u8, 0x2_u8, 0x96_u8, 0xe_u8, 0x3e_u8])
  struct IWindowsMediaLibrarySharingDeviceProperty
    lpVtbl : IWindowsMediaLibrarySharingDevicePropertyVTbl*
  end

  struct IWindowsMediaLibrarySharingDevicePropertiesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_item : UInt64
    get_count : UInt64
    get_property : UInt64
  end

  IWindowsMediaLibrarySharingDeviceProperties_GUID = "c4623214-6b06-40c5-a623-b2ff4c076bfd"
  IID_IWindowsMediaLibrarySharingDeviceProperties = LibC::GUID.new(0xc4623214_u32, 0x6b06_u16, 0x40c5_u16, StaticArray[0xa6_u8, 0x23_u8, 0xb2_u8, 0xff_u8, 0x4c_u8, 0x7_u8, 0x6b_u8, 0xfd_u8])
  struct IWindowsMediaLibrarySharingDeviceProperties
    lpVtbl : IWindowsMediaLibrarySharingDevicePropertiesVTbl*
  end

  struct IWindowsMediaLibrarySharingDeviceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_device_id : UInt64
    get_authorization : UInt64
    put_authorization : UInt64
    get_properties : UInt64
  end

  IWindowsMediaLibrarySharingDevice_GUID = "3dccc293-4fd9-4191-a25b-8e57c5d27bd4"
  IID_IWindowsMediaLibrarySharingDevice = LibC::GUID.new(0x3dccc293_u32, 0x4fd9_u16, 0x4191_u16, StaticArray[0xa2_u8, 0x5b_u8, 0x8e_u8, 0x57_u8, 0xc5_u8, 0xd2_u8, 0x7b_u8, 0xd4_u8])
  struct IWindowsMediaLibrarySharingDevice
    lpVtbl : IWindowsMediaLibrarySharingDeviceVTbl*
  end

  struct IWindowsMediaLibrarySharingDevicesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_item : UInt64
    get_count : UInt64
    get_device : UInt64
  end

  IWindowsMediaLibrarySharingDevices_GUID = "1803f9d6-fe6d-4546-bf5b-992fe8ec12d1"
  IID_IWindowsMediaLibrarySharingDevices = LibC::GUID.new(0x1803f9d6_u32, 0xfe6d_u16, 0x4546_u16, StaticArray[0xbf_u8, 0x5b_u8, 0x99_u8, 0x2f_u8, 0xe8_u8, 0xec_u8, 0x12_u8, 0xd1_u8])
  struct IWindowsMediaLibrarySharingDevices
    lpVtbl : IWindowsMediaLibrarySharingDevicesVTbl*
  end

  struct IWindowsMediaLibrarySharingServicesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    show_share_media_cpl : UInt64
    get_user_home_media_sharing_state : UInt64
    put_user_home_media_sharing_state : UInt64
    get_user_home_media_sharing_library_name : UInt64
    put_user_home_media_sharing_library_name : UInt64
    get_computer_home_media_sharing_allowed_state : UInt64
    put_computer_home_media_sharing_allowed_state : UInt64
    get_user_internet_media_sharing_state : UInt64
    put_user_internet_media_sharing_state : UInt64
    get_computer_internet_media_sharing_allowed_state : UInt64
    put_computer_internet_media_sharing_allowed_state : UInt64
    get_internet_media_sharing_security_group : UInt64
    put_internet_media_sharing_security_group : UInt64
    get_allow_sharing_to_all_devices : UInt64
    put_allow_sharing_to_all_devices : UInt64
    set_default_authorization : UInt64
    set_authorization_state : UInt64
    get_all_devices : UInt64
    get_custom_settings_applied : UInt64
  end

  IWindowsMediaLibrarySharingServices_GUID = "01f5f85e-0a81-40da-a7c8-21ef3af8440c"
  IID_IWindowsMediaLibrarySharingServices = LibC::GUID.new(0x1f5f85e_u32, 0xa81_u16, 0x40da_u16, StaticArray[0xa7_u8, 0xc8_u8, 0x21_u8, 0xef_u8, 0x3a_u8, 0xf8_u8, 0x44_u8, 0xc_u8])
  struct IWindowsMediaLibrarySharingServices
    lpVtbl : IWindowsMediaLibrarySharingServicesVTbl*
  end

end
struct LibWin32::IWindowsMediaLibrarySharingDeviceProperty
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
  def get_name(name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(name)
  end
  def get_value(value : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(value)
  end
end
struct LibWin32::IWindowsMediaLibrarySharingDeviceProperties
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
  def get_item(index : Int32, property : IWindowsMediaLibrarySharingDeviceProperty*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IWindowsMediaLibrarySharingDeviceProperty*, HRESULT)).call(index, property)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def get_property(name : UInt8*, property : IWindowsMediaLibrarySharingDeviceProperty*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(UInt8*, IWindowsMediaLibrarySharingDeviceProperty*, HRESULT)).call(name, property)
  end
end
struct LibWin32::IWindowsMediaLibrarySharingDevice
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
  def get_device_id(deviceid : UInt8**) : HRESULT
    @lpVtbl.value.get_device_id.unsafe_as(Proc(UInt8**, HRESULT)).call(deviceid)
  end
  def get_authorization(authorization : WindowsMediaLibrarySharingDeviceAuthorizationStatus*) : HRESULT
    @lpVtbl.value.get_authorization.unsafe_as(Proc(WindowsMediaLibrarySharingDeviceAuthorizationStatus*, HRESULT)).call(authorization)
  end
  def put_authorization(authorization : WindowsMediaLibrarySharingDeviceAuthorizationStatus) : HRESULT
    @lpVtbl.value.put_authorization.unsafe_as(Proc(WindowsMediaLibrarySharingDeviceAuthorizationStatus, HRESULT)).call(authorization)
  end
  def get_properties(deviceproperties : IWindowsMediaLibrarySharingDeviceProperties*) : HRESULT
    @lpVtbl.value.get_properties.unsafe_as(Proc(IWindowsMediaLibrarySharingDeviceProperties*, HRESULT)).call(deviceproperties)
  end
end
struct LibWin32::IWindowsMediaLibrarySharingDevices
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
  def get_item(index : Int32, device : IWindowsMediaLibrarySharingDevice*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, IWindowsMediaLibrarySharingDevice*, HRESULT)).call(index, device)
  end
  def get_count(count : Int32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(Int32*, HRESULT)).call(count)
  end
  def get_device(deviceid : UInt8*, device : IWindowsMediaLibrarySharingDevice*) : HRESULT
    @lpVtbl.value.get_device.unsafe_as(Proc(UInt8*, IWindowsMediaLibrarySharingDevice*, HRESULT)).call(deviceid, device)
  end
end
struct LibWin32::IWindowsMediaLibrarySharingServices
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
  def show_share_media_cpl(device : UInt8*) : HRESULT
    @lpVtbl.value.show_share_media_cpl.unsafe_as(Proc(UInt8*, HRESULT)).call(device)
  end
  def get_user_home_media_sharing_state(sharingenabled : Int16*) : HRESULT
    @lpVtbl.value.get_user_home_media_sharing_state.unsafe_as(Proc(Int16*, HRESULT)).call(sharingenabled)
  end
  def put_user_home_media_sharing_state(sharingenabled : Int16) : HRESULT
    @lpVtbl.value.put_user_home_media_sharing_state.unsafe_as(Proc(Int16, HRESULT)).call(sharingenabled)
  end
  def get_user_home_media_sharing_library_name(libraryname : UInt8**) : HRESULT
    @lpVtbl.value.get_user_home_media_sharing_library_name.unsafe_as(Proc(UInt8**, HRESULT)).call(libraryname)
  end
  def put_user_home_media_sharing_library_name(libraryname : UInt8*) : HRESULT
    @lpVtbl.value.put_user_home_media_sharing_library_name.unsafe_as(Proc(UInt8*, HRESULT)).call(libraryname)
  end
  def get_computer_home_media_sharing_allowed_state(sharingallowed : Int16*) : HRESULT
    @lpVtbl.value.get_computer_home_media_sharing_allowed_state.unsafe_as(Proc(Int16*, HRESULT)).call(sharingallowed)
  end
  def put_computer_home_media_sharing_allowed_state(sharingallowed : Int16) : HRESULT
    @lpVtbl.value.put_computer_home_media_sharing_allowed_state.unsafe_as(Proc(Int16, HRESULT)).call(sharingallowed)
  end
  def get_user_internet_media_sharing_state(sharingenabled : Int16*) : HRESULT
    @lpVtbl.value.get_user_internet_media_sharing_state.unsafe_as(Proc(Int16*, HRESULT)).call(sharingenabled)
  end
  def put_user_internet_media_sharing_state(sharingenabled : Int16) : HRESULT
    @lpVtbl.value.put_user_internet_media_sharing_state.unsafe_as(Proc(Int16, HRESULT)).call(sharingenabled)
  end
  def get_computer_internet_media_sharing_allowed_state(sharingallowed : Int16*) : HRESULT
    @lpVtbl.value.get_computer_internet_media_sharing_allowed_state.unsafe_as(Proc(Int16*, HRESULT)).call(sharingallowed)
  end
  def put_computer_internet_media_sharing_allowed_state(sharingallowed : Int16) : HRESULT
    @lpVtbl.value.put_computer_internet_media_sharing_allowed_state.unsafe_as(Proc(Int16, HRESULT)).call(sharingallowed)
  end
  def get_internet_media_sharing_security_group(securitygroup : UInt8**) : HRESULT
    @lpVtbl.value.get_internet_media_sharing_security_group.unsafe_as(Proc(UInt8**, HRESULT)).call(securitygroup)
  end
  def put_internet_media_sharing_security_group(securitygroup : UInt8*) : HRESULT
    @lpVtbl.value.put_internet_media_sharing_security_group.unsafe_as(Proc(UInt8*, HRESULT)).call(securitygroup)
  end
  def get_allow_sharing_to_all_devices(sharingenabled : Int16*) : HRESULT
    @lpVtbl.value.get_allow_sharing_to_all_devices.unsafe_as(Proc(Int16*, HRESULT)).call(sharingenabled)
  end
  def put_allow_sharing_to_all_devices(sharingenabled : Int16) : HRESULT
    @lpVtbl.value.put_allow_sharing_to_all_devices.unsafe_as(Proc(Int16, HRESULT)).call(sharingenabled)
  end
  def set_default_authorization(macaddresses : UInt8*, friendlyname : UInt8*, authorization : Int16) : HRESULT
    @lpVtbl.value.set_default_authorization.unsafe_as(Proc(UInt8*, UInt8*, Int16, HRESULT)).call(macaddresses, friendlyname, authorization)
  end
  def set_authorization_state(macaddress : UInt8*, authorizationstate : Int16) : HRESULT
    @lpVtbl.value.set_authorization_state.unsafe_as(Proc(UInt8*, Int16, HRESULT)).call(macaddress, authorizationstate)
  end
  def get_all_devices(devices : IWindowsMediaLibrarySharingDevices*) : HRESULT
    @lpVtbl.value.get_all_devices.unsafe_as(Proc(IWindowsMediaLibrarySharingDevices*, HRESULT)).call(devices)
  end
  def get_custom_settings_applied(customsettingsapplied : Int16*) : HRESULT
    @lpVtbl.value.get_custom_settings_applied.unsafe_as(Proc(Int16*, HRESULT)).call(customsettingsapplied)
  end
end
