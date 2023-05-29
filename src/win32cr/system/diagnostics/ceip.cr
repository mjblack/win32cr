require "../../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
lib LibWin32

  # Params # 
  fun CeipIsOptedIn : LibC::BOOL
end
