require "./../../foundation.cr"
require "./../../storage/xps.cr"
require "./../../system/com.cr"
require "./../gdi.cr"

module Win32cr::Graphics::Printing::PrintTicket
  PRINTTICKET_ISTREAM_APIS = 1_u32
  S_PT_NO_CONFLICT = 262145_u32
  S_PT_CONFLICT_RESOLVED = 262146_u32
  E_PRINTTICKET_FORMAT = 2147745795_u32
  E_PRINTCAPABILITIES_FORMAT = 2147745796_u32
  E_DELTA_PRINTTICKET_FORMAT = 2147745797_u32
  E_PRINTDEVICECAPABILITIES_FORMAT = 2147745798_u32

  enum EDefaultDevmodeType
    Kuserdefaultdevmode = 0_i32
    Kprinterdefaultdevmode = 1_i32
  end
  enum EPrintTicketScope
    Kptpagescope = 0_i32
    Kptdocumentscope = 1_i32
    Kptjobscope = 2_i32
  end

  @[Link("prntvpt")]
  lib C
    fun PTQuerySchemaVersionSupport(pszPrinterName : Win32cr::Foundation::PWSTR, pMaxVersion : UInt32*) : Win32cr::Foundation::HRESULT

    fun PTOpenProvider(pszPrinterName : Win32cr::Foundation::PWSTR, dwVersion : UInt32, phProvider : Win32cr::Storage::Xps::HPTPROVIDER*) : Win32cr::Foundation::HRESULT

    fun PTOpenProviderEx(pszPrinterName : Win32cr::Foundation::PWSTR, dwMaxVersion : UInt32, dwPrefVersion : UInt32, phProvider : Win32cr::Storage::Xps::HPTPROVIDER*, pUsedVersion : UInt32*) : Win32cr::Foundation::HRESULT

    fun PTCloseProvider(hProvider : Win32cr::Storage::Xps::HPTPROVIDER) : Win32cr::Foundation::HRESULT

    fun PTReleaseMemory(pBuffer : Void*) : Win32cr::Foundation::HRESULT

    fun PTGetPrintCapabilities(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pPrintTicket : Void*, pCapabilities : Void*, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    fun PTGetPrintDeviceCapabilities(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pPrintTicket : Void*, pDeviceCapabilities : Void*, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    fun PTGetPrintDeviceResources(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pszLocaleName : Win32cr::Foundation::PWSTR, pPrintTicket : Void*, pDeviceResources : Void*, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    fun PTMergeAndValidatePrintTicket(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pBaseTicket : Void*, pDeltaTicket : Void*, scope : Win32cr::Graphics::Printing::PrintTicket::EPrintTicketScope, pResultTicket : Void*, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    fun PTConvertPrintTicketToDevMode(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pPrintTicket : Void*, baseDevmodeType : Win32cr::Graphics::Printing::PrintTicket::EDefaultDevmodeType, scope : Win32cr::Graphics::Printing::PrintTicket::EPrintTicketScope, pcbDevmode : UInt32*, ppDevmode : Win32cr::Graphics::Gdi::DEVMODEA**, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    fun PTConvertDevModeToPrintTicket(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, cbDevmode : UInt32, pDevmode : Win32cr::Graphics::Gdi::DEVMODEA*, scope : Win32cr::Graphics::Printing::PrintTicket::EPrintTicketScope, pPrintTicket : Void*) : Win32cr::Foundation::HRESULT

  end
end