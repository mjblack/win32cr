require "../../system/com.cr"
require "../../foundation.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
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
