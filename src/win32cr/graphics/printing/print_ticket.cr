require "./../../foundation.cr"
require "./../../storage/xps.cr"
require "./../../system/com.cr"
require "./../gdi.cr"

module Win32cr::Graphics::Printing::PrintTicket
  extend self
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

  def pTQuerySchemaVersionSupport(pszPrinterName : Win32cr::Foundation::PWSTR, pMaxVersion : UInt32*) : Win32cr::Foundation::HRESULT
    C.PTQuerySchemaVersionSupport(pszPrinterName, pMaxVersion)
  end

  def pTOpenProvider(pszPrinterName : Win32cr::Foundation::PWSTR, dwVersion : UInt32, phProvider : Win32cr::Storage::Xps::HPTPROVIDER*) : Win32cr::Foundation::HRESULT
    C.PTOpenProvider(pszPrinterName, dwVersion, phProvider)
  end

  def pTOpenProviderEx(pszPrinterName : Win32cr::Foundation::PWSTR, dwMaxVersion : UInt32, dwPrefVersion : UInt32, phProvider : Win32cr::Storage::Xps::HPTPROVIDER*, pUsedVersion : UInt32*) : Win32cr::Foundation::HRESULT
    C.PTOpenProviderEx(pszPrinterName, dwMaxVersion, dwPrefVersion, phProvider, pUsedVersion)
  end

  def pTCloseProvider(hProvider : Win32cr::Storage::Xps::HPTPROVIDER) : Win32cr::Foundation::HRESULT
    C.PTCloseProvider(hProvider)
  end

  def pTReleaseMemory(pBuffer : Void*) : Win32cr::Foundation::HRESULT
    C.PTReleaseMemory(pBuffer)
  end

  def pTGetPrintCapabilities(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pPrintTicket : Void*, pCapabilities : Void*, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
    C.PTGetPrintCapabilities(hProvider, pPrintTicket, pCapabilities, pbstrErrorMessage)
  end

  def pTGetPrintDeviceCapabilities(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pPrintTicket : Void*, pDeviceCapabilities : Void*, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
    C.PTGetPrintDeviceCapabilities(hProvider, pPrintTicket, pDeviceCapabilities, pbstrErrorMessage)
  end

  def pTGetPrintDeviceResources(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pszLocaleName : Win32cr::Foundation::PWSTR, pPrintTicket : Void*, pDeviceResources : Void*, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
    C.PTGetPrintDeviceResources(hProvider, pszLocaleName, pPrintTicket, pDeviceResources, pbstrErrorMessage)
  end

  def pTMergeAndValidatePrintTicket(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pBaseTicket : Void*, pDeltaTicket : Void*, scope : Win32cr::Graphics::Printing::PrintTicket::EPrintTicketScope, pResultTicket : Void*, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
    C.PTMergeAndValidatePrintTicket(hProvider, pBaseTicket, pDeltaTicket, scope, pResultTicket, pbstrErrorMessage)
  end

  def pTConvertPrintTicketToDevMode(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pPrintTicket : Void*, baseDevmodeType : Win32cr::Graphics::Printing::PrintTicket::EDefaultDevmodeType, scope : Win32cr::Graphics::Printing::PrintTicket::EPrintTicketScope, pcbDevmode : UInt32*, ppDevmode : Win32cr::Graphics::Gdi::DEVMODEA**, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
    C.PTConvertPrintTicketToDevMode(hProvider, pPrintTicket, baseDevmodeType, scope, pcbDevmode, ppDevmode, pbstrErrorMessage)
  end

  def pTConvertDevModeToPrintTicket(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, cbDevmode : UInt32, pDevmode : Win32cr::Graphics::Gdi::DEVMODEA*, scope : Win32cr::Graphics::Printing::PrintTicket::EPrintTicketScope, pPrintTicket : Void*) : Win32cr::Foundation::HRESULT
    C.PTConvertDevModeToPrintTicket(hProvider, cbDevmode, pDevmode, scope, pPrintTicket)
  end

  @[Link("prntvpt")]
  lib C
    # :nodoc:
    fun PTQuerySchemaVersionSupport(pszPrinterName : Win32cr::Foundation::PWSTR, pMaxVersion : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PTOpenProvider(pszPrinterName : Win32cr::Foundation::PWSTR, dwVersion : UInt32, phProvider : Win32cr::Storage::Xps::HPTPROVIDER*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PTOpenProviderEx(pszPrinterName : Win32cr::Foundation::PWSTR, dwMaxVersion : UInt32, dwPrefVersion : UInt32, phProvider : Win32cr::Storage::Xps::HPTPROVIDER*, pUsedVersion : UInt32*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PTCloseProvider(hProvider : Win32cr::Storage::Xps::HPTPROVIDER) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PTReleaseMemory(pBuffer : Void*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PTGetPrintCapabilities(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pPrintTicket : Void*, pCapabilities : Void*, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PTGetPrintDeviceCapabilities(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pPrintTicket : Void*, pDeviceCapabilities : Void*, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PTGetPrintDeviceResources(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pszLocaleName : Win32cr::Foundation::PWSTR, pPrintTicket : Void*, pDeviceResources : Void*, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PTMergeAndValidatePrintTicket(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pBaseTicket : Void*, pDeltaTicket : Void*, scope : Win32cr::Graphics::Printing::PrintTicket::EPrintTicketScope, pResultTicket : Void*, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PTConvertPrintTicketToDevMode(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, pPrintTicket : Void*, baseDevmodeType : Win32cr::Graphics::Printing::PrintTicket::EDefaultDevmodeType, scope : Win32cr::Graphics::Printing::PrintTicket::EPrintTicketScope, pcbDevmode : UInt32*, ppDevmode : Win32cr::Graphics::Gdi::DEVMODEA**, pbstrErrorMessage : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    # :nodoc:
    fun PTConvertDevModeToPrintTicket(hProvider : Win32cr::Storage::Xps::HPTPROVIDER, cbDevmode : UInt32, pDevmode : Win32cr::Graphics::Gdi::DEVMODEA*, scope : Win32cr::Graphics::Printing::PrintTicket::EPrintTicketScope, pPrintTicket : Void*) : Win32cr::Foundation::HRESULT

  end
end