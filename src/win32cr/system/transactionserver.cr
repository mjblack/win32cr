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
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_collection : UInt64
    connect : UInt64
    get_major_version : UInt64
    get_minor_version : UInt64
  end

  ICatalog_GUID = "6eb22870-8a19-11d0-81b6-00a0c9231c29"
  IID_ICatalog = LibC::GUID.new(0x6eb22870_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  struct ICatalog
    lpVtbl : ICatalogVTbl*
  end

  struct IComponentUtilVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    install_component : UInt64
    import_component : UInt64
    import_component_by_name : UInt64
    get_clsi_ds : UInt64
  end

  IComponentUtil_GUID = "6eb22873-8a19-11d0-81b6-00a0c9231c29"
  IID_IComponentUtil = LibC::GUID.new(0x6eb22873_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  struct IComponentUtil
    lpVtbl : IComponentUtilVTbl*
  end

  struct IPackageUtilVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    install_package : UInt64
    export_package : UInt64
    shutdown_package : UInt64
  end

  IPackageUtil_GUID = "6eb22874-8a19-11d0-81b6-00a0c9231c29"
  IID_IPackageUtil = LibC::GUID.new(0x6eb22874_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  struct IPackageUtil
    lpVtbl : IPackageUtilVTbl*
  end

  struct IRemoteComponentUtilVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    install_remote_component : UInt64
    install_remote_component_by_name : UInt64
  end

  IRemoteComponentUtil_GUID = "6eb22875-8a19-11d0-81b6-00a0c9231c29"
  IID_IRemoteComponentUtil = LibC::GUID.new(0x6eb22875_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  struct IRemoteComponentUtil
    lpVtbl : IRemoteComponentUtilVTbl*
  end

  struct IRoleAssociationUtilVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    associate_role : UInt64
    associate_role_by_name : UInt64
  end

  IRoleAssociationUtil_GUID = "6eb22876-8a19-11d0-81b6-00a0c9231c29"
  IID_IRoleAssociationUtil = LibC::GUID.new(0x6eb22876_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  struct IRoleAssociationUtil
    lpVtbl : IRoleAssociationUtilVTbl*
  end

end
struct LibWin32::ICatalog
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
  def get_collection(bstrcollname : UInt8*, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.get_collection.unsafe_as(Proc(UInt8*, IDispatch*, HRESULT)).call(bstrcollname, ppcatalogcollection)
  end
  def connect(bstrconnectstring : UInt8*, ppcatalogcollection : IDispatch*) : HRESULT
    @lpVtbl.value.connect.unsafe_as(Proc(UInt8*, IDispatch*, HRESULT)).call(bstrconnectstring, ppcatalogcollection)
  end
  def get_major_version(retval : Int32*) : HRESULT
    @lpVtbl.value.get_major_version.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_minor_version(retval : Int32*) : HRESULT
    @lpVtbl.value.get_minor_version.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::IComponentUtil
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
  def install_component(bstrdllfile : UInt8*, bstrtypelibfile : UInt8*, bstrproxystubdllfile : UInt8*) : HRESULT
    @lpVtbl.value.install_component.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrdllfile, bstrtypelibfile, bstrproxystubdllfile)
  end
  def import_component(bstrclsid : UInt8*) : HRESULT
    @lpVtbl.value.import_component.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrclsid)
  end
  def import_component_by_name(bstrprogid : UInt8*) : HRESULT
    @lpVtbl.value.import_component_by_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrprogid)
  end
  def get_clsi_ds(bstrdllfile : UInt8*, bstrtypelibfile : UInt8*, aclsids : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_clsi_ds.unsafe_as(Proc(UInt8*, UInt8*, SAFEARRAY**, HRESULT)).call(bstrdllfile, bstrtypelibfile, aclsids)
  end
end
struct LibWin32::IPackageUtil
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
  def install_package(bstrpackagefile : UInt8*, bstrinstallpath : UInt8*, loptions : Int32) : HRESULT
    @lpVtbl.value.install_package.unsafe_as(Proc(UInt8*, UInt8*, Int32, HRESULT)).call(bstrpackagefile, bstrinstallpath, loptions)
  end
  def export_package(bstrpackageid : UInt8*, bstrpackagefile : UInt8*, loptions : Int32) : HRESULT
    @lpVtbl.value.export_package.unsafe_as(Proc(UInt8*, UInt8*, Int32, HRESULT)).call(bstrpackageid, bstrpackagefile, loptions)
  end
  def shutdown_package(bstrpackageid : UInt8*) : HRESULT
    @lpVtbl.value.shutdown_package.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrpackageid)
  end
end
struct LibWin32::IRemoteComponentUtil
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
  def install_remote_component(bstrserver : UInt8*, bstrpackageid : UInt8*, bstrclsid : UInt8*) : HRESULT
    @lpVtbl.value.install_remote_component.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrserver, bstrpackageid, bstrclsid)
  end
  def install_remote_component_by_name(bstrserver : UInt8*, bstrpackagename : UInt8*, bstrprogid : UInt8*) : HRESULT
    @lpVtbl.value.install_remote_component_by_name.unsafe_as(Proc(UInt8*, UInt8*, UInt8*, HRESULT)).call(bstrserver, bstrpackagename, bstrprogid)
  end
end
struct LibWin32::IRoleAssociationUtil
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
  def associate_role(bstrroleid : UInt8*) : HRESULT
    @lpVtbl.value.associate_role.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrroleid)
  end
  def associate_role_by_name(bstrrolename : UInt8*) : HRESULT
    @lpVtbl.value.associate_role_by_name.unsafe_as(Proc(UInt8*, HRESULT)).call(bstrrolename)
  end
end
