require "./../com.cr"
require "./../../foundation.cr"

module Win32cr::System::Com::Events

  CLSID_CEventSystem = LibC::GUID.new(0x4e14fba2_u32, 0x2e22_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])

  CLSID_CEventPublisher = LibC::GUID.new(0xab944620_u32, 0x79c6_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])

  CLSID_CEventClass = LibC::GUID.new(0xcdbec9c0_u32, 0x7a68_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])

  CLSID_CEventSubscription = LibC::GUID.new(0x7542e960_u32, 0x79c7_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])

  CLSID_EventObjectChange = LibC::GUID.new(0xd0565000_u32, 0x9df4_u16, 0x11d1_u16, StaticArray[0xa2_u8, 0x81_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xca_u8, 0xa_u8, 0xa7_u8])

  CLSID_EventObjectChange2 = LibC::GUID.new(0xbb07bacd_u32, 0xcd56_u16, 0x4e63_u16, StaticArray[0xa8_u8, 0xff_u8, 0xcb_u8, 0xf0_u8, 0x35_u8, 0x5f_u8, 0xb9_u8, 0xf4_u8])

  enum EOC_ChangeType
    EOC_NewObject = 0_i32
    EOC_ModifiedObject = 1_i32
    EOC_DeletedObject = 2_i32
  end

  @[Extern]
  record COMEVENTSYSCHANGEINFO,
    cbSize : UInt32,
    changeType : Win32cr::System::Com::Events::EOC_ChangeType,
    objectId : Win32cr::Foundation::BSTR,
    partitionId : Win32cr::Foundation::BSTR,
    applicationId : Win32cr::Foundation::BSTR,
    reserved : LibC::GUID[10]

  @[Extern]
  record IEventSystemVtbl,
    query_interface : Proc(IEventSystem*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEventSystem*, UInt32),
    release : Proc(IEventSystem*, UInt32),
    get_type_info_count : Proc(IEventSystem*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IEventSystem*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IEventSystem*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IEventSystem*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    query : Proc(IEventSystem*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32*, Void**, Win32cr::Foundation::HRESULT),
    store : Proc(IEventSystem*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT),
    remove : Proc(IEventSystem*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::HRESULT),
    get_EventObjectChangeEventClassID : Proc(IEventSystem*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    query_s : Proc(IEventSystem*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    remove_s : Proc(IEventSystem*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4e14fb9f-2e22-11d1-9964-00c04fbbb345")]
  record IEventSystem, lpVtbl : IEventSystemVtbl* do
    GUID = LibC::GUID.new(0x4e14fb9f_u32, 0x2e22_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
    def query_interface(this : IEventSystem*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEventSystem*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEventSystem*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IEventSystem*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IEventSystem*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IEventSystem*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IEventSystem*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def query(this : IEventSystem*, progID : Win32cr::Foundation::BSTR, queryCriteria : Win32cr::Foundation::BSTR, errorIndex : Int32*, ppInterface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query.call(this, progID, queryCriteria, errorIndex, ppInterface)
    end
    def store(this : IEventSystem*, prog_id : Win32cr::Foundation::BSTR, pInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.store.call(this, prog_id, pInterface)
    end
    def remove(this : IEventSystem*, progID : Win32cr::Foundation::BSTR, queryCriteria : Win32cr::Foundation::BSTR, errorIndex : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, progID, queryCriteria, errorIndex)
    end
    def get_EventObjectChangeEventClassID(this : IEventSystem*, pbstrEventClassID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventObjectChangeEventClassID.call(this, pbstrEventClassID)
    end
    def query_s(this : IEventSystem*, progID : Win32cr::Foundation::BSTR, queryCriteria : Win32cr::Foundation::BSTR, ppInterface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_s.call(this, progID, queryCriteria, ppInterface)
    end
    def remove_s(this : IEventSystem*, progID : Win32cr::Foundation::BSTR, queryCriteria : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_s.call(this, progID, queryCriteria)
    end

  end

  @[Extern]
  record IEventPublisherVtbl,
    query_interface : Proc(IEventPublisher*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEventPublisher*, UInt32),
    release : Proc(IEventPublisher*, UInt32),
    get_type_info_count : Proc(IEventPublisher*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IEventPublisher*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IEventPublisher*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IEventPublisher*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_PublisherID : Proc(IEventPublisher*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PublisherID : Proc(IEventPublisher*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PublisherName : Proc(IEventPublisher*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PublisherName : Proc(IEventPublisher*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PublisherType : Proc(IEventPublisher*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PublisherType : Proc(IEventPublisher*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OwnerSID : Proc(IEventPublisher*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_OwnerSID : Proc(IEventPublisher*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IEventPublisher*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IEventPublisher*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_default_property : Proc(IEventPublisher*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_default_property : Proc(IEventPublisher*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    remove_default_property : Proc(IEventPublisher*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_default_property_collection : Proc(IEventPublisher*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e341516b-2e32-11d1-9964-00c04fbbb345")]
  record IEventPublisher, lpVtbl : IEventPublisherVtbl* do
    GUID = LibC::GUID.new(0xe341516b_u32, 0x2e32_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
    def query_interface(this : IEventPublisher*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEventPublisher*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEventPublisher*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IEventPublisher*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IEventPublisher*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IEventPublisher*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IEventPublisher*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_PublisherID(this : IEventPublisher*, pbstrPublisherID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PublisherID.call(this, pbstrPublisherID)
    end
    def put_PublisherID(this : IEventPublisher*, bstrPublisherID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PublisherID.call(this, bstrPublisherID)
    end
    def get_PublisherName(this : IEventPublisher*, pbstrPublisherName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PublisherName.call(this, pbstrPublisherName)
    end
    def put_PublisherName(this : IEventPublisher*, bstrPublisherName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PublisherName.call(this, bstrPublisherName)
    end
    def get_PublisherType(this : IEventPublisher*, pbstrPublisherType : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PublisherType.call(this, pbstrPublisherType)
    end
    def put_PublisherType(this : IEventPublisher*, bstrPublisherType : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PublisherType.call(this, bstrPublisherType)
    end
    def get_OwnerSID(this : IEventPublisher*, pbstrOwnerSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OwnerSID.call(this, pbstrOwnerSID)
    end
    def put_OwnerSID(this : IEventPublisher*, bstrOwnerSID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OwnerSID.call(this, bstrOwnerSID)
    end
    def get_Description(this : IEventPublisher*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IEventPublisher*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_default_property(this : IEventPublisher*, bstrPropertyName : Win32cr::Foundation::BSTR, propertyValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_property.call(this, bstrPropertyName, propertyValue)
    end
    def put_default_property(this : IEventPublisher*, bstrPropertyName : Win32cr::Foundation::BSTR, propertyValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_default_property.call(this, bstrPropertyName, propertyValue)
    end
    def remove_default_property(this : IEventPublisher*, bstrPropertyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_default_property.call(this, bstrPropertyName)
    end
    def get_default_property_collection(this : IEventPublisher*, collection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_default_property_collection.call(this, collection)
    end

  end

  @[Extern]
  record IEventClassVtbl,
    query_interface : Proc(IEventClass*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEventClass*, UInt32),
    release : Proc(IEventClass*, UInt32),
    get_type_info_count : Proc(IEventClass*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IEventClass*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IEventClass*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IEventClass*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_EventClassID : Proc(IEventClass*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EventClassID : Proc(IEventClass*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EventClassName : Proc(IEventClass*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EventClassName : Proc(IEventClass*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OwnerSID : Proc(IEventClass*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_OwnerSID : Proc(IEventClass*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FiringInterfaceID : Proc(IEventClass*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FiringInterfaceID : Proc(IEventClass*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IEventClass*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IEventClass*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_CustomConfigCLSID : Proc(IEventClass*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_CustomConfigCLSID : Proc(IEventClass*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TypeLib : Proc(IEventClass*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TypeLib : Proc(IEventClass*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fb2b72a0-7a68-11d1-88f9-0080c7d771bf")]
  record IEventClass, lpVtbl : IEventClassVtbl* do
    GUID = LibC::GUID.new(0xfb2b72a0_u32, 0x7a68_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
    def query_interface(this : IEventClass*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEventClass*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEventClass*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IEventClass*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IEventClass*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IEventClass*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IEventClass*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_EventClassID(this : IEventClass*, pbstrEventClassID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventClassID.call(this, pbstrEventClassID)
    end
    def put_EventClassID(this : IEventClass*, bstrEventClassID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventClassID.call(this, bstrEventClassID)
    end
    def get_EventClassName(this : IEventClass*, pbstrEventClassName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventClassName.call(this, pbstrEventClassName)
    end
    def put_EventClassName(this : IEventClass*, bstrEventClassName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventClassName.call(this, bstrEventClassName)
    end
    def get_OwnerSID(this : IEventClass*, pbstrOwnerSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OwnerSID.call(this, pbstrOwnerSID)
    end
    def put_OwnerSID(this : IEventClass*, bstrOwnerSID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OwnerSID.call(this, bstrOwnerSID)
    end
    def get_FiringInterfaceID(this : IEventClass*, pbstrFiringInterfaceID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FiringInterfaceID.call(this, pbstrFiringInterfaceID)
    end
    def put_FiringInterfaceID(this : IEventClass*, bstrFiringInterfaceID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FiringInterfaceID.call(this, bstrFiringInterfaceID)
    end
    def get_Description(this : IEventClass*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IEventClass*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_CustomConfigCLSID(this : IEventClass*, pbstrCustomConfigCLSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CustomConfigCLSID.call(this, pbstrCustomConfigCLSID)
    end
    def put_CustomConfigCLSID(this : IEventClass*, bstrCustomConfigCLSID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CustomConfigCLSID.call(this, bstrCustomConfigCLSID)
    end
    def get_TypeLib(this : IEventClass*, pbstrTypeLib : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TypeLib.call(this, pbstrTypeLib)
    end
    def put_TypeLib(this : IEventClass*, bstrTypeLib : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TypeLib.call(this, bstrTypeLib)
    end

  end

  @[Extern]
  record IEventClass2Vtbl,
    query_interface : Proc(IEventClass2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEventClass2*, UInt32),
    release : Proc(IEventClass2*, UInt32),
    get_type_info_count : Proc(IEventClass2*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IEventClass2*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IEventClass2*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IEventClass2*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_EventClassID : Proc(IEventClass2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EventClassID : Proc(IEventClass2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EventClassName : Proc(IEventClass2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EventClassName : Proc(IEventClass2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_OwnerSID : Proc(IEventClass2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_OwnerSID : Proc(IEventClass2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_FiringInterfaceID : Proc(IEventClass2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_FiringInterfaceID : Proc(IEventClass2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IEventClass2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IEventClass2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_CustomConfigCLSID : Proc(IEventClass2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_CustomConfigCLSID : Proc(IEventClass2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_TypeLib : Proc(IEventClass2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_TypeLib : Proc(IEventClass2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PublisherID : Proc(IEventClass2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PublisherID : Proc(IEventClass2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MultiInterfacePublisherFilterCLSID : Proc(IEventClass2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MultiInterfacePublisherFilterCLSID : Proc(IEventClass2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_AllowInprocActivation : Proc(IEventClass2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_AllowInprocActivation : Proc(IEventClass2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_FireInParallel : Proc(IEventClass2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_FireInParallel : Proc(IEventClass2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fb2b72a1-7a68-11d1-88f9-0080c7d771bf")]
  record IEventClass2, lpVtbl : IEventClass2Vtbl* do
    GUID = LibC::GUID.new(0xfb2b72a1_u32, 0x7a68_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xf9_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
    def query_interface(this : IEventClass2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEventClass2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEventClass2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IEventClass2*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IEventClass2*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IEventClass2*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IEventClass2*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_EventClassID(this : IEventClass2*, pbstrEventClassID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventClassID.call(this, pbstrEventClassID)
    end
    def put_EventClassID(this : IEventClass2*, bstrEventClassID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventClassID.call(this, bstrEventClassID)
    end
    def get_EventClassName(this : IEventClass2*, pbstrEventClassName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventClassName.call(this, pbstrEventClassName)
    end
    def put_EventClassName(this : IEventClass2*, bstrEventClassName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventClassName.call(this, bstrEventClassName)
    end
    def get_OwnerSID(this : IEventClass2*, pbstrOwnerSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OwnerSID.call(this, pbstrOwnerSID)
    end
    def put_OwnerSID(this : IEventClass2*, bstrOwnerSID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OwnerSID.call(this, bstrOwnerSID)
    end
    def get_FiringInterfaceID(this : IEventClass2*, pbstrFiringInterfaceID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FiringInterfaceID.call(this, pbstrFiringInterfaceID)
    end
    def put_FiringInterfaceID(this : IEventClass2*, bstrFiringInterfaceID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FiringInterfaceID.call(this, bstrFiringInterfaceID)
    end
    def get_Description(this : IEventClass2*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IEventClass2*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_CustomConfigCLSID(this : IEventClass2*, pbstrCustomConfigCLSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CustomConfigCLSID.call(this, pbstrCustomConfigCLSID)
    end
    def put_CustomConfigCLSID(this : IEventClass2*, bstrCustomConfigCLSID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CustomConfigCLSID.call(this, bstrCustomConfigCLSID)
    end
    def get_TypeLib(this : IEventClass2*, pbstrTypeLib : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TypeLib.call(this, pbstrTypeLib)
    end
    def put_TypeLib(this : IEventClass2*, bstrTypeLib : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TypeLib.call(this, bstrTypeLib)
    end
    def get_PublisherID(this : IEventClass2*, pbstrPublisherID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PublisherID.call(this, pbstrPublisherID)
    end
    def put_PublisherID(this : IEventClass2*, bstrPublisherID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PublisherID.call(this, bstrPublisherID)
    end
    def get_MultiInterfacePublisherFilterCLSID(this : IEventClass2*, pbstrPubFilCLSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MultiInterfacePublisherFilterCLSID.call(this, pbstrPubFilCLSID)
    end
    def put_MultiInterfacePublisherFilterCLSID(this : IEventClass2*, bstrPubFilCLSID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MultiInterfacePublisherFilterCLSID.call(this, bstrPubFilCLSID)
    end
    def get_AllowInprocActivation(this : IEventClass2*, pfAllowInprocActivation : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowInprocActivation.call(this, pfAllowInprocActivation)
    end
    def put_AllowInprocActivation(this : IEventClass2*, fAllowInprocActivation : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowInprocActivation.call(this, fAllowInprocActivation)
    end
    def get_FireInParallel(this : IEventClass2*, pfFireInParallel : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FireInParallel.call(this, pfFireInParallel)
    end
    def put_FireInParallel(this : IEventClass2*, fFireInParallel : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FireInParallel.call(this, fFireInParallel)
    end

  end

  @[Extern]
  record IEventSubscriptionVtbl,
    query_interface : Proc(IEventSubscription*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEventSubscription*, UInt32),
    release : Proc(IEventSubscription*, UInt32),
    get_type_info_count : Proc(IEventSubscription*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IEventSubscription*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IEventSubscription*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IEventSubscription*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_SubscriptionID : Proc(IEventSubscription*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SubscriptionID : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SubscriptionName : Proc(IEventSubscription*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SubscriptionName : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_PublisherID : Proc(IEventSubscription*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_PublisherID : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_EventClassID : Proc(IEventSubscription*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_EventClassID : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MethodName : Proc(IEventSubscription*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MethodName : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SubscriberCLSID : Proc(IEventSubscription*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_SubscriberCLSID : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_SubscriberInterface : Proc(IEventSubscription*, Void**, Win32cr::Foundation::HRESULT),
    put_SubscriberInterface : Proc(IEventSubscription*, Void*, Win32cr::Foundation::HRESULT),
    get_PerUser : Proc(IEventSubscription*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_PerUser : Proc(IEventSubscription*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_OwnerSID : Proc(IEventSubscription*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_OwnerSID : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Enabled : Proc(IEventSubscription*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_Enabled : Proc(IEventSubscription*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_Description : Proc(IEventSubscription*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Description : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_MachineName : Proc(IEventSubscription*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_MachineName : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_publisher_property : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_publisher_property : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    remove_publisher_property : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_publisher_property_collection : Proc(IEventSubscription*, Void**, Win32cr::Foundation::HRESULT),
    get_subscriber_property : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_subscriber_property : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    remove_subscriber_property : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_subscriber_property_collection : Proc(IEventSubscription*, Void**, Win32cr::Foundation::HRESULT),
    get_InterfaceID : Proc(IEventSubscription*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_InterfaceID : Proc(IEventSubscription*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4a6b0e15-2e38-11d1-9965-00c04fbbb345")]
  record IEventSubscription, lpVtbl : IEventSubscriptionVtbl* do
    GUID = LibC::GUID.new(0x4a6b0e15_u32, 0x2e38_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x65_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
    def query_interface(this : IEventSubscription*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEventSubscription*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEventSubscription*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IEventSubscription*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IEventSubscription*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IEventSubscription*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IEventSubscription*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_SubscriptionID(this : IEventSubscription*, pbstrSubscriptionID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubscriptionID.call(this, pbstrSubscriptionID)
    end
    def put_SubscriptionID(this : IEventSubscription*, bstrSubscriptionID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SubscriptionID.call(this, bstrSubscriptionID)
    end
    def get_SubscriptionName(this : IEventSubscription*, pbstrSubscriptionName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubscriptionName.call(this, pbstrSubscriptionName)
    end
    def put_SubscriptionName(this : IEventSubscription*, bstrSubscriptionName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SubscriptionName.call(this, bstrSubscriptionName)
    end
    def get_PublisherID(this : IEventSubscription*, pbstrPublisherID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PublisherID.call(this, pbstrPublisherID)
    end
    def put_PublisherID(this : IEventSubscription*, bstrPublisherID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PublisherID.call(this, bstrPublisherID)
    end
    def get_EventClassID(this : IEventSubscription*, pbstrEventClassID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_EventClassID.call(this, pbstrEventClassID)
    end
    def put_EventClassID(this : IEventSubscription*, bstrEventClassID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_EventClassID.call(this, bstrEventClassID)
    end
    def get_MethodName(this : IEventSubscription*, pbstrMethodName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MethodName.call(this, pbstrMethodName)
    end
    def put_MethodName(this : IEventSubscription*, bstrMethodName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MethodName.call(this, bstrMethodName)
    end
    def get_SubscriberCLSID(this : IEventSubscription*, pbstrSubscriberCLSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubscriberCLSID.call(this, pbstrSubscriberCLSID)
    end
    def put_SubscriberCLSID(this : IEventSubscription*, bstrSubscriberCLSID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SubscriberCLSID.call(this, bstrSubscriberCLSID)
    end
    def get_SubscriberInterface(this : IEventSubscription*, ppSubscriberInterface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SubscriberInterface.call(this, ppSubscriberInterface)
    end
    def put_SubscriberInterface(this : IEventSubscription*, pSubscriberInterface : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SubscriberInterface.call(this, pSubscriberInterface)
    end
    def get_PerUser(this : IEventSubscription*, pfPerUser : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PerUser.call(this, pfPerUser)
    end
    def put_PerUser(this : IEventSubscription*, fPerUser : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_PerUser.call(this, fPerUser)
    end
    def get_OwnerSID(this : IEventSubscription*, pbstrOwnerSID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_OwnerSID.call(this, pbstrOwnerSID)
    end
    def put_OwnerSID(this : IEventSubscription*, bstrOwnerSID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_OwnerSID.call(this, bstrOwnerSID)
    end
    def get_Enabled(this : IEventSubscription*, pfEnabled : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Enabled.call(this, pfEnabled)
    end
    def put_Enabled(this : IEventSubscription*, fEnabled : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Enabled.call(this, fEnabled)
    end
    def get_Description(this : IEventSubscription*, pbstrDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pbstrDescription)
    end
    def put_Description(this : IEventSubscription*, bstrDescription : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Description.call(this, bstrDescription)
    end
    def get_MachineName(this : IEventSubscription*, pbstrMachineName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MachineName.call(this, pbstrMachineName)
    end
    def put_MachineName(this : IEventSubscription*, bstrMachineName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_MachineName.call(this, bstrMachineName)
    end
    def get_publisher_property(this : IEventSubscription*, bstrPropertyName : Win32cr::Foundation::BSTR, propertyValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_publisher_property.call(this, bstrPropertyName, propertyValue)
    end
    def put_publisher_property(this : IEventSubscription*, bstrPropertyName : Win32cr::Foundation::BSTR, propertyValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_publisher_property.call(this, bstrPropertyName, propertyValue)
    end
    def remove_publisher_property(this : IEventSubscription*, bstrPropertyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_publisher_property.call(this, bstrPropertyName)
    end
    def get_publisher_property_collection(this : IEventSubscription*, collection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_publisher_property_collection.call(this, collection)
    end
    def get_subscriber_property(this : IEventSubscription*, bstrPropertyName : Win32cr::Foundation::BSTR, propertyValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_subscriber_property.call(this, bstrPropertyName, propertyValue)
    end
    def put_subscriber_property(this : IEventSubscription*, bstrPropertyName : Win32cr::Foundation::BSTR, propertyValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_subscriber_property.call(this, bstrPropertyName, propertyValue)
    end
    def remove_subscriber_property(this : IEventSubscription*, bstrPropertyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_subscriber_property.call(this, bstrPropertyName)
    end
    def get_subscriber_property_collection(this : IEventSubscription*, collection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_subscriber_property_collection.call(this, collection)
    end
    def get_InterfaceID(this : IEventSubscription*, pbstrInterfaceID : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_InterfaceID.call(this, pbstrInterfaceID)
    end
    def put_InterfaceID(this : IEventSubscription*, bstrInterfaceID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_InterfaceID.call(this, bstrInterfaceID)
    end

  end

  @[Extern]
  record IFiringControlVtbl,
    query_interface : Proc(IFiringControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IFiringControl*, UInt32),
    release : Proc(IFiringControl*, UInt32),
    get_type_info_count : Proc(IFiringControl*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IFiringControl*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IFiringControl*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IFiringControl*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    fire_subscription : Proc(IFiringControl*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e0498c93-4efe-11d1-9971-00c04fbbb345")]
  record IFiringControl, lpVtbl : IFiringControlVtbl* do
    GUID = LibC::GUID.new(0xe0498c93_u32, 0x4efe_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x71_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
    def query_interface(this : IFiringControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IFiringControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IFiringControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IFiringControl*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IFiringControl*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IFiringControl*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IFiringControl*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def fire_subscription(this : IFiringControl*, subscription : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.fire_subscription.call(this, subscription)
    end

  end

  @[Extern]
  record IPublisherFilterVtbl,
    query_interface : Proc(IPublisherFilter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPublisherFilter*, UInt32),
    release : Proc(IPublisherFilter*, UInt32),
    initialize__ : Proc(IPublisherFilter*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT),
    prepare_to_fire : Proc(IPublisherFilter*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("465e5cc0-7b26-11d1-88fb-0080c7d771bf")]
  record IPublisherFilter, lpVtbl : IPublisherFilterVtbl* do
    GUID = LibC::GUID.new(0x465e5cc0_u32, 0x7b26_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xfb_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
    def query_interface(this : IPublisherFilter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPublisherFilter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPublisherFilter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IPublisherFilter*, methodName : Win32cr::Foundation::BSTR, dispUserDefined : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, methodName, dispUserDefined)
    end
    def prepare_to_fire(this : IPublisherFilter*, methodName : Win32cr::Foundation::BSTR, firingControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_to_fire.call(this, methodName, firingControl)
    end

  end

  @[Extern]
  record IMultiInterfacePublisherFilterVtbl,
    query_interface : Proc(IMultiInterfacePublisherFilter*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMultiInterfacePublisherFilter*, UInt32),
    release : Proc(IMultiInterfacePublisherFilter*, UInt32),
    initialize__ : Proc(IMultiInterfacePublisherFilter*, Void*, Win32cr::Foundation::HRESULT),
    prepare_to_fire : Proc(IMultiInterfacePublisherFilter*, LibC::GUID*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("465e5cc1-7b26-11d1-88fb-0080c7d771bf")]
  record IMultiInterfacePublisherFilter, lpVtbl : IMultiInterfacePublisherFilterVtbl* do
    GUID = LibC::GUID.new(0x465e5cc1_u32, 0x7b26_u16, 0x11d1_u16, StaticArray[0x88_u8, 0xfb_u8, 0x0_u8, 0x80_u8, 0xc7_u8, 0xd7_u8, 0x71_u8, 0xbf_u8])
    def query_interface(this : IMultiInterfacePublisherFilter*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMultiInterfacePublisherFilter*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMultiInterfacePublisherFilter*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IMultiInterfacePublisherFilter*, pEIC : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pEIC)
    end
    def prepare_to_fire(this : IMultiInterfacePublisherFilter*, iid : LibC::GUID*, methodName : Win32cr::Foundation::BSTR, firingControl : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.prepare_to_fire.call(this, iid, methodName, firingControl)
    end

  end

  @[Extern]
  record IEventObjectChangeVtbl,
    query_interface : Proc(IEventObjectChange*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEventObjectChange*, UInt32),
    release : Proc(IEventObjectChange*, UInt32),
    changed_subscription : Proc(IEventObjectChange*, Win32cr::System::Com::Events::EOC_ChangeType, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    changed_event_class : Proc(IEventObjectChange*, Win32cr::System::Com::Events::EOC_ChangeType, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    changed_publisher : Proc(IEventObjectChange*, Win32cr::System::Com::Events::EOC_ChangeType, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f4a07d70-2e25-11d1-9964-00c04fbbb345")]
  record IEventObjectChange, lpVtbl : IEventObjectChangeVtbl* do
    GUID = LibC::GUID.new(0xf4a07d70_u32, 0x2e25_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
    def query_interface(this : IEventObjectChange*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEventObjectChange*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEventObjectChange*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def changed_subscription(this : IEventObjectChange*, changeType : Win32cr::System::Com::Events::EOC_ChangeType, bstrSubscriptionID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.changed_subscription.call(this, changeType, bstrSubscriptionID)
    end
    def changed_event_class(this : IEventObjectChange*, changeType : Win32cr::System::Com::Events::EOC_ChangeType, bstrEventClassID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.changed_event_class.call(this, changeType, bstrEventClassID)
    end
    def changed_publisher(this : IEventObjectChange*, changeType : Win32cr::System::Com::Events::EOC_ChangeType, bstrPublisherID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.changed_publisher.call(this, changeType, bstrPublisherID)
    end

  end

  @[Extern]
  record IEventObjectChange2Vtbl,
    query_interface : Proc(IEventObjectChange2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEventObjectChange2*, UInt32),
    release : Proc(IEventObjectChange2*, UInt32),
    changed_subscription : Proc(IEventObjectChange2*, Win32cr::System::Com::Events::COMEVENTSYSCHANGEINFO*, Win32cr::Foundation::HRESULT),
    changed_event_class : Proc(IEventObjectChange2*, Win32cr::System::Com::Events::COMEVENTSYSCHANGEINFO*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("7701a9c3-bd68-438f-83e0-67bf4f53a422")]
  record IEventObjectChange2, lpVtbl : IEventObjectChange2Vtbl* do
    GUID = LibC::GUID.new(0x7701a9c3_u32, 0xbd68_u16, 0x438f_u16, StaticArray[0x83_u8, 0xe0_u8, 0x67_u8, 0xbf_u8, 0x4f_u8, 0x53_u8, 0xa4_u8, 0x22_u8])
    def query_interface(this : IEventObjectChange2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEventObjectChange2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEventObjectChange2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def changed_subscription(this : IEventObjectChange2*, pInfo : Win32cr::System::Com::Events::COMEVENTSYSCHANGEINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.changed_subscription.call(this, pInfo)
    end
    def changed_event_class(this : IEventObjectChange2*, pInfo : Win32cr::System::Com::Events::COMEVENTSYSCHANGEINFO*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.changed_event_class.call(this, pInfo)
    end

  end

  @[Extern]
  record IEnumEventObjectVtbl,
    query_interface : Proc(IEnumEventObject*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEnumEventObject*, UInt32),
    release : Proc(IEnumEventObject*, UInt32),
    clone : Proc(IEnumEventObject*, Void**, Win32cr::Foundation::HRESULT),
    next__ : Proc(IEnumEventObject*, UInt32, Void**, UInt32*, Win32cr::Foundation::HRESULT),
    reset : Proc(IEnumEventObject*, Win32cr::Foundation::HRESULT),
    skip : Proc(IEnumEventObject*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f4a07d63-2e25-11d1-9964-00c04fbbb345")]
  record IEnumEventObject, lpVtbl : IEnumEventObjectVtbl* do
    GUID = LibC::GUID.new(0xf4a07d63_u32, 0x2e25_u16, 0x11d1_u16, StaticArray[0x99_u8, 0x64_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xbb_u8, 0xb3_u8, 0x45_u8])
    def query_interface(this : IEnumEventObject*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEnumEventObject*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEnumEventObject*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IEnumEventObject*, ppInterface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, ppInterface)
    end
    def next__(this : IEnumEventObject*, cReqElem : UInt32, ppInterface : Void**, cRetElem : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this, cReqElem, ppInterface, cRetElem)
    end
    def reset(this : IEnumEventObject*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def skip(this : IEnumEventObject*, cSkipElem : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.skip.call(this, cSkipElem)
    end

  end

  @[Extern]
  record IEventObjectCollectionVtbl,
    query_interface : Proc(IEventObjectCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEventObjectCollection*, UInt32),
    release : Proc(IEventObjectCollection*, UInt32),
    get_type_info_count : Proc(IEventObjectCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IEventObjectCollection*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IEventObjectCollection*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IEventObjectCollection*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get__NewEnum : Proc(IEventObjectCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Item : Proc(IEventObjectCollection*, Win32cr::Foundation::BSTR, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_NewEnum : Proc(IEventObjectCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IEventObjectCollection*, Int32*, Win32cr::Foundation::HRESULT),
    add : Proc(IEventObjectCollection*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    remove : Proc(IEventObjectCollection*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("f89ac270-d4eb-11d1-b682-00805fc79216")]
  record IEventObjectCollection, lpVtbl : IEventObjectCollectionVtbl* do
    GUID = LibC::GUID.new(0xf89ac270_u32, 0xd4eb_u16, 0x11d1_u16, StaticArray[0xb6_u8, 0x82_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x16_u8])
    def query_interface(this : IEventObjectCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEventObjectCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEventObjectCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IEventObjectCollection*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IEventObjectCollection*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IEventObjectCollection*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IEventObjectCollection*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get__NewEnum(this : IEventObjectCollection*, ppUnkEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get__NewEnum.call(this, ppUnkEnum)
    end
    def get_Item(this : IEventObjectCollection*, objectID : Win32cr::Foundation::BSTR, pItem : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Item.call(this, objectID, pItem)
    end
    def get_NewEnum(this : IEventObjectCollection*, ppEnum : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NewEnum.call(this, ppEnum)
    end
    def get_Count(this : IEventObjectCollection*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pCount)
    end
    def add(this : IEventObjectCollection*, item : Win32cr::System::Com::VARIANT*, objectID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, item, objectID)
    end
    def remove(this : IEventObjectCollection*, objectID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, objectID)
    end

  end

  @[Extern]
  record IEventPropertyVtbl,
    query_interface : Proc(IEventProperty*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEventProperty*, UInt32),
    release : Proc(IEventProperty*, UInt32),
    get_type_info_count : Proc(IEventProperty*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IEventProperty*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IEventProperty*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IEventProperty*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IEventProperty*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IEventProperty*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_Value : Proc(IEventProperty*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    put_Value : Proc(IEventProperty*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("da538ee2-f4de-11d1-b6bb-00805fc79216")]
  record IEventProperty, lpVtbl : IEventPropertyVtbl* do
    GUID = LibC::GUID.new(0xda538ee2_u32, 0xf4de_u16, 0x11d1_u16, StaticArray[0xb6_u8, 0xbb_u8, 0x0_u8, 0x80_u8, 0x5f_u8, 0xc7_u8, 0x92_u8, 0x16_u8])
    def query_interface(this : IEventProperty*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEventProperty*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEventProperty*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IEventProperty*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IEventProperty*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IEventProperty*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IEventProperty*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_Name(this : IEventProperty*, propertyName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, propertyName)
    end
    def put_Name(this : IEventProperty*, propertyName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, propertyName)
    end
    def get_Value(this : IEventProperty*, propertyValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, propertyValue)
    end
    def put_Value(this : IEventProperty*, propertyValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Value.call(this, propertyValue)
    end

  end

  @[Extern]
  record IEventControlVtbl,
    query_interface : Proc(IEventControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IEventControl*, UInt32),
    release : Proc(IEventControl*, UInt32),
    get_type_info_count : Proc(IEventControl*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IEventControl*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IEventControl*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IEventControl*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    set_publisher_filter : Proc(IEventControl*, Win32cr::Foundation::BSTR, Void*, Win32cr::Foundation::HRESULT),
    get_AllowInprocActivation : Proc(IEventControl*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_AllowInprocActivation : Proc(IEventControl*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_subscriptions : Proc(IEventControl*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32*, Void**, Win32cr::Foundation::HRESULT),
    set_default_query : Proc(IEventControl*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0343e2f4-86f6-11d1-b760-00c04fb926af")]
  record IEventControl, lpVtbl : IEventControlVtbl* do
    GUID = LibC::GUID.new(0x343e2f4_u32, 0x86f6_u16, 0x11d1_u16, StaticArray[0xb7_u8, 0x60_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x26_u8, 0xaf_u8])
    def query_interface(this : IEventControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IEventControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IEventControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IEventControl*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IEventControl*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IEventControl*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IEventControl*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def set_publisher_filter(this : IEventControl*, methodName : Win32cr::Foundation::BSTR, pPublisherFilter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_publisher_filter.call(this, methodName, pPublisherFilter)
    end
    def get_AllowInprocActivation(this : IEventControl*, pfAllowInprocActivation : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowInprocActivation.call(this, pfAllowInprocActivation)
    end
    def put_AllowInprocActivation(this : IEventControl*, fAllowInprocActivation : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowInprocActivation.call(this, fAllowInprocActivation)
    end
    def get_subscriptions(this : IEventControl*, methodName : Win32cr::Foundation::BSTR, optionalCriteria : Win32cr::Foundation::BSTR, optionalErrorIndex : Int32*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_subscriptions.call(this, methodName, optionalCriteria, optionalErrorIndex, ppCollection)
    end
    def set_default_query(this : IEventControl*, methodName : Win32cr::Foundation::BSTR, criteria : Win32cr::Foundation::BSTR, errorIndex : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_query.call(this, methodName, criteria, errorIndex)
    end

  end

  @[Extern]
  record IMultiInterfaceEventControlVtbl,
    query_interface : Proc(IMultiInterfaceEventControl*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMultiInterfaceEventControl*, UInt32),
    release : Proc(IMultiInterfaceEventControl*, UInt32),
    set_multi_interface_publisher_filter : Proc(IMultiInterfaceEventControl*, Void*, Win32cr::Foundation::HRESULT),
    get_subscriptions : Proc(IMultiInterfaceEventControl*, LibC::GUID*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32*, Void**, Win32cr::Foundation::HRESULT),
    set_default_query : Proc(IMultiInterfaceEventControl*, LibC::GUID*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32*, Win32cr::Foundation::HRESULT),
    get_AllowInprocActivation : Proc(IMultiInterfaceEventControl*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_AllowInprocActivation : Proc(IMultiInterfaceEventControl*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_FireInParallel : Proc(IMultiInterfaceEventControl*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_FireInParallel : Proc(IMultiInterfaceEventControl*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0343e2f5-86f6-11d1-b760-00c04fb926af")]
  record IMultiInterfaceEventControl, lpVtbl : IMultiInterfaceEventControlVtbl* do
    GUID = LibC::GUID.new(0x343e2f5_u32, 0x86f6_u16, 0x11d1_u16, StaticArray[0xb7_u8, 0x60_u8, 0x0_u8, 0xc0_u8, 0x4f_u8, 0xb9_u8, 0x26_u8, 0xaf_u8])
    def query_interface(this : IMultiInterfaceEventControl*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMultiInterfaceEventControl*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMultiInterfaceEventControl*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_multi_interface_publisher_filter(this : IMultiInterfaceEventControl*, classFilter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_multi_interface_publisher_filter.call(this, classFilter)
    end
    def get_subscriptions(this : IMultiInterfaceEventControl*, eventIID : LibC::GUID*, bstrMethodName : Win32cr::Foundation::BSTR, optionalCriteria : Win32cr::Foundation::BSTR, optionalErrorIndex : Int32*, ppCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_subscriptions.call(this, eventIID, bstrMethodName, optionalCriteria, optionalErrorIndex, ppCollection)
    end
    def set_default_query(this : IMultiInterfaceEventControl*, eventIID : LibC::GUID*, bstrMethodName : Win32cr::Foundation::BSTR, bstrCriteria : Win32cr::Foundation::BSTR, errorIndex : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_default_query.call(this, eventIID, bstrMethodName, bstrCriteria, errorIndex)
    end
    def get_AllowInprocActivation(this : IMultiInterfaceEventControl*, pfAllowInprocActivation : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowInprocActivation.call(this, pfAllowInprocActivation)
    end
    def put_AllowInprocActivation(this : IMultiInterfaceEventControl*, fAllowInprocActivation : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowInprocActivation.call(this, fAllowInprocActivation)
    end
    def get_FireInParallel(this : IMultiInterfaceEventControl*, pfFireInParallel : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FireInParallel.call(this, pfFireInParallel)
    end
    def put_FireInParallel(this : IMultiInterfaceEventControl*, fFireInParallel : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FireInParallel.call(this, fFireInParallel)
    end

  end

  @[Extern]
  record IDontSupportEventSubscriptionVtbl,
    query_interface : Proc(IDontSupportEventSubscription*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDontSupportEventSubscription*, UInt32),
    release : Proc(IDontSupportEventSubscription*, UInt32)


  @[Extern]
  #@[Com("784121f1-62a6-4b89-855f-d65f296de83a")]
  record IDontSupportEventSubscription, lpVtbl : IDontSupportEventSubscriptionVtbl* do
    GUID = LibC::GUID.new(0x784121f1_u32, 0x62a6_u16, 0x4b89_u16, StaticArray[0x85_u8, 0x5f_u8, 0xd6_u8, 0x5f_u8, 0x29_u8, 0x6d_u8, 0xe8_u8, 0x3a_u8])
    def query_interface(this : IDontSupportEventSubscription*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDontSupportEventSubscription*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDontSupportEventSubscription*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

end