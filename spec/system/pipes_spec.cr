require "../spec_helper"
require "../../src/win32cr/system/pipes"

MAX_BUF = 4096

module Win32cr::System
  describe "Win32::System::Environment" do
    describe "Pipes" do
      readSide = Pointer(Void).null
      writeSide = Pointer(Void).null
      teststr = "test string"
      dwWritten = 0_u32
      dwRead = 0_u32
      chbuf = Pointer(UInt8).malloc(MAX_BUF)

      describe "Create Pipes" do
        result = LibWin32.CreatePipe(pointerof(readSide), pointerof(writeSide), nil, 0)

        it "Pipe create result should be greater than zero" do
          result.should be > 0
        end
      end

      describe "Write to pipe" do
        result = LibC.WriteFile(writeSide, teststr.to_unsafe, teststr.size, pointerof(dwWritten), nil)

        it "WriteFile result should be greater than zero" do
          result.should be > 0
        end

        it "Bytes written should be equal to size of test string" do
          dwWritten.should eq(teststr.size)
        end

        result = LibC.CloseHandle(writeSide)

        it "Closing write pipe handle should succeed" do
          result.should be > 0
        end
      end

      describe "Reading from pipe" do
        result = LibC.ReadFile(readSide, chbuf, MAX_BUF, pointerof(dwRead), nil)

        it "ReadFile result should be greater than zero" do
          result.should be > 0
        end

        it "Bytes read should be equal to size of test string" do
          dwRead.should eq(teststr.size)
        end

        str = String.new(chbuf, dwRead)

        it "Read string should equal test string" do
          str.should eq(teststr)
        end

        result = LibC.CloseHandle(readSide)

        it "Closing read pipe handle should succeed" do
          result.should be > 0
        end
      end
    end
  end
end