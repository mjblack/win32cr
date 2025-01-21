require "./com.cr"
require "./../foundation.cr"

module Win32cr::System::TransactionServer

  CLSID_Catalog = LibC::GUID.new(0x6eb22881_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])

  CLSID_CatalogObject = LibC::GUID.new(0x6eb22882_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])

  CLSID_CatalogCollection = LibC::GUID.new(0x6eb22883_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])

  CLSID_ComponentUtil = LibC::GUID.new(0x6eb22884_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])

  CLSID_PackageUtil = LibC::GUID.new(0x6eb22885_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])

  CLSID_RemoteComponentUtil = LibC::GUID.new(0x6eb22886_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])

  CLSID_RoleAssociationUtil = LibC::GUID.new(0x6eb22887_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])

  enum MTSPackageInstallOptions
    Mtsinstallusers = 1_i32
  end
  enum MTSPackageExportOptions
    Mtsexportusers = 1_i32
  end
  enum MTSAdminErrorCodes
    Mtserrobjecterrors = -2146368511_i32
    Mtserrobjectinvalid = -2146368510_i32
    Mtserrkeymissing = -2146368509_i32
    Mtserralreadyinstalled = -2146368508_i32
    Mtserrdownloadfailed = -2146368507_i32
    Mtserrpdfwritefail = -2146368505_i32
    Mtserrpdfreadfail = -2146368504_i32
    Mtserrpdfversion = -2146368503_i32
    Mtserrcoreqcompinstalled = -2146368496_i32
    Mtserrbadpath = -2146368502_i32
    Mtserrpackageexists = -2146368501_i32
    Mtserrroleexists = -2146368500_i32
    Mtserrcantcopyfile = -2146368499_i32
    Mtserrnotypelib = -2146368498_i32
    Mtserrnouser = -2146368497_i32
    Mtserrinvaliduserids = -2146368496_i32
    Mtserrnoregistryclsid = -2146368495_i32
    Mtserrbadregistryprogid = -2146368494_i32
    Mtserrauthenticationlevel = -2146368493_i32
    Mtserruserpasswdnotvalid = -2146368492_i32
    Mtserrnoregistryread = -2146368491_i32
    Mtserrnoregistrywrite = -2146368490_i32
    Mtserrnoregistryrepair = -2146368489_i32
    Mtserrclsidoriidmismatch = -2146368488_i32
    Mtserrremoteinterface = -2146368487_i32
    Mtserrdllregisterserver = -2146368486_i32
    Mtserrnoservershare = -2146368485_i32
    Mtserrnoaccesstounc = -2146368484_i32
    Mtserrdllloadfailed = -2146368483_i32
    Mtserrbadregistrylibid = -2146368482_i32
    Mtserrpackdirnotfound = -2146368481_i32
    Mtserrtreatas = -2146368480_i32
    Mtserrbadforward = -2146368479_i32
    Mtserrbadiid = -2146368478_i32
    Mtserrregistrarfailed = -2146368477_i32
    Mtserrcompfiledoesnotexist = -2146368476_i32
    Mtserrcompfileloaddllfail = -2146368475_i32
    Mtserrcompfilegetclassobj = -2146368474_i32
    Mtserrcompfileclassnotavail = -2146368473_i32
    Mtserrcompfilebadtlb = -2146368472_i32
    Mtserrcompfilenotinstallable = -2146368471_i32
    Mtserrnotchangeable = -2146368470_i32
    Mtserrnotdeletable = -2146368469_i32
    Mtserrsession = -2146368468_i32
    Mtserrcompfilenoregistrar = -2146368460_i32
  end

  @[Extern]
  record ICatalogVtbl,
    query_interface : Proc(ICatalog*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICatalog*, UInt32),
    release : Proc(ICatalog*, UInt32),
    get_type_info_count : Proc(ICatalog*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(ICatalog*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(ICatalog*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(ICatalog*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_collection : Proc(ICatalog*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    connect : Proc(ICatalog*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT),
    get_MajorVersion : Proc(ICatalog*, Int32*, Win32cr::Foundation::HRESULT),
    get_MinorVersion : Proc(ICatalog*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6eb22870-8a19-11d0-81b6-00a0c9231c29")]
  record ICatalog, lpVtbl : ICatalogVtbl* do
    GUID = LibC::GUID.new(0x6eb22870_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
    def query_interface(this : ICatalog*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICatalog*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICatalog*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : ICatalog*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : ICatalog*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : ICatalog*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : ICatalog*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_collection(this : ICatalog*, bstrCollName : Win32cr::Foundation::BSTR, ppCatalogCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_collection.call(this, bstrCollName, ppCatalogCollection)
    end
    def connect(this : ICatalog*, bstrConnectString : Win32cr::Foundation::BSTR, ppCatalogCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.connect.call(this, bstrConnectString, ppCatalogCollection)
    end
    def get_MajorVersion(this : ICatalog*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MajorVersion.call(this, retval)
    end
    def get_MinorVersion(this : ICatalog*, retval : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_MinorVersion.call(this, retval)
    end

  end

  @[Extern]
  record IComponentUtilVtbl,
    query_interface : Proc(IComponentUtil*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IComponentUtil*, UInt32),
    release : Proc(IComponentUtil*, UInt32),
    get_type_info_count : Proc(IComponentUtil*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IComponentUtil*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IComponentUtil*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IComponentUtil*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    install_component : Proc(IComponentUtil*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    import_component : Proc(IComponentUtil*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    import_component_by_name : Proc(IComponentUtil*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_clsi_ds : Proc(IComponentUtil*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6eb22873-8a19-11d0-81b6-00a0c9231c29")]
  record IComponentUtil, lpVtbl : IComponentUtilVtbl* do
    GUID = LibC::GUID.new(0x6eb22873_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
    def query_interface(this : IComponentUtil*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IComponentUtil*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IComponentUtil*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IComponentUtil*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IComponentUtil*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IComponentUtil*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IComponentUtil*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def install_component(this : IComponentUtil*, bstrDLLFile : Win32cr::Foundation::BSTR, bstrTypelibFile : Win32cr::Foundation::BSTR, bstrProxyStubDLLFile : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_component.call(this, bstrDLLFile, bstrTypelibFile, bstrProxyStubDLLFile)
    end
    def import_component(this : IComponentUtil*, bstrCLSID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import_component.call(this, bstrCLSID)
    end
    def import_component_by_name(this : IComponentUtil*, bstrProgID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.import_component_by_name.call(this, bstrProgID)
    end
    def get_clsi_ds(this : IComponentUtil*, bstrDLLFile : Win32cr::Foundation::BSTR, bstrTypelibFile : Win32cr::Foundation::BSTR, aCLSIDs : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clsi_ds.call(this, bstrDLLFile, bstrTypelibFile, aCLSIDs)
    end

  end

  @[Extern]
  record IPackageUtilVtbl,
    query_interface : Proc(IPackageUtil*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IPackageUtil*, UInt32),
    release : Proc(IPackageUtil*, UInt32),
    get_type_info_count : Proc(IPackageUtil*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IPackageUtil*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IPackageUtil*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IPackageUtil*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    install_package : Proc(IPackageUtil*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    export_package : Proc(IPackageUtil*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Int32, Win32cr::Foundation::HRESULT),
    shutdown_package : Proc(IPackageUtil*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6eb22874-8a19-11d0-81b6-00a0c9231c29")]
  record IPackageUtil, lpVtbl : IPackageUtilVtbl* do
    GUID = LibC::GUID.new(0x6eb22874_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
    def query_interface(this : IPackageUtil*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IPackageUtil*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IPackageUtil*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IPackageUtil*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IPackageUtil*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IPackageUtil*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IPackageUtil*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def install_package(this : IPackageUtil*, bstrPackageFile : Win32cr::Foundation::BSTR, bstrInstallPath : Win32cr::Foundation::BSTR, lOptions : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_package.call(this, bstrPackageFile, bstrInstallPath, lOptions)
    end
    def export_package(this : IPackageUtil*, bstrPackageID : Win32cr::Foundation::BSTR, bstrPackageFile : Win32cr::Foundation::BSTR, lOptions : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.export_package.call(this, bstrPackageID, bstrPackageFile, lOptions)
    end
    def shutdown_package(this : IPackageUtil*, bstrPackageID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.shutdown_package.call(this, bstrPackageID)
    end

  end

  @[Extern]
  record IRemoteComponentUtilVtbl,
    query_interface : Proc(IRemoteComponentUtil*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRemoteComponentUtil*, UInt32),
    release : Proc(IRemoteComponentUtil*, UInt32),
    get_type_info_count : Proc(IRemoteComponentUtil*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRemoteComponentUtil*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRemoteComponentUtil*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRemoteComponentUtil*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    install_remote_component : Proc(IRemoteComponentUtil*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    install_remote_component_by_name : Proc(IRemoteComponentUtil*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6eb22875-8a19-11d0-81b6-00a0c9231c29")]
  record IRemoteComponentUtil, lpVtbl : IRemoteComponentUtilVtbl* do
    GUID = LibC::GUID.new(0x6eb22875_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
    def query_interface(this : IRemoteComponentUtil*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRemoteComponentUtil*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRemoteComponentUtil*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRemoteComponentUtil*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRemoteComponentUtil*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRemoteComponentUtil*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRemoteComponentUtil*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def install_remote_component(this : IRemoteComponentUtil*, bstrServer : Win32cr::Foundation::BSTR, bstrPackageID : Win32cr::Foundation::BSTR, bstrCLSID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_remote_component.call(this, bstrServer, bstrPackageID, bstrCLSID)
    end
    def install_remote_component_by_name(this : IRemoteComponentUtil*, bstrServer : Win32cr::Foundation::BSTR, bstrPackageName : Win32cr::Foundation::BSTR, bstrProgID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.install_remote_component_by_name.call(this, bstrServer, bstrPackageName, bstrProgID)
    end

  end

  @[Extern]
  record IRoleAssociationUtilVtbl,
    query_interface : Proc(IRoleAssociationUtil*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRoleAssociationUtil*, UInt32),
    release : Proc(IRoleAssociationUtil*, UInt32),
    get_type_info_count : Proc(IRoleAssociationUtil*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IRoleAssociationUtil*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IRoleAssociationUtil*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IRoleAssociationUtil*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    associate_role : Proc(IRoleAssociationUtil*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    associate_role_by_name : Proc(IRoleAssociationUtil*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6eb22876-8a19-11d0-81b6-00a0c9231c29")]
  record IRoleAssociationUtil, lpVtbl : IRoleAssociationUtilVtbl* do
    GUID = LibC::GUID.new(0x6eb22876_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
    def query_interface(this : IRoleAssociationUtil*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRoleAssociationUtil*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRoleAssociationUtil*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IRoleAssociationUtil*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IRoleAssociationUtil*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IRoleAssociationUtil*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IRoleAssociationUtil*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def associate_role(this : IRoleAssociationUtil*, bstrRoleID : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.associate_role.call(this, bstrRoleID)
    end
    def associate_role_by_name(this : IRoleAssociationUtil*, bstrRoleName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.associate_role_by_name.call(this, bstrRoleName)
    end

  end

end