require "../../system/com.cr"
require "../../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32

  struct IChannelCredentialsVTbl
    query_interface : Proc(IChannelCredentials*, Guid*, Void**, HRESULT)
    add_ref : Proc(IChannelCredentials*, UInt32)
    release : Proc(IChannelCredentials*, UInt32)
    get_type_info_count : Proc(IChannelCredentials*, UInt32*, HRESULT)
    get_type_info : Proc(IChannelCredentials*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IChannelCredentials*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IChannelCredentials*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    set_windows_credential : Proc(IChannelCredentials*, UInt8*, UInt8*, UInt8*, Int32, LibC::BOOL, HRESULT)
    set_user_name_credential : Proc(IChannelCredentials*, UInt8*, UInt8*, HRESULT)
    set_client_certificate_from_store : Proc(IChannelCredentials*, UInt8*, UInt8*, UInt8*, VARIANT, HRESULT)
    set_client_certificate_from_store_by_name : Proc(IChannelCredentials*, UInt8*, UInt8*, UInt8*, HRESULT)
    set_client_certificate_from_file : Proc(IChannelCredentials*, UInt8*, UInt8*, UInt8*, HRESULT)
    set_default_service_certificate_from_store : Proc(IChannelCredentials*, UInt8*, UInt8*, UInt8*, VARIANT, HRESULT)
    set_default_service_certificate_from_store_by_name : Proc(IChannelCredentials*, UInt8*, UInt8*, UInt8*, HRESULT)
    set_default_service_certificate_from_file : Proc(IChannelCredentials*, UInt8*, UInt8*, UInt8*, HRESULT)
    set_service_certificate_authentication : Proc(IChannelCredentials*, UInt8*, UInt8*, UInt8*, HRESULT)
    set_issued_token : Proc(IChannelCredentials*, UInt8*, UInt8*, UInt8*, HRESULT)
  end

  IChannelCredentials_GUID = "181b448c-c17c-4b17-ac6d-06699b93198f"
  IID_IChannelCredentials = LibC::GUID.new(0x181b448c_u32, 0xc17c_u16, 0x4b17_u16, StaticArray[0xac_u8, 0x6d_u8, 0x6_u8, 0x69_u8, 0x9b_u8, 0x93_u8, 0x19_u8, 0x8f_u8])
  struct IChannelCredentials
    lpVtbl : IChannelCredentialsVTbl*
  end

end
struct LibWin32::IChannelCredentials
  def query_interface(this : IChannelCredentials*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IChannelCredentials*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IChannelCredentials*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IChannelCredentials*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IChannelCredentials*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IChannelCredentials*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IChannelCredentials*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def set_windows_credential(this : IChannelCredentials*, domain : UInt8*, username : UInt8*, password : UInt8*, impersonationlevel : Int32, allowntlm : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_windows_credential.call(this, domain, username, password, impersonationlevel, allowntlm)
  end
  def set_user_name_credential(this : IChannelCredentials*, username : UInt8*, password : UInt8*) : HRESULT
    @lpVtbl.value.set_user_name_credential.call(this, username, password)
  end
  def set_client_certificate_from_store(this : IChannelCredentials*, storelocation : UInt8*, storename : UInt8*, findyype : UInt8*, findvalue : VARIANT) : HRESULT
    @lpVtbl.value.set_client_certificate_from_store.call(this, storelocation, storename, findyype, findvalue)
  end
  def set_client_certificate_from_store_by_name(this : IChannelCredentials*, subjectname : UInt8*, storelocation : UInt8*, storename : UInt8*) : HRESULT
    @lpVtbl.value.set_client_certificate_from_store_by_name.call(this, subjectname, storelocation, storename)
  end
  def set_client_certificate_from_file(this : IChannelCredentials*, filename : UInt8*, password : UInt8*, keystorageflags : UInt8*) : HRESULT
    @lpVtbl.value.set_client_certificate_from_file.call(this, filename, password, keystorageflags)
  end
  def set_default_service_certificate_from_store(this : IChannelCredentials*, storelocation : UInt8*, storename : UInt8*, findtype : UInt8*, findvalue : VARIANT) : HRESULT
    @lpVtbl.value.set_default_service_certificate_from_store.call(this, storelocation, storename, findtype, findvalue)
  end
  def set_default_service_certificate_from_store_by_name(this : IChannelCredentials*, subjectname : UInt8*, storelocation : UInt8*, storename : UInt8*) : HRESULT
    @lpVtbl.value.set_default_service_certificate_from_store_by_name.call(this, subjectname, storelocation, storename)
  end
  def set_default_service_certificate_from_file(this : IChannelCredentials*, filename : UInt8*, password : UInt8*, keystorageflags : UInt8*) : HRESULT
    @lpVtbl.value.set_default_service_certificate_from_file.call(this, filename, password, keystorageflags)
  end
  def set_service_certificate_authentication(this : IChannelCredentials*, storelocation : UInt8*, revocationmode : UInt8*, certificatevalidationmode : UInt8*) : HRESULT
    @lpVtbl.value.set_service_certificate_authentication.call(this, storelocation, revocationmode, certificatevalidationmode)
  end
  def set_issued_token(this : IChannelCredentials*, localissueraddres : UInt8*, localissuerbindingtype : UInt8*, localissuerbinding : UInt8*) : HRESULT
    @lpVtbl.value.set_issued_token.call(this, localissueraddres, localissuerbindingtype, localissuerbinding)
  end
end
