require "../../src/win32cr/graphics/dxgi"
require "./win32application"
class DXSample

  @m_width : UInt32
  @m_height : UInt32
  @m_aspectRatio : Float32
  @m_useWarpDevice : Bool = false

  getter m_assetsPath : String = "./"
  getter m_title : String

  def initialize(@m_width : UInt32, @m_height : UInt32, @m_title : String)

  end

  def get_width : UInt32

  end

  def get_height : UInt32

  end

  def get_title : String

  end

  protected def get_asset_path(name : String)
    @m_assetsPath + name
  end

  protected def get_hardware_adapter(pFactory : LibWin32::IDXGIFactory1, requestHighPerformanceAdapter : Bool = false) : LibWin32::IDXGIAdapter1*
    adapter = Pointer(LibWin32::IDXGIAdapter1).new(sizeof(LibWin32::IDXGIAdapter1))
    unless (LibWin32.IIDFromString("770aae78-f26f-4dba-a829-253c83d1b387".to_utf16, out idxgifactory_guid) == LibWin32::S_OK)
      raise Exception.new("Failed to get Guid object for idxgifactory")
    end
    unless (LibWin32.IIDFromString("29038f61-3839-4626-91fd-086879011a05".to_utf16, out idxgiadapter_guid) == LibWin32::S_OK)
      raise Exception.new("Failed to get Guid object for idxgiadapter")
    end

    if (pFactory.query_interface(pFactory, idxgifactory_guid, out factory6) == LibWin32::S_OK)
      adapter_index = 0_u32
      requestHPAdapter = requestHighPerformanceAdapter ? LibWin32::DXGI_GPU_PREFERENCE::DXGI_GPU_PREFERENCE_HIGH_PERFORMANCE : LibWin32::DXGI_GPU_PREFERENCE::DXGI_GPU_PREFERENCE_UNSPECIFIED
      loop do
        if (factory6.enum_adapter_by_gpu_preference(factory6, adapter_index, requestHPAdapter, idxgiadapter_guid, out adapter) == LibWin32::S_OK)
          desc = uninitialized LibWin32::DXGI_ADAPTER_DESC1
          adapter.get_desc1(pointerof(desc))

          if desc.flags & LibWin32::DXGI_ADAPTER_FLAG_SOFTWARE
            continue
          end

          unless (LibWin32.IIDFromString("189819f1-1db6-4b57-be54-1821339b85f7".to_utf16, out id3d12device_guid) == LibWin32::S_OK)
            raise Exception.new("Failed to get Guid object for idxgiadapter")
          end
          if (LibWin32.D3D12CreateDevice(adapter.get, LibWin32::D3D_FEATURE_LEVEL_11_0, id3d12device_guid, nil) == LibWin32::S_OK)
            break
          end
          adapter_index += 1
        else
          break
        end
      end
    end

    if adapter.get == nil
      adapter_index = 0_u32
      loop do
        if (pFactory.enum_adapters1(adapter_index, adapter) == LibWin32::S_OK)
          desc = uninitialized LibWin32::DXGI_ADAPTER_DESC1
          adapter.get_desc1(pointerof(desc))

          if desc.Flags & LibWin32::DXGI_ADAPTER_FLAG_SOFTWARE
            continue
          end
          unless (LibWin32.IIDFromString("189819f1-1db6-4b57-be54-1821339b85f7".to_utf16, out id3d12device_guid) == LibWin32::S_OK)
            raise Exception.new("Failed to get Guid object for idxgiadapter")
          end
          if (LibWin32.D3D12CreateDevice(adapter.get, LibWin32::D3D_FEATURE_LEVEL_11_0, id3d12device_guid, nil) == LibWin32::S_OK)
            break
          end
        else
          break
        end
        adapter_index += 1
      end
    end

    pAdapter = adapter.detach
    pAdapter
  end

  protected def set_custom_window_text(text : String)
    @m_title = text
    LibWin32.SetWindowText(Win32Application.getHwnd)
  end
end