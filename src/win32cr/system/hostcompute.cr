@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32
  alias HCS_CALLBACK = LibC::IntPtrT

end
