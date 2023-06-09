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
    query_interface : Proc(IWindowsMediaLibrarySharingDeviceProperty*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsMediaLibrarySharingDeviceProperty*, UInt32)
    release : Proc(IWindowsMediaLibrarySharingDeviceProperty*, UInt32)
    get_type_info_count : Proc(IWindowsMediaLibrarySharingDeviceProperty*, UInt32*, HRESULT)
    get_type_info : Proc(IWindowsMediaLibrarySharingDeviceProperty*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWindowsMediaLibrarySharingDeviceProperty*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWindowsMediaLibrarySharingDeviceProperty*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_name : Proc(IWindowsMediaLibrarySharingDeviceProperty*, UInt8**, HRESULT)
    get_value : Proc(IWindowsMediaLibrarySharingDeviceProperty*, VARIANT*, HRESULT)
  end

  IWindowsMediaLibrarySharingDeviceProperty_GUID = "81e26927-7a7d-40a7-81d4-bddc02960e3e"
  IID_IWindowsMediaLibrarySharingDeviceProperty = LibC::GUID.new(0x81e26927_u32, 0x7a7d_u16, 0x40a7_u16, StaticArray[0x81_u8, 0xd4_u8, 0xbd_u8, 0xdc_u8, 0x2_u8, 0x96_u8, 0xe_u8, 0x3e_u8])
  struct IWindowsMediaLibrarySharingDeviceProperty
    lpVtbl : IWindowsMediaLibrarySharingDevicePropertyVTbl*
  end

  struct IWindowsMediaLibrarySharingDevicePropertiesVTbl
    query_interface : Proc(IWindowsMediaLibrarySharingDeviceProperties*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsMediaLibrarySharingDeviceProperties*, UInt32)
    release : Proc(IWindowsMediaLibrarySharingDeviceProperties*, UInt32)
    get_type_info_count : Proc(IWindowsMediaLibrarySharingDeviceProperties*, UInt32*, HRESULT)
    get_type_info : Proc(IWindowsMediaLibrarySharingDeviceProperties*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWindowsMediaLibrarySharingDeviceProperties*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWindowsMediaLibrarySharingDeviceProperties*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IWindowsMediaLibrarySharingDeviceProperties*, Int32, IWindowsMediaLibrarySharingDeviceProperty*, HRESULT)
    get_count : Proc(IWindowsMediaLibrarySharingDeviceProperties*, Int32*, HRESULT)
    get_property : Proc(IWindowsMediaLibrarySharingDeviceProperties*, UInt8*, IWindowsMediaLibrarySharingDeviceProperty*, HRESULT)
  end

  IWindowsMediaLibrarySharingDeviceProperties_GUID = "c4623214-6b06-40c5-a623-b2ff4c076bfd"
  IID_IWindowsMediaLibrarySharingDeviceProperties = LibC::GUID.new(0xc4623214_u32, 0x6b06_u16, 0x40c5_u16, StaticArray[0xa6_u8, 0x23_u8, 0xb2_u8, 0xff_u8, 0x4c_u8, 0x7_u8, 0x6b_u8, 0xfd_u8])
  struct IWindowsMediaLibrarySharingDeviceProperties
    lpVtbl : IWindowsMediaLibrarySharingDevicePropertiesVTbl*
  end

  struct IWindowsMediaLibrarySharingDeviceVTbl
    query_interface : Proc(IWindowsMediaLibrarySharingDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsMediaLibrarySharingDevice*, UInt32)
    release : Proc(IWindowsMediaLibrarySharingDevice*, UInt32)
    get_type_info_count : Proc(IWindowsMediaLibrarySharingDevice*, UInt32*, HRESULT)
    get_type_info : Proc(IWindowsMediaLibrarySharingDevice*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWindowsMediaLibrarySharingDevice*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWindowsMediaLibrarySharingDevice*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_device_id : Proc(IWindowsMediaLibrarySharingDevice*, UInt8**, HRESULT)
    get_authorization : Proc(IWindowsMediaLibrarySharingDevice*, WindowsMediaLibrarySharingDeviceAuthorizationStatus*, HRESULT)
    put_authorization : Proc(IWindowsMediaLibrarySharingDevice*, WindowsMediaLibrarySharingDeviceAuthorizationStatus, HRESULT)
    get_properties : Proc(IWindowsMediaLibrarySharingDevice*, IWindowsMediaLibrarySharingDeviceProperties*, HRESULT)
  end

  IWindowsMediaLibrarySharingDevice_GUID = "3dccc293-4fd9-4191-a25b-8e57c5d27bd4"
  IID_IWindowsMediaLibrarySharingDevice = LibC::GUID.new(0x3dccc293_u32, 0x4fd9_u16, 0x4191_u16, StaticArray[0xa2_u8, 0x5b_u8, 0x8e_u8, 0x57_u8, 0xc5_u8, 0xd2_u8, 0x7b_u8, 0xd4_u8])
  struct IWindowsMediaLibrarySharingDevice
    lpVtbl : IWindowsMediaLibrarySharingDeviceVTbl*
  end

  struct IWindowsMediaLibrarySharingDevicesVTbl
    query_interface : Proc(IWindowsMediaLibrarySharingDevices*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsMediaLibrarySharingDevices*, UInt32)
    release : Proc(IWindowsMediaLibrarySharingDevices*, UInt32)
    get_type_info_count : Proc(IWindowsMediaLibrarySharingDevices*, UInt32*, HRESULT)
    get_type_info : Proc(IWindowsMediaLibrarySharingDevices*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWindowsMediaLibrarySharingDevices*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWindowsMediaLibrarySharingDevices*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_item : Proc(IWindowsMediaLibrarySharingDevices*, Int32, IWindowsMediaLibrarySharingDevice*, HRESULT)
    get_count : Proc(IWindowsMediaLibrarySharingDevices*, Int32*, HRESULT)
    get_device : Proc(IWindowsMediaLibrarySharingDevices*, UInt8*, IWindowsMediaLibrarySharingDevice*, HRESULT)
  end

  IWindowsMediaLibrarySharingDevices_GUID = "1803f9d6-fe6d-4546-bf5b-992fe8ec12d1"
  IID_IWindowsMediaLibrarySharingDevices = LibC::GUID.new(0x1803f9d6_u32, 0xfe6d_u16, 0x4546_u16, StaticArray[0xbf_u8, 0x5b_u8, 0x99_u8, 0x2f_u8, 0xe8_u8, 0xec_u8, 0x12_u8, 0xd1_u8])
  struct IWindowsMediaLibrarySharingDevices
    lpVtbl : IWindowsMediaLibrarySharingDevicesVTbl*
  end

  struct IWindowsMediaLibrarySharingServicesVTbl
    query_interface : Proc(IWindowsMediaLibrarySharingServices*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsMediaLibrarySharingServices*, UInt32)
    release : Proc(IWindowsMediaLibrarySharingServices*, UInt32)
    get_type_info_count : Proc(IWindowsMediaLibrarySharingServices*, UInt32*, HRESULT)
    get_type_info : Proc(IWindowsMediaLibrarySharingServices*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IWindowsMediaLibrarySharingServices*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IWindowsMediaLibrarySharingServices*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    show_share_media_cpl : Proc(IWindowsMediaLibrarySharingServices*, UInt8*, HRESULT)
    get_user_home_media_sharing_state : Proc(IWindowsMediaLibrarySharingServices*, Int16*, HRESULT)
    put_user_home_media_sharing_state : Proc(IWindowsMediaLibrarySharingServices*, Int16, HRESULT)
    get_user_home_media_sharing_library_name : Proc(IWindowsMediaLibrarySharingServices*, UInt8**, HRESULT)
    put_user_home_media_sharing_library_name : Proc(IWindowsMediaLibrarySharingServices*, UInt8*, HRESULT)
    get_computer_home_media_sharing_allowed_state : Proc(IWindowsMediaLibrarySharingServices*, Int16*, HRESULT)
    put_computer_home_media_sharing_allowed_state : Proc(IWindowsMediaLibrarySharingServices*, Int16, HRESULT)
    get_user_internet_media_sharing_state : Proc(IWindowsMediaLibrarySharingServices*, Int16*, HRESULT)
    put_user_internet_media_sharing_state : Proc(IWindowsMediaLibrarySharingServices*, Int16, HRESULT)
    get_computer_internet_media_sharing_allowed_state : Proc(IWindowsMediaLibrarySharingServices*, Int16*, HRESULT)
    put_computer_internet_media_sharing_allowed_state : Proc(IWindowsMediaLibrarySharingServices*, Int16, HRESULT)
    get_internet_media_sharing_security_group : Proc(IWindowsMediaLibrarySharingServices*, UInt8**, HRESULT)
    put_internet_media_sharing_security_group : Proc(IWindowsMediaLibrarySharingServices*, UInt8*, HRESULT)
    get_allow_sharing_to_all_devices : Proc(IWindowsMediaLibrarySharingServices*, Int16*, HRESULT)
    put_allow_sharing_to_all_devices : Proc(IWindowsMediaLibrarySharingServices*, Int16, HRESULT)
    set_default_authorization : Proc(IWindowsMediaLibrarySharingServices*, UInt8*, UInt8*, Int16, HRESULT)
    set_authorization_state : Proc(IWindowsMediaLibrarySharingServices*, UInt8*, Int16, HRESULT)
    get_all_devices : Proc(IWindowsMediaLibrarySharingServices*, IWindowsMediaLibrarySharingDevices*, HRESULT)
    get_custom_settings_applied : Proc(IWindowsMediaLibrarySharingServices*, Int16*, HRESULT)
  end

  IWindowsMediaLibrarySharingServices_GUID = "01f5f85e-0a81-40da-a7c8-21ef3af8440c"
  IID_IWindowsMediaLibrarySharingServices = LibC::GUID.new(0x1f5f85e_u32, 0xa81_u16, 0x40da_u16, StaticArray[0xa7_u8, 0xc8_u8, 0x21_u8, 0xef_u8, 0x3a_u8, 0xf8_u8, 0x44_u8, 0xc_u8])
  struct IWindowsMediaLibrarySharingServices
    lpVtbl : IWindowsMediaLibrarySharingServicesVTbl*
  end

end
struct LibWin32::IWindowsMediaLibrarySharingDeviceProperty
  def query_interface(this : IWindowsMediaLibrarySharingDeviceProperty*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWindowsMediaLibrarySharingDeviceProperty*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWindowsMediaLibrarySharingDeviceProperty*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWindowsMediaLibrarySharingDeviceProperty*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWindowsMediaLibrarySharingDeviceProperty*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWindowsMediaLibrarySharingDeviceProperty*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWindowsMediaLibrarySharingDeviceProperty*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_name(this : IWindowsMediaLibrarySharingDeviceProperty*, name : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, name)
  end
  def get_value(this : IWindowsMediaLibrarySharingDeviceProperty*, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_value.call(this, value)
  end
end
struct LibWin32::IWindowsMediaLibrarySharingDeviceProperties
  def query_interface(this : IWindowsMediaLibrarySharingDeviceProperties*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWindowsMediaLibrarySharingDeviceProperties*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWindowsMediaLibrarySharingDeviceProperties*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWindowsMediaLibrarySharingDeviceProperties*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWindowsMediaLibrarySharingDeviceProperties*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWindowsMediaLibrarySharingDeviceProperties*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWindowsMediaLibrarySharingDeviceProperties*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_item(this : IWindowsMediaLibrarySharingDeviceProperties*, index : Int32, property : IWindowsMediaLibrarySharingDeviceProperty*) : HRESULT
    @lpVtbl.value.get_item.call(this, index, property)
  end
  def get_count(this : IWindowsMediaLibrarySharingDeviceProperties*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get_property(this : IWindowsMediaLibrarySharingDeviceProperties*, name : UInt8*, property : IWindowsMediaLibrarySharingDeviceProperty*) : HRESULT
    @lpVtbl.value.get_property.call(this, name, property)
  end
end
struct LibWin32::IWindowsMediaLibrarySharingDevice
  def query_interface(this : IWindowsMediaLibrarySharingDevice*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWindowsMediaLibrarySharingDevice*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWindowsMediaLibrarySharingDevice*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWindowsMediaLibrarySharingDevice*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWindowsMediaLibrarySharingDevice*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWindowsMediaLibrarySharingDevice*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWindowsMediaLibrarySharingDevice*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_device_id(this : IWindowsMediaLibrarySharingDevice*, deviceid : UInt8**) : HRESULT
    @lpVtbl.value.get_device_id.call(this, deviceid)
  end
  def get_authorization(this : IWindowsMediaLibrarySharingDevice*, authorization : WindowsMediaLibrarySharingDeviceAuthorizationStatus*) : HRESULT
    @lpVtbl.value.get_authorization.call(this, authorization)
  end
  def put_authorization(this : IWindowsMediaLibrarySharingDevice*, authorization : WindowsMediaLibrarySharingDeviceAuthorizationStatus) : HRESULT
    @lpVtbl.value.put_authorization.call(this, authorization)
  end
  def get_properties(this : IWindowsMediaLibrarySharingDevice*, deviceproperties : IWindowsMediaLibrarySharingDeviceProperties*) : HRESULT
    @lpVtbl.value.get_properties.call(this, deviceproperties)
  end
end
struct LibWin32::IWindowsMediaLibrarySharingDevices
  def query_interface(this : IWindowsMediaLibrarySharingDevices*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWindowsMediaLibrarySharingDevices*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWindowsMediaLibrarySharingDevices*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWindowsMediaLibrarySharingDevices*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWindowsMediaLibrarySharingDevices*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWindowsMediaLibrarySharingDevices*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWindowsMediaLibrarySharingDevices*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_item(this : IWindowsMediaLibrarySharingDevices*, index : Int32, device : IWindowsMediaLibrarySharingDevice*) : HRESULT
    @lpVtbl.value.get_item.call(this, index, device)
  end
  def get_count(this : IWindowsMediaLibrarySharingDevices*, count : Int32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get_device(this : IWindowsMediaLibrarySharingDevices*, deviceid : UInt8*, device : IWindowsMediaLibrarySharingDevice*) : HRESULT
    @lpVtbl.value.get_device.call(this, deviceid, device)
  end
end
struct LibWin32::IWindowsMediaLibrarySharingServices
  def query_interface(this : IWindowsMediaLibrarySharingServices*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWindowsMediaLibrarySharingServices*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWindowsMediaLibrarySharingServices*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IWindowsMediaLibrarySharingServices*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IWindowsMediaLibrarySharingServices*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IWindowsMediaLibrarySharingServices*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IWindowsMediaLibrarySharingServices*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def show_share_media_cpl(this : IWindowsMediaLibrarySharingServices*, device : UInt8*) : HRESULT
    @lpVtbl.value.show_share_media_cpl.call(this, device)
  end
  def get_user_home_media_sharing_state(this : IWindowsMediaLibrarySharingServices*, sharingenabled : Int16*) : HRESULT
    @lpVtbl.value.get_user_home_media_sharing_state.call(this, sharingenabled)
  end
  def put_user_home_media_sharing_state(this : IWindowsMediaLibrarySharingServices*, sharingenabled : Int16) : HRESULT
    @lpVtbl.value.put_user_home_media_sharing_state.call(this, sharingenabled)
  end
  def get_user_home_media_sharing_library_name(this : IWindowsMediaLibrarySharingServices*, libraryname : UInt8**) : HRESULT
    @lpVtbl.value.get_user_home_media_sharing_library_name.call(this, libraryname)
  end
  def put_user_home_media_sharing_library_name(this : IWindowsMediaLibrarySharingServices*, libraryname : UInt8*) : HRESULT
    @lpVtbl.value.put_user_home_media_sharing_library_name.call(this, libraryname)
  end
  def get_computer_home_media_sharing_allowed_state(this : IWindowsMediaLibrarySharingServices*, sharingallowed : Int16*) : HRESULT
    @lpVtbl.value.get_computer_home_media_sharing_allowed_state.call(this, sharingallowed)
  end
  def put_computer_home_media_sharing_allowed_state(this : IWindowsMediaLibrarySharingServices*, sharingallowed : Int16) : HRESULT
    @lpVtbl.value.put_computer_home_media_sharing_allowed_state.call(this, sharingallowed)
  end
  def get_user_internet_media_sharing_state(this : IWindowsMediaLibrarySharingServices*, sharingenabled : Int16*) : HRESULT
    @lpVtbl.value.get_user_internet_media_sharing_state.call(this, sharingenabled)
  end
  def put_user_internet_media_sharing_state(this : IWindowsMediaLibrarySharingServices*, sharingenabled : Int16) : HRESULT
    @lpVtbl.value.put_user_internet_media_sharing_state.call(this, sharingenabled)
  end
  def get_computer_internet_media_sharing_allowed_state(this : IWindowsMediaLibrarySharingServices*, sharingallowed : Int16*) : HRESULT
    @lpVtbl.value.get_computer_internet_media_sharing_allowed_state.call(this, sharingallowed)
  end
  def put_computer_internet_media_sharing_allowed_state(this : IWindowsMediaLibrarySharingServices*, sharingallowed : Int16) : HRESULT
    @lpVtbl.value.put_computer_internet_media_sharing_allowed_state.call(this, sharingallowed)
  end
  def get_internet_media_sharing_security_group(this : IWindowsMediaLibrarySharingServices*, securitygroup : UInt8**) : HRESULT
    @lpVtbl.value.get_internet_media_sharing_security_group.call(this, securitygroup)
  end
  def put_internet_media_sharing_security_group(this : IWindowsMediaLibrarySharingServices*, securitygroup : UInt8*) : HRESULT
    @lpVtbl.value.put_internet_media_sharing_security_group.call(this, securitygroup)
  end
  def get_allow_sharing_to_all_devices(this : IWindowsMediaLibrarySharingServices*, sharingenabled : Int16*) : HRESULT
    @lpVtbl.value.get_allow_sharing_to_all_devices.call(this, sharingenabled)
  end
  def put_allow_sharing_to_all_devices(this : IWindowsMediaLibrarySharingServices*, sharingenabled : Int16) : HRESULT
    @lpVtbl.value.put_allow_sharing_to_all_devices.call(this, sharingenabled)
  end
  def set_default_authorization(this : IWindowsMediaLibrarySharingServices*, macaddresses : UInt8*, friendlyname : UInt8*, authorization : Int16) : HRESULT
    @lpVtbl.value.set_default_authorization.call(this, macaddresses, friendlyname, authorization)
  end
  def set_authorization_state(this : IWindowsMediaLibrarySharingServices*, macaddress : UInt8*, authorizationstate : Int16) : HRESULT
    @lpVtbl.value.set_authorization_state.call(this, macaddress, authorizationstate)
  end
  def get_all_devices(this : IWindowsMediaLibrarySharingServices*, devices : IWindowsMediaLibrarySharingDevices*) : HRESULT
    @lpVtbl.value.get_all_devices.call(this, devices)
  end
  def get_custom_settings_applied(this : IWindowsMediaLibrarySharingServices*, customsettingsapplied : Int16*) : HRESULT
    @lpVtbl.value.get_custom_settings_applied.call(this, customsettingsapplied)
  end
end
