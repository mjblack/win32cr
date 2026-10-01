require "./../../foundation.cr"
require "./../../system/com.cr"

module Win32cr::UI::Input::GameInput
  extend self
  alias GameInputReadingCallback = Proc(UInt64, Void*, Void*, Bool, Void)

  alias GameInputDeviceCallback = Proc(UInt64, Void*, Void*, UInt64, Win32cr::UI::Input::GameInput::GameInputDeviceStatus, Win32cr::UI::Input::GameInput::GameInputDeviceStatus, Void)

  alias GameInputSystemButtonCallback = Proc(UInt64, Void*, Void*, UInt64, Win32cr::UI::Input::GameInput::GameInputSystemButtons, Win32cr::UI::Input::GameInput::GameInputSystemButtons, Void)

  alias GameInputKeyboardLayoutCallback = Proc(UInt64, Void*, Void*, UInt64, UInt32, UInt32, Void)

  FACILITY_GAMEINPUT = 906_u32
  GAMEINPUT_E_DEVICE_DISCONNECTED = -2088108031_i32
  GAMEINPUT_E_DEVICE_NOT_FOUND = -2088108030_i32
  GAMEINPUT_E_READING_NOT_FOUND = -2088108029_i32
  GAMEINPUT_E_REFERENCE_READING_TOO_OLD = -2088108028_i32
  GAMEINPUT_E_TIMESTAMP_OUT_OF_RANGE = -2088108027_i32
  GAMEINPUT_E_INSUFFICIENT_FORCE_FEEDBACK_RESOURCES = -2088108026_i32

  @[Flags]
  enum GameInputKind
    GameInputKindUnknown = 0_i32
    GameInputKindRawDeviceReport = 1_i32
    GameInputKindControllerAxis = 2_i32
    GameInputKindControllerButton = 4_i32
    GameInputKindControllerSwitch = 8_i32
    GameInputKindController = 14_i32
    GameInputKindKeyboard = 16_i32
    GameInputKindMouse = 32_i32
    GameInputKindTouch = 256_i32
    GameInputKindMotion = 4096_i32
    GameInputKindArcadeStick = 65536_i32
    GameInputKindFlightStick = 131072_i32
    GameInputKindGamepad = 262144_i32
    GameInputKindRacingWheel = 524288_i32
    GameInputKindUiNavigation = 16777216_i32
  end
  enum GameInputEnumerationKind
    GameInputNoEnumeration = 0_i32
    GameInputAsyncEnumeration = 1_i32
    GameInputBlockingEnumeration = 2_i32
  end
  @[Flags]
  enum GameInputFocusPolicy
    GameInputDefaultFocusPolicy = 0_i32
    GameInputDisableBackgroundInput = 1_i32
    GameInputExclusiveForegroundInput = 2_i32
    GameInputDisableBackgroundGuideButton = 4_i32
    GameInputExclusiveForegroundGuideButton = 8_i32
    GameInputDisableBackgroundShareButton = 16_i32
    GameInputExclusiveForegroundShareButton = 32_i32
  end
  enum GameInputSwitchKind
    GameInputUnknownSwitchKind = -1_i32
    GameInput2WaySwitch = 0_i32
    GameInput4WaySwitch = 1_i32
    GameInput8WaySwitch = 2_i32
  end
  enum GameInputSwitchPosition
    GameInputSwitchCenter = 0_i32
    GameInputSwitchUp = 1_i32
    GameInputSwitchUpRight = 2_i32
    GameInputSwitchRight = 3_i32
    GameInputSwitchDownRight = 4_i32
    GameInputSwitchDown = 5_i32
    GameInputSwitchDownLeft = 6_i32
    GameInputSwitchLeft = 7_i32
    GameInputSwitchUpLeft = 8_i32
  end
  enum GameInputKeyboardKind
    GameInputUnknownKeyboard = -1_i32
    GameInputAnsiKeyboard = 0_i32
    GameInputIsoKeyboard = 1_i32
    GameInputKsKeyboard = 2_i32
    GameInputAbntKeyboard = 3_i32
    GameInputJisKeyboard = 4_i32
  end
  @[Flags]
  enum GameInputMouseButtons
    GameInputMouseNone = 0_i32
    GameInputMouseLeftButton = 1_i32
    GameInputMouseRightButton = 2_i32
    GameInputMouseMiddleButton = 4_i32
    GameInputMouseButton4 = 8_i32
    GameInputMouseButton5 = 16_i32
    GameInputMouseWheelTiltLeft = 32_i32
    GameInputMouseWheelTiltRight = 64_i32
  end
  enum GameInputTouchShape
    GameInputTouchShapeUnknown = -1_i32
    GameInputTouchShapePoint = 0_i32
    GameInputTouchShape1DLinear = 1_i32
    GameInputTouchShape1DRadial = 2_i32
    GameInputTouchShape1DIrregular = 3_i32
    GameInputTouchShape2DRectangular = 4_i32
    GameInputTouchShape2DElliptical = 5_i32
    GameInputTouchShape2DIrregular = 6_i32
  end
  enum GameInputMotionAccuracy
    GameInputMotionAccuracyUnknown = -1_i32
    GameInputMotionUnavailable = 0_i32
    GameInputMotionUnreliable = 1_i32
    GameInputMotionApproximate = 2_i32
    GameInputMotionAccurate = 3_i32
  end
  @[Flags]
  enum GameInputArcadeStickButtons
    GameInputArcadeStickNone = 0_i32
    GameInputArcadeStickMenu = 1_i32
    GameInputArcadeStickView = 2_i32
    GameInputArcadeStickUp = 4_i32
    GameInputArcadeStickDown = 8_i32
    GameInputArcadeStickLeft = 16_i32
    GameInputArcadeStickRight = 32_i32
    GameInputArcadeStickAction1 = 64_i32
    GameInputArcadeStickAction2 = 128_i32
    GameInputArcadeStickAction3 = 256_i32
    GameInputArcadeStickAction4 = 512_i32
    GameInputArcadeStickAction5 = 1024_i32
    GameInputArcadeStickAction6 = 2048_i32
    GameInputArcadeStickSpecial1 = 4096_i32
    GameInputArcadeStickSpecial2 = 8192_i32
  end
  @[Flags]
  enum GameInputFlightStickButtons
    GameInputFlightStickNone = 0_i32
    GameInputFlightStickMenu = 1_i32
    GameInputFlightStickView = 2_i32
    GameInputFlightStickFirePrimary = 4_i32
    GameInputFlightStickFireSecondary = 8_i32
  end
  @[Flags]
  enum GameInputGamepadButtons
    GameInputGamepadNone = 0_i32
    GameInputGamepadMenu = 1_i32
    GameInputGamepadView = 2_i32
    GameInputGamepadA = 4_i32
    GameInputGamepadB = 8_i32
    GameInputGamepadX = 16_i32
    GameInputGamepadY = 32_i32
    GameInputGamepadDPadUp = 64_i32
    GameInputGamepadDPadDown = 128_i32
    GameInputGamepadDPadLeft = 256_i32
    GameInputGamepadDPadRight = 512_i32
    GameInputGamepadLeftShoulder = 1024_i32
    GameInputGamepadRightShoulder = 2048_i32
    GameInputGamepadLeftThumbstick = 4096_i32
    GameInputGamepadRightThumbstick = 8192_i32
  end
  @[Flags]
  enum GameInputRacingWheelButtons
    GameInputRacingWheelNone = 0_i32
    GameInputRacingWheelMenu = 1_i32
    GameInputRacingWheelView = 2_i32
    GameInputRacingWheelPreviousGear = 4_i32
    GameInputRacingWheelNextGear = 8_i32
    GameInputRacingWheelDpadUp = 16_i32
    GameInputRacingWheelDpadDown = 32_i32
    GameInputRacingWheelDpadLeft = 64_i32
    GameInputRacingWheelDpadRight = 128_i32
  end
  @[Flags]
  enum GameInputUiNavigationButtons
    GameInputUiNavigationNone = 0_i32
    GameInputUiNavigationMenu = 1_i32
    GameInputUiNavigationView = 2_i32
    GameInputUiNavigationAccept = 4_i32
    GameInputUiNavigationCancel = 8_i32
    GameInputUiNavigationUp = 16_i32
    GameInputUiNavigationDown = 32_i32
    GameInputUiNavigationLeft = 64_i32
    GameInputUiNavigationRight = 128_i32
    GameInputUiNavigationContext1 = 256_i32
    GameInputUiNavigationContext2 = 512_i32
    GameInputUiNavigationContext3 = 1024_i32
    GameInputUiNavigationContext4 = 2048_i32
    GameInputUiNavigationPageUp = 4096_i32
    GameInputUiNavigationPageDown = 8192_i32
    GameInputUiNavigationPageLeft = 16384_i32
    GameInputUiNavigationPageRight = 32768_i32
    GameInputUiNavigationScrollUp = 65536_i32
    GameInputUiNavigationScrollDown = 131072_i32
    GameInputUiNavigationScrollLeft = 262144_i32
    GameInputUiNavigationScrollRight = 524288_i32
  end
  @[Flags]
  enum GameInputSystemButtons
    GameInputSystemButtonNone = 0_i32
    GameInputSystemButtonGuide = 1_i32
    GameInputSystemButtonShare = 2_i32
  end
  @[Flags]
  enum GameInputDeviceStatus
    GameInputDeviceNoStatus = 0_i32
    GameInputDeviceConnected = 1_i32
    GameInputDeviceInputEnabled = 2_i32
    GameInputDeviceOutputEnabled = 4_i32
    GameInputDeviceRawIoEnabled = 8_i32
    GameInputDeviceAudioCapture = 16_i32
    GameInputDeviceAudioRender = 32_i32
    GameInputDeviceSynchronized = 64_i32
    GameInputDeviceWireless = 128_i32
    GameInputDeviceUserIdle = 1048576_i32
    GameInputDeviceAnyStatus = 16777215_i32
  end
  enum GameInputBatteryStatus
    GameInputBatteryUnknown = -1_i32
    GameInputBatteryNotPresent = 0_i32
    GameInputBatteryDischarging = 1_i32
    GameInputBatteryIdle = 2_i32
    GameInputBatteryCharging = 3_i32
  end
  enum GameInputDeviceFamily
    GameInputFamilyVirtual = -1_i32
    GameInputFamilyAggregate = 0_i32
    GameInputFamilyXboxOne = 1_i32
    GameInputFamilyXbox360 = 2_i32
    GameInputFamilyHid = 3_i32
    GameInputFamilyI8042 = 4_i32
  end
  @[Flags]
  enum GameInputDeviceCapabilities
    GameInputDeviceCapabilityNone = 0_i32
    GameInputDeviceCapabilityAudio = 1_i32
    GameInputDeviceCapabilityPluginModule = 2_i32
    GameInputDeviceCapabilityPowerOff = 4_i32
    GameInputDeviceCapabilitySynchronization = 8_i32
    GameInputDeviceCapabilityWireless = 16_i32
  end
  enum GameInputRawDeviceReportKind
    GameInputRawInputReport = 0_i32
    GameInputRawOutputReport = 1_i32
    GameInputRawFeatureReport = 2_i32
  end
  @[Flags]
  enum GameInputRawDeviceReportItemFlags
    GameInputDefaultItem = 0_i32
    GameInputConstantItem = 1_i32
    GameInputArrayItem = 2_i32
    GameInputRelativeItem = 4_i32
    GameInputWraparoundItem = 8_i32
    GameInputNonlinearItem = 16_i32
    GameInputStableItem = 32_i32
    GameInputNullableItem = 64_i32
    GameInputVolatileItem = 128_i32
    GameInputBufferedItem = 256_i32
  end
  enum GameInputRawDeviceItemCollectionKind
    GameInputUnknownItemCollection = -1_i32
    GameInputPhysicalItemCollection = 0_i32
    GameInputApplicationItemCollection = 1_i32
    GameInputLogicalItemCollection = 2_i32
    GameInputReportItemCollection = 3_i32
    GameInputNamedArrayItemCollection = 4_i32
    GameInputUsageSwitchItemCollection = 5_i32
    GameInputUsageModifierItemCollection = 6_i32
  end
  enum GameInputRawDevicePhysicalUnitKind
    GameInputPhysicalUnitUnknown = -1_i32
    GameInputPhysicalUnitNone = 0_i32
    GameInputPhysicalUnitTime = 1_i32
    GameInputPhysicalUnitFrequency = 2_i32
    GameInputPhysicalUnitLength = 3_i32
    GameInputPhysicalUnitVelocity = 4_i32
    GameInputPhysicalUnitAcceleration = 5_i32
    GameInputPhysicalUnitMass = 6_i32
    GameInputPhysicalUnitMomentum = 7_i32
    GameInputPhysicalUnitForce = 8_i32
    GameInputPhysicalUnitPressure = 9_i32
    GameInputPhysicalUnitAngle = 10_i32
    GameInputPhysicalUnitAngularVelocity = 11_i32
    GameInputPhysicalUnitAngularAcceleration = 12_i32
    GameInputPhysicalUnitAngularMass = 13_i32
    GameInputPhysicalUnitAngularMomentum = 14_i32
    GameInputPhysicalUnitAngularTorque = 15_i32
    GameInputPhysicalUnitElectricCurrent = 16_i32
    GameInputPhysicalUnitElectricCharge = 17_i32
    GameInputPhysicalUnitElectricPotential = 18_i32
    GameInputPhysicalUnitEnergy = 19_i32
    GameInputPhysicalUnitPower = 20_i32
    GameInputPhysicalUnitTemperature = 21_i32
    GameInputPhysicalUnitLuminousIntensity = 22_i32
    GameInputPhysicalUnitLuminousFlux = 23_i32
    GameInputPhysicalUnitIlluminance = 24_i32
  end
  enum GameInputLabel
    GameInputLabelUnknown = -1_i32
    GameInputLabelNone = 0_i32
    GameInputLabelXboxGuide = 1_i32
    GameInputLabelXboxBack = 2_i32
    GameInputLabelXboxStart = 3_i32
    GameInputLabelXboxMenu = 4_i32
    GameInputLabelXboxView = 5_i32
    GameInputLabelXboxA = 7_i32
    GameInputLabelXboxB = 8_i32
    GameInputLabelXboxX = 9_i32
    GameInputLabelXboxY = 10_i32
    GameInputLabelXboxDPadUp = 11_i32
    GameInputLabelXboxDPadDown = 12_i32
    GameInputLabelXboxDPadLeft = 13_i32
    GameInputLabelXboxDPadRight = 14_i32
    GameInputLabelXboxLeftShoulder = 15_i32
    GameInputLabelXboxLeftTrigger = 16_i32
    GameInputLabelXboxLeftStickButton = 17_i32
    GameInputLabelXboxRightShoulder = 18_i32
    GameInputLabelXboxRightTrigger = 19_i32
    GameInputLabelXboxRightStickButton = 20_i32
    GameInputLabelXboxPaddle1 = 21_i32
    GameInputLabelXboxPaddle2 = 22_i32
    GameInputLabelXboxPaddle3 = 23_i32
    GameInputLabelXboxPaddle4 = 24_i32
    GameInputLabelLetterA = 25_i32
    GameInputLabelLetterB = 26_i32
    GameInputLabelLetterC = 27_i32
    GameInputLabelLetterD = 28_i32
    GameInputLabelLetterE = 29_i32
    GameInputLabelLetterF = 30_i32
    GameInputLabelLetterG = 31_i32
    GameInputLabelLetterH = 32_i32
    GameInputLabelLetterI = 33_i32
    GameInputLabelLetterJ = 34_i32
    GameInputLabelLetterK = 35_i32
    GameInputLabelLetterL = 36_i32
    GameInputLabelLetterM = 37_i32
    GameInputLabelLetterN = 38_i32
    GameInputLabelLetterO = 39_i32
    GameInputLabelLetterP = 40_i32
    GameInputLabelLetterQ = 41_i32
    GameInputLabelLetterR = 42_i32
    GameInputLabelLetterS = 43_i32
    GameInputLabelLetterT = 44_i32
    GameInputLabelLetterU = 45_i32
    GameInputLabelLetterV = 46_i32
    GameInputLabelLetterW = 47_i32
    GameInputLabelLetterX = 48_i32
    GameInputLabelLetterY = 49_i32
    GameInputLabelLetterZ = 50_i32
    GameInputLabelNumber0 = 51_i32
    GameInputLabelNumber1 = 52_i32
    GameInputLabelNumber2 = 53_i32
    GameInputLabelNumber3 = 54_i32
    GameInputLabelNumber4 = 55_i32
    GameInputLabelNumber5 = 56_i32
    GameInputLabelNumber6 = 57_i32
    GameInputLabelNumber7 = 58_i32
    GameInputLabelNumber8 = 59_i32
    GameInputLabelNumber9 = 60_i32
    GameInputLabelArrowUp = 61_i32
    GameInputLabelArrowUpRight = 62_i32
    GameInputLabelArrowRight = 63_i32
    GameInputLabelArrowDownRight = 64_i32
    GameInputLabelArrowDown = 65_i32
    GameInputLabelArrowDownLLeft = 66_i32
    GameInputLabelArrowLeft = 67_i32
    GameInputLabelArrowUpLeft = 68_i32
    GameInputLabelArrowUpDown = 69_i32
    GameInputLabelArrowLeftRight = 70_i32
    GameInputLabelArrowUpDownLeftRight = 71_i32
    GameInputLabelArrowClockwise = 72_i32
    GameInputLabelArrowCounterClockwise = 73_i32
    GameInputLabelArrowReturn = 74_i32
    GameInputLabelIconBranding = 75_i32
    GameInputLabelIconHome = 76_i32
    GameInputLabelIconMenu = 77_i32
    GameInputLabelIconCross = 78_i32
    GameInputLabelIconCircle = 79_i32
    GameInputLabelIconSquare = 80_i32
    GameInputLabelIconTriangle = 81_i32
    GameInputLabelIconStar = 82_i32
    GameInputLabelIconDPadUp = 83_i32
    GameInputLabelIconDPadDown = 84_i32
    GameInputLabelIconDPadLeft = 85_i32
    GameInputLabelIconDPadRight = 86_i32
    GameInputLabelIconDialClockwise = 87_i32
    GameInputLabelIconDialCounterClockwise = 88_i32
    GameInputLabelIconSliderLeftRight = 89_i32
    GameInputLabelIconSliderUpDown = 90_i32
    GameInputLabelIconWheelUpDown = 91_i32
    GameInputLabelIconPlus = 92_i32
    GameInputLabelIconMinus = 93_i32
    GameInputLabelIconSuspension = 94_i32
    GameInputLabelHome = 95_i32
    GameInputLabelGuide = 96_i32
    GameInputLabelMode = 97_i32
    GameInputLabelSelect = 98_i32
    GameInputLabelMenu = 99_i32
    GameInputLabelView = 100_i32
    GameInputLabelBack = 101_i32
    GameInputLabelStart = 102_i32
    GameInputLabelOptions = 103_i32
    GameInputLabelShare = 104_i32
    GameInputLabelUp = 105_i32
    GameInputLabelDown = 106_i32
    GameInputLabelLeft = 107_i32
    GameInputLabelRight = 108_i32
    GameInputLabelLB = 109_i32
    GameInputLabelLT = 110_i32
    GameInputLabelLSB = 111_i32
    GameInputLabelL1 = 112_i32
    GameInputLabelL2 = 113_i32
    GameInputLabelL3 = 114_i32
    GameInputLabelRB = 115_i32
    GameInputLabelRT = 116_i32
    GameInputLabelRSB = 117_i32
    GameInputLabelR1 = 118_i32
    GameInputLabelR2 = 119_i32
    GameInputLabelR3 = 120_i32
    GameInputLabelP1 = 121_i32
    GameInputLabelP2 = 122_i32
    GameInputLabelP3 = 123_i32
    GameInputLabelP4 = 124_i32
  end
  enum GameInputLocation
    GameInputLocationUnknown = -1_i32
    GameInputLocationChassis = 0_i32
    GameInputLocationDisplay = 1_i32
    GameInputLocationAxis = 2_i32
    GameInputLocationButton = 3_i32
    GameInputLocationSwitch = 4_i32
    GameInputLocationKey = 5_i32
    GameInputLocationTouchPad = 6_i32
  end
  @[Flags]
  enum GameInputFeedbackAxes
    GameInputFeedbackAxisNone = 0_i32
    GameInputFeedbackAxisLinearX = 1_i32
    GameInputFeedbackAxisLinearY = 2_i32
    GameInputFeedbackAxisLinearZ = 4_i32
    GameInputFeedbackAxisAngularX = 8_i32
    GameInputFeedbackAxisAngularY = 16_i32
    GameInputFeedbackAxisAngularZ = 32_i32
    GameInputFeedbackAxisNormal = 64_i32
  end
  enum GameInputFeedbackEffectState
    GameInputFeedbackStopped = 0_i32
    GameInputFeedbackRunning = 1_i32
    GameInputFeedbackPaused = 2_i32
  end
  enum GameInputForceFeedbackEffectKind
    GameInputForceFeedbackConstant = 0_i32
    GameInputForceFeedbackRamp = 1_i32
    GameInputForceFeedbackSineWave = 2_i32
    GameInputForceFeedbackSquareWave = 3_i32
    GameInputForceFeedbackTriangleWave = 4_i32
    GameInputForceFeedbackSawtoothUpWave = 5_i32
    GameInputForceFeedbackSawtoothDownWave = 6_i32
    GameInputForceFeedbackSpring = 7_i32
    GameInputForceFeedbackFriction = 8_i32
    GameInputForceFeedbackDamper = 9_i32
    GameInputForceFeedbackInertia = 10_i32
  end
  @[Flags]
  enum GameInputRumbleMotors
    GameInputRumbleNone = 0_i32
    GameInputRumbleLowFrequency = 1_i32
    GameInputRumbleHighFrequency = 2_i32
    GameInputRumbleLeftTrigger = 4_i32
    GameInputRumbleRightTrigger = 8_i32
  end

  @[Extern]
  struct GameInputKeyState
    property scanCode : UInt32
    property codePoint : UInt32
    property virtualKey : UInt8
    property isDeadKey : UInt8
    def initialize(@scanCode : UInt32, @codePoint : UInt32, @virtualKey : UInt8, @isDeadKey : UInt8)
    end
  end

  @[Extern]
  struct GameInputMouseState
    property buttons : Win32cr::UI::Input::GameInput::GameInputMouseButtons
    property positionX : Int64
    property positionY : Int64
    property wheelX : Int64
    property wheelY : Int64
    def initialize(@buttons : Win32cr::UI::Input::GameInput::GameInputMouseButtons, @positionX : Int64, @positionY : Int64, @wheelX : Int64, @wheelY : Int64)
    end
  end

  @[Extern]
  struct GameInputTouchState
    property touchId : UInt64
    property sensorIndex : UInt32
    property positionX : Float32
    property positionY : Float32
    property pressure : Float32
    property proximity : Float32
    property contactRectTop : Float32
    property contactRectLeft : Float32
    property contactRectRight : Float32
    property contactRectBottom : Float32
    def initialize(@touchId : UInt64, @sensorIndex : UInt32, @positionX : Float32, @positionY : Float32, @pressure : Float32, @proximity : Float32, @contactRectTop : Float32, @contactRectLeft : Float32, @contactRectRight : Float32, @contactRectBottom : Float32)
    end
  end

  @[Extern]
  struct GameInputMotionState
    property accelerationX : Float32
    property accelerationY : Float32
    property accelerationZ : Float32
    property angularVelocityX : Float32
    property angularVelocityY : Float32
    property angularVelocityZ : Float32
    property magneticFieldX : Float32
    property magneticFieldY : Float32
    property magneticFieldZ : Float32
    property orientationW : Float32
    property orientationX : Float32
    property orientationY : Float32
    property orientationZ : Float32
    property accelerometerAccuracy : Win32cr::UI::Input::GameInput::GameInputMotionAccuracy
    property gyroscopeAccuracy : Win32cr::UI::Input::GameInput::GameInputMotionAccuracy
    property magnetometerAccuracy : Win32cr::UI::Input::GameInput::GameInputMotionAccuracy
    property orientationAccuracy : Win32cr::UI::Input::GameInput::GameInputMotionAccuracy
    def initialize(@accelerationX : Float32, @accelerationY : Float32, @accelerationZ : Float32, @angularVelocityX : Float32, @angularVelocityY : Float32, @angularVelocityZ : Float32, @magneticFieldX : Float32, @magneticFieldY : Float32, @magneticFieldZ : Float32, @orientationW : Float32, @orientationX : Float32, @orientationY : Float32, @orientationZ : Float32, @accelerometerAccuracy : Win32cr::UI::Input::GameInput::GameInputMotionAccuracy, @gyroscopeAccuracy : Win32cr::UI::Input::GameInput::GameInputMotionAccuracy, @magnetometerAccuracy : Win32cr::UI::Input::GameInput::GameInputMotionAccuracy, @orientationAccuracy : Win32cr::UI::Input::GameInput::GameInputMotionAccuracy)
    end
  end

  @[Extern]
  struct GameInputArcadeStickState
    property buttons : Win32cr::UI::Input::GameInput::GameInputArcadeStickButtons
    def initialize(@buttons : Win32cr::UI::Input::GameInput::GameInputArcadeStickButtons)
    end
  end

  @[Extern]
  struct GameInputFlightStickState
    property buttons : Win32cr::UI::Input::GameInput::GameInputFlightStickButtons
    property hatSwitch : Win32cr::UI::Input::GameInput::GameInputSwitchPosition
    property roll : Float32
    property pitch : Float32
    property yaw : Float32
    property throttle : Float32
    def initialize(@buttons : Win32cr::UI::Input::GameInput::GameInputFlightStickButtons, @hatSwitch : Win32cr::UI::Input::GameInput::GameInputSwitchPosition, @roll : Float32, @pitch : Float32, @yaw : Float32, @throttle : Float32)
    end
  end

  @[Extern]
  struct GameInputGamepadState
    property buttons : Win32cr::UI::Input::GameInput::GameInputGamepadButtons
    property leftTrigger : Float32
    property rightTrigger : Float32
    property leftThumbstickX : Float32
    property leftThumbstickY : Float32
    property rightThumbstickX : Float32
    property rightThumbstickY : Float32
    def initialize(@buttons : Win32cr::UI::Input::GameInput::GameInputGamepadButtons, @leftTrigger : Float32, @rightTrigger : Float32, @leftThumbstickX : Float32, @leftThumbstickY : Float32, @rightThumbstickX : Float32, @rightThumbstickY : Float32)
    end
  end

  @[Extern]
  struct GameInputRacingWheelState
    property buttons : Win32cr::UI::Input::GameInput::GameInputRacingWheelButtons
    property patternShifterGear : Int32
    property wheel : Float32
    property throttle : Float32
    property brake : Float32
    property clutch : Float32
    property handbrake : Float32
    def initialize(@buttons : Win32cr::UI::Input::GameInput::GameInputRacingWheelButtons, @patternShifterGear : Int32, @wheel : Float32, @throttle : Float32, @brake : Float32, @clutch : Float32, @handbrake : Float32)
    end
  end

  @[Extern]
  struct GameInputUiNavigationState
    property buttons : Win32cr::UI::Input::GameInput::GameInputUiNavigationButtons
    def initialize(@buttons : Win32cr::UI::Input::GameInput::GameInputUiNavigationButtons)
    end
  end

  @[Extern]
  struct GameInputBatteryState
    property chargeRate : Float32
    property maxChargeRate : Float32
    property remainingCapacity : Float32
    property fullChargeCapacity : Float32
    property status : Win32cr::UI::Input::GameInput::GameInputBatteryStatus
    def initialize(@chargeRate : Float32, @maxChargeRate : Float32, @remainingCapacity : Float32, @fullChargeCapacity : Float32, @status : Win32cr::UI::Input::GameInput::GameInputBatteryStatus)
    end
  end

  @[Extern]
  struct GameInputString
    property sizeInBytes : UInt32
    property codePointCount : UInt32
    property data : Win32cr::Foundation::PSTR
    def initialize(@sizeInBytes : UInt32, @codePointCount : UInt32, @data : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct GameInputUsage
    property page : UInt16
    property id : UInt16
    def initialize(@page : UInt16, @id : UInt16)
    end
  end

  @[Extern]
  struct GameInputVersion
    property major : UInt16
    property minor : UInt16
    property build : UInt16
    property revision : UInt16
    def initialize(@major : UInt16, @minor : UInt16, @build : UInt16, @revision : UInt16)
    end
  end

  @[Extern]
  struct GameInputRawDeviceItemCollectionInfo
    property kind : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionKind
    property childCount : UInt32
    property siblingCount : UInt32
    property usageCount : UInt32
    property usages : Win32cr::UI::Input::GameInput::GameInputUsage*
    property parent : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*
    property firstSibling : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*
    property previousSibling : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*
    property nextSibling : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*
    property lastSibling : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*
    property firstChild : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*
    property lastChild : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*
    def initialize(@kind : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionKind, @childCount : UInt32, @siblingCount : UInt32, @usageCount : UInt32, @usages : Win32cr::UI::Input::GameInput::GameInputUsage*, @parent : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*, @firstSibling : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*, @previousSibling : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*, @nextSibling : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*, @lastSibling : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*, @firstChild : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*, @lastChild : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*)
    end
  end

  @[Extern]
  struct GameInputRawDeviceReportItemInfo
    property bitOffset : UInt32
    property bitSize : UInt32
    property logicalMin : Int64
    property logicalMax : Int64
    property physicalMin : Float64
    property physicalMax : Float64
    property physicalUnits : Win32cr::UI::Input::GameInput::GameInputRawDevicePhysicalUnitKind
    property rawPhysicalUnits : UInt32
    property rawPhysicalUnitsExponent : Int32
    property flags : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportItemFlags
    property usageCount : UInt32
    property usages : Win32cr::UI::Input::GameInput::GameInputUsage*
    property collection : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*
    property itemString : Win32cr::UI::Input::GameInput::GameInputString*
    def initialize(@bitOffset : UInt32, @bitSize : UInt32, @logicalMin : Int64, @logicalMax : Int64, @physicalMin : Float64, @physicalMax : Float64, @physicalUnits : Win32cr::UI::Input::GameInput::GameInputRawDevicePhysicalUnitKind, @rawPhysicalUnits : UInt32, @rawPhysicalUnitsExponent : Int32, @flags : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportItemFlags, @usageCount : UInt32, @usages : Win32cr::UI::Input::GameInput::GameInputUsage*, @collection : Win32cr::UI::Input::GameInput::GameInputRawDeviceItemCollectionInfo*, @itemString : Win32cr::UI::Input::GameInput::GameInputString*)
    end
  end

  @[Extern]
  struct GameInputRawDeviceReportInfo
    property kind : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportKind
    property id : UInt32
    property size : UInt32
    property itemCount : UInt32
    property items : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportItemInfo*
    def initialize(@kind : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportKind, @id : UInt32, @size : UInt32, @itemCount : UInt32, @items : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportItemInfo*)
    end
  end

  @[Extern]
  struct GameInputControllerAxisInfo
    property mappedInputKinds : Win32cr::UI::Input::GameInput::GameInputKind
    property label : Win32cr::UI::Input::GameInput::GameInputLabel
    property isContinuous : UInt8
    property isNonlinear : UInt8
    property isQuantized : UInt8
    property hasRestValue : UInt8
    property restValue : Float32
    property resolution : UInt64
    property legacyDInputIndex : UInt16
    property legacyHidIndex : UInt16
    property rawReportIndex : UInt32
    property inputReport : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportInfo*
    property inputReportItem : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportItemInfo*
    def initialize(@mappedInputKinds : Win32cr::UI::Input::GameInput::GameInputKind, @label : Win32cr::UI::Input::GameInput::GameInputLabel, @isContinuous : UInt8, @isNonlinear : UInt8, @isQuantized : UInt8, @hasRestValue : UInt8, @restValue : Float32, @resolution : UInt64, @legacyDInputIndex : UInt16, @legacyHidIndex : UInt16, @rawReportIndex : UInt32, @inputReport : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportInfo*, @inputReportItem : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportItemInfo*)
    end
  end

  @[Extern]
  struct GameInputControllerButtonInfo
    property mappedInputKinds : Win32cr::UI::Input::GameInput::GameInputKind
    property label : Win32cr::UI::Input::GameInput::GameInputLabel
    property legacyDInputIndex : UInt16
    property legacyHidIndex : UInt16
    property rawReportIndex : UInt32
    property inputReport : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportInfo*
    property inputReportItem : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportItemInfo*
    def initialize(@mappedInputKinds : Win32cr::UI::Input::GameInput::GameInputKind, @label : Win32cr::UI::Input::GameInput::GameInputLabel, @legacyDInputIndex : UInt16, @legacyHidIndex : UInt16, @rawReportIndex : UInt32, @inputReport : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportInfo*, @inputReportItem : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportItemInfo*)
    end
  end

  @[Extern]
  struct GameInputControllerSwitchInfo
    property mappedInputKinds : Win32cr::UI::Input::GameInput::GameInputKind
    property label : Win32cr::UI::Input::GameInput::GameInputLabel
    property positionLabels : Win32cr::UI::Input::GameInput::GameInputLabel[9]
    property kind : Win32cr::UI::Input::GameInput::GameInputSwitchKind
    property legacyDInputIndex : UInt16
    property legacyHidIndex : UInt16
    property rawReportIndex : UInt32
    property inputReport : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportInfo*
    property inputReportItem : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportItemInfo*
    def initialize(@mappedInputKinds : Win32cr::UI::Input::GameInput::GameInputKind, @label : Win32cr::UI::Input::GameInput::GameInputLabel, @positionLabels : Win32cr::UI::Input::GameInput::GameInputLabel[9], @kind : Win32cr::UI::Input::GameInput::GameInputSwitchKind, @legacyDInputIndex : UInt16, @legacyHidIndex : UInt16, @rawReportIndex : UInt32, @inputReport : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportInfo*, @inputReportItem : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportItemInfo*)
    end
  end

  @[Extern]
  struct GameInputKeyboardInfo
    property kind : Win32cr::UI::Input::GameInput::GameInputKeyboardKind
    property layout : UInt32
    property keyCount : UInt32
    property functionKeyCount : UInt32
    property maxSimultaneousKeys : UInt32
    property platformType : UInt32
    property platformSubtype : UInt32
    property nativeLanguage : Win32cr::UI::Input::GameInput::GameInputString*
    def initialize(@kind : Win32cr::UI::Input::GameInput::GameInputKeyboardKind, @layout : UInt32, @keyCount : UInt32, @functionKeyCount : UInt32, @maxSimultaneousKeys : UInt32, @platformType : UInt32, @platformSubtype : UInt32, @nativeLanguage : Win32cr::UI::Input::GameInput::GameInputString*)
    end
  end

  @[Extern]
  struct GameInputMouseInfo
    property supportedButtons : Win32cr::UI::Input::GameInput::GameInputMouseButtons
    property sampleRate : UInt32
    property sensorDpi : UInt32
    property hasWheelX : UInt8
    property hasWheelY : UInt8
    def initialize(@supportedButtons : Win32cr::UI::Input::GameInput::GameInputMouseButtons, @sampleRate : UInt32, @sensorDpi : UInt32, @hasWheelX : UInt8, @hasWheelY : UInt8)
    end
  end

  @[Extern]
  struct GameInputTouchSensorInfo
    property mappedInputKinds : Win32cr::UI::Input::GameInput::GameInputKind
    property label : Win32cr::UI::Input::GameInput::GameInputLabel
    property location : Win32cr::UI::Input::GameInput::GameInputLocation
    property locationId : UInt32
    property resolutionX : UInt64
    property resolutionY : UInt64
    property shape : Win32cr::UI::Input::GameInput::GameInputTouchShape
    property aspectRatio : Float32
    property orientation : Float32
    property physicalWidth : Float32
    property physicalHeight : Float32
    property maxPressure : Float32
    property maxProximity : Float32
    property maxTouchPoints : UInt32
    def initialize(@mappedInputKinds : Win32cr::UI::Input::GameInput::GameInputKind, @label : Win32cr::UI::Input::GameInput::GameInputLabel, @location : Win32cr::UI::Input::GameInput::GameInputLocation, @locationId : UInt32, @resolutionX : UInt64, @resolutionY : UInt64, @shape : Win32cr::UI::Input::GameInput::GameInputTouchShape, @aspectRatio : Float32, @orientation : Float32, @physicalWidth : Float32, @physicalHeight : Float32, @maxPressure : Float32, @maxProximity : Float32, @maxTouchPoints : UInt32)
    end
  end

  @[Extern]
  struct GameInputMotionInfo
    property maxAcceleration : Float32
    property maxAngularVelocity : Float32
    property maxMagneticFieldStrength : Float32
    def initialize(@maxAcceleration : Float32, @maxAngularVelocity : Float32, @maxMagneticFieldStrength : Float32)
    end
  end

  @[Extern]
  struct GameInputArcadeStickInfo
    property menuButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property viewButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property stickUpLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property stickDownLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property stickLeftLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property stickRightLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property actionButton1Label : Win32cr::UI::Input::GameInput::GameInputLabel
    property actionButton2Label : Win32cr::UI::Input::GameInput::GameInputLabel
    property actionButton3Label : Win32cr::UI::Input::GameInput::GameInputLabel
    property actionButton4Label : Win32cr::UI::Input::GameInput::GameInputLabel
    property actionButton5Label : Win32cr::UI::Input::GameInput::GameInputLabel
    property actionButton6Label : Win32cr::UI::Input::GameInput::GameInputLabel
    property specialButton1Label : Win32cr::UI::Input::GameInput::GameInputLabel
    property specialButton2Label : Win32cr::UI::Input::GameInput::GameInputLabel
    def initialize(@menuButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @viewButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @stickUpLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @stickDownLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @stickLeftLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @stickRightLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @actionButton1Label : Win32cr::UI::Input::GameInput::GameInputLabel, @actionButton2Label : Win32cr::UI::Input::GameInput::GameInputLabel, @actionButton3Label : Win32cr::UI::Input::GameInput::GameInputLabel, @actionButton4Label : Win32cr::UI::Input::GameInput::GameInputLabel, @actionButton5Label : Win32cr::UI::Input::GameInput::GameInputLabel, @actionButton6Label : Win32cr::UI::Input::GameInput::GameInputLabel, @specialButton1Label : Win32cr::UI::Input::GameInput::GameInputLabel, @specialButton2Label : Win32cr::UI::Input::GameInput::GameInputLabel)
    end
  end

  @[Extern]
  struct GameInputFlightStickInfo
    property menuButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property viewButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property firePrimaryButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property fireSecondaryButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property hatSwitchKind : Win32cr::UI::Input::GameInput::GameInputSwitchKind
    def initialize(@menuButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @viewButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @firePrimaryButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @fireSecondaryButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @hatSwitchKind : Win32cr::UI::Input::GameInput::GameInputSwitchKind)
    end
  end

  @[Extern]
  struct GameInputGamepadInfo
    property menuButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property viewButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property aButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property bButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property xButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property yButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property dpadUpLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property dpadDownLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property dpadLeftLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property dpadRightLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property leftShoulderButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property rightShoulderButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property leftThumbstickButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property rightThumbstickButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    def initialize(@menuButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @viewButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @aButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @bButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @xButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @yButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @dpadUpLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @dpadDownLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @dpadLeftLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @dpadRightLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @leftShoulderButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @rightShoulderButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @leftThumbstickButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @rightThumbstickButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel)
    end
  end

  @[Extern]
  struct GameInputRacingWheelInfo
    property menuButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property viewButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property previousGearButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property nextGearButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property dpadUpLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property dpadDownLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property dpadLeftLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property dpadRightLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property hasClutch : UInt8
    property hasHandbrake : UInt8
    property hasPatternShifter : UInt8
    property minPatternShifterGear : Int32
    property maxPatternShifterGear : Int32
    property maxWheelAngle : Float32
    def initialize(@menuButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @viewButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @previousGearButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @nextGearButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @dpadUpLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @dpadDownLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @dpadLeftLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @dpadRightLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @hasClutch : UInt8, @hasHandbrake : UInt8, @hasPatternShifter : UInt8, @minPatternShifterGear : Int32, @maxPatternShifterGear : Int32, @maxWheelAngle : Float32)
    end
  end

  @[Extern]
  struct GameInputUiNavigationInfo
    property menuButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property viewButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property acceptButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property cancelButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property upButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property downButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property leftButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property rightButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property contextButton1Label : Win32cr::UI::Input::GameInput::GameInputLabel
    property contextButton2Label : Win32cr::UI::Input::GameInput::GameInputLabel
    property contextButton3Label : Win32cr::UI::Input::GameInput::GameInputLabel
    property contextButton4Label : Win32cr::UI::Input::GameInput::GameInputLabel
    property pageUpButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property pageDownButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property pageLeftButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property pageRightButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property scrollUpButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property scrollDownButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property scrollLeftButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property scrollRightButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    property guideButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel
    def initialize(@menuButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @viewButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @acceptButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @cancelButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @upButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @downButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @leftButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @rightButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @contextButton1Label : Win32cr::UI::Input::GameInput::GameInputLabel, @contextButton2Label : Win32cr::UI::Input::GameInput::GameInputLabel, @contextButton3Label : Win32cr::UI::Input::GameInput::GameInputLabel, @contextButton4Label : Win32cr::UI::Input::GameInput::GameInputLabel, @pageUpButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @pageDownButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @pageLeftButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @pageRightButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @scrollUpButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @scrollDownButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @scrollLeftButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @scrollRightButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel, @guideButtonLabel : Win32cr::UI::Input::GameInput::GameInputLabel)
    end
  end

  @[Extern]
  struct GameInputForceFeedbackMotorInfo
    property supportedAxes : Win32cr::UI::Input::GameInput::GameInputFeedbackAxes
    property location : Win32cr::UI::Input::GameInput::GameInputLocation
    property locationId : UInt32
    property maxSimultaneousEffects : UInt32
    property isConstantEffectSupported : UInt8
    property isRampEffectSupported : UInt8
    property isSineWaveEffectSupported : UInt8
    property isSquareWaveEffectSupported : UInt8
    property isTriangleWaveEffectSupported : UInt8
    property isSawtoothUpWaveEffectSupported : UInt8
    property isSawtoothDownWaveEffectSupported : UInt8
    property isSpringEffectSupported : UInt8
    property isFrictionEffectSupported : UInt8
    property isDamperEffectSupported : UInt8
    property isInertiaEffectSupported : UInt8
    def initialize(@supportedAxes : Win32cr::UI::Input::GameInput::GameInputFeedbackAxes, @location : Win32cr::UI::Input::GameInput::GameInputLocation, @locationId : UInt32, @maxSimultaneousEffects : UInt32, @isConstantEffectSupported : UInt8, @isRampEffectSupported : UInt8, @isSineWaveEffectSupported : UInt8, @isSquareWaveEffectSupported : UInt8, @isTriangleWaveEffectSupported : UInt8, @isSawtoothUpWaveEffectSupported : UInt8, @isSawtoothDownWaveEffectSupported : UInt8, @isSpringEffectSupported : UInt8, @isFrictionEffectSupported : UInt8, @isDamperEffectSupported : UInt8, @isInertiaEffectSupported : UInt8)
    end
  end

  @[Extern]
  struct GameInputHapticWaveformInfo
    property usage : Win32cr::UI::Input::GameInput::GameInputUsage
    property isDurationSupported : UInt8
    property isIntensitySupported : UInt8
    property isRepeatSupported : UInt8
    property isRepeatDelaySupported : UInt8
    property defaultDuration : UInt64
    def initialize(@usage : Win32cr::UI::Input::GameInput::GameInputUsage, @isDurationSupported : UInt8, @isIntensitySupported : UInt8, @isRepeatSupported : UInt8, @isRepeatDelaySupported : UInt8, @defaultDuration : UInt64)
    end
  end

  @[Extern]
  struct GameInputHapticFeedbackMotorInfo
    property mappedRumbleMotors : Win32cr::UI::Input::GameInput::GameInputRumbleMotors
    property location : Win32cr::UI::Input::GameInput::GameInputLocation
    property locationId : UInt32
    property waveformCount : UInt32
    property waveformInfo : Win32cr::UI::Input::GameInput::GameInputHapticWaveformInfo*
    def initialize(@mappedRumbleMotors : Win32cr::UI::Input::GameInput::GameInputRumbleMotors, @location : Win32cr::UI::Input::GameInput::GameInputLocation, @locationId : UInt32, @waveformCount : UInt32, @waveformInfo : Win32cr::UI::Input::GameInput::GameInputHapticWaveformInfo*)
    end
  end

  @[Extern]
  struct GameInputDeviceInfo
    property infoSize : UInt32
    property vendorId : UInt16
    property productId : UInt16
    property revisionNumber : UInt16
    property interfaceNumber : UInt8
    property collectionNumber : UInt8
    property usage : Win32cr::UI::Input::GameInput::GameInputUsage
    property hardwareVersion : Win32cr::UI::Input::GameInput::GameInputVersion
    property firmwareVersion : Win32cr::UI::Input::GameInput::GameInputVersion
    property deviceId : Win32cr::Foundation::APP_LOCAL_DEVICE_ID
    property deviceRootId : Win32cr::Foundation::APP_LOCAL_DEVICE_ID
    property deviceFamily : Win32cr::UI::Input::GameInput::GameInputDeviceFamily
    property capabilities : Win32cr::UI::Input::GameInput::GameInputDeviceCapabilities
    property supportedInput : Win32cr::UI::Input::GameInput::GameInputKind
    property supportedRumbleMotors : Win32cr::UI::Input::GameInput::GameInputRumbleMotors
    property inputReportCount : UInt32
    property outputReportCount : UInt32
    property featureReportCount : UInt32
    property controllerAxisCount : UInt32
    property controllerButtonCount : UInt32
    property controllerSwitchCount : UInt32
    property touchPointCount : UInt32
    property touchSensorCount : UInt32
    property forceFeedbackMotorCount : UInt32
    property hapticFeedbackMotorCount : UInt32
    property deviceStringCount : UInt32
    property deviceDescriptorSize : UInt32
    property inputReportInfo : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportInfo*
    property outputReportInfo : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportInfo*
    property featureReportInfo : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportInfo*
    property controllerAxisInfo : Win32cr::UI::Input::GameInput::GameInputControllerAxisInfo*
    property controllerButtonInfo : Win32cr::UI::Input::GameInput::GameInputControllerButtonInfo*
    property controllerSwitchInfo : Win32cr::UI::Input::GameInput::GameInputControllerSwitchInfo*
    property keyboardInfo : Win32cr::UI::Input::GameInput::GameInputKeyboardInfo*
    property mouseInfo : Win32cr::UI::Input::GameInput::GameInputMouseInfo*
    property touchSensorInfo : Win32cr::UI::Input::GameInput::GameInputTouchSensorInfo*
    property motionInfo : Win32cr::UI::Input::GameInput::GameInputMotionInfo*
    property arcadeStickInfo : Win32cr::UI::Input::GameInput::GameInputArcadeStickInfo*
    property flightStickInfo : Win32cr::UI::Input::GameInput::GameInputFlightStickInfo*
    property gamepadInfo : Win32cr::UI::Input::GameInput::GameInputGamepadInfo*
    property racingWheelInfo : Win32cr::UI::Input::GameInput::GameInputRacingWheelInfo*
    property uiNavigationInfo : Win32cr::UI::Input::GameInput::GameInputUiNavigationInfo*
    property forceFeedbackMotorInfo : Win32cr::UI::Input::GameInput::GameInputForceFeedbackMotorInfo*
    property hapticFeedbackMotorInfo : Win32cr::UI::Input::GameInput::GameInputHapticFeedbackMotorInfo*
    property displayName : Win32cr::UI::Input::GameInput::GameInputString*
    property deviceStrings : Win32cr::UI::Input::GameInput::GameInputString*
    property deviceDescriptorData : Void*
    property supportedSystemButtons : Win32cr::UI::Input::GameInput::GameInputSystemButtons
    def initialize(@infoSize : UInt32, @vendorId : UInt16, @productId : UInt16, @revisionNumber : UInt16, @interfaceNumber : UInt8, @collectionNumber : UInt8, @usage : Win32cr::UI::Input::GameInput::GameInputUsage, @hardwareVersion : Win32cr::UI::Input::GameInput::GameInputVersion, @firmwareVersion : Win32cr::UI::Input::GameInput::GameInputVersion, @deviceId : Win32cr::Foundation::APP_LOCAL_DEVICE_ID, @deviceRootId : Win32cr::Foundation::APP_LOCAL_DEVICE_ID, @deviceFamily : Win32cr::UI::Input::GameInput::GameInputDeviceFamily, @capabilities : Win32cr::UI::Input::GameInput::GameInputDeviceCapabilities, @supportedInput : Win32cr::UI::Input::GameInput::GameInputKind, @supportedRumbleMotors : Win32cr::UI::Input::GameInput::GameInputRumbleMotors, @inputReportCount : UInt32, @outputReportCount : UInt32, @featureReportCount : UInt32, @controllerAxisCount : UInt32, @controllerButtonCount : UInt32, @controllerSwitchCount : UInt32, @touchPointCount : UInt32, @touchSensorCount : UInt32, @forceFeedbackMotorCount : UInt32, @hapticFeedbackMotorCount : UInt32, @deviceStringCount : UInt32, @deviceDescriptorSize : UInt32, @inputReportInfo : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportInfo*, @outputReportInfo : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportInfo*, @featureReportInfo : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportInfo*, @controllerAxisInfo : Win32cr::UI::Input::GameInput::GameInputControllerAxisInfo*, @controllerButtonInfo : Win32cr::UI::Input::GameInput::GameInputControllerButtonInfo*, @controllerSwitchInfo : Win32cr::UI::Input::GameInput::GameInputControllerSwitchInfo*, @keyboardInfo : Win32cr::UI::Input::GameInput::GameInputKeyboardInfo*, @mouseInfo : Win32cr::UI::Input::GameInput::GameInputMouseInfo*, @touchSensorInfo : Win32cr::UI::Input::GameInput::GameInputTouchSensorInfo*, @motionInfo : Win32cr::UI::Input::GameInput::GameInputMotionInfo*, @arcadeStickInfo : Win32cr::UI::Input::GameInput::GameInputArcadeStickInfo*, @flightStickInfo : Win32cr::UI::Input::GameInput::GameInputFlightStickInfo*, @gamepadInfo : Win32cr::UI::Input::GameInput::GameInputGamepadInfo*, @racingWheelInfo : Win32cr::UI::Input::GameInput::GameInputRacingWheelInfo*, @uiNavigationInfo : Win32cr::UI::Input::GameInput::GameInputUiNavigationInfo*, @forceFeedbackMotorInfo : Win32cr::UI::Input::GameInput::GameInputForceFeedbackMotorInfo*, @hapticFeedbackMotorInfo : Win32cr::UI::Input::GameInput::GameInputHapticFeedbackMotorInfo*, @displayName : Win32cr::UI::Input::GameInput::GameInputString*, @deviceStrings : Win32cr::UI::Input::GameInput::GameInputString*, @deviceDescriptorData : Void*, @supportedSystemButtons : Win32cr::UI::Input::GameInput::GameInputSystemButtons)
    end
  end

  @[Extern]
  struct GameInputForceFeedbackEnvelope
    property attackDuration : UInt64
    property sustainDuration : UInt64
    property releaseDuration : UInt64
    property attackGain : Float32
    property sustainGain : Float32
    property releaseGain : Float32
    property playCount : UInt32
    property repeatDelay : UInt64
    def initialize(@attackDuration : UInt64, @sustainDuration : UInt64, @releaseDuration : UInt64, @attackGain : Float32, @sustainGain : Float32, @releaseGain : Float32, @playCount : UInt32, @repeatDelay : UInt64)
    end
  end

  @[Extern]
  struct GameInputForceFeedbackMagnitude
    property linearX : Float32
    property linearY : Float32
    property linearZ : Float32
    property angularX : Float32
    property angularY : Float32
    property angularZ : Float32
    property normal : Float32
    def initialize(@linearX : Float32, @linearY : Float32, @linearZ : Float32, @angularX : Float32, @angularY : Float32, @angularZ : Float32, @normal : Float32)
    end
  end

  @[Extern]
  struct GameInputForceFeedbackConditionParams
    property magnitude : Win32cr::UI::Input::GameInput::GameInputForceFeedbackMagnitude
    property positiveCoefficient : Float32
    property negativeCoefficient : Float32
    property maxPositiveMagnitude : Float32
    property maxNegativeMagnitude : Float32
    property deadZone : Float32
    property bias : Float32
    def initialize(@magnitude : Win32cr::UI::Input::GameInput::GameInputForceFeedbackMagnitude, @positiveCoefficient : Float32, @negativeCoefficient : Float32, @maxPositiveMagnitude : Float32, @maxNegativeMagnitude : Float32, @deadZone : Float32, @bias : Float32)
    end
  end

  @[Extern]
  struct GameInputForceFeedbackConstantParams
    property envelope : Win32cr::UI::Input::GameInput::GameInputForceFeedbackEnvelope
    property magnitude : Win32cr::UI::Input::GameInput::GameInputForceFeedbackMagnitude
    def initialize(@envelope : Win32cr::UI::Input::GameInput::GameInputForceFeedbackEnvelope, @magnitude : Win32cr::UI::Input::GameInput::GameInputForceFeedbackMagnitude)
    end
  end

  @[Extern]
  struct GameInputForceFeedbackPeriodicParams
    property envelope : Win32cr::UI::Input::GameInput::GameInputForceFeedbackEnvelope
    property magnitude : Win32cr::UI::Input::GameInput::GameInputForceFeedbackMagnitude
    property frequency : Float32
    property phase : Float32
    property bias : Float32
    def initialize(@envelope : Win32cr::UI::Input::GameInput::GameInputForceFeedbackEnvelope, @magnitude : Win32cr::UI::Input::GameInput::GameInputForceFeedbackMagnitude, @frequency : Float32, @phase : Float32, @bias : Float32)
    end
  end

  @[Extern]
  struct GameInputForceFeedbackRampParams
    property envelope : Win32cr::UI::Input::GameInput::GameInputForceFeedbackEnvelope
    property startMagnitude : Win32cr::UI::Input::GameInput::GameInputForceFeedbackMagnitude
    property endMagnitude : Win32cr::UI::Input::GameInput::GameInputForceFeedbackMagnitude
    def initialize(@envelope : Win32cr::UI::Input::GameInput::GameInputForceFeedbackEnvelope, @startMagnitude : Win32cr::UI::Input::GameInput::GameInputForceFeedbackMagnitude, @endMagnitude : Win32cr::UI::Input::GameInput::GameInputForceFeedbackMagnitude)
    end
  end

  @[Extern]
  struct GameInputForceFeedbackParams
    property kind : Win32cr::UI::Input::GameInput::GameInputForceFeedbackEffectKind
    property data : Data_e__union_

    # Nested Type Data_e__union_
    @[Extern(union: true)]
    struct Data_e__union_
    property constant : Win32cr::UI::Input::GameInput::GameInputForceFeedbackConstantParams
    property ramp : Win32cr::UI::Input::GameInput::GameInputForceFeedbackRampParams
    property sineWave : Win32cr::UI::Input::GameInput::GameInputForceFeedbackPeriodicParams
    property squareWave : Win32cr::UI::Input::GameInput::GameInputForceFeedbackPeriodicParams
    property triangleWave : Win32cr::UI::Input::GameInput::GameInputForceFeedbackPeriodicParams
    property sawtoothUpWave : Win32cr::UI::Input::GameInput::GameInputForceFeedbackPeriodicParams
    property sawtoothDownWave : Win32cr::UI::Input::GameInput::GameInputForceFeedbackPeriodicParams
    property spring : Win32cr::UI::Input::GameInput::GameInputForceFeedbackConditionParams
    property friction : Win32cr::UI::Input::GameInput::GameInputForceFeedbackConditionParams
    property damper : Win32cr::UI::Input::GameInput::GameInputForceFeedbackConditionParams
    property inertia : Win32cr::UI::Input::GameInput::GameInputForceFeedbackConditionParams
    def initialize(@constant : Win32cr::UI::Input::GameInput::GameInputForceFeedbackConstantParams, @ramp : Win32cr::UI::Input::GameInput::GameInputForceFeedbackRampParams, @sineWave : Win32cr::UI::Input::GameInput::GameInputForceFeedbackPeriodicParams, @squareWave : Win32cr::UI::Input::GameInput::GameInputForceFeedbackPeriodicParams, @triangleWave : Win32cr::UI::Input::GameInput::GameInputForceFeedbackPeriodicParams, @sawtoothUpWave : Win32cr::UI::Input::GameInput::GameInputForceFeedbackPeriodicParams, @sawtoothDownWave : Win32cr::UI::Input::GameInput::GameInputForceFeedbackPeriodicParams, @spring : Win32cr::UI::Input::GameInput::GameInputForceFeedbackConditionParams, @friction : Win32cr::UI::Input::GameInput::GameInputForceFeedbackConditionParams, @damper : Win32cr::UI::Input::GameInput::GameInputForceFeedbackConditionParams, @inertia : Win32cr::UI::Input::GameInput::GameInputForceFeedbackConditionParams)
    end
    end

    def initialize(@kind : Win32cr::UI::Input::GameInput::GameInputForceFeedbackEffectKind, @data : Data_e__union_)
    end
  end

  @[Extern]
  struct GameInputHapticFeedbackParams
    property waveformIndex : UInt32
    property duration : UInt64
    property intensity : Float32
    property playCount : UInt32
    property repeatDelay : UInt64
    def initialize(@waveformIndex : UInt32, @duration : UInt64, @intensity : Float32, @playCount : UInt32, @repeatDelay : UInt64)
    end
  end

  @[Extern]
  struct GameInputRumbleParams
    property lowFrequency : Float32
    property highFrequency : Float32
    property leftTrigger : Float32
    property rightTrigger : Float32
    def initialize(@lowFrequency : Float32, @highFrequency : Float32, @leftTrigger : Float32, @rightTrigger : Float32)
    end
  end

  @[Extern]

  record IGameInputVtable,
    query_interface : Proc(IGameInput*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGameInput*, UInt32),
    release : Proc(IGameInput*, UInt32),
    get_current_timestamp : Proc(IGameInput*, UInt64),
    get_current_reading : Proc(IGameInput*, Win32cr::UI::Input::GameInput::GameInputKind, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_next_reading : Proc(IGameInput*, Void*, Win32cr::UI::Input::GameInput::GameInputKind, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_previous_reading : Proc(IGameInput*, Void*, Win32cr::UI::Input::GameInput::GameInputKind, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_temporal_reading : Proc(IGameInput*, UInt64, Void*, Void**, Win32cr::Foundation::HRESULT),
    register_reading_callback : Proc(IGameInput*, Void*, Win32cr::UI::Input::GameInput::GameInputKind, Float32, Void*, Win32cr::UI::Input::GameInput::GameInputReadingCallback, UInt64*, Win32cr::Foundation::HRESULT),
    register_device_callback : Proc(IGameInput*, Void*, Win32cr::UI::Input::GameInput::GameInputKind, Win32cr::UI::Input::GameInput::GameInputDeviceStatus, Win32cr::UI::Input::GameInput::GameInputEnumerationKind, Void*, Win32cr::UI::Input::GameInput::GameInputDeviceCallback, UInt64*, Win32cr::Foundation::HRESULT),
    register_system_button_callback : Proc(IGameInput*, Void*, Win32cr::UI::Input::GameInput::GameInputSystemButtons, Void*, Win32cr::UI::Input::GameInput::GameInputSystemButtonCallback, UInt64*, Win32cr::Foundation::HRESULT),
    register_keyboard_layout_callback : Proc(IGameInput*, Void*, Void*, Win32cr::UI::Input::GameInput::GameInputKeyboardLayoutCallback, UInt64*, Win32cr::Foundation::HRESULT),
    stop_callback : Proc(IGameInput*, UInt64, Void),
    unregister_callback : Proc(IGameInput*, UInt64, UInt64, Bool),
    create_dispatcher : Proc(IGameInput*, Void**, Win32cr::Foundation::HRESULT),
    create_aggregate_device : Proc(IGameInput*, Win32cr::UI::Input::GameInput::GameInputKind, Void**, Win32cr::Foundation::HRESULT),
    find_device_from_id : Proc(IGameInput*, Win32cr::Foundation::APP_LOCAL_DEVICE_ID*, Void**, Win32cr::Foundation::HRESULT),
    find_device_from_object : Proc(IGameInput*, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_device_from_platform_handle : Proc(IGameInput*, Win32cr::Foundation::HANDLE, Void**, Win32cr::Foundation::HRESULT),
    find_device_from_platform_string : Proc(IGameInput*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    enable_oem_device_support : Proc(IGameInput*, UInt16, UInt16, UInt8, UInt8, Win32cr::Foundation::HRESULT),
    set_focus_policy : Proc(IGameInput*, Win32cr::UI::Input::GameInput::GameInputFocusPolicy, Void)


  @[Extern]
  record IGameInput, lpVtbl : IGameInputVtable* do
    GUID = LibC::GUID.new(0x11be2a7e_u32, 0x4254_u16, 0x445a_u16, StaticArray[0x9c_u8, 0x9_u8, 0xff_u8, 0xc4_u8, 0xf_u8, 0x0_u8, 0x69_u8, 0x18_u8])
    def query_interface(this : IGameInput*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGameInput*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGameInput*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current_timestamp(this : IGameInput*) : UInt64
      @lpVtbl.try &.value.get_current_timestamp.call(this)
    end
    def get_current_reading(this : IGameInput*, inputKind : Win32cr::UI::Input::GameInput::GameInputKind, device : Void*, reading : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_reading.call(this, inputKind, device, reading)
    end
    def get_next_reading(this : IGameInput*, referenceReading : Void*, inputKind : Win32cr::UI::Input::GameInput::GameInputKind, device : Void*, reading : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_reading.call(this, referenceReading, inputKind, device, reading)
    end
    def get_previous_reading(this : IGameInput*, referenceReading : Void*, inputKind : Win32cr::UI::Input::GameInput::GameInputKind, device : Void*, reading : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_previous_reading.call(this, referenceReading, inputKind, device, reading)
    end
    def get_temporal_reading(this : IGameInput*, timestamp : UInt64, device : Void*, reading : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_temporal_reading.call(this, timestamp, device, reading)
    end
    def register_reading_callback(this : IGameInput*, device : Void*, inputKind : Win32cr::UI::Input::GameInput::GameInputKind, analogThreshold : Float32, context : Void*, callbackFunc : Win32cr::UI::Input::GameInput::GameInputReadingCallback, callbackToken : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_reading_callback.call(this, device, inputKind, analogThreshold, context, callbackFunc, callbackToken)
    end
    def register_device_callback(this : IGameInput*, device : Void*, inputKind : Win32cr::UI::Input::GameInput::GameInputKind, statusFilter : Win32cr::UI::Input::GameInput::GameInputDeviceStatus, enumerationKind : Win32cr::UI::Input::GameInput::GameInputEnumerationKind, context : Void*, callbackFunc : Win32cr::UI::Input::GameInput::GameInputDeviceCallback, callbackToken : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_device_callback.call(this, device, inputKind, statusFilter, enumerationKind, context, callbackFunc, callbackToken)
    end
    def register_system_button_callback(this : IGameInput*, device : Void*, buttonFilter : Win32cr::UI::Input::GameInput::GameInputSystemButtons, context : Void*, callbackFunc : Win32cr::UI::Input::GameInput::GameInputSystemButtonCallback, callbackToken : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_system_button_callback.call(this, device, buttonFilter, context, callbackFunc, callbackToken)
    end
    def register_keyboard_layout_callback(this : IGameInput*, device : Void*, context : Void*, callbackFunc : Win32cr::UI::Input::GameInput::GameInputKeyboardLayoutCallback, callbackToken : UInt64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_keyboard_layout_callback.call(this, device, context, callbackFunc, callbackToken)
    end
    def stop_callback(this : IGameInput*, callbackToken : UInt64) : Void
      @lpVtbl.try &.value.stop_callback.call(this, callbackToken)
    end
    def unregister_callback(this : IGameInput*, callbackToken : UInt64, timeoutInMicroseconds : UInt64) : Bool
      @lpVtbl.try &.value.unregister_callback.call(this, callbackToken, timeoutInMicroseconds)
    end
    def create_dispatcher(this : IGameInput*, dispatcher : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_dispatcher.call(this, dispatcher)
    end
    def create_aggregate_device(this : IGameInput*, inputKind : Win32cr::UI::Input::GameInput::GameInputKind, device : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_aggregate_device.call(this, inputKind, device)
    end
    def find_device_from_id(this : IGameInput*, value : Win32cr::Foundation::APP_LOCAL_DEVICE_ID*, device : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_device_from_id.call(this, value, device)
    end
    def find_device_from_object(this : IGameInput*, value : Void*, device : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_device_from_object.call(this, value, device)
    end
    def find_device_from_platform_handle(this : IGameInput*, value : Win32cr::Foundation::HANDLE, device : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_device_from_platform_handle.call(this, value, device)
    end
    def find_device_from_platform_string(this : IGameInput*, value : Win32cr::Foundation::PWSTR, device : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_device_from_platform_string.call(this, value, device)
    end
    def enable_oem_device_support(this : IGameInput*, vendorId : UInt16, productId : UInt16, interfaceNumber : UInt8, collectionNumber : UInt8) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.enable_oem_device_support.call(this, vendorId, productId, interfaceNumber, collectionNumber)
    end
    def set_focus_policy(this : IGameInput*, policy : Win32cr::UI::Input::GameInput::GameInputFocusPolicy) : Void
      @lpVtbl.try &.value.set_focus_policy.call(this, policy)
    end

  end

  @[Extern]

  record IGameInputReadingVtable,
    query_interface : Proc(IGameInputReading*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGameInputReading*, UInt32),
    release : Proc(IGameInputReading*, UInt32),
    get_input_kind : Proc(IGameInputReading*, Win32cr::UI::Input::GameInput::GameInputKind),
    get_sequence_number : Proc(IGameInputReading*, Win32cr::UI::Input::GameInput::GameInputKind, UInt64),
    get_timestamp : Proc(IGameInputReading*, UInt64),
    get_device : Proc(IGameInputReading*, Void**, Void),
    get_raw_report : Proc(IGameInputReading*, Void**, Bool),
    get_controller_axis_count : Proc(IGameInputReading*, UInt32),
    get_controller_axis_state : Proc(IGameInputReading*, UInt32, Float32*, UInt32),
    get_controller_button_count : Proc(IGameInputReading*, UInt32),
    get_controller_button_state : Proc(IGameInputReading*, UInt32, Bool*, UInt32),
    get_controller_switch_count : Proc(IGameInputReading*, UInt32),
    get_controller_switch_state : Proc(IGameInputReading*, UInt32, Win32cr::UI::Input::GameInput::GameInputSwitchPosition*, UInt32),
    get_key_count : Proc(IGameInputReading*, UInt32),
    get_key_state : Proc(IGameInputReading*, UInt32, Win32cr::UI::Input::GameInput::GameInputKeyState*, UInt32),
    get_mouse_state : Proc(IGameInputReading*, Win32cr::UI::Input::GameInput::GameInputMouseState*, Bool),
    get_touch_count : Proc(IGameInputReading*, UInt32),
    get_touch_state : Proc(IGameInputReading*, UInt32, Win32cr::UI::Input::GameInput::GameInputTouchState*, UInt32),
    get_motion_state : Proc(IGameInputReading*, Win32cr::UI::Input::GameInput::GameInputMotionState*, Bool),
    get_arcade_stick_state : Proc(IGameInputReading*, Win32cr::UI::Input::GameInput::GameInputArcadeStickState*, Bool),
    get_flight_stick_state : Proc(IGameInputReading*, Win32cr::UI::Input::GameInput::GameInputFlightStickState*, Bool),
    get_gamepad_state : Proc(IGameInputReading*, Win32cr::UI::Input::GameInput::GameInputGamepadState*, Bool),
    get_racing_wheel_state : Proc(IGameInputReading*, Win32cr::UI::Input::GameInput::GameInputRacingWheelState*, Bool),
    get_ui_navigation_state : Proc(IGameInputReading*, Win32cr::UI::Input::GameInput::GameInputUiNavigationState*, Bool)


  @[Extern]
  record IGameInputReading, lpVtbl : IGameInputReadingVtable* do
    GUID = LibC::GUID.new(0x2156947a_u32, 0xe1fa_u16, 0x4de0_u16, StaticArray[0xa3_u8, 0xb_u8, 0xd8_u8, 0x12_u8, 0x93_u8, 0x1d_u8, 0xbd_u8, 0x8d_u8])
    def query_interface(this : IGameInputReading*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGameInputReading*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGameInputReading*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_input_kind(this : IGameInputReading*) : Win32cr::UI::Input::GameInput::GameInputKind
      @lpVtbl.try &.value.get_input_kind.call(this)
    end
    def get_sequence_number(this : IGameInputReading*, inputKind : Win32cr::UI::Input::GameInput::GameInputKind) : UInt64
      @lpVtbl.try &.value.get_sequence_number.call(this, inputKind)
    end
    def get_timestamp(this : IGameInputReading*) : UInt64
      @lpVtbl.try &.value.get_timestamp.call(this)
    end
    def get_device(this : IGameInputReading*, device : Void**) : Void
      @lpVtbl.try &.value.get_device.call(this, device)
    end
    def get_raw_report(this : IGameInputReading*, report : Void**) : Bool
      @lpVtbl.try &.value.get_raw_report.call(this, report)
    end
    def get_controller_axis_count(this : IGameInputReading*) : UInt32
      @lpVtbl.try &.value.get_controller_axis_count.call(this)
    end
    def get_controller_axis_state(this : IGameInputReading*, stateArrayCount : UInt32, stateArray : Float32*) : UInt32
      @lpVtbl.try &.value.get_controller_axis_state.call(this, stateArrayCount, stateArray)
    end
    def get_controller_button_count(this : IGameInputReading*) : UInt32
      @lpVtbl.try &.value.get_controller_button_count.call(this)
    end
    def get_controller_button_state(this : IGameInputReading*, stateArrayCount : UInt32, stateArray : Bool*) : UInt32
      @lpVtbl.try &.value.get_controller_button_state.call(this, stateArrayCount, stateArray)
    end
    def get_controller_switch_count(this : IGameInputReading*) : UInt32
      @lpVtbl.try &.value.get_controller_switch_count.call(this)
    end
    def get_controller_switch_state(this : IGameInputReading*, stateArrayCount : UInt32, stateArray : Win32cr::UI::Input::GameInput::GameInputSwitchPosition*) : UInt32
      @lpVtbl.try &.value.get_controller_switch_state.call(this, stateArrayCount, stateArray)
    end
    def get_key_count(this : IGameInputReading*) : UInt32
      @lpVtbl.try &.value.get_key_count.call(this)
    end
    def get_key_state(this : IGameInputReading*, stateArrayCount : UInt32, stateArray : Win32cr::UI::Input::GameInput::GameInputKeyState*) : UInt32
      @lpVtbl.try &.value.get_key_state.call(this, stateArrayCount, stateArray)
    end
    def get_mouse_state(this : IGameInputReading*, state : Win32cr::UI::Input::GameInput::GameInputMouseState*) : Bool
      @lpVtbl.try &.value.get_mouse_state.call(this, state)
    end
    def get_touch_count(this : IGameInputReading*) : UInt32
      @lpVtbl.try &.value.get_touch_count.call(this)
    end
    def get_touch_state(this : IGameInputReading*, stateArrayCount : UInt32, stateArray : Win32cr::UI::Input::GameInput::GameInputTouchState*) : UInt32
      @lpVtbl.try &.value.get_touch_state.call(this, stateArrayCount, stateArray)
    end
    def get_motion_state(this : IGameInputReading*, state : Win32cr::UI::Input::GameInput::GameInputMotionState*) : Bool
      @lpVtbl.try &.value.get_motion_state.call(this, state)
    end
    def get_arcade_stick_state(this : IGameInputReading*, state : Win32cr::UI::Input::GameInput::GameInputArcadeStickState*) : Bool
      @lpVtbl.try &.value.get_arcade_stick_state.call(this, state)
    end
    def get_flight_stick_state(this : IGameInputReading*, state : Win32cr::UI::Input::GameInput::GameInputFlightStickState*) : Bool
      @lpVtbl.try &.value.get_flight_stick_state.call(this, state)
    end
    def get_gamepad_state(this : IGameInputReading*, state : Win32cr::UI::Input::GameInput::GameInputGamepadState*) : Bool
      @lpVtbl.try &.value.get_gamepad_state.call(this, state)
    end
    def get_racing_wheel_state(this : IGameInputReading*, state : Win32cr::UI::Input::GameInput::GameInputRacingWheelState*) : Bool
      @lpVtbl.try &.value.get_racing_wheel_state.call(this, state)
    end
    def get_ui_navigation_state(this : IGameInputReading*, state : Win32cr::UI::Input::GameInput::GameInputUiNavigationState*) : Bool
      @lpVtbl.try &.value.get_ui_navigation_state.call(this, state)
    end

  end

  @[Extern]

  record IGameInputDeviceVtable,
    query_interface : Proc(IGameInputDevice*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGameInputDevice*, UInt32),
    release : Proc(IGameInputDevice*, UInt32),
    get_device_info : Proc(IGameInputDevice*, Win32cr::UI::Input::GameInput::GameInputDeviceInfo*),
    get_device_status : Proc(IGameInputDevice*, Win32cr::UI::Input::GameInput::GameInputDeviceStatus),
    get_battery_state : Proc(IGameInputDevice*, Win32cr::UI::Input::GameInput::GameInputBatteryState*, Void),
    create_force_feedback_effect : Proc(IGameInputDevice*, UInt32, Win32cr::UI::Input::GameInput::GameInputForceFeedbackParams*, Void**, Win32cr::Foundation::HRESULT),
    is_force_feedback_motor_powered_on : Proc(IGameInputDevice*, UInt32, Bool),
    set_force_feedback_motor_gain : Proc(IGameInputDevice*, UInt32, Float32, Void),
    set_haptic_motor_state : Proc(IGameInputDevice*, UInt32, Win32cr::UI::Input::GameInput::GameInputHapticFeedbackParams*, Win32cr::Foundation::HRESULT),
    set_rumble_state : Proc(IGameInputDevice*, Win32cr::UI::Input::GameInput::GameInputRumbleParams*, Void),
    set_input_synchronization_state : Proc(IGameInputDevice*, UInt8, Void),
    send_input_synchronization_hint : Proc(IGameInputDevice*, Void),
    power_off : Proc(IGameInputDevice*, Void),
    create_raw_device_report : Proc(IGameInputDevice*, UInt32, Win32cr::UI::Input::GameInput::GameInputRawDeviceReportKind, Void**, Win32cr::Foundation::HRESULT),
    get_raw_device_feature : Proc(IGameInputDevice*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_raw_device_feature : Proc(IGameInputDevice*, Void*, Win32cr::Foundation::HRESULT),
    send_raw_device_output : Proc(IGameInputDevice*, Void*, Win32cr::Foundation::HRESULT),
    send_raw_device_output_with_response : Proc(IGameInputDevice*, Void*, Void**, Win32cr::Foundation::HRESULT),
    execute_raw_device_io_control : Proc(IGameInputDevice*, UInt32, LibC::UIntPtrT, Void*, LibC::UIntPtrT, Void*, LibC::UIntPtrT*, Win32cr::Foundation::HRESULT),
    acquire_exclusive_raw_device_access : Proc(IGameInputDevice*, UInt64, Bool),
    release_exclusive_raw_device_access : Proc(IGameInputDevice*, Void)


  @[Extern]
  record IGameInputDevice, lpVtbl : IGameInputDeviceVtable* do
    GUID = LibC::GUID.new(0x31dd86fb_u32, 0x4c1b_u16, 0x408a_u16, StaticArray[0x86_u8, 0x8f_u8, 0x43_u8, 0x9b_u8, 0x3c_u8, 0xd4_u8, 0x71_u8, 0x25_u8])
    def query_interface(this : IGameInputDevice*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGameInputDevice*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGameInputDevice*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_device_info(this : IGameInputDevice*) : Win32cr::UI::Input::GameInput::GameInputDeviceInfo*
      @lpVtbl.try &.value.get_device_info.call(this)
    end
    def get_device_status(this : IGameInputDevice*) : Win32cr::UI::Input::GameInput::GameInputDeviceStatus
      @lpVtbl.try &.value.get_device_status.call(this)
    end
    def get_battery_state(this : IGameInputDevice*, state : Win32cr::UI::Input::GameInput::GameInputBatteryState*) : Void
      @lpVtbl.try &.value.get_battery_state.call(this, state)
    end
    def create_force_feedback_effect(this : IGameInputDevice*, motorIndex : UInt32, params : Win32cr::UI::Input::GameInput::GameInputForceFeedbackParams*, effect : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_force_feedback_effect.call(this, motorIndex, params, effect)
    end
    def is_force_feedback_motor_powered_on(this : IGameInputDevice*, motorIndex : UInt32) : Bool
      @lpVtbl.try &.value.is_force_feedback_motor_powered_on.call(this, motorIndex)
    end
    def set_force_feedback_motor_gain(this : IGameInputDevice*, motorIndex : UInt32, masterGain : Float32) : Void
      @lpVtbl.try &.value.set_force_feedback_motor_gain.call(this, motorIndex, masterGain)
    end
    def set_haptic_motor_state(this : IGameInputDevice*, motorIndex : UInt32, params : Win32cr::UI::Input::GameInput::GameInputHapticFeedbackParams*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_haptic_motor_state.call(this, motorIndex, params)
    end
    def set_rumble_state(this : IGameInputDevice*, params : Win32cr::UI::Input::GameInput::GameInputRumbleParams*) : Void
      @lpVtbl.try &.value.set_rumble_state.call(this, params)
    end
    def set_input_synchronization_state(this : IGameInputDevice*, enabled : UInt8) : Void
      @lpVtbl.try &.value.set_input_synchronization_state.call(this, enabled)
    end
    def send_input_synchronization_hint(this : IGameInputDevice*) : Void
      @lpVtbl.try &.value.send_input_synchronization_hint.call(this)
    end
    def power_off(this : IGameInputDevice*) : Void
      @lpVtbl.try &.value.power_off.call(this)
    end
    def create_raw_device_report(this : IGameInputDevice*, reportId : UInt32, reportKind : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportKind, report : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_raw_device_report.call(this, reportId, reportKind, report)
    end
    def get_raw_device_feature(this : IGameInputDevice*, reportId : UInt32, report : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_raw_device_feature.call(this, reportId, report)
    end
    def set_raw_device_feature(this : IGameInputDevice*, report : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_raw_device_feature.call(this, report)
    end
    def send_raw_device_output(this : IGameInputDevice*, report : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_raw_device_output.call(this, report)
    end
    def send_raw_device_output_with_response(this : IGameInputDevice*, requestReport : Void*, responseReport : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.send_raw_device_output_with_response.call(this, requestReport, responseReport)
    end
    def execute_raw_device_io_control(this : IGameInputDevice*, controlCode : UInt32, inputBufferSize : LibC::UIntPtrT, inputBuffer : Void*, outputBufferSize : LibC::UIntPtrT, outputBuffer : Void*, outputSize : LibC::UIntPtrT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.execute_raw_device_io_control.call(this, controlCode, inputBufferSize, inputBuffer, outputBufferSize, outputBuffer, outputSize)
    end
    def acquire_exclusive_raw_device_access(this : IGameInputDevice*, timeoutInMicroseconds : UInt64) : Bool
      @lpVtbl.try &.value.acquire_exclusive_raw_device_access.call(this, timeoutInMicroseconds)
    end
    def release_exclusive_raw_device_access(this : IGameInputDevice*) : Void
      @lpVtbl.try &.value.release_exclusive_raw_device_access.call(this)
    end

  end

  @[Extern]

  record IGameInputDispatcherVtable,
    query_interface : Proc(IGameInputDispatcher*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGameInputDispatcher*, UInt32),
    release : Proc(IGameInputDispatcher*, UInt32),
    dispatch : Proc(IGameInputDispatcher*, UInt64, Bool),
    open_wait_handle : Proc(IGameInputDispatcher*, Win32cr::Foundation::HANDLE*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGameInputDispatcher, lpVtbl : IGameInputDispatcherVtable* do
    GUID = LibC::GUID.new(0x415eed2e_u32, 0x98cb_u16, 0x42c2_u16, StaticArray[0x8f_u8, 0x28_u8, 0xb9_u8, 0x46_u8, 0x1_u8, 0x7_u8, 0x4e_u8, 0x31_u8])
    def query_interface(this : IGameInputDispatcher*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGameInputDispatcher*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGameInputDispatcher*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def dispatch(this : IGameInputDispatcher*, quotaInMicroseconds : UInt64) : Bool
      @lpVtbl.try &.value.dispatch.call(this, quotaInMicroseconds)
    end
    def open_wait_handle(this : IGameInputDispatcher*, waitHandle : Win32cr::Foundation::HANDLE*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_wait_handle.call(this, waitHandle)
    end

  end

  @[Extern]

  record IGameInputForceFeedbackEffectVtable,
    query_interface : Proc(IGameInputForceFeedbackEffect*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGameInputForceFeedbackEffect*, UInt32),
    release : Proc(IGameInputForceFeedbackEffect*, UInt32),
    get_device : Proc(IGameInputForceFeedbackEffect*, Void**, Void),
    get_motor_index : Proc(IGameInputForceFeedbackEffect*, UInt32),
    get_gain : Proc(IGameInputForceFeedbackEffect*, Float32),
    set_gain : Proc(IGameInputForceFeedbackEffect*, Float32, Void),
    get_params : Proc(IGameInputForceFeedbackEffect*, Win32cr::UI::Input::GameInput::GameInputForceFeedbackParams*, Void),
    set_params : Proc(IGameInputForceFeedbackEffect*, Win32cr::UI::Input::GameInput::GameInputForceFeedbackParams*, Bool),
    get_state : Proc(IGameInputForceFeedbackEffect*, Win32cr::UI::Input::GameInput::GameInputFeedbackEffectState),
    set_state : Proc(IGameInputForceFeedbackEffect*, Win32cr::UI::Input::GameInput::GameInputFeedbackEffectState, Void)


  @[Extern]
  record IGameInputForceFeedbackEffect, lpVtbl : IGameInputForceFeedbackEffectVtable* do
    GUID = LibC::GUID.new(0x51bda05e_u32, 0xf742_u16, 0x45d9_u16, StaticArray[0xb0_u8, 0x85_u8, 0x94_u8, 0x44_u8, 0xae_u8, 0x48_u8, 0x38_u8, 0x1d_u8])
    def query_interface(this : IGameInputForceFeedbackEffect*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGameInputForceFeedbackEffect*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGameInputForceFeedbackEffect*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_device(this : IGameInputForceFeedbackEffect*, device : Void**) : Void
      @lpVtbl.try &.value.get_device.call(this, device)
    end
    def get_motor_index(this : IGameInputForceFeedbackEffect*) : UInt32
      @lpVtbl.try &.value.get_motor_index.call(this)
    end
    def get_gain(this : IGameInputForceFeedbackEffect*) : Float32
      @lpVtbl.try &.value.get_gain.call(this)
    end
    def set_gain(this : IGameInputForceFeedbackEffect*, gain : Float32) : Void
      @lpVtbl.try &.value.set_gain.call(this, gain)
    end
    def get_params(this : IGameInputForceFeedbackEffect*, params : Win32cr::UI::Input::GameInput::GameInputForceFeedbackParams*) : Void
      @lpVtbl.try &.value.get_params.call(this, params)
    end
    def set_params(this : IGameInputForceFeedbackEffect*, params : Win32cr::UI::Input::GameInput::GameInputForceFeedbackParams*) : Bool
      @lpVtbl.try &.value.set_params.call(this, params)
    end
    def get_state(this : IGameInputForceFeedbackEffect*) : Win32cr::UI::Input::GameInput::GameInputFeedbackEffectState
      @lpVtbl.try &.value.get_state.call(this)
    end
    def set_state(this : IGameInputForceFeedbackEffect*, state : Win32cr::UI::Input::GameInput::GameInputFeedbackEffectState) : Void
      @lpVtbl.try &.value.set_state.call(this, state)
    end

  end

  @[Extern]

  record IGameInputRawDeviceReportVtable,
    query_interface : Proc(IGameInputRawDeviceReport*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGameInputRawDeviceReport*, UInt32),
    release : Proc(IGameInputRawDeviceReport*, UInt32),
    get_device : Proc(IGameInputRawDeviceReport*, Void**, Void),
    get_report_info : Proc(IGameInputRawDeviceReport*, Win32cr::UI::Input::GameInput::GameInputRawDeviceReportInfo*),
    get_raw_data_size : Proc(IGameInputRawDeviceReport*, LibC::UIntPtrT),
    get_raw_data : Proc(IGameInputRawDeviceReport*, LibC::UIntPtrT, Void*, LibC::UIntPtrT),
    set_raw_data : Proc(IGameInputRawDeviceReport*, LibC::UIntPtrT, Void*, Bool),
    get_item_value : Proc(IGameInputRawDeviceReport*, UInt32, Int64*, Bool),
    set_item_value : Proc(IGameInputRawDeviceReport*, UInt32, Int64, Bool),
    reset_item_value : Proc(IGameInputRawDeviceReport*, UInt32, Bool),
    reset_all_items : Proc(IGameInputRawDeviceReport*, Bool)


  @[Extern]
  record IGameInputRawDeviceReport, lpVtbl : IGameInputRawDeviceReportVtable* do
    GUID = LibC::GUID.new(0x61f08cf1_u32, 0x1ffc_u16, 0x40ca_u16, StaticArray[0xa2_u8, 0xb8_u8, 0xe1_u8, 0xab_u8, 0x8b_u8, 0xc5_u8, 0xb6_u8, 0xdc_u8])
    def query_interface(this : IGameInputRawDeviceReport*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGameInputRawDeviceReport*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGameInputRawDeviceReport*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_device(this : IGameInputRawDeviceReport*, device : Void**) : Void
      @lpVtbl.try &.value.get_device.call(this, device)
    end
    def get_report_info(this : IGameInputRawDeviceReport*) : Win32cr::UI::Input::GameInput::GameInputRawDeviceReportInfo*
      @lpVtbl.try &.value.get_report_info.call(this)
    end
    def get_raw_data_size(this : IGameInputRawDeviceReport*) : LibC::UIntPtrT
      @lpVtbl.try &.value.get_raw_data_size.call(this)
    end
    def get_raw_data(this : IGameInputRawDeviceReport*, bufferSize : LibC::UIntPtrT, buffer : Void*) : LibC::UIntPtrT
      @lpVtbl.try &.value.get_raw_data.call(this, bufferSize, buffer)
    end
    def set_raw_data(this : IGameInputRawDeviceReport*, bufferSize : LibC::UIntPtrT, buffer : Void*) : Bool
      @lpVtbl.try &.value.set_raw_data.call(this, bufferSize, buffer)
    end
    def get_item_value(this : IGameInputRawDeviceReport*, itemIndex : UInt32, value : Int64*) : Bool
      @lpVtbl.try &.value.get_item_value.call(this, itemIndex, value)
    end
    def set_item_value(this : IGameInputRawDeviceReport*, itemIndex : UInt32, value : Int64) : Bool
      @lpVtbl.try &.value.set_item_value.call(this, itemIndex, value)
    end
    def reset_item_value(this : IGameInputRawDeviceReport*, itemIndex : UInt32) : Bool
      @lpVtbl.try &.value.reset_item_value.call(this, itemIndex)
    end
    def reset_all_items(this : IGameInputRawDeviceReport*) : Bool
      @lpVtbl.try &.value.reset_all_items.call(this)
    end

  end

  def gameInputCreate(gameInput : Void**) : Win32cr::Foundation::HRESULT
    {% if !flag?(:docs) %}
    C.GameInputCreate(gameInput)
    {% end %}
  end

  @[Link("gameinput")]
  {% if !flag?(:docs) %}
  lib C
    # :nodoc:
    fun GameInputCreate(gameInput : Void**) : Win32cr::Foundation::HRESULT

  end
  {% end %}
end