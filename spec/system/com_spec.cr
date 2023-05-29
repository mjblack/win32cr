require "../spec_helper"
require "../../src/win32cr/system/com"

module Win32cr::System
  describe "LibWin32 System Com" do

    iid = "{13709620-C279-11CE-A49E-444553540000}".to_utf16
    result = LibWin32.IIDFromString(iid, out guid)
    LibWin32.IIDFromString("{00000001-0000-0000-C000-000000000046}".to_utf16, out cfguid)
    describe "LibWin32.CoInitializeEx" do
      it "should equal zero" do
      result = LibWin32.CoInitializeEx(nil, LibWin32::COINIT::COINIT_APARTMENTTHREADED)
      result.should eq(LibWin32::S_OK)
      end
    end

    describe "LibWin32.IIDFromString" do
      it "result should be zero" do
        result.should eq(LibWin32::S_OK)
      end
      it "guid should be equal to \"13709620-C279-11CE-A49E-444553540000\"" do
        guid.to_s.should eq("13709620-C279-11CE-A49E-444553540000")
      end
    end

    describe "LibWin32.CoGetClassObject" do
      it "should return zero" do
        result = LibWin32.CoGetClassObject(pointerof(guid), LibWin32::CLSCTX::CLSCTX_INPROC_SERVER, nil, pointerof(cfguid), out comobj)
        result.should eq(LibWin32::S_OK)
      end
    end
  end
end