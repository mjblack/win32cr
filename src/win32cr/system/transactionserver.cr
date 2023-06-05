require "../system/com.cr"
require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  Catalog = LibC::GUID.new(0x6eb22881_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  CatalogObject = LibC::GUID.new(0x6eb22882_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  CatalogCollection = LibC::GUID.new(0x6eb22883_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  ComponentUtil = LibC::GUID.new(0x6eb22884_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  PackageUtil = LibC::GUID.new(0x6eb22885_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  RemoteComponentUtil = LibC::GUID.new(0x6eb22886_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])
  RoleAssociationUtil = LibC::GUID.new(0x6eb22887_u32, 0x8a19_u16, 0x11d0_u16, StaticArray[0x81_u8, 0xb6_u8, 0x0_u8, 0xa0_u8, 0xc9_u8, 0x23_u8, 0x1c_u8, 0x29_u8])


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

  struct IRoleAssociationUtil
    lpVtbl : IRoleAssociationUtilVTbl*
  end

end
