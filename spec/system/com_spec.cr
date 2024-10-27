require "../spec_helper"
require "../../src/win32cr/system/com"

module Win32cr::System
  describe "LibWin32 System Com" do

    iid = "{13709620-C279-11CE-A49E-444553540000}".to_utf16
    result = Win32cr::System::Com::C.IIDFromString(iid, out guid)
    Win32cr::System::Com::C.IIDFromString("{00000001-0000-0000-C000-000000000046}".to_utf16, out cfguid)
    describe "Win32cr::System::Com::C.CoInitializeEx" do
      it "should equal zero" do
      result = Win32cr::System::Com::C.CoInitializeEx(nil, Win32cr::System::Com::COINIT::COINIT_APARTMENTTHREADED)
      result.should eq(Win32cr::Foundation::S_OK)
      end
    end

    describe "Win32cr::System::Com::C.IIDFromString" do
      it "result should be zero" do
        result.should eq(Win32cr::Foundation::S_OK)
      end
      it "guid should be equal to \"13709620-C279-11CE-A49E-444553540000\"" do
        guid.to_s.should eq("13709620-C279-11CE-A49E-444553540000")
      end
    end

    describe "Win32cr::System::Com::C.CoGetClassObject" do
      it "should return zero" do
        result = Win32cr::System::Com::C.CoGetClassObject(pointerof(guid), Win32cr::System::Com::CLSCTX::CLSCTX_INPROC_SERVER, nil, pointerof(cfguid), out comobj)
        result.should eq(Win32cr::Foundation::S_OK)
      end
    end

    describe "IMalloc 100 bytes" do
      Win32cr::System::Com::C.CoGetMalloc(1, out malloc)
      imalloc = malloc.as(Win32cr::System::Com::IMalloc*)
      ptr = imalloc.value.alloc(imalloc, 100_u64)
      size = imalloc.value.get_size(imalloc, ptr)

      it "should not be null" do
        ptr.null?.should eq(false)
      end

      it "should report 100 bytes" do
        size.should eq(100_u64)
      end
      imalloc.value.free(imalloc, ptr)
    end

    describe "ComPtr creation" do
      it "should be a valid com pointer" do
        begin
          com = ComPtr(Win32cr::UI::Shell::IFileOpenDialog).new(Win32cr::UI::Shell::CLSID_FileOpenDialog, Win32cr::UI::Shell::IFileOpenDialog::GUID)
          com.to_unsafe.null?.should eq(false)
        rescue
          fail("Failed to create com object")
        end
      end

      it "should throw exception on bad interface guid" do
       begin
         bad_iid = "{17777620-C279-11CE-A49E-444553540000}".to_utf16
         Win32cr::System::Com::C.IIDFromString(bad_iid, out bad_guid)
         com = ComPtr(Win32cr::UI::Shell::IFileOpenDialog).new(Win32cr::UI::Shell::CLSID_FileOpenDialog, bad_guid)
       rescue e
         e.message.should eq("Failed to create COM instance. (error -2147467262)")
       end
      end
    end
  end
end