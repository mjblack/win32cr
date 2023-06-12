require "../../system/winrt.cr"
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

  struct IWindowsDevicesAllJoynBusAttachmentInteropVTbl
    query_interface : Proc(IWindowsDevicesAllJoynBusAttachmentInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsDevicesAllJoynBusAttachmentInterop*, UInt32)
    release : Proc(IWindowsDevicesAllJoynBusAttachmentInterop*, UInt32)
    get_iids : Proc(IWindowsDevicesAllJoynBusAttachmentInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IWindowsDevicesAllJoynBusAttachmentInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IWindowsDevicesAllJoynBusAttachmentInterop*, TrustLevel*, HRESULT)
    get_win32_handle : Proc(IWindowsDevicesAllJoynBusAttachmentInterop*, UInt64*, HRESULT)
  end

  IWindowsDevicesAllJoynBusAttachmentInterop_GUID = LibC::GUID.new("fd89c65b-b50e-4a19-9d0c-b42b783281cd")
  CLSID_IWindowsDevicesAllJoynBusAttachmentInterop = "fd89c65b-b50e-4a19-9d0c-b42b783281cd"
  struct IWindowsDevicesAllJoynBusAttachmentInterop
    lpVtbl : IWindowsDevicesAllJoynBusAttachmentInteropVTbl*
  end

  struct IWindowsDevicesAllJoynBusAttachmentFactoryInteropVTbl
    query_interface : Proc(IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, UInt32)
    release : Proc(IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, UInt32)
    get_iids : Proc(IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, TrustLevel*, HRESULT)
    create_from_win32_handle : Proc(IWindowsDevicesAllJoynBusAttachmentFactoryInterop*, UInt64, UInt8, Guid*, Void**, HRESULT)
  end

  IWindowsDevicesAllJoynBusAttachmentFactoryInterop_GUID = LibC::GUID.new("4b8f7505-b239-4e7b-88af-f6682575d861")
  CLSID_IWindowsDevicesAllJoynBusAttachmentFactoryInterop = "4b8f7505-b239-4e7b-88af-f6682575d861"
  struct IWindowsDevicesAllJoynBusAttachmentFactoryInterop
    lpVtbl : IWindowsDevicesAllJoynBusAttachmentFactoryInteropVTbl*
  end

  struct IWindowsDevicesAllJoynBusObjectInteropVTbl
    query_interface : Proc(IWindowsDevicesAllJoynBusObjectInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsDevicesAllJoynBusObjectInterop*, UInt32)
    release : Proc(IWindowsDevicesAllJoynBusObjectInterop*, UInt32)
    get_iids : Proc(IWindowsDevicesAllJoynBusObjectInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IWindowsDevicesAllJoynBusObjectInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IWindowsDevicesAllJoynBusObjectInterop*, TrustLevel*, HRESULT)
    add_property_get_handler : Proc(IWindowsDevicesAllJoynBusObjectInterop*, Void*, HSTRING, LibC::IntPtrT, HRESULT)
    add_property_set_handler : Proc(IWindowsDevicesAllJoynBusObjectInterop*, Void*, HSTRING, LibC::IntPtrT, HRESULT)
    get_win32_handle : Proc(IWindowsDevicesAllJoynBusObjectInterop*, UInt64*, HRESULT)
  end

  IWindowsDevicesAllJoynBusObjectInterop_GUID = LibC::GUID.new("d78aa3d5-5054-428f-99f2-ec3a5de3c3bc")
  CLSID_IWindowsDevicesAllJoynBusObjectInterop = "d78aa3d5-5054-428f-99f2-ec3a5de3c3bc"
  struct IWindowsDevicesAllJoynBusObjectInterop
    lpVtbl : IWindowsDevicesAllJoynBusObjectInteropVTbl*
  end

  struct IWindowsDevicesAllJoynBusObjectFactoryInteropVTbl
    query_interface : Proc(IWindowsDevicesAllJoynBusObjectFactoryInterop*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowsDevicesAllJoynBusObjectFactoryInterop*, UInt32)
    release : Proc(IWindowsDevicesAllJoynBusObjectFactoryInterop*, UInt32)
    get_iids : Proc(IWindowsDevicesAllJoynBusObjectFactoryInterop*, UInt32*, Guid**, HRESULT)
    get_runtime_class_name : Proc(IWindowsDevicesAllJoynBusObjectFactoryInterop*, HSTRING*, HRESULT)
    get_trust_level : Proc(IWindowsDevicesAllJoynBusObjectFactoryInterop*, TrustLevel*, HRESULT)
    create_from_win32_handle : Proc(IWindowsDevicesAllJoynBusObjectFactoryInterop*, UInt64, Guid*, Void**, HRESULT)
  end

  IWindowsDevicesAllJoynBusObjectFactoryInterop_GUID = LibC::GUID.new("6174e506-8b95-4e36-95c0-b88fed34938c")
  CLSID_IWindowsDevicesAllJoynBusObjectFactoryInterop = "6174e506-8b95-4e36-95c0-b88fed34938c"
  struct IWindowsDevicesAllJoynBusObjectFactoryInterop
    lpVtbl : IWindowsDevicesAllJoynBusObjectFactoryInteropVTbl*
  end

end
