require "../spec_helper"
require "../../src/win32cr/system/com"

module Win32cr::System
  describe "LibWin32 System Com" do

    null_ptr = Pointer(Void).null
    iid = pwstr("{13709620-C279-11CE-A49E-444553540000}")
    ppguid = Pointer(LibC::GUID).malloc(sizeof(LibC::GUID))
    cfguid = Pointer(LibC::GUID).malloc(sizeof(LibC::GUID))
    result = SysCom.iIDFromString(iid, ppguid)
    guid = ppguid.value
    SysCom.iIDFromString(pwstr("{00000001-0000-0000-C000-000000000046}"), cfguid)
    describe "Win32cr::System::Com::C.CoInitializeEx" do
      it "should equal zero" do
      result = SysCom.coInitializeEx(null_ptr, SysCom::COINIT::COINIT_APARTMENTTHREADED)
      result.should eq(Fd::S_OK)
      end
    end

    describe "Win32cr::System::Com::C.IIDFromString" do
      it "result should be zero" do
        result.should eq(Fd::S_OK)
      end
      it "guid should be equal to \"13709620-C279-11CE-A49E-444553540000\"" do
        guid.to_s.should eq("13709620-C279-11CE-A49E-444553540000")
      end
    end

    describe "Win32cr::System::Com::C.CoGetClassObject" do
      it "should return zero" do
        comobj = Pointer(Pointer(Void)).malloc(sizeof(Pointer(Void)))
        result = SysCom.coGetClassObject(pointerof(guid), SysCom::CLSCTX::CLSCTX_INPROC_SERVER, null_ptr, cfguid, comobj)
        result.should eq(Fd::S_OK)
      end
    end

    describe "IMalloc 100 bytes" do
      malloc = Pointer(Void).malloc(sizeof(Void))
      SysCom.coGetMalloc(1_u32, pointerof(malloc))
      imalloc = malloc.as(SysCom::IMalloc*)
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
          com = ComPtr(UIShell::IFileOpenDialog).new(UIShell::CLSID_FileOpenDialog, UIShell::IFileOpenDialog::GUID)
          com.to_unsafe.null?.should eq(false)
        rescue
          fail("Failed to create com object")
        end
      end

      it "should throw exception on bad interface guid" do
       begin
         bad_iid = pwstr("{17777620-C279-11CE-A49E-444553540000}")
         pbad_guid = Pointer(LibC::GUID).malloc(sizeof(LibC::GUID))
         SysCom.iIDFromString(bad_iid, pbad_guid)
         bad_guid = pbad_guid.value
         com = ComPtr(UIShell::IFileOpenDialog).new(UIShell::CLSID_FileOpenDialog, bad_guid)
       rescue e
         e.message.should eq("Failed to create COM instance. (error -2147467262)")
       end
      end
    end
  end
end
