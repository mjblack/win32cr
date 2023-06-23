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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    set_windows_credential : UInt64
    set_user_name_credential : UInt64
    set_client_certificate_from_store : UInt64
    set_client_certificate_from_store_by_name : UInt64
    set_client_certificate_from_file : UInt64
    set_default_service_certificate_from_store : UInt64
    set_default_service_certificate_from_store_by_name : UInt64
    set_default_service_certificate_from_file : UInt64
    set_service_certificate_authentication : UInt64
    set_issued_token : UInt64
  end

  IChannelCredentials_GUID = "181b448c-c17c-4b17-ac6d-06699b93198f"
  IID_IChannelCredentials = LibC::GUID.new(0x181b448c_u32, 0xc17c_u16, 0x4b17_u16, StaticArray[0xac_u8, 0x6d_u8, 0x6_u8, 0x69_u8, 0x9b_u8, 0x93_u8, 0x19_u8, 0x8f_u8])
  struct IChannelCredentials
    lpVtbl : IChannelCredentialsVTbl*
  end

end
struct LibWin32::IChannelCredentials
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
  def set_windows_credential(domain : UInt8*, username : UInt8*, password : UInt8*, impersonationlevel : Int32, allowntlm : LibC::BOOL) : HRESULT
    @lpVtbl.value.set_windows_credential.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, Int32, LibC::BOOL, HRESULT)).call(domain, username, password, impersonationlevel, allowntlm)
  end
  def set_user_name_credential(username : UInt8*, password : UInt8*) : HRESULT
    @lpVtbl.value.set_user_name_credential.unsafe_as(Proc(UInt8*, UInt8*, HRESULT)).call(username, password)
  end
  def set_client_certificate_from_store(storelocation : UInt8*, storename : UInt8*, findyype : UInt8*, findvalue : VARIANT) : HRESULT
    @lpVtbl.value.set_client_certificate_from_store.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, VARIANT, HRESULT)).call(storelocation, storename, findyype, findvalue)
  end
  def set_client_certificate_from_store_by_name(subjectname : UInt8*, storelocation : UInt8*, storename : UInt8*) : HRESULT
    @lpVtbl.value.set_client_certificate_from_store_by_name.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(subjectname, storelocation, storename)
  end
  def set_client_certificate_from_file(filename : UInt8*, password : UInt8*, keystorageflags : UInt8*) : HRESULT
    @lpVtbl.value.set_client_certificate_from_file.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(filename, password, keystorageflags)
  end
  def set_default_service_certificate_from_store(storelocation : UInt8*, storename : UInt8*, findtype : UInt8*, findvalue : VARIANT) : HRESULT
    @lpVtbl.value.set_default_service_certificate_from_store.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, VARIANT, HRESULT)).call(storelocation, storename, findtype, findvalue)
  end
  def set_default_service_certificate_from_store_by_name(subjectname : UInt8*, storelocation : UInt8*, storename : UInt8*) : HRESULT
    @lpVtbl.value.set_default_service_certificate_from_store_by_name.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(subjectname, storelocation, storename)
  end
  def set_default_service_certificate_from_file(filename : UInt8*, password : UInt8*, keystorageflags : UInt8*) : HRESULT
    @lpVtbl.value.set_default_service_certificate_from_file.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(filename, password, keystorageflags)
  end
  def set_service_certificate_authentication(storelocation : UInt8*, revocationmode : UInt8*, certificatevalidationmode : UInt8*) : HRESULT
    @lpVtbl.value.set_service_certificate_authentication.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(storelocation, revocationmode, certificatevalidationmode)
  end
  def set_issued_token(localissueraddres : UInt8*, localissuerbindingtype : UInt8*, localissuerbinding : UInt8*) : HRESULT
    @lpVtbl.value.set_issued_token.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(localissueraddres, localissuerbindingtype, localissuerbinding)
  end
end
