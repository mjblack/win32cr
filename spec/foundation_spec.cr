require "./spec_helper"
require "../src/win32cr/foundation"

describe "Win32 Foundation" do
  describe "SetLastErrorEx" do
    it "sets last error to one" do
      Win32cr::Foundation::C.SetLastErrorEx(Win32cr::Foundation::WIN32_ERROR::ERROR_PATH_NOT_FOUND, 0)
      error_code = LibC.GetLastError
      error_code.should eq(Win32cr::Foundation::WIN32_ERROR::ERROR_PATH_NOT_FOUND.value)
    end
  end
end