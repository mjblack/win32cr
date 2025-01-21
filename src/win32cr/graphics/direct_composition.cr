require "./../foundation.cr"
require "./dxgi/common.cr"
require "./../system/com.cr"
require "./direct2_d/common.cr"
require "./direct3_d.cr"
require "./dxgi.cr"
require "./../security.cr"

module Win32cr::Graphics::DirectComposition
  COMPOSITIONOBJECT_READ = 1_i32
  COMPOSITIONOBJECT_WRITE = 2_i32
  DCOMPOSITION_MAX_WAITFORCOMPOSITORCLOCK_OBJECTS = 32_u32
  COMPOSITION_STATS_MAX_TARGETS = 256_u32

  enum DCOMPOSITION_BITMAP_INTERPOLATION_MODE
    DCOMPOSITION_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0_i32
    DCOMPOSITION_BITMAP_INTERPOLATION_MODE_LINEAR = 1_i32
    DCOMPOSITION_BITMAP_INTERPOLATION_MODE_INHERIT = -1_i32
  end
  enum DCOMPOSITION_BORDER_MODE
    DCOMPOSITION_BORDER_MODE_SOFT = 0_i32
    DCOMPOSITION_BORDER_MODE_HARD = 1_i32
    DCOMPOSITION_BORDER_MODE_INHERIT = -1_i32
  end
  enum DCOMPOSITION_COMPOSITE_MODE
    DCOMPOSITION_COMPOSITE_MODE_SOURCE_OVER = 0_i32
    DCOMPOSITION_COMPOSITE_MODE_DESTINATION_INVERT = 1_i32
    DCOMPOSITION_COMPOSITE_MODE_MIN_BLEND = 2_i32
    DCOMPOSITION_COMPOSITE_MODE_INHERIT = -1_i32
  end
  enum DCOMPOSITION_BACKFACE_VISIBILITY
    DCOMPOSITION_BACKFACE_VISIBILITY_VISIBLE = 0_i32
    DCOMPOSITION_BACKFACE_VISIBILITY_HIDDEN = 1_i32
    DCOMPOSITION_BACKFACE_VISIBILITY_INHERIT = -1_i32
  end
  enum DCOMPOSITION_OPACITY_MODE
    DCOMPOSITION_OPACITY_MODE_LAYER = 0_i32
    DCOMPOSITION_OPACITY_MODE_MULTIPLY = 1_i32
    DCOMPOSITION_OPACITY_MODE_INHERIT = -1_i32
  end
  enum DCOMPOSITION_DEPTH_MODE
    DCOMPOSITION_DEPTH_MODE_TREE = 0_i32
    DCOMPOSITION_DEPTH_MODE_SPATIAL = 1_i32
    DCOMPOSITION_DEPTH_MODE_SORTED = 3_i32
    DCOMPOSITION_DEPTH_MODE_INHERIT = -1_i32
  end
  enum COMPOSITION_FRAME_ID_TYPE
    COMPOSITION_FRAME_ID_CREATED = 0_i32
    COMPOSITION_FRAME_ID_CONFIRMED = 1_i32
    COMPOSITION_FRAME_ID_COMPLETED = 2_i32
  end

  @[Extern]
  record DCOMPOSITION_FRAME_STATISTICS,
    lastFrameTime : Win32cr::Foundation::LARGE_INTEGER,
    currentCompositionRate : Win32cr::Graphics::Dxgi::Common::DXGI_RATIONAL,
    currentTime : Win32cr::Foundation::LARGE_INTEGER,
    timeFrequency : Win32cr::Foundation::LARGE_INTEGER,
    nextEstimatedFrameTime : Win32cr::Foundation::LARGE_INTEGER

  @[Extern]
  record COMPOSITION_FRAME_STATS,
    startTime : UInt64,
    targetTime : UInt64,
    framePeriod : UInt64

  @[Extern]
  record COMPOSITION_TARGET_ID,
    displayAdapterLuid : Win32cr::Foundation::LUID,
    renderAdapterLuid : Win32cr::Foundation::LUID,
    vidPnSourceId : UInt32,
    vidPnTargetId : UInt32,
    uniqueId : UInt32

  @[Extern]
  record COMPOSITION_STATS,
    presentCount : UInt32,
    refreshCount : UInt32,
    virtualRefreshCount : UInt32,
    time : UInt64

  @[Extern]
  record COMPOSITION_TARGET_STATS,
    outstandingPresents : UInt32,
    presentTime : UInt64,
    vblankDuration : UInt64,
    presentedStats : Win32cr::Graphics::DirectComposition::COMPOSITION_STATS,
    completedStats : Win32cr::Graphics::DirectComposition::COMPOSITION_STATS

  @[Extern]
  record DCompositionInkTrailPoint,
    x : Float32,
    y : Float32,
    radius : Float32

  @[Extern]
  record IDCompositionAnimationVtbl,
    query_interface : Proc(IDCompositionAnimation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionAnimation*, UInt32),
    release : Proc(IDCompositionAnimation*, UInt32),
    reset : Proc(IDCompositionAnimation*, Win32cr::Foundation::HRESULT),
    set_absolute_begin_time : Proc(IDCompositionAnimation*, Win32cr::Foundation::LARGE_INTEGER, Win32cr::Foundation::HRESULT),
    add_cubic : Proc(IDCompositionAnimation*, Float64, Float32, Float32, Float32, Float32, Win32cr::Foundation::HRESULT),
    add_sinusoidal : Proc(IDCompositionAnimation*, Float64, Float32, Float32, Float32, Float32, Win32cr::Foundation::HRESULT),
    add_repeat : Proc(IDCompositionAnimation*, Float64, Float64, Win32cr::Foundation::HRESULT),
    end__ : Proc(IDCompositionAnimation*, Float64, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("cbfd91d9-51b2-45e4-b3de-d19ccfb863c5")]
  record IDCompositionAnimation, lpVtbl : IDCompositionAnimationVtbl* do
    GUID = LibC::GUID.new(0xcbfd91d9_u32, 0x51b2_u16, 0x45e4_u16, StaticArray[0xb3_u8, 0xde_u8, 0xd1_u8, 0x9c_u8, 0xcf_u8, 0xb8_u8, 0x63_u8, 0xc5_u8])
    def query_interface(this : IDCompositionAnimation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionAnimation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionAnimation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def reset(this : IDCompositionAnimation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def set_absolute_begin_time(this : IDCompositionAnimation*, beginTime : Win32cr::Foundation::LARGE_INTEGER) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_absolute_begin_time.call(this, beginTime)
    end
    def add_cubic(this : IDCompositionAnimation*, beginOffset : Float64, constantCoefficient : Float32, linearCoefficient : Float32, quadraticCoefficient : Float32, cubicCoefficient : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_cubic.call(this, beginOffset, constantCoefficient, linearCoefficient, quadraticCoefficient, cubicCoefficient)
    end
    def add_sinusoidal(this : IDCompositionAnimation*, beginOffset : Float64, bias : Float32, amplitude : Float32, frequency : Float32, phase : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_sinusoidal.call(this, beginOffset, bias, amplitude, frequency, phase)
    end
    def add_repeat(this : IDCompositionAnimation*, beginOffset : Float64, durationToRepeat : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_repeat.call(this, beginOffset, durationToRepeat)
    end
    def end__(this : IDCompositionAnimation*, endOffset : Float64, endValue : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end__.call(this, endOffset, endValue)
    end

  end

  @[Extern]
  record IDCompositionDeviceVtbl,
    query_interface : Proc(IDCompositionDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionDevice*, UInt32),
    release : Proc(IDCompositionDevice*, UInt32),
    commit : Proc(IDCompositionDevice*, Win32cr::Foundation::HRESULT),
    wait_for_commit_completion : Proc(IDCompositionDevice*, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDCompositionDevice*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    create_target_for_hwnd : Proc(IDCompositionDevice*, Win32cr::Foundation::HWND, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    create_visual : Proc(IDCompositionDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_surface : Proc(IDCompositionDevice*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, Void**, Win32cr::Foundation::HRESULT),
    create_virtual_surface : Proc(IDCompositionDevice*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, Void**, Win32cr::Foundation::HRESULT),
    create_surface_from_handle : Proc(IDCompositionDevice*, Win32cr::Foundation::HANDLE, Void**, Win32cr::Foundation::HRESULT),
    create_surface_from_hwnd : Proc(IDCompositionDevice*, Win32cr::Foundation::HWND, Void**, Win32cr::Foundation::HRESULT),
    create_translate_transform : Proc(IDCompositionDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_scale_transform : Proc(IDCompositionDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_rotate_transform : Proc(IDCompositionDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_skew_transform : Proc(IDCompositionDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_matrix_transform : Proc(IDCompositionDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_transform_group : Proc(IDCompositionDevice*, Void**, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_translate_transform3_d : Proc(IDCompositionDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_scale_transform3_d : Proc(IDCompositionDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_rotate_transform3_d : Proc(IDCompositionDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_matrix_transform3_d : Proc(IDCompositionDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_transform3_d_group : Proc(IDCompositionDevice*, Void**, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_effect_group : Proc(IDCompositionDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_rectangle_clip : Proc(IDCompositionDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_animation : Proc(IDCompositionDevice*, Void**, Win32cr::Foundation::HRESULT),
    check_device_state : Proc(IDCompositionDevice*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c37ea93a-e7aa-450d-b16f-9746cb0407f3")]
  record IDCompositionDevice, lpVtbl : IDCompositionDeviceVtbl* do
    GUID = LibC::GUID.new(0xc37ea93a_u32, 0xe7aa_u16, 0x450d_u16, StaticArray[0xb1_u8, 0x6f_u8, 0x97_u8, 0x46_u8, 0xcb_u8, 0x4_u8, 0x7_u8, 0xf3_u8])
    def query_interface(this : IDCompositionDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def commit(this : IDCompositionDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def wait_for_commit_completion(this : IDCompositionDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_commit_completion.call(this)
    end
    def get_frame_statistics(this : IDCompositionDevice*, statistics : Win32cr::Graphics::DirectComposition::DCOMPOSITION_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, statistics)
    end
    def create_target_for_hwnd(this : IDCompositionDevice*, hwnd : Win32cr::Foundation::HWND, topmost : Win32cr::Foundation::BOOL, target : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_target_for_hwnd.call(this, hwnd, topmost, target)
    end
    def create_visual(this : IDCompositionDevice*, visual : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_visual.call(this, visual)
    end
    def create_surface(this : IDCompositionDevice*, width : UInt32, height : UInt32, pixelFormat : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, alphaMode : Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, surface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface.call(this, width, height, pixelFormat, alphaMode, surface)
    end
    def create_virtual_surface(this : IDCompositionDevice*, initialWidth : UInt32, initialHeight : UInt32, pixelFormat : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, alphaMode : Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, virtualSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_surface.call(this, initialWidth, initialHeight, pixelFormat, alphaMode, virtualSurface)
    end
    def create_surface_from_handle(this : IDCompositionDevice*, handle : Win32cr::Foundation::HANDLE, surface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface_from_handle.call(this, handle, surface)
    end
    def create_surface_from_hwnd(this : IDCompositionDevice*, hwnd : Win32cr::Foundation::HWND, surface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface_from_hwnd.call(this, hwnd, surface)
    end
    def create_translate_transform(this : IDCompositionDevice*, translateTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_translate_transform.call(this, translateTransform)
    end
    def create_scale_transform(this : IDCompositionDevice*, scaleTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_scale_transform.call(this, scaleTransform)
    end
    def create_rotate_transform(this : IDCompositionDevice*, rotateTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rotate_transform.call(this, rotateTransform)
    end
    def create_skew_transform(this : IDCompositionDevice*, skewTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_skew_transform.call(this, skewTransform)
    end
    def create_matrix_transform(this : IDCompositionDevice*, matrixTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_matrix_transform.call(this, matrixTransform)
    end
    def create_transform_group(this : IDCompositionDevice*, transforms : Void**, elements : UInt32, transformGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_transform_group.call(this, transforms, elements, transformGroup)
    end
    def create_translate_transform3_d(this : IDCompositionDevice*, translateTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_translate_transform3_d.call(this, translateTransform3D)
    end
    def create_scale_transform3_d(this : IDCompositionDevice*, scaleTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_scale_transform3_d.call(this, scaleTransform3D)
    end
    def create_rotate_transform3_d(this : IDCompositionDevice*, rotateTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rotate_transform3_d.call(this, rotateTransform3D)
    end
    def create_matrix_transform3_d(this : IDCompositionDevice*, matrixTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_matrix_transform3_d.call(this, matrixTransform3D)
    end
    def create_transform3_d_group(this : IDCompositionDevice*, transforms3D : Void**, elements : UInt32, transform3DGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_transform3_d_group.call(this, transforms3D, elements, transform3DGroup)
    end
    def create_effect_group(this : IDCompositionDevice*, effectGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_effect_group.call(this, effectGroup)
    end
    def create_rectangle_clip(this : IDCompositionDevice*, clip : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rectangle_clip.call(this, clip)
    end
    def create_animation(this : IDCompositionDevice*, animation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_animation.call(this, animation)
    end
    def check_device_state(this : IDCompositionDevice*, pfValid : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_device_state.call(this, pfValid)
    end

  end

  @[Extern]
  record IDCompositionTargetVtbl,
    query_interface : Proc(IDCompositionTarget*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionTarget*, UInt32),
    release : Proc(IDCompositionTarget*, UInt32),
    set_root : Proc(IDCompositionTarget*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("eacdd04c-117e-4e17-88f4-d1b12b0e3d89")]
  record IDCompositionTarget, lpVtbl : IDCompositionTargetVtbl* do
    GUID = LibC::GUID.new(0xeacdd04c_u32, 0x117e_u16, 0x4e17_u16, StaticArray[0x88_u8, 0xf4_u8, 0xd1_u8, 0xb1_u8, 0x2b_u8, 0xe_u8, 0x3d_u8, 0x89_u8])
    def query_interface(this : IDCompositionTarget*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionTarget*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionTarget*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_root(this : IDCompositionTarget*, visual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_root.call(this, visual)
    end

  end

  @[Extern]
  record IDCompositionVisualVtbl,
    query_interface : Proc(IDCompositionVisual*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionVisual*, UInt32),
    release : Proc(IDCompositionVisual*, UInt32),
    set_offset_x_1 : Proc(IDCompositionVisual*, Void*, Win32cr::Foundation::HRESULT),
    set_offset_x_2 : Proc(IDCompositionVisual*, Float32, Win32cr::Foundation::HRESULT),
    set_offset_y_1 : Proc(IDCompositionVisual*, Void*, Win32cr::Foundation::HRESULT),
    set_offset_y_2 : Proc(IDCompositionVisual*, Float32, Win32cr::Foundation::HRESULT),
    set_transform_1 : Proc(IDCompositionVisual*, Void*, Win32cr::Foundation::HRESULT),
    set_transform_2_1 : Proc(IDCompositionVisual*, Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_3X2_F*, Win32cr::Foundation::HRESULT),
    set_transform_parent : Proc(IDCompositionVisual*, Void*, Win32cr::Foundation::HRESULT),
    set_effect : Proc(IDCompositionVisual*, Void*, Win32cr::Foundation::HRESULT),
    set_bitmap_interpolation_mode : Proc(IDCompositionVisual*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_BITMAP_INTERPOLATION_MODE, Win32cr::Foundation::HRESULT),
    set_border_mode : Proc(IDCompositionVisual*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_BORDER_MODE, Win32cr::Foundation::HRESULT),
    set_clip_1 : Proc(IDCompositionVisual*, Void*, Win32cr::Foundation::HRESULT),
    set_clip_2 : Proc(IDCompositionVisual*, Win32cr::Graphics::Direct2D::Common::D2D_RECT_F*, Win32cr::Foundation::HRESULT),
    set_content : Proc(IDCompositionVisual*, Void*, Win32cr::Foundation::HRESULT),
    add_visual : Proc(IDCompositionVisual*, Void*, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    remove_visual : Proc(IDCompositionVisual*, Void*, Win32cr::Foundation::HRESULT),
    remove_all_visuals : Proc(IDCompositionVisual*, Win32cr::Foundation::HRESULT),
    set_composite_mode : Proc(IDCompositionVisual*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_COMPOSITE_MODE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4d93059d-097b-4651-9a60-f0f25116e2f3")]
  record IDCompositionVisual, lpVtbl : IDCompositionVisualVtbl* do
    GUID = LibC::GUID.new(0x4d93059d_u32, 0x97b_u16, 0x4651_u16, StaticArray[0x9a_u8, 0x60_u8, 0xf0_u8, 0xf2_u8, 0x51_u8, 0x16_u8, 0xe2_u8, 0xf3_u8])
    def query_interface(this : IDCompositionVisual*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionVisual*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionVisual*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_offset_x_1(this : IDCompositionVisual*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_x_1.call(this, animation)
    end
    def set_offset_x_2(this : IDCompositionVisual*, offsetX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_x_2.call(this, offsetX)
    end
    def set_offset_y_1(this : IDCompositionVisual*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_y_1.call(this, animation)
    end
    def set_offset_y_2(this : IDCompositionVisual*, offsetY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_y_2.call(this, offsetY)
    end
    def set_transform_1(this : IDCompositionVisual*, transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_1.call(this, transform)
    end
    def set_transform_2_1(this : IDCompositionVisual*, matrix : Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_3X2_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_2_1.call(this, matrix)
    end
    def set_transform_parent(this : IDCompositionVisual*, visual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_parent.call(this, visual)
    end
    def set_effect(this : IDCompositionVisual*, effect : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effect.call(this, effect)
    end
    def set_bitmap_interpolation_mode(this : IDCompositionVisual*, interpolationMode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_BITMAP_INTERPOLATION_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bitmap_interpolation_mode.call(this, interpolationMode)
    end
    def set_border_mode(this : IDCompositionVisual*, borderMode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_BORDER_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_border_mode.call(this, borderMode)
    end
    def set_clip_1(this : IDCompositionVisual*, clip : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_1.call(this, clip)
    end
    def set_clip_2(this : IDCompositionVisual*, rect : Win32cr::Graphics::Direct2D::Common::D2D_RECT_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_2.call(this, rect)
    end
    def set_content(this : IDCompositionVisual*, content : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content.call(this, content)
    end
    def add_visual(this : IDCompositionVisual*, visual : Void*, insertAbove : Win32cr::Foundation::BOOL, referenceVisual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_visual.call(this, visual, insertAbove, referenceVisual)
    end
    def remove_visual(this : IDCompositionVisual*, visual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_visual.call(this, visual)
    end
    def remove_all_visuals(this : IDCompositionVisual*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_visuals.call(this)
    end
    def set_composite_mode(this : IDCompositionVisual*, compositeMode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_COMPOSITE_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composite_mode.call(this, compositeMode)
    end

  end

  @[Extern]
  record IDCompositionEffectVtbl,
    query_interface : Proc(IDCompositionEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionEffect*, UInt32),
    release : Proc(IDCompositionEffect*, UInt32)


  @[Extern]
  #@[Com("ec81b08f-bfcb-4e8d-b193-a915587999e8")]
  record IDCompositionEffect, lpVtbl : IDCompositionEffectVtbl* do
    GUID = LibC::GUID.new(0xec81b08f_u32, 0xbfcb_u16, 0x4e8d_u16, StaticArray[0xb1_u8, 0x93_u8, 0xa9_u8, 0x15_u8, 0x58_u8, 0x79_u8, 0x99_u8, 0xe8_u8])
    def query_interface(this : IDCompositionEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record IDCompositionTransform3DVtbl,
    query_interface : Proc(IDCompositionTransform3D*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionTransform3D*, UInt32),
    release : Proc(IDCompositionTransform3D*, UInt32)


  @[Extern]
  #@[Com("71185722-246b-41f2-aad1-0443f7f4bfc2")]
  record IDCompositionTransform3D, lpVtbl : IDCompositionTransform3DVtbl* do
    GUID = LibC::GUID.new(0x71185722_u32, 0x246b_u16, 0x41f2_u16, StaticArray[0xaa_u8, 0xd1_u8, 0x4_u8, 0x43_u8, 0xf7_u8, 0xf4_u8, 0xbf_u8, 0xc2_u8])
    def query_interface(this : IDCompositionTransform3D*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionTransform3D*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionTransform3D*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record IDCompositionTransformVtbl,
    query_interface : Proc(IDCompositionTransform*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionTransform*, UInt32),
    release : Proc(IDCompositionTransform*, UInt32)


  @[Extern]
  #@[Com("fd55faa7-37e0-4c20-95d2-9be45bc33f55")]
  record IDCompositionTransform, lpVtbl : IDCompositionTransformVtbl* do
    GUID = LibC::GUID.new(0xfd55faa7_u32, 0x37e0_u16, 0x4c20_u16, StaticArray[0x95_u8, 0xd2_u8, 0x9b_u8, 0xe4_u8, 0x5b_u8, 0xc3_u8, 0x3f_u8, 0x55_u8])
    def query_interface(this : IDCompositionTransform*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionTransform*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionTransform*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record IDCompositionTranslateTransformVtbl,
    query_interface : Proc(IDCompositionTranslateTransform*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionTranslateTransform*, UInt32),
    release : Proc(IDCompositionTranslateTransform*, UInt32),
    set_offset_x_1 : Proc(IDCompositionTranslateTransform*, Void*, Win32cr::Foundation::HRESULT),
    set_offset_x_2 : Proc(IDCompositionTranslateTransform*, Float32, Win32cr::Foundation::HRESULT),
    set_offset_y_1 : Proc(IDCompositionTranslateTransform*, Void*, Win32cr::Foundation::HRESULT),
    set_offset_y_2 : Proc(IDCompositionTranslateTransform*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("06791122-c6f0-417d-8323-269e987f5954")]
  record IDCompositionTranslateTransform, lpVtbl : IDCompositionTranslateTransformVtbl* do
    GUID = LibC::GUID.new(0x6791122_u32, 0xc6f0_u16, 0x417d_u16, StaticArray[0x83_u8, 0x23_u8, 0x26_u8, 0x9e_u8, 0x98_u8, 0x7f_u8, 0x59_u8, 0x54_u8])
    def query_interface(this : IDCompositionTranslateTransform*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionTranslateTransform*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionTranslateTransform*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_offset_x_1(this : IDCompositionTranslateTransform*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_x_1.call(this, animation)
    end
    def set_offset_x_2(this : IDCompositionTranslateTransform*, offsetX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_x_2.call(this, offsetX)
    end
    def set_offset_y_1(this : IDCompositionTranslateTransform*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_y_1.call(this, animation)
    end
    def set_offset_y_2(this : IDCompositionTranslateTransform*, offsetY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_y_2.call(this, offsetY)
    end

  end

  @[Extern]
  record IDCompositionScaleTransformVtbl,
    query_interface : Proc(IDCompositionScaleTransform*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionScaleTransform*, UInt32),
    release : Proc(IDCompositionScaleTransform*, UInt32),
    set_scale_x_1 : Proc(IDCompositionScaleTransform*, Void*, Win32cr::Foundation::HRESULT),
    set_scale_x_2 : Proc(IDCompositionScaleTransform*, Float32, Win32cr::Foundation::HRESULT),
    set_scale_y_1 : Proc(IDCompositionScaleTransform*, Void*, Win32cr::Foundation::HRESULT),
    set_scale_y_2 : Proc(IDCompositionScaleTransform*, Float32, Win32cr::Foundation::HRESULT),
    set_center_x_1 : Proc(IDCompositionScaleTransform*, Void*, Win32cr::Foundation::HRESULT),
    set_center_x_2 : Proc(IDCompositionScaleTransform*, Float32, Win32cr::Foundation::HRESULT),
    set_center_y_1 : Proc(IDCompositionScaleTransform*, Void*, Win32cr::Foundation::HRESULT),
    set_center_y_2 : Proc(IDCompositionScaleTransform*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("71fde914-40ef-45ef-bd51-68b037c339f9")]
  record IDCompositionScaleTransform, lpVtbl : IDCompositionScaleTransformVtbl* do
    GUID = LibC::GUID.new(0x71fde914_u32, 0x40ef_u16, 0x45ef_u16, StaticArray[0xbd_u8, 0x51_u8, 0x68_u8, 0xb0_u8, 0x37_u8, 0xc3_u8, 0x39_u8, 0xf9_u8])
    def query_interface(this : IDCompositionScaleTransform*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionScaleTransform*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionScaleTransform*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_scale_x_1(this : IDCompositionScaleTransform*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scale_x_1.call(this, animation)
    end
    def set_scale_x_2(this : IDCompositionScaleTransform*, scaleX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scale_x_2.call(this, scaleX)
    end
    def set_scale_y_1(this : IDCompositionScaleTransform*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scale_y_1.call(this, animation)
    end
    def set_scale_y_2(this : IDCompositionScaleTransform*, scaleY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scale_y_2.call(this, scaleY)
    end
    def set_center_x_1(this : IDCompositionScaleTransform*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_x_1.call(this, animation)
    end
    def set_center_x_2(this : IDCompositionScaleTransform*, centerX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_x_2.call(this, centerX)
    end
    def set_center_y_1(this : IDCompositionScaleTransform*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_y_1.call(this, animation)
    end
    def set_center_y_2(this : IDCompositionScaleTransform*, centerY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_y_2.call(this, centerY)
    end

  end

  @[Extern]
  record IDCompositionRotateTransformVtbl,
    query_interface : Proc(IDCompositionRotateTransform*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionRotateTransform*, UInt32),
    release : Proc(IDCompositionRotateTransform*, UInt32),
    set_angle_1 : Proc(IDCompositionRotateTransform*, Void*, Win32cr::Foundation::HRESULT),
    set_angle_2 : Proc(IDCompositionRotateTransform*, Float32, Win32cr::Foundation::HRESULT),
    set_center_x_1 : Proc(IDCompositionRotateTransform*, Void*, Win32cr::Foundation::HRESULT),
    set_center_x_2 : Proc(IDCompositionRotateTransform*, Float32, Win32cr::Foundation::HRESULT),
    set_center_y_1 : Proc(IDCompositionRotateTransform*, Void*, Win32cr::Foundation::HRESULT),
    set_center_y_2 : Proc(IDCompositionRotateTransform*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("641ed83c-ae96-46c5-90dc-32774cc5c6d5")]
  record IDCompositionRotateTransform, lpVtbl : IDCompositionRotateTransformVtbl* do
    GUID = LibC::GUID.new(0x641ed83c_u32, 0xae96_u16, 0x46c5_u16, StaticArray[0x90_u8, 0xdc_u8, 0x32_u8, 0x77_u8, 0x4c_u8, 0xc5_u8, 0xc6_u8, 0xd5_u8])
    def query_interface(this : IDCompositionRotateTransform*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionRotateTransform*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionRotateTransform*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_angle_1(this : IDCompositionRotateTransform*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_angle_1.call(this, animation)
    end
    def set_angle_2(this : IDCompositionRotateTransform*, angle : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_angle_2.call(this, angle)
    end
    def set_center_x_1(this : IDCompositionRotateTransform*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_x_1.call(this, animation)
    end
    def set_center_x_2(this : IDCompositionRotateTransform*, centerX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_x_2.call(this, centerX)
    end
    def set_center_y_1(this : IDCompositionRotateTransform*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_y_1.call(this, animation)
    end
    def set_center_y_2(this : IDCompositionRotateTransform*, centerY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_y_2.call(this, centerY)
    end

  end

  @[Extern]
  record IDCompositionSkewTransformVtbl,
    query_interface : Proc(IDCompositionSkewTransform*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionSkewTransform*, UInt32),
    release : Proc(IDCompositionSkewTransform*, UInt32),
    set_angle_x_1 : Proc(IDCompositionSkewTransform*, Void*, Win32cr::Foundation::HRESULT),
    set_angle_x_2 : Proc(IDCompositionSkewTransform*, Float32, Win32cr::Foundation::HRESULT),
    set_angle_y_1 : Proc(IDCompositionSkewTransform*, Void*, Win32cr::Foundation::HRESULT),
    set_angle_y_2 : Proc(IDCompositionSkewTransform*, Float32, Win32cr::Foundation::HRESULT),
    set_center_x_1 : Proc(IDCompositionSkewTransform*, Void*, Win32cr::Foundation::HRESULT),
    set_center_x_2 : Proc(IDCompositionSkewTransform*, Float32, Win32cr::Foundation::HRESULT),
    set_center_y_1 : Proc(IDCompositionSkewTransform*, Void*, Win32cr::Foundation::HRESULT),
    set_center_y_2 : Proc(IDCompositionSkewTransform*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e57aa735-dcdb-4c72-9c61-0591f58889ee")]
  record IDCompositionSkewTransform, lpVtbl : IDCompositionSkewTransformVtbl* do
    GUID = LibC::GUID.new(0xe57aa735_u32, 0xdcdb_u16, 0x4c72_u16, StaticArray[0x9c_u8, 0x61_u8, 0x5_u8, 0x91_u8, 0xf5_u8, 0x88_u8, 0x89_u8, 0xee_u8])
    def query_interface(this : IDCompositionSkewTransform*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionSkewTransform*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionSkewTransform*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_angle_x_1(this : IDCompositionSkewTransform*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_angle_x_1.call(this, animation)
    end
    def set_angle_x_2(this : IDCompositionSkewTransform*, angleX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_angle_x_2.call(this, angleX)
    end
    def set_angle_y_1(this : IDCompositionSkewTransform*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_angle_y_1.call(this, animation)
    end
    def set_angle_y_2(this : IDCompositionSkewTransform*, angleY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_angle_y_2.call(this, angleY)
    end
    def set_center_x_1(this : IDCompositionSkewTransform*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_x_1.call(this, animation)
    end
    def set_center_x_2(this : IDCompositionSkewTransform*, centerX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_x_2.call(this, centerX)
    end
    def set_center_y_1(this : IDCompositionSkewTransform*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_y_1.call(this, animation)
    end
    def set_center_y_2(this : IDCompositionSkewTransform*, centerY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_y_2.call(this, centerY)
    end

  end

  @[Extern]
  record IDCompositionMatrixTransformVtbl,
    query_interface : Proc(IDCompositionMatrixTransform*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionMatrixTransform*, UInt32),
    release : Proc(IDCompositionMatrixTransform*, UInt32),
    set_matrix : Proc(IDCompositionMatrixTransform*, Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_3X2_F*, Win32cr::Foundation::HRESULT),
    set_matrix_element_1 : Proc(IDCompositionMatrixTransform*, Int32, Int32, Void*, Win32cr::Foundation::HRESULT),
    set_matrix_element_2 : Proc(IDCompositionMatrixTransform*, Int32, Int32, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("16cdff07-c503-419c-83f2-0965c7af1fa6")]
  record IDCompositionMatrixTransform, lpVtbl : IDCompositionMatrixTransformVtbl* do
    GUID = LibC::GUID.new(0x16cdff07_u32, 0xc503_u16, 0x419c_u16, StaticArray[0x83_u8, 0xf2_u8, 0x9_u8, 0x65_u8, 0xc7_u8, 0xaf_u8, 0x1f_u8, 0xa6_u8])
    def query_interface(this : IDCompositionMatrixTransform*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionMatrixTransform*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionMatrixTransform*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_matrix(this : IDCompositionMatrixTransform*, matrix : Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_3X2_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_matrix.call(this, matrix)
    end
    def set_matrix_element_1(this : IDCompositionMatrixTransform*, row : Int32, column : Int32, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_matrix_element_1.call(this, row, column, animation)
    end
    def set_matrix_element_2(this : IDCompositionMatrixTransform*, row : Int32, column : Int32, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_matrix_element_2.call(this, row, column, value)
    end

  end

  @[Extern]
  record IDCompositionEffectGroupVtbl,
    query_interface : Proc(IDCompositionEffectGroup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionEffectGroup*, UInt32),
    release : Proc(IDCompositionEffectGroup*, UInt32),
    set_opacity_1 : Proc(IDCompositionEffectGroup*, Void*, Win32cr::Foundation::HRESULT),
    set_opacity_2 : Proc(IDCompositionEffectGroup*, Float32, Win32cr::Foundation::HRESULT),
    set_transform3_d : Proc(IDCompositionEffectGroup*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a7929a74-e6b2-4bd6-8b95-4040119ca34d")]
  record IDCompositionEffectGroup, lpVtbl : IDCompositionEffectGroupVtbl* do
    GUID = LibC::GUID.new(0xa7929a74_u32, 0xe6b2_u16, 0x4bd6_u16, StaticArray[0x8b_u8, 0x95_u8, 0x40_u8, 0x40_u8, 0x11_u8, 0x9c_u8, 0xa3_u8, 0x4d_u8])
    def query_interface(this : IDCompositionEffectGroup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionEffectGroup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionEffectGroup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_opacity_1(this : IDCompositionEffectGroup*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_1.call(this, animation)
    end
    def set_opacity_2(this : IDCompositionEffectGroup*, opacity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_2.call(this, opacity)
    end
    def set_transform3_d(this : IDCompositionEffectGroup*, transform3D : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform3_d.call(this, transform3D)
    end

  end

  @[Extern]
  record IDCompositionTranslateTransform3DVtbl,
    query_interface : Proc(IDCompositionTranslateTransform3D*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionTranslateTransform3D*, UInt32),
    release : Proc(IDCompositionTranslateTransform3D*, UInt32),
    set_offset_x_1 : Proc(IDCompositionTranslateTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_offset_x_2 : Proc(IDCompositionTranslateTransform3D*, Float32, Win32cr::Foundation::HRESULT),
    set_offset_y_1 : Proc(IDCompositionTranslateTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_offset_y_2 : Proc(IDCompositionTranslateTransform3D*, Float32, Win32cr::Foundation::HRESULT),
    set_offset_z_1 : Proc(IDCompositionTranslateTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_offset_z_2 : Proc(IDCompositionTranslateTransform3D*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("91636d4b-9ba1-4532-aaf7-e3344994d788")]
  record IDCompositionTranslateTransform3D, lpVtbl : IDCompositionTranslateTransform3DVtbl* do
    GUID = LibC::GUID.new(0x91636d4b_u32, 0x9ba1_u16, 0x4532_u16, StaticArray[0xaa_u8, 0xf7_u8, 0xe3_u8, 0x34_u8, 0x49_u8, 0x94_u8, 0xd7_u8, 0x88_u8])
    def query_interface(this : IDCompositionTranslateTransform3D*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionTranslateTransform3D*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionTranslateTransform3D*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_offset_x_1(this : IDCompositionTranslateTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_x_1.call(this, animation)
    end
    def set_offset_x_2(this : IDCompositionTranslateTransform3D*, offsetX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_x_2.call(this, offsetX)
    end
    def set_offset_y_1(this : IDCompositionTranslateTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_y_1.call(this, animation)
    end
    def set_offset_y_2(this : IDCompositionTranslateTransform3D*, offsetY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_y_2.call(this, offsetY)
    end
    def set_offset_z_1(this : IDCompositionTranslateTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_z_1.call(this, animation)
    end
    def set_offset_z_2(this : IDCompositionTranslateTransform3D*, offsetZ : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_z_2.call(this, offsetZ)
    end

  end

  @[Extern]
  record IDCompositionScaleTransform3DVtbl,
    query_interface : Proc(IDCompositionScaleTransform3D*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionScaleTransform3D*, UInt32),
    release : Proc(IDCompositionScaleTransform3D*, UInt32),
    set_scale_x_1 : Proc(IDCompositionScaleTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_scale_x_2 : Proc(IDCompositionScaleTransform3D*, Float32, Win32cr::Foundation::HRESULT),
    set_scale_y_1 : Proc(IDCompositionScaleTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_scale_y_2 : Proc(IDCompositionScaleTransform3D*, Float32, Win32cr::Foundation::HRESULT),
    set_scale_z_1 : Proc(IDCompositionScaleTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_scale_z_2 : Proc(IDCompositionScaleTransform3D*, Float32, Win32cr::Foundation::HRESULT),
    set_center_x_1 : Proc(IDCompositionScaleTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_center_x_2 : Proc(IDCompositionScaleTransform3D*, Float32, Win32cr::Foundation::HRESULT),
    set_center_y_1 : Proc(IDCompositionScaleTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_center_y_2 : Proc(IDCompositionScaleTransform3D*, Float32, Win32cr::Foundation::HRESULT),
    set_center_z_1 : Proc(IDCompositionScaleTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_center_z_2 : Proc(IDCompositionScaleTransform3D*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2a9e9ead-364b-4b15-a7c4-a1997f78b389")]
  record IDCompositionScaleTransform3D, lpVtbl : IDCompositionScaleTransform3DVtbl* do
    GUID = LibC::GUID.new(0x2a9e9ead_u32, 0x364b_u16, 0x4b15_u16, StaticArray[0xa7_u8, 0xc4_u8, 0xa1_u8, 0x99_u8, 0x7f_u8, 0x78_u8, 0xb3_u8, 0x89_u8])
    def query_interface(this : IDCompositionScaleTransform3D*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionScaleTransform3D*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionScaleTransform3D*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_scale_x_1(this : IDCompositionScaleTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scale_x_1.call(this, animation)
    end
    def set_scale_x_2(this : IDCompositionScaleTransform3D*, scaleX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scale_x_2.call(this, scaleX)
    end
    def set_scale_y_1(this : IDCompositionScaleTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scale_y_1.call(this, animation)
    end
    def set_scale_y_2(this : IDCompositionScaleTransform3D*, scaleY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scale_y_2.call(this, scaleY)
    end
    def set_scale_z_1(this : IDCompositionScaleTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scale_z_1.call(this, animation)
    end
    def set_scale_z_2(this : IDCompositionScaleTransform3D*, scaleZ : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scale_z_2.call(this, scaleZ)
    end
    def set_center_x_1(this : IDCompositionScaleTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_x_1.call(this, animation)
    end
    def set_center_x_2(this : IDCompositionScaleTransform3D*, centerX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_x_2.call(this, centerX)
    end
    def set_center_y_1(this : IDCompositionScaleTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_y_1.call(this, animation)
    end
    def set_center_y_2(this : IDCompositionScaleTransform3D*, centerY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_y_2.call(this, centerY)
    end
    def set_center_z_1(this : IDCompositionScaleTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_z_1.call(this, animation)
    end
    def set_center_z_2(this : IDCompositionScaleTransform3D*, centerZ : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_z_2.call(this, centerZ)
    end

  end

  @[Extern]
  record IDCompositionRotateTransform3DVtbl,
    query_interface : Proc(IDCompositionRotateTransform3D*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionRotateTransform3D*, UInt32),
    release : Proc(IDCompositionRotateTransform3D*, UInt32),
    set_angle_1 : Proc(IDCompositionRotateTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_angle_2 : Proc(IDCompositionRotateTransform3D*, Float32, Win32cr::Foundation::HRESULT),
    set_axis_x_1 : Proc(IDCompositionRotateTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_axis_x_2 : Proc(IDCompositionRotateTransform3D*, Float32, Win32cr::Foundation::HRESULT),
    set_axis_y_1 : Proc(IDCompositionRotateTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_axis_y_2 : Proc(IDCompositionRotateTransform3D*, Float32, Win32cr::Foundation::HRESULT),
    set_axis_z_1 : Proc(IDCompositionRotateTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_axis_z_2 : Proc(IDCompositionRotateTransform3D*, Float32, Win32cr::Foundation::HRESULT),
    set_center_x_1 : Proc(IDCompositionRotateTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_center_x_2 : Proc(IDCompositionRotateTransform3D*, Float32, Win32cr::Foundation::HRESULT),
    set_center_y_1 : Proc(IDCompositionRotateTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_center_y_2 : Proc(IDCompositionRotateTransform3D*, Float32, Win32cr::Foundation::HRESULT),
    set_center_z_1 : Proc(IDCompositionRotateTransform3D*, Void*, Win32cr::Foundation::HRESULT),
    set_center_z_2 : Proc(IDCompositionRotateTransform3D*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("d8f5b23f-d429-4a91-b55a-d2f45fd75b18")]
  record IDCompositionRotateTransform3D, lpVtbl : IDCompositionRotateTransform3DVtbl* do
    GUID = LibC::GUID.new(0xd8f5b23f_u32, 0xd429_u16, 0x4a91_u16, StaticArray[0xb5_u8, 0x5a_u8, 0xd2_u8, 0xf4_u8, 0x5f_u8, 0xd7_u8, 0x5b_u8, 0x18_u8])
    def query_interface(this : IDCompositionRotateTransform3D*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionRotateTransform3D*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionRotateTransform3D*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_angle_1(this : IDCompositionRotateTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_angle_1.call(this, animation)
    end
    def set_angle_2(this : IDCompositionRotateTransform3D*, angle : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_angle_2.call(this, angle)
    end
    def set_axis_x_1(this : IDCompositionRotateTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_axis_x_1.call(this, animation)
    end
    def set_axis_x_2(this : IDCompositionRotateTransform3D*, axisX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_axis_x_2.call(this, axisX)
    end
    def set_axis_y_1(this : IDCompositionRotateTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_axis_y_1.call(this, animation)
    end
    def set_axis_y_2(this : IDCompositionRotateTransform3D*, axisY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_axis_y_2.call(this, axisY)
    end
    def set_axis_z_1(this : IDCompositionRotateTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_axis_z_1.call(this, animation)
    end
    def set_axis_z_2(this : IDCompositionRotateTransform3D*, axisZ : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_axis_z_2.call(this, axisZ)
    end
    def set_center_x_1(this : IDCompositionRotateTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_x_1.call(this, animation)
    end
    def set_center_x_2(this : IDCompositionRotateTransform3D*, centerX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_x_2.call(this, centerX)
    end
    def set_center_y_1(this : IDCompositionRotateTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_y_1.call(this, animation)
    end
    def set_center_y_2(this : IDCompositionRotateTransform3D*, centerY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_y_2.call(this, centerY)
    end
    def set_center_z_1(this : IDCompositionRotateTransform3D*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_z_1.call(this, animation)
    end
    def set_center_z_2(this : IDCompositionRotateTransform3D*, centerZ : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_center_z_2.call(this, centerZ)
    end

  end

  @[Extern]
  record IDCompositionMatrixTransform3DVtbl,
    query_interface : Proc(IDCompositionMatrixTransform3D*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionMatrixTransform3D*, UInt32),
    release : Proc(IDCompositionMatrixTransform3D*, UInt32),
    set_matrix : Proc(IDCompositionMatrixTransform3D*, Win32cr::Graphics::Direct3D::D3DMATRIX*, Win32cr::Foundation::HRESULT),
    set_matrix_element_1 : Proc(IDCompositionMatrixTransform3D*, Int32, Int32, Void*, Win32cr::Foundation::HRESULT),
    set_matrix_element_2 : Proc(IDCompositionMatrixTransform3D*, Int32, Int32, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4b3363f0-643b-41b7-b6e0-ccf22d34467c")]
  record IDCompositionMatrixTransform3D, lpVtbl : IDCompositionMatrixTransform3DVtbl* do
    GUID = LibC::GUID.new(0x4b3363f0_u32, 0x643b_u16, 0x41b7_u16, StaticArray[0xb6_u8, 0xe0_u8, 0xcc_u8, 0xf2_u8, 0x2d_u8, 0x34_u8, 0x46_u8, 0x7c_u8])
    def query_interface(this : IDCompositionMatrixTransform3D*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionMatrixTransform3D*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionMatrixTransform3D*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_matrix(this : IDCompositionMatrixTransform3D*, matrix : Win32cr::Graphics::Direct3D::D3DMATRIX*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_matrix.call(this, matrix)
    end
    def set_matrix_element_1(this : IDCompositionMatrixTransform3D*, row : Int32, column : Int32, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_matrix_element_1.call(this, row, column, animation)
    end
    def set_matrix_element_2(this : IDCompositionMatrixTransform3D*, row : Int32, column : Int32, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_matrix_element_2.call(this, row, column, value)
    end

  end

  @[Extern]
  record IDCompositionClipVtbl,
    query_interface : Proc(IDCompositionClip*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionClip*, UInt32),
    release : Proc(IDCompositionClip*, UInt32)


  @[Extern]
  #@[Com("64ac3703-9d3f-45ec-a109-7cac0e7a13a7")]
  record IDCompositionClip, lpVtbl : IDCompositionClipVtbl* do
    GUID = LibC::GUID.new(0x64ac3703_u32, 0x9d3f_u16, 0x45ec_u16, StaticArray[0xa1_u8, 0x9_u8, 0x7c_u8, 0xac_u8, 0xe_u8, 0x7a_u8, 0x13_u8, 0xa7_u8])
    def query_interface(this : IDCompositionClip*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionClip*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionClip*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record IDCompositionRectangleClipVtbl,
    query_interface : Proc(IDCompositionRectangleClip*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionRectangleClip*, UInt32),
    release : Proc(IDCompositionRectangleClip*, UInt32),
    set_left_1 : Proc(IDCompositionRectangleClip*, Void*, Win32cr::Foundation::HRESULT),
    set_left_2 : Proc(IDCompositionRectangleClip*, Float32, Win32cr::Foundation::HRESULT),
    set_top_1 : Proc(IDCompositionRectangleClip*, Void*, Win32cr::Foundation::HRESULT),
    set_top_2 : Proc(IDCompositionRectangleClip*, Float32, Win32cr::Foundation::HRESULT),
    set_right_1 : Proc(IDCompositionRectangleClip*, Void*, Win32cr::Foundation::HRESULT),
    set_right_2 : Proc(IDCompositionRectangleClip*, Float32, Win32cr::Foundation::HRESULT),
    set_bottom_1 : Proc(IDCompositionRectangleClip*, Void*, Win32cr::Foundation::HRESULT),
    set_bottom_2 : Proc(IDCompositionRectangleClip*, Float32, Win32cr::Foundation::HRESULT),
    set_top_left_radius_x_1 : Proc(IDCompositionRectangleClip*, Void*, Win32cr::Foundation::HRESULT),
    set_top_left_radius_x_2 : Proc(IDCompositionRectangleClip*, Float32, Win32cr::Foundation::HRESULT),
    set_top_left_radius_y_1 : Proc(IDCompositionRectangleClip*, Void*, Win32cr::Foundation::HRESULT),
    set_top_left_radius_y_2 : Proc(IDCompositionRectangleClip*, Float32, Win32cr::Foundation::HRESULT),
    set_top_right_radius_x_1 : Proc(IDCompositionRectangleClip*, Void*, Win32cr::Foundation::HRESULT),
    set_top_right_radius_x_2 : Proc(IDCompositionRectangleClip*, Float32, Win32cr::Foundation::HRESULT),
    set_top_right_radius_y_1 : Proc(IDCompositionRectangleClip*, Void*, Win32cr::Foundation::HRESULT),
    set_top_right_radius_y_2 : Proc(IDCompositionRectangleClip*, Float32, Win32cr::Foundation::HRESULT),
    set_bottom_left_radius_x_1 : Proc(IDCompositionRectangleClip*, Void*, Win32cr::Foundation::HRESULT),
    set_bottom_left_radius_x_2 : Proc(IDCompositionRectangleClip*, Float32, Win32cr::Foundation::HRESULT),
    set_bottom_left_radius_y_1 : Proc(IDCompositionRectangleClip*, Void*, Win32cr::Foundation::HRESULT),
    set_bottom_left_radius_y_2 : Proc(IDCompositionRectangleClip*, Float32, Win32cr::Foundation::HRESULT),
    set_bottom_right_radius_x_1 : Proc(IDCompositionRectangleClip*, Void*, Win32cr::Foundation::HRESULT),
    set_bottom_right_radius_x_2 : Proc(IDCompositionRectangleClip*, Float32, Win32cr::Foundation::HRESULT),
    set_bottom_right_radius_y_1 : Proc(IDCompositionRectangleClip*, Void*, Win32cr::Foundation::HRESULT),
    set_bottom_right_radius_y_2 : Proc(IDCompositionRectangleClip*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9842ad7d-d9cf-4908-aed7-48b51da5e7c2")]
  record IDCompositionRectangleClip, lpVtbl : IDCompositionRectangleClipVtbl* do
    GUID = LibC::GUID.new(0x9842ad7d_u32, 0xd9cf_u16, 0x4908_u16, StaticArray[0xae_u8, 0xd7_u8, 0x48_u8, 0xb5_u8, 0x1d_u8, 0xa5_u8, 0xe7_u8, 0xc2_u8])
    def query_interface(this : IDCompositionRectangleClip*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionRectangleClip*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionRectangleClip*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_left_1(this : IDCompositionRectangleClip*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_left_1.call(this, animation)
    end
    def set_left_2(this : IDCompositionRectangleClip*, left : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_left_2.call(this, left)
    end
    def set_top_1(this : IDCompositionRectangleClip*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_top_1.call(this, animation)
    end
    def set_top_2(this : IDCompositionRectangleClip*, top : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_top_2.call(this, top)
    end
    def set_right_1(this : IDCompositionRectangleClip*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_right_1.call(this, animation)
    end
    def set_right_2(this : IDCompositionRectangleClip*, right : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_right_2.call(this, right)
    end
    def set_bottom_1(this : IDCompositionRectangleClip*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bottom_1.call(this, animation)
    end
    def set_bottom_2(this : IDCompositionRectangleClip*, bottom : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bottom_2.call(this, bottom)
    end
    def set_top_left_radius_x_1(this : IDCompositionRectangleClip*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_top_left_radius_x_1.call(this, animation)
    end
    def set_top_left_radius_x_2(this : IDCompositionRectangleClip*, radius : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_top_left_radius_x_2.call(this, radius)
    end
    def set_top_left_radius_y_1(this : IDCompositionRectangleClip*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_top_left_radius_y_1.call(this, animation)
    end
    def set_top_left_radius_y_2(this : IDCompositionRectangleClip*, radius : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_top_left_radius_y_2.call(this, radius)
    end
    def set_top_right_radius_x_1(this : IDCompositionRectangleClip*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_top_right_radius_x_1.call(this, animation)
    end
    def set_top_right_radius_x_2(this : IDCompositionRectangleClip*, radius : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_top_right_radius_x_2.call(this, radius)
    end
    def set_top_right_radius_y_1(this : IDCompositionRectangleClip*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_top_right_radius_y_1.call(this, animation)
    end
    def set_top_right_radius_y_2(this : IDCompositionRectangleClip*, radius : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_top_right_radius_y_2.call(this, radius)
    end
    def set_bottom_left_radius_x_1(this : IDCompositionRectangleClip*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bottom_left_radius_x_1.call(this, animation)
    end
    def set_bottom_left_radius_x_2(this : IDCompositionRectangleClip*, radius : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bottom_left_radius_x_2.call(this, radius)
    end
    def set_bottom_left_radius_y_1(this : IDCompositionRectangleClip*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bottom_left_radius_y_1.call(this, animation)
    end
    def set_bottom_left_radius_y_2(this : IDCompositionRectangleClip*, radius : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bottom_left_radius_y_2.call(this, radius)
    end
    def set_bottom_right_radius_x_1(this : IDCompositionRectangleClip*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bottom_right_radius_x_1.call(this, animation)
    end
    def set_bottom_right_radius_x_2(this : IDCompositionRectangleClip*, radius : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bottom_right_radius_x_2.call(this, radius)
    end
    def set_bottom_right_radius_y_1(this : IDCompositionRectangleClip*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bottom_right_radius_y_1.call(this, animation)
    end
    def set_bottom_right_radius_y_2(this : IDCompositionRectangleClip*, radius : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bottom_right_radius_y_2.call(this, radius)
    end

  end

  @[Extern]
  record IDCompositionSurfaceVtbl,
    query_interface : Proc(IDCompositionSurface*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionSurface*, UInt32),
    release : Proc(IDCompositionSurface*, UInt32),
    begin_draw : Proc(IDCompositionSurface*, Win32cr::Foundation::RECT*, LibC::GUID*, Void**, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    end_draw : Proc(IDCompositionSurface*, Win32cr::Foundation::HRESULT),
    suspend_draw : Proc(IDCompositionSurface*, Win32cr::Foundation::HRESULT),
    resume_draw : Proc(IDCompositionSurface*, Win32cr::Foundation::HRESULT),
    scroll : Proc(IDCompositionSurface*, Win32cr::Foundation::RECT*, Win32cr::Foundation::RECT*, Int32, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("bb8a4953-2c99-4f5a-96f5-4819027fa3ac")]
  record IDCompositionSurface, lpVtbl : IDCompositionSurfaceVtbl* do
    GUID = LibC::GUID.new(0xbb8a4953_u32, 0x2c99_u16, 0x4f5a_u16, StaticArray[0x96_u8, 0xf5_u8, 0x48_u8, 0x19_u8, 0x2_u8, 0x7f_u8, 0xa3_u8, 0xac_u8])
    def query_interface(this : IDCompositionSurface*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionSurface*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionSurface*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_draw(this : IDCompositionSurface*, updateRect : Win32cr::Foundation::RECT*, iid : LibC::GUID*, updateObject : Void**, updateOffset : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_draw.call(this, updateRect, iid, updateObject, updateOffset)
    end
    def end_draw(this : IDCompositionSurface*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_draw.call(this)
    end
    def suspend_draw(this : IDCompositionSurface*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend_draw.call(this)
    end
    def resume_draw(this : IDCompositionSurface*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_draw.call(this)
    end
    def scroll(this : IDCompositionSurface*, scrollRect : Win32cr::Foundation::RECT*, clipRect : Win32cr::Foundation::RECT*, offsetX : Int32, offsetY : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll.call(this, scrollRect, clipRect, offsetX, offsetY)
    end

  end

  @[Extern]
  record IDCompositionVirtualSurfaceVtbl,
    query_interface : Proc(IDCompositionVirtualSurface*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionVirtualSurface*, UInt32),
    release : Proc(IDCompositionVirtualSurface*, UInt32),
    begin_draw : Proc(IDCompositionVirtualSurface*, Win32cr::Foundation::RECT*, LibC::GUID*, Void**, Win32cr::Foundation::POINT*, Win32cr::Foundation::HRESULT),
    end_draw : Proc(IDCompositionVirtualSurface*, Win32cr::Foundation::HRESULT),
    suspend_draw : Proc(IDCompositionVirtualSurface*, Win32cr::Foundation::HRESULT),
    resume_draw : Proc(IDCompositionVirtualSurface*, Win32cr::Foundation::HRESULT),
    scroll : Proc(IDCompositionVirtualSurface*, Win32cr::Foundation::RECT*, Win32cr::Foundation::RECT*, Int32, Int32, Win32cr::Foundation::HRESULT),
    resize : Proc(IDCompositionVirtualSurface*, UInt32, UInt32, Win32cr::Foundation::HRESULT),
    trim : Proc(IDCompositionVirtualSurface*, Win32cr::Foundation::RECT*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("ae471c51-5f53-4a24-8d3e-d0c39c30b3f0")]
  record IDCompositionVirtualSurface, lpVtbl : IDCompositionVirtualSurfaceVtbl* do
    GUID = LibC::GUID.new(0xae471c51_u32, 0x5f53_u16, 0x4a24_u16, StaticArray[0x8d_u8, 0x3e_u8, 0xd0_u8, 0xc3_u8, 0x9c_u8, 0x30_u8, 0xb3_u8, 0xf0_u8])
    def query_interface(this : IDCompositionVirtualSurface*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionVirtualSurface*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionVirtualSurface*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def begin_draw(this : IDCompositionVirtualSurface*, updateRect : Win32cr::Foundation::RECT*, iid : LibC::GUID*, updateObject : Void**, updateOffset : Win32cr::Foundation::POINT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.begin_draw.call(this, updateRect, iid, updateObject, updateOffset)
    end
    def end_draw(this : IDCompositionVirtualSurface*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.end_draw.call(this)
    end
    def suspend_draw(this : IDCompositionVirtualSurface*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.suspend_draw.call(this)
    end
    def resume_draw(this : IDCompositionVirtualSurface*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resume_draw.call(this)
    end
    def scroll(this : IDCompositionVirtualSurface*, scrollRect : Win32cr::Foundation::RECT*, clipRect : Win32cr::Foundation::RECT*, offsetX : Int32, offsetY : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll.call(this, scrollRect, clipRect, offsetX, offsetY)
    end
    def resize(this : IDCompositionVirtualSurface*, width : UInt32, height : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize.call(this, width, height)
    end
    def trim(this : IDCompositionVirtualSurface*, rectangles : Win32cr::Foundation::RECT*, count : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.trim.call(this, rectangles, count)
    end

  end

  @[Extern]
  record IDCompositionDevice2Vtbl,
    query_interface : Proc(IDCompositionDevice2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionDevice2*, UInt32),
    release : Proc(IDCompositionDevice2*, UInt32),
    commit : Proc(IDCompositionDevice2*, Win32cr::Foundation::HRESULT),
    wait_for_commit_completion : Proc(IDCompositionDevice2*, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDCompositionDevice2*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    create_visual : Proc(IDCompositionDevice2*, Void**, Win32cr::Foundation::HRESULT),
    create_surface_factory : Proc(IDCompositionDevice2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_surface : Proc(IDCompositionDevice2*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, Void**, Win32cr::Foundation::HRESULT),
    create_virtual_surface : Proc(IDCompositionDevice2*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, Void**, Win32cr::Foundation::HRESULT),
    create_translate_transform : Proc(IDCompositionDevice2*, Void**, Win32cr::Foundation::HRESULT),
    create_scale_transform : Proc(IDCompositionDevice2*, Void**, Win32cr::Foundation::HRESULT),
    create_rotate_transform : Proc(IDCompositionDevice2*, Void**, Win32cr::Foundation::HRESULT),
    create_skew_transform : Proc(IDCompositionDevice2*, Void**, Win32cr::Foundation::HRESULT),
    create_matrix_transform : Proc(IDCompositionDevice2*, Void**, Win32cr::Foundation::HRESULT),
    create_transform_group : Proc(IDCompositionDevice2*, Void**, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_translate_transform3_d : Proc(IDCompositionDevice2*, Void**, Win32cr::Foundation::HRESULT),
    create_scale_transform3_d : Proc(IDCompositionDevice2*, Void**, Win32cr::Foundation::HRESULT),
    create_rotate_transform3_d : Proc(IDCompositionDevice2*, Void**, Win32cr::Foundation::HRESULT),
    create_matrix_transform3_d : Proc(IDCompositionDevice2*, Void**, Win32cr::Foundation::HRESULT),
    create_transform3_d_group : Proc(IDCompositionDevice2*, Void**, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_effect_group : Proc(IDCompositionDevice2*, Void**, Win32cr::Foundation::HRESULT),
    create_rectangle_clip : Proc(IDCompositionDevice2*, Void**, Win32cr::Foundation::HRESULT),
    create_animation : Proc(IDCompositionDevice2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("75f6468d-1b8e-447c-9bc6-75fea80b5b25")]
  record IDCompositionDevice2, lpVtbl : IDCompositionDevice2Vtbl* do
    GUID = LibC::GUID.new(0x75f6468d_u32, 0x1b8e_u16, 0x447c_u16, StaticArray[0x9b_u8, 0xc6_u8, 0x75_u8, 0xfe_u8, 0xa8_u8, 0xb_u8, 0x5b_u8, 0x25_u8])
    def query_interface(this : IDCompositionDevice2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionDevice2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionDevice2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def commit(this : IDCompositionDevice2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def wait_for_commit_completion(this : IDCompositionDevice2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_commit_completion.call(this)
    end
    def get_frame_statistics(this : IDCompositionDevice2*, statistics : Win32cr::Graphics::DirectComposition::DCOMPOSITION_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, statistics)
    end
    def create_visual(this : IDCompositionDevice2*, visual : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_visual.call(this, visual)
    end
    def create_surface_factory(this : IDCompositionDevice2*, renderingDevice : Void*, surfaceFactory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface_factory.call(this, renderingDevice, surfaceFactory)
    end
    def create_surface(this : IDCompositionDevice2*, width : UInt32, height : UInt32, pixelFormat : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, alphaMode : Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, surface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface.call(this, width, height, pixelFormat, alphaMode, surface)
    end
    def create_virtual_surface(this : IDCompositionDevice2*, initialWidth : UInt32, initialHeight : UInt32, pixelFormat : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, alphaMode : Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, virtualSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_surface.call(this, initialWidth, initialHeight, pixelFormat, alphaMode, virtualSurface)
    end
    def create_translate_transform(this : IDCompositionDevice2*, translateTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_translate_transform.call(this, translateTransform)
    end
    def create_scale_transform(this : IDCompositionDevice2*, scaleTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_scale_transform.call(this, scaleTransform)
    end
    def create_rotate_transform(this : IDCompositionDevice2*, rotateTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rotate_transform.call(this, rotateTransform)
    end
    def create_skew_transform(this : IDCompositionDevice2*, skewTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_skew_transform.call(this, skewTransform)
    end
    def create_matrix_transform(this : IDCompositionDevice2*, matrixTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_matrix_transform.call(this, matrixTransform)
    end
    def create_transform_group(this : IDCompositionDevice2*, transforms : Void**, elements : UInt32, transformGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_transform_group.call(this, transforms, elements, transformGroup)
    end
    def create_translate_transform3_d(this : IDCompositionDevice2*, translateTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_translate_transform3_d.call(this, translateTransform3D)
    end
    def create_scale_transform3_d(this : IDCompositionDevice2*, scaleTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_scale_transform3_d.call(this, scaleTransform3D)
    end
    def create_rotate_transform3_d(this : IDCompositionDevice2*, rotateTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rotate_transform3_d.call(this, rotateTransform3D)
    end
    def create_matrix_transform3_d(this : IDCompositionDevice2*, matrixTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_matrix_transform3_d.call(this, matrixTransform3D)
    end
    def create_transform3_d_group(this : IDCompositionDevice2*, transforms3D : Void**, elements : UInt32, transform3DGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_transform3_d_group.call(this, transforms3D, elements, transform3DGroup)
    end
    def create_effect_group(this : IDCompositionDevice2*, effectGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_effect_group.call(this, effectGroup)
    end
    def create_rectangle_clip(this : IDCompositionDevice2*, clip : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rectangle_clip.call(this, clip)
    end
    def create_animation(this : IDCompositionDevice2*, animation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_animation.call(this, animation)
    end

  end

  @[Extern]
  record IDCompositionDesktopDeviceVtbl,
    query_interface : Proc(IDCompositionDesktopDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionDesktopDevice*, UInt32),
    release : Proc(IDCompositionDesktopDevice*, UInt32),
    commit : Proc(IDCompositionDesktopDevice*, Win32cr::Foundation::HRESULT),
    wait_for_commit_completion : Proc(IDCompositionDesktopDevice*, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDCompositionDesktopDevice*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    create_visual : Proc(IDCompositionDesktopDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_surface_factory : Proc(IDCompositionDesktopDevice*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_surface : Proc(IDCompositionDesktopDevice*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, Void**, Win32cr::Foundation::HRESULT),
    create_virtual_surface : Proc(IDCompositionDesktopDevice*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, Void**, Win32cr::Foundation::HRESULT),
    create_translate_transform : Proc(IDCompositionDesktopDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_scale_transform : Proc(IDCompositionDesktopDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_rotate_transform : Proc(IDCompositionDesktopDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_skew_transform : Proc(IDCompositionDesktopDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_matrix_transform : Proc(IDCompositionDesktopDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_transform_group : Proc(IDCompositionDesktopDevice*, Void**, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_translate_transform3_d : Proc(IDCompositionDesktopDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_scale_transform3_d : Proc(IDCompositionDesktopDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_rotate_transform3_d : Proc(IDCompositionDesktopDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_matrix_transform3_d : Proc(IDCompositionDesktopDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_transform3_d_group : Proc(IDCompositionDesktopDevice*, Void**, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_effect_group : Proc(IDCompositionDesktopDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_rectangle_clip : Proc(IDCompositionDesktopDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_animation : Proc(IDCompositionDesktopDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_target_for_hwnd : Proc(IDCompositionDesktopDevice*, Win32cr::Foundation::HWND, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    create_surface_from_handle : Proc(IDCompositionDesktopDevice*, Win32cr::Foundation::HANDLE, Void**, Win32cr::Foundation::HRESULT),
    create_surface_from_hwnd : Proc(IDCompositionDesktopDevice*, Win32cr::Foundation::HWND, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("5f4633fe-1e08-4cb8-8c75-ce24333f5602")]
  record IDCompositionDesktopDevice, lpVtbl : IDCompositionDesktopDeviceVtbl* do
    GUID = LibC::GUID.new(0x5f4633fe_u32, 0x1e08_u16, 0x4cb8_u16, StaticArray[0x8c_u8, 0x75_u8, 0xce_u8, 0x24_u8, 0x33_u8, 0x3f_u8, 0x56_u8, 0x2_u8])
    def query_interface(this : IDCompositionDesktopDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionDesktopDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionDesktopDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def commit(this : IDCompositionDesktopDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def wait_for_commit_completion(this : IDCompositionDesktopDevice*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_commit_completion.call(this)
    end
    def get_frame_statistics(this : IDCompositionDesktopDevice*, statistics : Win32cr::Graphics::DirectComposition::DCOMPOSITION_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, statistics)
    end
    def create_visual(this : IDCompositionDesktopDevice*, visual : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_visual.call(this, visual)
    end
    def create_surface_factory(this : IDCompositionDesktopDevice*, renderingDevice : Void*, surfaceFactory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface_factory.call(this, renderingDevice, surfaceFactory)
    end
    def create_surface(this : IDCompositionDesktopDevice*, width : UInt32, height : UInt32, pixelFormat : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, alphaMode : Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, surface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface.call(this, width, height, pixelFormat, alphaMode, surface)
    end
    def create_virtual_surface(this : IDCompositionDesktopDevice*, initialWidth : UInt32, initialHeight : UInt32, pixelFormat : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, alphaMode : Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, virtualSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_surface.call(this, initialWidth, initialHeight, pixelFormat, alphaMode, virtualSurface)
    end
    def create_translate_transform(this : IDCompositionDesktopDevice*, translateTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_translate_transform.call(this, translateTransform)
    end
    def create_scale_transform(this : IDCompositionDesktopDevice*, scaleTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_scale_transform.call(this, scaleTransform)
    end
    def create_rotate_transform(this : IDCompositionDesktopDevice*, rotateTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rotate_transform.call(this, rotateTransform)
    end
    def create_skew_transform(this : IDCompositionDesktopDevice*, skewTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_skew_transform.call(this, skewTransform)
    end
    def create_matrix_transform(this : IDCompositionDesktopDevice*, matrixTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_matrix_transform.call(this, matrixTransform)
    end
    def create_transform_group(this : IDCompositionDesktopDevice*, transforms : Void**, elements : UInt32, transformGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_transform_group.call(this, transforms, elements, transformGroup)
    end
    def create_translate_transform3_d(this : IDCompositionDesktopDevice*, translateTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_translate_transform3_d.call(this, translateTransform3D)
    end
    def create_scale_transform3_d(this : IDCompositionDesktopDevice*, scaleTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_scale_transform3_d.call(this, scaleTransform3D)
    end
    def create_rotate_transform3_d(this : IDCompositionDesktopDevice*, rotateTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rotate_transform3_d.call(this, rotateTransform3D)
    end
    def create_matrix_transform3_d(this : IDCompositionDesktopDevice*, matrixTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_matrix_transform3_d.call(this, matrixTransform3D)
    end
    def create_transform3_d_group(this : IDCompositionDesktopDevice*, transforms3D : Void**, elements : UInt32, transform3DGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_transform3_d_group.call(this, transforms3D, elements, transform3DGroup)
    end
    def create_effect_group(this : IDCompositionDesktopDevice*, effectGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_effect_group.call(this, effectGroup)
    end
    def create_rectangle_clip(this : IDCompositionDesktopDevice*, clip : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rectangle_clip.call(this, clip)
    end
    def create_animation(this : IDCompositionDesktopDevice*, animation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_animation.call(this, animation)
    end
    def create_target_for_hwnd(this : IDCompositionDesktopDevice*, hwnd : Win32cr::Foundation::HWND, topmost : Win32cr::Foundation::BOOL, target : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_target_for_hwnd.call(this, hwnd, topmost, target)
    end
    def create_surface_from_handle(this : IDCompositionDesktopDevice*, handle : Win32cr::Foundation::HANDLE, surface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface_from_handle.call(this, handle, surface)
    end
    def create_surface_from_hwnd(this : IDCompositionDesktopDevice*, hwnd : Win32cr::Foundation::HWND, surface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface_from_hwnd.call(this, hwnd, surface)
    end

  end

  @[Extern]
  record IDCompositionDeviceDebugVtbl,
    query_interface : Proc(IDCompositionDeviceDebug*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionDeviceDebug*, UInt32),
    release : Proc(IDCompositionDeviceDebug*, UInt32),
    enable_debug_counters : Proc(IDCompositionDeviceDebug*, Win32cr::Foundation::HRESULT),
    disable_debug_counters : Proc(IDCompositionDeviceDebug*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a1a3c64a-224f-4a81-9773-4f03a89d3c6c")]
  record IDCompositionDeviceDebug, lpVtbl : IDCompositionDeviceDebugVtbl* do
    GUID = LibC::GUID.new(0xa1a3c64a_u32, 0x224f_u16, 0x4a81_u16, StaticArray[0x97_u8, 0x73_u8, 0x4f_u8, 0x3_u8, 0xa8_u8, 0x9d_u8, 0x3c_u8, 0x6c_u8])
    def query_interface(this : IDCompositionDeviceDebug*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionDeviceDebug*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionDeviceDebug*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def enable_debug_counters(this : IDCompositionDeviceDebug*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_debug_counters.call(this)
    end
    def disable_debug_counters(this : IDCompositionDeviceDebug*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_debug_counters.call(this)
    end

  end

  @[Extern]
  record IDCompositionSurfaceFactoryVtbl,
    query_interface : Proc(IDCompositionSurfaceFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionSurfaceFactory*, UInt32),
    release : Proc(IDCompositionSurfaceFactory*, UInt32),
    create_surface : Proc(IDCompositionSurfaceFactory*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, Void**, Win32cr::Foundation::HRESULT),
    create_virtual_surface : Proc(IDCompositionSurfaceFactory*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e334bc12-3937-4e02-85eb-fcf4eb30d2c8")]
  record IDCompositionSurfaceFactory, lpVtbl : IDCompositionSurfaceFactoryVtbl* do
    GUID = LibC::GUID.new(0xe334bc12_u32, 0x3937_u16, 0x4e02_u16, StaticArray[0x85_u8, 0xeb_u8, 0xfc_u8, 0xf4_u8, 0xeb_u8, 0x30_u8, 0xd2_u8, 0xc8_u8])
    def query_interface(this : IDCompositionSurfaceFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionSurfaceFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionSurfaceFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_surface(this : IDCompositionSurfaceFactory*, width : UInt32, height : UInt32, pixelFormat : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, alphaMode : Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, surface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface.call(this, width, height, pixelFormat, alphaMode, surface)
    end
    def create_virtual_surface(this : IDCompositionSurfaceFactory*, initialWidth : UInt32, initialHeight : UInt32, pixelFormat : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, alphaMode : Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, virtualSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_surface.call(this, initialWidth, initialHeight, pixelFormat, alphaMode, virtualSurface)
    end

  end

  @[Extern]
  record IDCompositionVisual2Vtbl,
    query_interface : Proc(IDCompositionVisual2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionVisual2*, UInt32),
    release : Proc(IDCompositionVisual2*, UInt32),
    set_offset_x_1 : Proc(IDCompositionVisual2*, Void*, Win32cr::Foundation::HRESULT),
    set_offset_x_2 : Proc(IDCompositionVisual2*, Float32, Win32cr::Foundation::HRESULT),
    set_offset_y_1 : Proc(IDCompositionVisual2*, Void*, Win32cr::Foundation::HRESULT),
    set_offset_y_2 : Proc(IDCompositionVisual2*, Float32, Win32cr::Foundation::HRESULT),
    set_transform_1 : Proc(IDCompositionVisual2*, Void*, Win32cr::Foundation::HRESULT),
    set_transform_2_1 : Proc(IDCompositionVisual2*, Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_3X2_F*, Win32cr::Foundation::HRESULT),
    set_transform_parent : Proc(IDCompositionVisual2*, Void*, Win32cr::Foundation::HRESULT),
    set_effect : Proc(IDCompositionVisual2*, Void*, Win32cr::Foundation::HRESULT),
    set_bitmap_interpolation_mode : Proc(IDCompositionVisual2*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_BITMAP_INTERPOLATION_MODE, Win32cr::Foundation::HRESULT),
    set_border_mode : Proc(IDCompositionVisual2*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_BORDER_MODE, Win32cr::Foundation::HRESULT),
    set_clip_1 : Proc(IDCompositionVisual2*, Void*, Win32cr::Foundation::HRESULT),
    set_clip_2 : Proc(IDCompositionVisual2*, Win32cr::Graphics::Direct2D::Common::D2D_RECT_F*, Win32cr::Foundation::HRESULT),
    set_content : Proc(IDCompositionVisual2*, Void*, Win32cr::Foundation::HRESULT),
    add_visual : Proc(IDCompositionVisual2*, Void*, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    remove_visual : Proc(IDCompositionVisual2*, Void*, Win32cr::Foundation::HRESULT),
    remove_all_visuals : Proc(IDCompositionVisual2*, Win32cr::Foundation::HRESULT),
    set_composite_mode : Proc(IDCompositionVisual2*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_COMPOSITE_MODE, Win32cr::Foundation::HRESULT),
    set_opacity_mode : Proc(IDCompositionVisual2*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_OPACITY_MODE, Win32cr::Foundation::HRESULT),
    set_back_face_visibility : Proc(IDCompositionVisual2*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_BACKFACE_VISIBILITY, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("e8de1639-4331-4b26-bc5f-6a321d347a85")]
  record IDCompositionVisual2, lpVtbl : IDCompositionVisual2Vtbl* do
    GUID = LibC::GUID.new(0xe8de1639_u32, 0x4331_u16, 0x4b26_u16, StaticArray[0xbc_u8, 0x5f_u8, 0x6a_u8, 0x32_u8, 0x1d_u8, 0x34_u8, 0x7a_u8, 0x85_u8])
    def query_interface(this : IDCompositionVisual2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionVisual2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionVisual2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_offset_x_1(this : IDCompositionVisual2*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_x_1.call(this, animation)
    end
    def set_offset_x_2(this : IDCompositionVisual2*, offsetX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_x_2.call(this, offsetX)
    end
    def set_offset_y_1(this : IDCompositionVisual2*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_y_1.call(this, animation)
    end
    def set_offset_y_2(this : IDCompositionVisual2*, offsetY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_y_2.call(this, offsetY)
    end
    def set_transform_1(this : IDCompositionVisual2*, transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_1.call(this, transform)
    end
    def set_transform_2_1(this : IDCompositionVisual2*, matrix : Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_3X2_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_2_1.call(this, matrix)
    end
    def set_transform_parent(this : IDCompositionVisual2*, visual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_parent.call(this, visual)
    end
    def set_effect(this : IDCompositionVisual2*, effect : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effect.call(this, effect)
    end
    def set_bitmap_interpolation_mode(this : IDCompositionVisual2*, interpolationMode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_BITMAP_INTERPOLATION_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bitmap_interpolation_mode.call(this, interpolationMode)
    end
    def set_border_mode(this : IDCompositionVisual2*, borderMode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_BORDER_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_border_mode.call(this, borderMode)
    end
    def set_clip_1(this : IDCompositionVisual2*, clip : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_1.call(this, clip)
    end
    def set_clip_2(this : IDCompositionVisual2*, rect : Win32cr::Graphics::Direct2D::Common::D2D_RECT_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_2.call(this, rect)
    end
    def set_content(this : IDCompositionVisual2*, content : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content.call(this, content)
    end
    def add_visual(this : IDCompositionVisual2*, visual : Void*, insertAbove : Win32cr::Foundation::BOOL, referenceVisual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_visual.call(this, visual, insertAbove, referenceVisual)
    end
    def remove_visual(this : IDCompositionVisual2*, visual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_visual.call(this, visual)
    end
    def remove_all_visuals(this : IDCompositionVisual2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_visuals.call(this)
    end
    def set_composite_mode(this : IDCompositionVisual2*, compositeMode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_COMPOSITE_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composite_mode.call(this, compositeMode)
    end
    def set_opacity_mode(this : IDCompositionVisual2*, mode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_OPACITY_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_mode.call(this, mode)
    end
    def set_back_face_visibility(this : IDCompositionVisual2*, visibility : Win32cr::Graphics::DirectComposition::DCOMPOSITION_BACKFACE_VISIBILITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_back_face_visibility.call(this, visibility)
    end

  end

  @[Extern]
  record IDCompositionVisualDebugVtbl,
    query_interface : Proc(IDCompositionVisualDebug*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionVisualDebug*, UInt32),
    release : Proc(IDCompositionVisualDebug*, UInt32),
    set_offset_x_1 : Proc(IDCompositionVisualDebug*, Void*, Win32cr::Foundation::HRESULT),
    set_offset_x_2 : Proc(IDCompositionVisualDebug*, Float32, Win32cr::Foundation::HRESULT),
    set_offset_y_1 : Proc(IDCompositionVisualDebug*, Void*, Win32cr::Foundation::HRESULT),
    set_offset_y_2 : Proc(IDCompositionVisualDebug*, Float32, Win32cr::Foundation::HRESULT),
    set_transform_1 : Proc(IDCompositionVisualDebug*, Void*, Win32cr::Foundation::HRESULT),
    set_transform_2_1 : Proc(IDCompositionVisualDebug*, Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_3X2_F*, Win32cr::Foundation::HRESULT),
    set_transform_parent : Proc(IDCompositionVisualDebug*, Void*, Win32cr::Foundation::HRESULT),
    set_effect : Proc(IDCompositionVisualDebug*, Void*, Win32cr::Foundation::HRESULT),
    set_bitmap_interpolation_mode : Proc(IDCompositionVisualDebug*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_BITMAP_INTERPOLATION_MODE, Win32cr::Foundation::HRESULT),
    set_border_mode : Proc(IDCompositionVisualDebug*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_BORDER_MODE, Win32cr::Foundation::HRESULT),
    set_clip_1 : Proc(IDCompositionVisualDebug*, Void*, Win32cr::Foundation::HRESULT),
    set_clip_2 : Proc(IDCompositionVisualDebug*, Win32cr::Graphics::Direct2D::Common::D2D_RECT_F*, Win32cr::Foundation::HRESULT),
    set_content : Proc(IDCompositionVisualDebug*, Void*, Win32cr::Foundation::HRESULT),
    add_visual : Proc(IDCompositionVisualDebug*, Void*, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    remove_visual : Proc(IDCompositionVisualDebug*, Void*, Win32cr::Foundation::HRESULT),
    remove_all_visuals : Proc(IDCompositionVisualDebug*, Win32cr::Foundation::HRESULT),
    set_composite_mode : Proc(IDCompositionVisualDebug*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_COMPOSITE_MODE, Win32cr::Foundation::HRESULT),
    set_opacity_mode : Proc(IDCompositionVisualDebug*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_OPACITY_MODE, Win32cr::Foundation::HRESULT),
    set_back_face_visibility : Proc(IDCompositionVisualDebug*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_BACKFACE_VISIBILITY, Win32cr::Foundation::HRESULT),
    enable_heat_map : Proc(IDCompositionVisualDebug*, Win32cr::Graphics::Direct2D::Common::D2D1_COLOR_F*, Win32cr::Foundation::HRESULT),
    disable_heat_map : Proc(IDCompositionVisualDebug*, Win32cr::Foundation::HRESULT),
    enable_redraw_regions : Proc(IDCompositionVisualDebug*, Win32cr::Foundation::HRESULT),
    disable_redraw_regions : Proc(IDCompositionVisualDebug*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("fed2b808-5eb4-43a0-aea3-35f65280f91b")]
  record IDCompositionVisualDebug, lpVtbl : IDCompositionVisualDebugVtbl* do
    GUID = LibC::GUID.new(0xfed2b808_u32, 0x5eb4_u16, 0x43a0_u16, StaticArray[0xae_u8, 0xa3_u8, 0x35_u8, 0xf6_u8, 0x52_u8, 0x80_u8, 0xf9_u8, 0x1b_u8])
    def query_interface(this : IDCompositionVisualDebug*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionVisualDebug*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionVisualDebug*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_offset_x_1(this : IDCompositionVisualDebug*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_x_1.call(this, animation)
    end
    def set_offset_x_2(this : IDCompositionVisualDebug*, offsetX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_x_2.call(this, offsetX)
    end
    def set_offset_y_1(this : IDCompositionVisualDebug*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_y_1.call(this, animation)
    end
    def set_offset_y_2(this : IDCompositionVisualDebug*, offsetY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_y_2.call(this, offsetY)
    end
    def set_transform_1(this : IDCompositionVisualDebug*, transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_1.call(this, transform)
    end
    def set_transform_2_1(this : IDCompositionVisualDebug*, matrix : Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_3X2_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_2_1.call(this, matrix)
    end
    def set_transform_parent(this : IDCompositionVisualDebug*, visual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_parent.call(this, visual)
    end
    def set_effect(this : IDCompositionVisualDebug*, effect : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effect.call(this, effect)
    end
    def set_bitmap_interpolation_mode(this : IDCompositionVisualDebug*, interpolationMode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_BITMAP_INTERPOLATION_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bitmap_interpolation_mode.call(this, interpolationMode)
    end
    def set_border_mode(this : IDCompositionVisualDebug*, borderMode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_BORDER_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_border_mode.call(this, borderMode)
    end
    def set_clip_1(this : IDCompositionVisualDebug*, clip : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_1.call(this, clip)
    end
    def set_clip_2(this : IDCompositionVisualDebug*, rect : Win32cr::Graphics::Direct2D::Common::D2D_RECT_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_2.call(this, rect)
    end
    def set_content(this : IDCompositionVisualDebug*, content : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content.call(this, content)
    end
    def add_visual(this : IDCompositionVisualDebug*, visual : Void*, insertAbove : Win32cr::Foundation::BOOL, referenceVisual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_visual.call(this, visual, insertAbove, referenceVisual)
    end
    def remove_visual(this : IDCompositionVisualDebug*, visual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_visual.call(this, visual)
    end
    def remove_all_visuals(this : IDCompositionVisualDebug*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_visuals.call(this)
    end
    def set_composite_mode(this : IDCompositionVisualDebug*, compositeMode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_COMPOSITE_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composite_mode.call(this, compositeMode)
    end
    def set_opacity_mode(this : IDCompositionVisualDebug*, mode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_OPACITY_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_mode.call(this, mode)
    end
    def set_back_face_visibility(this : IDCompositionVisualDebug*, visibility : Win32cr::Graphics::DirectComposition::DCOMPOSITION_BACKFACE_VISIBILITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_back_face_visibility.call(this, visibility)
    end
    def enable_heat_map(this : IDCompositionVisualDebug*, color : Win32cr::Graphics::Direct2D::Common::D2D1_COLOR_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_heat_map.call(this, color)
    end
    def disable_heat_map(this : IDCompositionVisualDebug*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_heat_map.call(this)
    end
    def enable_redraw_regions(this : IDCompositionVisualDebug*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_redraw_regions.call(this)
    end
    def disable_redraw_regions(this : IDCompositionVisualDebug*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_redraw_regions.call(this)
    end

  end

  @[Extern]
  record IDCompositionVisual3Vtbl,
    query_interface : Proc(IDCompositionVisual3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionVisual3*, UInt32),
    release : Proc(IDCompositionVisual3*, UInt32),
    set_offset_x_1 : Proc(IDCompositionVisual3*, Void*, Win32cr::Foundation::HRESULT),
    set_offset_x_2 : Proc(IDCompositionVisual3*, Float32, Win32cr::Foundation::HRESULT),
    set_offset_y_1 : Proc(IDCompositionVisual3*, Void*, Win32cr::Foundation::HRESULT),
    set_offset_y_2 : Proc(IDCompositionVisual3*, Float32, Win32cr::Foundation::HRESULT),
    set_transform_1_1 : Proc(IDCompositionVisual3*, Void*, Win32cr::Foundation::HRESULT),
    set_transform_2_1 : Proc(IDCompositionVisual3*, Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_3X2_F*, Win32cr::Foundation::HRESULT),
    set_transform_parent : Proc(IDCompositionVisual3*, Void*, Win32cr::Foundation::HRESULT),
    set_effect : Proc(IDCompositionVisual3*, Void*, Win32cr::Foundation::HRESULT),
    set_bitmap_interpolation_mode : Proc(IDCompositionVisual3*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_BITMAP_INTERPOLATION_MODE, Win32cr::Foundation::HRESULT),
    set_border_mode : Proc(IDCompositionVisual3*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_BORDER_MODE, Win32cr::Foundation::HRESULT),
    set_clip_1 : Proc(IDCompositionVisual3*, Void*, Win32cr::Foundation::HRESULT),
    set_clip_2 : Proc(IDCompositionVisual3*, Win32cr::Graphics::Direct2D::Common::D2D_RECT_F*, Win32cr::Foundation::HRESULT),
    set_content : Proc(IDCompositionVisual3*, Void*, Win32cr::Foundation::HRESULT),
    add_visual : Proc(IDCompositionVisual3*, Void*, Win32cr::Foundation::BOOL, Void*, Win32cr::Foundation::HRESULT),
    remove_visual : Proc(IDCompositionVisual3*, Void*, Win32cr::Foundation::HRESULT),
    remove_all_visuals : Proc(IDCompositionVisual3*, Win32cr::Foundation::HRESULT),
    set_composite_mode : Proc(IDCompositionVisual3*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_COMPOSITE_MODE, Win32cr::Foundation::HRESULT),
    set_opacity_mode : Proc(IDCompositionVisual3*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_OPACITY_MODE, Win32cr::Foundation::HRESULT),
    set_back_face_visibility : Proc(IDCompositionVisual3*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_BACKFACE_VISIBILITY, Win32cr::Foundation::HRESULT),
    enable_heat_map : Proc(IDCompositionVisual3*, Win32cr::Graphics::Direct2D::Common::D2D1_COLOR_F*, Win32cr::Foundation::HRESULT),
    disable_heat_map : Proc(IDCompositionVisual3*, Win32cr::Foundation::HRESULT),
    enable_redraw_regions : Proc(IDCompositionVisual3*, Win32cr::Foundation::HRESULT),
    disable_redraw_regions : Proc(IDCompositionVisual3*, Win32cr::Foundation::HRESULT),
    set_depth_mode : Proc(IDCompositionVisual3*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_DEPTH_MODE, Win32cr::Foundation::HRESULT),
    set_offset_z_1 : Proc(IDCompositionVisual3*, Void*, Win32cr::Foundation::HRESULT),
    set_offset_z_2 : Proc(IDCompositionVisual3*, Float32, Win32cr::Foundation::HRESULT),
    set_opacity_1 : Proc(IDCompositionVisual3*, Void*, Win32cr::Foundation::HRESULT),
    set_opacity_2 : Proc(IDCompositionVisual3*, Float32, Win32cr::Foundation::HRESULT),
    set_transform_1_2 : Proc(IDCompositionVisual3*, Void*, Win32cr::Foundation::HRESULT),
    set_transform_2_2 : Proc(IDCompositionVisual3*, Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_4X4_F*, Win32cr::Foundation::HRESULT),
    set_visible : Proc(IDCompositionVisual3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("2775f462-b6c1-4015-b0be-b3e7d6a4976d")]
  record IDCompositionVisual3, lpVtbl : IDCompositionVisual3Vtbl* do
    GUID = LibC::GUID.new(0x2775f462_u32, 0xb6c1_u16, 0x4015_u16, StaticArray[0xb0_u8, 0xbe_u8, 0xb3_u8, 0xe7_u8, 0xd6_u8, 0xa4_u8, 0x97_u8, 0x6d_u8])
    def query_interface(this : IDCompositionVisual3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionVisual3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionVisual3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_offset_x_1(this : IDCompositionVisual3*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_x_1.call(this, animation)
    end
    def set_offset_x_2(this : IDCompositionVisual3*, offsetX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_x_2.call(this, offsetX)
    end
    def set_offset_y_1(this : IDCompositionVisual3*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_y_1.call(this, animation)
    end
    def set_offset_y_2(this : IDCompositionVisual3*, offsetY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_y_2.call(this, offsetY)
    end
    def set_transform_1_1(this : IDCompositionVisual3*, transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_1_1.call(this, transform)
    end
    def set_transform_2_1(this : IDCompositionVisual3*, matrix : Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_3X2_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_2_1.call(this, matrix)
    end
    def set_transform_parent(this : IDCompositionVisual3*, visual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_parent.call(this, visual)
    end
    def set_effect(this : IDCompositionVisual3*, effect : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_effect.call(this, effect)
    end
    def set_bitmap_interpolation_mode(this : IDCompositionVisual3*, interpolationMode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_BITMAP_INTERPOLATION_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_bitmap_interpolation_mode.call(this, interpolationMode)
    end
    def set_border_mode(this : IDCompositionVisual3*, borderMode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_BORDER_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_border_mode.call(this, borderMode)
    end
    def set_clip_1(this : IDCompositionVisual3*, clip : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_1.call(this, clip)
    end
    def set_clip_2(this : IDCompositionVisual3*, rect : Win32cr::Graphics::Direct2D::Common::D2D_RECT_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clip_2.call(this, rect)
    end
    def set_content(this : IDCompositionVisual3*, content : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_content.call(this, content)
    end
    def add_visual(this : IDCompositionVisual3*, visual : Void*, insertAbove : Win32cr::Foundation::BOOL, referenceVisual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_visual.call(this, visual, insertAbove, referenceVisual)
    end
    def remove_visual(this : IDCompositionVisual3*, visual : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_visual.call(this, visual)
    end
    def remove_all_visuals(this : IDCompositionVisual3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_visuals.call(this)
    end
    def set_composite_mode(this : IDCompositionVisual3*, compositeMode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_COMPOSITE_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_composite_mode.call(this, compositeMode)
    end
    def set_opacity_mode(this : IDCompositionVisual3*, mode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_OPACITY_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_mode.call(this, mode)
    end
    def set_back_face_visibility(this : IDCompositionVisual3*, visibility : Win32cr::Graphics::DirectComposition::DCOMPOSITION_BACKFACE_VISIBILITY) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_back_face_visibility.call(this, visibility)
    end
    def enable_heat_map(this : IDCompositionVisual3*, color : Win32cr::Graphics::Direct2D::Common::D2D1_COLOR_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_heat_map.call(this, color)
    end
    def disable_heat_map(this : IDCompositionVisual3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_heat_map.call(this)
    end
    def enable_redraw_regions(this : IDCompositionVisual3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_redraw_regions.call(this)
    end
    def disable_redraw_regions(this : IDCompositionVisual3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.disable_redraw_regions.call(this)
    end
    def set_depth_mode(this : IDCompositionVisual3*, mode : Win32cr::Graphics::DirectComposition::DCOMPOSITION_DEPTH_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_depth_mode.call(this, mode)
    end
    def set_offset_z_1(this : IDCompositionVisual3*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_z_1.call(this, animation)
    end
    def set_offset_z_2(this : IDCompositionVisual3*, offsetZ : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset_z_2.call(this, offsetZ)
    end
    def set_opacity_1(this : IDCompositionVisual3*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_1.call(this, animation)
    end
    def set_opacity_2(this : IDCompositionVisual3*, opacity : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_opacity_2.call(this, opacity)
    end
    def set_transform_1_2(this : IDCompositionVisual3*, transform : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_1_2.call(this, transform)
    end
    def set_transform_2_2(this : IDCompositionVisual3*, matrix : Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_4X4_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_2_2.call(this, matrix)
    end
    def set_visible(this : IDCompositionVisual3*, visible : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_visible.call(this, visible)
    end

  end

  @[Extern]
  record IDCompositionDevice3Vtbl,
    query_interface : Proc(IDCompositionDevice3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionDevice3*, UInt32),
    release : Proc(IDCompositionDevice3*, UInt32),
    commit : Proc(IDCompositionDevice3*, Win32cr::Foundation::HRESULT),
    wait_for_commit_completion : Proc(IDCompositionDevice3*, Win32cr::Foundation::HRESULT),
    get_frame_statistics : Proc(IDCompositionDevice3*, Win32cr::Graphics::DirectComposition::DCOMPOSITION_FRAME_STATISTICS*, Win32cr::Foundation::HRESULT),
    create_visual : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_surface_factory : Proc(IDCompositionDevice3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_surface : Proc(IDCompositionDevice3*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, Void**, Win32cr::Foundation::HRESULT),
    create_virtual_surface : Proc(IDCompositionDevice3*, UInt32, UInt32, Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, Void**, Win32cr::Foundation::HRESULT),
    create_translate_transform : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_scale_transform : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_rotate_transform : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_skew_transform : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_matrix_transform : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_transform_group : Proc(IDCompositionDevice3*, Void**, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_translate_transform3_d : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_scale_transform3_d : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_rotate_transform3_d : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_matrix_transform3_d : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_transform3_d_group : Proc(IDCompositionDevice3*, Void**, UInt32, Void**, Win32cr::Foundation::HRESULT),
    create_effect_group : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_rectangle_clip : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_animation : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_gaussian_blur_effect : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_brightness_effect : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_color_matrix_effect : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_shadow_effect : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_hue_rotation_effect : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_saturation_effect : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_turbulence_effect : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_linear_transfer_effect : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_table_transfer_effect : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_composite_effect : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_blend_effect : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_arithmetic_composite_effect : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT),
    create_affine_transform2_d_effect : Proc(IDCompositionDevice3*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0987cb06-f916-48bf-8d35-ce7641781bd9")]
  record IDCompositionDevice3, lpVtbl : IDCompositionDevice3Vtbl* do
    GUID = LibC::GUID.new(0x987cb06_u32, 0xf916_u16, 0x48bf_u16, StaticArray[0x8d_u8, 0x35_u8, 0xce_u8, 0x76_u8, 0x41_u8, 0x78_u8, 0x1b_u8, 0xd9_u8])
    def query_interface(this : IDCompositionDevice3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionDevice3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionDevice3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def commit(this : IDCompositionDevice3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit.call(this)
    end
    def wait_for_commit_completion(this : IDCompositionDevice3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_commit_completion.call(this)
    end
    def get_frame_statistics(this : IDCompositionDevice3*, statistics : Win32cr::Graphics::DirectComposition::DCOMPOSITION_FRAME_STATISTICS*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_frame_statistics.call(this, statistics)
    end
    def create_visual(this : IDCompositionDevice3*, visual : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_visual.call(this, visual)
    end
    def create_surface_factory(this : IDCompositionDevice3*, renderingDevice : Void*, surfaceFactory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface_factory.call(this, renderingDevice, surfaceFactory)
    end
    def create_surface(this : IDCompositionDevice3*, width : UInt32, height : UInt32, pixelFormat : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, alphaMode : Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, surface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_surface.call(this, width, height, pixelFormat, alphaMode, surface)
    end
    def create_virtual_surface(this : IDCompositionDevice3*, initialWidth : UInt32, initialHeight : UInt32, pixelFormat : Win32cr::Graphics::Dxgi::Common::DXGI_FORMAT, alphaMode : Win32cr::Graphics::Dxgi::Common::DXGI_ALPHA_MODE, virtualSurface : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_virtual_surface.call(this, initialWidth, initialHeight, pixelFormat, alphaMode, virtualSurface)
    end
    def create_translate_transform(this : IDCompositionDevice3*, translateTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_translate_transform.call(this, translateTransform)
    end
    def create_scale_transform(this : IDCompositionDevice3*, scaleTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_scale_transform.call(this, scaleTransform)
    end
    def create_rotate_transform(this : IDCompositionDevice3*, rotateTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rotate_transform.call(this, rotateTransform)
    end
    def create_skew_transform(this : IDCompositionDevice3*, skewTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_skew_transform.call(this, skewTransform)
    end
    def create_matrix_transform(this : IDCompositionDevice3*, matrixTransform : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_matrix_transform.call(this, matrixTransform)
    end
    def create_transform_group(this : IDCompositionDevice3*, transforms : Void**, elements : UInt32, transformGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_transform_group.call(this, transforms, elements, transformGroup)
    end
    def create_translate_transform3_d(this : IDCompositionDevice3*, translateTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_translate_transform3_d.call(this, translateTransform3D)
    end
    def create_scale_transform3_d(this : IDCompositionDevice3*, scaleTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_scale_transform3_d.call(this, scaleTransform3D)
    end
    def create_rotate_transform3_d(this : IDCompositionDevice3*, rotateTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rotate_transform3_d.call(this, rotateTransform3D)
    end
    def create_matrix_transform3_d(this : IDCompositionDevice3*, matrixTransform3D : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_matrix_transform3_d.call(this, matrixTransform3D)
    end
    def create_transform3_d_group(this : IDCompositionDevice3*, transforms3D : Void**, elements : UInt32, transform3DGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_transform3_d_group.call(this, transforms3D, elements, transform3DGroup)
    end
    def create_effect_group(this : IDCompositionDevice3*, effectGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_effect_group.call(this, effectGroup)
    end
    def create_rectangle_clip(this : IDCompositionDevice3*, clip : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_rectangle_clip.call(this, clip)
    end
    def create_animation(this : IDCompositionDevice3*, animation : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_animation.call(this, animation)
    end
    def create_gaussian_blur_effect(this : IDCompositionDevice3*, gaussianBlurEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_gaussian_blur_effect.call(this, gaussianBlurEffect)
    end
    def create_brightness_effect(this : IDCompositionDevice3*, brightnessEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_brightness_effect.call(this, brightnessEffect)
    end
    def create_color_matrix_effect(this : IDCompositionDevice3*, colorMatrixEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_color_matrix_effect.call(this, colorMatrixEffect)
    end
    def create_shadow_effect(this : IDCompositionDevice3*, shadowEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_shadow_effect.call(this, shadowEffect)
    end
    def create_hue_rotation_effect(this : IDCompositionDevice3*, hueRotationEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_hue_rotation_effect.call(this, hueRotationEffect)
    end
    def create_saturation_effect(this : IDCompositionDevice3*, saturationEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_saturation_effect.call(this, saturationEffect)
    end
    def create_turbulence_effect(this : IDCompositionDevice3*, turbulenceEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_turbulence_effect.call(this, turbulenceEffect)
    end
    def create_linear_transfer_effect(this : IDCompositionDevice3*, linearTransferEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_linear_transfer_effect.call(this, linearTransferEffect)
    end
    def create_table_transfer_effect(this : IDCompositionDevice3*, tableTransferEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_table_transfer_effect.call(this, tableTransferEffect)
    end
    def create_composite_effect(this : IDCompositionDevice3*, compositeEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_composite_effect.call(this, compositeEffect)
    end
    def create_blend_effect(this : IDCompositionDevice3*, blendEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_blend_effect.call(this, blendEffect)
    end
    def create_arithmetic_composite_effect(this : IDCompositionDevice3*, arithmeticCompositeEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_arithmetic_composite_effect.call(this, arithmeticCompositeEffect)
    end
    def create_affine_transform2_d_effect(this : IDCompositionDevice3*, affineTransform2dEffect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_affine_transform2_d_effect.call(this, affineTransform2dEffect)
    end

  end

  @[Extern]
  record IDCompositionFilterEffectVtbl,
    query_interface : Proc(IDCompositionFilterEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionFilterEffect*, UInt32),
    release : Proc(IDCompositionFilterEffect*, UInt32),
    set_input : Proc(IDCompositionFilterEffect*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("30c421d5-8cb2-4e9f-b133-37be270d4ac2")]
  record IDCompositionFilterEffect, lpVtbl : IDCompositionFilterEffectVtbl* do
    GUID = LibC::GUID.new(0x30c421d5_u32, 0x8cb2_u16, 0x4e9f_u16, StaticArray[0xb1_u8, 0x33_u8, 0x37_u8, 0xbe_u8, 0x27_u8, 0xd_u8, 0x4a_u8, 0xc2_u8])
    def query_interface(this : IDCompositionFilterEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionFilterEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionFilterEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IDCompositionFilterEffect*, index : UInt32, input : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, index, input, flags)
    end

  end

  @[Extern]
  record IDCompositionGaussianBlurEffectVtbl,
    query_interface : Proc(IDCompositionGaussianBlurEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionGaussianBlurEffect*, UInt32),
    release : Proc(IDCompositionGaussianBlurEffect*, UInt32),
    set_input : Proc(IDCompositionGaussianBlurEffect*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_standard_deviation_1 : Proc(IDCompositionGaussianBlurEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_standard_deviation_2 : Proc(IDCompositionGaussianBlurEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_border_mode : Proc(IDCompositionGaussianBlurEffect*, Win32cr::Graphics::Direct2D::Common::D2D1_BORDER_MODE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("45d4d0b7-1bd4-454e-8894-2bfa68443033")]
  record IDCompositionGaussianBlurEffect, lpVtbl : IDCompositionGaussianBlurEffectVtbl* do
    GUID = LibC::GUID.new(0x45d4d0b7_u32, 0x1bd4_u16, 0x454e_u16, StaticArray[0x88_u8, 0x94_u8, 0x2b_u8, 0xfa_u8, 0x68_u8, 0x44_u8, 0x30_u8, 0x33_u8])
    def query_interface(this : IDCompositionGaussianBlurEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionGaussianBlurEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionGaussianBlurEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IDCompositionGaussianBlurEffect*, index : UInt32, input : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, index, input, flags)
    end
    def set_standard_deviation_1(this : IDCompositionGaussianBlurEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_standard_deviation_1.call(this, animation)
    end
    def set_standard_deviation_2(this : IDCompositionGaussianBlurEffect*, amount : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_standard_deviation_2.call(this, amount)
    end
    def set_border_mode(this : IDCompositionGaussianBlurEffect*, mode : Win32cr::Graphics::Direct2D::Common::D2D1_BORDER_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_border_mode.call(this, mode)
    end

  end

  @[Extern]
  record IDCompositionBrightnessEffectVtbl,
    query_interface : Proc(IDCompositionBrightnessEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionBrightnessEffect*, UInt32),
    release : Proc(IDCompositionBrightnessEffect*, UInt32),
    set_input : Proc(IDCompositionBrightnessEffect*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_white_point : Proc(IDCompositionBrightnessEffect*, Win32cr::Graphics::Direct2D::Common::D2D_VECTOR_2F*, Win32cr::Foundation::HRESULT),
    set_black_point : Proc(IDCompositionBrightnessEffect*, Win32cr::Graphics::Direct2D::Common::D2D_VECTOR_2F*, Win32cr::Foundation::HRESULT),
    set_white_point_x_1 : Proc(IDCompositionBrightnessEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_white_point_x_2 : Proc(IDCompositionBrightnessEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_white_point_y_1 : Proc(IDCompositionBrightnessEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_white_point_y_2 : Proc(IDCompositionBrightnessEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_black_point_x_1 : Proc(IDCompositionBrightnessEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_black_point_x_2 : Proc(IDCompositionBrightnessEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_black_point_y_1 : Proc(IDCompositionBrightnessEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_black_point_y_2 : Proc(IDCompositionBrightnessEffect*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6027496e-cb3a-49ab-934f-d798da4f7da6")]
  record IDCompositionBrightnessEffect, lpVtbl : IDCompositionBrightnessEffectVtbl* do
    GUID = LibC::GUID.new(0x6027496e_u32, 0xcb3a_u16, 0x49ab_u16, StaticArray[0x93_u8, 0x4f_u8, 0xd7_u8, 0x98_u8, 0xda_u8, 0x4f_u8, 0x7d_u8, 0xa6_u8])
    def query_interface(this : IDCompositionBrightnessEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionBrightnessEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionBrightnessEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IDCompositionBrightnessEffect*, index : UInt32, input : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, index, input, flags)
    end
    def set_white_point(this : IDCompositionBrightnessEffect*, whitePoint : Win32cr::Graphics::Direct2D::Common::D2D_VECTOR_2F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_white_point.call(this, whitePoint)
    end
    def set_black_point(this : IDCompositionBrightnessEffect*, blackPoint : Win32cr::Graphics::Direct2D::Common::D2D_VECTOR_2F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_black_point.call(this, blackPoint)
    end
    def set_white_point_x_1(this : IDCompositionBrightnessEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_white_point_x_1.call(this, animation)
    end
    def set_white_point_x_2(this : IDCompositionBrightnessEffect*, whitePointX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_white_point_x_2.call(this, whitePointX)
    end
    def set_white_point_y_1(this : IDCompositionBrightnessEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_white_point_y_1.call(this, animation)
    end
    def set_white_point_y_2(this : IDCompositionBrightnessEffect*, whitePointY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_white_point_y_2.call(this, whitePointY)
    end
    def set_black_point_x_1(this : IDCompositionBrightnessEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_black_point_x_1.call(this, animation)
    end
    def set_black_point_x_2(this : IDCompositionBrightnessEffect*, blackPointX : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_black_point_x_2.call(this, blackPointX)
    end
    def set_black_point_y_1(this : IDCompositionBrightnessEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_black_point_y_1.call(this, animation)
    end
    def set_black_point_y_2(this : IDCompositionBrightnessEffect*, blackPointY : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_black_point_y_2.call(this, blackPointY)
    end

  end

  @[Extern]
  record IDCompositionColorMatrixEffectVtbl,
    query_interface : Proc(IDCompositionColorMatrixEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionColorMatrixEffect*, UInt32),
    release : Proc(IDCompositionColorMatrixEffect*, UInt32),
    set_input : Proc(IDCompositionColorMatrixEffect*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_matrix : Proc(IDCompositionColorMatrixEffect*, Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_5X4_F*, Win32cr::Foundation::HRESULT),
    set_matrix_element_1 : Proc(IDCompositionColorMatrixEffect*, Int32, Int32, Void*, Win32cr::Foundation::HRESULT),
    set_matrix_element_2 : Proc(IDCompositionColorMatrixEffect*, Int32, Int32, Float32, Win32cr::Foundation::HRESULT),
    set_alpha_mode : Proc(IDCompositionColorMatrixEffect*, Win32cr::Graphics::Direct2D::Common::D2D1_COLORMATRIX_ALPHA_MODE, Win32cr::Foundation::HRESULT),
    set_clamp_output : Proc(IDCompositionColorMatrixEffect*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c1170a22-3ce2-4966-90d4-55408bfc84c4")]
  record IDCompositionColorMatrixEffect, lpVtbl : IDCompositionColorMatrixEffectVtbl* do
    GUID = LibC::GUID.new(0xc1170a22_u32, 0x3ce2_u16, 0x4966_u16, StaticArray[0x90_u8, 0xd4_u8, 0x55_u8, 0x40_u8, 0x8b_u8, 0xfc_u8, 0x84_u8, 0xc4_u8])
    def query_interface(this : IDCompositionColorMatrixEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionColorMatrixEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionColorMatrixEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IDCompositionColorMatrixEffect*, index : UInt32, input : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, index, input, flags)
    end
    def set_matrix(this : IDCompositionColorMatrixEffect*, matrix : Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_5X4_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_matrix.call(this, matrix)
    end
    def set_matrix_element_1(this : IDCompositionColorMatrixEffect*, row : Int32, column : Int32, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_matrix_element_1.call(this, row, column, animation)
    end
    def set_matrix_element_2(this : IDCompositionColorMatrixEffect*, row : Int32, column : Int32, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_matrix_element_2.call(this, row, column, value)
    end
    def set_alpha_mode(this : IDCompositionColorMatrixEffect*, mode : Win32cr::Graphics::Direct2D::Common::D2D1_COLORMATRIX_ALPHA_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alpha_mode.call(this, mode)
    end
    def set_clamp_output(this : IDCompositionColorMatrixEffect*, clamp : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clamp_output.call(this, clamp)
    end

  end

  @[Extern]
  record IDCompositionShadowEffectVtbl,
    query_interface : Proc(IDCompositionShadowEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionShadowEffect*, UInt32),
    release : Proc(IDCompositionShadowEffect*, UInt32),
    set_input : Proc(IDCompositionShadowEffect*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_standard_deviation_1 : Proc(IDCompositionShadowEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_standard_deviation_2 : Proc(IDCompositionShadowEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_color : Proc(IDCompositionShadowEffect*, Win32cr::Graphics::Direct2D::Common::D2D_VECTOR_4F*, Win32cr::Foundation::HRESULT),
    set_red_1 : Proc(IDCompositionShadowEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_red_2 : Proc(IDCompositionShadowEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_green_1 : Proc(IDCompositionShadowEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_green_2 : Proc(IDCompositionShadowEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_blue_1 : Proc(IDCompositionShadowEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_blue_2 : Proc(IDCompositionShadowEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_alpha_1 : Proc(IDCompositionShadowEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_alpha_2 : Proc(IDCompositionShadowEffect*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4ad18ac0-cfd2-4c2f-bb62-96e54fdb6879")]
  record IDCompositionShadowEffect, lpVtbl : IDCompositionShadowEffectVtbl* do
    GUID = LibC::GUID.new(0x4ad18ac0_u32, 0xcfd2_u16, 0x4c2f_u16, StaticArray[0xbb_u8, 0x62_u8, 0x96_u8, 0xe5_u8, 0x4f_u8, 0xdb_u8, 0x68_u8, 0x79_u8])
    def query_interface(this : IDCompositionShadowEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionShadowEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionShadowEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IDCompositionShadowEffect*, index : UInt32, input : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, index, input, flags)
    end
    def set_standard_deviation_1(this : IDCompositionShadowEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_standard_deviation_1.call(this, animation)
    end
    def set_standard_deviation_2(this : IDCompositionShadowEffect*, amount : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_standard_deviation_2.call(this, amount)
    end
    def set_color(this : IDCompositionShadowEffect*, color : Win32cr::Graphics::Direct2D::Common::D2D_VECTOR_4F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_color.call(this, color)
    end
    def set_red_1(this : IDCompositionShadowEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_red_1.call(this, animation)
    end
    def set_red_2(this : IDCompositionShadowEffect*, amount : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_red_2.call(this, amount)
    end
    def set_green_1(this : IDCompositionShadowEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_green_1.call(this, animation)
    end
    def set_green_2(this : IDCompositionShadowEffect*, amount : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_green_2.call(this, amount)
    end
    def set_blue_1(this : IDCompositionShadowEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_blue_1.call(this, animation)
    end
    def set_blue_2(this : IDCompositionShadowEffect*, amount : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_blue_2.call(this, amount)
    end
    def set_alpha_1(this : IDCompositionShadowEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alpha_1.call(this, animation)
    end
    def set_alpha_2(this : IDCompositionShadowEffect*, amount : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alpha_2.call(this, amount)
    end

  end

  @[Extern]
  record IDCompositionHueRotationEffectVtbl,
    query_interface : Proc(IDCompositionHueRotationEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionHueRotationEffect*, UInt32),
    release : Proc(IDCompositionHueRotationEffect*, UInt32),
    set_input : Proc(IDCompositionHueRotationEffect*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_angle_1 : Proc(IDCompositionHueRotationEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_angle_2 : Proc(IDCompositionHueRotationEffect*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("6db9f920-0770-4781-b0c6-381912f9d167")]
  record IDCompositionHueRotationEffect, lpVtbl : IDCompositionHueRotationEffectVtbl* do
    GUID = LibC::GUID.new(0x6db9f920_u32, 0x770_u16, 0x4781_u16, StaticArray[0xb0_u8, 0xc6_u8, 0x38_u8, 0x19_u8, 0x12_u8, 0xf9_u8, 0xd1_u8, 0x67_u8])
    def query_interface(this : IDCompositionHueRotationEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionHueRotationEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionHueRotationEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IDCompositionHueRotationEffect*, index : UInt32, input : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, index, input, flags)
    end
    def set_angle_1(this : IDCompositionHueRotationEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_angle_1.call(this, animation)
    end
    def set_angle_2(this : IDCompositionHueRotationEffect*, amountDegrees : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_angle_2.call(this, amountDegrees)
    end

  end

  @[Extern]
  record IDCompositionSaturationEffectVtbl,
    query_interface : Proc(IDCompositionSaturationEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionSaturationEffect*, UInt32),
    release : Proc(IDCompositionSaturationEffect*, UInt32),
    set_input : Proc(IDCompositionSaturationEffect*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_saturation_1 : Proc(IDCompositionSaturationEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_saturation_2 : Proc(IDCompositionSaturationEffect*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a08debda-3258-4fa4-9f16-9174d3fe93b1")]
  record IDCompositionSaturationEffect, lpVtbl : IDCompositionSaturationEffectVtbl* do
    GUID = LibC::GUID.new(0xa08debda_u32, 0x3258_u16, 0x4fa4_u16, StaticArray[0x9f_u8, 0x16_u8, 0x91_u8, 0x74_u8, 0xd3_u8, 0xfe_u8, 0x93_u8, 0xb1_u8])
    def query_interface(this : IDCompositionSaturationEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionSaturationEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionSaturationEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IDCompositionSaturationEffect*, index : UInt32, input : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, index, input, flags)
    end
    def set_saturation_1(this : IDCompositionSaturationEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_saturation_1.call(this, animation)
    end
    def set_saturation_2(this : IDCompositionSaturationEffect*, ratio : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_saturation_2.call(this, ratio)
    end

  end

  @[Extern]
  record IDCompositionTurbulenceEffectVtbl,
    query_interface : Proc(IDCompositionTurbulenceEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionTurbulenceEffect*, UInt32),
    release : Proc(IDCompositionTurbulenceEffect*, UInt32),
    set_input : Proc(IDCompositionTurbulenceEffect*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_offset : Proc(IDCompositionTurbulenceEffect*, Win32cr::Graphics::Direct2D::Common::D2D_VECTOR_2F*, Win32cr::Foundation::HRESULT),
    set_base_frequency : Proc(IDCompositionTurbulenceEffect*, Win32cr::Graphics::Direct2D::Common::D2D_VECTOR_2F*, Win32cr::Foundation::HRESULT),
    set_size : Proc(IDCompositionTurbulenceEffect*, Win32cr::Graphics::Direct2D::Common::D2D_VECTOR_2F*, Win32cr::Foundation::HRESULT),
    set_num_octaves : Proc(IDCompositionTurbulenceEffect*, UInt32, Win32cr::Foundation::HRESULT),
    set_seed : Proc(IDCompositionTurbulenceEffect*, UInt32, Win32cr::Foundation::HRESULT),
    set_noise : Proc(IDCompositionTurbulenceEffect*, Win32cr::Graphics::Direct2D::Common::D2D1_TURBULENCE_NOISE, Win32cr::Foundation::HRESULT),
    set_stitchable : Proc(IDCompositionTurbulenceEffect*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("a6a55bda-c09c-49f3-9193-a41922c89715")]
  record IDCompositionTurbulenceEffect, lpVtbl : IDCompositionTurbulenceEffectVtbl* do
    GUID = LibC::GUID.new(0xa6a55bda_u32, 0xc09c_u16, 0x49f3_u16, StaticArray[0x91_u8, 0x93_u8, 0xa4_u8, 0x19_u8, 0x22_u8, 0xc8_u8, 0x97_u8, 0x15_u8])
    def query_interface(this : IDCompositionTurbulenceEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionTurbulenceEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionTurbulenceEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IDCompositionTurbulenceEffect*, index : UInt32, input : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, index, input, flags)
    end
    def set_offset(this : IDCompositionTurbulenceEffect*, offset : Win32cr::Graphics::Direct2D::Common::D2D_VECTOR_2F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_offset.call(this, offset)
    end
    def set_base_frequency(this : IDCompositionTurbulenceEffect*, frequency : Win32cr::Graphics::Direct2D::Common::D2D_VECTOR_2F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_base_frequency.call(this, frequency)
    end
    def set_size(this : IDCompositionTurbulenceEffect*, size : Win32cr::Graphics::Direct2D::Common::D2D_VECTOR_2F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_size.call(this, size)
    end
    def set_num_octaves(this : IDCompositionTurbulenceEffect*, numOctaves : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_num_octaves.call(this, numOctaves)
    end
    def set_seed(this : IDCompositionTurbulenceEffect*, seed : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_seed.call(this, seed)
    end
    def set_noise(this : IDCompositionTurbulenceEffect*, noise : Win32cr::Graphics::Direct2D::Common::D2D1_TURBULENCE_NOISE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_noise.call(this, noise)
    end
    def set_stitchable(this : IDCompositionTurbulenceEffect*, stitchable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_stitchable.call(this, stitchable)
    end

  end

  @[Extern]
  record IDCompositionLinearTransferEffectVtbl,
    query_interface : Proc(IDCompositionLinearTransferEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionLinearTransferEffect*, UInt32),
    release : Proc(IDCompositionLinearTransferEffect*, UInt32),
    set_input : Proc(IDCompositionLinearTransferEffect*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_red_y_intercept_1 : Proc(IDCompositionLinearTransferEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_red_y_intercept_2 : Proc(IDCompositionLinearTransferEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_red_slope_1 : Proc(IDCompositionLinearTransferEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_red_slope_2 : Proc(IDCompositionLinearTransferEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_red_disable : Proc(IDCompositionLinearTransferEffect*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_green_y_intercept_1 : Proc(IDCompositionLinearTransferEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_green_y_intercept_2 : Proc(IDCompositionLinearTransferEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_green_slope_1 : Proc(IDCompositionLinearTransferEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_green_slope_2 : Proc(IDCompositionLinearTransferEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_green_disable : Proc(IDCompositionLinearTransferEffect*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_blue_y_intercept_1 : Proc(IDCompositionLinearTransferEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_blue_y_intercept_2 : Proc(IDCompositionLinearTransferEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_blue_slope_1 : Proc(IDCompositionLinearTransferEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_blue_slope_2 : Proc(IDCompositionLinearTransferEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_blue_disable : Proc(IDCompositionLinearTransferEffect*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_alpha_y_intercept_1 : Proc(IDCompositionLinearTransferEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_alpha_y_intercept_2 : Proc(IDCompositionLinearTransferEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_alpha_slope_1 : Proc(IDCompositionLinearTransferEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_alpha_slope_2 : Proc(IDCompositionLinearTransferEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_alpha_disable : Proc(IDCompositionLinearTransferEffect*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_clamp_output : Proc(IDCompositionLinearTransferEffect*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("4305ee5b-c4a0-4c88-9385-67124e017683")]
  record IDCompositionLinearTransferEffect, lpVtbl : IDCompositionLinearTransferEffectVtbl* do
    GUID = LibC::GUID.new(0x4305ee5b_u32, 0xc4a0_u16, 0x4c88_u16, StaticArray[0x93_u8, 0x85_u8, 0x67_u8, 0x12_u8, 0x4e_u8, 0x1_u8, 0x76_u8, 0x83_u8])
    def query_interface(this : IDCompositionLinearTransferEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionLinearTransferEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionLinearTransferEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IDCompositionLinearTransferEffect*, index : UInt32, input : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, index, input, flags)
    end
    def set_red_y_intercept_1(this : IDCompositionLinearTransferEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_red_y_intercept_1.call(this, animation)
    end
    def set_red_y_intercept_2(this : IDCompositionLinearTransferEffect*, redYIntercept : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_red_y_intercept_2.call(this, redYIntercept)
    end
    def set_red_slope_1(this : IDCompositionLinearTransferEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_red_slope_1.call(this, animation)
    end
    def set_red_slope_2(this : IDCompositionLinearTransferEffect*, redSlope : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_red_slope_2.call(this, redSlope)
    end
    def set_red_disable(this : IDCompositionLinearTransferEffect*, redDisable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_red_disable.call(this, redDisable)
    end
    def set_green_y_intercept_1(this : IDCompositionLinearTransferEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_green_y_intercept_1.call(this, animation)
    end
    def set_green_y_intercept_2(this : IDCompositionLinearTransferEffect*, greenYIntercept : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_green_y_intercept_2.call(this, greenYIntercept)
    end
    def set_green_slope_1(this : IDCompositionLinearTransferEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_green_slope_1.call(this, animation)
    end
    def set_green_slope_2(this : IDCompositionLinearTransferEffect*, greenSlope : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_green_slope_2.call(this, greenSlope)
    end
    def set_green_disable(this : IDCompositionLinearTransferEffect*, greenDisable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_green_disable.call(this, greenDisable)
    end
    def set_blue_y_intercept_1(this : IDCompositionLinearTransferEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_blue_y_intercept_1.call(this, animation)
    end
    def set_blue_y_intercept_2(this : IDCompositionLinearTransferEffect*, blueYIntercept : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_blue_y_intercept_2.call(this, blueYIntercept)
    end
    def set_blue_slope_1(this : IDCompositionLinearTransferEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_blue_slope_1.call(this, animation)
    end
    def set_blue_slope_2(this : IDCompositionLinearTransferEffect*, blueSlope : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_blue_slope_2.call(this, blueSlope)
    end
    def set_blue_disable(this : IDCompositionLinearTransferEffect*, blueDisable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_blue_disable.call(this, blueDisable)
    end
    def set_alpha_y_intercept_1(this : IDCompositionLinearTransferEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alpha_y_intercept_1.call(this, animation)
    end
    def set_alpha_y_intercept_2(this : IDCompositionLinearTransferEffect*, alphaYIntercept : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alpha_y_intercept_2.call(this, alphaYIntercept)
    end
    def set_alpha_slope_1(this : IDCompositionLinearTransferEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alpha_slope_1.call(this, animation)
    end
    def set_alpha_slope_2(this : IDCompositionLinearTransferEffect*, alphaSlope : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alpha_slope_2.call(this, alphaSlope)
    end
    def set_alpha_disable(this : IDCompositionLinearTransferEffect*, alphaDisable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alpha_disable.call(this, alphaDisable)
    end
    def set_clamp_output(this : IDCompositionLinearTransferEffect*, clampOutput : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clamp_output.call(this, clampOutput)
    end

  end

  @[Extern]
  record IDCompositionTableTransferEffectVtbl,
    query_interface : Proc(IDCompositionTableTransferEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionTableTransferEffect*, UInt32),
    release : Proc(IDCompositionTableTransferEffect*, UInt32),
    set_input : Proc(IDCompositionTableTransferEffect*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_red_table : Proc(IDCompositionTableTransferEffect*, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    set_green_table : Proc(IDCompositionTableTransferEffect*, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    set_blue_table : Proc(IDCompositionTableTransferEffect*, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    set_alpha_table : Proc(IDCompositionTableTransferEffect*, Float32*, UInt32, Win32cr::Foundation::HRESULT),
    set_red_disable : Proc(IDCompositionTableTransferEffect*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_green_disable : Proc(IDCompositionTableTransferEffect*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_blue_disable : Proc(IDCompositionTableTransferEffect*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_alpha_disable : Proc(IDCompositionTableTransferEffect*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_clamp_output : Proc(IDCompositionTableTransferEffect*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_red_table_value_1 : Proc(IDCompositionTableTransferEffect*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_red_table_value_2 : Proc(IDCompositionTableTransferEffect*, UInt32, Float32, Win32cr::Foundation::HRESULT),
    set_green_table_value_1 : Proc(IDCompositionTableTransferEffect*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_green_table_value_2 : Proc(IDCompositionTableTransferEffect*, UInt32, Float32, Win32cr::Foundation::HRESULT),
    set_blue_table_value_1 : Proc(IDCompositionTableTransferEffect*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_blue_table_value_2 : Proc(IDCompositionTableTransferEffect*, UInt32, Float32, Win32cr::Foundation::HRESULT),
    set_alpha_table_value_1 : Proc(IDCompositionTableTransferEffect*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    set_alpha_table_value_2 : Proc(IDCompositionTableTransferEffect*, UInt32, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("9b7e82e2-69c5-4eb4-a5f5-a7033f5132cd")]
  record IDCompositionTableTransferEffect, lpVtbl : IDCompositionTableTransferEffectVtbl* do
    GUID = LibC::GUID.new(0x9b7e82e2_u32, 0x69c5_u16, 0x4eb4_u16, StaticArray[0xa5_u8, 0xf5_u8, 0xa7_u8, 0x3_u8, 0x3f_u8, 0x51_u8, 0x32_u8, 0xcd_u8])
    def query_interface(this : IDCompositionTableTransferEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionTableTransferEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionTableTransferEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IDCompositionTableTransferEffect*, index : UInt32, input : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, index, input, flags)
    end
    def set_red_table(this : IDCompositionTableTransferEffect*, tableValues : Float32*, count : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_red_table.call(this, tableValues, count)
    end
    def set_green_table(this : IDCompositionTableTransferEffect*, tableValues : Float32*, count : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_green_table.call(this, tableValues, count)
    end
    def set_blue_table(this : IDCompositionTableTransferEffect*, tableValues : Float32*, count : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_blue_table.call(this, tableValues, count)
    end
    def set_alpha_table(this : IDCompositionTableTransferEffect*, tableValues : Float32*, count : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alpha_table.call(this, tableValues, count)
    end
    def set_red_disable(this : IDCompositionTableTransferEffect*, redDisable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_red_disable.call(this, redDisable)
    end
    def set_green_disable(this : IDCompositionTableTransferEffect*, greenDisable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_green_disable.call(this, greenDisable)
    end
    def set_blue_disable(this : IDCompositionTableTransferEffect*, blueDisable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_blue_disable.call(this, blueDisable)
    end
    def set_alpha_disable(this : IDCompositionTableTransferEffect*, alphaDisable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alpha_disable.call(this, alphaDisable)
    end
    def set_clamp_output(this : IDCompositionTableTransferEffect*, clampOutput : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clamp_output.call(this, clampOutput)
    end
    def set_red_table_value_1(this : IDCompositionTableTransferEffect*, index : UInt32, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_red_table_value_1.call(this, index, animation)
    end
    def set_red_table_value_2(this : IDCompositionTableTransferEffect*, index : UInt32, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_red_table_value_2.call(this, index, value)
    end
    def set_green_table_value_1(this : IDCompositionTableTransferEffect*, index : UInt32, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_green_table_value_1.call(this, index, animation)
    end
    def set_green_table_value_2(this : IDCompositionTableTransferEffect*, index : UInt32, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_green_table_value_2.call(this, index, value)
    end
    def set_blue_table_value_1(this : IDCompositionTableTransferEffect*, index : UInt32, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_blue_table_value_1.call(this, index, animation)
    end
    def set_blue_table_value_2(this : IDCompositionTableTransferEffect*, index : UInt32, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_blue_table_value_2.call(this, index, value)
    end
    def set_alpha_table_value_1(this : IDCompositionTableTransferEffect*, index : UInt32, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alpha_table_value_1.call(this, index, animation)
    end
    def set_alpha_table_value_2(this : IDCompositionTableTransferEffect*, index : UInt32, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_alpha_table_value_2.call(this, index, value)
    end

  end

  @[Extern]
  record IDCompositionCompositeEffectVtbl,
    query_interface : Proc(IDCompositionCompositeEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionCompositeEffect*, UInt32),
    release : Proc(IDCompositionCompositeEffect*, UInt32),
    set_input : Proc(IDCompositionCompositeEffect*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_mode : Proc(IDCompositionCompositeEffect*, Win32cr::Graphics::Direct2D::Common::D2D1_COMPOSITE_MODE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("576616c0-a231-494d-a38d-00fd5ec4db46")]
  record IDCompositionCompositeEffect, lpVtbl : IDCompositionCompositeEffectVtbl* do
    GUID = LibC::GUID.new(0x576616c0_u32, 0xa231_u16, 0x494d_u16, StaticArray[0xa3_u8, 0x8d_u8, 0x0_u8, 0xfd_u8, 0x5e_u8, 0xc4_u8, 0xdb_u8, 0x46_u8])
    def query_interface(this : IDCompositionCompositeEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionCompositeEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionCompositeEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IDCompositionCompositeEffect*, index : UInt32, input : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, index, input, flags)
    end
    def set_mode(this : IDCompositionCompositeEffect*, mode : Win32cr::Graphics::Direct2D::Common::D2D1_COMPOSITE_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_mode.call(this, mode)
    end

  end

  @[Extern]
  record IDCompositionBlendEffectVtbl,
    query_interface : Proc(IDCompositionBlendEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionBlendEffect*, UInt32),
    release : Proc(IDCompositionBlendEffect*, UInt32),
    set_input : Proc(IDCompositionBlendEffect*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_mode : Proc(IDCompositionBlendEffect*, Win32cr::Graphics::Direct2D::Common::D2D1_BLEND_MODE, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("33ecdc0a-578a-4a11-9c14-0cb90517f9c5")]
  record IDCompositionBlendEffect, lpVtbl : IDCompositionBlendEffectVtbl* do
    GUID = LibC::GUID.new(0x33ecdc0a_u32, 0x578a_u16, 0x4a11_u16, StaticArray[0x9c_u8, 0x14_u8, 0xc_u8, 0xb9_u8, 0x5_u8, 0x17_u8, 0xf9_u8, 0xc5_u8])
    def query_interface(this : IDCompositionBlendEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionBlendEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionBlendEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IDCompositionBlendEffect*, index : UInt32, input : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, index, input, flags)
    end
    def set_mode(this : IDCompositionBlendEffect*, mode : Win32cr::Graphics::Direct2D::Common::D2D1_BLEND_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_mode.call(this, mode)
    end

  end

  @[Extern]
  record IDCompositionArithmeticCompositeEffectVtbl,
    query_interface : Proc(IDCompositionArithmeticCompositeEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionArithmeticCompositeEffect*, UInt32),
    release : Proc(IDCompositionArithmeticCompositeEffect*, UInt32),
    set_input : Proc(IDCompositionArithmeticCompositeEffect*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_coefficients : Proc(IDCompositionArithmeticCompositeEffect*, Win32cr::Graphics::Direct2D::Common::D2D_VECTOR_4F*, Win32cr::Foundation::HRESULT),
    set_clamp_output : Proc(IDCompositionArithmeticCompositeEffect*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_coefficient1_1 : Proc(IDCompositionArithmeticCompositeEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_coefficient1_2 : Proc(IDCompositionArithmeticCompositeEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_coefficient2_1 : Proc(IDCompositionArithmeticCompositeEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_coefficient2_2 : Proc(IDCompositionArithmeticCompositeEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_coefficient3_1 : Proc(IDCompositionArithmeticCompositeEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_coefficient3_2 : Proc(IDCompositionArithmeticCompositeEffect*, Float32, Win32cr::Foundation::HRESULT),
    set_coefficient4_1 : Proc(IDCompositionArithmeticCompositeEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_coefficient4_2 : Proc(IDCompositionArithmeticCompositeEffect*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("3b67dfa8-e3dd-4e61-b640-46c2f3d739dc")]
  record IDCompositionArithmeticCompositeEffect, lpVtbl : IDCompositionArithmeticCompositeEffectVtbl* do
    GUID = LibC::GUID.new(0x3b67dfa8_u32, 0xe3dd_u16, 0x4e61_u16, StaticArray[0xb6_u8, 0x40_u8, 0x46_u8, 0xc2_u8, 0xf3_u8, 0xd7_u8, 0x39_u8, 0xdc_u8])
    def query_interface(this : IDCompositionArithmeticCompositeEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionArithmeticCompositeEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionArithmeticCompositeEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IDCompositionArithmeticCompositeEffect*, index : UInt32, input : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, index, input, flags)
    end
    def set_coefficients(this : IDCompositionArithmeticCompositeEffect*, coefficients : Win32cr::Graphics::Direct2D::Common::D2D_VECTOR_4F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_coefficients.call(this, coefficients)
    end
    def set_clamp_output(this : IDCompositionArithmeticCompositeEffect*, clampoutput : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_clamp_output.call(this, clampoutput)
    end
    def set_coefficient1_1(this : IDCompositionArithmeticCompositeEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_coefficient1_1.call(this, animation)
    end
    def set_coefficient1_2(this : IDCompositionArithmeticCompositeEffect*, coeffcient1 : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_coefficient1_2.call(this, coeffcient1)
    end
    def set_coefficient2_1(this : IDCompositionArithmeticCompositeEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_coefficient2_1.call(this, animation)
    end
    def set_coefficient2_2(this : IDCompositionArithmeticCompositeEffect*, coefficient2 : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_coefficient2_2.call(this, coefficient2)
    end
    def set_coefficient3_1(this : IDCompositionArithmeticCompositeEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_coefficient3_1.call(this, animation)
    end
    def set_coefficient3_2(this : IDCompositionArithmeticCompositeEffect*, coefficient3 : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_coefficient3_2.call(this, coefficient3)
    end
    def set_coefficient4_1(this : IDCompositionArithmeticCompositeEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_coefficient4_1.call(this, animation)
    end
    def set_coefficient4_2(this : IDCompositionArithmeticCompositeEffect*, coefficient4 : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_coefficient4_2.call(this, coefficient4)
    end

  end

  @[Extern]
  record IDCompositionAffineTransform2DEffectVtbl,
    query_interface : Proc(IDCompositionAffineTransform2DEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionAffineTransform2DEffect*, UInt32),
    release : Proc(IDCompositionAffineTransform2DEffect*, UInt32),
    set_input : Proc(IDCompositionAffineTransform2DEffect*, UInt32, Void*, UInt32, Win32cr::Foundation::HRESULT),
    set_interpolation_mode : Proc(IDCompositionAffineTransform2DEffect*, Win32cr::Graphics::Direct2D::Common::D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE, Win32cr::Foundation::HRESULT),
    set_border_mode : Proc(IDCompositionAffineTransform2DEffect*, Win32cr::Graphics::Direct2D::Common::D2D1_BORDER_MODE, Win32cr::Foundation::HRESULT),
    set_transform_matrix : Proc(IDCompositionAffineTransform2DEffect*, Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_3X2_F*, Win32cr::Foundation::HRESULT),
    set_transform_matrix_element_1 : Proc(IDCompositionAffineTransform2DEffect*, Int32, Int32, Void*, Win32cr::Foundation::HRESULT),
    set_transform_matrix_element_2 : Proc(IDCompositionAffineTransform2DEffect*, Int32, Int32, Float32, Win32cr::Foundation::HRESULT),
    set_sharpness_1 : Proc(IDCompositionAffineTransform2DEffect*, Void*, Win32cr::Foundation::HRESULT),
    set_sharpness_2 : Proc(IDCompositionAffineTransform2DEffect*, Float32, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("0b74b9e8-cdd6-492f-bbbc-5ed32157026d")]
  record IDCompositionAffineTransform2DEffect, lpVtbl : IDCompositionAffineTransform2DEffectVtbl* do
    GUID = LibC::GUID.new(0xb74b9e8_u32, 0xcdd6_u16, 0x492f_u16, StaticArray[0xbb_u8, 0xbc_u8, 0x5e_u8, 0xd3_u8, 0x21_u8, 0x57_u8, 0x2_u8, 0x6d_u8])
    def query_interface(this : IDCompositionAffineTransform2DEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionAffineTransform2DEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionAffineTransform2DEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_input(this : IDCompositionAffineTransform2DEffect*, index : UInt32, input : Void*, flags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_input.call(this, index, input, flags)
    end
    def set_interpolation_mode(this : IDCompositionAffineTransform2DEffect*, interpolationMode : Win32cr::Graphics::Direct2D::Common::D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_interpolation_mode.call(this, interpolationMode)
    end
    def set_border_mode(this : IDCompositionAffineTransform2DEffect*, borderMode : Win32cr::Graphics::Direct2D::Common::D2D1_BORDER_MODE) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_border_mode.call(this, borderMode)
    end
    def set_transform_matrix(this : IDCompositionAffineTransform2DEffect*, transformMatrix : Win32cr::Graphics::Direct2D::Common::D2D_MATRIX_3X2_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_matrix.call(this, transformMatrix)
    end
    def set_transform_matrix_element_1(this : IDCompositionAffineTransform2DEffect*, row : Int32, column : Int32, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_matrix_element_1.call(this, row, column, animation)
    end
    def set_transform_matrix_element_2(this : IDCompositionAffineTransform2DEffect*, row : Int32, column : Int32, value : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_transform_matrix_element_2.call(this, row, column, value)
    end
    def set_sharpness_1(this : IDCompositionAffineTransform2DEffect*, animation : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sharpness_1.call(this, animation)
    end
    def set_sharpness_2(this : IDCompositionAffineTransform2DEffect*, sharpness : Float32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_sharpness_2.call(this, sharpness)
    end

  end

  @[Extern]
  record IDCompositionDelegatedInkTrailVtbl,
    query_interface : Proc(IDCompositionDelegatedInkTrail*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionDelegatedInkTrail*, UInt32),
    release : Proc(IDCompositionDelegatedInkTrail*, UInt32),
    add_trail_points : Proc(IDCompositionDelegatedInkTrail*, Win32cr::Graphics::DirectComposition::DCompositionInkTrailPoint*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    add_trail_points_with_prediction : Proc(IDCompositionDelegatedInkTrail*, Win32cr::Graphics::DirectComposition::DCompositionInkTrailPoint*, UInt32, Win32cr::Graphics::DirectComposition::DCompositionInkTrailPoint*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    remove_trail_points : Proc(IDCompositionDelegatedInkTrail*, UInt32, Win32cr::Foundation::HRESULT),
    start_new_trail : Proc(IDCompositionDelegatedInkTrail*, Win32cr::Graphics::Direct2D::Common::D2D1_COLOR_F*, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("c2448e9b-547d-4057-8cf5-8144ede1c2da")]
  record IDCompositionDelegatedInkTrail, lpVtbl : IDCompositionDelegatedInkTrailVtbl* do
    GUID = LibC::GUID.new(0xc2448e9b_u32, 0x547d_u16, 0x4057_u16, StaticArray[0x8c_u8, 0xf5_u8, 0x81_u8, 0x44_u8, 0xed_u8, 0xe1_u8, 0xc2_u8, 0xda_u8])
    def query_interface(this : IDCompositionDelegatedInkTrail*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionDelegatedInkTrail*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionDelegatedInkTrail*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_trail_points(this : IDCompositionDelegatedInkTrail*, inkPoints : Win32cr::Graphics::DirectComposition::DCompositionInkTrailPoint*, inkPointsCount : UInt32, generationId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_trail_points.call(this, inkPoints, inkPointsCount, generationId)
    end
    def add_trail_points_with_prediction(this : IDCompositionDelegatedInkTrail*, inkPoints : Win32cr::Graphics::DirectComposition::DCompositionInkTrailPoint*, inkPointsCount : UInt32, predictedInkPoints : Win32cr::Graphics::DirectComposition::DCompositionInkTrailPoint*, predictedInkPointsCount : UInt32, generationId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_trail_points_with_prediction.call(this, inkPoints, inkPointsCount, predictedInkPoints, predictedInkPointsCount, generationId)
    end
    def remove_trail_points(this : IDCompositionDelegatedInkTrail*, generationId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_trail_points.call(this, generationId)
    end
    def start_new_trail(this : IDCompositionDelegatedInkTrail*, color : Win32cr::Graphics::Direct2D::Common::D2D1_COLOR_F*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_new_trail.call(this, color)
    end

  end

  @[Extern]
  record IDCompositionInkTrailDeviceVtbl,
    query_interface : Proc(IDCompositionInkTrailDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDCompositionInkTrailDevice*, UInt32),
    release : Proc(IDCompositionInkTrailDevice*, UInt32),
    create_delegated_ink_trail : Proc(IDCompositionInkTrailDevice*, Void**, Win32cr::Foundation::HRESULT),
    create_delegated_ink_trail_for_swap_chain : Proc(IDCompositionInkTrailDevice*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  #@[Com("df0c7cec-cdeb-4d4a-b91c-721bf22f4e6c")]
  record IDCompositionInkTrailDevice, lpVtbl : IDCompositionInkTrailDeviceVtbl* do
    GUID = LibC::GUID.new(0xdf0c7cec_u32, 0xcdeb_u16, 0x4d4a_u16, StaticArray[0xb9_u8, 0x1c_u8, 0x72_u8, 0x1b_u8, 0xf2_u8, 0x2f_u8, 0x4e_u8, 0x6c_u8])
    def query_interface(this : IDCompositionInkTrailDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDCompositionInkTrailDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDCompositionInkTrailDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_delegated_ink_trail(this : IDCompositionInkTrailDevice*, inkTrail : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_delegated_ink_trail.call(this, inkTrail)
    end
    def create_delegated_ink_trail_for_swap_chain(this : IDCompositionInkTrailDevice*, swapChain : Void*, inkTrail : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_delegated_ink_trail_for_swap_chain.call(this, swapChain, inkTrail)
    end

  end

  @[Link("dcomp")]
  lib C
    fun DCompositionCreateDevice(dxgiDevice : Void*, iid : LibC::GUID*, dcompositionDevice : Void**) : Win32cr::Foundation::HRESULT

    fun DCompositionCreateDevice2(renderingDevice : Void*, iid : LibC::GUID*, dcompositionDevice : Void**) : Win32cr::Foundation::HRESULT

    fun DCompositionCreateDevice3(renderingDevice : Void*, iid : LibC::GUID*, dcompositionDevice : Void**) : Win32cr::Foundation::HRESULT

    fun DCompositionCreateSurfaceHandle(desiredAccess : UInt32, securityAttributes : Win32cr::Security::SECURITY_ATTRIBUTES*, surfaceHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT

    fun DCompositionAttachMouseWheelToHwnd(visual : Void*, hwnd : Win32cr::Foundation::HWND, enable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun DCompositionAttachMouseDragToHwnd(visual : Void*, hwnd : Win32cr::Foundation::HWND, enable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun DCompositionGetFrameId(frameIdType : Win32cr::Graphics::DirectComposition::COMPOSITION_FRAME_ID_TYPE, frameId : UInt64*) : Win32cr::Foundation::HRESULT

    fun DCompositionGetStatistics(frameId : UInt64, frameStats : Win32cr::Graphics::DirectComposition::COMPOSITION_FRAME_STATS*, targetIdCount : UInt32, targetIds : Win32cr::Graphics::DirectComposition::COMPOSITION_TARGET_ID*, actualTargetIdCount : UInt32*) : Win32cr::Foundation::HRESULT

    fun DCompositionGetTargetStatistics(frameId : UInt64, targetId : Win32cr::Graphics::DirectComposition::COMPOSITION_TARGET_ID*, targetStats : Win32cr::Graphics::DirectComposition::COMPOSITION_TARGET_STATS*) : Win32cr::Foundation::HRESULT

    fun DCompositionBoostCompositorClock(enable : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun DCompositionWaitForCompositorClock(count : UInt32, handles : Win32cr::Foundation::HANDLE*, timeoutInMs : UInt32) : UInt32

  end
end