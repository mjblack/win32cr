require "../../foundation.cr"
require "../../storage/xps.cr"
require "../../system/com.cr"
require "../../graphics/gdi.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:prntvpt.dll")]
{% else %}
@[Link("prntvpt")]
{% end %}
lib LibWin32
  PRINTTICKET_ISTREAM_APIS = 1_u32
  S_PT_NO_CONFLICT = 262145_u32
  S_PT_CONFLICT_RESOLVED = 262146_u32
  E_PRINTTICKET_FORMAT = 2147745795_u32
  E_PRINTCAPABILITIES_FORMAT = 2147745796_u32
  E_DELTA_PRINTTICKET_FORMAT = 2147745797_u32
  E_PRINTDEVICECAPABILITIES_FORMAT = 2147745798_u32


  enum EDefaultDevmodeType : Int32
    Kuserdefaultdevmode = 0
    Kprinterdefaultdevmode = 1
  end

  enum EPrintTicketScope : Int32
    Kptpagescope = 0
    Kptdocumentscope = 1
    Kptjobscope = 2
  end


  # Params # pszprintername : LibC::LPWSTR [In],pmaxversion : UInt32* [In]
  fun PTQuerySchemaVersionSupport(pszprintername : LibC::LPWSTR, pmaxversion : UInt32*) : HRESULT

  # Params # pszprintername : LibC::LPWSTR [In],dwversion : UInt32 [In],phprovider : HPTPROVIDER* [In]
  fun PTOpenProvider(pszprintername : LibC::LPWSTR, dwversion : UInt32, phprovider : HPTPROVIDER*) : HRESULT

  # Params # pszprintername : LibC::LPWSTR [In],dwmaxversion : UInt32 [In],dwprefversion : UInt32 [In],phprovider : HPTPROVIDER* [In],pusedversion : UInt32* [In]
  fun PTOpenProviderEx(pszprintername : LibC::LPWSTR, dwmaxversion : UInt32, dwprefversion : UInt32, phprovider : HPTPROVIDER*, pusedversion : UInt32*) : HRESULT

  # Params # hprovider : HPTPROVIDER [In]
  fun PTCloseProvider(hprovider : HPTPROVIDER) : HRESULT

  # Params # pbuffer : Void* [In]
  fun PTReleaseMemory(pbuffer : Void*) : HRESULT

  # Params # hprovider : HPTPROVIDER [In],pprintticket : IStream [In],pcapabilities : IStream [In],pbstrerrormessage : UInt8** [In]
  fun PTGetPrintCapabilities(hprovider : HPTPROVIDER, pprintticket : IStream, pcapabilities : IStream, pbstrerrormessage : UInt8**) : HRESULT

  # Params # hprovider : HPTPROVIDER [In],pprintticket : IStream [In],pdevicecapabilities : IStream [In],pbstrerrormessage : UInt8** [In]
  fun PTGetPrintDeviceCapabilities(hprovider : HPTPROVIDER, pprintticket : IStream, pdevicecapabilities : IStream, pbstrerrormessage : UInt8**) : HRESULT

  # Params # hprovider : HPTPROVIDER [In],pszlocalename : LibC::LPWSTR [In],pprintticket : IStream [In],pdeviceresources : IStream [In],pbstrerrormessage : UInt8** [In]
  fun PTGetPrintDeviceResources(hprovider : HPTPROVIDER, pszlocalename : LibC::LPWSTR, pprintticket : IStream, pdeviceresources : IStream, pbstrerrormessage : UInt8**) : HRESULT

  # Params # hprovider : HPTPROVIDER [In],pbaseticket : IStream [In],pdeltaticket : IStream [In],scope : EPrintTicketScope [In],presultticket : IStream [In],pbstrerrormessage : UInt8** [In]
  fun PTMergeAndValidatePrintTicket(hprovider : HPTPROVIDER, pbaseticket : IStream, pdeltaticket : IStream, scope : EPrintTicketScope, presultticket : IStream, pbstrerrormessage : UInt8**) : HRESULT

  # Params # hprovider : HPTPROVIDER [In],pprintticket : IStream [In],basedevmodetype : EDefaultDevmodeType [In],scope : EPrintTicketScope [In],pcbdevmode : UInt32* [In],ppdevmode : DEVMODEA** [In],pbstrerrormessage : UInt8** [In]
  fun PTConvertPrintTicketToDevMode(hprovider : HPTPROVIDER, pprintticket : IStream, basedevmodetype : EDefaultDevmodeType, scope : EPrintTicketScope, pcbdevmode : UInt32*, ppdevmode : DEVMODEA**, pbstrerrormessage : UInt8**) : HRESULT

  # Params # hprovider : HPTPROVIDER [In],cbdevmode : UInt32 [In],pdevmode : DEVMODEA* [In],scope : EPrintTicketScope [In],pprintticket : IStream [In]
  fun PTConvertDevModeToPrintTicket(hprovider : HPTPROVIDER, cbdevmode : UInt32, pdevmode : DEVMODEA*, scope : EPrintTicketScope, pprintticket : IStream) : HRESULT
end
