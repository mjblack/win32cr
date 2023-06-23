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
    query_interface : Proc(IXMLGraphBuilder*, Guid*, Void**, HRESULT)
    add_ref : Proc(IXMLGraphBuilder*, UInt32)
    release : Proc(IXMLGraphBuilder*, UInt32)
    build_from_xml : Proc(IXMLGraphBuilder*, IGraphBuilder, IXMLElement, HRESULT)
    save_to_xml : Proc(IXMLGraphBuilder*, IGraphBuilder, UInt8**, HRESULT)
    build_from_xml_file : Proc(IXMLGraphBuilder*, IGraphBuilder, LibC::LPWSTR, LibC::LPWSTR, HRESULT)
  end

  IXMLGraphBuilder_GUID = "1bb05960-5fbf-11d2-a521-44df07c10000"
  IID_IXMLGraphBuilder = LibC::GUID.new(0x1bb05960_u32, 0x5fbf_u16, 0x11d2_u16, StaticArray[0xa5_u8, 0x21_u8, 0x44_u8, 0xdf_u8, 0x7_u8, 0xc1_u8, 0x0_u8, 0x0_u8])
  struct IXMLGraphBuilder
    lpVtbl : IXMLGraphBuilderVTbl*
  end

end
struct LibWin32::IXMLGraphBuilder
  def query_interface(this : IXMLGraphBuilder*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IXMLGraphBuilder*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IXMLGraphBuilder*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def build_from_xml(this : IXMLGraphBuilder*, pgraph : IGraphBuilder, pxml : IXMLElement) : HRESULT
    @lpVtbl.value.build_from_xml.call(this, pgraph, pxml)
  end
  def save_to_xml(this : IXMLGraphBuilder*, pgraph : IGraphBuilder, pbstrxml : UInt8**) : HRESULT
    @lpVtbl.value.save_to_xml.call(this, pgraph, pbstrxml)
  end
  def build_from_xml_file(this : IXMLGraphBuilder*, pgraph : IGraphBuilder, wszfilename : LibC::LPWSTR, wszbaseurl : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.build_from_xml_file.call(this, pgraph, wszfilename, wszbaseurl)
  end
end
