require "../../system/com.cr"
require "../../foundation.cr"
require "../../media/directshow.cr"
require "../../data/xml/msxml.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  CLSID_XMLGraphBuilder = "1bb05961-5fbf-11d2-a521-44df07c10000"


  struct IXMLGraphBuilderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    build_from_xml : UInt64
    save_to_xml : UInt64
    build_from_xml_file : UInt64
  end

  IXMLGraphBuilder_GUID = "1bb05960-5fbf-11d2-a521-44df07c10000"
  IID_IXMLGraphBuilder = LibC::GUID.new(0x1bb05960_u32, 0x5fbf_u16, 0x11d2_u16, StaticArray[0xa5_u8, 0x21_u8, 0x44_u8, 0xdf_u8, 0x7_u8, 0xc1_u8, 0x0_u8, 0x0_u8])
  struct IXMLGraphBuilder
    lpVtbl : IXMLGraphBuilderVTbl*
  end

end
struct LibWin32::IXMLGraphBuilder
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def build_from_xml(pgraph : IGraphBuilder, pxml : IXMLElement) : HRESULT
    @lpVtbl.value.build_from_xml.unsafe_as(Proc(IGraphBuilder, IXMLElement, HRESULT)).call(pgraph, pxml)
  end
  def save_to_xml(pgraph : IGraphBuilder, pbstrxml : UInt8**) : HRESULT
    @lpVtbl.value.save_to_xml.unsafe_as(Proc(IGraphBuilder, UInt8**, HRESULT)).call(pgraph, pbstrxml)
  end
  def build_from_xml_file(pgraph : IGraphBuilder, wszfilename : LibC::LPWSTR, wszbaseurl : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.build_from_xml_file.unsafe_as(Proc(IGraphBuilder, LibC::LPWSTR, LibC::LPWSTR, HRESULT)).call(pgraph, wszfilename, wszbaseurl)
  end
end
