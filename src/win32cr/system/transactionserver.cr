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
  CLSID_Catalog = LibC::GUID.new(0x6eb22881_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  CLSID_CatalogObject = LibC::GUID.new(0x6eb22882_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  CLSID_CatalogCollection = LibC::GUID.new(0x6eb22883_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  CLSID_ComponentUtil = LibC::GUID.new(0x6eb22884_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  CLSID_PackageUtil = LibC::GUID.new(0x6eb22885_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  CLSID_RemoteComponentUtil = LibC::GUID.new(0x6eb22886_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  CLSID_RoleAssociationUtil = LibC::GUID.new(0x6eb22887_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])


  enum MIDL___MIDL_itf_mtxadmin_0107_0001 : Int32
    Mtsinstallusers = 1
  end

  enum MIDL___MIDL_itf_mtxadmin_0107_0002 : Int32
    Mtsexportusers = 1
  end

  enum MIDL___MIDL_itf_mtxadmin_0107_0003 : Int32
    Mtserrobjecterrors = -2146368511
    Mtserrobjectinvalid = -2146368510
    Mtserrkeymissing = -2146368509
    Mtserralreadyinstalled = -2146368508
    Mtserrdownloadfailed = -2146368507
    Mtserrpdfwritefail = -2146368505
    Mtserrpdfreadfail = -2146368504
    Mtserrpdfversion = -2146368503
    Mtserrcoreqcompinstalled = -2146368496
    Mtserrbadpath = -2146368502
    Mtserrpackageexists = -2146368501
    Mtserrroleexists = -2146368500
    Mtserrcantcopyfile = -2146368499
    Mtserrnotypelib = -2146368498
    Mtserrnouser = -2146368497
    Mtserrinvaliduserids = -2146368496
    Mtserrnoregistryclsid = -2146368495
    Mtserrbadregistryprogid = -2146368494
    Mtserrauthenticationlevel = -2146368493
    Mtserruserpasswdnotvalid = -2146368492
    Mtserrnoregistryread = -2146368491
    Mtserrnoregistrywrite = -2146368490
    Mtserrnoregistryrepair = -2146368489
    Mtserrclsidoriidmismatch = -2146368488
    Mtserrremoteinterface = -2146368487
    Mtserrdllregisterserver = -2146368486
    Mtserrnoservershare = -2146368485
    Mtserrnoaccesstounc = -2146368484
    Mtserrdllloadfailed = -2146368483
    Mtserrbadregistrylibid = -2146368482
    Mtserrpackdirnotfound = -2146368481
    Mtserrtreatas = -2146368480
    Mtserrbadforward = -2146368479
    Mtserrbadiid = -2146368478
    Mtserrregistrarfailed = -2146368477
    Mtserrcompfiledoesnotexist = -2146368476
    Mtserrcompfileloaddllfail = -2146368475
    Mtserrcompfilegetclassobj = -2146368474
    Mtserrcompfileclassnotavail = -2146368473
    Mtserrcompfilebadtlb = -2146368472
    Mtserrcompfilenotinstallable = -2146368471
    Mtserrnotchangeable = -2146368470
    Mtserrnotdeletable = -2146368469
    Mtserrsession = -2146368468
    Mtserrcompfilenoregistrar = -2146368460
  end


  struct ICatalogVTbl
    query_interface : Proc(ICatalog*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICatalog*, UInt32)
    release : Proc(ICatalog*, UInt32)
    get_type_info_count : Proc(ICatalog*, UInt32*, HRESULT)
    get_type_info : Proc(ICatalog*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(ICatalog*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(ICatalog*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_collection : Proc(ICatalog*, UInt8*, IDispatch*, HRESULT)
    connect : Proc(ICatalog*, UInt8*, IDispatch*, HRESULT)
    get_major_version : Proc(ICatalog*, Int32*, HRESULT)
    get_minor_version : Proc(ICatalog*, Int32*, HRESULT)
  end

  ICatalog_GUID = "6eb22870-8a19-11d0-81b6-00a0c9231c29"
  IID_ICatalog = LibC::GUID.new(0x6eb22870_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  struct ICatalog
    lpVtbl : ICatalogVTbl*
  end

  struct IComponentUtilVTbl
    query_interface : Proc(IComponentUtil*, Guid*, Void**, HRESULT)
    add_ref : Proc(IComponentUtil*, UInt32)
    release : Proc(IComponentUtil*, UInt32)
    get_type_info_count : Proc(IComponentUtil*, UInt32*, HRESULT)
    get_type_info : Proc(IComponentUtil*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IComponentUtil*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IComponentUtil*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    install_component : Proc(IComponentUtil*, UInt8*, UInt8*, UInt8*, HRESULT)
    import_component : Proc(IComponentUtil*, UInt8*, HRESULT)
    import_component_by_name : Proc(IComponentUtil*, UInt8*, HRESULT)
    get_clsi_ds : Proc(IComponentUtil*, UInt8*, UInt8*, SAFEARRAY**, HRESULT)
  end

  IComponentUtil_GUID = "6eb22873-8a19-11d0-81b6-00a0c9231c29"
  IID_IComponentUtil = LibC::GUID.new(0x6eb22873_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  struct IComponentUtil
    lpVtbl : IComponentUtilVTbl*
  end

  struct IPackageUtilVTbl
    query_interface : Proc(IPackageUtil*, Guid*, Void**, HRESULT)
    add_ref : Proc(IPackageUtil*, UInt32)
    release : Proc(IPackageUtil*, UInt32)
    get_type_info_count : Proc(IPackageUtil*, UInt32*, HRESULT)
    get_type_info : Proc(IPackageUtil*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IPackageUtil*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IPackageUtil*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    install_package : Proc(IPackageUtil*, UInt8*, UInt8*, Int32, HRESULT)
    export_package : Proc(IPackageUtil*, UInt8*, UInt8*, Int32, HRESULT)
    shutdown_package : Proc(IPackageUtil*, UInt8*, HRESULT)
  end

  IPackageUtil_GUID = "6eb22874-8a19-11d0-81b6-00a0c9231c29"
  IID_IPackageUtil = LibC::GUID.new(0x6eb22874_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  struct IPackageUtil
    lpVtbl : IPackageUtilVTbl*
  end

  struct IRemoteComponentUtilVTbl
    query_interface : Proc(IRemoteComponentUtil*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRemoteComponentUtil*, UInt32)
    release : Proc(IRemoteComponentUtil*, UInt32)
    get_type_info_count : Proc(IRemoteComponentUtil*, UInt32*, HRESULT)
    get_type_info : Proc(IRemoteComponentUtil*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRemoteComponentUtil*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRemoteComponentUtil*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    install_remote_component : Proc(IRemoteComponentUtil*, UInt8*, UInt8*, UInt8*, HRESULT)
    install_remote_component_by_name : Proc(IRemoteComponentUtil*, UInt8*, UInt8*, UInt8*, HRESULT)
  end

  IRemoteComponentUtil_GUID = "6eb22875-8a19-11d0-81b6-00a0c9231c29"
  IID_IRemoteComponentUtil = LibC::GUID.new(0x6eb22875_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  struct IRemoteComponentUtil
    lpVtbl : IRemoteComponentUtilVTbl*
  end

  struct IRoleAssociationUtilVTbl
    query_interface : Proc(IRoleAssociationUtil*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRoleAssociationUtil*, UInt32)
    release : Proc(IRoleAssociationUtil*, UInt32)
    get_type_info_count : Proc(IRoleAssociationUtil*, UInt32*, HRESULT)
    get_type_info : Proc(IRoleAssociationUtil*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IRoleAssociationUtil*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IRoleAssociationUtil*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    associate_role : Proc(IRoleAssociationUtil*, UInt8*, HRESULT)
    associate_role_by_name : Proc(IRoleAssociationUtil*, UInt8*, HRESULT)
  end

  IRoleAssociationUtil_GUID = "6eb22876-8a19-11d0-81b6-00a0c9231c29"
  IID_IRoleAssociationUtil = LibC::GUID.new(0x6eb22876_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  struct IRoleAssociationUtil
    lpVtbl : IRoleAssociationUtilVTbl*
  end

end
struct LibWin32::ICatalog
  def query_interface(this : ICatalog*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICatalog*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICatalog*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : ICatalog*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : ICatalog*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : ICatalog*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : ICatalog*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_collection(this : ICatalog*, bstrcollname : UInt8*, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.get_collection.call(this, bstrcollname, ppcatalogcollection)
  end
  def connect(this : ICatalog*, bstrconnectstring : UInt8*, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.connect.call(this, bstrconnectstring, ppcatalogcollection)
  end
  def get_major_version(this : ICatalog*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_major_version.call(this, retval)
  end
  def get_minor_version(this : ICatalog*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_minor_version.call(this, retval)
  end
end
struct LibWin32::IComponentUtil
  def query_interface(this : IComponentUtil*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IComponentUtil*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IComponentUtil*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IComponentUtil*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IComponentUtil*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IComponentUtil*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IComponentUtil*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def install_component(this : IComponentUtil*, bstrdllfile : UInt8*, bstrtypelibfile : UInt8*, bstrproxystubdllfile : UInt8*) : HRESULT
    @lpVtbl.value.install_component.call(this, bstrdllfile, bstrtypelibfile, bstrproxystubdllfile)
  end
  def import_component(this : IComponentUtil*, bstrclsid : UInt8*) : HRESULT
    @lpVtbl.value.import_component.call(this, bstrclsid)
  end
  def import_component_by_name(this : IComponentUtil*, bstrprogid : UInt8*) : HRESULT
    @lpVtbl.value.import_component_by_name.call(this, bstrprogid)
  end
  def get_clsi_ds(this : IComponentUtil*, bstrdllfile : UInt8*, bstrtypelibfile : UInt8*, aclsids : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_clsi_ds.call(this, bstrdllfile, bstrtypelibfile, aclsids)
  end
end
struct LibWin32::IPackageUtil
  def query_interface(this : IPackageUtil*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IPackageUtil*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IPackageUtil*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IPackageUtil*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IPackageUtil*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IPackageUtil*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IPackageUtil*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def install_package(this : IPackageUtil*, bstrpackagefile : UInt8*, bstrinstallpath : UInt8*, loptions : Int32) : HRESULT
    @lpVtbl.value.install_package.call(this, bstrpackagefile, bstrinstallpath, loptions)
  end
  def export_package(this : IPackageUtil*, bstrpackageid : UInt8*, bstrpackagefile : UInt8*, loptions : Int32) : HRESULT
    @lpVtbl.value.export_package.call(this, bstrpackageid, bstrpackagefile, loptions)
  end
  def shutdown_package(this : IPackageUtil*, bstrpackageid : UInt8*) : HRESULT
    @lpVtbl.value.shutdown_package.call(this, bstrpackageid)
  end
end
struct LibWin32::IRemoteComponentUtil
  def query_interface(this : IRemoteComponentUtil*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRemoteComponentUtil*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRemoteComponentUtil*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRemoteComponentUtil*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRemoteComponentUtil*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRemoteComponentUtil*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRemoteComponentUtil*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def install_remote_component(this : IRemoteComponentUtil*, bstrserver : UInt8*, bstrpackageid : UInt8*, bstrclsid : UInt8*) : HRESULT
    @lpVtbl.value.install_remote_component.call(this, bstrserver, bstrpackageid, bstrclsid)
  end
  def install_remote_component_by_name(this : IRemoteComponentUtil*, bstrserver : UInt8*, bstrpackagename : UInt8*, bstrprogid : UInt8*) : HRESULT
    @lpVtbl.value.install_remote_component_by_name.call(this, bstrserver, bstrpackagename, bstrprogid)
  end
end
struct LibWin32::IRoleAssociationUtil
  def query_interface(this : IRoleAssociationUtil*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRoleAssociationUtil*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRoleAssociationUtil*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IRoleAssociationUtil*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IRoleAssociationUtil*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IRoleAssociationUtil*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IRoleAssociationUtil*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def associate_role(this : IRoleAssociationUtil*, bstrroleid : UInt8*) : HRESULT
    @lpVtbl.value.associate_role.call(this, bstrroleid)
  end
  def associate_role_by_name(this : IRoleAssociationUtil*, bstrrolename : UInt8*) : HRESULT
    @lpVtbl.value.associate_role_by_name.call(this, bstrrolename)
  end
end
