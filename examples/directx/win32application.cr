class Win32Application

  @@hwnd = Pointer(LibWin32).new(sizeof(LibWin32::HWND))

  def self.run

  end

  def self.get_hwnd

  end

  def self.wndproc

  end
end