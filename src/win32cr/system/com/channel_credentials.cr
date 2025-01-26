require "./../com.cr"
require "./../../foundation.cr"

module Win32cr::System::Com::ChannelCredentials


  @[Extern]
  record IChannelCredentialsVtbl,
    query_interface : Proc(IChannelCredentials*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IChannelCredentials*, UInt32),
    release : Proc(IChannelCredentials*, UInt32),
    get_type_info_count : Proc(IChannelCredentials*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IChannelCredentials*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IChannelCredentials*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IChannelCredentials*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    set_windows_credential : Proc(IChannelCredentials*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_user_name_credential : Proc(IChannelCredentials*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    set_client_certificate_from_store : Proc(IChannelCredentials*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    set_client_certificate_from_store_by_name : Proc(IChannelCredentials*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    set_client_certificate_from_file : Proc(IChannelCredentials*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    set_default_service_certificate_from_store : Proc(IChannelCredentials*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    set_default_service_certificate_from_store_by_name : Proc(IChannelCredentials*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    set_default_service_certificate_from_file : Proc(IChannelCredentials*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    set_service_certificate_authentication : Proc(IChannelCredentials*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    set_issued_token : Proc(IChannelCredentials*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IChannelCredentials, lpVtbl : IChannelCredentialsVtbl* do
    GUID = LibC::GUID.new(0x181b448c_u32, 0xc17c_u16, 0x4b17_u16, StaticArray[0xac_u8, 0x6d_u8, 0x6_u8, 0x69_u8, 0x9b_u8, 0x93_u8, 0x19_u8, 0x8f_u8])
    def query_interface(this : IChannelCredentials*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IChannelCredentials*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IChannelCredentials*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IChannelCredentials*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IChannelCredentials*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IChannelCredentials*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IChannelCredentials*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def set_windows_credential(this : IChannelCredentials*, domain : Win32cr::Foundation::BSTR, username : Win32cr::Foundation::BSTR, password : Win32cr::Foundation::BSTR, impersonationLevel : Int32, allowNtlm : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_windows_credential.call(this, domain, username, password, impersonationLevel, allowNtlm)
    end
    def set_user_name_credential(this : IChannelCredentials*, username : Win32cr::Foundation::BSTR, password : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_user_name_credential.call(this, username, password)
    end
    def set_client_certificate_from_store(this : IChannelCredentials*, storeLocation : Win32cr::Foundation::BSTR, storeName : Win32cr::Foundation::BSTR, findYype : Win32cr::Foundation::BSTR, findValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_certificate_from_store.call(this, storeLocation, storeName, findYype, findValue)
    end
    def set_client_certificate_from_store_by_name(this : IChannelCredentials*, subjectName : Win32cr::Foundation::BSTR, storeLocation : Win32cr::Foundation::BSTR, storeName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_certificate_from_store_by_name.call(this, subjectName, storeLocation, storeName)
    end
    def set_client_certificate_from_file(this : IChannelCredentials*, filename : Win32cr::Foundation::BSTR, password : Win32cr::Foundation::BSTR, keystorageFlags : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_client_certificate_from_file.call(this, filename, password, keystorageFlags)
    end
    def set_default_service_certificate_from_store(this : IChannelCredentials*, storeLocation : Win32cr::Foundation::BSTR, storeName : Win32cr::Foundation::BSTR, findType : Win32cr::Foundation::BSTR, findValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_service_certificate_from_store.call(this, storeLocation, storeName, findType, findValue)
    end
    def set_default_service_certificate_from_store_by_name(this : IChannelCredentials*, subjectName : Win32cr::Foundation::BSTR, storeLocation : Win32cr::Foundation::BSTR, storeName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_service_certificate_from_store_by_name.call(this, subjectName, storeLocation, storeName)
    end
    def set_default_service_certificate_from_file(this : IChannelCredentials*, filename : Win32cr::Foundation::BSTR, password : Win32cr::Foundation::BSTR, keystorageFlags : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_service_certificate_from_file.call(this, filename, password, keystorageFlags)
    end
    def set_service_certificate_authentication(this : IChannelCredentials*, storeLocation : Win32cr::Foundation::BSTR, revocationMode : Win32cr::Foundation::BSTR, certificateValidationMode : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_service_certificate_authentication.call(this, storeLocation, revocationMode, certificateValidationMode)
    end
    def set_issued_token(this : IChannelCredentials*, localIssuerAddres : Win32cr::Foundation::BSTR, localIssuerBindingType : Win32cr::Foundation::BSTR, localIssuerBinding : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_issued_token.call(this, localIssuerAddres, localIssuerBindingType, localIssuerBinding)
    end

  end

end