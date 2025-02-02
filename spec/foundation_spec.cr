require "./spec_helper"
require "../src/win32cr/foundation"


describe "Win32 Foundation" do
  describe "SetLastErrorEx" do
    it "sets last error to one" do
      Fd.setLastErrorEx(Fd::WIN32_ERROR::ERROR_PATH_NOT_FOUND, 0)
      error_code = LibC.GetLastError
      error_code.should eq(Fd::WIN32_ERROR::ERROR_PATH_NOT_FOUND.value)
    end
  end
end
