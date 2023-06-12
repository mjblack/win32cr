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
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
{% else %}
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

  IXMLGraphBuilder_GUID = LibC::GUID.new("1bb05960-5fbf-11d2-a521-44df07c10000")
  CLSID_IXMLGraphBuilder = "1bb05960-5fbf-11d2-a521-44df07c10000"
  struct IXMLGraphBuilder
    lpVtbl : IXMLGraphBuilderVTbl*
  end

end
