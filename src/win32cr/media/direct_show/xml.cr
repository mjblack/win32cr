require "./../../system/com.cr"
require "./../../foundation.cr"
require "./../direct_show.cr"
require "./../../data/xml/ms_xml.cr"

module Win32cr::Media::DirectShow::Xml
  extend self
  CLSID_XMLGraphBuilder = "1bb05961-5fbf-11d2-a521-44df07c10000"


  @[Extern]
  record IXMLGraphBuilderVtbl,
    query_interface : Proc(IXMLGraphBuilder*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IXMLGraphBuilder*, UInt32),
    release : Proc(IXMLGraphBuilder*, UInt32),
    build_from_xml : Proc(IXMLGraphBuilder*, Void*, Void*, Win32cr::Foundation::HRESULT),
    save_to_xml : Proc(IXMLGraphBuilder*, Void*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    build_from_xml_file : Proc(IXMLGraphBuilder*, Void*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IXMLGraphBuilder, lpVtbl : IXMLGraphBuilderVtbl* do
    GUID = LibC::GUID.new(0x1bb05960_u32, 0x5fbf_u16, 0x11d2_u16, StaticArray[0xa5_u8, 0x21_u8, 0x44_u8, 0xdf_u8, 0x7_u8, 0xc1_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IXMLGraphBuilder*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IXMLGraphBuilder*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IXMLGraphBuilder*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def build_from_xml(this : IXMLGraphBuilder*, pGraph : Void*, pxml : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.build_from_xml.call(this, pGraph, pxml)
    end
    def save_to_xml(this : IXMLGraphBuilder*, pGraph : Void*, pbstrxml : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save_to_xml.call(this, pGraph, pbstrxml)
    end
    def build_from_xml_file(this : IXMLGraphBuilder*, pGraph : Void*, wszFileName : Win32cr::Foundation::PWSTR, wszBaseURL : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.build_from_xml_file.call(this, pGraph, wszFileName, wszBaseURL)
    end

  end

end