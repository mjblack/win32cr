@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  alias JET_HANDLE = LibC::UINT_PTR
  alias JET_INSTANCE = LibC::UINT_PTR
  alias JET_SESID = LibC::UINT_PTR
  alias JET_TABLEID = LibC::UINT_PTR
  alias JET_API_PTR = LibC::UINT_PTR

end
