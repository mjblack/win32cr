{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
lib LibWin32
  alias JET_HANDLE = LibC::UINT_PTR
  alias JET_INSTANCE = LibC::UINT_PTR
  alias JET_SESID = LibC::UINT_PTR
  alias JET_TABLEID = LibC::UINT_PTR
  alias JET_API_PTR = LibC::UINT_PTR

end