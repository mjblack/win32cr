require "../../src/win32cr"
require "../../src/win32cr/ui/windowsandmessaging"
require "../../src/win32cr/ui/shell"
require "../../src/win32cr/ui/input/keyboardandmouse"
require "../../src/win32cr/graphics/direct3d12"
require "./dxsample"

class HelloWorld < DXSample

  getter frame_count : UInt32 = 2
  @m_render_targets = [] of Pointer(LibWin32::ID3D12Resource)

  def initialize(width : UInt32, height : UInt32, name : String)
    super(width, height, name)
  end

  def load_pipeline
    dxgiFactoryFlags = 0_u32

    if flags?(:DEBUG)
      if LibWin32.D3D12GetDebugInterface(LibWin32::ID3D12Debug_GUID, out debugController) == LibWin32::S_OK
        debugController = debugController.unsafe_as(Pointer(LibWin32::ID3D12Debug))
        debugController.lpVtbl.enable_debug_layer
        dxgiFactoryFlags |= LibWin32::DXGI_CREATE_FACTORY_DEBUG
      end
    end

    if LibWin32.CreateDXGIFactory2(dxgiFactoryFlags, LibWin32::IDXGIFactory4_GUID, out factory) != LibWin32::S_OK
      raise Exception.new("CreateDXGIFactory2 failed")
    end
    factory = factory.unsafe_as(Pointer(IDXGIFactory4))

    if @m_useWarpDevice
      if factory.enum_warp_adapter(factory, LibWin32::IDXGIAdapter_GUID, out warpAdapter) != LibWin32::S_OK
        raise Exception.new("IDXGIFactory4 enum_warp_adapter failed")
      end

      if LibWin32.D3D12CreateDevice(warpAdapter.get, LibWin32::D3D_FEATURE_LEVEL_11_0, LibWin32::ID3D12Device_GUID, out @m_device) != LibWin32::S_OK
        raise Exception.new("D3D12CreateDevice warpAdapter failed")
      end

      @m_device = @m_device.unsafe_as(Pointer(LibWin32::ID3D12Device))
    else
      hardwareAdapter = get_hardware_adapter(factory.get)
      if LibWin32.D3D12CreateDevice(hardwareAdapter.get, LibWin32::D3D_FEATURE_LEVEL_11_0, LibWin32::ID3D12Device_GUID, out @m_device) != LibWin32::S_OK
        raise Exception.new("D3D12CreateDevice hardwareAdapter failed")
      end
    end

    queueDesc = uninitialized LibWin32::D3D12_COMMAND_QUEUE_DESC
    queueDesc.flags = LibWin32::D3D12_COMMAND_QUEUE_FLAG_NONE
    queueDesc.type = LibWin32::D3D12_COMMAND_LIST_TYPE_DIRECT

    if @m_device.create_command_queue(queueDesc, LibWin32::ID3D12CommandQueue_GUID, out @m_command_queue) != LibWin32::S_OK
      raise Exception.new("ID3D12CommandQueue failed to create command queue")
    end
    @m_command_queue = @m_command_queue.unsafe_as(LibWin32::ID3D12CommandQueue)
    swapChainDesc = uninitialized LibWin32::DXGI_SWAP_CHAIN_DESC1
    swapChainDesc.buffer_count = @frame_count
    swapChainDesc.width = @m_width
    swapChainDesc.height = @m_height
    swapChainDesc.format = LibWin32::DXGI_FORMAT_R8G8B8A8_UNORM
    swapChainDesc.buffer_usage = LibWin32::DXGI_USAGE_RENDER_TARGET_OUTPUT
    swapChainDesc.swap_effect = LibWin32::DXGI_SWAP_EFFECT_FLIP_DISCARD
    swapChainDesc.sample_desc.count = 1

    swapChain = Pointer(LibWin32::IDXGISwapChain1).new(sizeof(LibWin32::IDXGISwapChain1))
    if factory.create_swap_chain_for_hwnd(@m_command_queue.get, Win32Application.get_hwnd, pointerof(swapChainDesc), nil, nil, swapChain) != LibWin32::S_OK
      raise Exception.new("IDXGIFactory4 create_swap_chain_for_hwnd failed")
    end

    if factory.make_window_association(Win32Application.get_hwnd, LibWin32::DXGI_MWA_NO_ALT_ENTER) != LibWin32::S_OK
      raise Exception.new("IDXGIFactory4 make_window_association failed")
    end
    @m_swap_chain = swapChain.unsafe_as(Pointer(LibWin32::IDXGISwapChain3))
    @m_frame_index = @m_swap_chain.get_current_back_buffer_index

    rtvHeapDesc = uninitialized LibWin32::D3D12_DESCRIPTOR_HEAP_DESC
    rtvHeapDesc.num_descriptors = @frame_count
    rtvHeapDesc.type = LibWin32::D3D12_DESCRIPTOR_HEAP_TYPE_RTV
    rtvHeapDesc.flags = LibWin32::D3D12_DESCRIPTOR_HEAP_FLAG_NONE
    @m_rtv_heap = Pointer(LibWin32::ID3D12DescriptorHeap).new(sizeof(LibWin32::ID3D12DescriptorHeap))
    if @m_device.create_descriptor_heap(pointerof(rtvHeapDesc), LibWin32::ID3D12DescriptorHeap_GUID) != LibWin32::S_OK
      raise Exception.new("ID3D12DescriptorHeap create_descriptor_heap failed")
    end
    @m_rtv_descriptor_size = @m_device.get_descriptor_handle_increment_size(LibWin32::D3D12_DESCRIPTOR_HEAP_TYPE_RTV)

    rtvHandle = m_rtv_heap.get_cpu_descriptor_handle_for_heap_start
    n = 0
    while n < @frame_count

      if @m_swap_chain.get_buffer(n, LibWin32::ID3D12Resource_GUID, pointerof(@m_render_targets[n])) != LibWin32::S_OK
        raise Exception.new("IDXGISwapChain3 get buffer failed")
      end
      @m_device.create_render_target_view(@m_render_targets[n].get, nil, rtvHandle)
      rtvHandle.offset(1, @m_rtv_descriptor_size)
      n += 1
    end

    @m_command_allocator = Pointer(LibWin32::ID3D12CommandAllocator).new(sizeof(LibWin32::ID3D12CommandAllocator))
    if @m_device.create_command_allocator(LibWin32::D3D12_COMMAND_LIST_TYPE_DIRECT, ID3D12CommandAllocator_GUID, pointerof(@m_command_allocator)) != LibWin32::S_OK
      raise Exception.new("ID3D12CommandAllocator create_command_allocator failed")
    end
  end

  def load_assets
    @m_command_list = Pointer(LibWin32::ID3D12GraphicsCommandList).new(sizeof(LibWin32::ID3D12GraphicsCommandList))
    if @m_device.create_command_list(0, LibWin32::D3D12_COMMAND_LIST_TYPE_DIRECT, @m_command_allocator.get, nil, LibWin32::ID3D12GraphicsCommandList_GUID, pointerof(@m_command_list)) != LibWin32::S_OK
      raise Exception.new("ID3D12GraphicsCommandList create_command_list failed")
    end

    if @m_command_list.close != LibWin32::S_OK
      raise Exception.new("ID3D12GraphicsCommandList close failed")
    end
    @m_fence = Pointer(LibWin32::ID3D12Fence).new(sizeof(LibWin32::ID3D12Fence))
    if @m_device.create_fence(0, LibWin32::D3D12_FENCE_FLAG_NONE, LibWin32::ID3D12Fence_GUID, pointerof(@m_fence)) != LibWin32::S_OK
      raise Exception.new("ID3D12Fence create fence failed")
    end

    @m_fence_event = create_event(nil, false, false, nil)
    if @m_fence_event.nil?
      err = LibC.GetLastError
      raise Exception.new("HANDLE m_fence_event create_event failed: #{err}")
    end
  end

  def on_init
    load_pipeline
    load_assets
  end

  def on_update
    populate_command_list
    ppCommandLists = @m_command_list
    @m_command_queue.execute_command_lists(ppCommandLists.size, ppCommandLists)
    if @m_swap_chain.present(1,0) != LibWin32::S_OK
      raise Exception.new("ID3D12Resource on_update present")
    end

    wait_for_previous_frame
  end

  def on_render

  end

  def on_destroy
    wait_for_previous_frame
    LibC.CloseHandle(@m_fence_event)
  end

  def populate_command_list
    if @m_command_allocator.reset != LibWin32::S_OK
      raise Exception.new("populate command list command allocator reset")
    end

    if @m_command_list.reset(@m_command_allocator, @m_pipeline_state) != LibWin32::S_OK
      raise Exception.new("populate command list command allocator reset")
    end

    @m_command_list.resource_barrier(1, CD3DX12_RESOURCE_BARRIER)
  end

  def wait_for_previous_frame

  end
end