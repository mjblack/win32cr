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

  struct IWindowsDevicesAllJoynBusObjectFactoryInterop
    lpVtbl : IWindowsDevicesAllJoynBusObjectFactoryInteropVTbl*
  end

end
