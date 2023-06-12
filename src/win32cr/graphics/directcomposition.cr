require "../foundation.cr"
require "../graphics/dxgi/common.cr"
require "../system/com.cr"
require "../graphics/direct2d/common.cr"
require "../graphics/direct3d.cr"
require "../graphics.cr"
require "../graphics/dxgi.cr"
require "../security.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:dcomp.dll")]
{% else %}
@[Link("dcomp")]
{% end %}
lib LibWin32
  COMPOSITIONOBJECT_READ = 1_i32
  COMPOSITIONOBJECT_WRITE = 2_i32
  DCOMPOSITION_MAX_WAITFORCOMPOSITORCLOCK_OBJECTS = 32_u32
  COMPOSITION_STATS_MAX_TARGETS = 256_u32


  enum DCOMPOSITION_BITMAP_INTERPOLATION_MODE : Int32
    DCOMPOSITION_BITMAP_INTERPOLATION_MODE_NEAREST_NEIGHBOR = 0
    DCOMPOSITION_BITMAP_INTERPOLATION_MODE_LINEAR = 1
    DCOMPOSITION_BITMAP_INTERPOLATION_MODE_INHERIT = -1
  end

  enum DCOMPOSITION_BORDER_MODE : Int32
    DCOMPOSITION_BORDER_MODE_SOFT = 0
    DCOMPOSITION_BORDER_MODE_HARD = 1
    DCOMPOSITION_BORDER_MODE_INHERIT = -1
  end

  enum DCOMPOSITION_COMPOSITE_MODE : Int32
    DCOMPOSITION_COMPOSITE_MODE_SOURCE_OVER = 0
    DCOMPOSITION_COMPOSITE_MODE_DESTINATION_INVERT = 1
    DCOMPOSITION_COMPOSITE_MODE_MIN_BLEND = 2
    DCOMPOSITION_COMPOSITE_MODE_INHERIT = -1
  end

  enum DCOMPOSITION_BACKFACE_VISIBILITY : Int32
    DCOMPOSITION_BACKFACE_VISIBILITY_VISIBLE = 0
    DCOMPOSITION_BACKFACE_VISIBILITY_HIDDEN = 1
    DCOMPOSITION_BACKFACE_VISIBILITY_INHERIT = -1
  end

  enum DCOMPOSITION_OPACITY_MODE : Int32
    DCOMPOSITION_OPACITY_MODE_LAYER = 0
    DCOMPOSITION_OPACITY_MODE_MULTIPLY = 1
    DCOMPOSITION_OPACITY_MODE_INHERIT = -1
  end

  enum DCOMPOSITION_DEPTH_MODE : Int32
    DCOMPOSITION_DEPTH_MODE_TREE = 0
    DCOMPOSITION_DEPTH_MODE_SPATIAL = 1
    DCOMPOSITION_DEPTH_MODE_SORTED = 3
    DCOMPOSITION_DEPTH_MODE_INHERIT = -1
  end

  enum COMPOSITION_FRAME_ID_TYPE : Int32
    COMPOSITION_FRAME_ID_CREATED = 0
    COMPOSITION_FRAME_ID_CONFIRMED = 1
    COMPOSITION_FRAME_ID_COMPLETED = 2
  end

  struct DCOMPOSITION_FRAME_STATISTICS
    last_frame_time : LARGE_INTEGER
    current_composition_rate : DXGI_RATIONAL
    current_time : LARGE_INTEGER
    time_frequency : LARGE_INTEGER
    next_estimated_frame_time : LARGE_INTEGER
  end
  struct COMPOSITION_FRAME_STATS
    start_time : UInt64
    target_time : UInt64
    frame_period : UInt64
  end
  struct COMPOSITION_TARGET_ID
    display_adapter_luid : LUID
    render_adapter_luid : LUID
    vid_pn_source_id : UInt32
    vid_pn_target_id : UInt32
    unique_id : UInt32
  end
  struct COMPOSITION_STATS
    present_count : UInt32
    refresh_count : UInt32
    virtual_refresh_count : UInt32
    time : UInt64
  end
  struct COMPOSITION_TARGET_STATS
    outstanding_presents : UInt32
    present_time : UInt64
    vblank_duration : UInt64
    presented_stats : COMPOSITION_STATS
    completed_stats : COMPOSITION_STATS
  end
  struct DCompositionInkTrailPoint
    x : Float32
    y : Float32
    radius : Float32
  end


  struct IDCompositionAnimationVTbl
    query_interface : Proc(IDCompositionAnimation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionAnimation*, UInt32)
    release : Proc(IDCompositionAnimation*, UInt32)
    reset : Proc(IDCompositionAnimation*, HRESULT)
    set_absolute_begin_time : Proc(IDCompositionAnimation*, LARGE_INTEGER, HRESULT)
    add_cubic : Proc(IDCompositionAnimation*, Float64, Float32, Float32, Float32, Float32, HRESULT)
    add_sinusoidal : Proc(IDCompositionAnimation*, Float64, Float32, Float32, Float32, Float32, HRESULT)
    add_repeat : Proc(IDCompositionAnimation*, Float64, Float64, HRESULT)
    rend : Proc(IDCompositionAnimation*, Float64, Float32, HRESULT)
  end

  IDCompositionAnimation_GUID = LibC::GUID.new("cbfd91d9-51b2-45e4-b3de-d19ccfb863c5")
  CLSID_IDCompositionAnimation = "cbfd91d9-51b2-45e4-b3de-d19ccfb863c5"
  struct IDCompositionAnimation
    lpVtbl : IDCompositionAnimationVTbl*
  end

  struct IDCompositionDeviceVTbl
    query_interface : Proc(IDCompositionDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionDevice*, UInt32)
    release : Proc(IDCompositionDevice*, UInt32)
    commit : Proc(IDCompositionDevice*, HRESULT)
    wait_for_commit_completion : Proc(IDCompositionDevice*, HRESULT)
    get_frame_statistics : Proc(IDCompositionDevice*, DCOMPOSITION_FRAME_STATISTICS*, HRESULT)
    create_target_for_hwnd : Proc(IDCompositionDevice*, LibC::HANDLE, LibC::BOOL, IDCompositionTarget*, HRESULT)
    create_visual : Proc(IDCompositionDevice*, IDCompositionVisual*, HRESULT)
    create_surface : Proc(IDCompositionDevice*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)
    create_virtual_surface : Proc(IDCompositionDevice*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)
    create_surface_from_handle : Proc(IDCompositionDevice*, LibC::HANDLE, IUnknown*, HRESULT)
    create_surface_from_hwnd : Proc(IDCompositionDevice*, LibC::HANDLE, IUnknown*, HRESULT)
    create_translate_transform : Proc(IDCompositionDevice*, IDCompositionTranslateTransform*, HRESULT)
    create_scale_transform : Proc(IDCompositionDevice*, IDCompositionScaleTransform*, HRESULT)
    create_rotate_transform : Proc(IDCompositionDevice*, IDCompositionRotateTransform*, HRESULT)
    create_skew_transform : Proc(IDCompositionDevice*, IDCompositionSkewTransform*, HRESULT)
    create_matrix_transform : Proc(IDCompositionDevice*, IDCompositionMatrixTransform*, HRESULT)
    create_transform_group : Proc(IDCompositionDevice*, IDCompositionTransform*, UInt32, IDCompositionTransform*, HRESULT)
    create_translate_transform3_d : Proc(IDCompositionDevice*, IDCompositionTranslateTransform3D*, HRESULT)
    create_scale_transform3_d : Proc(IDCompositionDevice*, IDCompositionScaleTransform3D*, HRESULT)
    create_rotate_transform3_d : Proc(IDCompositionDevice*, IDCompositionRotateTransform3D*, HRESULT)
    create_matrix_transform3_d : Proc(IDCompositionDevice*, IDCompositionMatrixTransform3D*, HRESULT)
    create_transform3_d_group : Proc(IDCompositionDevice*, IDCompositionTransform3D*, UInt32, IDCompositionTransform3D*, HRESULT)
    create_effect_group : Proc(IDCompositionDevice*, IDCompositionEffectGroup*, HRESULT)
    create_rectangle_clip : Proc(IDCompositionDevice*, IDCompositionRectangleClip*, HRESULT)
    create_animation : Proc(IDCompositionDevice*, IDCompositionAnimation*, HRESULT)
    check_device_state : Proc(IDCompositionDevice*, LibC::BOOL*, HRESULT)
  end

  IDCompositionDevice_GUID = LibC::GUID.new("c37ea93a-e7aa-450d-b16f-9746cb0407f3")
  CLSID_IDCompositionDevice = "c37ea93a-e7aa-450d-b16f-9746cb0407f3"
  struct IDCompositionDevice
    lpVtbl : IDCompositionDeviceVTbl*
  end

  struct IDCompositionTargetVTbl
    query_interface : Proc(IDCompositionTarget*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionTarget*, UInt32)
    release : Proc(IDCompositionTarget*, UInt32)
    set_root : Proc(IDCompositionTarget*, IDCompositionVisual, HRESULT)
  end

  IDCompositionTarget_GUID = LibC::GUID.new("eacdd04c-117e-4e17-88f4-d1b12b0e3d89")
  CLSID_IDCompositionTarget = "eacdd04c-117e-4e17-88f4-d1b12b0e3d89"
  struct IDCompositionTarget
    lpVtbl : IDCompositionTargetVTbl*
  end

  struct IDCompositionVisualVTbl
    query_interface : Proc(IDCompositionVisual*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionVisual*, UInt32)
    release : Proc(IDCompositionVisual*, UInt32)
    set_offset_x : Proc(IDCompositionVisual*, IDCompositionAnimation, HRESULT)
    set_offset_x2 : Proc(IDCompositionVisual*, Float32, HRESULT)
    set_offset_y : Proc(IDCompositionVisual*, IDCompositionAnimation, HRESULT)
    set_offset_y2 : Proc(IDCompositionVisual*, Float32, HRESULT)
    set_transform : Proc(IDCompositionVisual*, IDCompositionTransform, HRESULT)
    set_transform2 : Proc(IDCompositionVisual*, D2D_MATRIX_3X2_F*, HRESULT)
    set_transform_parent : Proc(IDCompositionVisual*, IDCompositionVisual, HRESULT)
    set_effect : Proc(IDCompositionVisual*, IDCompositionEffect, HRESULT)
    set_bitmap_interpolation_mode : Proc(IDCompositionVisual*, DCOMPOSITION_BITMAP_INTERPOLATION_MODE, HRESULT)
    set_border_mode : Proc(IDCompositionVisual*, DCOMPOSITION_BORDER_MODE, HRESULT)
    set_clip : Proc(IDCompositionVisual*, IDCompositionClip, HRESULT)
    set_clip2 : Proc(IDCompositionVisual*, D2D_RECT_F*, HRESULT)
    set_content : Proc(IDCompositionVisual*, IUnknown, HRESULT)
    add_visual : Proc(IDCompositionVisual*, IDCompositionVisual, LibC::BOOL, IDCompositionVisual, HRESULT)
    remove_visual : Proc(IDCompositionVisual*, IDCompositionVisual, HRESULT)
    remove_all_visuals : Proc(IDCompositionVisual*, HRESULT)
    set_composite_mode : Proc(IDCompositionVisual*, DCOMPOSITION_COMPOSITE_MODE, HRESULT)
  end

  IDCompositionVisual_GUID = LibC::GUID.new("4d93059d-097b-4651-9a60-f0f25116e2f3")
  CLSID_IDCompositionVisual = "4d93059d-097b-4651-9a60-f0f25116e2f3"
  struct IDCompositionVisual
    lpVtbl : IDCompositionVisualVTbl*
  end

  struct IDCompositionEffectVTbl
    query_interface : Proc(IDCompositionEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionEffect*, UInt32)
    release : Proc(IDCompositionEffect*, UInt32)
  end

  IDCompositionEffect_GUID = LibC::GUID.new("ec81b08f-bfcb-4e8d-b193-a915587999e8")
  CLSID_IDCompositionEffect = "ec81b08f-bfcb-4e8d-b193-a915587999e8"
  struct IDCompositionEffect
    lpVtbl : IDCompositionEffectVTbl*
  end

  struct IDCompositionTransform3DVTbl
    query_interface : Proc(IDCompositionTransform3D*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionTransform3D*, UInt32)
    release : Proc(IDCompositionTransform3D*, UInt32)
  end

  IDCompositionTransform3D_GUID = LibC::GUID.new("71185722-246b-41f2-aad1-0443f7f4bfc2")
  CLSID_IDCompositionTransform3D = "71185722-246b-41f2-aad1-0443f7f4bfc2"
  struct IDCompositionTransform3D
    lpVtbl : IDCompositionTransform3DVTbl*
  end

  struct IDCompositionTransformVTbl
    query_interface : Proc(IDCompositionTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionTransform*, UInt32)
    release : Proc(IDCompositionTransform*, UInt32)
  end

  IDCompositionTransform_GUID = LibC::GUID.new("fd55faa7-37e0-4c20-95d2-9be45bc33f55")
  CLSID_IDCompositionTransform = "fd55faa7-37e0-4c20-95d2-9be45bc33f55"
  struct IDCompositionTransform
    lpVtbl : IDCompositionTransformVTbl*
  end

  struct IDCompositionTranslateTransformVTbl
    query_interface : Proc(IDCompositionTranslateTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionTranslateTransform*, UInt32)
    release : Proc(IDCompositionTranslateTransform*, UInt32)
    set_offset_x : Proc(IDCompositionTranslateTransform*, IDCompositionAnimation, HRESULT)
    set_offset_x2 : Proc(IDCompositionTranslateTransform*, Float32, HRESULT)
    set_offset_y : Proc(IDCompositionTranslateTransform*, IDCompositionAnimation, HRESULT)
    set_offset_y2 : Proc(IDCompositionTranslateTransform*, Float32, HRESULT)
  end

  IDCompositionTranslateTransform_GUID = LibC::GUID.new("06791122-c6f0-417d-8323-269e987f5954")
  CLSID_IDCompositionTranslateTransform = "06791122-c6f0-417d-8323-269e987f5954"
  struct IDCompositionTranslateTransform
    lpVtbl : IDCompositionTranslateTransformVTbl*
  end

  struct IDCompositionScaleTransformVTbl
    query_interface : Proc(IDCompositionScaleTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionScaleTransform*, UInt32)
    release : Proc(IDCompositionScaleTransform*, UInt32)
    set_scale_x : Proc(IDCompositionScaleTransform*, IDCompositionAnimation, HRESULT)
    set_scale_x2 : Proc(IDCompositionScaleTransform*, Float32, HRESULT)
    set_scale_y : Proc(IDCompositionScaleTransform*, IDCompositionAnimation, HRESULT)
    set_scale_y2 : Proc(IDCompositionScaleTransform*, Float32, HRESULT)
    set_center_x : Proc(IDCompositionScaleTransform*, IDCompositionAnimation, HRESULT)
    set_center_x2 : Proc(IDCompositionScaleTransform*, Float32, HRESULT)
    set_center_y : Proc(IDCompositionScaleTransform*, IDCompositionAnimation, HRESULT)
    set_center_y2 : Proc(IDCompositionScaleTransform*, Float32, HRESULT)
  end

  IDCompositionScaleTransform_GUID = LibC::GUID.new("71fde914-40ef-45ef-bd51-68b037c339f9")
  CLSID_IDCompositionScaleTransform = "71fde914-40ef-45ef-bd51-68b037c339f9"
  struct IDCompositionScaleTransform
    lpVtbl : IDCompositionScaleTransformVTbl*
  end

  struct IDCompositionRotateTransformVTbl
    query_interface : Proc(IDCompositionRotateTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionRotateTransform*, UInt32)
    release : Proc(IDCompositionRotateTransform*, UInt32)
    set_angle : Proc(IDCompositionRotateTransform*, IDCompositionAnimation, HRESULT)
    set_angle2 : Proc(IDCompositionRotateTransform*, Float32, HRESULT)
    set_center_x : Proc(IDCompositionRotateTransform*, IDCompositionAnimation, HRESULT)
    set_center_x2 : Proc(IDCompositionRotateTransform*, Float32, HRESULT)
    set_center_y : Proc(IDCompositionRotateTransform*, IDCompositionAnimation, HRESULT)
    set_center_y2 : Proc(IDCompositionRotateTransform*, Float32, HRESULT)
  end

  IDCompositionRotateTransform_GUID = LibC::GUID.new("641ed83c-ae96-46c5-90dc-32774cc5c6d5")
  CLSID_IDCompositionRotateTransform = "641ed83c-ae96-46c5-90dc-32774cc5c6d5"
  struct IDCompositionRotateTransform
    lpVtbl : IDCompositionRotateTransformVTbl*
  end

  struct IDCompositionSkewTransformVTbl
    query_interface : Proc(IDCompositionSkewTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionSkewTransform*, UInt32)
    release : Proc(IDCompositionSkewTransform*, UInt32)
    set_angle_x : Proc(IDCompositionSkewTransform*, IDCompositionAnimation, HRESULT)
    set_angle_x2 : Proc(IDCompositionSkewTransform*, Float32, HRESULT)
    set_angle_y : Proc(IDCompositionSkewTransform*, IDCompositionAnimation, HRESULT)
    set_angle_y2 : Proc(IDCompositionSkewTransform*, Float32, HRESULT)
    set_center_x : Proc(IDCompositionSkewTransform*, IDCompositionAnimation, HRESULT)
    set_center_x2 : Proc(IDCompositionSkewTransform*, Float32, HRESULT)
    set_center_y : Proc(IDCompositionSkewTransform*, IDCompositionAnimation, HRESULT)
    set_center_y2 : Proc(IDCompositionSkewTransform*, Float32, HRESULT)
  end

  IDCompositionSkewTransform_GUID = LibC::GUID.new("e57aa735-dcdb-4c72-9c61-0591f58889ee")
  CLSID_IDCompositionSkewTransform = "e57aa735-dcdb-4c72-9c61-0591f58889ee"
  struct IDCompositionSkewTransform
    lpVtbl : IDCompositionSkewTransformVTbl*
  end

  struct IDCompositionMatrixTransformVTbl
    query_interface : Proc(IDCompositionMatrixTransform*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionMatrixTransform*, UInt32)
    release : Proc(IDCompositionMatrixTransform*, UInt32)
    set_matrix : Proc(IDCompositionMatrixTransform*, D2D_MATRIX_3X2_F*, HRESULT)
    set_matrix_element : Proc(IDCompositionMatrixTransform*, Int32, Int32, IDCompositionAnimation, HRESULT)
    set_matrix_element2 : Proc(IDCompositionMatrixTransform*, Int32, Int32, Float32, HRESULT)
  end

  IDCompositionMatrixTransform_GUID = LibC::GUID.new("16cdff07-c503-419c-83f2-0965c7af1fa6")
  CLSID_IDCompositionMatrixTransform = "16cdff07-c503-419c-83f2-0965c7af1fa6"
  struct IDCompositionMatrixTransform
    lpVtbl : IDCompositionMatrixTransformVTbl*
  end

  struct IDCompositionEffectGroupVTbl
    query_interface : Proc(IDCompositionEffectGroup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionEffectGroup*, UInt32)
    release : Proc(IDCompositionEffectGroup*, UInt32)
    set_opacity : Proc(IDCompositionEffectGroup*, IDCompositionAnimation, HRESULT)
    set_opacity2 : Proc(IDCompositionEffectGroup*, Float32, HRESULT)
    set_transform3_d : Proc(IDCompositionEffectGroup*, IDCompositionTransform3D, HRESULT)
  end

  IDCompositionEffectGroup_GUID = LibC::GUID.new("a7929a74-e6b2-4bd6-8b95-4040119ca34d")
  CLSID_IDCompositionEffectGroup = "a7929a74-e6b2-4bd6-8b95-4040119ca34d"
  struct IDCompositionEffectGroup
    lpVtbl : IDCompositionEffectGroupVTbl*
  end

  struct IDCompositionTranslateTransform3DVTbl
    query_interface : Proc(IDCompositionTranslateTransform3D*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionTranslateTransform3D*, UInt32)
    release : Proc(IDCompositionTranslateTransform3D*, UInt32)
    set_offset_x : Proc(IDCompositionTranslateTransform3D*, IDCompositionAnimation, HRESULT)
    set_offset_x2 : Proc(IDCompositionTranslateTransform3D*, Float32, HRESULT)
    set_offset_y : Proc(IDCompositionTranslateTransform3D*, IDCompositionAnimation, HRESULT)
    set_offset_y2 : Proc(IDCompositionTranslateTransform3D*, Float32, HRESULT)
    set_offset_z : Proc(IDCompositionTranslateTransform3D*, IDCompositionAnimation, HRESULT)
    set_offset_z2 : Proc(IDCompositionTranslateTransform3D*, Float32, HRESULT)
  end

  IDCompositionTranslateTransform3D_GUID = LibC::GUID.new("91636d4b-9ba1-4532-aaf7-e3344994d788")
  CLSID_IDCompositionTranslateTransform3D = "91636d4b-9ba1-4532-aaf7-e3344994d788"
  struct IDCompositionTranslateTransform3D
    lpVtbl : IDCompositionTranslateTransform3DVTbl*
  end

  struct IDCompositionScaleTransform3DVTbl
    query_interface : Proc(IDCompositionScaleTransform3D*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionScaleTransform3D*, UInt32)
    release : Proc(IDCompositionScaleTransform3D*, UInt32)
    set_scale_x : Proc(IDCompositionScaleTransform3D*, IDCompositionAnimation, HRESULT)
    set_scale_x2 : Proc(IDCompositionScaleTransform3D*, Float32, HRESULT)
    set_scale_y : Proc(IDCompositionScaleTransform3D*, IDCompositionAnimation, HRESULT)
    set_scale_y2 : Proc(IDCompositionScaleTransform3D*, Float32, HRESULT)
    set_scale_z : Proc(IDCompositionScaleTransform3D*, IDCompositionAnimation, HRESULT)
    set_scale_z2 : Proc(IDCompositionScaleTransform3D*, Float32, HRESULT)
    set_center_x : Proc(IDCompositionScaleTransform3D*, IDCompositionAnimation, HRESULT)
    set_center_x2 : Proc(IDCompositionScaleTransform3D*, Float32, HRESULT)
    set_center_y : Proc(IDCompositionScaleTransform3D*, IDCompositionAnimation, HRESULT)
    set_center_y2 : Proc(IDCompositionScaleTransform3D*, Float32, HRESULT)
    set_center_z : Proc(IDCompositionScaleTransform3D*, IDCompositionAnimation, HRESULT)
    set_center_z2 : Proc(IDCompositionScaleTransform3D*, Float32, HRESULT)
  end

  IDCompositionScaleTransform3D_GUID = LibC::GUID.new("2a9e9ead-364b-4b15-a7c4-a1997f78b389")
  CLSID_IDCompositionScaleTransform3D = "2a9e9ead-364b-4b15-a7c4-a1997f78b389"
  struct IDCompositionScaleTransform3D
    lpVtbl : IDCompositionScaleTransform3DVTbl*
  end

  struct IDCompositionRotateTransform3DVTbl
    query_interface : Proc(IDCompositionRotateTransform3D*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionRotateTransform3D*, UInt32)
    release : Proc(IDCompositionRotateTransform3D*, UInt32)
    set_angle : Proc(IDCompositionRotateTransform3D*, IDCompositionAnimation, HRESULT)
    set_angle2 : Proc(IDCompositionRotateTransform3D*, Float32, HRESULT)
    set_axis_x : Proc(IDCompositionRotateTransform3D*, IDCompositionAnimation, HRESULT)
    set_axis_x2 : Proc(IDCompositionRotateTransform3D*, Float32, HRESULT)
    set_axis_y : Proc(IDCompositionRotateTransform3D*, IDCompositionAnimation, HRESULT)
    set_axis_y2 : Proc(IDCompositionRotateTransform3D*, Float32, HRESULT)
    set_axis_z : Proc(IDCompositionRotateTransform3D*, IDCompositionAnimation, HRESULT)
    set_axis_z2 : Proc(IDCompositionRotateTransform3D*, Float32, HRESULT)
    set_center_x : Proc(IDCompositionRotateTransform3D*, IDCompositionAnimation, HRESULT)
    set_center_x2 : Proc(IDCompositionRotateTransform3D*, Float32, HRESULT)
    set_center_y : Proc(IDCompositionRotateTransform3D*, IDCompositionAnimation, HRESULT)
    set_center_y2 : Proc(IDCompositionRotateTransform3D*, Float32, HRESULT)
    set_center_z : Proc(IDCompositionRotateTransform3D*, IDCompositionAnimation, HRESULT)
    set_center_z2 : Proc(IDCompositionRotateTransform3D*, Float32, HRESULT)
  end

  IDCompositionRotateTransform3D_GUID = LibC::GUID.new("d8f5b23f-d429-4a91-b55a-d2f45fd75b18")
  CLSID_IDCompositionRotateTransform3D = "d8f5b23f-d429-4a91-b55a-d2f45fd75b18"
  struct IDCompositionRotateTransform3D
    lpVtbl : IDCompositionRotateTransform3DVTbl*
  end

  struct IDCompositionMatrixTransform3DVTbl
    query_interface : Proc(IDCompositionMatrixTransform3D*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionMatrixTransform3D*, UInt32)
    release : Proc(IDCompositionMatrixTransform3D*, UInt32)
    set_matrix : Proc(IDCompositionMatrixTransform3D*, D3DMATRIX*, HRESULT)
    set_matrix_element : Proc(IDCompositionMatrixTransform3D*, Int32, Int32, IDCompositionAnimation, HRESULT)
    set_matrix_element2 : Proc(IDCompositionMatrixTransform3D*, Int32, Int32, Float32, HRESULT)
  end

  IDCompositionMatrixTransform3D_GUID = LibC::GUID.new("4b3363f0-643b-41b7-b6e0-ccf22d34467c")
  CLSID_IDCompositionMatrixTransform3D = "4b3363f0-643b-41b7-b6e0-ccf22d34467c"
  struct IDCompositionMatrixTransform3D
    lpVtbl : IDCompositionMatrixTransform3DVTbl*
  end

  struct IDCompositionClipVTbl
    query_interface : Proc(IDCompositionClip*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionClip*, UInt32)
    release : Proc(IDCompositionClip*, UInt32)
  end

  IDCompositionClip_GUID = LibC::GUID.new("64ac3703-9d3f-45ec-a109-7cac0e7a13a7")
  CLSID_IDCompositionClip = "64ac3703-9d3f-45ec-a109-7cac0e7a13a7"
  struct IDCompositionClip
    lpVtbl : IDCompositionClipVTbl*
  end

  struct IDCompositionRectangleClipVTbl
    query_interface : Proc(IDCompositionRectangleClip*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionRectangleClip*, UInt32)
    release : Proc(IDCompositionRectangleClip*, UInt32)
    set_left : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_left2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_top : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_top2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_right : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_right2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_bottom : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_bottom2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_top_left_radius_x : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_top_left_radius_x2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_top_left_radius_y : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_top_left_radius_y2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_top_right_radius_x : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_top_right_radius_x2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_top_right_radius_y : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_top_right_radius_y2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_bottom_left_radius_x : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_bottom_left_radius_x2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_bottom_left_radius_y : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_bottom_left_radius_y2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_bottom_right_radius_x : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_bottom_right_radius_x2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
    set_bottom_right_radius_y : Proc(IDCompositionRectangleClip*, IDCompositionAnimation, HRESULT)
    set_bottom_right_radius_y2 : Proc(IDCompositionRectangleClip*, Float32, HRESULT)
  end

  IDCompositionRectangleClip_GUID = LibC::GUID.new("9842ad7d-d9cf-4908-aed7-48b51da5e7c2")
  CLSID_IDCompositionRectangleClip = "9842ad7d-d9cf-4908-aed7-48b51da5e7c2"
  struct IDCompositionRectangleClip
    lpVtbl : IDCompositionRectangleClipVTbl*
  end

  struct IDCompositionSurfaceVTbl
    query_interface : Proc(IDCompositionSurface*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionSurface*, UInt32)
    release : Proc(IDCompositionSurface*, UInt32)
    begin_draw : Proc(IDCompositionSurface*, RECT*, Guid*, Void**, POINT*, HRESULT)
    end_draw : Proc(IDCompositionSurface*, HRESULT)
    suspend_draw : Proc(IDCompositionSurface*, HRESULT)
    resume_draw : Proc(IDCompositionSurface*, HRESULT)
    scroll : Proc(IDCompositionSurface*, RECT*, RECT*, Int32, Int32, HRESULT)
  end

  IDCompositionSurface_GUID = LibC::GUID.new("bb8a4953-2c99-4f5a-96f5-4819027fa3ac")
  CLSID_IDCompositionSurface = "bb8a4953-2c99-4f5a-96f5-4819027fa3ac"
  struct IDCompositionSurface
    lpVtbl : IDCompositionSurfaceVTbl*
  end

  struct IDCompositionVirtualSurfaceVTbl
    query_interface : Proc(IDCompositionVirtualSurface*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionVirtualSurface*, UInt32)
    release : Proc(IDCompositionVirtualSurface*, UInt32)
    begin_draw : Proc(IDCompositionVirtualSurface*, RECT*, Guid*, Void**, POINT*, HRESULT)
    end_draw : Proc(IDCompositionVirtualSurface*, HRESULT)
    suspend_draw : Proc(IDCompositionVirtualSurface*, HRESULT)
    resume_draw : Proc(IDCompositionVirtualSurface*, HRESULT)
    scroll : Proc(IDCompositionVirtualSurface*, RECT*, RECT*, Int32, Int32, HRESULT)
    resize : Proc(IDCompositionVirtualSurface*, UInt32, UInt32, HRESULT)
    trim : Proc(IDCompositionVirtualSurface*, RECT*, UInt32, HRESULT)
  end

  IDCompositionVirtualSurface_GUID = LibC::GUID.new("ae471c51-5f53-4a24-8d3e-d0c39c30b3f0")
  CLSID_IDCompositionVirtualSurface = "ae471c51-5f53-4a24-8d3e-d0c39c30b3f0"
  struct IDCompositionVirtualSurface
    lpVtbl : IDCompositionVirtualSurfaceVTbl*
  end

  struct IDCompositionDevice2VTbl
    query_interface : Proc(IDCompositionDevice2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionDevice2*, UInt32)
    release : Proc(IDCompositionDevice2*, UInt32)
    commit : Proc(IDCompositionDevice2*, HRESULT)
    wait_for_commit_completion : Proc(IDCompositionDevice2*, HRESULT)
    get_frame_statistics : Proc(IDCompositionDevice2*, DCOMPOSITION_FRAME_STATISTICS*, HRESULT)
    create_visual : Proc(IDCompositionDevice2*, IDCompositionVisual2*, HRESULT)
    create_surface_factory : Proc(IDCompositionDevice2*, IUnknown, IDCompositionSurfaceFactory*, HRESULT)
    create_surface : Proc(IDCompositionDevice2*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)
    create_virtual_surface : Proc(IDCompositionDevice2*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)
    create_translate_transform : Proc(IDCompositionDevice2*, IDCompositionTranslateTransform*, HRESULT)
    create_scale_transform : Proc(IDCompositionDevice2*, IDCompositionScaleTransform*, HRESULT)
    create_rotate_transform : Proc(IDCompositionDevice2*, IDCompositionRotateTransform*, HRESULT)
    create_skew_transform : Proc(IDCompositionDevice2*, IDCompositionSkewTransform*, HRESULT)
    create_matrix_transform : Proc(IDCompositionDevice2*, IDCompositionMatrixTransform*, HRESULT)
    create_transform_group : Proc(IDCompositionDevice2*, IDCompositionTransform*, UInt32, IDCompositionTransform*, HRESULT)
    create_translate_transform3_d : Proc(IDCompositionDevice2*, IDCompositionTranslateTransform3D*, HRESULT)
    create_scale_transform3_d : Proc(IDCompositionDevice2*, IDCompositionScaleTransform3D*, HRESULT)
    create_rotate_transform3_d : Proc(IDCompositionDevice2*, IDCompositionRotateTransform3D*, HRESULT)
    create_matrix_transform3_d : Proc(IDCompositionDevice2*, IDCompositionMatrixTransform3D*, HRESULT)
    create_transform3_d_group : Proc(IDCompositionDevice2*, IDCompositionTransform3D*, UInt32, IDCompositionTransform3D*, HRESULT)
    create_effect_group : Proc(IDCompositionDevice2*, IDCompositionEffectGroup*, HRESULT)
    create_rectangle_clip : Proc(IDCompositionDevice2*, IDCompositionRectangleClip*, HRESULT)
    create_animation : Proc(IDCompositionDevice2*, IDCompositionAnimation*, HRESULT)
  end

  IDCompositionDevice2_GUID = LibC::GUID.new("75f6468d-1b8e-447c-9bc6-75fea80b5b25")
  CLSID_IDCompositionDevice2 = "75f6468d-1b8e-447c-9bc6-75fea80b5b25"
  struct IDCompositionDevice2
    lpVtbl : IDCompositionDevice2VTbl*
  end

  struct IDCompositionDesktopDeviceVTbl
    query_interface : Proc(IDCompositionDesktopDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionDesktopDevice*, UInt32)
    release : Proc(IDCompositionDesktopDevice*, UInt32)
    commit : Proc(IDCompositionDesktopDevice*, HRESULT)
    wait_for_commit_completion : Proc(IDCompositionDesktopDevice*, HRESULT)
    get_frame_statistics : Proc(IDCompositionDesktopDevice*, DCOMPOSITION_FRAME_STATISTICS*, HRESULT)
    create_visual : Proc(IDCompositionDesktopDevice*, IDCompositionVisual2*, HRESULT)
    create_surface_factory : Proc(IDCompositionDesktopDevice*, IUnknown, IDCompositionSurfaceFactory*, HRESULT)
    create_surface : Proc(IDCompositionDesktopDevice*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)
    create_virtual_surface : Proc(IDCompositionDesktopDevice*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)
    create_translate_transform : Proc(IDCompositionDesktopDevice*, IDCompositionTranslateTransform*, HRESULT)
    create_scale_transform : Proc(IDCompositionDesktopDevice*, IDCompositionScaleTransform*, HRESULT)
    create_rotate_transform : Proc(IDCompositionDesktopDevice*, IDCompositionRotateTransform*, HRESULT)
    create_skew_transform : Proc(IDCompositionDesktopDevice*, IDCompositionSkewTransform*, HRESULT)
    create_matrix_transform : Proc(IDCompositionDesktopDevice*, IDCompositionMatrixTransform*, HRESULT)
    create_transform_group : Proc(IDCompositionDesktopDevice*, IDCompositionTransform*, UInt32, IDCompositionTransform*, HRESULT)
    create_translate_transform3_d : Proc(IDCompositionDesktopDevice*, IDCompositionTranslateTransform3D*, HRESULT)
    create_scale_transform3_d : Proc(IDCompositionDesktopDevice*, IDCompositionScaleTransform3D*, HRESULT)
    create_rotate_transform3_d : Proc(IDCompositionDesktopDevice*, IDCompositionRotateTransform3D*, HRESULT)
    create_matrix_transform3_d : Proc(IDCompositionDesktopDevice*, IDCompositionMatrixTransform3D*, HRESULT)
    create_transform3_d_group : Proc(IDCompositionDesktopDevice*, IDCompositionTransform3D*, UInt32, IDCompositionTransform3D*, HRESULT)
    create_effect_group : Proc(IDCompositionDesktopDevice*, IDCompositionEffectGroup*, HRESULT)
    create_rectangle_clip : Proc(IDCompositionDesktopDevice*, IDCompositionRectangleClip*, HRESULT)
    create_animation : Proc(IDCompositionDesktopDevice*, IDCompositionAnimation*, HRESULT)
    create_target_for_hwnd : Proc(IDCompositionDesktopDevice*, LibC::HANDLE, LibC::BOOL, IDCompositionTarget*, HRESULT)
    create_surface_from_handle : Proc(IDCompositionDesktopDevice*, LibC::HANDLE, IUnknown*, HRESULT)
    create_surface_from_hwnd : Proc(IDCompositionDesktopDevice*, LibC::HANDLE, IUnknown*, HRESULT)
  end

  IDCompositionDesktopDevice_GUID = LibC::GUID.new("5f4633fe-1e08-4cb8-8c75-ce24333f5602")
  CLSID_IDCompositionDesktopDevice = "5f4633fe-1e08-4cb8-8c75-ce24333f5602"
  struct IDCompositionDesktopDevice
    lpVtbl : IDCompositionDesktopDeviceVTbl*
  end

  struct IDCompositionDeviceDebugVTbl
    query_interface : Proc(IDCompositionDeviceDebug*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionDeviceDebug*, UInt32)
    release : Proc(IDCompositionDeviceDebug*, UInt32)
    enable_debug_counters : Proc(IDCompositionDeviceDebug*, HRESULT)
    disable_debug_counters : Proc(IDCompositionDeviceDebug*, HRESULT)
  end

  IDCompositionDeviceDebug_GUID = LibC::GUID.new("a1a3c64a-224f-4a81-9773-4f03a89d3c6c")
  CLSID_IDCompositionDeviceDebug = "a1a3c64a-224f-4a81-9773-4f03a89d3c6c"
  struct IDCompositionDeviceDebug
    lpVtbl : IDCompositionDeviceDebugVTbl*
  end

  struct IDCompositionSurfaceFactoryVTbl
    query_interface : Proc(IDCompositionSurfaceFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionSurfaceFactory*, UInt32)
    release : Proc(IDCompositionSurfaceFactory*, UInt32)
    create_surface : Proc(IDCompositionSurfaceFactory*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)
    create_virtual_surface : Proc(IDCompositionSurfaceFactory*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)
  end

  IDCompositionSurfaceFactory_GUID = LibC::GUID.new("e334bc12-3937-4e02-85eb-fcf4eb30d2c8")
  CLSID_IDCompositionSurfaceFactory = "e334bc12-3937-4e02-85eb-fcf4eb30d2c8"
  struct IDCompositionSurfaceFactory
    lpVtbl : IDCompositionSurfaceFactoryVTbl*
  end

  struct IDCompositionVisual2VTbl
    query_interface : Proc(IDCompositionVisual2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionVisual2*, UInt32)
    release : Proc(IDCompositionVisual2*, UInt32)
    set_offset_x : Proc(IDCompositionVisual2*, IDCompositionAnimation, HRESULT)
    set_offset_x2 : Proc(IDCompositionVisual2*, Float32, HRESULT)
    set_offset_y : Proc(IDCompositionVisual2*, IDCompositionAnimation, HRESULT)
    set_offset_y2 : Proc(IDCompositionVisual2*, Float32, HRESULT)
    set_transform : Proc(IDCompositionVisual2*, IDCompositionTransform, HRESULT)
    set_transform2 : Proc(IDCompositionVisual2*, D2D_MATRIX_3X2_F*, HRESULT)
    set_transform_parent : Proc(IDCompositionVisual2*, IDCompositionVisual, HRESULT)
    set_effect : Proc(IDCompositionVisual2*, IDCompositionEffect, HRESULT)
    set_bitmap_interpolation_mode : Proc(IDCompositionVisual2*, DCOMPOSITION_BITMAP_INTERPOLATION_MODE, HRESULT)
    set_border_mode : Proc(IDCompositionVisual2*, DCOMPOSITION_BORDER_MODE, HRESULT)
    set_clip : Proc(IDCompositionVisual2*, IDCompositionClip, HRESULT)
    set_clip2 : Proc(IDCompositionVisual2*, D2D_RECT_F*, HRESULT)
    set_content : Proc(IDCompositionVisual2*, IUnknown, HRESULT)
    add_visual : Proc(IDCompositionVisual2*, IDCompositionVisual, LibC::BOOL, IDCompositionVisual, HRESULT)
    remove_visual : Proc(IDCompositionVisual2*, IDCompositionVisual, HRESULT)
    remove_all_visuals : Proc(IDCompositionVisual2*, HRESULT)
    set_composite_mode : Proc(IDCompositionVisual2*, DCOMPOSITION_COMPOSITE_MODE, HRESULT)
    set_opacity_mode : Proc(IDCompositionVisual2*, DCOMPOSITION_OPACITY_MODE, HRESULT)
    set_back_face_visibility : Proc(IDCompositionVisual2*, DCOMPOSITION_BACKFACE_VISIBILITY, HRESULT)
  end

  IDCompositionVisual2_GUID = LibC::GUID.new("e8de1639-4331-4b26-bc5f-6a321d347a85")
  CLSID_IDCompositionVisual2 = "e8de1639-4331-4b26-bc5f-6a321d347a85"
  struct IDCompositionVisual2
    lpVtbl : IDCompositionVisual2VTbl*
  end

  struct IDCompositionVisualDebugVTbl
    query_interface : Proc(IDCompositionVisualDebug*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionVisualDebug*, UInt32)
    release : Proc(IDCompositionVisualDebug*, UInt32)
    set_offset_x : Proc(IDCompositionVisualDebug*, IDCompositionAnimation, HRESULT)
    set_offset_x2 : Proc(IDCompositionVisualDebug*, Float32, HRESULT)
    set_offset_y : Proc(IDCompositionVisualDebug*, IDCompositionAnimation, HRESULT)
    set_offset_y2 : Proc(IDCompositionVisualDebug*, Float32, HRESULT)
    set_transform : Proc(IDCompositionVisualDebug*, IDCompositionTransform, HRESULT)
    set_transform2 : Proc(IDCompositionVisualDebug*, D2D_MATRIX_3X2_F*, HRESULT)
    set_transform_parent : Proc(IDCompositionVisualDebug*, IDCompositionVisual, HRESULT)
    set_effect : Proc(IDCompositionVisualDebug*, IDCompositionEffect, HRESULT)
    set_bitmap_interpolation_mode : Proc(IDCompositionVisualDebug*, DCOMPOSITION_BITMAP_INTERPOLATION_MODE, HRESULT)
    set_border_mode : Proc(IDCompositionVisualDebug*, DCOMPOSITION_BORDER_MODE, HRESULT)
    set_clip : Proc(IDCompositionVisualDebug*, IDCompositionClip, HRESULT)
    set_clip2 : Proc(IDCompositionVisualDebug*, D2D_RECT_F*, HRESULT)
    set_content : Proc(IDCompositionVisualDebug*, IUnknown, HRESULT)
    add_visual : Proc(IDCompositionVisualDebug*, IDCompositionVisual, LibC::BOOL, IDCompositionVisual, HRESULT)
    remove_visual : Proc(IDCompositionVisualDebug*, IDCompositionVisual, HRESULT)
    remove_all_visuals : Proc(IDCompositionVisualDebug*, HRESULT)
    set_composite_mode : Proc(IDCompositionVisualDebug*, DCOMPOSITION_COMPOSITE_MODE, HRESULT)
    set_opacity_mode : Proc(IDCompositionVisualDebug*, DCOMPOSITION_OPACITY_MODE, HRESULT)
    set_back_face_visibility : Proc(IDCompositionVisualDebug*, DCOMPOSITION_BACKFACE_VISIBILITY, HRESULT)
    enable_heat_map : Proc(IDCompositionVisualDebug*, D2D1_COLOR_F*, HRESULT)
    disable_heat_map : Proc(IDCompositionVisualDebug*, HRESULT)
    enable_redraw_regions : Proc(IDCompositionVisualDebug*, HRESULT)
    disable_redraw_regions : Proc(IDCompositionVisualDebug*, HRESULT)
  end

  IDCompositionVisualDebug_GUID = LibC::GUID.new("fed2b808-5eb4-43a0-aea3-35f65280f91b")
  CLSID_IDCompositionVisualDebug = "fed2b808-5eb4-43a0-aea3-35f65280f91b"
  struct IDCompositionVisualDebug
    lpVtbl : IDCompositionVisualDebugVTbl*
  end

  struct IDCompositionVisual3VTbl
    query_interface : Proc(IDCompositionVisual3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionVisual3*, UInt32)
    release : Proc(IDCompositionVisual3*, UInt32)
    set_offset_x : Proc(IDCompositionVisual3*, IDCompositionAnimation, HRESULT)
    set_offset_x2 : Proc(IDCompositionVisual3*, Float32, HRESULT)
    set_offset_y : Proc(IDCompositionVisual3*, IDCompositionAnimation, HRESULT)
    set_offset_y2 : Proc(IDCompositionVisual3*, Float32, HRESULT)
    set_transform : Proc(IDCompositionVisual3*, IDCompositionTransform, HRESULT)
    set_transform2 : Proc(IDCompositionVisual3*, D2D_MATRIX_3X2_F*, HRESULT)
    set_transform_parent : Proc(IDCompositionVisual3*, IDCompositionVisual, HRESULT)
    set_effect : Proc(IDCompositionVisual3*, IDCompositionEffect, HRESULT)
    set_bitmap_interpolation_mode : Proc(IDCompositionVisual3*, DCOMPOSITION_BITMAP_INTERPOLATION_MODE, HRESULT)
    set_border_mode : Proc(IDCompositionVisual3*, DCOMPOSITION_BORDER_MODE, HRESULT)
    set_clip : Proc(IDCompositionVisual3*, IDCompositionClip, HRESULT)
    set_clip2 : Proc(IDCompositionVisual3*, D2D_RECT_F*, HRESULT)
    set_content : Proc(IDCompositionVisual3*, IUnknown, HRESULT)
    add_visual : Proc(IDCompositionVisual3*, IDCompositionVisual, LibC::BOOL, IDCompositionVisual, HRESULT)
    remove_visual : Proc(IDCompositionVisual3*, IDCompositionVisual, HRESULT)
    remove_all_visuals : Proc(IDCompositionVisual3*, HRESULT)
    set_composite_mode : Proc(IDCompositionVisual3*, DCOMPOSITION_COMPOSITE_MODE, HRESULT)
    set_opacity_mode : Proc(IDCompositionVisual3*, DCOMPOSITION_OPACITY_MODE, HRESULT)
    set_back_face_visibility : Proc(IDCompositionVisual3*, DCOMPOSITION_BACKFACE_VISIBILITY, HRESULT)
    enable_heat_map : Proc(IDCompositionVisual3*, D2D1_COLOR_F*, HRESULT)
    disable_heat_map : Proc(IDCompositionVisual3*, HRESULT)
    enable_redraw_regions : Proc(IDCompositionVisual3*, HRESULT)
    disable_redraw_regions : Proc(IDCompositionVisual3*, HRESULT)
    set_depth_mode : Proc(IDCompositionVisual3*, DCOMPOSITION_DEPTH_MODE, HRESULT)
    set_offset_z : Proc(IDCompositionVisual3*, IDCompositionAnimation, HRESULT)
    set_offset_z2 : Proc(IDCompositionVisual3*, Float32, HRESULT)
    set_opacity : Proc(IDCompositionVisual3*, IDCompositionAnimation, HRESULT)
    set_opacity2 : Proc(IDCompositionVisual3*, Float32, HRESULT)
    set_transform3 : Proc(IDCompositionVisual3*, IDCompositionTransform3D, HRESULT)
    set_transform22 : Proc(IDCompositionVisual3*, D2D_MATRIX_4X4_F*, HRESULT)
    set_visible : Proc(IDCompositionVisual3*, LibC::BOOL, HRESULT)
  end

  IDCompositionVisual3_GUID = LibC::GUID.new("2775f462-b6c1-4015-b0be-b3e7d6a4976d")
  CLSID_IDCompositionVisual3 = "2775f462-b6c1-4015-b0be-b3e7d6a4976d"
  struct IDCompositionVisual3
    lpVtbl : IDCompositionVisual3VTbl*
  end

  struct IDCompositionDevice3VTbl
    query_interface : Proc(IDCompositionDevice3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionDevice3*, UInt32)
    release : Proc(IDCompositionDevice3*, UInt32)
    commit : Proc(IDCompositionDevice3*, HRESULT)
    wait_for_commit_completion : Proc(IDCompositionDevice3*, HRESULT)
    get_frame_statistics : Proc(IDCompositionDevice3*, DCOMPOSITION_FRAME_STATISTICS*, HRESULT)
    create_visual : Proc(IDCompositionDevice3*, IDCompositionVisual2*, HRESULT)
    create_surface_factory : Proc(IDCompositionDevice3*, IUnknown, IDCompositionSurfaceFactory*, HRESULT)
    create_surface : Proc(IDCompositionDevice3*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionSurface*, HRESULT)
    create_virtual_surface : Proc(IDCompositionDevice3*, UInt32, UInt32, DXGI_FORMAT, DXGI_ALPHA_MODE, IDCompositionVirtualSurface*, HRESULT)
    create_translate_transform : Proc(IDCompositionDevice3*, IDCompositionTranslateTransform*, HRESULT)
    create_scale_transform : Proc(IDCompositionDevice3*, IDCompositionScaleTransform*, HRESULT)
    create_rotate_transform : Proc(IDCompositionDevice3*, IDCompositionRotateTransform*, HRESULT)
    create_skew_transform : Proc(IDCompositionDevice3*, IDCompositionSkewTransform*, HRESULT)
    create_matrix_transform : Proc(IDCompositionDevice3*, IDCompositionMatrixTransform*, HRESULT)
    create_transform_group : Proc(IDCompositionDevice3*, IDCompositionTransform*, UInt32, IDCompositionTransform*, HRESULT)
    create_translate_transform3_d : Proc(IDCompositionDevice3*, IDCompositionTranslateTransform3D*, HRESULT)
    create_scale_transform3_d : Proc(IDCompositionDevice3*, IDCompositionScaleTransform3D*, HRESULT)
    create_rotate_transform3_d : Proc(IDCompositionDevice3*, IDCompositionRotateTransform3D*, HRESULT)
    create_matrix_transform3_d : Proc(IDCompositionDevice3*, IDCompositionMatrixTransform3D*, HRESULT)
    create_transform3_d_group : Proc(IDCompositionDevice3*, IDCompositionTransform3D*, UInt32, IDCompositionTransform3D*, HRESULT)
    create_effect_group : Proc(IDCompositionDevice3*, IDCompositionEffectGroup*, HRESULT)
    create_rectangle_clip : Proc(IDCompositionDevice3*, IDCompositionRectangleClip*, HRESULT)
    create_animation : Proc(IDCompositionDevice3*, IDCompositionAnimation*, HRESULT)
    create_gaussian_blur_effect : Proc(IDCompositionDevice3*, IDCompositionGaussianBlurEffect*, HRESULT)
    create_brightness_effect : Proc(IDCompositionDevice3*, IDCompositionBrightnessEffect*, HRESULT)
    create_color_matrix_effect : Proc(IDCompositionDevice3*, IDCompositionColorMatrixEffect*, HRESULT)
    create_shadow_effect : Proc(IDCompositionDevice3*, IDCompositionShadowEffect*, HRESULT)
    create_hue_rotation_effect : Proc(IDCompositionDevice3*, IDCompositionHueRotationEffect*, HRESULT)
    create_saturation_effect : Proc(IDCompositionDevice3*, IDCompositionSaturationEffect*, HRESULT)
    create_turbulence_effect : Proc(IDCompositionDevice3*, IDCompositionTurbulenceEffect*, HRESULT)
    create_linear_transfer_effect : Proc(IDCompositionDevice3*, IDCompositionLinearTransferEffect*, HRESULT)
    create_table_transfer_effect : Proc(IDCompositionDevice3*, IDCompositionTableTransferEffect*, HRESULT)
    create_composite_effect : Proc(IDCompositionDevice3*, IDCompositionCompositeEffect*, HRESULT)
    create_blend_effect : Proc(IDCompositionDevice3*, IDCompositionBlendEffect*, HRESULT)
    create_arithmetic_composite_effect : Proc(IDCompositionDevice3*, IDCompositionArithmeticCompositeEffect*, HRESULT)
    create_affine_transform2_d_effect : Proc(IDCompositionDevice3*, IDCompositionAffineTransform2DEffect*, HRESULT)
  end

  IDCompositionDevice3_GUID = LibC::GUID.new("0987cb06-f916-48bf-8d35-ce7641781bd9")
  CLSID_IDCompositionDevice3 = "0987cb06-f916-48bf-8d35-ce7641781bd9"
  struct IDCompositionDevice3
    lpVtbl : IDCompositionDevice3VTbl*
  end

  struct IDCompositionFilterEffectVTbl
    query_interface : Proc(IDCompositionFilterEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionFilterEffect*, UInt32)
    release : Proc(IDCompositionFilterEffect*, UInt32)
    set_input : Proc(IDCompositionFilterEffect*, UInt32, IUnknown, UInt32, HRESULT)
  end

  IDCompositionFilterEffect_GUID = LibC::GUID.new("30c421d5-8cb2-4e9f-b133-37be270d4ac2")
  CLSID_IDCompositionFilterEffect = "30c421d5-8cb2-4e9f-b133-37be270d4ac2"
  struct IDCompositionFilterEffect
    lpVtbl : IDCompositionFilterEffectVTbl*
  end

  struct IDCompositionGaussianBlurEffectVTbl
    query_interface : Proc(IDCompositionGaussianBlurEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionGaussianBlurEffect*, UInt32)
    release : Proc(IDCompositionGaussianBlurEffect*, UInt32)
    set_input : Proc(IDCompositionGaussianBlurEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_standard_deviation : Proc(IDCompositionGaussianBlurEffect*, IDCompositionAnimation, HRESULT)
    set_standard_deviation2 : Proc(IDCompositionGaussianBlurEffect*, Float32, HRESULT)
    set_border_mode : Proc(IDCompositionGaussianBlurEffect*, D2D1_BORDER_MODE, HRESULT)
  end

  IDCompositionGaussianBlurEffect_GUID = LibC::GUID.new("45d4d0b7-1bd4-454e-8894-2bfa68443033")
  CLSID_IDCompositionGaussianBlurEffect = "45d4d0b7-1bd4-454e-8894-2bfa68443033"
  struct IDCompositionGaussianBlurEffect
    lpVtbl : IDCompositionGaussianBlurEffectVTbl*
  end

  struct IDCompositionBrightnessEffectVTbl
    query_interface : Proc(IDCompositionBrightnessEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionBrightnessEffect*, UInt32)
    release : Proc(IDCompositionBrightnessEffect*, UInt32)
    set_input : Proc(IDCompositionBrightnessEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_white_point : Proc(IDCompositionBrightnessEffect*, D2D_VECTOR_2F*, HRESULT)
    set_black_point : Proc(IDCompositionBrightnessEffect*, D2D_VECTOR_2F*, HRESULT)
    set_white_point_x : Proc(IDCompositionBrightnessEffect*, IDCompositionAnimation, HRESULT)
    set_white_point_x2 : Proc(IDCompositionBrightnessEffect*, Float32, HRESULT)
    set_white_point_y : Proc(IDCompositionBrightnessEffect*, IDCompositionAnimation, HRESULT)
    set_white_point_y2 : Proc(IDCompositionBrightnessEffect*, Float32, HRESULT)
    set_black_point_x : Proc(IDCompositionBrightnessEffect*, IDCompositionAnimation, HRESULT)
    set_black_point_x2 : Proc(IDCompositionBrightnessEffect*, Float32, HRESULT)
    set_black_point_y : Proc(IDCompositionBrightnessEffect*, IDCompositionAnimation, HRESULT)
    set_black_point_y2 : Proc(IDCompositionBrightnessEffect*, Float32, HRESULT)
  end

  IDCompositionBrightnessEffect_GUID = LibC::GUID.new("6027496e-cb3a-49ab-934f-d798da4f7da6")
  CLSID_IDCompositionBrightnessEffect = "6027496e-cb3a-49ab-934f-d798da4f7da6"
  struct IDCompositionBrightnessEffect
    lpVtbl : IDCompositionBrightnessEffectVTbl*
  end

  struct IDCompositionColorMatrixEffectVTbl
    query_interface : Proc(IDCompositionColorMatrixEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionColorMatrixEffect*, UInt32)
    release : Proc(IDCompositionColorMatrixEffect*, UInt32)
    set_input : Proc(IDCompositionColorMatrixEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_matrix : Proc(IDCompositionColorMatrixEffect*, D2D_MATRIX_5X4_F*, HRESULT)
    set_matrix_element : Proc(IDCompositionColorMatrixEffect*, Int32, Int32, IDCompositionAnimation, HRESULT)
    set_matrix_element2 : Proc(IDCompositionColorMatrixEffect*, Int32, Int32, Float32, HRESULT)
    set_alpha_mode : Proc(IDCompositionColorMatrixEffect*, D2D1_COLORMATRIX_ALPHA_MODE, HRESULT)
    set_clamp_output : Proc(IDCompositionColorMatrixEffect*, LibC::BOOL, HRESULT)
  end

  IDCompositionColorMatrixEffect_GUID = LibC::GUID.new("c1170a22-3ce2-4966-90d4-55408bfc84c4")
  CLSID_IDCompositionColorMatrixEffect = "c1170a22-3ce2-4966-90d4-55408bfc84c4"
  struct IDCompositionColorMatrixEffect
    lpVtbl : IDCompositionColorMatrixEffectVTbl*
  end

  struct IDCompositionShadowEffectVTbl
    query_interface : Proc(IDCompositionShadowEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionShadowEffect*, UInt32)
    release : Proc(IDCompositionShadowEffect*, UInt32)
    set_input : Proc(IDCompositionShadowEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_standard_deviation : Proc(IDCompositionShadowEffect*, IDCompositionAnimation, HRESULT)
    set_standard_deviation2 : Proc(IDCompositionShadowEffect*, Float32, HRESULT)
    set_color : Proc(IDCompositionShadowEffect*, D2D_VECTOR_4F*, HRESULT)
    set_red : Proc(IDCompositionShadowEffect*, IDCompositionAnimation, HRESULT)
    set_red2 : Proc(IDCompositionShadowEffect*, Float32, HRESULT)
    set_green : Proc(IDCompositionShadowEffect*, IDCompositionAnimation, HRESULT)
    set_green2 : Proc(IDCompositionShadowEffect*, Float32, HRESULT)
    set_blue : Proc(IDCompositionShadowEffect*, IDCompositionAnimation, HRESULT)
    set_blue2 : Proc(IDCompositionShadowEffect*, Float32, HRESULT)
    set_alpha : Proc(IDCompositionShadowEffect*, IDCompositionAnimation, HRESULT)
    set_alpha2 : Proc(IDCompositionShadowEffect*, Float32, HRESULT)
  end

  IDCompositionShadowEffect_GUID = LibC::GUID.new("4ad18ac0-cfd2-4c2f-bb62-96e54fdb6879")
  CLSID_IDCompositionShadowEffect = "4ad18ac0-cfd2-4c2f-bb62-96e54fdb6879"
  struct IDCompositionShadowEffect
    lpVtbl : IDCompositionShadowEffectVTbl*
  end

  struct IDCompositionHueRotationEffectVTbl
    query_interface : Proc(IDCompositionHueRotationEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionHueRotationEffect*, UInt32)
    release : Proc(IDCompositionHueRotationEffect*, UInt32)
    set_input : Proc(IDCompositionHueRotationEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_angle : Proc(IDCompositionHueRotationEffect*, IDCompositionAnimation, HRESULT)
    set_angle2 : Proc(IDCompositionHueRotationEffect*, Float32, HRESULT)
  end

  IDCompositionHueRotationEffect_GUID = LibC::GUID.new("6db9f920-0770-4781-b0c6-381912f9d167")
  CLSID_IDCompositionHueRotationEffect = "6db9f920-0770-4781-b0c6-381912f9d167"
  struct IDCompositionHueRotationEffect
    lpVtbl : IDCompositionHueRotationEffectVTbl*
  end

  struct IDCompositionSaturationEffectVTbl
    query_interface : Proc(IDCompositionSaturationEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionSaturationEffect*, UInt32)
    release : Proc(IDCompositionSaturationEffect*, UInt32)
    set_input : Proc(IDCompositionSaturationEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_saturation : Proc(IDCompositionSaturationEffect*, IDCompositionAnimation, HRESULT)
    set_saturation2 : Proc(IDCompositionSaturationEffect*, Float32, HRESULT)
  end

  IDCompositionSaturationEffect_GUID = LibC::GUID.new("a08debda-3258-4fa4-9f16-9174d3fe93b1")
  CLSID_IDCompositionSaturationEffect = "a08debda-3258-4fa4-9f16-9174d3fe93b1"
  struct IDCompositionSaturationEffect
    lpVtbl : IDCompositionSaturationEffectVTbl*
  end

  struct IDCompositionTurbulenceEffectVTbl
    query_interface : Proc(IDCompositionTurbulenceEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionTurbulenceEffect*, UInt32)
    release : Proc(IDCompositionTurbulenceEffect*, UInt32)
    set_input : Proc(IDCompositionTurbulenceEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_offset : Proc(IDCompositionTurbulenceEffect*, D2D_VECTOR_2F*, HRESULT)
    set_base_frequency : Proc(IDCompositionTurbulenceEffect*, D2D_VECTOR_2F*, HRESULT)
    set_size : Proc(IDCompositionTurbulenceEffect*, D2D_VECTOR_2F*, HRESULT)
    set_num_octaves : Proc(IDCompositionTurbulenceEffect*, UInt32, HRESULT)
    set_seed : Proc(IDCompositionTurbulenceEffect*, UInt32, HRESULT)
    set_noise : Proc(IDCompositionTurbulenceEffect*, D2D1_TURBULENCE_NOISE, HRESULT)
    set_stitchable : Proc(IDCompositionTurbulenceEffect*, LibC::BOOL, HRESULT)
  end

  IDCompositionTurbulenceEffect_GUID = LibC::GUID.new("a6a55bda-c09c-49f3-9193-a41922c89715")
  CLSID_IDCompositionTurbulenceEffect = "a6a55bda-c09c-49f3-9193-a41922c89715"
  struct IDCompositionTurbulenceEffect
    lpVtbl : IDCompositionTurbulenceEffectVTbl*
  end

  struct IDCompositionLinearTransferEffectVTbl
    query_interface : Proc(IDCompositionLinearTransferEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionLinearTransferEffect*, UInt32)
    release : Proc(IDCompositionLinearTransferEffect*, UInt32)
    set_input : Proc(IDCompositionLinearTransferEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_red_y_intercept : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_red_y_intercept2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_red_slope : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_red_slope2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_red_disable : Proc(IDCompositionLinearTransferEffect*, LibC::BOOL, HRESULT)
    set_green_y_intercept : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_green_y_intercept2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_green_slope : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_green_slope2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_green_disable : Proc(IDCompositionLinearTransferEffect*, LibC::BOOL, HRESULT)
    set_blue_y_intercept : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_blue_y_intercept2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_blue_slope : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_blue_slope2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_blue_disable : Proc(IDCompositionLinearTransferEffect*, LibC::BOOL, HRESULT)
    set_alpha_y_intercept : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_alpha_y_intercept2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_alpha_slope : Proc(IDCompositionLinearTransferEffect*, IDCompositionAnimation, HRESULT)
    set_alpha_slope2 : Proc(IDCompositionLinearTransferEffect*, Float32, HRESULT)
    set_alpha_disable : Proc(IDCompositionLinearTransferEffect*, LibC::BOOL, HRESULT)
    set_clamp_output : Proc(IDCompositionLinearTransferEffect*, LibC::BOOL, HRESULT)
  end

  IDCompositionLinearTransferEffect_GUID = LibC::GUID.new("4305ee5b-c4a0-4c88-9385-67124e017683")
  CLSID_IDCompositionLinearTransferEffect = "4305ee5b-c4a0-4c88-9385-67124e017683"
  struct IDCompositionLinearTransferEffect
    lpVtbl : IDCompositionLinearTransferEffectVTbl*
  end

  struct IDCompositionTableTransferEffectVTbl
    query_interface : Proc(IDCompositionTableTransferEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionTableTransferEffect*, UInt32)
    release : Proc(IDCompositionTableTransferEffect*, UInt32)
    set_input : Proc(IDCompositionTableTransferEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_red_table : Proc(IDCompositionTableTransferEffect*, Float32*, UInt32, HRESULT)
    set_green_table : Proc(IDCompositionTableTransferEffect*, Float32*, UInt32, HRESULT)
    set_blue_table : Proc(IDCompositionTableTransferEffect*, Float32*, UInt32, HRESULT)
    set_alpha_table : Proc(IDCompositionTableTransferEffect*, Float32*, UInt32, HRESULT)
    set_red_disable : Proc(IDCompositionTableTransferEffect*, LibC::BOOL, HRESULT)
    set_green_disable : Proc(IDCompositionTableTransferEffect*, LibC::BOOL, HRESULT)
    set_blue_disable : Proc(IDCompositionTableTransferEffect*, LibC::BOOL, HRESULT)
    set_alpha_disable : Proc(IDCompositionTableTransferEffect*, LibC::BOOL, HRESULT)
    set_clamp_output : Proc(IDCompositionTableTransferEffect*, LibC::BOOL, HRESULT)
    set_red_table_value : Proc(IDCompositionTableTransferEffect*, UInt32, IDCompositionAnimation, HRESULT)
    set_red_table_value2 : Proc(IDCompositionTableTransferEffect*, UInt32, Float32, HRESULT)
    set_green_table_value : Proc(IDCompositionTableTransferEffect*, UInt32, IDCompositionAnimation, HRESULT)
    set_green_table_value2 : Proc(IDCompositionTableTransferEffect*, UInt32, Float32, HRESULT)
    set_blue_table_value : Proc(IDCompositionTableTransferEffect*, UInt32, IDCompositionAnimation, HRESULT)
    set_blue_table_value2 : Proc(IDCompositionTableTransferEffect*, UInt32, Float32, HRESULT)
    set_alpha_table_value : Proc(IDCompositionTableTransferEffect*, UInt32, IDCompositionAnimation, HRESULT)
    set_alpha_table_value2 : Proc(IDCompositionTableTransferEffect*, UInt32, Float32, HRESULT)
  end

  IDCompositionTableTransferEffect_GUID = LibC::GUID.new("9b7e82e2-69c5-4eb4-a5f5-a7033f5132cd")
  CLSID_IDCompositionTableTransferEffect = "9b7e82e2-69c5-4eb4-a5f5-a7033f5132cd"
  struct IDCompositionTableTransferEffect
    lpVtbl : IDCompositionTableTransferEffectVTbl*
  end

  struct IDCompositionCompositeEffectVTbl
    query_interface : Proc(IDCompositionCompositeEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionCompositeEffect*, UInt32)
    release : Proc(IDCompositionCompositeEffect*, UInt32)
    set_input : Proc(IDCompositionCompositeEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_mode : Proc(IDCompositionCompositeEffect*, D2D1_COMPOSITE_MODE, HRESULT)
  end

  IDCompositionCompositeEffect_GUID = LibC::GUID.new("576616c0-a231-494d-a38d-00fd5ec4db46")
  CLSID_IDCompositionCompositeEffect = "576616c0-a231-494d-a38d-00fd5ec4db46"
  struct IDCompositionCompositeEffect
    lpVtbl : IDCompositionCompositeEffectVTbl*
  end

  struct IDCompositionBlendEffectVTbl
    query_interface : Proc(IDCompositionBlendEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionBlendEffect*, UInt32)
    release : Proc(IDCompositionBlendEffect*, UInt32)
    set_input : Proc(IDCompositionBlendEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_mode : Proc(IDCompositionBlendEffect*, D2D1_BLEND_MODE, HRESULT)
  end

  IDCompositionBlendEffect_GUID = LibC::GUID.new("33ecdc0a-578a-4a11-9c14-0cb90517f9c5")
  CLSID_IDCompositionBlendEffect = "33ecdc0a-578a-4a11-9c14-0cb90517f9c5"
  struct IDCompositionBlendEffect
    lpVtbl : IDCompositionBlendEffectVTbl*
  end

  struct IDCompositionArithmeticCompositeEffectVTbl
    query_interface : Proc(IDCompositionArithmeticCompositeEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionArithmeticCompositeEffect*, UInt32)
    release : Proc(IDCompositionArithmeticCompositeEffect*, UInt32)
    set_input : Proc(IDCompositionArithmeticCompositeEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_coefficients : Proc(IDCompositionArithmeticCompositeEffect*, D2D_VECTOR_4F*, HRESULT)
    set_clamp_output : Proc(IDCompositionArithmeticCompositeEffect*, LibC::BOOL, HRESULT)
    set_coefficient1 : Proc(IDCompositionArithmeticCompositeEffect*, IDCompositionAnimation, HRESULT)
    set_coefficient12 : Proc(IDCompositionArithmeticCompositeEffect*, Float32, HRESULT)
    set_coefficient2 : Proc(IDCompositionArithmeticCompositeEffect*, IDCompositionAnimation, HRESULT)
    set_coefficient22 : Proc(IDCompositionArithmeticCompositeEffect*, Float32, HRESULT)
    set_coefficient3 : Proc(IDCompositionArithmeticCompositeEffect*, IDCompositionAnimation, HRESULT)
    set_coefficient32 : Proc(IDCompositionArithmeticCompositeEffect*, Float32, HRESULT)
    set_coefficient4 : Proc(IDCompositionArithmeticCompositeEffect*, IDCompositionAnimation, HRESULT)
    set_coefficient42 : Proc(IDCompositionArithmeticCompositeEffect*, Float32, HRESULT)
  end

  IDCompositionArithmeticCompositeEffect_GUID = LibC::GUID.new("3b67dfa8-e3dd-4e61-b640-46c2f3d739dc")
  CLSID_IDCompositionArithmeticCompositeEffect = "3b67dfa8-e3dd-4e61-b640-46c2f3d739dc"
  struct IDCompositionArithmeticCompositeEffect
    lpVtbl : IDCompositionArithmeticCompositeEffectVTbl*
  end

  struct IDCompositionAffineTransform2DEffectVTbl
    query_interface : Proc(IDCompositionAffineTransform2DEffect*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionAffineTransform2DEffect*, UInt32)
    release : Proc(IDCompositionAffineTransform2DEffect*, UInt32)
    set_input : Proc(IDCompositionAffineTransform2DEffect*, UInt32, IUnknown, UInt32, HRESULT)
    set_interpolation_mode : Proc(IDCompositionAffineTransform2DEffect*, D2D1_2DAFFINETRANSFORM_INTERPOLATION_MODE, HRESULT)
    set_border_mode : Proc(IDCompositionAffineTransform2DEffect*, D2D1_BORDER_MODE, HRESULT)
    set_transform_matrix : Proc(IDCompositionAffineTransform2DEffect*, D2D_MATRIX_3X2_F*, HRESULT)
    set_transform_matrix_element : Proc(IDCompositionAffineTransform2DEffect*, Int32, Int32, IDCompositionAnimation, HRESULT)
    set_transform_matrix_element2 : Proc(IDCompositionAffineTransform2DEffect*, Int32, Int32, Float32, HRESULT)
    set_sharpness : Proc(IDCompositionAffineTransform2DEffect*, IDCompositionAnimation, HRESULT)
    set_sharpness2 : Proc(IDCompositionAffineTransform2DEffect*, Float32, HRESULT)
  end

  IDCompositionAffineTransform2DEffect_GUID = LibC::GUID.new("0b74b9e8-cdd6-492f-bbbc-5ed32157026d")
  CLSID_IDCompositionAffineTransform2DEffect = "0b74b9e8-cdd6-492f-bbbc-5ed32157026d"
  struct IDCompositionAffineTransform2DEffect
    lpVtbl : IDCompositionAffineTransform2DEffectVTbl*
  end

  struct IDCompositionDelegatedInkTrailVTbl
    query_interface : Proc(IDCompositionDelegatedInkTrail*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionDelegatedInkTrail*, UInt32)
    release : Proc(IDCompositionDelegatedInkTrail*, UInt32)
    add_trail_points : Proc(IDCompositionDelegatedInkTrail*, DCompositionInkTrailPoint*, UInt32, UInt32*, HRESULT)
    add_trail_points_with_prediction : Proc(IDCompositionDelegatedInkTrail*, DCompositionInkTrailPoint*, UInt32, DCompositionInkTrailPoint*, UInt32, UInt32*, HRESULT)
    remove_trail_points : Proc(IDCompositionDelegatedInkTrail*, UInt32, HRESULT)
    start_new_trail : Proc(IDCompositionDelegatedInkTrail*, D2D1_COLOR_F*, HRESULT)
  end

  IDCompositionDelegatedInkTrail_GUID = LibC::GUID.new("c2448e9b-547d-4057-8cf5-8144ede1c2da")
  CLSID_IDCompositionDelegatedInkTrail = "c2448e9b-547d-4057-8cf5-8144ede1c2da"
  struct IDCompositionDelegatedInkTrail
    lpVtbl : IDCompositionDelegatedInkTrailVTbl*
  end

  struct IDCompositionInkTrailDeviceVTbl
    query_interface : Proc(IDCompositionInkTrailDevice*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDCompositionInkTrailDevice*, UInt32)
    release : Proc(IDCompositionInkTrailDevice*, UInt32)
    create_delegated_ink_trail : Proc(IDCompositionInkTrailDevice*, IDCompositionDelegatedInkTrail*, HRESULT)
    create_delegated_ink_trail_for_swap_chain : Proc(IDCompositionInkTrailDevice*, IUnknown, IDCompositionDelegatedInkTrail*, HRESULT)
  end

  IDCompositionInkTrailDevice_GUID = LibC::GUID.new("df0c7cec-cdeb-4d4a-b91c-721bf22f4e6c")
  CLSID_IDCompositionInkTrailDevice = "df0c7cec-cdeb-4d4a-b91c-721bf22f4e6c"
  struct IDCompositionInkTrailDevice
    lpVtbl : IDCompositionInkTrailDeviceVTbl*
  end


  # Params # dxgidevice : IDXGIDevice [In],iid : Guid* [In],dcompositiondevice : Void** [In]
  fun DCompositionCreateDevice(dxgidevice : IDXGIDevice, iid : Guid*, dcompositiondevice : Void**) : HRESULT

  # Params # renderingdevice : IUnknown [In],iid : Guid* [In],dcompositiondevice : Void** [In]
  fun DCompositionCreateDevice2(renderingdevice : IUnknown, iid : Guid*, dcompositiondevice : Void**) : HRESULT

  # Params # renderingdevice : IUnknown [In],iid : Guid* [In],dcompositiondevice : Void** [In]
  fun DCompositionCreateDevice3(renderingdevice : IUnknown, iid : Guid*, dcompositiondevice : Void**) : HRESULT

  # Params # desiredaccess : UInt32 [In],securityattributes : SECURITY_ATTRIBUTES* [In],surfacehandle : LibC::HANDLE* [In]
  fun DCompositionCreateSurfaceHandle(desiredaccess : UInt32, securityattributes : SECURITY_ATTRIBUTES*, surfacehandle : LibC::HANDLE*) : HRESULT

  # Params # visual : IDCompositionVisual [In],hwnd : LibC::HANDLE [In],enable : LibC::BOOL [In]
  fun DCompositionAttachMouseWheelToHwnd(visual : IDCompositionVisual, hwnd : LibC::HANDLE, enable : LibC::BOOL) : HRESULT

  # Params # visual : IDCompositionVisual [In],hwnd : LibC::HANDLE [In],enable : LibC::BOOL [In]
  fun DCompositionAttachMouseDragToHwnd(visual : IDCompositionVisual, hwnd : LibC::HANDLE, enable : LibC::BOOL) : HRESULT

  # Params # frameidtype : COMPOSITION_FRAME_ID_TYPE [In],frameid : UInt64* [In]
  fun DCompositionGetFrameId(frameidtype : COMPOSITION_FRAME_ID_TYPE, frameid : UInt64*) : HRESULT

  # Params # frameid : UInt64 [In],framestats : COMPOSITION_FRAME_STATS* [In],targetidcount : UInt32 [In],targetids : COMPOSITION_TARGET_ID* [In],actualtargetidcount : UInt32* [In]
  fun DCompositionGetStatistics(frameid : UInt64, framestats : COMPOSITION_FRAME_STATS*, targetidcount : UInt32, targetids : COMPOSITION_TARGET_ID*, actualtargetidcount : UInt32*) : HRESULT

  # Params # frameid : UInt64 [In],targetid : COMPOSITION_TARGET_ID* [In],targetstats : COMPOSITION_TARGET_STATS* [In]
  fun DCompositionGetTargetStatistics(frameid : UInt64, targetid : COMPOSITION_TARGET_ID*, targetstats : COMPOSITION_TARGET_STATS*) : HRESULT

  # Params # enable : LibC::BOOL [In]
  fun DCompositionBoostCompositorClock(enable : LibC::BOOL) : HRESULT

  # Params # count : UInt32 [In],handles : LibC::HANDLE* [In],timeoutinms : UInt32 [In]
  fun DCompositionWaitForCompositorClock(count : UInt32, handles : LibC::HANDLE*, timeoutinms : UInt32) : UInt32
end
