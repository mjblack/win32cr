require "./../system/com.cr"
require "./../foundation.cr"
require "./windows_and_messaging.cr"

module Win32cr::UI::Accessibility
  alias HWINEVENTHOOK = LibC::IntPtrT
  alias HUIANODE = LibC::IntPtrT
  alias HUIAPATTERNOBJECT = LibC::IntPtrT
  alias HUIATEXTRANGE = LibC::IntPtrT
  alias HUIAEVENT = LibC::IntPtrT
  alias LPFNLRESULTFROMOBJECT = Proc(LibC::GUID*, Win32cr::Foundation::WPARAM, Void*, Win32cr::Foundation::LRESULT)

  alias LPFNOBJECTFROMLRESULT = Proc(Win32cr::Foundation::LRESULT, LibC::GUID*, Win32cr::Foundation::WPARAM, Void**, Win32cr::Foundation::HRESULT)

  alias LPFNACCESSIBLEOBJECTFROMWINDOW = Proc(Win32cr::Foundation::HWND, UInt32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)

  alias LPFNACCESSIBLEOBJECTFROMPOINT = Proc(Win32cr::Foundation::POINT, Void**, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)

  alias LPFNCREATESTDACCESSIBLEOBJECT = Proc(Win32cr::Foundation::HWND, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT)

  alias LPFNACCESSIBLECHILDREN = Proc(Void*, Int32, Int32, Win32cr::System::Com::VARIANT*, Int32*, Win32cr::Foundation::HRESULT)

  alias UiaProviderCallback = Proc(Win32cr::Foundation::HWND, Win32cr::UI::Accessibility::ProviderType, Win32cr::System::Com::SAFEARRAY*)

  alias UiaEventCallback = Proc(Win32cr::UI::Accessibility::UiaEventArgs*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::BSTR, Void)

  alias WINEVENTPROC = Proc(Win32cr::UI::Accessibility::HWINEVENTHOOK, UInt32, Win32cr::Foundation::HWND, Int32, Int32, UInt32, UInt32, Void)

  LIBID_Accessibility = "1ea4dbf0-3c3b-11cf-810c-00aa00389b71"
  CLSID_AccPropServices = "b5f8350b-0548-48b1-a6ee-88bd00b4a5e7"
  IIS_IsOleaccProxy = "902697fa-80e4-4560-802a-a13f22a64709"
  IIS_ControlAccessible = "38c682a6-9731-43f2-9fae-e901e641b101"
  ANRUS_PRIORITY_AUDIO_DYNAMIC_DUCK = 16_u32
  MSAA_MENU_SIG = -1441927155_i32
  PROPID_ACC_NAME = "608d3df8-8128-4aa7-a428-f55e49267291"
  PROPID_ACC_VALUE = "123fe443-211a-4615-9527-c45a7e93717a"
  PROPID_ACC_DESCRIPTION = "4d48dfe4-bd3f-491f-a648-492d6f20c588"
  PROPID_ACC_ROLE = "cb905ff2-7bd1-4c05-b3c8-e6c241364d70"
  PROPID_ACC_STATE = "a8d4d5b0-0a21-42d0-a5c0-514e984f457b"
  PROPID_ACC_HELP = "c831e11f-44db-4a99-9768-cb8f978b7231"
  PROPID_ACC_KEYBOARDSHORTCUT = "7d9bceee-7d1e-4979-9382-5180f4172c34"
  PROPID_ACC_DEFAULTACTION = "180c072b-c27f-43c7-9922-f63562a4632b"
  PROPID_ACC_HELPTOPIC = "787d1379-8ede-440b-8aec-11f7bf9030b3"
  PROPID_ACC_FOCUS = "6eb335df-1c29-4127-b12c-dee9fd157f2b"
  PROPID_ACC_SELECTION = "b99d073c-d731-405b-9061-d95e8f842984"
  PROPID_ACC_PARENT = "474c22b6-ffc2-467a-b1b5-e958b4657330"
  PROPID_ACC_NAV_UP = "016e1a2b-1a4e-4767-8612-3386f66935ec"
  PROPID_ACC_NAV_DOWN = "031670ed-3cdf-48d2-9613-138f2dd8a668"
  PROPID_ACC_NAV_LEFT = "228086cb-82f1-4a39-8705-dcdc0fff92f5"
  PROPID_ACC_NAV_RIGHT = "cd211d9f-e1cb-4fe5-a77c-920b884d095b"
  PROPID_ACC_NAV_PREV = "776d3891-c73b-4480-b3f6-076a16a15af6"
  PROPID_ACC_NAV_NEXT = "1cdc5455-8cd9-4c92-a371-3939a2fe3eee"
  PROPID_ACC_NAV_FIRSTCHILD = "cfd02558-557b-4c67-84f9-2a09fce40749"
  PROPID_ACC_NAV_LASTCHILD = "302ecaa5-48d5-4f8d-b671-1a8d20a77832"
  PROPID_ACC_ROLEMAP = "f79acda2-140d-4fe6-8914-208476328269"
  PROPID_ACC_VALUEMAP = "da1c3d79-fc5c-420e-b399-9d1533549e75"
  PROPID_ACC_STATEMAP = "43946c5e-0ac0-4042-b525-07bbdbe17fa7"
  PROPID_ACC_DESCRIPTIONMAP = "1ff1435f-8a14-477b-b226-a0abe279975d"
  PROPID_ACC_DODEFAULTACTION = "1ba09523-2e3b-49a6-a059-59682a3c48fd"
  DISPID_ACC_PARENT = -5000_i32
  DISPID_ACC_CHILDCOUNT = -5001_i32
  DISPID_ACC_CHILD = -5002_i32
  DISPID_ACC_NAME = -5003_i32
  DISPID_ACC_VALUE = -5004_i32
  DISPID_ACC_DESCRIPTION = -5005_i32
  DISPID_ACC_ROLE = -5006_i32
  DISPID_ACC_STATE = -5007_i32
  DISPID_ACC_HELP = -5008_i32
  DISPID_ACC_HELPTOPIC = -5009_i32
  DISPID_ACC_KEYBOARDSHORTCUT = -5010_i32
  DISPID_ACC_FOCUS = -5011_i32
  DISPID_ACC_SELECTION = -5012_i32
  DISPID_ACC_DEFAULTACTION = -5013_i32
  DISPID_ACC_SELECT = -5014_i32
  DISPID_ACC_LOCATION = -5015_i32
  DISPID_ACC_NAVIGATE = -5016_i32
  DISPID_ACC_HITTEST = -5017_i32
  DISPID_ACC_DODEFAULTACTION = -5018_i32
  NAVDIR_MIN = 0_u32
  NAVDIR_UP = 1_u32
  NAVDIR_DOWN = 2_u32
  NAVDIR_LEFT = 3_u32
  NAVDIR_RIGHT = 4_u32
  NAVDIR_NEXT = 5_u32
  NAVDIR_PREVIOUS = 6_u32
  NAVDIR_FIRSTCHILD = 7_u32
  NAVDIR_LASTCHILD = 8_u32
  NAVDIR_MAX = 9_u32
  SELFLAG_NONE = 0_u32
  SELFLAG_TAKEFOCUS = 1_u32
  SELFLAG_TAKESELECTION = 2_u32
  SELFLAG_EXTENDSELECTION = 4_u32
  SELFLAG_ADDSELECTION = 8_u32
  SELFLAG_REMOVESELECTION = 16_u32
  SELFLAG_VALID = 31_u32
  STATE_SYSTEM_NORMAL = 0_u32
  STATE_SYSTEM_HASPOPUP = 1073741824_u32
  ROLE_SYSTEM_TITLEBAR = 1_u32
  ROLE_SYSTEM_MENUBAR = 2_u32
  ROLE_SYSTEM_SCROLLBAR = 3_u32
  ROLE_SYSTEM_GRIP = 4_u32
  ROLE_SYSTEM_SOUND = 5_u32
  ROLE_SYSTEM_CURSOR = 6_u32
  ROLE_SYSTEM_CARET = 7_u32
  ROLE_SYSTEM_ALERT = 8_u32
  ROLE_SYSTEM_WINDOW = 9_u32
  ROLE_SYSTEM_CLIENT = 10_u32
  ROLE_SYSTEM_MENUPOPUP = 11_u32
  ROLE_SYSTEM_MENUITEM = 12_u32
  ROLE_SYSTEM_TOOLTIP = 13_u32
  ROLE_SYSTEM_APPLICATION = 14_u32
  ROLE_SYSTEM_DOCUMENT = 15_u32
  ROLE_SYSTEM_PANE = 16_u32
  ROLE_SYSTEM_CHART = 17_u32
  ROLE_SYSTEM_DIALOG = 18_u32
  ROLE_SYSTEM_BORDER = 19_u32
  ROLE_SYSTEM_GROUPING = 20_u32
  ROLE_SYSTEM_SEPARATOR = 21_u32
  ROLE_SYSTEM_TOOLBAR = 22_u32
  ROLE_SYSTEM_STATUSBAR = 23_u32
  ROLE_SYSTEM_TABLE = 24_u32
  ROLE_SYSTEM_COLUMNHEADER = 25_u32
  ROLE_SYSTEM_ROWHEADER = 26_u32
  ROLE_SYSTEM_COLUMN = 27_u32
  ROLE_SYSTEM_ROW = 28_u32
  ROLE_SYSTEM_CELL = 29_u32
  ROLE_SYSTEM_LINK = 30_u32
  ROLE_SYSTEM_HELPBALLOON = 31_u32
  ROLE_SYSTEM_CHARACTER = 32_u32
  ROLE_SYSTEM_LIST = 33_u32
  ROLE_SYSTEM_LISTITEM = 34_u32
  ROLE_SYSTEM_OUTLINE = 35_u32
  ROLE_SYSTEM_OUTLINEITEM = 36_u32
  ROLE_SYSTEM_PAGETAB = 37_u32
  ROLE_SYSTEM_PROPERTYPAGE = 38_u32
  ROLE_SYSTEM_INDICATOR = 39_u32
  ROLE_SYSTEM_GRAPHIC = 40_u32
  ROLE_SYSTEM_STATICTEXT = 41_u32
  ROLE_SYSTEM_TEXT = 42_u32
  ROLE_SYSTEM_PUSHBUTTON = 43_u32
  ROLE_SYSTEM_CHECKBUTTON = 44_u32
  ROLE_SYSTEM_RADIOBUTTON = 45_u32
  ROLE_SYSTEM_COMBOBOX = 46_u32
  ROLE_SYSTEM_DROPLIST = 47_u32
  ROLE_SYSTEM_PROGRESSBAR = 48_u32
  ROLE_SYSTEM_DIAL = 49_u32
  ROLE_SYSTEM_HOTKEYFIELD = 50_u32
  ROLE_SYSTEM_SLIDER = 51_u32
  ROLE_SYSTEM_SPINBUTTON = 52_u32
  ROLE_SYSTEM_DIAGRAM = 53_u32
  ROLE_SYSTEM_ANIMATION = 54_u32
  ROLE_SYSTEM_EQUATION = 55_u32
  ROLE_SYSTEM_BUTTONDROPDOWN = 56_u32
  ROLE_SYSTEM_BUTTONMENU = 57_u32
  ROLE_SYSTEM_BUTTONDROPDOWNGRID = 58_u32
  ROLE_SYSTEM_WHITESPACE = 59_u32
  ROLE_SYSTEM_PAGETABLIST = 60_u32
  ROLE_SYSTEM_CLOCK = 61_u32
  ROLE_SYSTEM_SPLITBUTTON = 62_u32
  ROLE_SYSTEM_IPADDRESS = 63_u32
  ROLE_SYSTEM_OUTLINEBUTTON = 64_u32
  UIA_E_ELEMENTNOTENABLED = 2147746304_u32
  UIA_E_ELEMENTNOTAVAILABLE = 2147746305_u32
  UIA_E_NOCLICKABLEPOINT = 2147746306_u32
  UIA_E_PROXYASSEMBLYNOTLOADED = 2147746307_u32
  UIA_E_NOTSUPPORTED = 2147746308_u32
  UIA_E_INVALIDOPERATION = 2148734217_u32
  UIA_E_TIMEOUT = 2148734213_u32
  UiaAppendRuntimeId = 3_u32
  UiaRootObjectId = -25_i32
  RuntimeId_Property_GUID = "a39eebfa-7fba-4c89-b4d4-b99e2de7d160"
  BoundingRectangle_Property_GUID = "7bbfe8b2-3bfc-48dd-b729-c794b846e9a1"
  ProcessId_Property_GUID = "40499998-9c31-4245-a403-87320e59eaf6"
  ControlType_Property_GUID = "ca774fea-28ac-4bc2-94ca-acec6d6c10a3"
  LocalizedControlType_Property_GUID = "8763404f-a1bd-452a-89c4-3f01d3833806"
  Name_Property_GUID = "c3a6921b-4a99-44f1-bca6-61187052c431"
  AcceleratorKey_Property_GUID = "514865df-2557-4cb9-aeed-6ced084ce52c"
  AccessKey_Property_GUID = "06827b12-a7f9-4a15-917c-ffa5ad3eb0a7"
  HasKeyboardFocus_Property_GUID = "cf8afd39-3f46-4800-9656-b2bf12529905"
  IsKeyboardFocusable_Property_GUID = "f7b8552a-0859-4b37-b9cb-51e72092f29f"
  IsEnabled_Property_GUID = "2109427f-da60-4fed-bf1b-264bdce6eb3a"
  AutomationId_Property_GUID = "c82c0500-b60e-4310-a267-303c531f8ee5"
  ClassName_Property_GUID = "157b7215-894f-4b65-84e2-aac0da08b16b"
  HelpText_Property_GUID = "08555685-0977-45c7-a7a6-abaf5684121a"
  ClickablePoint_Property_GUID = "0196903b-b203-4818-a9f3-f08e675f2341"
  Culture_Property_GUID = "e2d74f27-3d79-4dc2-b88b-3044963a8afb"
  IsControlElement_Property_GUID = "95f35085-abcc-4afd-a5f4-dbb46c230fdb"
  IsContentElement_Property_GUID = "4bda64a8-f5d8-480b-8155-ef2e89adb672"
  LabeledBy_Property_GUID = "e5b8924b-fc8a-4a35-8031-cf78ac43e55e"
  IsPassword_Property_GUID = "e8482eb1-687c-497b-bebc-03be53ec1454"
  NewNativeWindowHandle_Property_GUID = "5196b33b-380a-4982-95e1-91f3ef60e024"
  ItemType_Property_GUID = "cdda434d-6222-413b-a68a-325dd1d40f39"
  IsOffscreen_Property_GUID = "03c3d160-db79-42db-a2ef-1c231eede507"
  Orientation_Property_GUID = "a01eee62-3884-4415-887e-678ec21e39ba"
  FrameworkId_Property_GUID = "dbfd9900-7e1a-4f58-b61b-7063120f773b"
  IsRequiredForForm_Property_GUID = "4f5f43cf-59fb-4bde-a270-602e5e1141e9"
  ItemStatus_Property_GUID = "51de0321-3973-43e7-8913-0b08e813c37f"
  AriaRole_Property_GUID = "dd207b95-be4a-4e0d-b727-63ace94b6916"
  AriaProperties_Property_GUID = "4213678c-e025-4922-beb5-e43ba08e6221"
  IsDataValidForForm_Property_GUID = "445ac684-c3fc-4dd9-acf8-845a579296ba"
  ControllerFor_Property_GUID = "51124c8a-a5d2-4f13-9be6-7fa8ba9d3a90"
  DescribedBy_Property_GUID = "7c5865b8-9992-40fd-8db0-6bf1d317f998"
  FlowsTo_Property_GUID = "e4f33d20-559a-47fb-a830-f9cb4ff1a70a"
  ProviderDescription_Property_GUID = "dca5708a-c16b-4cd9-b889-beb16a804904"
  OptimizeForVisualContent_Property_GUID = "6a852250-c75a-4e5d-b858-e381b0f78861"
  IsDockPatternAvailable_Property_GUID = "2600a4c4-2ff8-4c96-ae31-8fe619a13c6c"
  IsExpandCollapsePatternAvailable_Property_GUID = "929d3806-5287-4725-aa16-222afc63d595"
  IsGridItemPatternAvailable_Property_GUID = "5a43e524-f9a2-4b12-84c8-b48a3efedd34"
  IsGridPatternAvailable_Property_GUID = "5622c26c-f0ef-4f3b-97cb-714c0868588b"
  IsInvokePatternAvailable_Property_GUID = "4e725738-8364-4679-aa6c-f3f41931f750"
  IsMultipleViewPatternAvailable_Property_GUID = "ff0a31eb-8e25-469d-8d6e-e771a27c1b90"
  IsRangeValuePatternAvailable_Property_GUID = "fda4244a-eb4d-43ff-b5ad-ed36d373ec4c"
  IsScrollPatternAvailable_Property_GUID = "3ebb7b4a-828a-4b57-9d22-2fea1632ed0d"
  IsScrollItemPatternAvailable_Property_GUID = "1cad1a05-0927-4b76-97e1-0fcdb209b98a"
  IsSelectionItemPatternAvailable_Property_GUID = "8becd62d-0bc3-4109-bee2-8e6715290e68"
  IsSelectionPatternAvailable_Property_GUID = "f588acbe-c769-4838-9a60-2686dc1188c4"
  IsTablePatternAvailable_Property_GUID = "cb83575f-45c2-4048-9c76-159715a139df"
  IsTableItemPatternAvailable_Property_GUID = "eb36b40d-8ea4-489b-a013-e60d5951fe34"
  IsTextPatternAvailable_Property_GUID = "fbe2d69d-aff6-4a45-82e2-fc92a82f5917"
  IsTogglePatternAvailable_Property_GUID = "78686d53-fcd0-4b83-9b78-5832ce63bb5b"
  IsTransformPatternAvailable_Property_GUID = "a7f78804-d68b-4077-a5c6-7a5ea1ac31c5"
  IsValuePatternAvailable_Property_GUID = "0b5020a7-2119-473b-be37-5ceb98bbfb22"
  IsWindowPatternAvailable_Property_GUID = "e7a57bb1-5888-4155-98dc-b422fd57f2bc"
  IsLegacyIAccessiblePatternAvailable_Property_GUID = "d8ebd0c7-929a-4ee7-8d3a-d3d94413027b"
  IsItemContainerPatternAvailable_Property_GUID = "624b5ca7-fe40-4957-a019-20c4cf11920f"
  IsVirtualizedItemPatternAvailable_Property_GUID = "302cb151-2ac8-45d6-977b-d2b3a5a53f20"
  IsSynchronizedInputPatternAvailable_Property_GUID = "75d69cc5-d2bf-4943-876e-b45b62a6cc66"
  IsObjectModelPatternAvailable_Property_GUID = "6b21d89b-2841-412f-8ef2-15ca952318ba"
  IsAnnotationPatternAvailable_Property_GUID = "0b5b3238-6d5c-41b6-bcc4-5e807f6551c4"
  IsTextPattern2Available_Property_GUID = "41cf921d-e3f1-4b22-9c81-e1c3ed331c22"
  IsTextEditPatternAvailable_Property_GUID = "7843425c-8b32-484c-9ab5-e3200571ffda"
  IsCustomNavigationPatternAvailable_Property_GUID = "8f8e80d4-2351-48e0-874a-54aa7313889a"
  IsStylesPatternAvailable_Property_GUID = "27f353d3-459c-4b59-a490-50611dacafb5"
  IsSpreadsheetPatternAvailable_Property_GUID = "6ff43732-e4b4-4555-97bc-ecdbbc4d1888"
  IsSpreadsheetItemPatternAvailable_Property_GUID = "9fe79b2a-2f94-43fd-996b-549e316f4acd"
  IsTransformPattern2Available_Property_GUID = "25980b4b-be04-4710-ab4a-fda31dbd2895"
  IsTextChildPatternAvailable_Property_GUID = "559e65df-30ff-43b5-b5ed-5b283b80c7e9"
  IsDragPatternAvailable_Property_GUID = "e997a7b7-1d39-4ca7-be0f-277fcf5605cc"
  IsDropTargetPatternAvailable_Property_GUID = "0686b62e-8e19-4aaf-873d-384f6d3b92be"
  IsStructuredMarkupPatternAvailable_Property_GUID = "b0d4c196-2c0b-489c-b165-a405928c6f3d"
  IsPeripheral_Property_GUID = "da758276-7ed5-49d4-8e68-ecc9a2d300dd"
  PositionInSet_Property_GUID = "33d1dc54-641e-4d76-a6b1-13f341c1f896"
  SizeOfSet_Property_GUID = "1600d33c-3b9f-4369-9431-aa293f344cf1"
  Level_Property_GUID = "242ac529-cd36-400f-aad9-7876ef3af627"
  AnnotationTypes_Property_GUID = "64b71f76-53c4-4696-a219-20e940c9a176"
  AnnotationObjects_Property_GUID = "310910c8-7c6e-4f20-becd-4aaf6d191156"
  LandmarkType_Property_GUID = "454045f2-6f61-49f7-a4f8-b5f0cf82da1e"
  LocalizedLandmarkType_Property_GUID = "7ac81980-eafb-4fb2-bf91-f485bef5e8e1"
  FullDescription_Property_GUID = "0d4450ff-6aef-4f33-95dd-7befa72a4391"
  Value_Value_Property_GUID = "e95f5e64-269f-4a85-ba99-4092c3ea2986"
  Value_IsReadOnly_Property_GUID = "eb090f30-e24c-4799-a705-0d247bc037f8"
  RangeValue_Value_Property_GUID = "131f5d98-c50c-489d-abe5-ae220898c5f7"
  RangeValue_IsReadOnly_Property_GUID = "25fa1055-debf-4373-a79e-1f1a1908d3c4"
  RangeValue_Minimum_Property_GUID = "78cbd3b2-684d-4860-af93-d1f95cb022fd"
  RangeValue_Maximum_Property_GUID = "19319914-f979-4b35-a1a6-d37e05433473"
  RangeValue_LargeChange_Property_GUID = "a1f96325-3a3d-4b44-8e1f-4a46d9844019"
  RangeValue_SmallChange_Property_GUID = "81c2c457-3941-4107-9975-139760f7c072"
  Scroll_HorizontalScrollPercent_Property_GUID = "c7c13c0e-eb21-47ff-acc4-b5a3350f5191"
  Scroll_HorizontalViewSize_Property_GUID = "70c2e5d4-fcb0-4713-a9aa-af92ff79e4cd"
  Scroll_VerticalScrollPercent_Property_GUID = "6c8d7099-b2a8-4948-bff7-3cf9058bfefb"
  Scroll_VerticalViewSize_Property_GUID = "de6a2e22-d8c7-40c5-83ba-e5f681d53108"
  Scroll_HorizontallyScrollable_Property_GUID = "8b925147-28cd-49ae-bd63-f44118d2e719"
  Scroll_VerticallyScrollable_Property_GUID = "89164798-0068-4315-b89a-1e7cfbbc3dfc"
  Selection_Selection_Property_GUID = "aa6dc2a2-0e2b-4d38-96d5-34e470b81853"
  Selection_CanSelectMultiple_Property_GUID = "49d73da5-c883-4500-883d-8fcf8daf6cbe"
  Selection_IsSelectionRequired_Property_GUID = "b1ae4422-63fe-44e7-a5a5-a738c829b19a"
  Grid_RowCount_Property_GUID = "2a9505bf-c2eb-4fb6-b356-8245ae53703e"
  Grid_ColumnCount_Property_GUID = "fe96f375-44aa-4536-ac7a-2a75d71a3efc"
  GridItem_Row_Property_GUID = "6223972a-c945-4563-9329-fdc974af2553"
  GridItem_Column_Property_GUID = "c774c15c-62c0-4519-8bdc-47be573c8ad5"
  GridItem_RowSpan_Property_GUID = "4582291c-466b-4e93-8e83-3d1715ec0c5e"
  GridItem_ColumnSpan_Property_GUID = "583ea3f5-86d0-4b08-a6ec-2c5463ffc109"
  GridItem_Parent_Property_GUID = "9d912252-b97f-4ecc-8510-ea0e33427c72"
  Dock_DockPosition_Property_GUID = "6d67f02e-c0b0-4b10-b5b9-18d6ecf98760"
  ExpandCollapse_ExpandCollapseState_Property_GUID = "275a4c48-85a7-4f69-aba0-af157610002b"
  MultipleView_CurrentView_Property_GUID = "7a81a67a-b94f-4875-918b-65c8d2f998e5"
  MultipleView_SupportedViews_Property_GUID = "8d5db9fd-ce3c-4ae7-b788-400a3c645547"
  Window_CanMaximize_Property_GUID = "64fff53f-635d-41c1-950c-cb5adfbe28e3"
  Window_CanMinimize_Property_GUID = "b73b4625-5988-4b97-b4c2-a6fe6e78c8c6"
  Window_WindowVisualState_Property_GUID = "4ab7905f-e860-453e-a30a-f6431e5daad5"
  Window_WindowInteractionState_Property_GUID = "4fed26a4-0455-4fa2-b21c-c4da2db1ff9c"
  Window_IsModal_Property_GUID = "ff4e6892-37b9-4fca-8532-ffe674ecfeed"
  Window_IsTopmost_Property_GUID = "ef7d85d3-0937-4962-9241-b62345f24041"
  SelectionItem_IsSelected_Property_GUID = "f122835f-cd5f-43df-b79d-4b849e9e6020"
  SelectionItem_SelectionContainer_Property_GUID = "a4365b6e-9c1e-4b63-8b53-c2421dd1e8fb"
  Table_RowHeaders_Property_GUID = "d9e35b87-6eb8-4562-aac6-a8a9075236a8"
  Table_ColumnHeaders_Property_GUID = "aff1d72b-968d-42b1-b459-150b299da664"
  Table_RowOrColumnMajor_Property_GUID = "83be75c3-29fe-4a30-85e1-2a6277fd106e"
  TableItem_RowHeaderItems_Property_GUID = "b3f853a0-0574-4cd8-bcd7-ed5923572d97"
  TableItem_ColumnHeaderItems_Property_GUID = "967a56a3-74b6-431e-8de6-99c411031c58"
  Toggle_ToggleState_Property_GUID = "b23cdc52-22c2-4c6c-9ded-f5c422479ede"
  Transform_CanMove_Property_GUID = "1b75824d-208b-4fdf-bccd-f1f4e5741f4f"
  Transform_CanResize_Property_GUID = "bb98dca5-4c1a-41d4-a4f6-ebc128644180"
  Transform_CanRotate_Property_GUID = "10079b48-3849-476f-ac96-44a95c8440d9"
  LegacyIAccessible_ChildId_Property_GUID = "9a191b5d-9ef2-4787-a459-dcde885dd4e8"
  LegacyIAccessible_Name_Property_GUID = "caeb063d-40ae-4869-aa5a-1b8e5d666739"
  LegacyIAccessible_Value_Property_GUID = "b5c5b0b6-8217-4a77-97a5-190a85ed0156"
  LegacyIAccessible_Description_Property_GUID = "46448418-7d70-4ea9-9d27-b7e775cf2ad7"
  LegacyIAccessible_Role_Property_GUID = "6856e59f-cbaf-4e31-93e8-bcbf6f7e491c"
  LegacyIAccessible_State_Property_GUID = "df985854-2281-4340-ab9c-c60e2c5803f6"
  LegacyIAccessible_Help_Property_GUID = "94402352-161c-4b77-a98d-a872cc33947a"
  LegacyIAccessible_KeyboardShortcut_Property_GUID = "8f6909ac-00b8-4259-a41c-966266d43a8a"
  LegacyIAccessible_Selection_Property_GUID = "8aa8b1e0-0891-40cc-8b06-90d7d4166219"
  LegacyIAccessible_DefaultAction_Property_GUID = "3b331729-eaad-4502-b85f-92615622913c"
  Annotation_AnnotationTypeId_Property_GUID = "20ae484f-69ef-4c48-8f5b-c4938b206ac7"
  Annotation_AnnotationTypeName_Property_GUID = "9b818892-5ac9-4af9-aa96-f58a77b058e3"
  Annotation_Author_Property_GUID = "7a528462-9c5c-4a03-a974-8b307a9937f2"
  Annotation_DateTime_Property_GUID = "99b5ca5d-1acf-414b-a4d0-6b350b047578"
  Annotation_Target_Property_GUID = "b71b302d-2104-44ad-9c5c-092b4907d70f"
  Styles_StyleId_Property_GUID = "da82852f-3817-4233-82af-02279e72cc77"
  Styles_StyleName_Property_GUID = "1c12b035-05d1-4f55-9e8e-1489f3ff550d"
  Styles_FillColor_Property_GUID = "63eff97a-a1c5-4b1d-84eb-b765f2edd632"
  Styles_FillPatternStyle_Property_GUID = "81cf651f-482b-4451-a30a-e1545e554fb8"
  Styles_Shape_Property_GUID = "c71a23f8-778c-400d-8458-3b543e526984"
  Styles_FillPatternColor_Property_GUID = "939a59fe-8fbd-4e75-a271-ac4595195163"
  Styles_ExtendedProperties_Property_GUID = "f451cda0-ba0a-4681-b0b0-0dbdb53e58f3"
  SpreadsheetItem_Formula_Property_GUID = "e602e47d-1b47-4bea-87cf-3b0b0b5c15b6"
  SpreadsheetItem_AnnotationObjects_Property_GUID = "a3194c38-c9bc-4604-9396-ae3f9f457f7b"
  SpreadsheetItem_AnnotationTypes_Property_GUID = "c70c51d0-d602-4b45-afbc-b4712b96d72b"
  Transform2_CanZoom_Property_GUID = "f357e890-a756-4359-9ca6-86702bf8f381"
  LiveSetting_Property_GUID = "c12bcd8e-2a8e-4950-8ae7-3625111d58eb"
  Drag_IsGrabbed_Property_GUID = "45f206f3-75cc-4cca-a9b9-fcdfb982d8a2"
  Drag_GrabbedItems_Property_GUID = "77c1562c-7b86-4b21-9ed7-3cefda6f4c43"
  Drag_DropEffect_Property_GUID = "646f2779-48d3-4b23-8902-4bf100005df3"
  Drag_DropEffects_Property_GUID = "f5d61156-7ce6-49be-a836-9269dcec920f"
  DropTarget_DropTargetEffect_Property_GUID = "8bb75975-a0ca-4981-b818-87fc66e9509d"
  DropTarget_DropTargetEffects_Property_GUID = "bc1dd4ed-cb89-45f1-a592-e03b08ae790f"
  Transform2_ZoomLevel_Property_GUID = "eee29f1a-f4a2-4b5b-ac65-95cf93283387"
  Transform2_ZoomMinimum_Property_GUID = "742ccc16-4ad1-4e07-96fe-b122c6e6b22b"
  Transform2_ZoomMaximum_Property_GUID = "42ab6b77-ceb0-4eca-b82a-6cfa5fa1fc08"
  FlowsFrom_Property_GUID = "05c6844f-19de-48f8-95fa-880d5b0fd615"
  FillColor_Property_GUID = "6e0ec4d0-e2a8-4a56-9de7-953389933b39"
  OutlineColor_Property_GUID = "c395d6c0-4b55-4762-a073-fd303a634f52"
  FillType_Property_GUID = "c6fc74e4-8cb9-429c-a9e1-9bc4ac372b62"
  VisualEffects_Property_GUID = "e61a8565-aad9-46d7-9e70-4e8a8420d420"
  OutlineThickness_Property_GUID = "13e67cc7-dac2-4888-bdd3-375c62fa9618"
  CenterPoint_Property_GUID = "0cb00c08-540c-4edb-9445-26359ea69785"
  Rotation_Property_GUID = "767cdc7d-aec0-4110-ad32-30edd403492e"
  Size_Property_GUID = "2b5f761d-f885-4404-973f-9b1d98e36d8f"
  ToolTipOpened_Event_GUID = "3f4b97ff-2edc-451d-bca4-95a3188d5b03"
  ToolTipClosed_Event_GUID = "276d71ef-24a9-49b6-8e97-da98b401bbcd"
  StructureChanged_Event_GUID = "59977961-3edd-4b11-b13b-676b2a2a6ca9"
  MenuOpened_Event_GUID = "ebe2e945-66ca-4ed1-9ff8-2ad7df0a1b08"
  AutomationPropertyChanged_Event_GUID = "2527fba1-8d7a-4630-a4cc-e66315942f52"
  AutomationFocusChanged_Event_GUID = "b68a1f17-f60d-41a7-a3cc-b05292155fe0"
  ActiveTextPositionChanged_Event_GUID = "a5c09e9c-c77d-4f25-b491-e5bb7017cbd4"
  AsyncContentLoaded_Event_GUID = "5fdee11c-d2fa-4fb9-904e-5cbee894d5ef"
  MenuClosed_Event_GUID = "3cf1266e-1582-4041-acd7-88a35a965297"
  LayoutInvalidated_Event_GUID = "ed7d6544-a6bd-4595-9bae-3d28946cc715"
  Invoke_Invoked_Event_GUID = "dfd699f0-c915-49dd-b422-dde785c3d24b"
  SelectionItem_ElementAddedToSelectionEvent_Event_GUID = "3c822dd1-c407-4dba-91dd-79d4aed0aec6"
  SelectionItem_ElementRemovedFromSelectionEvent_Event_GUID = "097fa8a9-7079-41af-8b9c-0934d8305e5c"
  SelectionItem_ElementSelectedEvent_Event_GUID = "b9c7dbfb-4ebe-4532-aaf4-008cf647233c"
  Selection_InvalidatedEvent_Event_GUID = "cac14904-16b4-4b53-8e47-4cb1df267bb7"
  Text_TextSelectionChangedEvent_Event_GUID = "918edaa1-71b3-49ae-9741-79beb8d358f3"
  Text_TextChangedEvent_Event_GUID = "4a342082-f483-48c4-ac11-a84b435e2a84"
  Window_WindowOpened_Event_GUID = "d3e81d06-de45-4f2f-9633-de9e02fb65af"
  Window_WindowClosed_Event_GUID = "edf141f8-fa67-4e22-bbf7-944e05735ee2"
  MenuModeStart_Event_GUID = "18d7c631-166a-4ac9-ae3b-ef4b5420e681"
  MenuModeEnd_Event_GUID = "9ecd4c9f-80dd-47b8-8267-5aec06bb2cff"
  InputReachedTarget_Event_GUID = "93ed549a-0549-40f0-bedb-28e44f7de2a3"
  InputReachedOtherElement_Event_GUID = "ed201d8a-4e6c-415e-a874-2460c9b66ba8"
  InputDiscarded_Event_GUID = "7f36c367-7b18-417c-97e3-9d58ddc944ab"
  SystemAlert_Event_GUID = "d271545d-7a3a-47a7-8474-81d29a2451c9"
  LiveRegionChanged_Event_GUID = "102d5e90-e6a9-41b6-b1c5-a9b1929d9510"
  HostedFragmentRootsInvalidated_Event_GUID = "e6bdb03e-0921-4ec5-8dcf-eae877b0426b"
  Drag_DragStart_Event_GUID = "883a480b-3aa9-429d-95e4-d9c8d011f0dd"
  Drag_DragCancel_Event_GUID = "c3ede6fa-3451-4e0f-9e71-df9c280a4657"
  Drag_DragComplete_Event_GUID = "38e96188-ef1f-463e-91ca-3a7792c29caf"
  DropTarget_DragEnter_Event_GUID = "aad9319b-032c-4a88-961d-1cf579581e34"
  DropTarget_DragLeave_Event_GUID = "0f82eb15-24a2-4988-9217-de162aee272b"
  DropTarget_Dropped_Event_GUID = "622cead8-1edb-4a3d-abbc-be2211ff68b5"
  StructuredMarkup_CompositionComplete_Event_GUID = "c48a3c17-677a-4047-a68d-fc1257528aef"
  StructuredMarkup_Deleted_Event_GUID = "f9d0a020-e1c1-4ecf-b9aa-52efde7e41e1"
  StructuredMarkup_SelectionChanged_Event_GUID = "a7c815f7-ff9f-41c7-a3a7-ab6cbfdb4903"
  Invoke_Pattern_GUID = "d976c2fc-66ea-4a6e-b28f-c24c7546ad37"
  Selection_Pattern_GUID = "66e3b7e8-d821-4d25-8761-435d2c8b253f"
  Value_Pattern_GUID = "17faad9e-c877-475b-b933-77332779b637"
  RangeValue_Pattern_GUID = "18b00d87-b1c9-476a-bfbd-5f0bdb926f63"
  Scroll_Pattern_GUID = "895fa4b4-759d-4c50-8e15-03460672003c"
  ExpandCollapse_Pattern_GUID = "ae05efa2-f9d1-428a-834c-53a5c52f9b8b"
  Grid_Pattern_GUID = "260a2ccb-93a8-4e44-a4c1-3df397f2b02b"
  GridItem_Pattern_GUID = "f2d5c877-a462-4957-a2a5-2c96b303bc63"
  MultipleView_Pattern_GUID = "547a6ae4-113f-47c4-850f-db4dfa466b1d"
  Window_Pattern_GUID = "27901735-c760-4994-ad11-5919e606b110"
  SelectionItem_Pattern_GUID = "9bc64eeb-87c7-4b28-94bb-4d9fa437b6ef"
  Dock_Pattern_GUID = "9cbaa846-83c8-428d-827f-7e6063fe0620"
  Table_Pattern_GUID = "c415218e-a028-461e-aa92-8f925cf79351"
  TableItem_Pattern_GUID = "df1343bd-1888-4a29-a50c-b92e6de37f6f"
  Text_Pattern_GUID = "8615f05d-7de5-44fd-a679-2ca4b46033a8"
  Toggle_Pattern_GUID = "0b419760-e2f4-43ff-8c5f-9457c82b56e9"
  Transform_Pattern_GUID = "24b46fdb-587e-49f1-9c4a-d8e98b664b7b"
  ScrollItem_Pattern_GUID = "4591d005-a803-4d5c-b4d5-8d2800f906a7"
  LegacyIAccessible_Pattern_GUID = "54cc0a9f-3395-48af-ba8d-73f85690f3e0"
  ItemContainer_Pattern_GUID = "3d13da0f-8b9a-4a99-85fa-c5c9a69f1ed4"
  VirtualizedItem_Pattern_GUID = "f510173e-2e71-45e9-a6e5-62f6ed8289d5"
  SynchronizedInput_Pattern_GUID = "05c288a6-c47b-488b-b653-33977a551b8b"
  ObjectModel_Pattern_GUID = "3e04acfe-08fc-47ec-96bc-353fa3b34aa7"
  Annotation_Pattern_GUID = "f6c72ad7-356c-4850-9291-316f608a8c84"
  Text_Pattern2_GUID = "498479a2-5b22-448d-b6e4-647490860698"
  TextEdit_Pattern_GUID = "69f3ff89-5af9-4c75-9340-f2de292e4591"
  CustomNavigation_Pattern_GUID = "afea938a-621e-4054-bb2c-2f46114dac3f"
  Styles_Pattern_GUID = "1ae62655-da72-4d60-a153-e5aa6988e3bf"
  Spreadsheet_Pattern_GUID = "6a5b24c9-9d1e-4b85-9e44-c02e3169b10b"
  SpreadsheetItem_Pattern_GUID = "32cf83ff-f1a8-4a8c-8658-d47ba74e20ba"
  Tranform_Pattern2_GUID = "8afcfd07-a369-44de-988b-2f7ff49fb8a8"
  TextChild_Pattern_GUID = "7533cab7-3bfe-41ef-9e85-e2638cbe169e"
  Drag_Pattern_GUID = "c0bee21f-ccb3-4fed-995b-114f6e3d2728"
  DropTarget_Pattern_GUID = "0bcbec56-bd34-4b7b-9fd5-2659905ea3dc"
  StructuredMarkup_Pattern_GUID = "abbd0878-8665-4f5c-94fc-36e7d8bb706b"
  Button_Control_GUID = "5a78e369-c6a1-4f33-a9d7-79f20d0c788e"
  Calendar_Control_GUID = "8913eb88-00e5-46bc-8e4e-14a786e165a1"
  CheckBox_Control_GUID = "fb50f922-a3db-49c0-8bc3-06dad55778e2"
  ComboBox_Control_GUID = "54cb426c-2f33-4fff-aaa1-aef60dac5deb"
  Edit_Control_GUID = "6504a5c8-2c86-4f87-ae7b-1abddc810cf9"
  Hyperlink_Control_GUID = "8a56022c-b00d-4d15-8ff0-5b6b266e5e02"
  Image_Control_GUID = "2d3736e4-6b16-4c57-a962-f93260a75243"
  ListItem_Control_GUID = "7b3717f2-44d1-4a58-98a8-f12a9b8f78e2"
  List_Control_GUID = "9b149ee1-7cca-4cfc-9af1-cac7bddd3031"
  Menu_Control_GUID = "2e9b1440-0ea8-41fd-b374-c1ea6f503cd1"
  MenuBar_Control_GUID = "cc384250-0e7b-4ae8-95ae-a08f261b52ee"
  MenuItem_Control_GUID = "f45225d3-d0a0-49d8-9834-9a000d2aeddc"
  ProgressBar_Control_GUID = "228c9f86-c36c-47bb-9fb6-a5834bfc53a4"
  RadioButton_Control_GUID = "3bdb49db-fe2c-4483-b3e1-e57f219440c6"
  ScrollBar_Control_GUID = "daf34b36-5065-4946-b22f-92595fc0751a"
  Slider_Control_GUID = "b033c24b-3b35-4cea-b609-763682fa660b"
  Spinner_Control_GUID = "60cc4b38-3cb1-4161-b442-c6b726c17825"
  StatusBar_Control_GUID = "d45e7d1b-5873-475f-95a4-0433e1f1b00a"
  Tab_Control_GUID = "38cd1f2d-337a-4bd2-a5e3-adb469e30bd3"
  TabItem_Control_GUID = "2c6a634f-921b-4e6e-b26e-08fcb0798f4c"
  Text_Control_GUID = "ae9772dc-d331-4f09-be20-7e6dfaf07b0a"
  ToolBar_Control_GUID = "8f06b751-e182-4e98-8893-2284543a7dce"
  ToolTip_Control_GUID = "05ddc6d1-2137-4768-98ea-73f52f7134f3"
  Tree_Control_GUID = "7561349c-d241-43f4-9908-b5f091bee611"
  TreeItem_Control_GUID = "62c9feb9-8ffc-4878-a3a4-96b030315c18"
  Custom_Control_GUID = "f29ea0c3-adb7-430a-ba90-e52c7313e6ed"
  Group_Control_GUID = "ad50aa1c-e8c8-4774-ae1b-dd86df0b3bdc"
  Thumb_Control_GUID = "701ca877-e310-4dd6-b644-797e4faea213"
  DataGrid_Control_GUID = "84b783af-d103-4b0a-8415-e73942410f4b"
  DataItem_Control_GUID = "a0177842-d94f-42a5-814b-6068addc8da5"
  Document_Control_GUID = "3cd6bb6f-6f08-4562-b229-e4e2fc7a9eb4"
  SplitButton_Control_GUID = "7011f01f-4ace-4901-b461-920a6f1ca650"
  Window_Control_GUID = "e13a7242-f462-4f4d-aec1-53b28d6c3290"
  Pane_Control_GUID = "5c2b3f5b-9182-42a3-8dec-8c04c1ee634d"
  Header_Control_GUID = "5b90cbce-78fb-4614-82b6-554d74718e67"
  HeaderItem_Control_GUID = "e6bc12cb-7c8e-49cf-b168-4a93a32bebb0"
  Table_Control_GUID = "773bfa0e-5bc4-4deb-921b-de7b3206229e"
  TitleBar_Control_GUID = "98aa55bf-3bb0-4b65-836e-2ea30dbc171f"
  Separator_Control_GUID = "8767eba3-2a63-4ab0-ac8d-aa50e23de978"
  SemanticZoom_Control_GUID = "5fd34a43-061e-42c8-b589-9dccf74bc43a"
  AppBar_Control_GUID = "6114908d-cc02-4d37-875b-b530c7139554"
  Text_AnimationStyle_Attribute_GUID = "628209f0-7c9a-4d57-be64-1f1836571ff5"
  Text_BackgroundColor_Attribute_GUID = "fdc49a07-583d-4f17-ad27-77fc832a3c0b"
  Text_BulletStyle_Attribute_GUID = "c1097c90-d5c4-4237-9781-3bec8ba54e48"
  Text_CapStyle_Attribute_GUID = "fb059c50-92cc-49a5-ba8f-0aa872bba2f3"
  Text_Culture_Attribute_GUID = "c2025af9-a42d-4ced-a1fb-c6746315222e"
  Text_FontName_Attribute_GUID = "64e63ba8-f2e5-476e-a477-1734feaaf726"
  Text_FontSize_Attribute_GUID = "dc5eeeff-0506-4673-93f2-377e4a8e01f1"
  Text_FontWeight_Attribute_GUID = "6fc02359-b316-4f5f-b401-f1ce55741853"
  Text_ForegroundColor_Attribute_GUID = "72d1c95d-5e60-471a-96b1-6c1b3b77a436"
  Text_HorizontalTextAlignment_Attribute_GUID = "04ea6161-fba3-477a-952a-bb326d026a5b"
  Text_IndentationFirstLine_Attribute_GUID = "206f9ad5-c1d3-424a-8182-6da9a7f3d632"
  Text_IndentationLeading_Attribute_GUID = "5cf66bac-2d45-4a4b-b6c9-f7221d2815b0"
  Text_IndentationTrailing_Attribute_GUID = "97ff6c0f-1ce4-408a-b67b-94d83eb69bf2"
  Text_IsHidden_Attribute_GUID = "360182fb-bdd7-47f6-ab69-19e33f8a3344"
  Text_IsItalic_Attribute_GUID = "fce12a56-1336-4a34-9663-1bab47239320"
  Text_IsReadOnly_Attribute_GUID = "a738156b-ca3e-495e-9514-833c440feb11"
  Text_IsSubscript_Attribute_GUID = "f0ead858-8f53-413c-873f-1a7d7f5e0de4"
  Text_IsSuperscript_Attribute_GUID = "da706ee4-b3aa-4645-a41f-cd25157dea76"
  Text_MarginBottom_Attribute_GUID = "7ee593c4-72b4-4cac-9271-3ed24b0e4d42"
  Text_MarginLeading_Attribute_GUID = "9e9242d0-5ed0-4900-8e8a-eecc03835afc"
  Text_MarginTop_Attribute_GUID = "683d936f-c9b9-4a9a-b3d9-d20d33311e2a"
  Text_MarginTrailing_Attribute_GUID = "af522f98-999d-40af-a5b2-0169d0342002"
  Text_OutlineStyles_Attribute_GUID = "5b675b27-db89-46fe-970c-614d523bb97d"
  Text_OverlineColor_Attribute_GUID = "83ab383a-fd43-40da-ab3e-ecf8165cbb6d"
  Text_OverlineStyle_Attribute_GUID = "0a234d66-617e-427f-871d-e1ff1e0c213f"
  Text_StrikethroughColor_Attribute_GUID = "bfe15a18-8c41-4c5a-9a0b-04af0e07f487"
  Text_StrikethroughStyle_Attribute_GUID = "72913ef1-da00-4f01-899c-ac5a8577a307"
  Text_Tabs_Attribute_GUID = "2e68d00b-92fe-42d8-899a-a784aa4454a1"
  Text_TextFlowDirections_Attribute_GUID = "8bdf8739-f420-423e-af77-20a5d973a907"
  Text_UnderlineColor_Attribute_GUID = "bfa12c73-fde2-4473-bf64-1036d6aa0f45"
  Text_UnderlineStyle_Attribute_GUID = "5f3b21c0-ede4-44bd-9c36-3853038cbfeb"
  Text_AnnotationTypes_Attribute_GUID = "ad2eb431-ee4e-4be1-a7ba-5559155a73ef"
  Text_AnnotationObjects_Attribute_GUID = "ff41cf68-e7ab-40b9-8c72-72a8ed94017d"
  Text_StyleName_Attribute_GUID = "22c9e091-4d66-45d8-a828-737bab4c98a7"
  Text_StyleId_Attribute_GUID = "14c300de-c32b-449b-ab7c-b0e0789aea5d"
  Text_Link_Attribute_GUID = "b38ef51d-9e8d-4e46-9144-56ebe177329b"
  Text_IsActive_Attribute_GUID = "f5a4e533-e1b8-436b-935d-b57aa3f558c4"
  Text_SelectionActiveEnd_Attribute_GUID = "1f668cc3-9bbf-416b-b0a2-f89f86f6612c"
  Text_CaretPosition_Attribute_GUID = "b227b131-9889-4752-a91b-733efdc5c5a0"
  Text_CaretBidiMode_Attribute_GUID = "929ee7a6-51d3-4715-96dc-b694fa24a168"
  Text_BeforeParagraphSpacing_Attribute_GUID = "be7b0ab1-c822-4a24-85e9-c8f2650fc79c"
  Text_AfterParagraphSpacing_Attribute_GUID = "588cbb38-e62f-497c-b5d1-ccdf0ee823d8"
  Text_LineSpacing_Attribute_GUID = "63ff70ae-d943-4b47-8ab7-a7a033d3214b"
  Text_BeforeSpacing_Attribute_GUID = "be7b0ab1-c822-4a24-85e9-c8f2650fc79c"
  Text_AfterSpacing_Attribute_GUID = "588cbb38-e62f-497c-b5d1-ccdf0ee823d8"
  Text_SayAsInterpretAs_Attribute_GUID = "b38ad6ac-eee1-4b6e-88cc-014cefa93fcb"
  TextEdit_TextChanged_Event_GUID = "120b0308-ec22-4eb8-9c98-9867cda1b165"
  TextEdit_ConversionTargetChanged_Event_GUID = "3388c183-ed4f-4c8b-9baa-364d51d8847f"
  Changes_Event_GUID = "7df26714-614f-4e05-9488-716c5ba19436"
  Annotation_Custom_GUID = "9ec82750-3931-4952-85bc-1dbff78a43e3"
  Annotation_SpellingError_GUID = "ae85567e-9ece-423f-81b7-96c43d53e50e"
  Annotation_GrammarError_GUID = "757a048d-4518-41c6-854c-dc009b7cfb53"
  Annotation_Comment_GUID = "fd2fda30-26b3-4c06-8bc7-98f1532e46fd"
  Annotation_FormulaError_GUID = "95611982-0cab-46d5-a2f0-e30d1905f8bf"
  Annotation_TrackChanges_GUID = "21e6e888-dc14-4016-ac27-190553c8c470"
  Annotation_Header_GUID = "867b409b-b216-4472-a219-525e310681f8"
  Annotation_Footer_GUID = "cceab046-1833-47aa-8080-701ed0b0c832"
  Annotation_Highlighted_GUID = "757c884e-8083-4081-8b9c-e87f5072f0e4"
  Annotation_Endnote_GUID = "7565725c-2d99-4839-960d-33d3b866aba5"
  Annotation_Footnote_GUID = "3de10e21-4125-42db-8620-be8083080624"
  Annotation_InsertionChange_GUID = "0dbeb3a6-df15-4164-a3c0-e21a8ce931c4"
  Annotation_DeletionChange_GUID = "be3d5b05-951d-42e7-901d-adc8c2cf34d0"
  Annotation_MoveChange_GUID = "9da587eb-23e5-4490-b385-1a22ddc8b187"
  Annotation_FormatChange_GUID = "eb247345-d4f1-41ce-8e52-f79b69635e48"
  Annotation_UnsyncedChange_GUID = "1851116a-0e47-4b30-8cb5-d7dae4fbcd1b"
  Annotation_EditingLockedChange_GUID = "c31f3e1c-7423-4dac-8348-41f099ff6f64"
  Annotation_ExternalChange_GUID = "75a05b31-5f11-42fd-887d-dfa010db2392"
  Annotation_ConflictingChange_GUID = "98af8802-517c-459f-af13-016d3fab877e"
  Annotation_Author_GUID = "f161d3a7-f81b-4128-b17f-71f690914520"
  Annotation_AdvancedProofingIssue_GUID = "dac7b72c-c0f2-4b84-b90d-5fafc0f0ef1c"
  Annotation_DataValidationError_GUID = "c8649fa8-9775-437e-ad46-e709d93c2343"
  Annotation_CircularReferenceError_GUID = "25bd9cf4-1745-4659-ba67-727f0318c616"
  Annotation_Mathematics_GUID = "eaab634b-26d0-40c1-8073-57ca1c633c9b"
  Annotation_Sensitive_GUID = "37f4c04f-0f12-4464-929c-828fd15292e3"
  Changes_Summary_GUID = "313d65a6-e60f-4d62-9861-55afd728d207"
  StyleId_Custom_GUID = "ef2edd3e-a999-4b7c-a378-09bbd52a3516"
  StyleId_Heading1_GUID = "7f7e8f69-6866-4621-930c-9a5d0ca5961c"
  StyleId_Heading2_GUID = "baa9b241-5c69-469d-85ad-474737b52b14"
  StyleId_Heading3_GUID = "bf8be9d2-d8b8-4ec5-8c52-9cfb0d035970"
  StyleId_Heading4_GUID = "8436ffc0-9578-45fc-83a4-ff40053315dd"
  StyleId_Heading5_GUID = "909f424d-0dbf-406e-97bb-4e773d9798f7"
  StyleId_Heading6_GUID = "89d23459-5d5b-4824-a420-11d3ed82e40f"
  StyleId_Heading7_GUID = "a3790473-e9ae-422d-b8e3-3b675c6181a4"
  StyleId_Heading8_GUID = "2bc14145-a40c-4881-84ae-f2235685380c"
  StyleId_Heading9_GUID = "c70d9133-bb2a-43d3-8ac6-33657884b0f0"
  StyleId_Title_GUID = "15d8201a-ffcf-481f-b0a1-30b63be98f07"
  StyleId_Subtitle_GUID = "b5d9fc17-5d6f-4420-b439-7cb19ad434e2"
  StyleId_Normal_GUID = "cd14d429-e45e-4475-a1c5-7f9e6be96eba"
  StyleId_Emphasis_GUID = "ca6e7dbe-355e-4820-95a0-925f041d3470"
  StyleId_Quote_GUID = "5d1c21ea-8195-4f6c-87ea-5dabece64c1d"
  StyleId_BulletedList_GUID = "5963ed64-6426-4632-8caf-a32ad402d91a"
  StyleId_NumberedList_GUID = "1e96dbd5-64c3-43d0-b1ee-b53b06e3eddf"
  Notification_Event_GUID = "72c5a2f7-9788-480f-b8eb-4dee00f6186f"
  SID_IsUIAutomationObject = "b96fdb85-7204-4724-842b-c7059dedb9d0"
  SID_ControlElementProvider = "f4791d68-e254-4ba3-9a53-26a5c5497946"
  IsSelectionPattern2Available_Property_GUID = "490806fb-6e89-4a47-8319-d266e511f021"
  Selection2_FirstSelectedItem_Property_GUID = "cc24ea67-369c-4e55-9ff7-38da69540c29"
  Selection2_LastSelectedItem_Property_GUID = "cf7bda90-2d83-49f8-860c-9ce394cf89b4"
  Selection2_CurrentSelectedItem_Property_GUID = "34257c26-83b5-41a6-939c-ae841c136236"
  Selection2_ItemCount_Property_GUID = "bb49eb9f-456d-4048-b591-9c2026b84636"
  Selection_Pattern2_GUID = "fba25cab-ab98-49f7-a7dc-fe539dc15be7"
  HeadingLevel_Property_GUID = "29084272-aaaf-4a30-8796-3c12f62b6bbb"
  IsDialog_Property_GUID = "9d0dfb9b-8436-4501-bbbb-e534a4fb3b3f"
  UIA_IAFP_DEFAULT = 0_u32
  UIA_IAFP_UNWRAP_BRIDGE = 1_u32
  UIA_PFIA_DEFAULT = 0_u32
  UIA_PFIA_UNWRAP_BRIDGE = 1_u32
  UIA_ScrollPatternNoScroll = -1
  UIA_InvokePatternId = 10000_i32
  UIA_SelectionPatternId = 10001_i32
  UIA_ValuePatternId = 10002_i32
  UIA_RangeValuePatternId = 10003_i32
  UIA_ScrollPatternId = 10004_i32
  UIA_ExpandCollapsePatternId = 10005_i32
  UIA_GridPatternId = 10006_i32
  UIA_GridItemPatternId = 10007_i32
  UIA_MultipleViewPatternId = 10008_i32
  UIA_WindowPatternId = 10009_i32
  UIA_SelectionItemPatternId = 10010_i32
  UIA_DockPatternId = 10011_i32
  UIA_TablePatternId = 10012_i32
  UIA_TableItemPatternId = 10013_i32
  UIA_TextPatternId = 10014_i32
  UIA_TogglePatternId = 10015_i32
  UIA_TransformPatternId = 10016_i32
  UIA_ScrollItemPatternId = 10017_i32
  UIA_LegacyIAccessiblePatternId = 10018_i32
  UIA_ItemContainerPatternId = 10019_i32
  UIA_VirtualizedItemPatternId = 10020_i32
  UIA_SynchronizedInputPatternId = 10021_i32
  UIA_ObjectModelPatternId = 10022_i32
  UIA_AnnotationPatternId = 10023_i32
  UIA_TextPattern2Id = 10024_i32
  UIA_StylesPatternId = 10025_i32
  UIA_SpreadsheetPatternId = 10026_i32
  UIA_SpreadsheetItemPatternId = 10027_i32
  UIA_TransformPattern2Id = 10028_i32
  UIA_TextChildPatternId = 10029_i32
  UIA_DragPatternId = 10030_i32
  UIA_DropTargetPatternId = 10031_i32
  UIA_TextEditPatternId = 10032_i32
  UIA_CustomNavigationPatternId = 10033_i32
  UIA_SelectionPattern2Id = 10034_i32
  UIA_ToolTipOpenedEventId = 20000_i32
  UIA_ToolTipClosedEventId = 20001_i32
  UIA_StructureChangedEventId = 20002_i32
  UIA_MenuOpenedEventId = 20003_i32
  UIA_AutomationPropertyChangedEventId = 20004_i32
  UIA_AutomationFocusChangedEventId = 20005_i32
  UIA_AsyncContentLoadedEventId = 20006_i32
  UIA_MenuClosedEventId = 20007_i32
  UIA_LayoutInvalidatedEventId = 20008_i32
  UIA_Invoke_InvokedEventId = 20009_i32
  UIA_SelectionItem_ElementAddedToSelectionEventId = 20010_i32
  UIA_SelectionItem_ElementRemovedFromSelectionEventId = 20011_i32
  UIA_SelectionItem_ElementSelectedEventId = 20012_i32
  UIA_Selection_InvalidatedEventId = 20013_i32
  UIA_Text_TextSelectionChangedEventId = 20014_i32
  UIA_Text_TextChangedEventId = 20015_i32
  UIA_Window_WindowOpenedEventId = 20016_i32
  UIA_Window_WindowClosedEventId = 20017_i32
  UIA_MenuModeStartEventId = 20018_i32
  UIA_MenuModeEndEventId = 20019_i32
  UIA_InputReachedTargetEventId = 20020_i32
  UIA_InputReachedOtherElementEventId = 20021_i32
  UIA_InputDiscardedEventId = 20022_i32
  UIA_SystemAlertEventId = 20023_i32
  UIA_LiveRegionChangedEventId = 20024_i32
  UIA_HostedFragmentRootsInvalidatedEventId = 20025_i32
  UIA_Drag_DragStartEventId = 20026_i32
  UIA_Drag_DragCancelEventId = 20027_i32
  UIA_Drag_DragCompleteEventId = 20028_i32
  UIA_DropTarget_DragEnterEventId = 20029_i32
  UIA_DropTarget_DragLeaveEventId = 20030_i32
  UIA_DropTarget_DroppedEventId = 20031_i32
  UIA_TextEdit_TextChangedEventId = 20032_i32
  UIA_TextEdit_ConversionTargetChangedEventId = 20033_i32
  UIA_ChangesEventId = 20034_i32
  UIA_NotificationEventId = 20035_i32
  UIA_ActiveTextPositionChangedEventId = 20036_i32
  UIA_RuntimeIdPropertyId = 30000_i32
  UIA_BoundingRectanglePropertyId = 30001_i32
  UIA_ProcessIdPropertyId = 30002_i32
  UIA_ControlTypePropertyId = 30003_i32
  UIA_LocalizedControlTypePropertyId = 30004_i32
  UIA_NamePropertyId = 30005_i32
  UIA_AcceleratorKeyPropertyId = 30006_i32
  UIA_AccessKeyPropertyId = 30007_i32
  UIA_HasKeyboardFocusPropertyId = 30008_i32
  UIA_IsKeyboardFocusablePropertyId = 30009_i32
  UIA_IsEnabledPropertyId = 30010_i32
  UIA_AutomationIdPropertyId = 30011_i32
  UIA_ClassNamePropertyId = 30012_i32
  UIA_HelpTextPropertyId = 30013_i32
  UIA_ClickablePointPropertyId = 30014_i32
  UIA_CulturePropertyId = 30015_i32
  UIA_IsControlElementPropertyId = 30016_i32
  UIA_IsContentElementPropertyId = 30017_i32
  UIA_LabeledByPropertyId = 30018_i32
  UIA_IsPasswordPropertyId = 30019_i32
  UIA_NativeWindowHandlePropertyId = 30020_i32
  UIA_ItemTypePropertyId = 30021_i32
  UIA_IsOffscreenPropertyId = 30022_i32
  UIA_OrientationPropertyId = 30023_i32
  UIA_FrameworkIdPropertyId = 30024_i32
  UIA_IsRequiredForFormPropertyId = 30025_i32
  UIA_ItemStatusPropertyId = 30026_i32
  UIA_IsDockPatternAvailablePropertyId = 30027_i32
  UIA_IsExpandCollapsePatternAvailablePropertyId = 30028_i32
  UIA_IsGridItemPatternAvailablePropertyId = 30029_i32
  UIA_IsGridPatternAvailablePropertyId = 30030_i32
  UIA_IsInvokePatternAvailablePropertyId = 30031_i32
  UIA_IsMultipleViewPatternAvailablePropertyId = 30032_i32
  UIA_IsRangeValuePatternAvailablePropertyId = 30033_i32
  UIA_IsScrollPatternAvailablePropertyId = 30034_i32
  UIA_IsScrollItemPatternAvailablePropertyId = 30035_i32
  UIA_IsSelectionItemPatternAvailablePropertyId = 30036_i32
  UIA_IsSelectionPatternAvailablePropertyId = 30037_i32
  UIA_IsTablePatternAvailablePropertyId = 30038_i32
  UIA_IsTableItemPatternAvailablePropertyId = 30039_i32
  UIA_IsTextPatternAvailablePropertyId = 30040_i32
  UIA_IsTogglePatternAvailablePropertyId = 30041_i32
  UIA_IsTransformPatternAvailablePropertyId = 30042_i32
  UIA_IsValuePatternAvailablePropertyId = 30043_i32
  UIA_IsWindowPatternAvailablePropertyId = 30044_i32
  UIA_ValueValuePropertyId = 30045_i32
  UIA_ValueIsReadOnlyPropertyId = 30046_i32
  UIA_RangeValueValuePropertyId = 30047_i32
  UIA_RangeValueIsReadOnlyPropertyId = 30048_i32
  UIA_RangeValueMinimumPropertyId = 30049_i32
  UIA_RangeValueMaximumPropertyId = 30050_i32
  UIA_RangeValueLargeChangePropertyId = 30051_i32
  UIA_RangeValueSmallChangePropertyId = 30052_i32
  UIA_ScrollHorizontalScrollPercentPropertyId = 30053_i32
  UIA_ScrollHorizontalViewSizePropertyId = 30054_i32
  UIA_ScrollVerticalScrollPercentPropertyId = 30055_i32
  UIA_ScrollVerticalViewSizePropertyId = 30056_i32
  UIA_ScrollHorizontallyScrollablePropertyId = 30057_i32
  UIA_ScrollVerticallyScrollablePropertyId = 30058_i32
  UIA_SelectionSelectionPropertyId = 30059_i32
  UIA_SelectionCanSelectMultiplePropertyId = 30060_i32
  UIA_SelectionIsSelectionRequiredPropertyId = 30061_i32
  UIA_GridRowCountPropertyId = 30062_i32
  UIA_GridColumnCountPropertyId = 30063_i32
  UIA_GridItemRowPropertyId = 30064_i32
  UIA_GridItemColumnPropertyId = 30065_i32
  UIA_GridItemRowSpanPropertyId = 30066_i32
  UIA_GridItemColumnSpanPropertyId = 30067_i32
  UIA_GridItemContainingGridPropertyId = 30068_i32
  UIA_DockDockPositionPropertyId = 30069_i32
  UIA_ExpandCollapseExpandCollapseStatePropertyId = 30070_i32
  UIA_MultipleViewCurrentViewPropertyId = 30071_i32
  UIA_MultipleViewSupportedViewsPropertyId = 30072_i32
  UIA_WindowCanMaximizePropertyId = 30073_i32
  UIA_WindowCanMinimizePropertyId = 30074_i32
  UIA_WindowWindowVisualStatePropertyId = 30075_i32
  UIA_WindowWindowInteractionStatePropertyId = 30076_i32
  UIA_WindowIsModalPropertyId = 30077_i32
  UIA_WindowIsTopmostPropertyId = 30078_i32
  UIA_SelectionItemIsSelectedPropertyId = 30079_i32
  UIA_SelectionItemSelectionContainerPropertyId = 30080_i32
  UIA_TableRowHeadersPropertyId = 30081_i32
  UIA_TableColumnHeadersPropertyId = 30082_i32
  UIA_TableRowOrColumnMajorPropertyId = 30083_i32
  UIA_TableItemRowHeaderItemsPropertyId = 30084_i32
  UIA_TableItemColumnHeaderItemsPropertyId = 30085_i32
  UIA_ToggleToggleStatePropertyId = 30086_i32
  UIA_TransformCanMovePropertyId = 30087_i32
  UIA_TransformCanResizePropertyId = 30088_i32
  UIA_TransformCanRotatePropertyId = 30089_i32
  UIA_IsLegacyIAccessiblePatternAvailablePropertyId = 30090_i32
  UIA_LegacyIAccessibleChildIdPropertyId = 30091_i32
  UIA_LegacyIAccessibleNamePropertyId = 30092_i32
  UIA_LegacyIAccessibleValuePropertyId = 30093_i32
  UIA_LegacyIAccessibleDescriptionPropertyId = 30094_i32
  UIA_LegacyIAccessibleRolePropertyId = 30095_i32
  UIA_LegacyIAccessibleStatePropertyId = 30096_i32
  UIA_LegacyIAccessibleHelpPropertyId = 30097_i32
  UIA_LegacyIAccessibleKeyboardShortcutPropertyId = 30098_i32
  UIA_LegacyIAccessibleSelectionPropertyId = 30099_i32
  UIA_LegacyIAccessibleDefaultActionPropertyId = 30100_i32
  UIA_AriaRolePropertyId = 30101_i32
  UIA_AriaPropertiesPropertyId = 30102_i32
  UIA_IsDataValidForFormPropertyId = 30103_i32
  UIA_ControllerForPropertyId = 30104_i32
  UIA_DescribedByPropertyId = 30105_i32
  UIA_FlowsToPropertyId = 30106_i32
  UIA_ProviderDescriptionPropertyId = 30107_i32
  UIA_IsItemContainerPatternAvailablePropertyId = 30108_i32
  UIA_IsVirtualizedItemPatternAvailablePropertyId = 30109_i32
  UIA_IsSynchronizedInputPatternAvailablePropertyId = 30110_i32
  UIA_OptimizeForVisualContentPropertyId = 30111_i32
  UIA_IsObjectModelPatternAvailablePropertyId = 30112_i32
  UIA_AnnotationAnnotationTypeIdPropertyId = 30113_i32
  UIA_AnnotationAnnotationTypeNamePropertyId = 30114_i32
  UIA_AnnotationAuthorPropertyId = 30115_i32
  UIA_AnnotationDateTimePropertyId = 30116_i32
  UIA_AnnotationTargetPropertyId = 30117_i32
  UIA_IsAnnotationPatternAvailablePropertyId = 30118_i32
  UIA_IsTextPattern2AvailablePropertyId = 30119_i32
  UIA_StylesStyleIdPropertyId = 30120_i32
  UIA_StylesStyleNamePropertyId = 30121_i32
  UIA_StylesFillColorPropertyId = 30122_i32
  UIA_StylesFillPatternStylePropertyId = 30123_i32
  UIA_StylesShapePropertyId = 30124_i32
  UIA_StylesFillPatternColorPropertyId = 30125_i32
  UIA_StylesExtendedPropertiesPropertyId = 30126_i32
  UIA_IsStylesPatternAvailablePropertyId = 30127_i32
  UIA_IsSpreadsheetPatternAvailablePropertyId = 30128_i32
  UIA_SpreadsheetItemFormulaPropertyId = 30129_i32
  UIA_SpreadsheetItemAnnotationObjectsPropertyId = 30130_i32
  UIA_SpreadsheetItemAnnotationTypesPropertyId = 30131_i32
  UIA_IsSpreadsheetItemPatternAvailablePropertyId = 30132_i32
  UIA_Transform2CanZoomPropertyId = 30133_i32
  UIA_IsTransformPattern2AvailablePropertyId = 30134_i32
  UIA_LiveSettingPropertyId = 30135_i32
  UIA_IsTextChildPatternAvailablePropertyId = 30136_i32
  UIA_IsDragPatternAvailablePropertyId = 30137_i32
  UIA_DragIsGrabbedPropertyId = 30138_i32
  UIA_DragDropEffectPropertyId = 30139_i32
  UIA_DragDropEffectsPropertyId = 30140_i32
  UIA_IsDropTargetPatternAvailablePropertyId = 30141_i32
  UIA_DropTargetDropTargetEffectPropertyId = 30142_i32
  UIA_DropTargetDropTargetEffectsPropertyId = 30143_i32
  UIA_DragGrabbedItemsPropertyId = 30144_i32
  UIA_Transform2ZoomLevelPropertyId = 30145_i32
  UIA_Transform2ZoomMinimumPropertyId = 30146_i32
  UIA_Transform2ZoomMaximumPropertyId = 30147_i32
  UIA_FlowsFromPropertyId = 30148_i32
  UIA_IsTextEditPatternAvailablePropertyId = 30149_i32
  UIA_IsPeripheralPropertyId = 30150_i32
  UIA_IsCustomNavigationPatternAvailablePropertyId = 30151_i32
  UIA_PositionInSetPropertyId = 30152_i32
  UIA_SizeOfSetPropertyId = 30153_i32
  UIA_LevelPropertyId = 30154_i32
  UIA_AnnotationTypesPropertyId = 30155_i32
  UIA_AnnotationObjectsPropertyId = 30156_i32
  UIA_LandmarkTypePropertyId = 30157_i32
  UIA_LocalizedLandmarkTypePropertyId = 30158_i32
  UIA_FullDescriptionPropertyId = 30159_i32
  UIA_FillColorPropertyId = 30160_i32
  UIA_OutlineColorPropertyId = 30161_i32
  UIA_FillTypePropertyId = 30162_i32
  UIA_VisualEffectsPropertyId = 30163_i32
  UIA_OutlineThicknessPropertyId = 30164_i32
  UIA_CenterPointPropertyId = 30165_i32
  UIA_RotationPropertyId = 30166_i32
  UIA_SizePropertyId = 30167_i32
  UIA_IsSelectionPattern2AvailablePropertyId = 30168_i32
  UIA_Selection2FirstSelectedItemPropertyId = 30169_i32
  UIA_Selection2LastSelectedItemPropertyId = 30170_i32
  UIA_Selection2CurrentSelectedItemPropertyId = 30171_i32
  UIA_Selection2ItemCountPropertyId = 30172_i32
  UIA_HeadingLevelPropertyId = 30173_i32
  UIA_IsDialogPropertyId = 30174_i32
  UIA_AnimationStyleAttributeId = 40000_i32
  UIA_BackgroundColorAttributeId = 40001_i32
  UIA_BulletStyleAttributeId = 40002_i32
  UIA_CapStyleAttributeId = 40003_i32
  UIA_CultureAttributeId = 40004_i32
  UIA_FontNameAttributeId = 40005_i32
  UIA_FontSizeAttributeId = 40006_i32
  UIA_FontWeightAttributeId = 40007_i32
  UIA_ForegroundColorAttributeId = 40008_i32
  UIA_HorizontalTextAlignmentAttributeId = 40009_i32
  UIA_IndentationFirstLineAttributeId = 40010_i32
  UIA_IndentationLeadingAttributeId = 40011_i32
  UIA_IndentationTrailingAttributeId = 40012_i32
  UIA_IsHiddenAttributeId = 40013_i32
  UIA_IsItalicAttributeId = 40014_i32
  UIA_IsReadOnlyAttributeId = 40015_i32
  UIA_IsSubscriptAttributeId = 40016_i32
  UIA_IsSuperscriptAttributeId = 40017_i32
  UIA_MarginBottomAttributeId = 40018_i32
  UIA_MarginLeadingAttributeId = 40019_i32
  UIA_MarginTopAttributeId = 40020_i32
  UIA_MarginTrailingAttributeId = 40021_i32
  UIA_OutlineStylesAttributeId = 40022_i32
  UIA_OverlineColorAttributeId = 40023_i32
  UIA_OverlineStyleAttributeId = 40024_i32
  UIA_StrikethroughColorAttributeId = 40025_i32
  UIA_StrikethroughStyleAttributeId = 40026_i32
  UIA_TabsAttributeId = 40027_i32
  UIA_TextFlowDirectionsAttributeId = 40028_i32
  UIA_UnderlineColorAttributeId = 40029_i32
  UIA_UnderlineStyleAttributeId = 40030_i32
  UIA_AnnotationTypesAttributeId = 40031_i32
  UIA_AnnotationObjectsAttributeId = 40032_i32
  UIA_StyleNameAttributeId = 40033_i32
  UIA_StyleIdAttributeId = 40034_i32
  UIA_LinkAttributeId = 40035_i32
  UIA_IsActiveAttributeId = 40036_i32
  UIA_SelectionActiveEndAttributeId = 40037_i32
  UIA_CaretPositionAttributeId = 40038_i32
  UIA_CaretBidiModeAttributeId = 40039_i32
  UIA_LineSpacingAttributeId = 40040_i32
  UIA_BeforeParagraphSpacingAttributeId = 40041_i32
  UIA_AfterParagraphSpacingAttributeId = 40042_i32
  UIA_SayAsInterpretAsAttributeId = 40043_i32
  UIA_ButtonControlTypeId = 50000_i32
  UIA_CalendarControlTypeId = 50001_i32
  UIA_CheckBoxControlTypeId = 50002_i32
  UIA_ComboBoxControlTypeId = 50003_i32
  UIA_EditControlTypeId = 50004_i32
  UIA_HyperlinkControlTypeId = 50005_i32
  UIA_ImageControlTypeId = 50006_i32
  UIA_ListItemControlTypeId = 50007_i32
  UIA_ListControlTypeId = 50008_i32
  UIA_MenuControlTypeId = 50009_i32
  UIA_MenuBarControlTypeId = 50010_i32
  UIA_MenuItemControlTypeId = 50011_i32
  UIA_ProgressBarControlTypeId = 50012_i32
  UIA_RadioButtonControlTypeId = 50013_i32
  UIA_ScrollBarControlTypeId = 50014_i32
  UIA_SliderControlTypeId = 50015_i32
  UIA_SpinnerControlTypeId = 50016_i32
  UIA_StatusBarControlTypeId = 50017_i32
  UIA_TabControlTypeId = 50018_i32
  UIA_TabItemControlTypeId = 50019_i32
  UIA_TextControlTypeId = 50020_i32
  UIA_ToolBarControlTypeId = 50021_i32
  UIA_ToolTipControlTypeId = 50022_i32
  UIA_TreeControlTypeId = 50023_i32
  UIA_TreeItemControlTypeId = 50024_i32
  UIA_CustomControlTypeId = 50025_i32
  UIA_GroupControlTypeId = 50026_i32
  UIA_ThumbControlTypeId = 50027_i32
  UIA_DataGridControlTypeId = 50028_i32
  UIA_DataItemControlTypeId = 50029_i32
  UIA_DocumentControlTypeId = 50030_i32
  UIA_SplitButtonControlTypeId = 50031_i32
  UIA_WindowControlTypeId = 50032_i32
  UIA_PaneControlTypeId = 50033_i32
  UIA_HeaderControlTypeId = 50034_i32
  UIA_HeaderItemControlTypeId = 50035_i32
  UIA_TableControlTypeId = 50036_i32
  UIA_TitleBarControlTypeId = 50037_i32
  UIA_SeparatorControlTypeId = 50038_i32
  UIA_SemanticZoomControlTypeId = 50039_i32
  UIA_AppBarControlTypeId = 50040_i32
  AnnotationType_Unknown = 60000_i32
  AnnotationType_SpellingError = 60001_i32
  AnnotationType_GrammarError = 60002_i32
  AnnotationType_Comment = 60003_i32
  AnnotationType_FormulaError = 60004_i32
  AnnotationType_TrackChanges = 60005_i32
  AnnotationType_Header = 60006_i32
  AnnotationType_Footer = 60007_i32
  AnnotationType_Highlighted = 60008_i32
  AnnotationType_Endnote = 60009_i32
  AnnotationType_Footnote = 60010_i32
  AnnotationType_InsertionChange = 60011_i32
  AnnotationType_DeletionChange = 60012_i32
  AnnotationType_MoveChange = 60013_i32
  AnnotationType_FormatChange = 60014_i32
  AnnotationType_UnsyncedChange = 60015_i32
  AnnotationType_EditingLockedChange = 60016_i32
  AnnotationType_ExternalChange = 60017_i32
  AnnotationType_ConflictingChange = 60018_i32
  AnnotationType_Author = 60019_i32
  AnnotationType_AdvancedProofingIssue = 60020_i32
  AnnotationType_DataValidationError = 60021_i32
  AnnotationType_CircularReferenceError = 60022_i32
  AnnotationType_Mathematics = 60023_i32
  AnnotationType_Sensitive = 60024_i32
  StyleId_Custom = 70000_i32
  StyleId_Heading1 = 70001_i32
  StyleId_Heading2 = 70002_i32
  StyleId_Heading3 = 70003_i32
  StyleId_Heading4 = 70004_i32
  StyleId_Heading5 = 70005_i32
  StyleId_Heading6 = 70006_i32
  StyleId_Heading7 = 70007_i32
  StyleId_Heading8 = 70008_i32
  StyleId_Heading9 = 70009_i32
  StyleId_Title = 70010_i32
  StyleId_Subtitle = 70011_i32
  StyleId_Normal = 70012_i32
  StyleId_Emphasis = 70013_i32
  StyleId_Quote = 70014_i32
  StyleId_BulletedList = 70015_i32
  StyleId_NumberedList = 70016_i32
  UIA_CustomLandmarkTypeId = 80000_i32
  UIA_FormLandmarkTypeId = 80001_i32
  UIA_MainLandmarkTypeId = 80002_i32
  UIA_NavigationLandmarkTypeId = 80003_i32
  UIA_SearchLandmarkTypeId = 80004_i32
  HeadingLevel_None = 80050_i32
  HeadingLevel1 = 80051_i32
  HeadingLevel2 = 80052_i32
  HeadingLevel3 = 80053_i32
  HeadingLevel4 = 80054_i32
  HeadingLevel5 = 80055_i32
  HeadingLevel6 = 80056_i32
  HeadingLevel7 = 80057_i32
  HeadingLevel8 = 80058_i32
  HeadingLevel9 = 80059_i32
  UIA_SummaryChangeId = 90000_i32
  UIA_SayAsInterpretAsMetadataId = 100000_i32

  CLSID_CAccPropServices = LibC::GUID.new(0xb5f8350b_u32, 0x548_u16, 0x48b1_u16, StaticArray[0xa6_u8, 0xee_u8, 0x88_u8, 0xbd_u8, 0x0_u8, 0xb4_u8, 0xa5_u8, 0xe7_u8])

  CLSID_CUIAutomation = LibC::GUID.new(0xff48dba4_u32, 0x60ef_u16, 0x4201_u16, StaticArray[0xaa_u8, 0x87_u8, 0x54_u8, 0x10_u8, 0x3e_u8, 0xef_u8, 0x59_u8, 0x4e_u8])

  CLSID_CUIAutomation8 = LibC::GUID.new(0xe22ad333_u32, 0xb25f_u16, 0x460c_u16, StaticArray[0x83_u8, 0xd0_u8, 0x5_u8, 0x81_u8, 0x10_u8, 0x73_u8, 0x95_u8, 0xc9_u8])

  CLSID_CUIAutomationRegistrar = LibC::GUID.new(0x6e29fabf_u32, 0x9977_u16, 0x42d1_u16, StaticArray[0x8d_u8, 0xe_u8, 0xca_u8, 0x7e_u8, 0x61_u8, 0xad_u8, 0x87_u8, 0xe6_u8])

  @[Flags]
  enum STICKYKEYS_FLAGS : UInt32
    SKF_STICKYKEYSON = 1_u32
    SKF_AVAILABLE = 2_u32
    SKF_HOTKEYACTIVE = 4_u32
    SKF_CONFIRMHOTKEY = 8_u32
    SKF_HOTKEYSOUND = 16_u32
    SKF_INDICATOR = 32_u32
    SKF_AUDIBLEFEEDBACK = 64_u32
    SKF_TRISTATE = 128_u32
    SKF_TWOKEYSOFF = 256_u32
    SKF_LALTLATCHED = 268435456_u32
    SKF_LCTLLATCHED = 67108864_u32
    SKF_LSHIFTLATCHED = 16777216_u32
    SKF_RALTLATCHED = 536870912_u32
    SKF_RCTLLATCHED = 134217728_u32
    SKF_RSHIFTLATCHED = 33554432_u32
    SKF_LWINLATCHED = 1073741824_u32
    SKF_RWINLATCHED = 2147483648_u32
    SKF_LALTLOCKED = 1048576_u32
    SKF_LCTLLOCKED = 262144_u32
    SKF_LSHIFTLOCKED = 65536_u32
    SKF_RALTLOCKED = 2097152_u32
    SKF_RCTLLOCKED = 524288_u32
    SKF_RSHIFTLOCKED = 131072_u32
    SKF_LWINLOCKED = 4194304_u32
    SKF_RWINLOCKED = 8388608_u32
  end
  @[Flags]
  enum SOUNDSENTRY_FLAGS : UInt32
    SSF_SOUNDSENTRYON = 1_u32
    SSF_AVAILABLE = 2_u32
    SSF_INDICATOR = 4_u32
  end
  @[Flags]
  enum ACC_UTILITY_STATE_FLAGS : UInt32
    ANRUS_ON_SCREEN_KEYBOARD_ACTIVE = 1_u32
    ANRUS_TOUCH_MODIFICATION_ACTIVE = 2_u32
    ANRUS_PRIORITY_AUDIO_ACTIVE = 4_u32
    ANRUS_PRIORITY_AUDIO_ACTIVE_NODUCK = 8_u32
  end
  enum SOUND_SENTRY_GRAPHICS_EFFECT : UInt32
    SSGF_DISPLAY = 3_u32
    SSGF_NONE = 0_u32
  end
  @[Flags]
  enum SERIALKEYS_FLAGS : UInt32
    SERKF_AVAILABLE = 2_u32
    SERKF_INDICATOR = 4_u32
    SERKF_SERIALKEYSON = 1_u32
  end
  @[Flags]
  enum HIGHCONTRASTW_FLAGS : UInt32
    HCF_HIGHCONTRASTON = 1_u32
    HCF_AVAILABLE = 2_u32
    HCF_HOTKEYACTIVE = 4_u32
    HCF_CONFIRMHOTKEY = 8_u32
    HCF_HOTKEYSOUND = 16_u32
    HCF_INDICATOR = 32_u32
    HCF_HOTKEYAVAILABLE = 64_u32
    HCF_OPTION_NOTHEMECHANGE = 4096_u32
  end
  enum SOUNDSENTRY_TEXT_EFFECT : UInt32
    SSTF_BORDER = 2_u32
    SSTF_CHARS = 1_u32
    SSTF_DISPLAY = 3_u32
    SSTF_NONE = 0_u32
  end
  enum SOUNDSENTRY_WINDOWS_EFFECT : UInt32
    SSWF_CUSTOM = 4_u32
    SSWF_DISPLAY = 3_u32
    SSWF_NONE = 0_u32
    SSWF_TITLE = 1_u32
    SSWF_WINDOW = 2_u32
  end
  enum AnnoScope
    ANNO_THIS = 0_i32
    ANNO_CONTAINER = 1_i32
  end
  enum NavigateDirection
    NavigateDirection_Parent = 0_i32
    NavigateDirection_NextSibling = 1_i32
    NavigateDirection_PreviousSibling = 2_i32
    NavigateDirection_FirstChild = 3_i32
    NavigateDirection_LastChild = 4_i32
  end
  enum ProviderOptions
    ProviderOptions_ClientSideProvider = 1_i32
    ProviderOptions_ServerSideProvider = 2_i32
    ProviderOptions_NonClientAreaProvider = 4_i32
    ProviderOptions_OverrideProvider = 8_i32
    ProviderOptions_ProviderOwnsSetFocus = 16_i32
    ProviderOptions_UseComThreading = 32_i32
    ProviderOptions_RefuseNonClientSupport = 64_i32
    ProviderOptions_HasNativeIAccessible = 128_i32
    ProviderOptions_UseClientCoordinates = 256_i32
  end
  enum StructureChangeType
    StructureChangeType_ChildAdded = 0_i32
    StructureChangeType_ChildRemoved = 1_i32
    StructureChangeType_ChildrenInvalidated = 2_i32
    StructureChangeType_ChildrenBulkAdded = 3_i32
    StructureChangeType_ChildrenBulkRemoved = 4_i32
    StructureChangeType_ChildrenReordered = 5_i32
  end
  enum TextEditChangeType
    TextEditChangeType_None = 0_i32
    TextEditChangeType_AutoCorrect = 1_i32
    TextEditChangeType_Composition = 2_i32
    TextEditChangeType_CompositionFinalized = 3_i32
    TextEditChangeType_AutoComplete = 4_i32
  end
  enum OrientationType
    OrientationType_None = 0_i32
    OrientationType_Horizontal = 1_i32
    OrientationType_Vertical = 2_i32
  end
  enum DockPosition
    DockPosition_Top = 0_i32
    DockPosition_Left = 1_i32
    DockPosition_Bottom = 2_i32
    DockPosition_Right = 3_i32
    DockPosition_Fill = 4_i32
    DockPosition_None = 5_i32
  end
  enum ExpandCollapseState
    ExpandCollapseState_Collapsed = 0_i32
    ExpandCollapseState_Expanded = 1_i32
    ExpandCollapseState_PartiallyExpanded = 2_i32
    ExpandCollapseState_LeafNode = 3_i32
  end
  enum ScrollAmount
    ScrollAmount_LargeDecrement = 0_i32
    ScrollAmount_SmallDecrement = 1_i32
    ScrollAmount_NoAmount = 2_i32
    ScrollAmount_LargeIncrement = 3_i32
    ScrollAmount_SmallIncrement = 4_i32
  end
  enum RowOrColumnMajor
    RowOrColumnMajor_RowMajor = 0_i32
    RowOrColumnMajor_ColumnMajor = 1_i32
    RowOrColumnMajor_Indeterminate = 2_i32
  end
  enum ToggleState
    ToggleState_Off = 0_i32
    ToggleState_On = 1_i32
    ToggleState_Indeterminate = 2_i32
  end
  enum WindowVisualState
    WindowVisualState_Normal = 0_i32
    WindowVisualState_Maximized = 1_i32
    WindowVisualState_Minimized = 2_i32
  end
  enum SynchronizedInputType
    SynchronizedInputType_KeyUp = 1_i32
    SynchronizedInputType_KeyDown = 2_i32
    SynchronizedInputType_LeftMouseUp = 4_i32
    SynchronizedInputType_LeftMouseDown = 8_i32
    SynchronizedInputType_RightMouseUp = 16_i32
    SynchronizedInputType_RightMouseDown = 32_i32
  end
  enum WindowInteractionState
    WindowInteractionState_Running = 0_i32
    WindowInteractionState_Closing = 1_i32
    WindowInteractionState_ReadyForUserInteraction = 2_i32
    WindowInteractionState_BlockedByModalWindow = 3_i32
    WindowInteractionState_NotResponding = 4_i32
  end
  enum SayAsInterpretAs
    SayAsInterpretAs_None = 0_i32
    SayAsInterpretAs_Spell = 1_i32
    SayAsInterpretAs_Cardinal = 2_i32
    SayAsInterpretAs_Ordinal = 3_i32
    SayAsInterpretAs_Number = 4_i32
    SayAsInterpretAs_Date = 5_i32
    SayAsInterpretAs_Time = 6_i32
    SayAsInterpretAs_Telephone = 7_i32
    SayAsInterpretAs_Currency = 8_i32
    SayAsInterpretAs_Net = 9_i32
    SayAsInterpretAs_Url = 10_i32
    SayAsInterpretAs_Address = 11_i32
    SayAsInterpretAs_Alphanumeric = 12_i32
    SayAsInterpretAs_Name = 13_i32
    SayAsInterpretAs_Media = 14_i32
    SayAsInterpretAs_Date_MonthDayYear = 15_i32
    SayAsInterpretAs_Date_DayMonthYear = 16_i32
    SayAsInterpretAs_Date_YearMonthDay = 17_i32
    SayAsInterpretAs_Date_YearMonth = 18_i32
    SayAsInterpretAs_Date_MonthYear = 19_i32
    SayAsInterpretAs_Date_DayMonth = 20_i32
    SayAsInterpretAs_Date_MonthDay = 21_i32
    SayAsInterpretAs_Date_Year = 22_i32
    SayAsInterpretAs_Time_HoursMinutesSeconds12 = 23_i32
    SayAsInterpretAs_Time_HoursMinutes12 = 24_i32
    SayAsInterpretAs_Time_HoursMinutesSeconds24 = 25_i32
    SayAsInterpretAs_Time_HoursMinutes24 = 26_i32
  end
  enum TextUnit
    TextUnit_Character = 0_i32
    TextUnit_Format = 1_i32
    TextUnit_Word = 2_i32
    TextUnit_Line = 3_i32
    TextUnit_Paragraph = 4_i32
    TextUnit_Page = 5_i32
    TextUnit_Document = 6_i32
  end
  enum TextPatternRangeEndpoint
    TextPatternRangeEndpoint_Start = 0_i32
    TextPatternRangeEndpoint_End = 1_i32
  end
  enum SupportedTextSelection
    SupportedTextSelection_None = 0_i32
    SupportedTextSelection_Single = 1_i32
    SupportedTextSelection_Multiple = 2_i32
  end
  enum LiveSetting
    Off = 0_i32
    Polite = 1_i32
    Assertive = 2_i32
  end
  enum ActiveEnd
    ActiveEnd_None = 0_i32
    ActiveEnd_Start = 1_i32
    ActiveEnd_End = 2_i32
  end
  enum CaretPosition
    CaretPosition_Unknown = 0_i32
    CaretPosition_EndOfLine = 1_i32
    CaretPosition_BeginningOfLine = 2_i32
  end
  enum CaretBidiMode
    CaretBidiMode_LTR = 0_i32
    CaretBidiMode_RTL = 1_i32
  end
  enum ZoomUnit
    ZoomUnit_NoAmount = 0_i32
    ZoomUnit_LargeDecrement = 1_i32
    ZoomUnit_SmallDecrement = 2_i32
    ZoomUnit_LargeIncrement = 3_i32
    ZoomUnit_SmallIncrement = 4_i32
  end
  enum AnimationStyle
    AnimationStyle_None = 0_i32
    AnimationStyle_LasVegasLights = 1_i32
    AnimationStyle_BlinkingBackground = 2_i32
    AnimationStyle_SparkleText = 3_i32
    AnimationStyle_MarchingBlackAnts = 4_i32
    AnimationStyle_MarchingRedAnts = 5_i32
    AnimationStyle_Shimmer = 6_i32
    AnimationStyle_Other = -1_i32
  end
  enum BulletStyle
    BulletStyle_None = 0_i32
    BulletStyle_HollowRoundBullet = 1_i32
    BulletStyle_FilledRoundBullet = 2_i32
    BulletStyle_HollowSquareBullet = 3_i32
    BulletStyle_FilledSquareBullet = 4_i32
    BulletStyle_DashBullet = 5_i32
    BulletStyle_Other = -1_i32
  end
  enum CapStyle
    CapStyle_None = 0_i32
    CapStyle_SmallCap = 1_i32
    CapStyle_AllCap = 2_i32
    CapStyle_AllPetiteCaps = 3_i32
    CapStyle_PetiteCaps = 4_i32
    CapStyle_Unicase = 5_i32
    CapStyle_Titling = 6_i32
    CapStyle_Other = -1_i32
  end
  enum FillType
    FillType_None = 0_i32
    FillType_Color = 1_i32
    FillType_Gradient = 2_i32
    FillType_Picture = 3_i32
    FillType_Pattern = 4_i32
  end
  enum FlowDirections
    FlowDirections_Default = 0_i32
    FlowDirections_RightToLeft = 1_i32
    FlowDirections_BottomToTop = 2_i32
    FlowDirections_Vertical = 4_i32
  end
  enum HorizontalTextAlignment
    HorizontalTextAlignment_Left = 0_i32
    HorizontalTextAlignment_Centered = 1_i32
    HorizontalTextAlignment_Right = 2_i32
    HorizontalTextAlignment_Justified = 3_i32
  end
  enum OutlineStyles
    OutlineStyles_None = 0_i32
    OutlineStyles_Outline = 1_i32
    OutlineStyles_Shadow = 2_i32
    OutlineStyles_Engraved = 4_i32
    OutlineStyles_Embossed = 8_i32
  end
  enum TextDecorationLineStyle
    TextDecorationLineStyle_None = 0_i32
    TextDecorationLineStyle_Single = 1_i32
    TextDecorationLineStyle_WordsOnly = 2_i32
    TextDecorationLineStyle_Double = 3_i32
    TextDecorationLineStyle_Dot = 4_i32
    TextDecorationLineStyle_Dash = 5_i32
    TextDecorationLineStyle_DashDot = 6_i32
    TextDecorationLineStyle_DashDotDot = 7_i32
    TextDecorationLineStyle_Wavy = 8_i32
    TextDecorationLineStyle_ThickSingle = 9_i32
    TextDecorationLineStyle_DoubleWavy = 11_i32
    TextDecorationLineStyle_ThickWavy = 12_i32
    TextDecorationLineStyle_LongDash = 13_i32
    TextDecorationLineStyle_ThickDash = 14_i32
    TextDecorationLineStyle_ThickDashDot = 15_i32
    TextDecorationLineStyle_ThickDashDotDot = 16_i32
    TextDecorationLineStyle_ThickDot = 17_i32
    TextDecorationLineStyle_ThickLongDash = 18_i32
    TextDecorationLineStyle_Other = -1_i32
  end
  enum VisualEffects
    VisualEffects_None = 0_i32
    VisualEffects_Shadow = 1_i32
    VisualEffects_Reflection = 2_i32
    VisualEffects_Glow = 4_i32
    VisualEffects_SoftEdges = 8_i32
    VisualEffects_Bevel = 16_i32
  end
  enum NotificationProcessing
    NotificationProcessing_ImportantAll = 0_i32
    NotificationProcessing_ImportantMostRecent = 1_i32
    NotificationProcessing_All = 2_i32
    NotificationProcessing_MostRecent = 3_i32
    NotificationProcessing_CurrentThenMostRecent = 4_i32
  end
  enum NotificationKind
    NotificationKind_ItemAdded = 0_i32
    NotificationKind_ItemRemoved = 1_i32
    NotificationKind_ActionCompleted = 2_i32
    NotificationKind_ActionAborted = 3_i32
    NotificationKind_Other = 4_i32
  end
  enum UIAutomationType
    UIAutomationType_Int = 1_i32
    UIAutomationType_Bool = 2_i32
    UIAutomationType_String = 3_i32
    UIAutomationType_Double = 4_i32
    UIAutomationType_Point = 5_i32
    UIAutomationType_Rect = 6_i32
    UIAutomationType_Element = 7_i32
    UIAutomationType_Array = 65536_i32
    UIAutomationType_Out = 131072_i32
    UIAutomationType_IntArray = 65537_i32
    UIAutomationType_BoolArray = 65538_i32
    UIAutomationType_StringArray = 65539_i32
    UIAutomationType_DoubleArray = 65540_i32
    UIAutomationType_PointArray = 65541_i32
    UIAutomationType_RectArray = 65542_i32
    UIAutomationType_ElementArray = 65543_i32
    UIAutomationType_OutInt = 131073_i32
    UIAutomationType_OutBool = 131074_i32
    UIAutomationType_OutString = 131075_i32
    UIAutomationType_OutDouble = 131076_i32
    UIAutomationType_OutPoint = 131077_i32
    UIAutomationType_OutRect = 131078_i32
    UIAutomationType_OutElement = 131079_i32
    UIAutomationType_OutIntArray = 196609_i32
    UIAutomationType_OutBoolArray = 196610_i32
    UIAutomationType_OutStringArray = 196611_i32
    UIAutomationType_OutDoubleArray = 196612_i32
    UIAutomationType_OutPointArray = 196613_i32
    UIAutomationType_OutRectArray = 196614_i32
    UIAutomationType_OutElementArray = 196615_i32
  end
  enum TreeScope
    TreeScope_None = 0_i32
    TreeScope_Element = 1_i32
    TreeScope_Children = 2_i32
    TreeScope_Descendants = 4_i32
    TreeScope_Parent = 8_i32
    TreeScope_Ancestors = 16_i32
    TreeScope_Subtree = 7_i32
  end
  enum PropertyConditionFlags
    PropertyConditionFlags_None = 0_i32
    PropertyConditionFlags_IgnoreCase = 1_i32
    PropertyConditionFlags_MatchSubstring = 2_i32
  end
  enum AutomationElementMode
    AutomationElementMode_None = 0_i32
    AutomationElementMode_Full = 1_i32
  end
  enum TreeTraversalOptions
    TreeTraversalOptions_Default = 0_i32
    TreeTraversalOptions_PostOrder = 1_i32
    TreeTraversalOptions_LastToFirstOrder = 2_i32
  end
  enum ConnectionRecoveryBehaviorOptions
    ConnectionRecoveryBehaviorOptions_Disabled = 0_i32
    ConnectionRecoveryBehaviorOptions_Enabled = 1_i32
  end
  enum CoalesceEventsOptions
    CoalesceEventsOptions_Disabled = 0_i32
    CoalesceEventsOptions_Enabled = 1_i32
  end
  enum ConditionType
    ConditionType_True = 0_i32
    ConditionType_False = 1_i32
    ConditionType_Property = 2_i32
    ConditionType_And = 3_i32
    ConditionType_Or = 4_i32
    ConditionType_Not = 5_i32
  end
  enum NormalizeState
    NormalizeState_None = 0_i32
    NormalizeState_View = 1_i32
    NormalizeState_Custom = 2_i32
  end
  enum ProviderType
    ProviderType_BaseHwnd = 0_i32
    ProviderType_Proxy = 1_i32
    ProviderType_NonClientArea = 2_i32
  end
  enum AutomationIdentifierType
    AutomationIdentifierType_Property = 0_i32
    AutomationIdentifierType_Pattern = 1_i32
    AutomationIdentifierType_Event = 2_i32
    AutomationIdentifierType_ControlType = 3_i32
    AutomationIdentifierType_TextAttribute = 4_i32
    AutomationIdentifierType_LandmarkType = 5_i32
    AutomationIdentifierType_Annotation = 6_i32
    AutomationIdentifierType_Changes = 7_i32
    AutomationIdentifierType_Style = 8_i32
  end
  enum EventArgsType
    EventArgsType_Simple = 0_i32
    EventArgsType_PropertyChanged = 1_i32
    EventArgsType_StructureChanged = 2_i32
    EventArgsType_AsyncContentLoaded = 3_i32
    EventArgsType_WindowClosed = 4_i32
    EventArgsType_TextEditTextChanged = 5_i32
    EventArgsType_Changes = 6_i32
    EventArgsType_Notification = 7_i32
    EventArgsType_ActiveTextPositionChanged = 8_i32
    EventArgsType_StructuredMarkup = 9_i32
  end
  enum AsyncContentLoadedState
    AsyncContentLoadedState_Beginning = 0_i32
    AsyncContentLoadedState_Progress = 1_i32
    AsyncContentLoadedState_Completed = 2_i32
  end

  @[Extern]
  struct MSAAMENUINFO
    property dwMSAASignature : UInt32
    property cchWText : UInt32
    property pszWText : Win32cr::Foundation::PWSTR
    def initialize(@dwMSAASignature : UInt32, @cchWText : UInt32, @pszWText : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct UiaRect
    property left : Float64
    property top : Float64
    property width : Float64
    property height : Float64
    def initialize(@left : Float64, @top : Float64, @width : Float64, @height : Float64)
    end
  end

  @[Extern]
  struct UiaPoint
    property x : Float64
    property y : Float64
    def initialize(@x : Float64, @y : Float64)
    end
  end

  @[Extern]
  struct UiaChangeInfo
    property uiaId : Int32
    property payload : Win32cr::System::Com::VARIANT
    property extraInfo : Win32cr::System::Com::VARIANT
    def initialize(@uiaId : Int32, @payload : Win32cr::System::Com::VARIANT, @extraInfo : Win32cr::System::Com::VARIANT)
    end
  end

  @[Extern]
  struct UIAutomationParameter
    property type__ : Win32cr::UI::Accessibility::UIAutomationType
    property pData : Void*
    def initialize(@type__ : Win32cr::UI::Accessibility::UIAutomationType, @pData : Void*)
    end
  end

  @[Extern]
  struct UIAutomationPropertyInfo
    property guid : LibC::GUID
    property pProgrammaticName : Win32cr::Foundation::PWSTR
    property type__ : Win32cr::UI::Accessibility::UIAutomationType
    def initialize(@guid : LibC::GUID, @pProgrammaticName : Win32cr::Foundation::PWSTR, @type__ : Win32cr::UI::Accessibility::UIAutomationType)
    end
  end

  @[Extern]
  struct UIAutomationEventInfo
    property guid : LibC::GUID
    property pProgrammaticName : Win32cr::Foundation::PWSTR
    def initialize(@guid : LibC::GUID, @pProgrammaticName : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct UIAutomationMethodInfo
    property pProgrammaticName : Win32cr::Foundation::PWSTR
    property doSetFocus : Win32cr::Foundation::BOOL
    property cInParameters : UInt32
    property cOutParameters : UInt32
    property pParameterTypes : Win32cr::UI::Accessibility::UIAutomationType*
    property pParameterNames : Win32cr::Foundation::PWSTR*
    def initialize(@pProgrammaticName : Win32cr::Foundation::PWSTR, @doSetFocus : Win32cr::Foundation::BOOL, @cInParameters : UInt32, @cOutParameters : UInt32, @pParameterTypes : Win32cr::UI::Accessibility::UIAutomationType*, @pParameterNames : Win32cr::Foundation::PWSTR*)
    end
  end

  @[Extern]
  struct UIAutomationPatternInfo
    property guid : LibC::GUID
    property pProgrammaticName : Win32cr::Foundation::PWSTR
    property providerInterfaceId : LibC::GUID
    property clientInterfaceId : LibC::GUID
    property cProperties : UInt32
    property pProperties : Win32cr::UI::Accessibility::UIAutomationPropertyInfo*
    property cMethods : UInt32
    property pMethods : Win32cr::UI::Accessibility::UIAutomationMethodInfo*
    property cEvents : UInt32
    property pEvents : Win32cr::UI::Accessibility::UIAutomationEventInfo*
    property pPatternHandler : Void*
    def initialize(@guid : LibC::GUID, @pProgrammaticName : Win32cr::Foundation::PWSTR, @providerInterfaceId : LibC::GUID, @clientInterfaceId : LibC::GUID, @cProperties : UInt32, @pProperties : Win32cr::UI::Accessibility::UIAutomationPropertyInfo*, @cMethods : UInt32, @pMethods : Win32cr::UI::Accessibility::UIAutomationMethodInfo*, @cEvents : UInt32, @pEvents : Win32cr::UI::Accessibility::UIAutomationEventInfo*, @pPatternHandler : Void*)
    end
  end

  @[Extern]
  struct ExtendedProperty
    property property_name : Win32cr::Foundation::BSTR
    property property_value : Win32cr::Foundation::BSTR
    def initialize(@property_name : Win32cr::Foundation::BSTR, @property_value : Win32cr::Foundation::BSTR)
    end
  end

  @[Extern]
  struct UiaCondition
    property condition_type : Win32cr::UI::Accessibility::ConditionType
    def initialize(@condition_type : Win32cr::UI::Accessibility::ConditionType)
    end
  end

  @[Extern]
  struct UiaPropertyCondition
    property condition_type : Win32cr::UI::Accessibility::ConditionType
    property property_id : Int32
    property value : Win32cr::System::Com::VARIANT
    property flags : Win32cr::UI::Accessibility::PropertyConditionFlags
    def initialize(@condition_type : Win32cr::UI::Accessibility::ConditionType, @property_id : Int32, @value : Win32cr::System::Com::VARIANT, @flags : Win32cr::UI::Accessibility::PropertyConditionFlags)
    end
  end

  @[Extern]
  struct UiaAndOrCondition
    property condition_type : Win32cr::UI::Accessibility::ConditionType
    property ppConditions : Win32cr::UI::Accessibility::UiaCondition**
    property cConditions : Int32
    def initialize(@condition_type : Win32cr::UI::Accessibility::ConditionType, @ppConditions : Win32cr::UI::Accessibility::UiaCondition**, @cConditions : Int32)
    end
  end

  @[Extern]
  struct UiaNotCondition
    property condition_type : Win32cr::UI::Accessibility::ConditionType
    property pCondition : Win32cr::UI::Accessibility::UiaCondition*
    def initialize(@condition_type : Win32cr::UI::Accessibility::ConditionType, @pCondition : Win32cr::UI::Accessibility::UiaCondition*)
    end
  end

  @[Extern]
  struct UiaCacheRequest
    property pViewCondition : Win32cr::UI::Accessibility::UiaCondition*
    property scope : Win32cr::UI::Accessibility::TreeScope
    property pProperties : Int32*
    property cProperties : Int32
    property pPatterns : Int32*
    property cPatterns : Int32
    property automationElementMode : Win32cr::UI::Accessibility::AutomationElementMode
    def initialize(@pViewCondition : Win32cr::UI::Accessibility::UiaCondition*, @scope : Win32cr::UI::Accessibility::TreeScope, @pProperties : Int32*, @cProperties : Int32, @pPatterns : Int32*, @cPatterns : Int32, @automationElementMode : Win32cr::UI::Accessibility::AutomationElementMode)
    end
  end

  @[Extern]
  struct UiaFindParams
    property max_depth : Int32
    property find_first : Win32cr::Foundation::BOOL
    property exclude_root : Win32cr::Foundation::BOOL
    property pFindCondition : Win32cr::UI::Accessibility::UiaCondition*
    def initialize(@max_depth : Int32, @find_first : Win32cr::Foundation::BOOL, @exclude_root : Win32cr::Foundation::BOOL, @pFindCondition : Win32cr::UI::Accessibility::UiaCondition*)
    end
  end

  @[Extern]
  struct UiaEventArgs
    property type__ : Win32cr::UI::Accessibility::EventArgsType
    property event_id : Int32
    def initialize(@type__ : Win32cr::UI::Accessibility::EventArgsType, @event_id : Int32)
    end
  end

  @[Extern]
  struct UiaPropertyChangedEventArgs
    property type__ : Win32cr::UI::Accessibility::EventArgsType
    property event_id : Int32
    property property_id : Int32
    property old_value : Win32cr::System::Com::VARIANT
    property new_value : Win32cr::System::Com::VARIANT
    def initialize(@type__ : Win32cr::UI::Accessibility::EventArgsType, @event_id : Int32, @property_id : Int32, @old_value : Win32cr::System::Com::VARIANT, @new_value : Win32cr::System::Com::VARIANT)
    end
  end

  @[Extern]
  struct UiaStructureChangedEventArgs
    property type__ : Win32cr::UI::Accessibility::EventArgsType
    property event_id : Int32
    property structure_change_type : Win32cr::UI::Accessibility::StructureChangeType
    property pRuntimeId : Int32*
    property cRuntimeIdLen : Int32
    def initialize(@type__ : Win32cr::UI::Accessibility::EventArgsType, @event_id : Int32, @structure_change_type : Win32cr::UI::Accessibility::StructureChangeType, @pRuntimeId : Int32*, @cRuntimeIdLen : Int32)
    end
  end

  @[Extern]
  struct UiaTextEditTextChangedEventArgs
    property type__ : Win32cr::UI::Accessibility::EventArgsType
    property event_id : Int32
    property text_edit_change_type : Win32cr::UI::Accessibility::TextEditChangeType
    property pTextChange : Win32cr::System::Com::SAFEARRAY*
    def initialize(@type__ : Win32cr::UI::Accessibility::EventArgsType, @event_id : Int32, @text_edit_change_type : Win32cr::UI::Accessibility::TextEditChangeType, @pTextChange : Win32cr::System::Com::SAFEARRAY*)
    end
  end

  @[Extern]
  struct UiaChangesEventArgs
    property type__ : Win32cr::UI::Accessibility::EventArgsType
    property event_id : Int32
    property event_id_count : Int32
    property pUiaChanges : Win32cr::UI::Accessibility::UiaChangeInfo*
    def initialize(@type__ : Win32cr::UI::Accessibility::EventArgsType, @event_id : Int32, @event_id_count : Int32, @pUiaChanges : Win32cr::UI::Accessibility::UiaChangeInfo*)
    end
  end

  @[Extern]
  struct UiaAsyncContentLoadedEventArgs
    property type__ : Win32cr::UI::Accessibility::EventArgsType
    property event_id : Int32
    property async_content_loaded_state : Win32cr::UI::Accessibility::AsyncContentLoadedState
    property percent_complete : Float64
    def initialize(@type__ : Win32cr::UI::Accessibility::EventArgsType, @event_id : Int32, @async_content_loaded_state : Win32cr::UI::Accessibility::AsyncContentLoadedState, @percent_complete : Float64)
    end
  end

  @[Extern]
  struct UiaWindowClosedEventArgs
    property type__ : Win32cr::UI::Accessibility::EventArgsType
    property event_id : Int32
    property pRuntimeId : Int32*
    property cRuntimeIdLen : Int32
    def initialize(@type__ : Win32cr::UI::Accessibility::EventArgsType, @event_id : Int32, @pRuntimeId : Int32*, @cRuntimeIdLen : Int32)
    end
  end

  @[Extern]
  struct SERIALKEYSA
    property cbSize : UInt32
    property dwFlags : Win32cr::UI::Accessibility::SERIALKEYS_FLAGS
    property lpszActivePort : Win32cr::Foundation::PSTR
    property lpszPort : Win32cr::Foundation::PSTR
    property iBaudRate : UInt32
    property iPortState : UInt32
    property iActive : UInt32
    def initialize(@cbSize : UInt32, @dwFlags : Win32cr::UI::Accessibility::SERIALKEYS_FLAGS, @lpszActivePort : Win32cr::Foundation::PSTR, @lpszPort : Win32cr::Foundation::PSTR, @iBaudRate : UInt32, @iPortState : UInt32, @iActive : UInt32)
    end
  end

  @[Extern]
  struct SERIALKEYSW
    property cbSize : UInt32
    property dwFlags : Win32cr::UI::Accessibility::SERIALKEYS_FLAGS
    property lpszActivePort : Win32cr::Foundation::PWSTR
    property lpszPort : Win32cr::Foundation::PWSTR
    property iBaudRate : UInt32
    property iPortState : UInt32
    property iActive : UInt32
    def initialize(@cbSize : UInt32, @dwFlags : Win32cr::UI::Accessibility::SERIALKEYS_FLAGS, @lpszActivePort : Win32cr::Foundation::PWSTR, @lpszPort : Win32cr::Foundation::PWSTR, @iBaudRate : UInt32, @iPortState : UInt32, @iActive : UInt32)
    end
  end

  @[Extern]
  struct HIGHCONTRASTA
    property cbSize : UInt32
    property dwFlags : Win32cr::UI::Accessibility::HIGHCONTRASTW_FLAGS
    property lpszDefaultScheme : Win32cr::Foundation::PSTR
    def initialize(@cbSize : UInt32, @dwFlags : Win32cr::UI::Accessibility::HIGHCONTRASTW_FLAGS, @lpszDefaultScheme : Win32cr::Foundation::PSTR)
    end
  end

  @[Extern]
  struct HIGHCONTRASTW
    property cbSize : UInt32
    property dwFlags : Win32cr::UI::Accessibility::HIGHCONTRASTW_FLAGS
    property lpszDefaultScheme : Win32cr::Foundation::PWSTR
    def initialize(@cbSize : UInt32, @dwFlags : Win32cr::UI::Accessibility::HIGHCONTRASTW_FLAGS, @lpszDefaultScheme : Win32cr::Foundation::PWSTR)
    end
  end

  @[Extern]
  struct FILTERKEYS
    property cbSize : UInt32
    property dwFlags : UInt32
    property iWaitMSec : UInt32
    property iDelayMSec : UInt32
    property iRepeatMSec : UInt32
    property iBounceMSec : UInt32
    def initialize(@cbSize : UInt32, @dwFlags : UInt32, @iWaitMSec : UInt32, @iDelayMSec : UInt32, @iRepeatMSec : UInt32, @iBounceMSec : UInt32)
    end
  end

  @[Extern]
  struct STICKYKEYS
    property cbSize : UInt32
    property dwFlags : Win32cr::UI::Accessibility::STICKYKEYS_FLAGS
    def initialize(@cbSize : UInt32, @dwFlags : Win32cr::UI::Accessibility::STICKYKEYS_FLAGS)
    end
  end

  @[Extern]
  struct MOUSEKEYS
    property cbSize : UInt32
    property dwFlags : UInt32
    property iMaxSpeed : UInt32
    property iTimeToMaxSpeed : UInt32
    property iCtrlSpeed : UInt32
    property dwReserved1 : UInt32
    property dwReserved2 : UInt32
    def initialize(@cbSize : UInt32, @dwFlags : UInt32, @iMaxSpeed : UInt32, @iTimeToMaxSpeed : UInt32, @iCtrlSpeed : UInt32, @dwReserved1 : UInt32, @dwReserved2 : UInt32)
    end
  end

  @[Extern]
  struct ACCESSTIMEOUT
    property cbSize : UInt32
    property dwFlags : UInt32
    property iTimeOutMSec : UInt32
    def initialize(@cbSize : UInt32, @dwFlags : UInt32, @iTimeOutMSec : UInt32)
    end
  end

  @[Extern]
  struct SOUNDSENTRYA
    property cbSize : UInt32
    property dwFlags : Win32cr::UI::Accessibility::SOUNDSENTRY_FLAGS
    property iFSTextEffect : Win32cr::UI::Accessibility::SOUNDSENTRY_TEXT_EFFECT
    property iFSTextEffectMSec : UInt32
    property iFSTextEffectColorBits : UInt32
    property iFSGrafEffect : Win32cr::UI::Accessibility::SOUND_SENTRY_GRAPHICS_EFFECT
    property iFSGrafEffectMSec : UInt32
    property iFSGrafEffectColor : UInt32
    property iWindowsEffect : Win32cr::UI::Accessibility::SOUNDSENTRY_WINDOWS_EFFECT
    property iWindowsEffectMSec : UInt32
    property lpszWindowsEffectDLL : Win32cr::Foundation::PSTR
    property iWindowsEffectOrdinal : UInt32
    def initialize(@cbSize : UInt32, @dwFlags : Win32cr::UI::Accessibility::SOUNDSENTRY_FLAGS, @iFSTextEffect : Win32cr::UI::Accessibility::SOUNDSENTRY_TEXT_EFFECT, @iFSTextEffectMSec : UInt32, @iFSTextEffectColorBits : UInt32, @iFSGrafEffect : Win32cr::UI::Accessibility::SOUND_SENTRY_GRAPHICS_EFFECT, @iFSGrafEffectMSec : UInt32, @iFSGrafEffectColor : UInt32, @iWindowsEffect : Win32cr::UI::Accessibility::SOUNDSENTRY_WINDOWS_EFFECT, @iWindowsEffectMSec : UInt32, @lpszWindowsEffectDLL : Win32cr::Foundation::PSTR, @iWindowsEffectOrdinal : UInt32)
    end
  end

  @[Extern]
  struct SOUNDSENTRYW
    property cbSize : UInt32
    property dwFlags : Win32cr::UI::Accessibility::SOUNDSENTRY_FLAGS
    property iFSTextEffect : Win32cr::UI::Accessibility::SOUNDSENTRY_TEXT_EFFECT
    property iFSTextEffectMSec : UInt32
    property iFSTextEffectColorBits : UInt32
    property iFSGrafEffect : Win32cr::UI::Accessibility::SOUND_SENTRY_GRAPHICS_EFFECT
    property iFSGrafEffectMSec : UInt32
    property iFSGrafEffectColor : UInt32
    property iWindowsEffect : Win32cr::UI::Accessibility::SOUNDSENTRY_WINDOWS_EFFECT
    property iWindowsEffectMSec : UInt32
    property lpszWindowsEffectDLL : Win32cr::Foundation::PWSTR
    property iWindowsEffectOrdinal : UInt32
    def initialize(@cbSize : UInt32, @dwFlags : Win32cr::UI::Accessibility::SOUNDSENTRY_FLAGS, @iFSTextEffect : Win32cr::UI::Accessibility::SOUNDSENTRY_TEXT_EFFECT, @iFSTextEffectMSec : UInt32, @iFSTextEffectColorBits : UInt32, @iFSGrafEffect : Win32cr::UI::Accessibility::SOUND_SENTRY_GRAPHICS_EFFECT, @iFSGrafEffectMSec : UInt32, @iFSGrafEffectColor : UInt32, @iWindowsEffect : Win32cr::UI::Accessibility::SOUNDSENTRY_WINDOWS_EFFECT, @iWindowsEffectMSec : UInt32, @lpszWindowsEffectDLL : Win32cr::Foundation::PWSTR, @iWindowsEffectOrdinal : UInt32)
    end
  end

  @[Extern]
  struct TOGGLEKEYS
    property cbSize : UInt32
    property dwFlags : UInt32
    def initialize(@cbSize : UInt32, @dwFlags : UInt32)
    end
  end

  @[Extern]
  record IRicheditWindowlessAccessibilityVtbl,
    query_interface : Proc(IRicheditWindowlessAccessibility*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRicheditWindowlessAccessibility*, UInt32),
    release : Proc(IRicheditWindowlessAccessibility*, UInt32),
    create_provider : Proc(IRicheditWindowlessAccessibility*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRicheditWindowlessAccessibility, lpVtbl : IRicheditWindowlessAccessibilityVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IRicheditWindowlessAccessibility*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRicheditWindowlessAccessibility*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRicheditWindowlessAccessibility*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_provider(this : IRicheditWindowlessAccessibility*, pSite : Void*, ppProvider : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_provider.call(this, pSite, ppProvider)
    end

  end

  @[Extern]
  record IRichEditUiaInformationVtbl,
    query_interface : Proc(IRichEditUiaInformation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRichEditUiaInformation*, UInt32),
    release : Proc(IRichEditUiaInformation*, UInt32),
    get_boundary_rectangle : Proc(IRichEditUiaInformation*, Win32cr::UI::Accessibility::UiaRect*, Win32cr::Foundation::HRESULT),
    is_visible : Proc(IRichEditUiaInformation*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRichEditUiaInformation, lpVtbl : IRichEditUiaInformationVtbl* do
    GUID = LibC::GUID.new(0x0_u32, 0x0_u16, 0x0_u16, StaticArray[0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8, 0x0_u8])
    def query_interface(this : IRichEditUiaInformation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRichEditUiaInformation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRichEditUiaInformation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_boundary_rectangle(this : IRichEditUiaInformation*, pUiaRect : Win32cr::UI::Accessibility::UiaRect*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_boundary_rectangle.call(this, pUiaRect)
    end
    def is_visible(this : IRichEditUiaInformation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.is_visible.call(this)
    end

  end

  @[Extern]
  record IAccessibleVtbl,
    query_interface : Proc(IAccessible*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccessible*, UInt32),
    release : Proc(IAccessible*, UInt32),
    get_type_info_count : Proc(IAccessible*, UInt32*, Win32cr::Foundation::HRESULT),
    get_type_info : Proc(IAccessible*, UInt32, UInt32, Void**, Win32cr::Foundation::HRESULT),
    get_i_ds_of_names : Proc(IAccessible*, LibC::GUID*, Win32cr::Foundation::PWSTR*, UInt32, UInt32, Int32*, Win32cr::Foundation::HRESULT),
    invoke_1 : Proc(IAccessible*, Int32, LibC::GUID*, UInt32, UInt16, Win32cr::System::Com::DISPPARAMS*, Win32cr::System::Com::VARIANT*, Win32cr::System::Com::EXCEPINFO*, UInt32*, Win32cr::Foundation::HRESULT),
    get_accParent : Proc(IAccessible*, Void**, Win32cr::Foundation::HRESULT),
    get_accChildCount : Proc(IAccessible*, Int32*, Win32cr::Foundation::HRESULT),
    get_accChild : Proc(IAccessible*, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    get_accName : Proc(IAccessible*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_accValue : Proc(IAccessible*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_accDescription : Proc(IAccessible*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_accRole : Proc(IAccessible*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_accState : Proc(IAccessible*, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_accHelp : Proc(IAccessible*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_accHelpTopic : Proc(IAccessible*, Win32cr::Foundation::BSTR*, Win32cr::System::Com::VARIANT, Int32*, Win32cr::Foundation::HRESULT),
    get_accKeyboardShortcut : Proc(IAccessible*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_accFocus : Proc(IAccessible*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_accSelection : Proc(IAccessible*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_accDefaultAction : Proc(IAccessible*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    accSelect : Proc(IAccessible*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    accLocation : Proc(IAccessible*, Int32*, Int32*, Int32*, Int32*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    accNavigate : Proc(IAccessible*, Int32, Win32cr::System::Com::VARIANT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    accHitTest : Proc(IAccessible*, Int32, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    accDoDefaultAction : Proc(IAccessible*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    put_accName : Proc(IAccessible*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    put_accValue : Proc(IAccessible*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAccessible, lpVtbl : IAccessibleVtbl* do
    GUID = LibC::GUID.new(0x618736e0_u32, 0x3c3d_u16, 0x11cf_u16, StaticArray[0x81_u8, 0xc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x38_u8, 0x9b_u8, 0x71_u8])
    def query_interface(this : IAccessible*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccessible*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccessible*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_type_info_count(this : IAccessible*, pctinfo : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info_count.call(this, pctinfo)
    end
    def get_type_info(this : IAccessible*, iTInfo : UInt32, lcid : UInt32, ppTInfo : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_type_info.call(this, iTInfo, lcid, ppTInfo)
    end
    def get_i_ds_of_names(this : IAccessible*, riid : LibC::GUID*, rgszNames : Win32cr::Foundation::PWSTR*, cNames : UInt32, lcid : UInt32, rgDispId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_ds_of_names.call(this, riid, rgszNames, cNames, lcid, rgDispId)
    end
    def invoke_1(this : IAccessible*, dispIdMember : Int32, riid : LibC::GUID*, lcid : UInt32, wFlags : UInt16, pDispParams : Win32cr::System::Com::DISPPARAMS*, pVarResult : Win32cr::System::Com::VARIANT*, pExcepInfo : Win32cr::System::Com::EXCEPINFO*, puArgErr : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke_1.call(this, dispIdMember, riid, lcid, wFlags, pDispParams, pVarResult, pExcepInfo, puArgErr)
    end
    def get_accParent(this : IAccessible*, ppdispParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accParent.call(this, ppdispParent)
    end
    def get_accChildCount(this : IAccessible*, pcountChildren : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accChildCount.call(this, pcountChildren)
    end
    def get_accChild(this : IAccessible*, varChild : Win32cr::System::Com::VARIANT, ppdispChild : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accChild.call(this, varChild, ppdispChild)
    end
    def get_accName(this : IAccessible*, varChild : Win32cr::System::Com::VARIANT, pszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accName.call(this, varChild, pszName)
    end
    def get_accValue(this : IAccessible*, varChild : Win32cr::System::Com::VARIANT, pszValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accValue.call(this, varChild, pszValue)
    end
    def get_accDescription(this : IAccessible*, varChild : Win32cr::System::Com::VARIANT, pszDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accDescription.call(this, varChild, pszDescription)
    end
    def get_accRole(this : IAccessible*, varChild : Win32cr::System::Com::VARIANT, pvarRole : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accRole.call(this, varChild, pvarRole)
    end
    def get_accState(this : IAccessible*, varChild : Win32cr::System::Com::VARIANT, pvarState : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accState.call(this, varChild, pvarState)
    end
    def get_accHelp(this : IAccessible*, varChild : Win32cr::System::Com::VARIANT, pszHelp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accHelp.call(this, varChild, pszHelp)
    end
    def get_accHelpTopic(this : IAccessible*, pszHelpFile : Win32cr::Foundation::BSTR*, varChild : Win32cr::System::Com::VARIANT, pidTopic : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accHelpTopic.call(this, pszHelpFile, varChild, pidTopic)
    end
    def get_accKeyboardShortcut(this : IAccessible*, varChild : Win32cr::System::Com::VARIANT, pszKeyboardShortcut : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accKeyboardShortcut.call(this, varChild, pszKeyboardShortcut)
    end
    def get_accFocus(this : IAccessible*, pvarChild : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accFocus.call(this, pvarChild)
    end
    def get_accSelection(this : IAccessible*, pvarChildren : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accSelection.call(this, pvarChildren)
    end
    def get_accDefaultAction(this : IAccessible*, varChild : Win32cr::System::Com::VARIANT, pszDefaultAction : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_accDefaultAction.call(this, varChild, pszDefaultAction)
    end
    def accSelect(this : IAccessible*, flagsSelect : Int32, varChild : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accSelect.call(this, flagsSelect, varChild)
    end
    def accLocation(this : IAccessible*, pxLeft : Int32*, pyTop : Int32*, pcxWidth : Int32*, pcyHeight : Int32*, varChild : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accLocation.call(this, pxLeft, pyTop, pcxWidth, pcyHeight, varChild)
    end
    def accNavigate(this : IAccessible*, navDir : Int32, varStart : Win32cr::System::Com::VARIANT, pvarEndUpAt : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accNavigate.call(this, navDir, varStart, pvarEndUpAt)
    end
    def accHitTest(this : IAccessible*, xLeft : Int32, yTop : Int32, pvarChild : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accHitTest.call(this, xLeft, yTop, pvarChild)
    end
    def accDoDefaultAction(this : IAccessible*, varChild : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accDoDefaultAction.call(this, varChild)
    end
    def put_accName(this : IAccessible*, varChild : Win32cr::System::Com::VARIANT, szName : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_accName.call(this, varChild, szName)
    end
    def put_accValue(this : IAccessible*, varChild : Win32cr::System::Com::VARIANT, szValue : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_accValue.call(this, varChild, szValue)
    end

  end

  @[Extern]
  record IAccessibleHandlerVtbl,
    query_interface : Proc(IAccessibleHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccessibleHandler*, UInt32),
    release : Proc(IAccessibleHandler*, UInt32),
    accessible_object_from_id : Proc(IAccessibleHandler*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAccessibleHandler, lpVtbl : IAccessibleHandlerVtbl* do
    GUID = LibC::GUID.new(0x3022430_u32, 0xabc4_u16, 0x11d0_u16, StaticArray[0xbd_u8, 0xe2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x1a_u8, 0x19_u8, 0x53_u8])
    def query_interface(this : IAccessibleHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccessibleHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccessibleHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def accessible_object_from_id(this : IAccessibleHandler*, hwnd : Int32, lObjectID : Int32, pIAccessible : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.accessible_object_from_id.call(this, hwnd, lObjectID, pIAccessible)
    end

  end

  @[Extern]
  record IAccessibleWindowlessSiteVtbl,
    query_interface : Proc(IAccessibleWindowlessSite*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccessibleWindowlessSite*, UInt32),
    release : Proc(IAccessibleWindowlessSite*, UInt32),
    acquire_object_id_range : Proc(IAccessibleWindowlessSite*, Int32, Void*, Int32*, Win32cr::Foundation::HRESULT),
    release_object_id_range : Proc(IAccessibleWindowlessSite*, Int32, Void*, Win32cr::Foundation::HRESULT),
    query_object_id_ranges : Proc(IAccessibleWindowlessSite*, Void*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_parent_accessible : Proc(IAccessibleWindowlessSite*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAccessibleWindowlessSite, lpVtbl : IAccessibleWindowlessSiteVtbl* do
    GUID = LibC::GUID.new(0xbf3abd9c_u32, 0x76da_u16, 0x4389_u16, StaticArray[0x9e_u8, 0xb6_u8, 0x14_u8, 0x27_u8, 0xd2_u8, 0x5a_u8, 0xba_u8, 0xb7_u8])
    def query_interface(this : IAccessibleWindowlessSite*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccessibleWindowlessSite*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccessibleWindowlessSite*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def acquire_object_id_range(this : IAccessibleWindowlessSite*, rangeSize : Int32, pRangeOwner : Void*, pRangeBase : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.acquire_object_id_range.call(this, rangeSize, pRangeOwner, pRangeBase)
    end
    def release_object_id_range(this : IAccessibleWindowlessSite*, rangeBase : Int32, pRangeOwner : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.release_object_id_range.call(this, rangeBase, pRangeOwner)
    end
    def query_object_id_ranges(this : IAccessibleWindowlessSite*, pRangesOwner : Void*, psaRanges : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_object_id_ranges.call(this, pRangesOwner, psaRanges)
    end
    def get_parent_accessible(this : IAccessibleWindowlessSite*, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_accessible.call(this, ppParent)
    end

  end

  @[Extern]
  record IAccIdentityVtbl,
    query_interface : Proc(IAccIdentity*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccIdentity*, UInt32),
    release : Proc(IAccIdentity*, UInt32),
    get_identity_string : Proc(IAccIdentity*, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAccIdentity, lpVtbl : IAccIdentityVtbl* do
    GUID = LibC::GUID.new(0x7852b78d_u32, 0x1cfd_u16, 0x41c1_u16, StaticArray[0xa6_u8, 0x15_u8, 0x9c_u8, 0xc_u8, 0x85_u8, 0x96_u8, 0xb_u8, 0x5f_u8])
    def query_interface(this : IAccIdentity*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccIdentity*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccIdentity*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_identity_string(this : IAccIdentity*, dwIDChild : UInt32, ppIDString : UInt8**, pdwIDStringLen : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_identity_string.call(this, dwIDChild, ppIDString, pdwIDStringLen)
    end

  end

  @[Extern]
  record IAccPropServerVtbl,
    query_interface : Proc(IAccPropServer*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccPropServer*, UInt32),
    release : Proc(IAccPropServer*, UInt32),
    get_prop_value : Proc(IAccPropServer*, UInt8*, UInt32, LibC::GUID, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAccPropServer, lpVtbl : IAccPropServerVtbl* do
    GUID = LibC::GUID.new(0x76c0dbbb_u32, 0x15e0_u16, 0x4e7b_u16, StaticArray[0xb6_u8, 0x1b_u8, 0x20_u8, 0xee_u8, 0xea_u8, 0x20_u8, 0x1_u8, 0xe0_u8])
    def query_interface(this : IAccPropServer*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccPropServer*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccPropServer*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_prop_value(this : IAccPropServer*, pIDString : UInt8*, dwIDStringLen : UInt32, idProp : LibC::GUID, pvarValue : Win32cr::System::Com::VARIANT*, pfHasProp : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_prop_value.call(this, pIDString, dwIDStringLen, idProp, pvarValue, pfHasProp)
    end

  end

  @[Extern]
  record IAccPropServicesVtbl,
    query_interface : Proc(IAccPropServices*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccPropServices*, UInt32),
    release : Proc(IAccPropServices*, UInt32),
    set_prop_value : Proc(IAccPropServices*, UInt8*, UInt32, LibC::GUID, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    set_prop_server : Proc(IAccPropServices*, UInt8*, UInt32, LibC::GUID*, Int32, Void*, Win32cr::UI::Accessibility::AnnoScope, Win32cr::Foundation::HRESULT),
    clear_props : Proc(IAccPropServices*, UInt8*, UInt32, LibC::GUID*, Int32, Win32cr::Foundation::HRESULT),
    set_hwnd_prop : Proc(IAccPropServices*, Win32cr::Foundation::HWND, UInt32, UInt32, LibC::GUID, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    set_hwnd_prop_str : Proc(IAccPropServices*, Win32cr::Foundation::HWND, UInt32, UInt32, LibC::GUID, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_hwnd_prop_server : Proc(IAccPropServices*, Win32cr::Foundation::HWND, UInt32, UInt32, LibC::GUID*, Int32, Void*, Win32cr::UI::Accessibility::AnnoScope, Win32cr::Foundation::HRESULT),
    clear_hwnd_props : Proc(IAccPropServices*, Win32cr::Foundation::HWND, UInt32, UInt32, LibC::GUID*, Int32, Win32cr::Foundation::HRESULT),
    compose_hwnd_identity_string : Proc(IAccPropServices*, Win32cr::Foundation::HWND, UInt32, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    decompose_hwnd_identity_string : Proc(IAccPropServices*, UInt8*, UInt32, Win32cr::Foundation::HWND*, UInt32*, UInt32*, Win32cr::Foundation::HRESULT),
    set_hmenu_prop : Proc(IAccPropServices*, Win32cr::UI::WindowsAndMessaging::HMENU, UInt32, LibC::GUID, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    set_hmenu_prop_str : Proc(IAccPropServices*, Win32cr::UI::WindowsAndMessaging::HMENU, UInt32, LibC::GUID, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_hmenu_prop_server : Proc(IAccPropServices*, Win32cr::UI::WindowsAndMessaging::HMENU, UInt32, LibC::GUID*, Int32, Void*, Win32cr::UI::Accessibility::AnnoScope, Win32cr::Foundation::HRESULT),
    clear_hmenu_props : Proc(IAccPropServices*, Win32cr::UI::WindowsAndMessaging::HMENU, UInt32, LibC::GUID*, Int32, Win32cr::Foundation::HRESULT),
    compose_hmenu_identity_string : Proc(IAccPropServices*, Win32cr::UI::WindowsAndMessaging::HMENU, UInt32, UInt8**, UInt32*, Win32cr::Foundation::HRESULT),
    decompose_hmenu_identity_string : Proc(IAccPropServices*, UInt8*, UInt32, Win32cr::UI::WindowsAndMessaging::HMENU*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAccPropServices, lpVtbl : IAccPropServicesVtbl* do
    GUID = LibC::GUID.new(0x6e26e776_u32, 0x4f0_u16, 0x495d_u16, StaticArray[0x80_u8, 0xe4_u8, 0x33_u8, 0x30_u8, 0x35_u8, 0x2e_u8, 0x31_u8, 0x69_u8])
    def query_interface(this : IAccPropServices*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccPropServices*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccPropServices*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_prop_value(this : IAccPropServices*, pIDString : UInt8*, dwIDStringLen : UInt32, idProp : LibC::GUID, var : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_prop_value.call(this, pIDString, dwIDStringLen, idProp, var)
    end
    def set_prop_server(this : IAccPropServices*, pIDString : UInt8*, dwIDStringLen : UInt32, paProps : LibC::GUID*, cProps : Int32, pServer : Void*, annoScope : Win32cr::UI::Accessibility::AnnoScope) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_prop_server.call(this, pIDString, dwIDStringLen, paProps, cProps, pServer, annoScope)
    end
    def clear_props(this : IAccPropServices*, pIDString : UInt8*, dwIDStringLen : UInt32, paProps : LibC::GUID*, cProps : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_props.call(this, pIDString, dwIDStringLen, paProps, cProps)
    end
    def set_hwnd_prop(this : IAccPropServices*, hwnd : Win32cr::Foundation::HWND, idObject : UInt32, idChild : UInt32, idProp : LibC::GUID, var : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hwnd_prop.call(this, hwnd, idObject, idChild, idProp, var)
    end
    def set_hwnd_prop_str(this : IAccPropServices*, hwnd : Win32cr::Foundation::HWND, idObject : UInt32, idChild : UInt32, idProp : LibC::GUID, str : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hwnd_prop_str.call(this, hwnd, idObject, idChild, idProp, str)
    end
    def set_hwnd_prop_server(this : IAccPropServices*, hwnd : Win32cr::Foundation::HWND, idObject : UInt32, idChild : UInt32, paProps : LibC::GUID*, cProps : Int32, pServer : Void*, annoScope : Win32cr::UI::Accessibility::AnnoScope) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hwnd_prop_server.call(this, hwnd, idObject, idChild, paProps, cProps, pServer, annoScope)
    end
    def clear_hwnd_props(this : IAccPropServices*, hwnd : Win32cr::Foundation::HWND, idObject : UInt32, idChild : UInt32, paProps : LibC::GUID*, cProps : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_hwnd_props.call(this, hwnd, idObject, idChild, paProps, cProps)
    end
    def compose_hwnd_identity_string(this : IAccPropServices*, hwnd : Win32cr::Foundation::HWND, idObject : UInt32, idChild : UInt32, ppIDString : UInt8**, pdwIDStringLen : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compose_hwnd_identity_string.call(this, hwnd, idObject, idChild, ppIDString, pdwIDStringLen)
    end
    def decompose_hwnd_identity_string(this : IAccPropServices*, pIDString : UInt8*, dwIDStringLen : UInt32, phwnd : Win32cr::Foundation::HWND*, pidObject : UInt32*, pidChild : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.decompose_hwnd_identity_string.call(this, pIDString, dwIDStringLen, phwnd, pidObject, pidChild)
    end
    def set_hmenu_prop(this : IAccPropServices*, hmenu : Win32cr::UI::WindowsAndMessaging::HMENU, idChild : UInt32, idProp : LibC::GUID, var : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hmenu_prop.call(this, hmenu, idChild, idProp, var)
    end
    def set_hmenu_prop_str(this : IAccPropServices*, hmenu : Win32cr::UI::WindowsAndMessaging::HMENU, idChild : UInt32, idProp : LibC::GUID, str : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hmenu_prop_str.call(this, hmenu, idChild, idProp, str)
    end
    def set_hmenu_prop_server(this : IAccPropServices*, hmenu : Win32cr::UI::WindowsAndMessaging::HMENU, idChild : UInt32, paProps : LibC::GUID*, cProps : Int32, pServer : Void*, annoScope : Win32cr::UI::Accessibility::AnnoScope) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_hmenu_prop_server.call(this, hmenu, idChild, paProps, cProps, pServer, annoScope)
    end
    def clear_hmenu_props(this : IAccPropServices*, hmenu : Win32cr::UI::WindowsAndMessaging::HMENU, idChild : UInt32, paProps : LibC::GUID*, cProps : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_hmenu_props.call(this, hmenu, idChild, paProps, cProps)
    end
    def compose_hmenu_identity_string(this : IAccPropServices*, hmenu : Win32cr::UI::WindowsAndMessaging::HMENU, idChild : UInt32, ppIDString : UInt8**, pdwIDStringLen : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compose_hmenu_identity_string.call(this, hmenu, idChild, ppIDString, pdwIDStringLen)
    end
    def decompose_hmenu_identity_string(this : IAccPropServices*, pIDString : UInt8*, dwIDStringLen : UInt32, phmenu : Win32cr::UI::WindowsAndMessaging::HMENU*, pidChild : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.decompose_hmenu_identity_string.call(this, pIDString, dwIDStringLen, phmenu, pidChild)
    end

  end

  @[Extern]
  record IRawElementProviderSimpleVtbl,
    query_interface : Proc(IRawElementProviderSimple*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRawElementProviderSimple*, UInt32),
    release : Proc(IRawElementProviderSimple*, UInt32),
    get_ProviderOptions : Proc(IRawElementProviderSimple*, Win32cr::UI::Accessibility::ProviderOptions*, Win32cr::Foundation::HRESULT),
    get_pattern_provider : Proc(IRawElementProviderSimple*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_property_value : Proc(IRawElementProviderSimple*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_HostRawElementProvider : Proc(IRawElementProviderSimple*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRawElementProviderSimple, lpVtbl : IRawElementProviderSimpleVtbl* do
    GUID = LibC::GUID.new(0xd6dd68d1_u32, 0x86fd_u16, 0x4332_u16, StaticArray[0x86_u8, 0x66_u8, 0x9a_u8, 0xbe_u8, 0xde_u8, 0xa2_u8, 0xd2_u8, 0x4c_u8])
    def query_interface(this : IRawElementProviderSimple*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRawElementProviderSimple*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRawElementProviderSimple*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_ProviderOptions(this : IRawElementProviderSimple*, pRetVal : Win32cr::UI::Accessibility::ProviderOptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProviderOptions.call(this, pRetVal)
    end
    def get_pattern_provider(this : IRawElementProviderSimple*, patternId : Int32, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pattern_provider.call(this, patternId, pRetVal)
    end
    def get_property_value(this : IRawElementProviderSimple*, propertyId : Int32, pRetVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_value.call(this, propertyId, pRetVal)
    end
    def get_HostRawElementProvider(this : IRawElementProviderSimple*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HostRawElementProvider.call(this, pRetVal)
    end

  end

  @[Extern]
  record IAccessibleExVtbl,
    query_interface : Proc(IAccessibleEx*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccessibleEx*, UInt32),
    release : Proc(IAccessibleEx*, UInt32),
    get_object_for_child : Proc(IAccessibleEx*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_i_accessible_pair : Proc(IAccessibleEx*, Void**, Int32*, Win32cr::Foundation::HRESULT),
    get_runtime_id : Proc(IAccessibleEx*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    convert_returned_element : Proc(IAccessibleEx*, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAccessibleEx, lpVtbl : IAccessibleExVtbl* do
    GUID = LibC::GUID.new(0xf8b80ada_u32, 0x2c44_u16, 0x48d0_u16, StaticArray[0x89_u8, 0xbe_u8, 0x5f_u8, 0xf2_u8, 0x3c_u8, 0x9c_u8, 0xd8_u8, 0x75_u8])
    def query_interface(this : IAccessibleEx*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccessibleEx*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccessibleEx*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_object_for_child(this : IAccessibleEx*, idChild : Int32, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_for_child.call(this, idChild, pRetVal)
    end
    def get_i_accessible_pair(this : IAccessibleEx*, ppAcc : Void**, pidChild : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_accessible_pair.call(this, ppAcc, pidChild)
    end
    def get_runtime_id(this : IAccessibleEx*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_id.call(this, pRetVal)
    end
    def convert_returned_element(this : IAccessibleEx*, pIn : Void*, ppRetValOut : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.convert_returned_element.call(this, pIn, ppRetValOut)
    end

  end

  @[Extern]
  record IRawElementProviderSimple2Vtbl,
    query_interface : Proc(IRawElementProviderSimple2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRawElementProviderSimple2*, UInt32),
    release : Proc(IRawElementProviderSimple2*, UInt32),
    get_ProviderOptions : Proc(IRawElementProviderSimple2*, Win32cr::UI::Accessibility::ProviderOptions*, Win32cr::Foundation::HRESULT),
    get_pattern_provider : Proc(IRawElementProviderSimple2*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_property_value : Proc(IRawElementProviderSimple2*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_HostRawElementProvider : Proc(IRawElementProviderSimple2*, Void**, Win32cr::Foundation::HRESULT),
    show_context_menu : Proc(IRawElementProviderSimple2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRawElementProviderSimple2, lpVtbl : IRawElementProviderSimple2Vtbl* do
    GUID = LibC::GUID.new(0xa0a839a9_u32, 0x8da1_u16, 0x4a82_u16, StaticArray[0x80_u8, 0x6a_u8, 0x8e_u8, 0xd_u8, 0x44_u8, 0xe7_u8, 0x9f_u8, 0x56_u8])
    def query_interface(this : IRawElementProviderSimple2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRawElementProviderSimple2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRawElementProviderSimple2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_ProviderOptions(this : IRawElementProviderSimple2*, pRetVal : Win32cr::UI::Accessibility::ProviderOptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProviderOptions.call(this, pRetVal)
    end
    def get_pattern_provider(this : IRawElementProviderSimple2*, patternId : Int32, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pattern_provider.call(this, patternId, pRetVal)
    end
    def get_property_value(this : IRawElementProviderSimple2*, propertyId : Int32, pRetVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_value.call(this, propertyId, pRetVal)
    end
    def get_HostRawElementProvider(this : IRawElementProviderSimple2*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HostRawElementProvider.call(this, pRetVal)
    end
    def show_context_menu(this : IRawElementProviderSimple2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_context_menu.call(this)
    end

  end

  @[Extern]
  record IRawElementProviderSimple3Vtbl,
    query_interface : Proc(IRawElementProviderSimple3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRawElementProviderSimple3*, UInt32),
    release : Proc(IRawElementProviderSimple3*, UInt32),
    get_ProviderOptions : Proc(IRawElementProviderSimple3*, Win32cr::UI::Accessibility::ProviderOptions*, Win32cr::Foundation::HRESULT),
    get_pattern_provider : Proc(IRawElementProviderSimple3*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_property_value : Proc(IRawElementProviderSimple3*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_HostRawElementProvider : Proc(IRawElementProviderSimple3*, Void**, Win32cr::Foundation::HRESULT),
    show_context_menu : Proc(IRawElementProviderSimple3*, Win32cr::Foundation::HRESULT),
    get_metadata_value : Proc(IRawElementProviderSimple3*, Int32, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRawElementProviderSimple3, lpVtbl : IRawElementProviderSimple3Vtbl* do
    GUID = LibC::GUID.new(0xfcf5d820_u32, 0xd7ec_u16, 0x4613_u16, StaticArray[0xbd_u8, 0xf6_u8, 0x42_u8, 0xa8_u8, 0x4c_u8, 0xe7_u8, 0xda_u8, 0xaf_u8])
    def query_interface(this : IRawElementProviderSimple3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRawElementProviderSimple3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRawElementProviderSimple3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_ProviderOptions(this : IRawElementProviderSimple3*, pRetVal : Win32cr::UI::Accessibility::ProviderOptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProviderOptions.call(this, pRetVal)
    end
    def get_pattern_provider(this : IRawElementProviderSimple3*, patternId : Int32, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pattern_provider.call(this, patternId, pRetVal)
    end
    def get_property_value(this : IRawElementProviderSimple3*, propertyId : Int32, pRetVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_value.call(this, propertyId, pRetVal)
    end
    def get_HostRawElementProvider(this : IRawElementProviderSimple3*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HostRawElementProvider.call(this, pRetVal)
    end
    def show_context_menu(this : IRawElementProviderSimple3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_context_menu.call(this)
    end
    def get_metadata_value(this : IRawElementProviderSimple3*, targetId : Int32, metadataId : Int32, returnVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_metadata_value.call(this, targetId, metadataId, returnVal)
    end

  end

  @[Extern]
  record IRawElementProviderFragmentRootVtbl,
    query_interface : Proc(IRawElementProviderFragmentRoot*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRawElementProviderFragmentRoot*, UInt32),
    release : Proc(IRawElementProviderFragmentRoot*, UInt32),
    element_provider_from_point : Proc(IRawElementProviderFragmentRoot*, Float64, Float64, Void**, Win32cr::Foundation::HRESULT),
    get_focus : Proc(IRawElementProviderFragmentRoot*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRawElementProviderFragmentRoot, lpVtbl : IRawElementProviderFragmentRootVtbl* do
    GUID = LibC::GUID.new(0x620ce2a5_u32, 0xab8f_u16, 0x40a9_u16, StaticArray[0x86_u8, 0xcb_u8, 0xde_u8, 0x3c_u8, 0x75_u8, 0x59_u8, 0x9b_u8, 0x58_u8])
    def query_interface(this : IRawElementProviderFragmentRoot*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRawElementProviderFragmentRoot*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRawElementProviderFragmentRoot*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def element_provider_from_point(this : IRawElementProviderFragmentRoot*, x : Float64, y : Float64, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_provider_from_point.call(this, x, y, pRetVal)
    end
    def get_focus(this : IRawElementProviderFragmentRoot*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focus.call(this, pRetVal)
    end

  end

  @[Extern]
  record IRawElementProviderFragmentVtbl,
    query_interface : Proc(IRawElementProviderFragment*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRawElementProviderFragment*, UInt32),
    release : Proc(IRawElementProviderFragment*, UInt32),
    navigate : Proc(IRawElementProviderFragment*, Win32cr::UI::Accessibility::NavigateDirection, Void**, Win32cr::Foundation::HRESULT),
    get_runtime_id : Proc(IRawElementProviderFragment*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_BoundingRectangle : Proc(IRawElementProviderFragment*, Win32cr::UI::Accessibility::UiaRect*, Win32cr::Foundation::HRESULT),
    get_embedded_fragment_roots : Proc(IRawElementProviderFragment*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    set_focus : Proc(IRawElementProviderFragment*, Win32cr::Foundation::HRESULT),
    get_FragmentRoot : Proc(IRawElementProviderFragment*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRawElementProviderFragment, lpVtbl : IRawElementProviderFragmentVtbl* do
    GUID = LibC::GUID.new(0xf7063da8_u32, 0x8359_u16, 0x439c_u16, StaticArray[0x92_u8, 0x97_u8, 0xbb_u8, 0xc5_u8, 0x29_u8, 0x9a_u8, 0x7d_u8, 0x87_u8])
    def query_interface(this : IRawElementProviderFragment*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRawElementProviderFragment*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRawElementProviderFragment*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def navigate(this : IRawElementProviderFragment*, direction : Win32cr::UI::Accessibility::NavigateDirection, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.navigate.call(this, direction, pRetVal)
    end
    def get_runtime_id(this : IRawElementProviderFragment*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_id.call(this, pRetVal)
    end
    def get_BoundingRectangle(this : IRawElementProviderFragment*, pRetVal : Win32cr::UI::Accessibility::UiaRect*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BoundingRectangle.call(this, pRetVal)
    end
    def get_embedded_fragment_roots(this : IRawElementProviderFragment*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_embedded_fragment_roots.call(this, pRetVal)
    end
    def set_focus(this : IRawElementProviderFragment*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_focus.call(this)
    end
    def get_FragmentRoot(this : IRawElementProviderFragment*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FragmentRoot.call(this, pRetVal)
    end

  end

  @[Extern]
  record IRawElementProviderAdviseEventsVtbl,
    query_interface : Proc(IRawElementProviderAdviseEvents*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRawElementProviderAdviseEvents*, UInt32),
    release : Proc(IRawElementProviderAdviseEvents*, UInt32),
    advise_event_added : Proc(IRawElementProviderAdviseEvents*, Int32, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    advise_event_removed : Proc(IRawElementProviderAdviseEvents*, Int32, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRawElementProviderAdviseEvents, lpVtbl : IRawElementProviderAdviseEventsVtbl* do
    GUID = LibC::GUID.new(0xa407b27b_u32, 0xf6d_u16, 0x4427_u16, StaticArray[0x92_u8, 0x92_u8, 0x47_u8, 0x3c_u8, 0x7b_u8, 0xf9_u8, 0x32_u8, 0x58_u8])
    def query_interface(this : IRawElementProviderAdviseEvents*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRawElementProviderAdviseEvents*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRawElementProviderAdviseEvents*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def advise_event_added(this : IRawElementProviderAdviseEvents*, eventId : Int32, propertyIDs : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_event_added.call(this, eventId, propertyIDs)
    end
    def advise_event_removed(this : IRawElementProviderAdviseEvents*, eventId : Int32, propertyIDs : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.advise_event_removed.call(this, eventId, propertyIDs)
    end

  end

  @[Extern]
  record IRawElementProviderHwndOverrideVtbl,
    query_interface : Proc(IRawElementProviderHwndOverride*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRawElementProviderHwndOverride*, UInt32),
    release : Proc(IRawElementProviderHwndOverride*, UInt32),
    get_override_provider_for_hwnd : Proc(IRawElementProviderHwndOverride*, Win32cr::Foundation::HWND, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRawElementProviderHwndOverride, lpVtbl : IRawElementProviderHwndOverrideVtbl* do
    GUID = LibC::GUID.new(0x1d5df27c_u32, 0x8947_u16, 0x4425_u16, StaticArray[0xb8_u8, 0xd9_u8, 0x79_u8, 0x78_u8, 0x7b_u8, 0xb4_u8, 0x60_u8, 0xb8_u8])
    def query_interface(this : IRawElementProviderHwndOverride*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRawElementProviderHwndOverride*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRawElementProviderHwndOverride*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_override_provider_for_hwnd(this : IRawElementProviderHwndOverride*, hwnd : Win32cr::Foundation::HWND, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_override_provider_for_hwnd.call(this, hwnd, pRetVal)
    end

  end

  @[Extern]
  record IProxyProviderWinEventSinkVtbl,
    query_interface : Proc(IProxyProviderWinEventSink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProxyProviderWinEventSink*, UInt32),
    release : Proc(IProxyProviderWinEventSink*, UInt32),
    add_automation_property_changed_event : Proc(IProxyProviderWinEventSink*, Void*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT),
    add_automation_event : Proc(IProxyProviderWinEventSink*, Void*, Int32, Win32cr::Foundation::HRESULT),
    add_structure_changed_event : Proc(IProxyProviderWinEventSink*, Void*, Win32cr::UI::Accessibility::StructureChangeType, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IProxyProviderWinEventSink, lpVtbl : IProxyProviderWinEventSinkVtbl* do
    GUID = LibC::GUID.new(0x4fd82b78_u32, 0xa43e_u16, 0x46ac_u16, StaticArray[0x98_u8, 0x3_u8, 0xa_u8, 0x69_u8, 0x69_u8, 0xc7_u8, 0xc1_u8, 0x83_u8])
    def query_interface(this : IProxyProviderWinEventSink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProxyProviderWinEventSink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProxyProviderWinEventSink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_automation_property_changed_event(this : IProxyProviderWinEventSink*, pProvider : Void*, id : Int32, newValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_automation_property_changed_event.call(this, pProvider, id, newValue)
    end
    def add_automation_event(this : IProxyProviderWinEventSink*, pProvider : Void*, id : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_automation_event.call(this, pProvider, id)
    end
    def add_structure_changed_event(this : IProxyProviderWinEventSink*, pProvider : Void*, structureChangeType : Win32cr::UI::Accessibility::StructureChangeType, runtimeId : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_structure_changed_event.call(this, pProvider, structureChangeType, runtimeId)
    end

  end

  @[Extern]
  record IProxyProviderWinEventHandlerVtbl,
    query_interface : Proc(IProxyProviderWinEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IProxyProviderWinEventHandler*, UInt32),
    release : Proc(IProxyProviderWinEventHandler*, UInt32),
    respond_to_win_event : Proc(IProxyProviderWinEventHandler*, UInt32, Win32cr::Foundation::HWND, Int32, Int32, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IProxyProviderWinEventHandler, lpVtbl : IProxyProviderWinEventHandlerVtbl* do
    GUID = LibC::GUID.new(0x89592ad4_u32, 0xf4e0_u16, 0x43d5_u16, StaticArray[0xa3_u8, 0xb6_u8, 0xba_u8, 0xd7_u8, 0xe1_u8, 0x11_u8, 0xb4_u8, 0x35_u8])
    def query_interface(this : IProxyProviderWinEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IProxyProviderWinEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IProxyProviderWinEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def respond_to_win_event(this : IProxyProviderWinEventHandler*, idWinEvent : UInt32, hwnd : Win32cr::Foundation::HWND, idObject : Int32, idChild : Int32, pSink : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.respond_to_win_event.call(this, idWinEvent, hwnd, idObject, idChild, pSink)
    end

  end

  @[Extern]
  record IRawElementProviderWindowlessSiteVtbl,
    query_interface : Proc(IRawElementProviderWindowlessSite*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRawElementProviderWindowlessSite*, UInt32),
    release : Proc(IRawElementProviderWindowlessSite*, UInt32),
    get_adjacent_fragment : Proc(IRawElementProviderWindowlessSite*, Win32cr::UI::Accessibility::NavigateDirection, Void**, Win32cr::Foundation::HRESULT),
    get_runtime_id_prefix : Proc(IRawElementProviderWindowlessSite*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRawElementProviderWindowlessSite, lpVtbl : IRawElementProviderWindowlessSiteVtbl* do
    GUID = LibC::GUID.new(0xa2a93cc_u32, 0xbfad_u16, 0x42ac_u16, StaticArray[0x9b_u8, 0x2e_u8, 0x9_u8, 0x91_u8, 0xfb_u8, 0xd_u8, 0x3e_u8, 0xa0_u8])
    def query_interface(this : IRawElementProviderWindowlessSite*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRawElementProviderWindowlessSite*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRawElementProviderWindowlessSite*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_adjacent_fragment(this : IRawElementProviderWindowlessSite*, direction : Win32cr::UI::Accessibility::NavigateDirection, ppParent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_adjacent_fragment.call(this, direction, ppParent)
    end
    def get_runtime_id_prefix(this : IRawElementProviderWindowlessSite*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_id_prefix.call(this, pRetVal)
    end

  end

  @[Extern]
  record IAccessibleHostingElementProvidersVtbl,
    query_interface : Proc(IAccessibleHostingElementProviders*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAccessibleHostingElementProviders*, UInt32),
    release : Proc(IAccessibleHostingElementProviders*, UInt32),
    get_embedded_fragment_roots : Proc(IAccessibleHostingElementProviders*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_object_id_for_provider : Proc(IAccessibleHostingElementProviders*, Void*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAccessibleHostingElementProviders, lpVtbl : IAccessibleHostingElementProvidersVtbl* do
    GUID = LibC::GUID.new(0x33ac331b_u32, 0x943e_u16, 0x4020_u16, StaticArray[0xb2_u8, 0x95_u8, 0xdb_u8, 0x37_u8, 0x78_u8, 0x49_u8, 0x74_u8, 0xa3_u8])
    def query_interface(this : IAccessibleHostingElementProviders*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAccessibleHostingElementProviders*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAccessibleHostingElementProviders*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_embedded_fragment_roots(this : IAccessibleHostingElementProviders*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_embedded_fragment_roots.call(this, pRetVal)
    end
    def get_object_id_for_provider(this : IAccessibleHostingElementProviders*, pProvider : Void*, pidObject : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_object_id_for_provider.call(this, pProvider, pidObject)
    end

  end

  @[Extern]
  record IRawElementProviderHostingAccessiblesVtbl,
    query_interface : Proc(IRawElementProviderHostingAccessibles*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRawElementProviderHostingAccessibles*, UInt32),
    release : Proc(IRawElementProviderHostingAccessibles*, UInt32),
    get_embedded_accessibles : Proc(IRawElementProviderHostingAccessibles*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRawElementProviderHostingAccessibles, lpVtbl : IRawElementProviderHostingAccessiblesVtbl* do
    GUID = LibC::GUID.new(0x24be0b07_u32, 0xd37d_u16, 0x487a_u16, StaticArray[0x98_u8, 0xcf_u8, 0xa1_u8, 0x3e_u8, 0xd4_u8, 0x65_u8, 0xe9_u8, 0xb3_u8])
    def query_interface(this : IRawElementProviderHostingAccessibles*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRawElementProviderHostingAccessibles*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRawElementProviderHostingAccessibles*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_embedded_accessibles(this : IRawElementProviderHostingAccessibles*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_embedded_accessibles.call(this, pRetVal)
    end

  end

  @[Extern]
  record IDockProviderVtbl,
    query_interface : Proc(IDockProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDockProvider*, UInt32),
    release : Proc(IDockProvider*, UInt32),
    set_dock_position : Proc(IDockProvider*, Win32cr::UI::Accessibility::DockPosition, Win32cr::Foundation::HRESULT),
    get_DockPosition : Proc(IDockProvider*, Win32cr::UI::Accessibility::DockPosition*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDockProvider, lpVtbl : IDockProviderVtbl* do
    GUID = LibC::GUID.new(0x159bc72c_u32, 0x4ad3_u16, 0x485e_u16, StaticArray[0x96_u8, 0x37_u8, 0xd7_u8, 0x5_u8, 0x2e_u8, 0xdf_u8, 0x1_u8, 0x46_u8])
    def query_interface(this : IDockProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDockProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDockProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_dock_position(this : IDockProvider*, dockPosition : Win32cr::UI::Accessibility::DockPosition) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dock_position.call(this, dockPosition)
    end
    def get_DockPosition(this : IDockProvider*, pRetVal : Win32cr::UI::Accessibility::DockPosition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DockPosition.call(this, pRetVal)
    end

  end

  @[Extern]
  record IExpandCollapseProviderVtbl,
    query_interface : Proc(IExpandCollapseProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IExpandCollapseProvider*, UInt32),
    release : Proc(IExpandCollapseProvider*, UInt32),
    expand : Proc(IExpandCollapseProvider*, Win32cr::Foundation::HRESULT),
    collapse : Proc(IExpandCollapseProvider*, Win32cr::Foundation::HRESULT),
    get_ExpandCollapseState : Proc(IExpandCollapseProvider*, Win32cr::UI::Accessibility::ExpandCollapseState*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IExpandCollapseProvider, lpVtbl : IExpandCollapseProviderVtbl* do
    GUID = LibC::GUID.new(0xd847d3a5_u32, 0xcab0_u16, 0x4a98_u16, StaticArray[0x8c_u8, 0x32_u8, 0xec_u8, 0xb4_u8, 0x5c_u8, 0x59_u8, 0xad_u8, 0x24_u8])
    def query_interface(this : IExpandCollapseProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IExpandCollapseProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IExpandCollapseProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def expand(this : IExpandCollapseProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand.call(this)
    end
    def collapse(this : IExpandCollapseProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collapse.call(this)
    end
    def get_ExpandCollapseState(this : IExpandCollapseProvider*, pRetVal : Win32cr::UI::Accessibility::ExpandCollapseState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExpandCollapseState.call(this, pRetVal)
    end

  end

  @[Extern]
  record IGridProviderVtbl,
    query_interface : Proc(IGridProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGridProvider*, UInt32),
    release : Proc(IGridProvider*, UInt32),
    get_item : Proc(IGridProvider*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_RowCount : Proc(IGridProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_ColumnCount : Proc(IGridProvider*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGridProvider, lpVtbl : IGridProviderVtbl* do
    GUID = LibC::GUID.new(0xb17d6187_u32, 0x907_u16, 0x464b_u16, StaticArray[0xa1_u8, 0x68_u8, 0xe_u8, 0xf1_u8, 0x7a_u8, 0x15_u8, 0x72_u8, 0xb1_u8])
    def query_interface(this : IGridProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGridProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGridProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_item(this : IGridProvider*, row : Int32, column : Int32, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item.call(this, row, column, pRetVal)
    end
    def get_RowCount(this : IGridProvider*, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RowCount.call(this, pRetVal)
    end
    def get_ColumnCount(this : IGridProvider*, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ColumnCount.call(this, pRetVal)
    end

  end

  @[Extern]
  record IGridItemProviderVtbl,
    query_interface : Proc(IGridItemProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IGridItemProvider*, UInt32),
    release : Proc(IGridItemProvider*, UInt32),
    get_Row : Proc(IGridItemProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_Column : Proc(IGridItemProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_RowSpan : Proc(IGridItemProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_ColumnSpan : Proc(IGridItemProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_ContainingGrid : Proc(IGridItemProvider*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IGridItemProvider, lpVtbl : IGridItemProviderVtbl* do
    GUID = LibC::GUID.new(0xd02541f1_u32, 0xfb81_u16, 0x4d64_u16, StaticArray[0xae_u8, 0x32_u8, 0xf5_u8, 0x20_u8, 0xf8_u8, 0xa6_u8, 0xdb_u8, 0xd1_u8])
    def query_interface(this : IGridItemProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IGridItemProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IGridItemProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Row(this : IGridItemProvider*, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Row.call(this, pRetVal)
    end
    def get_Column(this : IGridItemProvider*, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Column.call(this, pRetVal)
    end
    def get_RowSpan(this : IGridItemProvider*, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RowSpan.call(this, pRetVal)
    end
    def get_ColumnSpan(this : IGridItemProvider*, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ColumnSpan.call(this, pRetVal)
    end
    def get_ContainingGrid(this : IGridItemProvider*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContainingGrid.call(this, pRetVal)
    end

  end

  @[Extern]
  record IInvokeProviderVtbl,
    query_interface : Proc(IInvokeProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IInvokeProvider*, UInt32),
    release : Proc(IInvokeProvider*, UInt32),
    invoke : Proc(IInvokeProvider*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IInvokeProvider, lpVtbl : IInvokeProviderVtbl* do
    GUID = LibC::GUID.new(0x54fcb24b_u32, 0xe18e_u16, 0x47a2_u16, StaticArray[0xb4_u8, 0xd3_u8, 0xec_u8, 0xcb_u8, 0xe7_u8, 0x75_u8, 0x99_u8, 0xa2_u8])
    def query_interface(this : IInvokeProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IInvokeProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IInvokeProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def invoke(this : IInvokeProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this)
    end

  end

  @[Extern]
  record IMultipleViewProviderVtbl,
    query_interface : Proc(IMultipleViewProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IMultipleViewProvider*, UInt32),
    release : Proc(IMultipleViewProvider*, UInt32),
    get_view_name : Proc(IMultipleViewProvider*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_current_view : Proc(IMultipleViewProvider*, Int32, Win32cr::Foundation::HRESULT),
    get_CurrentView : Proc(IMultipleViewProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_supported_views : Proc(IMultipleViewProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IMultipleViewProvider, lpVtbl : IMultipleViewProviderVtbl* do
    GUID = LibC::GUID.new(0x6278cab1_u32, 0xb556_u16, 0x4a1a_u16, StaticArray[0xb4_u8, 0xe0_u8, 0x41_u8, 0x8a_u8, 0xcc_u8, 0x52_u8, 0x32_u8, 0x1_u8])
    def query_interface(this : IMultipleViewProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IMultipleViewProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IMultipleViewProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_view_name(this : IMultipleViewProvider*, viewId : Int32, pRetVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_view_name.call(this, viewId, pRetVal)
    end
    def set_current_view(this : IMultipleViewProvider*, viewId : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_current_view.call(this, viewId)
    end
    def get_CurrentView(this : IMultipleViewProvider*, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentView.call(this, pRetVal)
    end
    def get_supported_views(this : IMultipleViewProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_supported_views.call(this, pRetVal)
    end

  end

  @[Extern]
  record IRangeValueProviderVtbl,
    query_interface : Proc(IRangeValueProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IRangeValueProvider*, UInt32),
    release : Proc(IRangeValueProvider*, UInt32),
    set_value : Proc(IRangeValueProvider*, Float64, Win32cr::Foundation::HRESULT),
    get_Value : Proc(IRangeValueProvider*, Float64*, Win32cr::Foundation::HRESULT),
    get_IsReadOnly : Proc(IRangeValueProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_Maximum : Proc(IRangeValueProvider*, Float64*, Win32cr::Foundation::HRESULT),
    get_Minimum : Proc(IRangeValueProvider*, Float64*, Win32cr::Foundation::HRESULT),
    get_LargeChange : Proc(IRangeValueProvider*, Float64*, Win32cr::Foundation::HRESULT),
    get_SmallChange : Proc(IRangeValueProvider*, Float64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IRangeValueProvider, lpVtbl : IRangeValueProviderVtbl* do
    GUID = LibC::GUID.new(0x36dc7aef_u32, 0x33e6_u16, 0x4691_u16, StaticArray[0xaf_u8, 0xe1_u8, 0x2b_u8, 0xe7_u8, 0x27_u8, 0x4b_u8, 0x3d_u8, 0x33_u8])
    def query_interface(this : IRangeValueProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IRangeValueProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IRangeValueProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_value(this : IRangeValueProvider*, val : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, val)
    end
    def get_Value(this : IRangeValueProvider*, pRetVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, pRetVal)
    end
    def get_IsReadOnly(this : IRangeValueProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsReadOnly.call(this, pRetVal)
    end
    def get_Maximum(this : IRangeValueProvider*, pRetVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Maximum.call(this, pRetVal)
    end
    def get_Minimum(this : IRangeValueProvider*, pRetVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Minimum.call(this, pRetVal)
    end
    def get_LargeChange(this : IRangeValueProvider*, pRetVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LargeChange.call(this, pRetVal)
    end
    def get_SmallChange(this : IRangeValueProvider*, pRetVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SmallChange.call(this, pRetVal)
    end

  end

  @[Extern]
  record IScrollItemProviderVtbl,
    query_interface : Proc(IScrollItemProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IScrollItemProvider*, UInt32),
    release : Proc(IScrollItemProvider*, UInt32),
    scroll_into_view : Proc(IScrollItemProvider*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IScrollItemProvider, lpVtbl : IScrollItemProviderVtbl* do
    GUID = LibC::GUID.new(0x2360c714_u32, 0x4bf1_u16, 0x4b26_u16, StaticArray[0xba_u8, 0x65_u8, 0x9b_u8, 0x21_u8, 0x31_u8, 0x61_u8, 0x27_u8, 0xeb_u8])
    def query_interface(this : IScrollItemProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IScrollItemProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IScrollItemProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def scroll_into_view(this : IScrollItemProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll_into_view.call(this)
    end

  end

  @[Extern]
  record ISelectionProviderVtbl,
    query_interface : Proc(ISelectionProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISelectionProvider*, UInt32),
    release : Proc(ISelectionProvider*, UInt32),
    get_selection : Proc(ISelectionProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CanSelectMultiple : Proc(ISelectionProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_IsSelectionRequired : Proc(ISelectionProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISelectionProvider, lpVtbl : ISelectionProviderVtbl* do
    GUID = LibC::GUID.new(0xfb8b03af_u32, 0x3bdf_u16, 0x48d4_u16, StaticArray[0xbd_u8, 0x36_u8, 0x1a_u8, 0x65_u8, 0x79_u8, 0x3b_u8, 0xe1_u8, 0x68_u8])
    def query_interface(this : ISelectionProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISelectionProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISelectionProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_selection(this : ISelectionProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, pRetVal)
    end
    def get_CanSelectMultiple(this : ISelectionProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanSelectMultiple.call(this, pRetVal)
    end
    def get_IsSelectionRequired(this : ISelectionProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsSelectionRequired.call(this, pRetVal)
    end

  end

  @[Extern]
  record ISelectionProvider2Vtbl,
    query_interface : Proc(ISelectionProvider2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISelectionProvider2*, UInt32),
    release : Proc(ISelectionProvider2*, UInt32),
    get_selection : Proc(ISelectionProvider2*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CanSelectMultiple : Proc(ISelectionProvider2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_IsSelectionRequired : Proc(ISelectionProvider2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_FirstSelectedItem : Proc(ISelectionProvider2*, Void**, Win32cr::Foundation::HRESULT),
    get_LastSelectedItem : Proc(ISelectionProvider2*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentSelectedItem : Proc(ISelectionProvider2*, Void**, Win32cr::Foundation::HRESULT),
    get_ItemCount : Proc(ISelectionProvider2*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISelectionProvider2, lpVtbl : ISelectionProvider2Vtbl* do
    GUID = LibC::GUID.new(0x14f68475_u32, 0xee1c_u16, 0x44f6_u16, StaticArray[0xa8_u8, 0x69_u8, 0xd2_u8, 0x39_u8, 0x38_u8, 0x1f_u8, 0xf_u8, 0xe7_u8])
    def query_interface(this : ISelectionProvider2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISelectionProvider2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISelectionProvider2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_selection(this : ISelectionProvider2*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, pRetVal)
    end
    def get_CanSelectMultiple(this : ISelectionProvider2*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanSelectMultiple.call(this, pRetVal)
    end
    def get_IsSelectionRequired(this : ISelectionProvider2*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsSelectionRequired.call(this, pRetVal)
    end
    def get_FirstSelectedItem(this : ISelectionProvider2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FirstSelectedItem.call(this, retVal)
    end
    def get_LastSelectedItem(this : ISelectionProvider2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LastSelectedItem.call(this, retVal)
    end
    def get_CurrentSelectedItem(this : ISelectionProvider2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentSelectedItem.call(this, retVal)
    end
    def get_ItemCount(this : ISelectionProvider2*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ItemCount.call(this, retVal)
    end

  end

  @[Extern]
  record IScrollProviderVtbl,
    query_interface : Proc(IScrollProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IScrollProvider*, UInt32),
    release : Proc(IScrollProvider*, UInt32),
    scroll : Proc(IScrollProvider*, Win32cr::UI::Accessibility::ScrollAmount, Win32cr::UI::Accessibility::ScrollAmount, Win32cr::Foundation::HRESULT),
    set_scroll_percent : Proc(IScrollProvider*, Float64, Float64, Win32cr::Foundation::HRESULT),
    get_HorizontalScrollPercent : Proc(IScrollProvider*, Float64*, Win32cr::Foundation::HRESULT),
    get_VerticalScrollPercent : Proc(IScrollProvider*, Float64*, Win32cr::Foundation::HRESULT),
    get_HorizontalViewSize : Proc(IScrollProvider*, Float64*, Win32cr::Foundation::HRESULT),
    get_VerticalViewSize : Proc(IScrollProvider*, Float64*, Win32cr::Foundation::HRESULT),
    get_HorizontallyScrollable : Proc(IScrollProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_VerticallyScrollable : Proc(IScrollProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IScrollProvider, lpVtbl : IScrollProviderVtbl* do
    GUID = LibC::GUID.new(0xb38b8077_u32, 0x1fc3_u16, 0x42a5_u16, StaticArray[0x8c_u8, 0xae_u8, 0xd4_u8, 0xc_u8, 0x22_u8, 0x15_u8, 0x5_u8, 0x5a_u8])
    def query_interface(this : IScrollProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IScrollProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IScrollProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def scroll(this : IScrollProvider*, horizontalAmount : Win32cr::UI::Accessibility::ScrollAmount, verticalAmount : Win32cr::UI::Accessibility::ScrollAmount) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll.call(this, horizontalAmount, verticalAmount)
    end
    def set_scroll_percent(this : IScrollProvider*, horizontalPercent : Float64, verticalPercent : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scroll_percent.call(this, horizontalPercent, verticalPercent)
    end
    def get_HorizontalScrollPercent(this : IScrollProvider*, pRetVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HorizontalScrollPercent.call(this, pRetVal)
    end
    def get_VerticalScrollPercent(this : IScrollProvider*, pRetVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VerticalScrollPercent.call(this, pRetVal)
    end
    def get_HorizontalViewSize(this : IScrollProvider*, pRetVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HorizontalViewSize.call(this, pRetVal)
    end
    def get_VerticalViewSize(this : IScrollProvider*, pRetVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VerticalViewSize.call(this, pRetVal)
    end
    def get_HorizontallyScrollable(this : IScrollProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_HorizontallyScrollable.call(this, pRetVal)
    end
    def get_VerticallyScrollable(this : IScrollProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_VerticallyScrollable.call(this, pRetVal)
    end

  end

  @[Extern]
  record ISelectionItemProviderVtbl,
    query_interface : Proc(ISelectionItemProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISelectionItemProvider*, UInt32),
    release : Proc(ISelectionItemProvider*, UInt32),
    select__ : Proc(ISelectionItemProvider*, Win32cr::Foundation::HRESULT),
    add_to_selection : Proc(ISelectionItemProvider*, Win32cr::Foundation::HRESULT),
    remove_from_selection : Proc(ISelectionItemProvider*, Win32cr::Foundation::HRESULT),
    get_IsSelected : Proc(ISelectionItemProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_SelectionContainer : Proc(ISelectionItemProvider*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISelectionItemProvider, lpVtbl : ISelectionItemProviderVtbl* do
    GUID = LibC::GUID.new(0x2acad808_u32, 0xb2d4_u16, 0x452d_u16, StaticArray[0xa4_u8, 0x7_u8, 0x91_u8, 0xff_u8, 0x1a_u8, 0xd1_u8, 0x67_u8, 0xb2_u8])
    def query_interface(this : ISelectionItemProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISelectionItemProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISelectionItemProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def select__(this : ISelectionItemProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this)
    end
    def add_to_selection(this : ISelectionItemProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_to_selection.call(this)
    end
    def remove_from_selection(this : ISelectionItemProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_from_selection.call(this)
    end
    def get_IsSelected(this : ISelectionItemProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsSelected.call(this, pRetVal)
    end
    def get_SelectionContainer(this : ISelectionItemProvider*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SelectionContainer.call(this, pRetVal)
    end

  end

  @[Extern]
  record ISynchronizedInputProviderVtbl,
    query_interface : Proc(ISynchronizedInputProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISynchronizedInputProvider*, UInt32),
    release : Proc(ISynchronizedInputProvider*, UInt32),
    start_listening : Proc(ISynchronizedInputProvider*, Win32cr::UI::Accessibility::SynchronizedInputType, Win32cr::Foundation::HRESULT),
    cancel : Proc(ISynchronizedInputProvider*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISynchronizedInputProvider, lpVtbl : ISynchronizedInputProviderVtbl* do
    GUID = LibC::GUID.new(0x29db1a06_u32, 0x2ce_u16, 0x4cf7_u16, StaticArray[0x9b_u8, 0x42_u8, 0x56_u8, 0x5d_u8, 0x4f_u8, 0xab_u8, 0x20_u8, 0xee_u8])
    def query_interface(this : ISynchronizedInputProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISynchronizedInputProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISynchronizedInputProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_listening(this : ISynchronizedInputProvider*, inputType : Win32cr::UI::Accessibility::SynchronizedInputType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_listening.call(this, inputType)
    end
    def cancel(this : ISynchronizedInputProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end

  end

  @[Extern]
  record ITableProviderVtbl,
    query_interface : Proc(ITableProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITableProvider*, UInt32),
    release : Proc(ITableProvider*, UInt32),
    get_row_headers : Proc(ITableProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_column_headers : Proc(ITableProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_RowOrColumnMajor : Proc(ITableProvider*, Win32cr::UI::Accessibility::RowOrColumnMajor*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITableProvider, lpVtbl : ITableProviderVtbl* do
    GUID = LibC::GUID.new(0x9c860395_u32, 0x97b3_u16, 0x490a_u16, StaticArray[0xb5_u8, 0x2a_u8, 0x85_u8, 0x8c_u8, 0xc2_u8, 0x2a_u8, 0xf1_u8, 0x66_u8])
    def query_interface(this : ITableProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITableProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITableProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_row_headers(this : ITableProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_row_headers.call(this, pRetVal)
    end
    def get_column_headers(this : ITableProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_headers.call(this, pRetVal)
    end
    def get_RowOrColumnMajor(this : ITableProvider*, pRetVal : Win32cr::UI::Accessibility::RowOrColumnMajor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RowOrColumnMajor.call(this, pRetVal)
    end

  end

  @[Extern]
  record ITableItemProviderVtbl,
    query_interface : Proc(ITableItemProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITableItemProvider*, UInt32),
    release : Proc(ITableItemProvider*, UInt32),
    get_row_header_items : Proc(ITableItemProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_column_header_items : Proc(ITableItemProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITableItemProvider, lpVtbl : ITableItemProviderVtbl* do
    GUID = LibC::GUID.new(0xb9734fa6_u32, 0x771f_u16, 0x4d78_u16, StaticArray[0x9c_u8, 0x90_u8, 0x25_u8, 0x17_u8, 0x99_u8, 0x93_u8, 0x49_u8, 0xcd_u8])
    def query_interface(this : ITableItemProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITableItemProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITableItemProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_row_header_items(this : ITableItemProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_row_header_items.call(this, pRetVal)
    end
    def get_column_header_items(this : ITableItemProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_column_header_items.call(this, pRetVal)
    end

  end

  @[Extern]
  record IToggleProviderVtbl,
    query_interface : Proc(IToggleProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IToggleProvider*, UInt32),
    release : Proc(IToggleProvider*, UInt32),
    toggle : Proc(IToggleProvider*, Win32cr::Foundation::HRESULT),
    get_ToggleState : Proc(IToggleProvider*, Win32cr::UI::Accessibility::ToggleState*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IToggleProvider, lpVtbl : IToggleProviderVtbl* do
    GUID = LibC::GUID.new(0x56d00bd0_u32, 0xc4f4_u16, 0x433c_u16, StaticArray[0xa8_u8, 0x36_u8, 0x1a_u8, 0x52_u8, 0xa5_u8, 0x7e_u8, 0x8_u8, 0x92_u8])
    def query_interface(this : IToggleProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IToggleProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IToggleProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def toggle(this : IToggleProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.toggle.call(this)
    end
    def get_ToggleState(this : IToggleProvider*, pRetVal : Win32cr::UI::Accessibility::ToggleState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ToggleState.call(this, pRetVal)
    end

  end

  @[Extern]
  record ITransformProviderVtbl,
    query_interface : Proc(ITransformProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransformProvider*, UInt32),
    release : Proc(ITransformProvider*, UInt32),
    move : Proc(ITransformProvider*, Float64, Float64, Win32cr::Foundation::HRESULT),
    resize : Proc(ITransformProvider*, Float64, Float64, Win32cr::Foundation::HRESULT),
    rotate : Proc(ITransformProvider*, Float64, Win32cr::Foundation::HRESULT),
    get_CanMove : Proc(ITransformProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CanResize : Proc(ITransformProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CanRotate : Proc(ITransformProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITransformProvider, lpVtbl : ITransformProviderVtbl* do
    GUID = LibC::GUID.new(0x6829ddc4_u32, 0x4f91_u16, 0x4ffa_u16, StaticArray[0xb8_u8, 0x6f_u8, 0xbd_u8, 0x3e_u8, 0x29_u8, 0x87_u8, 0xcb_u8, 0x4c_u8])
    def query_interface(this : ITransformProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransformProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransformProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def move(this : ITransformProvider*, x : Float64, y : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, x, y)
    end
    def resize(this : ITransformProvider*, width : Float64, height : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize.call(this, width, height)
    end
    def rotate(this : ITransformProvider*, degrees : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rotate.call(this, degrees)
    end
    def get_CanMove(this : ITransformProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanMove.call(this, pRetVal)
    end
    def get_CanResize(this : ITransformProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanResize.call(this, pRetVal)
    end
    def get_CanRotate(this : ITransformProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRotate.call(this, pRetVal)
    end

  end

  @[Extern]
  record IValueProviderVtbl,
    query_interface : Proc(IValueProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IValueProvider*, UInt32),
    release : Proc(IValueProvider*, UInt32),
    set_value : Proc(IValueProvider*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_Value : Proc(IValueProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_IsReadOnly : Proc(IValueProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IValueProvider, lpVtbl : IValueProviderVtbl* do
    GUID = LibC::GUID.new(0xc7935180_u32, 0x6fb3_u16, 0x4201_u16, StaticArray[0xb1_u8, 0x74_u8, 0x7d_u8, 0xf7_u8, 0x3a_u8, 0xdb_u8, 0xf6_u8, 0x4a_u8])
    def query_interface(this : IValueProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IValueProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IValueProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_value(this : IValueProvider*, val : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, val)
    end
    def get_Value(this : IValueProvider*, pRetVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, pRetVal)
    end
    def get_IsReadOnly(this : IValueProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsReadOnly.call(this, pRetVal)
    end

  end

  @[Extern]
  record IWindowProviderVtbl,
    query_interface : Proc(IWindowProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IWindowProvider*, UInt32),
    release : Proc(IWindowProvider*, UInt32),
    set_visual_state : Proc(IWindowProvider*, Win32cr::UI::Accessibility::WindowVisualState, Win32cr::Foundation::HRESULT),
    close : Proc(IWindowProvider*, Win32cr::Foundation::HRESULT),
    wait_for_input_idle : Proc(IWindowProvider*, Int32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CanMaximize : Proc(IWindowProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CanMinimize : Proc(IWindowProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_IsModal : Proc(IWindowProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_WindowVisualState : Proc(IWindowProvider*, Win32cr::UI::Accessibility::WindowVisualState*, Win32cr::Foundation::HRESULT),
    get_WindowInteractionState : Proc(IWindowProvider*, Win32cr::UI::Accessibility::WindowInteractionState*, Win32cr::Foundation::HRESULT),
    get_IsTopmost : Proc(IWindowProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IWindowProvider, lpVtbl : IWindowProviderVtbl* do
    GUID = LibC::GUID.new(0x987df77b_u32, 0xdb06_u16, 0x4d77_u16, StaticArray[0x8f_u8, 0x8a_u8, 0x86_u8, 0xa9_u8, 0xc3_u8, 0xbb_u8, 0x90_u8, 0xb9_u8])
    def query_interface(this : IWindowProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IWindowProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IWindowProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_visual_state(this : IWindowProvider*, state : Win32cr::UI::Accessibility::WindowVisualState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_visual_state.call(this, state)
    end
    def close(this : IWindowProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def wait_for_input_idle(this : IWindowProvider*, milliseconds : Int32, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_input_idle.call(this, milliseconds, pRetVal)
    end
    def get_CanMaximize(this : IWindowProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanMaximize.call(this, pRetVal)
    end
    def get_CanMinimize(this : IWindowProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanMinimize.call(this, pRetVal)
    end
    def get_IsModal(this : IWindowProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsModal.call(this, pRetVal)
    end
    def get_WindowVisualState(this : IWindowProvider*, pRetVal : Win32cr::UI::Accessibility::WindowVisualState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WindowVisualState.call(this, pRetVal)
    end
    def get_WindowInteractionState(this : IWindowProvider*, pRetVal : Win32cr::UI::Accessibility::WindowInteractionState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_WindowInteractionState.call(this, pRetVal)
    end
    def get_IsTopmost(this : IWindowProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsTopmost.call(this, pRetVal)
    end

  end

  @[Extern]
  record ILegacyIAccessibleProviderVtbl,
    query_interface : Proc(ILegacyIAccessibleProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ILegacyIAccessibleProvider*, UInt32),
    release : Proc(ILegacyIAccessibleProvider*, UInt32),
    select__ : Proc(ILegacyIAccessibleProvider*, Int32, Win32cr::Foundation::HRESULT),
    do_default_action : Proc(ILegacyIAccessibleProvider*, Win32cr::Foundation::HRESULT),
    set_value : Proc(ILegacyIAccessibleProvider*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_i_accessible : Proc(ILegacyIAccessibleProvider*, Void**, Win32cr::Foundation::HRESULT),
    get_ChildId : Proc(ILegacyIAccessibleProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(ILegacyIAccessibleProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Value : Proc(ILegacyIAccessibleProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Description : Proc(ILegacyIAccessibleProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Role : Proc(ILegacyIAccessibleProvider*, UInt32*, Win32cr::Foundation::HRESULT),
    get_State : Proc(ILegacyIAccessibleProvider*, UInt32*, Win32cr::Foundation::HRESULT),
    get_Help : Proc(ILegacyIAccessibleProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_KeyboardShortcut : Proc(ILegacyIAccessibleProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_selection : Proc(ILegacyIAccessibleProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_DefaultAction : Proc(ILegacyIAccessibleProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ILegacyIAccessibleProvider, lpVtbl : ILegacyIAccessibleProviderVtbl* do
    GUID = LibC::GUID.new(0xe44c3566_u32, 0x915d_u16, 0x4070_u16, StaticArray[0x99_u8, 0xc6_u8, 0x4_u8, 0x7b_u8, 0xff_u8, 0x5a_u8, 0x8_u8, 0xf5_u8])
    def query_interface(this : ILegacyIAccessibleProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ILegacyIAccessibleProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ILegacyIAccessibleProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def select__(this : ILegacyIAccessibleProvider*, flagsSelect : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this, flagsSelect)
    end
    def do_default_action(this : ILegacyIAccessibleProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_default_action.call(this)
    end
    def set_value(this : ILegacyIAccessibleProvider*, szValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, szValue)
    end
    def get_i_accessible(this : ILegacyIAccessibleProvider*, ppAccessible : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_accessible.call(this, ppAccessible)
    end
    def get_ChildId(this : ILegacyIAccessibleProvider*, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ChildId.call(this, pRetVal)
    end
    def get_Name(this : ILegacyIAccessibleProvider*, pszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, pszName)
    end
    def get_Value(this : ILegacyIAccessibleProvider*, pszValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Value.call(this, pszValue)
    end
    def get_Description(this : ILegacyIAccessibleProvider*, pszDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Description.call(this, pszDescription)
    end
    def get_Role(this : ILegacyIAccessibleProvider*, pdwRole : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Role.call(this, pdwRole)
    end
    def get_State(this : ILegacyIAccessibleProvider*, pdwState : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_State.call(this, pdwState)
    end
    def get_Help(this : ILegacyIAccessibleProvider*, pszHelp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Help.call(this, pszHelp)
    end
    def get_KeyboardShortcut(this : ILegacyIAccessibleProvider*, pszKeyboardShortcut : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_KeyboardShortcut.call(this, pszKeyboardShortcut)
    end
    def get_selection(this : ILegacyIAccessibleProvider*, pvarSelectedChildren : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, pvarSelectedChildren)
    end
    def get_DefaultAction(this : ILegacyIAccessibleProvider*, pszDefaultAction : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DefaultAction.call(this, pszDefaultAction)
    end

  end

  @[Extern]
  record IItemContainerProviderVtbl,
    query_interface : Proc(IItemContainerProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IItemContainerProvider*, UInt32),
    release : Proc(IItemContainerProvider*, UInt32),
    find_item_by_property : Proc(IItemContainerProvider*, Void*, Int32, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IItemContainerProvider, lpVtbl : IItemContainerProviderVtbl* do
    GUID = LibC::GUID.new(0xe747770b_u32, 0x39ce_u16, 0x4382_u16, StaticArray[0xab_u8, 0x30_u8, 0xd8_u8, 0xfb_u8, 0x3f_u8, 0x33_u8, 0x6f_u8, 0x24_u8])
    def query_interface(this : IItemContainerProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IItemContainerProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IItemContainerProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def find_item_by_property(this : IItemContainerProvider*, pStartAfter : Void*, propertyId : Int32, value : Win32cr::System::Com::VARIANT, pFound : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_item_by_property.call(this, pStartAfter, propertyId, value, pFound)
    end

  end

  @[Extern]
  record IVirtualizedItemProviderVtbl,
    query_interface : Proc(IVirtualizedItemProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IVirtualizedItemProvider*, UInt32),
    release : Proc(IVirtualizedItemProvider*, UInt32),
    realize : Proc(IVirtualizedItemProvider*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IVirtualizedItemProvider, lpVtbl : IVirtualizedItemProviderVtbl* do
    GUID = LibC::GUID.new(0xcb98b665_u32, 0x2d35_u16, 0x4fac_u16, StaticArray[0xad_u8, 0x35_u8, 0xf3_u8, 0xc6_u8, 0xd_u8, 0xc_u8, 0xb_u8, 0x8b_u8])
    def query_interface(this : IVirtualizedItemProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IVirtualizedItemProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IVirtualizedItemProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def realize(this : IVirtualizedItemProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.realize.call(this)
    end

  end

  @[Extern]
  record IObjectModelProviderVtbl,
    query_interface : Proc(IObjectModelProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IObjectModelProvider*, UInt32),
    release : Proc(IObjectModelProvider*, UInt32),
    get_underlying_object_model : Proc(IObjectModelProvider*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IObjectModelProvider, lpVtbl : IObjectModelProviderVtbl* do
    GUID = LibC::GUID.new(0x3ad86ebd_u32, 0xf5ef_u16, 0x483d_u16, StaticArray[0xbb_u8, 0x18_u8, 0xb1_u8, 0x4_u8, 0x2a_u8, 0x47_u8, 0x5d_u8, 0x64_u8])
    def query_interface(this : IObjectModelProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IObjectModelProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IObjectModelProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_underlying_object_model(this : IObjectModelProvider*, ppUnknown : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_underlying_object_model.call(this, ppUnknown)
    end

  end

  @[Extern]
  record IAnnotationProviderVtbl,
    query_interface : Proc(IAnnotationProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IAnnotationProvider*, UInt32),
    release : Proc(IAnnotationProvider*, UInt32),
    get_AnnotationTypeId : Proc(IAnnotationProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_AnnotationTypeName : Proc(IAnnotationProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Author : Proc(IAnnotationProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DateTime : Proc(IAnnotationProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Target : Proc(IAnnotationProvider*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IAnnotationProvider, lpVtbl : IAnnotationProviderVtbl* do
    GUID = LibC::GUID.new(0xf95c7e80_u32, 0xbd63_u16, 0x4601_u16, StaticArray[0x97_u8, 0x82_u8, 0x44_u8, 0x5e_u8, 0xbf_u8, 0xf0_u8, 0x11_u8, 0xfc_u8])
    def query_interface(this : IAnnotationProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IAnnotationProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IAnnotationProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_AnnotationTypeId(this : IAnnotationProvider*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AnnotationTypeId.call(this, retVal)
    end
    def get_AnnotationTypeName(this : IAnnotationProvider*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AnnotationTypeName.call(this, retVal)
    end
    def get_Author(this : IAnnotationProvider*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Author.call(this, retVal)
    end
    def get_DateTime(this : IAnnotationProvider*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DateTime.call(this, retVal)
    end
    def get_Target(this : IAnnotationProvider*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Target.call(this, retVal)
    end

  end

  @[Extern]
  record IStylesProviderVtbl,
    query_interface : Proc(IStylesProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IStylesProvider*, UInt32),
    release : Proc(IStylesProvider*, UInt32),
    get_StyleId : Proc(IStylesProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_StyleName : Proc(IStylesProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_FillColor : Proc(IStylesProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_FillPatternStyle : Proc(IStylesProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_Shape : Proc(IStylesProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_FillPatternColor : Proc(IStylesProvider*, Int32*, Win32cr::Foundation::HRESULT),
    get_ExtendedProperties : Proc(IStylesProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IStylesProvider, lpVtbl : IStylesProviderVtbl* do
    GUID = LibC::GUID.new(0x19b6b649_u32, 0xf5d7_u16, 0x4a6d_u16, StaticArray[0xbd_u8, 0xcb_u8, 0x12_u8, 0x92_u8, 0x52_u8, 0xbe_u8, 0x58_u8, 0x8a_u8])
    def query_interface(this : IStylesProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IStylesProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IStylesProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_StyleId(this : IStylesProvider*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StyleId.call(this, retVal)
    end
    def get_StyleName(this : IStylesProvider*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_StyleName.call(this, retVal)
    end
    def get_FillColor(this : IStylesProvider*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FillColor.call(this, retVal)
    end
    def get_FillPatternStyle(this : IStylesProvider*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FillPatternStyle.call(this, retVal)
    end
    def get_Shape(this : IStylesProvider*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Shape.call(this, retVal)
    end
    def get_FillPatternColor(this : IStylesProvider*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FillPatternColor.call(this, retVal)
    end
    def get_ExtendedProperties(this : IStylesProvider*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ExtendedProperties.call(this, retVal)
    end

  end

  @[Extern]
  record ISpreadsheetProviderVtbl,
    query_interface : Proc(ISpreadsheetProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpreadsheetProvider*, UInt32),
    release : Proc(ISpreadsheetProvider*, UInt32),
    get_item_by_name : Proc(ISpreadsheetProvider*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpreadsheetProvider, lpVtbl : ISpreadsheetProviderVtbl* do
    GUID = LibC::GUID.new(0x6f6b5d35_u32, 0x5525_u16, 0x4f80_u16, StaticArray[0xb7_u8, 0x58_u8, 0x85_u8, 0x47_u8, 0x38_u8, 0x32_u8, 0xff_u8, 0xc7_u8])
    def query_interface(this : ISpreadsheetProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpreadsheetProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpreadsheetProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_item_by_name(this : ISpreadsheetProvider*, name : Win32cr::Foundation::PWSTR, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_by_name.call(this, name, pRetVal)
    end

  end

  @[Extern]
  record ISpreadsheetItemProviderVtbl,
    query_interface : Proc(ISpreadsheetItemProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ISpreadsheetItemProvider*, UInt32),
    release : Proc(ISpreadsheetItemProvider*, UInt32),
    get_Formula : Proc(ISpreadsheetItemProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_annotation_objects : Proc(ISpreadsheetItemProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_annotation_types : Proc(ISpreadsheetItemProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ISpreadsheetItemProvider, lpVtbl : ISpreadsheetItemProviderVtbl* do
    GUID = LibC::GUID.new(0xeaed4660_u32, 0x7b3d_u16, 0x4879_u16, StaticArray[0xa2_u8, 0xe6_u8, 0x36_u8, 0x5c_u8, 0xe6_u8, 0x3_u8, 0xf3_u8, 0xd0_u8])
    def query_interface(this : ISpreadsheetItemProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ISpreadsheetItemProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ISpreadsheetItemProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Formula(this : ISpreadsheetItemProvider*, pRetVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Formula.call(this, pRetVal)
    end
    def get_annotation_objects(this : ISpreadsheetItemProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_annotation_objects.call(this, pRetVal)
    end
    def get_annotation_types(this : ISpreadsheetItemProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_annotation_types.call(this, pRetVal)
    end

  end

  @[Extern]
  record ITransformProvider2Vtbl,
    query_interface : Proc(ITransformProvider2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITransformProvider2*, UInt32),
    release : Proc(ITransformProvider2*, UInt32),
    move : Proc(ITransformProvider2*, Float64, Float64, Win32cr::Foundation::HRESULT),
    resize : Proc(ITransformProvider2*, Float64, Float64, Win32cr::Foundation::HRESULT),
    rotate : Proc(ITransformProvider2*, Float64, Win32cr::Foundation::HRESULT),
    get_CanMove : Proc(ITransformProvider2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CanResize : Proc(ITransformProvider2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CanRotate : Proc(ITransformProvider2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    zoom : Proc(ITransformProvider2*, Float64, Win32cr::Foundation::HRESULT),
    get_CanZoom : Proc(ITransformProvider2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_ZoomLevel : Proc(ITransformProvider2*, Float64*, Win32cr::Foundation::HRESULT),
    get_ZoomMinimum : Proc(ITransformProvider2*, Float64*, Win32cr::Foundation::HRESULT),
    get_ZoomMaximum : Proc(ITransformProvider2*, Float64*, Win32cr::Foundation::HRESULT),
    zoom_by_unit : Proc(ITransformProvider2*, Win32cr::UI::Accessibility::ZoomUnit, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITransformProvider2, lpVtbl : ITransformProvider2Vtbl* do
    GUID = LibC::GUID.new(0x4758742f_u32, 0x7ac2_u16, 0x460c_u16, StaticArray[0xbc_u8, 0x48_u8, 0x9_u8, 0xfc_u8, 0x9_u8, 0x30_u8, 0x8a_u8, 0x93_u8])
    def query_interface(this : ITransformProvider2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITransformProvider2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITransformProvider2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def move(this : ITransformProvider2*, x : Float64, y : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, x, y)
    end
    def resize(this : ITransformProvider2*, width : Float64, height : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize.call(this, width, height)
    end
    def rotate(this : ITransformProvider2*, degrees : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rotate.call(this, degrees)
    end
    def get_CanMove(this : ITransformProvider2*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanMove.call(this, pRetVal)
    end
    def get_CanResize(this : ITransformProvider2*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanResize.call(this, pRetVal)
    end
    def get_CanRotate(this : ITransformProvider2*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanRotate.call(this, pRetVal)
    end
    def zoom(this : ITransformProvider2*, zoom : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.zoom.call(this, zoom)
    end
    def get_CanZoom(this : ITransformProvider2*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanZoom.call(this, pRetVal)
    end
    def get_ZoomLevel(this : ITransformProvider2*, pRetVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ZoomLevel.call(this, pRetVal)
    end
    def get_ZoomMinimum(this : ITransformProvider2*, pRetVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ZoomMinimum.call(this, pRetVal)
    end
    def get_ZoomMaximum(this : ITransformProvider2*, pRetVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ZoomMaximum.call(this, pRetVal)
    end
    def zoom_by_unit(this : ITransformProvider2*, zoomUnit : Win32cr::UI::Accessibility::ZoomUnit) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.zoom_by_unit.call(this, zoomUnit)
    end

  end

  @[Extern]
  record IDragProviderVtbl,
    query_interface : Proc(IDragProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDragProvider*, UInt32),
    release : Proc(IDragProvider*, UInt32),
    get_IsGrabbed : Proc(IDragProvider*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_DropEffect : Proc(IDragProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DropEffects : Proc(IDragProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_grabbed_items : Proc(IDragProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDragProvider, lpVtbl : IDragProviderVtbl* do
    GUID = LibC::GUID.new(0x6aa7bbbb_u32, 0x7ff9_u16, 0x497d_u16, StaticArray[0x90_u8, 0x4f_u8, 0xd2_u8, 0xb_u8, 0x89_u8, 0x79_u8, 0x29_u8, 0xd8_u8])
    def query_interface(this : IDragProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDragProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDragProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_IsGrabbed(this : IDragProvider*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsGrabbed.call(this, pRetVal)
    end
    def get_DropEffect(this : IDragProvider*, pRetVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DropEffect.call(this, pRetVal)
    end
    def get_DropEffects(this : IDragProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DropEffects.call(this, pRetVal)
    end
    def get_grabbed_items(this : IDragProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_grabbed_items.call(this, pRetVal)
    end

  end

  @[Extern]
  record IDropTargetProviderVtbl,
    query_interface : Proc(IDropTargetProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IDropTargetProvider*, UInt32),
    release : Proc(IDropTargetProvider*, UInt32),
    get_DropTargetEffect : Proc(IDropTargetProvider*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_DropTargetEffects : Proc(IDropTargetProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IDropTargetProvider, lpVtbl : IDropTargetProviderVtbl* do
    GUID = LibC::GUID.new(0xbae82bfd_u32, 0x358a_u16, 0x481c_u16, StaticArray[0x85_u8, 0xa0_u8, 0xd8_u8, 0xb4_u8, 0xd9_u8, 0xa_u8, 0x5d_u8, 0x61_u8])
    def query_interface(this : IDropTargetProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IDropTargetProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IDropTargetProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_DropTargetEffect(this : IDropTargetProvider*, pRetVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DropTargetEffect.call(this, pRetVal)
    end
    def get_DropTargetEffects(this : IDropTargetProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DropTargetEffects.call(this, pRetVal)
    end

  end

  @[Extern]
  record ITextRangeProviderVtbl,
    query_interface : Proc(ITextRangeProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextRangeProvider*, UInt32),
    release : Proc(ITextRangeProvider*, UInt32),
    clone : Proc(ITextRangeProvider*, Void**, Win32cr::Foundation::HRESULT),
    compare : Proc(ITextRangeProvider*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    compare_endpoints : Proc(ITextRangeProvider*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Void*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Int32*, Win32cr::Foundation::HRESULT),
    expand_to_enclosing_unit : Proc(ITextRangeProvider*, Win32cr::UI::Accessibility::TextUnit, Win32cr::Foundation::HRESULT),
    find_attribute : Proc(ITextRangeProvider*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    find_text : Proc(ITextRangeProvider*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    get_attribute_value : Proc(ITextRangeProvider*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_bounding_rectangles : Proc(ITextRangeProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_enclosing_element : Proc(ITextRangeProvider*, Void**, Win32cr::Foundation::HRESULT),
    get_text : Proc(ITextRangeProvider*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    move : Proc(ITextRangeProvider*, Win32cr::UI::Accessibility::TextUnit, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_endpoint_by_unit : Proc(ITextRangeProvider*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Win32cr::UI::Accessibility::TextUnit, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_endpoint_by_range : Proc(ITextRangeProvider*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Void*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Win32cr::Foundation::HRESULT),
    select__ : Proc(ITextRangeProvider*, Win32cr::Foundation::HRESULT),
    add_to_selection : Proc(ITextRangeProvider*, Win32cr::Foundation::HRESULT),
    remove_from_selection : Proc(ITextRangeProvider*, Win32cr::Foundation::HRESULT),
    scroll_into_view : Proc(ITextRangeProvider*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_children : Proc(ITextRangeProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITextRangeProvider, lpVtbl : ITextRangeProviderVtbl* do
    GUID = LibC::GUID.new(0x5347ad7b_u32, 0xc355_u16, 0x46f8_u16, StaticArray[0xaf_u8, 0xf5_u8, 0x90_u8, 0x90_u8, 0x33_u8, 0x58_u8, 0x2f_u8, 0x63_u8])
    def query_interface(this : ITextRangeProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextRangeProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextRangeProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : ITextRangeProvider*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, pRetVal)
    end
    def compare(this : ITextRangeProvider*, range : Void*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare.call(this, range, pRetVal)
    end
    def compare_endpoints(this : ITextRangeProvider*, endpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, targetRange : Void*, targetEndpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_endpoints.call(this, endpoint, targetRange, targetEndpoint, pRetVal)
    end
    def expand_to_enclosing_unit(this : ITextRangeProvider*, unit : Win32cr::UI::Accessibility::TextUnit) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand_to_enclosing_unit.call(this, unit)
    end
    def find_attribute(this : ITextRangeProvider*, attributeId : Int32, val : Win32cr::System::Com::VARIANT, backward : Win32cr::Foundation::BOOL, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_attribute.call(this, attributeId, val, backward, pRetVal)
    end
    def find_text(this : ITextRangeProvider*, text : Win32cr::Foundation::BSTR, backward : Win32cr::Foundation::BOOL, ignoreCase : Win32cr::Foundation::BOOL, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text.call(this, text, backward, ignoreCase, pRetVal)
    end
    def get_attribute_value(this : ITextRangeProvider*, attributeId : Int32, pRetVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_value.call(this, attributeId, pRetVal)
    end
    def get_bounding_rectangles(this : ITextRangeProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bounding_rectangles.call(this, pRetVal)
    end
    def get_enclosing_element(this : ITextRangeProvider*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enclosing_element.call(this, pRetVal)
    end
    def get_text(this : ITextRangeProvider*, maxLength : Int32, pRetVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, maxLength, pRetVal)
    end
    def move(this : ITextRangeProvider*, unit : Win32cr::UI::Accessibility::TextUnit, count : Int32, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, unit, count, pRetVal)
    end
    def move_endpoint_by_unit(this : ITextRangeProvider*, endpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, unit : Win32cr::UI::Accessibility::TextUnit, count : Int32, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_endpoint_by_unit.call(this, endpoint, unit, count, pRetVal)
    end
    def move_endpoint_by_range(this : ITextRangeProvider*, endpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, targetRange : Void*, targetEndpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_endpoint_by_range.call(this, endpoint, targetRange, targetEndpoint)
    end
    def select__(this : ITextRangeProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this)
    end
    def add_to_selection(this : ITextRangeProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_to_selection.call(this)
    end
    def remove_from_selection(this : ITextRangeProvider*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_from_selection.call(this)
    end
    def scroll_into_view(this : ITextRangeProvider*, alignToTop : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll_into_view.call(this, alignToTop)
    end
    def get_children(this : ITextRangeProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_children.call(this, pRetVal)
    end

  end

  @[Extern]
  record ITextProviderVtbl,
    query_interface : Proc(ITextProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextProvider*, UInt32),
    release : Proc(ITextProvider*, UInt32),
    get_selection : Proc(ITextProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_visible_ranges : Proc(ITextProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    range_from_child : Proc(ITextProvider*, Void*, Void**, Win32cr::Foundation::HRESULT),
    range_from_point : Proc(ITextProvider*, Win32cr::UI::Accessibility::UiaPoint, Void**, Win32cr::Foundation::HRESULT),
    get_DocumentRange : Proc(ITextProvider*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportedTextSelection : Proc(ITextProvider*, Win32cr::UI::Accessibility::SupportedTextSelection*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITextProvider, lpVtbl : ITextProviderVtbl* do
    GUID = LibC::GUID.new(0x3589c92c_u32, 0x63f3_u16, 0x4367_u16, StaticArray[0x99_u8, 0xbb_u8, 0xad_u8, 0xa6_u8, 0x53_u8, 0xb7_u8, 0x7c_u8, 0xf2_u8])
    def query_interface(this : ITextProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_selection(this : ITextProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, pRetVal)
    end
    def get_visible_ranges(this : ITextProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visible_ranges.call(this, pRetVal)
    end
    def range_from_child(this : ITextProvider*, childElement : Void*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_child.call(this, childElement, pRetVal)
    end
    def range_from_point(this : ITextProvider*, point : Win32cr::UI::Accessibility::UiaPoint, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_point.call(this, point, pRetVal)
    end
    def get_DocumentRange(this : ITextProvider*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DocumentRange.call(this, pRetVal)
    end
    def get_SupportedTextSelection(this : ITextProvider*, pRetVal : Win32cr::UI::Accessibility::SupportedTextSelection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportedTextSelection.call(this, pRetVal)
    end

  end

  @[Extern]
  record ITextProvider2Vtbl,
    query_interface : Proc(ITextProvider2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextProvider2*, UInt32),
    release : Proc(ITextProvider2*, UInt32),
    get_selection : Proc(ITextProvider2*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_visible_ranges : Proc(ITextProvider2*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    range_from_child : Proc(ITextProvider2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    range_from_point : Proc(ITextProvider2*, Win32cr::UI::Accessibility::UiaPoint, Void**, Win32cr::Foundation::HRESULT),
    get_DocumentRange : Proc(ITextProvider2*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportedTextSelection : Proc(ITextProvider2*, Win32cr::UI::Accessibility::SupportedTextSelection*, Win32cr::Foundation::HRESULT),
    range_from_annotation : Proc(ITextProvider2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_caret_range : Proc(ITextProvider2*, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITextProvider2, lpVtbl : ITextProvider2Vtbl* do
    GUID = LibC::GUID.new(0xdc5e6ed_u32, 0x3e16_u16, 0x4bf1_u16, StaticArray[0x8f_u8, 0x9a_u8, 0xa9_u8, 0x79_u8, 0x87_u8, 0x8b_u8, 0xc1_u8, 0x95_u8])
    def query_interface(this : ITextProvider2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextProvider2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextProvider2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_selection(this : ITextProvider2*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, pRetVal)
    end
    def get_visible_ranges(this : ITextProvider2*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visible_ranges.call(this, pRetVal)
    end
    def range_from_child(this : ITextProvider2*, childElement : Void*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_child.call(this, childElement, pRetVal)
    end
    def range_from_point(this : ITextProvider2*, point : Win32cr::UI::Accessibility::UiaPoint, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_point.call(this, point, pRetVal)
    end
    def get_DocumentRange(this : ITextProvider2*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DocumentRange.call(this, pRetVal)
    end
    def get_SupportedTextSelection(this : ITextProvider2*, pRetVal : Win32cr::UI::Accessibility::SupportedTextSelection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportedTextSelection.call(this, pRetVal)
    end
    def range_from_annotation(this : ITextProvider2*, annotationElement : Void*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_annotation.call(this, annotationElement, pRetVal)
    end
    def get_caret_range(this : ITextProvider2*, isActive : Win32cr::Foundation::BOOL*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_caret_range.call(this, isActive, pRetVal)
    end

  end

  @[Extern]
  record ITextEditProviderVtbl,
    query_interface : Proc(ITextEditProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextEditProvider*, UInt32),
    release : Proc(ITextEditProvider*, UInt32),
    get_selection : Proc(ITextEditProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_visible_ranges : Proc(ITextEditProvider*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    range_from_child : Proc(ITextEditProvider*, Void*, Void**, Win32cr::Foundation::HRESULT),
    range_from_point : Proc(ITextEditProvider*, Win32cr::UI::Accessibility::UiaPoint, Void**, Win32cr::Foundation::HRESULT),
    get_DocumentRange : Proc(ITextEditProvider*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportedTextSelection : Proc(ITextEditProvider*, Win32cr::UI::Accessibility::SupportedTextSelection*, Win32cr::Foundation::HRESULT),
    get_active_composition : Proc(ITextEditProvider*, Void**, Win32cr::Foundation::HRESULT),
    get_conversion_target : Proc(ITextEditProvider*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITextEditProvider, lpVtbl : ITextEditProviderVtbl* do
    GUID = LibC::GUID.new(0xea3605b4_u32, 0x3a05_u16, 0x400e_u16, StaticArray[0xb5_u8, 0xf9_u8, 0x4e_u8, 0x91_u8, 0xb4_u8, 0xf_u8, 0x61_u8, 0x76_u8])
    def query_interface(this : ITextEditProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextEditProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextEditProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_selection(this : ITextEditProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, pRetVal)
    end
    def get_visible_ranges(this : ITextEditProvider*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visible_ranges.call(this, pRetVal)
    end
    def range_from_child(this : ITextEditProvider*, childElement : Void*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_child.call(this, childElement, pRetVal)
    end
    def range_from_point(this : ITextEditProvider*, point : Win32cr::UI::Accessibility::UiaPoint, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_point.call(this, point, pRetVal)
    end
    def get_DocumentRange(this : ITextEditProvider*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DocumentRange.call(this, pRetVal)
    end
    def get_SupportedTextSelection(this : ITextEditProvider*, pRetVal : Win32cr::UI::Accessibility::SupportedTextSelection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportedTextSelection.call(this, pRetVal)
    end
    def get_active_composition(this : ITextEditProvider*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_composition.call(this, pRetVal)
    end
    def get_conversion_target(this : ITextEditProvider*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_conversion_target.call(this, pRetVal)
    end

  end

  @[Extern]
  record ITextRangeProvider2Vtbl,
    query_interface : Proc(ITextRangeProvider2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextRangeProvider2*, UInt32),
    release : Proc(ITextRangeProvider2*, UInt32),
    clone : Proc(ITextRangeProvider2*, Void**, Win32cr::Foundation::HRESULT),
    compare : Proc(ITextRangeProvider2*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    compare_endpoints : Proc(ITextRangeProvider2*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Void*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Int32*, Win32cr::Foundation::HRESULT),
    expand_to_enclosing_unit : Proc(ITextRangeProvider2*, Win32cr::UI::Accessibility::TextUnit, Win32cr::Foundation::HRESULT),
    find_attribute : Proc(ITextRangeProvider2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    find_text : Proc(ITextRangeProvider2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    get_attribute_value : Proc(ITextRangeProvider2*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_bounding_rectangles : Proc(ITextRangeProvider2*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_enclosing_element : Proc(ITextRangeProvider2*, Void**, Win32cr::Foundation::HRESULT),
    get_text : Proc(ITextRangeProvider2*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    move : Proc(ITextRangeProvider2*, Win32cr::UI::Accessibility::TextUnit, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_endpoint_by_unit : Proc(ITextRangeProvider2*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Win32cr::UI::Accessibility::TextUnit, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_endpoint_by_range : Proc(ITextRangeProvider2*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Void*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Win32cr::Foundation::HRESULT),
    select__ : Proc(ITextRangeProvider2*, Win32cr::Foundation::HRESULT),
    add_to_selection : Proc(ITextRangeProvider2*, Win32cr::Foundation::HRESULT),
    remove_from_selection : Proc(ITextRangeProvider2*, Win32cr::Foundation::HRESULT),
    scroll_into_view : Proc(ITextRangeProvider2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_children : Proc(ITextRangeProvider2*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    show_context_menu : Proc(ITextRangeProvider2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITextRangeProvider2, lpVtbl : ITextRangeProvider2Vtbl* do
    GUID = LibC::GUID.new(0x9bbce42c_u32, 0x1921_u16, 0x4f18_u16, StaticArray[0x89_u8, 0xca_u8, 0xdb_u8, 0xa1_u8, 0x91_u8, 0xa_u8, 0x3_u8, 0x86_u8])
    def query_interface(this : ITextRangeProvider2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextRangeProvider2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextRangeProvider2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : ITextRangeProvider2*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, pRetVal)
    end
    def compare(this : ITextRangeProvider2*, range : Void*, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare.call(this, range, pRetVal)
    end
    def compare_endpoints(this : ITextRangeProvider2*, endpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, targetRange : Void*, targetEndpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_endpoints.call(this, endpoint, targetRange, targetEndpoint, pRetVal)
    end
    def expand_to_enclosing_unit(this : ITextRangeProvider2*, unit : Win32cr::UI::Accessibility::TextUnit) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand_to_enclosing_unit.call(this, unit)
    end
    def find_attribute(this : ITextRangeProvider2*, attributeId : Int32, val : Win32cr::System::Com::VARIANT, backward : Win32cr::Foundation::BOOL, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_attribute.call(this, attributeId, val, backward, pRetVal)
    end
    def find_text(this : ITextRangeProvider2*, text : Win32cr::Foundation::BSTR, backward : Win32cr::Foundation::BOOL, ignoreCase : Win32cr::Foundation::BOOL, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text.call(this, text, backward, ignoreCase, pRetVal)
    end
    def get_attribute_value(this : ITextRangeProvider2*, attributeId : Int32, pRetVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_value.call(this, attributeId, pRetVal)
    end
    def get_bounding_rectangles(this : ITextRangeProvider2*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bounding_rectangles.call(this, pRetVal)
    end
    def get_enclosing_element(this : ITextRangeProvider2*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enclosing_element.call(this, pRetVal)
    end
    def get_text(this : ITextRangeProvider2*, maxLength : Int32, pRetVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, maxLength, pRetVal)
    end
    def move(this : ITextRangeProvider2*, unit : Win32cr::UI::Accessibility::TextUnit, count : Int32, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, unit, count, pRetVal)
    end
    def move_endpoint_by_unit(this : ITextRangeProvider2*, endpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, unit : Win32cr::UI::Accessibility::TextUnit, count : Int32, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_endpoint_by_unit.call(this, endpoint, unit, count, pRetVal)
    end
    def move_endpoint_by_range(this : ITextRangeProvider2*, endpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, targetRange : Void*, targetEndpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_endpoint_by_range.call(this, endpoint, targetRange, targetEndpoint)
    end
    def select__(this : ITextRangeProvider2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this)
    end
    def add_to_selection(this : ITextRangeProvider2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_to_selection.call(this)
    end
    def remove_from_selection(this : ITextRangeProvider2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_from_selection.call(this)
    end
    def scroll_into_view(this : ITextRangeProvider2*, alignToTop : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll_into_view.call(this, alignToTop)
    end
    def get_children(this : ITextRangeProvider2*, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_children.call(this, pRetVal)
    end
    def show_context_menu(this : ITextRangeProvider2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_context_menu.call(this)
    end

  end

  @[Extern]
  record ITextChildProviderVtbl,
    query_interface : Proc(ITextChildProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ITextChildProvider*, UInt32),
    release : Proc(ITextChildProvider*, UInt32),
    get_TextContainer : Proc(ITextChildProvider*, Void**, Win32cr::Foundation::HRESULT),
    get_TextRange : Proc(ITextChildProvider*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ITextChildProvider, lpVtbl : ITextChildProviderVtbl* do
    GUID = LibC::GUID.new(0x4c2de2b9_u32, 0xc88f_u16, 0x4f88_u16, StaticArray[0xa1_u8, 0x11_u8, 0xf1_u8, 0xd3_u8, 0x36_u8, 0xb7_u8, 0xd1_u8, 0xa9_u8])
    def query_interface(this : ITextChildProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ITextChildProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ITextChildProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_TextContainer(this : ITextChildProvider*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TextContainer.call(this, pRetVal)
    end
    def get_TextRange(this : ITextChildProvider*, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TextRange.call(this, pRetVal)
    end

  end

  @[Extern]
  record ICustomNavigationProviderVtbl,
    query_interface : Proc(ICustomNavigationProvider*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(ICustomNavigationProvider*, UInt32),
    release : Proc(ICustomNavigationProvider*, UInt32),
    navigate : Proc(ICustomNavigationProvider*, Win32cr::UI::Accessibility::NavigateDirection, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record ICustomNavigationProvider, lpVtbl : ICustomNavigationProviderVtbl* do
    GUID = LibC::GUID.new(0x2062a28a_u32, 0x8c07_u16, 0x4b94_u16, StaticArray[0x8e_u8, 0x12_u8, 0x70_u8, 0x37_u8, 0xc6_u8, 0x22_u8, 0xae_u8, 0xb8_u8])
    def query_interface(this : ICustomNavigationProvider*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : ICustomNavigationProvider*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : ICustomNavigationProvider*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def navigate(this : ICustomNavigationProvider*, direction : Win32cr::UI::Accessibility::NavigateDirection, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.navigate.call(this, direction, pRetVal)
    end

  end

  @[Extern]
  record IUIAutomationPatternInstanceVtbl,
    query_interface : Proc(IUIAutomationPatternInstance*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationPatternInstance*, UInt32),
    release : Proc(IUIAutomationPatternInstance*, UInt32),
    get_property : Proc(IUIAutomationPatternInstance*, UInt32, Win32cr::Foundation::BOOL, Win32cr::UI::Accessibility::UIAutomationType, Void*, Win32cr::Foundation::HRESULT),
    call_method : Proc(IUIAutomationPatternInstance*, UInt32, Win32cr::UI::Accessibility::UIAutomationParameter*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationPatternInstance, lpVtbl : IUIAutomationPatternInstanceVtbl* do
    GUID = LibC::GUID.new(0xc03a7fe4_u32, 0x9431_u16, 0x409f_u16, StaticArray[0xbe_u8, 0xd8_u8, 0xae_u8, 0x7c_u8, 0x22_u8, 0x99_u8, 0xbc_u8, 0x8d_u8])
    def query_interface(this : IUIAutomationPatternInstance*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationPatternInstance*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationPatternInstance*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_property(this : IUIAutomationPatternInstance*, index : UInt32, cached : Win32cr::Foundation::BOOL, type__ : Win32cr::UI::Accessibility::UIAutomationType, pPtr : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property.call(this, index, cached, type__, pPtr)
    end
    def call_method(this : IUIAutomationPatternInstance*, index : UInt32, pParams : Win32cr::UI::Accessibility::UIAutomationParameter*, cParams : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.call_method.call(this, index, pParams, cParams)
    end

  end

  @[Extern]
  record IUIAutomationPatternHandlerVtbl,
    query_interface : Proc(IUIAutomationPatternHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationPatternHandler*, UInt32),
    release : Proc(IUIAutomationPatternHandler*, UInt32),
    create_client_wrapper : Proc(IUIAutomationPatternHandler*, Void*, Void**, Win32cr::Foundation::HRESULT),
    dispatch : Proc(IUIAutomationPatternHandler*, Void*, UInt32, Win32cr::UI::Accessibility::UIAutomationParameter*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationPatternHandler, lpVtbl : IUIAutomationPatternHandlerVtbl* do
    GUID = LibC::GUID.new(0xd97022f3_u32, 0xa947_u16, 0x465e_u16, StaticArray[0x8b_u8, 0x2a_u8, 0xac_u8, 0x43_u8, 0x15_u8, 0xfa_u8, 0x54_u8, 0xe8_u8])
    def query_interface(this : IUIAutomationPatternHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationPatternHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationPatternHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_client_wrapper(this : IUIAutomationPatternHandler*, pPatternInstance : Void*, pClientWrapper : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_client_wrapper.call(this, pPatternInstance, pClientWrapper)
    end
    def dispatch(this : IUIAutomationPatternHandler*, pTarget : Void*, index : UInt32, pParams : Win32cr::UI::Accessibility::UIAutomationParameter*, cParams : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.dispatch.call(this, pTarget, index, pParams, cParams)
    end

  end

  @[Extern]
  record IUIAutomationRegistrarVtbl,
    query_interface : Proc(IUIAutomationRegistrar*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationRegistrar*, UInt32),
    release : Proc(IUIAutomationRegistrar*, UInt32),
    register_property : Proc(IUIAutomationRegistrar*, Win32cr::UI::Accessibility::UIAutomationPropertyInfo*, Int32*, Win32cr::Foundation::HRESULT),
    register_event : Proc(IUIAutomationRegistrar*, Win32cr::UI::Accessibility::UIAutomationEventInfo*, Int32*, Win32cr::Foundation::HRESULT),
    register_pattern : Proc(IUIAutomationRegistrar*, Win32cr::UI::Accessibility::UIAutomationPatternInfo*, Int32*, Int32*, UInt32, Int32*, UInt32, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationRegistrar, lpVtbl : IUIAutomationRegistrarVtbl* do
    GUID = LibC::GUID.new(0x8609c4ec_u32, 0x4a1a_u16, 0x4d88_u16, StaticArray[0xa3_u8, 0x57_u8, 0x5a_u8, 0x66_u8, 0xe0_u8, 0x60_u8, 0xe1_u8, 0xcf_u8])
    def query_interface(this : IUIAutomationRegistrar*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationRegistrar*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationRegistrar*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def register_property(this : IUIAutomationRegistrar*, property : Win32cr::UI::Accessibility::UIAutomationPropertyInfo*, propertyId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_property.call(this, property, propertyId)
    end
    def register_event(this : IUIAutomationRegistrar*, event : Win32cr::UI::Accessibility::UIAutomationEventInfo*, eventId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_event.call(this, event, eventId)
    end
    def register_pattern(this : IUIAutomationRegistrar*, pattern : Win32cr::UI::Accessibility::UIAutomationPatternInfo*, pPatternId : Int32*, pPatternAvailablePropertyId : Int32*, propertyIdCount : UInt32, pPropertyIds : Int32*, eventIdCount : UInt32, pEventIds : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.register_pattern.call(this, pattern, pPatternId, pPatternAvailablePropertyId, propertyIdCount, pPropertyIds, eventIdCount, pEventIds)
    end

  end

  @[Extern]
  record IUIAutomationElementVtbl,
    query_interface : Proc(IUIAutomationElement*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationElement*, UInt32),
    release : Proc(IUIAutomationElement*, UInt32),
    set_focus : Proc(IUIAutomationElement*, Win32cr::Foundation::HRESULT),
    get_runtime_id : Proc(IUIAutomationElement*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    find_first : Proc(IUIAutomationElement*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all : Proc(IUIAutomationElement*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_first_build_cache : Proc(IUIAutomationElement*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_build_cache : Proc(IUIAutomationElement*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    build_updated_cache : Proc(IUIAutomationElement*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_current_property_value : Proc(IUIAutomationElement*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_property_value_ex : Proc(IUIAutomationElement*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value : Proc(IUIAutomationElement*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value_ex : Proc(IUIAutomationElement*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_pattern_as : Proc(IUIAutomationElement*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern_as : Proc(IUIAutomationElement*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_current_pattern : Proc(IUIAutomationElement*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern : Proc(IUIAutomationElement*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_parent : Proc(IUIAutomationElement*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_children : Proc(IUIAutomationElement*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProcessId : Proc(IUIAutomationElement*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentControlType : Proc(IUIAutomationElement*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLocalizedControlType : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentName : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAcceleratorKey : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAccessKey : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHasKeyboardFocus : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsKeyboardFocusable : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsEnabled : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentAutomationId : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentClassName : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHelpText : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentCulture : Proc(IUIAutomationElement*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentIsControlElement : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsContentElement : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPassword : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentNativeWindowHandle : Proc(IUIAutomationElement*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CurrentItemType : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsOffscreen : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOrientation : Proc(IUIAutomationElement*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CurrentFrameworkId : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsRequiredForForm : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentItemStatus : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentBoundingRectangle : Proc(IUIAutomationElement*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CurrentLabeledBy : Proc(IUIAutomationElement*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentAriaRole : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAriaProperties : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsDataValidForForm : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentControllerFor : Proc(IUIAutomationElement*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentDescribedBy : Proc(IUIAutomationElement*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsTo : Proc(IUIAutomationElement*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProviderDescription : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedProcessId : Proc(IUIAutomationElement*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedControlType : Proc(IUIAutomationElement*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLocalizedControlType : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedName : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAcceleratorKey : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAccessKey : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHasKeyboardFocus : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsKeyboardFocusable : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsEnabled : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedAutomationId : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedClassName : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHelpText : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedCulture : Proc(IUIAutomationElement*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedIsControlElement : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsContentElement : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPassword : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedNativeWindowHandle : Proc(IUIAutomationElement*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CachedItemType : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsOffscreen : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOrientation : Proc(IUIAutomationElement*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CachedFrameworkId : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsRequiredForForm : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedItemStatus : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedBoundingRectangle : Proc(IUIAutomationElement*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CachedLabeledBy : Proc(IUIAutomationElement*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedAriaRole : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAriaProperties : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsDataValidForForm : Proc(IUIAutomationElement*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedControllerFor : Proc(IUIAutomationElement*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedDescribedBy : Proc(IUIAutomationElement*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsTo : Proc(IUIAutomationElement*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedProviderDescription : Proc(IUIAutomationElement*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_clickable_point : Proc(IUIAutomationElement*, Win32cr::Foundation::POINT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationElement, lpVtbl : IUIAutomationElementVtbl* do
    GUID = LibC::GUID.new(0xd22108aa_u32, 0x8ac5_u16, 0x49a5_u16, StaticArray[0x83_u8, 0x7b_u8, 0x37_u8, 0xbb_u8, 0xb3_u8, 0xd7_u8, 0x59_u8, 0x1e_u8])
    def query_interface(this : IUIAutomationElement*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationElement*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationElement*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_focus(this : IUIAutomationElement*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_focus.call(this)
    end
    def get_runtime_id(this : IUIAutomationElement*, runtimeId : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_id.call(this, runtimeId)
    end
    def find_first(this : IUIAutomationElement*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first.call(this, scope, condition, found)
    end
    def find_all(this : IUIAutomationElement*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all.call(this, scope, condition, found)
    end
    def find_first_build_cache(this : IUIAutomationElement*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def find_all_build_cache(this : IUIAutomationElement*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def build_updated_cache(this : IUIAutomationElement*, cacheRequest : Void*, updatedElement : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.build_updated_cache.call(this, cacheRequest, updatedElement)
    end
    def get_current_property_value(this : IUIAutomationElement*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value.call(this, propertyId, retVal)
    end
    def get_current_property_value_ex(this : IUIAutomationElement*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_cached_property_value(this : IUIAutomationElement*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value.call(this, propertyId, retVal)
    end
    def get_cached_property_value_ex(this : IUIAutomationElement*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_current_pattern_as(this : IUIAutomationElement*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_cached_pattern_as(this : IUIAutomationElement*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_current_pattern(this : IUIAutomationElement*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern.call(this, patternId, patternObject)
    end
    def get_cached_pattern(this : IUIAutomationElement*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern.call(this, patternId, patternObject)
    end
    def get_cached_parent(this : IUIAutomationElement*, parent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_parent.call(this, parent)
    end
    def get_cached_children(this : IUIAutomationElement*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_children.call(this, children)
    end
    def get_CurrentProcessId(this : IUIAutomationElement*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProcessId.call(this, retVal)
    end
    def get_CurrentControlType(this : IUIAutomationElement*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControlType.call(this, retVal)
    end
    def get_CurrentLocalizedControlType(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLocalizedControlType.call(this, retVal)
    end
    def get_CurrentName(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentName.call(this, retVal)
    end
    def get_CurrentAcceleratorKey(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAcceleratorKey.call(this, retVal)
    end
    def get_CurrentAccessKey(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAccessKey.call(this, retVal)
    end
    def get_CurrentHasKeyboardFocus(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHasKeyboardFocus.call(this, retVal)
    end
    def get_CurrentIsKeyboardFocusable(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsKeyboardFocusable.call(this, retVal)
    end
    def get_CurrentIsEnabled(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsEnabled.call(this, retVal)
    end
    def get_CurrentAutomationId(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAutomationId.call(this, retVal)
    end
    def get_CurrentClassName(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentClassName.call(this, retVal)
    end
    def get_CurrentHelpText(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHelpText.call(this, retVal)
    end
    def get_CurrentCulture(this : IUIAutomationElement*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCulture.call(this, retVal)
    end
    def get_CurrentIsControlElement(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsControlElement.call(this, retVal)
    end
    def get_CurrentIsContentElement(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsContentElement.call(this, retVal)
    end
    def get_CurrentIsPassword(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPassword.call(this, retVal)
    end
    def get_CurrentNativeWindowHandle(this : IUIAutomationElement*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentNativeWindowHandle.call(this, retVal)
    end
    def get_CurrentItemType(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemType.call(this, retVal)
    end
    def get_CurrentIsOffscreen(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsOffscreen.call(this, retVal)
    end
    def get_CurrentOrientation(this : IUIAutomationElement*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOrientation.call(this, retVal)
    end
    def get_CurrentFrameworkId(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFrameworkId.call(this, retVal)
    end
    def get_CurrentIsRequiredForForm(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsRequiredForForm.call(this, retVal)
    end
    def get_CurrentItemStatus(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemStatus.call(this, retVal)
    end
    def get_CurrentBoundingRectangle(this : IUIAutomationElement*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentBoundingRectangle.call(this, retVal)
    end
    def get_CurrentLabeledBy(this : IUIAutomationElement*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLabeledBy.call(this, retVal)
    end
    def get_CurrentAriaRole(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaRole.call(this, retVal)
    end
    def get_CurrentAriaProperties(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaProperties.call(this, retVal)
    end
    def get_CurrentIsDataValidForForm(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsDataValidForForm.call(this, retVal)
    end
    def get_CurrentControllerFor(this : IUIAutomationElement*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControllerFor.call(this, retVal)
    end
    def get_CurrentDescribedBy(this : IUIAutomationElement*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDescribedBy.call(this, retVal)
    end
    def get_CurrentFlowsTo(this : IUIAutomationElement*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsTo.call(this, retVal)
    end
    def get_CurrentProviderDescription(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProviderDescription.call(this, retVal)
    end
    def get_CachedProcessId(this : IUIAutomationElement*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProcessId.call(this, retVal)
    end
    def get_CachedControlType(this : IUIAutomationElement*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControlType.call(this, retVal)
    end
    def get_CachedLocalizedControlType(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLocalizedControlType.call(this, retVal)
    end
    def get_CachedName(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedName.call(this, retVal)
    end
    def get_CachedAcceleratorKey(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAcceleratorKey.call(this, retVal)
    end
    def get_CachedAccessKey(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAccessKey.call(this, retVal)
    end
    def get_CachedHasKeyboardFocus(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHasKeyboardFocus.call(this, retVal)
    end
    def get_CachedIsKeyboardFocusable(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsKeyboardFocusable.call(this, retVal)
    end
    def get_CachedIsEnabled(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsEnabled.call(this, retVal)
    end
    def get_CachedAutomationId(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAutomationId.call(this, retVal)
    end
    def get_CachedClassName(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedClassName.call(this, retVal)
    end
    def get_CachedHelpText(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHelpText.call(this, retVal)
    end
    def get_CachedCulture(this : IUIAutomationElement*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCulture.call(this, retVal)
    end
    def get_CachedIsControlElement(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsControlElement.call(this, retVal)
    end
    def get_CachedIsContentElement(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsContentElement.call(this, retVal)
    end
    def get_CachedIsPassword(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPassword.call(this, retVal)
    end
    def get_CachedNativeWindowHandle(this : IUIAutomationElement*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedNativeWindowHandle.call(this, retVal)
    end
    def get_CachedItemType(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemType.call(this, retVal)
    end
    def get_CachedIsOffscreen(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsOffscreen.call(this, retVal)
    end
    def get_CachedOrientation(this : IUIAutomationElement*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOrientation.call(this, retVal)
    end
    def get_CachedFrameworkId(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFrameworkId.call(this, retVal)
    end
    def get_CachedIsRequiredForForm(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsRequiredForForm.call(this, retVal)
    end
    def get_CachedItemStatus(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemStatus.call(this, retVal)
    end
    def get_CachedBoundingRectangle(this : IUIAutomationElement*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedBoundingRectangle.call(this, retVal)
    end
    def get_CachedLabeledBy(this : IUIAutomationElement*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLabeledBy.call(this, retVal)
    end
    def get_CachedAriaRole(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaRole.call(this, retVal)
    end
    def get_CachedAriaProperties(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaProperties.call(this, retVal)
    end
    def get_CachedIsDataValidForForm(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsDataValidForForm.call(this, retVal)
    end
    def get_CachedControllerFor(this : IUIAutomationElement*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControllerFor.call(this, retVal)
    end
    def get_CachedDescribedBy(this : IUIAutomationElement*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDescribedBy.call(this, retVal)
    end
    def get_CachedFlowsTo(this : IUIAutomationElement*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsTo.call(this, retVal)
    end
    def get_CachedProviderDescription(this : IUIAutomationElement*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProviderDescription.call(this, retVal)
    end
    def get_clickable_point(this : IUIAutomationElement*, clickable : Win32cr::Foundation::POINT*, gotClickable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clickable_point.call(this, clickable, gotClickable)
    end

  end

  @[Extern]
  record IUIAutomationElementArrayVtbl,
    query_interface : Proc(IUIAutomationElementArray*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationElementArray*, UInt32),
    release : Proc(IUIAutomationElementArray*, UInt32),
    get_Length : Proc(IUIAutomationElementArray*, Int32*, Win32cr::Foundation::HRESULT),
    get_element : Proc(IUIAutomationElementArray*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationElementArray, lpVtbl : IUIAutomationElementArrayVtbl* do
    GUID = LibC::GUID.new(0x14314595_u32, 0xb4bc_u16, 0x4055_u16, StaticArray[0x95_u8, 0xf2_u8, 0x58_u8, 0xf2_u8, 0xe4_u8, 0x2c_u8, 0x98_u8, 0x55_u8])
    def query_interface(this : IUIAutomationElementArray*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationElementArray*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationElementArray*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Length(this : IUIAutomationElementArray*, length : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Length.call(this, length)
    end
    def get_element(this : IUIAutomationElementArray*, index : Int32, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_element.call(this, index, element)
    end

  end

  @[Extern]
  record IUIAutomationConditionVtbl,
    query_interface : Proc(IUIAutomationCondition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationCondition*, UInt32),
    release : Proc(IUIAutomationCondition*, UInt32)


  @[Extern]
  record IUIAutomationCondition, lpVtbl : IUIAutomationConditionVtbl* do
    GUID = LibC::GUID.new(0x352ffba8_u32, 0x973_u16, 0x437c_u16, StaticArray[0xa6_u8, 0x1f_u8, 0xf6_u8, 0x4c_u8, 0xaf_u8, 0xd8_u8, 0x1d_u8, 0xf9_u8])
    def query_interface(this : IUIAutomationCondition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationCondition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationCondition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end

  end

  @[Extern]
  record IUIAutomationBoolConditionVtbl,
    query_interface : Proc(IUIAutomationBoolCondition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationBoolCondition*, UInt32),
    release : Proc(IUIAutomationBoolCondition*, UInt32),
    get_BooleanValue : Proc(IUIAutomationBoolCondition*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationBoolCondition, lpVtbl : IUIAutomationBoolConditionVtbl* do
    GUID = LibC::GUID.new(0x1b4e1f2e_u32, 0x75eb_u16, 0x4d0b_u16, StaticArray[0x89_u8, 0x52_u8, 0x5a_u8, 0x69_u8, 0x98_u8, 0x8e_u8, 0x23_u8, 0x7_u8])
    def query_interface(this : IUIAutomationBoolCondition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationBoolCondition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationBoolCondition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_BooleanValue(this : IUIAutomationBoolCondition*, boolVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_BooleanValue.call(this, boolVal)
    end

  end

  @[Extern]
  record IUIAutomationPropertyConditionVtbl,
    query_interface : Proc(IUIAutomationPropertyCondition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationPropertyCondition*, UInt32),
    release : Proc(IUIAutomationPropertyCondition*, UInt32),
    get_PropertyId : Proc(IUIAutomationPropertyCondition*, Int32*, Win32cr::Foundation::HRESULT),
    get_PropertyValue : Proc(IUIAutomationPropertyCondition*, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_PropertyConditionFlags : Proc(IUIAutomationPropertyCondition*, Win32cr::UI::Accessibility::PropertyConditionFlags*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationPropertyCondition, lpVtbl : IUIAutomationPropertyConditionVtbl* do
    GUID = LibC::GUID.new(0x99ebf2cb_u32, 0x5578_u16, 0x4267_u16, StaticArray[0x9a_u8, 0xd4_u8, 0xaf_u8, 0xd6_u8, 0xea_u8, 0x77_u8, 0xe9_u8, 0x4b_u8])
    def query_interface(this : IUIAutomationPropertyCondition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationPropertyCondition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationPropertyCondition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_PropertyId(this : IUIAutomationPropertyCondition*, propertyId : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyId.call(this, propertyId)
    end
    def get_PropertyValue(this : IUIAutomationPropertyCondition*, propertyValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyValue.call(this, propertyValue)
    end
    def get_PropertyConditionFlags(this : IUIAutomationPropertyCondition*, flags : Win32cr::UI::Accessibility::PropertyConditionFlags*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_PropertyConditionFlags.call(this, flags)
    end

  end

  @[Extern]
  record IUIAutomationAndConditionVtbl,
    query_interface : Proc(IUIAutomationAndCondition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationAndCondition*, UInt32),
    release : Proc(IUIAutomationAndCondition*, UInt32),
    get_ChildCount : Proc(IUIAutomationAndCondition*, Int32*, Win32cr::Foundation::HRESULT),
    get_children_as_native_array : Proc(IUIAutomationAndCondition*, Void***, Int32*, Win32cr::Foundation::HRESULT),
    get_children : Proc(IUIAutomationAndCondition*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationAndCondition, lpVtbl : IUIAutomationAndConditionVtbl* do
    GUID = LibC::GUID.new(0xa7d0af36_u32, 0xb912_u16, 0x45fe_u16, StaticArray[0x98_u8, 0x55_u8, 0x9_u8, 0x1d_u8, 0xdc_u8, 0x17_u8, 0x4a_u8, 0xec_u8])
    def query_interface(this : IUIAutomationAndCondition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationAndCondition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationAndCondition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_ChildCount(this : IUIAutomationAndCondition*, childCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ChildCount.call(this, childCount)
    end
    def get_children_as_native_array(this : IUIAutomationAndCondition*, childArray : Void***, childArrayCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_children_as_native_array.call(this, childArray, childArrayCount)
    end
    def get_children(this : IUIAutomationAndCondition*, childArray : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_children.call(this, childArray)
    end

  end

  @[Extern]
  record IUIAutomationOrConditionVtbl,
    query_interface : Proc(IUIAutomationOrCondition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationOrCondition*, UInt32),
    release : Proc(IUIAutomationOrCondition*, UInt32),
    get_ChildCount : Proc(IUIAutomationOrCondition*, Int32*, Win32cr::Foundation::HRESULT),
    get_children_as_native_array : Proc(IUIAutomationOrCondition*, Void***, Int32*, Win32cr::Foundation::HRESULT),
    get_children : Proc(IUIAutomationOrCondition*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationOrCondition, lpVtbl : IUIAutomationOrConditionVtbl* do
    GUID = LibC::GUID.new(0x8753f032_u32, 0x3db1_u16, 0x47b5_u16, StaticArray[0xa1_u8, 0xfc_u8, 0x6e_u8, 0x34_u8, 0xa2_u8, 0x66_u8, 0xc7_u8, 0x12_u8])
    def query_interface(this : IUIAutomationOrCondition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationOrCondition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationOrCondition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_ChildCount(this : IUIAutomationOrCondition*, childCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ChildCount.call(this, childCount)
    end
    def get_children_as_native_array(this : IUIAutomationOrCondition*, childArray : Void***, childArrayCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_children_as_native_array.call(this, childArray, childArrayCount)
    end
    def get_children(this : IUIAutomationOrCondition*, childArray : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_children.call(this, childArray)
    end

  end

  @[Extern]
  record IUIAutomationNotConditionVtbl,
    query_interface : Proc(IUIAutomationNotCondition*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationNotCondition*, UInt32),
    release : Proc(IUIAutomationNotCondition*, UInt32),
    get_child : Proc(IUIAutomationNotCondition*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationNotCondition, lpVtbl : IUIAutomationNotConditionVtbl* do
    GUID = LibC::GUID.new(0xf528b657_u32, 0x847b_u16, 0x498c_u16, StaticArray[0x88_u8, 0x96_u8, 0xd5_u8, 0x2b_u8, 0x56_u8, 0x54_u8, 0x7_u8, 0xa1_u8])
    def query_interface(this : IUIAutomationNotCondition*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationNotCondition*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationNotCondition*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_child(this : IUIAutomationNotCondition*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_child.call(this, condition)
    end

  end

  @[Extern]
  record IUIAutomationCacheRequestVtbl,
    query_interface : Proc(IUIAutomationCacheRequest*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationCacheRequest*, UInt32),
    release : Proc(IUIAutomationCacheRequest*, UInt32),
    add_property : Proc(IUIAutomationCacheRequest*, Int32, Win32cr::Foundation::HRESULT),
    add_pattern : Proc(IUIAutomationCacheRequest*, Int32, Win32cr::Foundation::HRESULT),
    clone : Proc(IUIAutomationCacheRequest*, Void**, Win32cr::Foundation::HRESULT),
    get_TreeScope : Proc(IUIAutomationCacheRequest*, Win32cr::UI::Accessibility::TreeScope*, Win32cr::Foundation::HRESULT),
    put_TreeScope : Proc(IUIAutomationCacheRequest*, Win32cr::UI::Accessibility::TreeScope, Win32cr::Foundation::HRESULT),
    get_TreeFilter : Proc(IUIAutomationCacheRequest*, Void**, Win32cr::Foundation::HRESULT),
    put_TreeFilter : Proc(IUIAutomationCacheRequest*, Void*, Win32cr::Foundation::HRESULT),
    get_AutomationElementMode : Proc(IUIAutomationCacheRequest*, Win32cr::UI::Accessibility::AutomationElementMode*, Win32cr::Foundation::HRESULT),
    put_AutomationElementMode : Proc(IUIAutomationCacheRequest*, Win32cr::UI::Accessibility::AutomationElementMode, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationCacheRequest, lpVtbl : IUIAutomationCacheRequestVtbl* do
    GUID = LibC::GUID.new(0xb32a92b5_u32, 0xbc25_u16, 0x4078_u16, StaticArray[0x9c_u8, 0x8_u8, 0xd7_u8, 0xee_u8, 0x95_u8, 0xc4_u8, 0x8e_u8, 0x3_u8])
    def query_interface(this : IUIAutomationCacheRequest*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationCacheRequest*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationCacheRequest*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_property(this : IUIAutomationCacheRequest*, propertyId : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property.call(this, propertyId)
    end
    def add_pattern(this : IUIAutomationCacheRequest*, patternId : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_pattern.call(this, patternId)
    end
    def clone(this : IUIAutomationCacheRequest*, clonedRequest : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, clonedRequest)
    end
    def get_TreeScope(this : IUIAutomationCacheRequest*, scope : Win32cr::UI::Accessibility::TreeScope*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TreeScope.call(this, scope)
    end
    def put_TreeScope(this : IUIAutomationCacheRequest*, scope : Win32cr::UI::Accessibility::TreeScope) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TreeScope.call(this, scope)
    end
    def get_TreeFilter(this : IUIAutomationCacheRequest*, filter : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TreeFilter.call(this, filter)
    end
    def put_TreeFilter(this : IUIAutomationCacheRequest*, filter : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TreeFilter.call(this, filter)
    end
    def get_AutomationElementMode(this : IUIAutomationCacheRequest*, mode : Win32cr::UI::Accessibility::AutomationElementMode*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutomationElementMode.call(this, mode)
    end
    def put_AutomationElementMode(this : IUIAutomationCacheRequest*, mode : Win32cr::UI::Accessibility::AutomationElementMode) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AutomationElementMode.call(this, mode)
    end

  end

  @[Extern]
  record IUIAutomationTreeWalkerVtbl,
    query_interface : Proc(IUIAutomationTreeWalker*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTreeWalker*, UInt32),
    release : Proc(IUIAutomationTreeWalker*, UInt32),
    get_parent_element : Proc(IUIAutomationTreeWalker*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_first_child_element : Proc(IUIAutomationTreeWalker*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_last_child_element : Proc(IUIAutomationTreeWalker*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_next_sibling_element : Proc(IUIAutomationTreeWalker*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_previous_sibling_element : Proc(IUIAutomationTreeWalker*, Void*, Void**, Win32cr::Foundation::HRESULT),
    normalize_element : Proc(IUIAutomationTreeWalker*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_parent_element_build_cache : Proc(IUIAutomationTreeWalker*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_first_child_element_build_cache : Proc(IUIAutomationTreeWalker*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_last_child_element_build_cache : Proc(IUIAutomationTreeWalker*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_next_sibling_element_build_cache : Proc(IUIAutomationTreeWalker*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_previous_sibling_element_build_cache : Proc(IUIAutomationTreeWalker*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    normalize_element_build_cache : Proc(IUIAutomationTreeWalker*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_Condition : Proc(IUIAutomationTreeWalker*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTreeWalker, lpVtbl : IUIAutomationTreeWalkerVtbl* do
    GUID = LibC::GUID.new(0x4042c624_u32, 0x389c_u16, 0x4afc_u16, StaticArray[0xa6_u8, 0x30_u8, 0x9d_u8, 0xf8_u8, 0x54_u8, 0xa5_u8, 0x41_u8, 0xfc_u8])
    def query_interface(this : IUIAutomationTreeWalker*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTreeWalker*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTreeWalker*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_parent_element(this : IUIAutomationTreeWalker*, element : Void*, parent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_element.call(this, element, parent)
    end
    def get_first_child_element(this : IUIAutomationTreeWalker*, element : Void*, first : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_first_child_element.call(this, element, first)
    end
    def get_last_child_element(this : IUIAutomationTreeWalker*, element : Void*, last : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_child_element.call(this, element, last)
    end
    def get_next_sibling_element(this : IUIAutomationTreeWalker*, element : Void*, next__ : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_sibling_element.call(this, element, next__)
    end
    def get_previous_sibling_element(this : IUIAutomationTreeWalker*, element : Void*, previous : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_previous_sibling_element.call(this, element, previous)
    end
    def normalize_element(this : IUIAutomationTreeWalker*, element : Void*, normalized : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.normalize_element.call(this, element, normalized)
    end
    def get_parent_element_build_cache(this : IUIAutomationTreeWalker*, element : Void*, cacheRequest : Void*, parent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_parent_element_build_cache.call(this, element, cacheRequest, parent)
    end
    def get_first_child_element_build_cache(this : IUIAutomationTreeWalker*, element : Void*, cacheRequest : Void*, first : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_first_child_element_build_cache.call(this, element, cacheRequest, first)
    end
    def get_last_child_element_build_cache(this : IUIAutomationTreeWalker*, element : Void*, cacheRequest : Void*, last : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_last_child_element_build_cache.call(this, element, cacheRequest, last)
    end
    def get_next_sibling_element_build_cache(this : IUIAutomationTreeWalker*, element : Void*, cacheRequest : Void*, next__ : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_next_sibling_element_build_cache.call(this, element, cacheRequest, next__)
    end
    def get_previous_sibling_element_build_cache(this : IUIAutomationTreeWalker*, element : Void*, cacheRequest : Void*, previous : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_previous_sibling_element_build_cache.call(this, element, cacheRequest, previous)
    end
    def normalize_element_build_cache(this : IUIAutomationTreeWalker*, element : Void*, cacheRequest : Void*, normalized : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.normalize_element_build_cache.call(this, element, cacheRequest, normalized)
    end
    def get_Condition(this : IUIAutomationTreeWalker*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Condition.call(this, condition)
    end

  end

  @[Extern]
  record IUIAutomationEventHandlerVtbl,
    query_interface : Proc(IUIAutomationEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationEventHandler*, UInt32),
    release : Proc(IUIAutomationEventHandler*, UInt32),
    handle_automation_event : Proc(IUIAutomationEventHandler*, Void*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationEventHandler, lpVtbl : IUIAutomationEventHandlerVtbl* do
    GUID = LibC::GUID.new(0x146c3c17_u32, 0xf12e_u16, 0x4e22_u16, StaticArray[0x8c_u8, 0x27_u8, 0xf8_u8, 0x94_u8, 0xb9_u8, 0xb7_u8, 0x9c_u8, 0x69_u8])
    def query_interface(this : IUIAutomationEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def handle_automation_event(this : IUIAutomationEventHandler*, sender : Void*, eventId : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_automation_event.call(this, sender, eventId)
    end

  end

  @[Extern]
  record IUIAutomationPropertyChangedEventHandlerVtbl,
    query_interface : Proc(IUIAutomationPropertyChangedEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationPropertyChangedEventHandler*, UInt32),
    release : Proc(IUIAutomationPropertyChangedEventHandler*, UInt32),
    handle_property_changed_event : Proc(IUIAutomationPropertyChangedEventHandler*, Void*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationPropertyChangedEventHandler, lpVtbl : IUIAutomationPropertyChangedEventHandlerVtbl* do
    GUID = LibC::GUID.new(0x40cd37d4_u32, 0xc756_u16, 0x4b0c_u16, StaticArray[0x8c_u8, 0x6f_u8, 0xbd_u8, 0xdf_u8, 0xee_u8, 0xb1_u8, 0x3b_u8, 0x50_u8])
    def query_interface(this : IUIAutomationPropertyChangedEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationPropertyChangedEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationPropertyChangedEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def handle_property_changed_event(this : IUIAutomationPropertyChangedEventHandler*, sender : Void*, propertyId : Int32, newValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_property_changed_event.call(this, sender, propertyId, newValue)
    end

  end

  @[Extern]
  record IUIAutomationStructureChangedEventHandlerVtbl,
    query_interface : Proc(IUIAutomationStructureChangedEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationStructureChangedEventHandler*, UInt32),
    release : Proc(IUIAutomationStructureChangedEventHandler*, UInt32),
    handle_structure_changed_event : Proc(IUIAutomationStructureChangedEventHandler*, Void*, Win32cr::UI::Accessibility::StructureChangeType, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationStructureChangedEventHandler, lpVtbl : IUIAutomationStructureChangedEventHandlerVtbl* do
    GUID = LibC::GUID.new(0xe81d1b4e_u32, 0x11c5_u16, 0x42f8_u16, StaticArray[0x97_u8, 0x54_u8, 0xe7_u8, 0x3_u8, 0x6c_u8, 0x79_u8, 0xf0_u8, 0x54_u8])
    def query_interface(this : IUIAutomationStructureChangedEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationStructureChangedEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationStructureChangedEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def handle_structure_changed_event(this : IUIAutomationStructureChangedEventHandler*, sender : Void*, changeType : Win32cr::UI::Accessibility::StructureChangeType, runtimeId : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_structure_changed_event.call(this, sender, changeType, runtimeId)
    end

  end

  @[Extern]
  record IUIAutomationFocusChangedEventHandlerVtbl,
    query_interface : Proc(IUIAutomationFocusChangedEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationFocusChangedEventHandler*, UInt32),
    release : Proc(IUIAutomationFocusChangedEventHandler*, UInt32),
    handle_focus_changed_event : Proc(IUIAutomationFocusChangedEventHandler*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationFocusChangedEventHandler, lpVtbl : IUIAutomationFocusChangedEventHandlerVtbl* do
    GUID = LibC::GUID.new(0xc270f6b5_u32, 0x5c69_u16, 0x4290_u16, StaticArray[0x97_u8, 0x45_u8, 0x7a_u8, 0x7f_u8, 0x97_u8, 0x16_u8, 0x94_u8, 0x68_u8])
    def query_interface(this : IUIAutomationFocusChangedEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationFocusChangedEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationFocusChangedEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def handle_focus_changed_event(this : IUIAutomationFocusChangedEventHandler*, sender : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_focus_changed_event.call(this, sender)
    end

  end

  @[Extern]
  record IUIAutomationTextEditTextChangedEventHandlerVtbl,
    query_interface : Proc(IUIAutomationTextEditTextChangedEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTextEditTextChangedEventHandler*, UInt32),
    release : Proc(IUIAutomationTextEditTextChangedEventHandler*, UInt32),
    handle_text_edit_text_changed_event : Proc(IUIAutomationTextEditTextChangedEventHandler*, Void*, Win32cr::UI::Accessibility::TextEditChangeType, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTextEditTextChangedEventHandler, lpVtbl : IUIAutomationTextEditTextChangedEventHandlerVtbl* do
    GUID = LibC::GUID.new(0x92faa680_u32, 0xe704_u16, 0x4156_u16, StaticArray[0x93_u8, 0x1a_u8, 0xe3_u8, 0x2d_u8, 0x5b_u8, 0xb3_u8, 0x8f_u8, 0x3f_u8])
    def query_interface(this : IUIAutomationTextEditTextChangedEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTextEditTextChangedEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTextEditTextChangedEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def handle_text_edit_text_changed_event(this : IUIAutomationTextEditTextChangedEventHandler*, sender : Void*, textEditChangeType : Win32cr::UI::Accessibility::TextEditChangeType, eventStrings : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_text_edit_text_changed_event.call(this, sender, textEditChangeType, eventStrings)
    end

  end

  @[Extern]
  record IUIAutomationChangesEventHandlerVtbl,
    query_interface : Proc(IUIAutomationChangesEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationChangesEventHandler*, UInt32),
    release : Proc(IUIAutomationChangesEventHandler*, UInt32),
    handle_changes_event : Proc(IUIAutomationChangesEventHandler*, Void*, Win32cr::UI::Accessibility::UiaChangeInfo*, Int32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationChangesEventHandler, lpVtbl : IUIAutomationChangesEventHandlerVtbl* do
    GUID = LibC::GUID.new(0x58edca55_u32, 0x2c3e_u16, 0x4980_u16, StaticArray[0xb1_u8, 0xb9_u8, 0x56_u8, 0xc1_u8, 0x7f_u8, 0x27_u8, 0xa2_u8, 0xa0_u8])
    def query_interface(this : IUIAutomationChangesEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationChangesEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationChangesEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def handle_changes_event(this : IUIAutomationChangesEventHandler*, sender : Void*, uiaChanges : Win32cr::UI::Accessibility::UiaChangeInfo*, changesCount : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_changes_event.call(this, sender, uiaChanges, changesCount)
    end

  end

  @[Extern]
  record IUIAutomationNotificationEventHandlerVtbl,
    query_interface : Proc(IUIAutomationNotificationEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationNotificationEventHandler*, UInt32),
    release : Proc(IUIAutomationNotificationEventHandler*, UInt32),
    handle_notification_event : Proc(IUIAutomationNotificationEventHandler*, Void*, Win32cr::UI::Accessibility::NotificationKind, Win32cr::UI::Accessibility::NotificationProcessing, Win32cr::Foundation::BSTR, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationNotificationEventHandler, lpVtbl : IUIAutomationNotificationEventHandlerVtbl* do
    GUID = LibC::GUID.new(0xc7cb2637_u32, 0xe6c2_u16, 0x4d0c_u16, StaticArray[0x85_u8, 0xde_u8, 0x49_u8, 0x48_u8, 0xc0_u8, 0x21_u8, 0x75_u8, 0xc7_u8])
    def query_interface(this : IUIAutomationNotificationEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationNotificationEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationNotificationEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def handle_notification_event(this : IUIAutomationNotificationEventHandler*, sender : Void*, notificationKind : Win32cr::UI::Accessibility::NotificationKind, notificationProcessing : Win32cr::UI::Accessibility::NotificationProcessing, displayString : Win32cr::Foundation::BSTR, activityId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_notification_event.call(this, sender, notificationKind, notificationProcessing, displayString, activityId)
    end

  end

  @[Extern]
  record IUIAutomationInvokePatternVtbl,
    query_interface : Proc(IUIAutomationInvokePattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationInvokePattern*, UInt32),
    release : Proc(IUIAutomationInvokePattern*, UInt32),
    invoke : Proc(IUIAutomationInvokePattern*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationInvokePattern, lpVtbl : IUIAutomationInvokePatternVtbl* do
    GUID = LibC::GUID.new(0xfb377fbe_u32, 0x8ea6_u16, 0x46d5_u16, StaticArray[0x9c_u8, 0x73_u8, 0x64_u8, 0x99_u8, 0x64_u8, 0x2d_u8, 0x30_u8, 0x59_u8])
    def query_interface(this : IUIAutomationInvokePattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationInvokePattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationInvokePattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def invoke(this : IUIAutomationInvokePattern*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.invoke.call(this)
    end

  end

  @[Extern]
  record IUIAutomationDockPatternVtbl,
    query_interface : Proc(IUIAutomationDockPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationDockPattern*, UInt32),
    release : Proc(IUIAutomationDockPattern*, UInt32),
    set_dock_position : Proc(IUIAutomationDockPattern*, Win32cr::UI::Accessibility::DockPosition, Win32cr::Foundation::HRESULT),
    get_CurrentDockPosition : Proc(IUIAutomationDockPattern*, Win32cr::UI::Accessibility::DockPosition*, Win32cr::Foundation::HRESULT),
    get_CachedDockPosition : Proc(IUIAutomationDockPattern*, Win32cr::UI::Accessibility::DockPosition*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationDockPattern, lpVtbl : IUIAutomationDockPatternVtbl* do
    GUID = LibC::GUID.new(0xfde5ef97_u32, 0x1464_u16, 0x48f6_u16, StaticArray[0x90_u8, 0xbf_u8, 0x43_u8, 0xd0_u8, 0x94_u8, 0x8e_u8, 0x86_u8, 0xec_u8])
    def query_interface(this : IUIAutomationDockPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationDockPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationDockPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_dock_position(this : IUIAutomationDockPattern*, dockPos : Win32cr::UI::Accessibility::DockPosition) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_dock_position.call(this, dockPos)
    end
    def get_CurrentDockPosition(this : IUIAutomationDockPattern*, retVal : Win32cr::UI::Accessibility::DockPosition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDockPosition.call(this, retVal)
    end
    def get_CachedDockPosition(this : IUIAutomationDockPattern*, retVal : Win32cr::UI::Accessibility::DockPosition*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDockPosition.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationExpandCollapsePatternVtbl,
    query_interface : Proc(IUIAutomationExpandCollapsePattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationExpandCollapsePattern*, UInt32),
    release : Proc(IUIAutomationExpandCollapsePattern*, UInt32),
    expand : Proc(IUIAutomationExpandCollapsePattern*, Win32cr::Foundation::HRESULT),
    collapse : Proc(IUIAutomationExpandCollapsePattern*, Win32cr::Foundation::HRESULT),
    get_CurrentExpandCollapseState : Proc(IUIAutomationExpandCollapsePattern*, Win32cr::UI::Accessibility::ExpandCollapseState*, Win32cr::Foundation::HRESULT),
    get_CachedExpandCollapseState : Proc(IUIAutomationExpandCollapsePattern*, Win32cr::UI::Accessibility::ExpandCollapseState*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationExpandCollapsePattern, lpVtbl : IUIAutomationExpandCollapsePatternVtbl* do
    GUID = LibC::GUID.new(0x619be086_u32, 0x1f4e_u16, 0x4ee4_u16, StaticArray[0xba_u8, 0xfa_u8, 0x21_u8, 0x1_u8, 0x28_u8, 0x73_u8, 0x87_u8, 0x30_u8])
    def query_interface(this : IUIAutomationExpandCollapsePattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationExpandCollapsePattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationExpandCollapsePattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def expand(this : IUIAutomationExpandCollapsePattern*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand.call(this)
    end
    def collapse(this : IUIAutomationExpandCollapsePattern*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.collapse.call(this)
    end
    def get_CurrentExpandCollapseState(this : IUIAutomationExpandCollapsePattern*, retVal : Win32cr::UI::Accessibility::ExpandCollapseState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentExpandCollapseState.call(this, retVal)
    end
    def get_CachedExpandCollapseState(this : IUIAutomationExpandCollapsePattern*, retVal : Win32cr::UI::Accessibility::ExpandCollapseState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedExpandCollapseState.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationGridPatternVtbl,
    query_interface : Proc(IUIAutomationGridPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationGridPattern*, UInt32),
    release : Proc(IUIAutomationGridPattern*, UInt32),
    get_item : Proc(IUIAutomationGridPattern*, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentRowCount : Proc(IUIAutomationGridPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentColumnCount : Proc(IUIAutomationGridPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedRowCount : Proc(IUIAutomationGridPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedColumnCount : Proc(IUIAutomationGridPattern*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationGridPattern, lpVtbl : IUIAutomationGridPatternVtbl* do
    GUID = LibC::GUID.new(0x414c3cdc_u32, 0x856b_u16, 0x4f5b_u16, StaticArray[0x85_u8, 0x38_u8, 0x31_u8, 0x31_u8, 0xc6_u8, 0x30_u8, 0x25_u8, 0x50_u8])
    def query_interface(this : IUIAutomationGridPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationGridPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationGridPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_item(this : IUIAutomationGridPattern*, row : Int32, column : Int32, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item.call(this, row, column, element)
    end
    def get_CurrentRowCount(this : IUIAutomationGridPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentRowCount.call(this, retVal)
    end
    def get_CurrentColumnCount(this : IUIAutomationGridPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentColumnCount.call(this, retVal)
    end
    def get_CachedRowCount(this : IUIAutomationGridPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedRowCount.call(this, retVal)
    end
    def get_CachedColumnCount(this : IUIAutomationGridPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedColumnCount.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationGridItemPatternVtbl,
    query_interface : Proc(IUIAutomationGridItemPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationGridItemPattern*, UInt32),
    release : Proc(IUIAutomationGridItemPattern*, UInt32),
    get_CurrentContainingGrid : Proc(IUIAutomationGridItemPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentRow : Proc(IUIAutomationGridItemPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentColumn : Proc(IUIAutomationGridItemPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentRowSpan : Proc(IUIAutomationGridItemPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentColumnSpan : Proc(IUIAutomationGridItemPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedContainingGrid : Proc(IUIAutomationGridItemPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedRow : Proc(IUIAutomationGridItemPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedColumn : Proc(IUIAutomationGridItemPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedRowSpan : Proc(IUIAutomationGridItemPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedColumnSpan : Proc(IUIAutomationGridItemPattern*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationGridItemPattern, lpVtbl : IUIAutomationGridItemPatternVtbl* do
    GUID = LibC::GUID.new(0x78f8ef57_u32, 0x66c3_u16, 0x4e09_u16, StaticArray[0xbd_u8, 0x7c_u8, 0xe7_u8, 0x9b_u8, 0x20_u8, 0x4_u8, 0x89_u8, 0x4d_u8])
    def query_interface(this : IUIAutomationGridItemPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationGridItemPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationGridItemPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_CurrentContainingGrid(this : IUIAutomationGridItemPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentContainingGrid.call(this, retVal)
    end
    def get_CurrentRow(this : IUIAutomationGridItemPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentRow.call(this, retVal)
    end
    def get_CurrentColumn(this : IUIAutomationGridItemPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentColumn.call(this, retVal)
    end
    def get_CurrentRowSpan(this : IUIAutomationGridItemPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentRowSpan.call(this, retVal)
    end
    def get_CurrentColumnSpan(this : IUIAutomationGridItemPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentColumnSpan.call(this, retVal)
    end
    def get_CachedContainingGrid(this : IUIAutomationGridItemPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedContainingGrid.call(this, retVal)
    end
    def get_CachedRow(this : IUIAutomationGridItemPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedRow.call(this, retVal)
    end
    def get_CachedColumn(this : IUIAutomationGridItemPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedColumn.call(this, retVal)
    end
    def get_CachedRowSpan(this : IUIAutomationGridItemPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedRowSpan.call(this, retVal)
    end
    def get_CachedColumnSpan(this : IUIAutomationGridItemPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedColumnSpan.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationMultipleViewPatternVtbl,
    query_interface : Proc(IUIAutomationMultipleViewPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationMultipleViewPattern*, UInt32),
    release : Proc(IUIAutomationMultipleViewPattern*, UInt32),
    get_view_name : Proc(IUIAutomationMultipleViewPattern*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    set_current_view : Proc(IUIAutomationMultipleViewPattern*, Int32, Win32cr::Foundation::HRESULT),
    get_CurrentCurrentView : Proc(IUIAutomationMultipleViewPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_current_supported_views : Proc(IUIAutomationMultipleViewPattern*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CachedCurrentView : Proc(IUIAutomationMultipleViewPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_cached_supported_views : Proc(IUIAutomationMultipleViewPattern*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationMultipleViewPattern, lpVtbl : IUIAutomationMultipleViewPatternVtbl* do
    GUID = LibC::GUID.new(0x8d253c91_u32, 0x1dc5_u16, 0x4bb5_u16, StaticArray[0xb1_u8, 0x8f_u8, 0xad_u8, 0xe1_u8, 0x6f_u8, 0xa4_u8, 0x95_u8, 0xe8_u8])
    def query_interface(this : IUIAutomationMultipleViewPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationMultipleViewPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationMultipleViewPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_view_name(this : IUIAutomationMultipleViewPattern*, view : Int32, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_view_name.call(this, view, name)
    end
    def set_current_view(this : IUIAutomationMultipleViewPattern*, view : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_current_view.call(this, view)
    end
    def get_CurrentCurrentView(this : IUIAutomationMultipleViewPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCurrentView.call(this, retVal)
    end
    def get_current_supported_views(this : IUIAutomationMultipleViewPattern*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_supported_views.call(this, retVal)
    end
    def get_CachedCurrentView(this : IUIAutomationMultipleViewPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCurrentView.call(this, retVal)
    end
    def get_cached_supported_views(this : IUIAutomationMultipleViewPattern*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_supported_views.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationObjectModelPatternVtbl,
    query_interface : Proc(IUIAutomationObjectModelPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationObjectModelPattern*, UInt32),
    release : Proc(IUIAutomationObjectModelPattern*, UInt32),
    get_underlying_object_model : Proc(IUIAutomationObjectModelPattern*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationObjectModelPattern, lpVtbl : IUIAutomationObjectModelPatternVtbl* do
    GUID = LibC::GUID.new(0x71c284b3_u32, 0xc14d_u16, 0x4d14_u16, StaticArray[0x98_u8, 0x1e_u8, 0x19_u8, 0x75_u8, 0x1b_u8, 0xd_u8, 0x75_u8, 0x6d_u8])
    def query_interface(this : IUIAutomationObjectModelPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationObjectModelPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationObjectModelPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_underlying_object_model(this : IUIAutomationObjectModelPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_underlying_object_model.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationRangeValuePatternVtbl,
    query_interface : Proc(IUIAutomationRangeValuePattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationRangeValuePattern*, UInt32),
    release : Proc(IUIAutomationRangeValuePattern*, UInt32),
    set_value : Proc(IUIAutomationRangeValuePattern*, Float64, Win32cr::Foundation::HRESULT),
    get_CurrentValue : Proc(IUIAutomationRangeValuePattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CurrentIsReadOnly : Proc(IUIAutomationRangeValuePattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentMaximum : Proc(IUIAutomationRangeValuePattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CurrentMinimum : Proc(IUIAutomationRangeValuePattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CurrentLargeChange : Proc(IUIAutomationRangeValuePattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CurrentSmallChange : Proc(IUIAutomationRangeValuePattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CachedValue : Proc(IUIAutomationRangeValuePattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CachedIsReadOnly : Proc(IUIAutomationRangeValuePattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedMaximum : Proc(IUIAutomationRangeValuePattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CachedMinimum : Proc(IUIAutomationRangeValuePattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CachedLargeChange : Proc(IUIAutomationRangeValuePattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CachedSmallChange : Proc(IUIAutomationRangeValuePattern*, Float64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationRangeValuePattern, lpVtbl : IUIAutomationRangeValuePatternVtbl* do
    GUID = LibC::GUID.new(0x59213f4f_u32, 0x7346_u16, 0x49e5_u16, StaticArray[0xb1_u8, 0x20_u8, 0x80_u8, 0x55_u8, 0x59_u8, 0x87_u8, 0xa1_u8, 0x48_u8])
    def query_interface(this : IUIAutomationRangeValuePattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationRangeValuePattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationRangeValuePattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_value(this : IUIAutomationRangeValuePattern*, val : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, val)
    end
    def get_CurrentValue(this : IUIAutomationRangeValuePattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentValue.call(this, retVal)
    end
    def get_CurrentIsReadOnly(this : IUIAutomationRangeValuePattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsReadOnly.call(this, retVal)
    end
    def get_CurrentMaximum(this : IUIAutomationRangeValuePattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentMaximum.call(this, retVal)
    end
    def get_CurrentMinimum(this : IUIAutomationRangeValuePattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentMinimum.call(this, retVal)
    end
    def get_CurrentLargeChange(this : IUIAutomationRangeValuePattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLargeChange.call(this, retVal)
    end
    def get_CurrentSmallChange(this : IUIAutomationRangeValuePattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentSmallChange.call(this, retVal)
    end
    def get_CachedValue(this : IUIAutomationRangeValuePattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedValue.call(this, retVal)
    end
    def get_CachedIsReadOnly(this : IUIAutomationRangeValuePattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsReadOnly.call(this, retVal)
    end
    def get_CachedMaximum(this : IUIAutomationRangeValuePattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedMaximum.call(this, retVal)
    end
    def get_CachedMinimum(this : IUIAutomationRangeValuePattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedMinimum.call(this, retVal)
    end
    def get_CachedLargeChange(this : IUIAutomationRangeValuePattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLargeChange.call(this, retVal)
    end
    def get_CachedSmallChange(this : IUIAutomationRangeValuePattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedSmallChange.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationScrollPatternVtbl,
    query_interface : Proc(IUIAutomationScrollPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationScrollPattern*, UInt32),
    release : Proc(IUIAutomationScrollPattern*, UInt32),
    scroll : Proc(IUIAutomationScrollPattern*, Win32cr::UI::Accessibility::ScrollAmount, Win32cr::UI::Accessibility::ScrollAmount, Win32cr::Foundation::HRESULT),
    set_scroll_percent : Proc(IUIAutomationScrollPattern*, Float64, Float64, Win32cr::Foundation::HRESULT),
    get_CurrentHorizontalScrollPercent : Proc(IUIAutomationScrollPattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CurrentVerticalScrollPercent : Proc(IUIAutomationScrollPattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CurrentHorizontalViewSize : Proc(IUIAutomationScrollPattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CurrentVerticalViewSize : Proc(IUIAutomationScrollPattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CurrentHorizontallyScrollable : Proc(IUIAutomationScrollPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentVerticallyScrollable : Proc(IUIAutomationScrollPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedHorizontalScrollPercent : Proc(IUIAutomationScrollPattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CachedVerticalScrollPercent : Proc(IUIAutomationScrollPattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CachedHorizontalViewSize : Proc(IUIAutomationScrollPattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CachedVerticalViewSize : Proc(IUIAutomationScrollPattern*, Float64*, Win32cr::Foundation::HRESULT),
    get_CachedHorizontallyScrollable : Proc(IUIAutomationScrollPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedVerticallyScrollable : Proc(IUIAutomationScrollPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationScrollPattern, lpVtbl : IUIAutomationScrollPatternVtbl* do
    GUID = LibC::GUID.new(0x88f4d42a_u32, 0xe881_u16, 0x459d_u16, StaticArray[0xa7_u8, 0x7c_u8, 0x73_u8, 0xbb_u8, 0xbb_u8, 0x7e_u8, 0x2_u8, 0xdc_u8])
    def query_interface(this : IUIAutomationScrollPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationScrollPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationScrollPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def scroll(this : IUIAutomationScrollPattern*, horizontalAmount : Win32cr::UI::Accessibility::ScrollAmount, verticalAmount : Win32cr::UI::Accessibility::ScrollAmount) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll.call(this, horizontalAmount, verticalAmount)
    end
    def set_scroll_percent(this : IUIAutomationScrollPattern*, horizontalPercent : Float64, verticalPercent : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_scroll_percent.call(this, horizontalPercent, verticalPercent)
    end
    def get_CurrentHorizontalScrollPercent(this : IUIAutomationScrollPattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHorizontalScrollPercent.call(this, retVal)
    end
    def get_CurrentVerticalScrollPercent(this : IUIAutomationScrollPattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentVerticalScrollPercent.call(this, retVal)
    end
    def get_CurrentHorizontalViewSize(this : IUIAutomationScrollPattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHorizontalViewSize.call(this, retVal)
    end
    def get_CurrentVerticalViewSize(this : IUIAutomationScrollPattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentVerticalViewSize.call(this, retVal)
    end
    def get_CurrentHorizontallyScrollable(this : IUIAutomationScrollPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHorizontallyScrollable.call(this, retVal)
    end
    def get_CurrentVerticallyScrollable(this : IUIAutomationScrollPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentVerticallyScrollable.call(this, retVal)
    end
    def get_CachedHorizontalScrollPercent(this : IUIAutomationScrollPattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHorizontalScrollPercent.call(this, retVal)
    end
    def get_CachedVerticalScrollPercent(this : IUIAutomationScrollPattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedVerticalScrollPercent.call(this, retVal)
    end
    def get_CachedHorizontalViewSize(this : IUIAutomationScrollPattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHorizontalViewSize.call(this, retVal)
    end
    def get_CachedVerticalViewSize(this : IUIAutomationScrollPattern*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedVerticalViewSize.call(this, retVal)
    end
    def get_CachedHorizontallyScrollable(this : IUIAutomationScrollPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHorizontallyScrollable.call(this, retVal)
    end
    def get_CachedVerticallyScrollable(this : IUIAutomationScrollPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedVerticallyScrollable.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationScrollItemPatternVtbl,
    query_interface : Proc(IUIAutomationScrollItemPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationScrollItemPattern*, UInt32),
    release : Proc(IUIAutomationScrollItemPattern*, UInt32),
    scroll_into_view : Proc(IUIAutomationScrollItemPattern*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationScrollItemPattern, lpVtbl : IUIAutomationScrollItemPatternVtbl* do
    GUID = LibC::GUID.new(0xb488300f_u32, 0xd015_u16, 0x4f19_u16, StaticArray[0x9c_u8, 0x29_u8, 0xbb_u8, 0x59_u8, 0x5e_u8, 0x36_u8, 0x45_u8, 0xef_u8])
    def query_interface(this : IUIAutomationScrollItemPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationScrollItemPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationScrollItemPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def scroll_into_view(this : IUIAutomationScrollItemPattern*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll_into_view.call(this)
    end

  end

  @[Extern]
  record IUIAutomationSelectionPatternVtbl,
    query_interface : Proc(IUIAutomationSelectionPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationSelectionPattern*, UInt32),
    release : Proc(IUIAutomationSelectionPattern*, UInt32),
    get_current_selection : Proc(IUIAutomationSelectionPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentCanSelectMultiple : Proc(IUIAutomationSelectionPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsSelectionRequired : Proc(IUIAutomationSelectionPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_cached_selection : Proc(IUIAutomationSelectionPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedCanSelectMultiple : Proc(IUIAutomationSelectionPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsSelectionRequired : Proc(IUIAutomationSelectionPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationSelectionPattern, lpVtbl : IUIAutomationSelectionPatternVtbl* do
    GUID = LibC::GUID.new(0x5ed5202e_u32, 0xb2ac_u16, 0x47a6_u16, StaticArray[0xb6_u8, 0x38_u8, 0x4b_u8, 0xb_u8, 0xf1_u8, 0x40_u8, 0xd7_u8, 0x8e_u8])
    def query_interface(this : IUIAutomationSelectionPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationSelectionPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationSelectionPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current_selection(this : IUIAutomationSelectionPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_selection.call(this, retVal)
    end
    def get_CurrentCanSelectMultiple(this : IUIAutomationSelectionPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCanSelectMultiple.call(this, retVal)
    end
    def get_CurrentIsSelectionRequired(this : IUIAutomationSelectionPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsSelectionRequired.call(this, retVal)
    end
    def get_cached_selection(this : IUIAutomationSelectionPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_selection.call(this, retVal)
    end
    def get_CachedCanSelectMultiple(this : IUIAutomationSelectionPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCanSelectMultiple.call(this, retVal)
    end
    def get_CachedIsSelectionRequired(this : IUIAutomationSelectionPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsSelectionRequired.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationSelectionPattern2Vtbl,
    query_interface : Proc(IUIAutomationSelectionPattern2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationSelectionPattern2*, UInt32),
    release : Proc(IUIAutomationSelectionPattern2*, UInt32),
    get_current_selection : Proc(IUIAutomationSelectionPattern2*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentCanSelectMultiple : Proc(IUIAutomationSelectionPattern2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsSelectionRequired : Proc(IUIAutomationSelectionPattern2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_cached_selection : Proc(IUIAutomationSelectionPattern2*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedCanSelectMultiple : Proc(IUIAutomationSelectionPattern2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsSelectionRequired : Proc(IUIAutomationSelectionPattern2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentFirstSelectedItem : Proc(IUIAutomationSelectionPattern2*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentLastSelectedItem : Proc(IUIAutomationSelectionPattern2*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentCurrentSelectedItem : Proc(IUIAutomationSelectionPattern2*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentItemCount : Proc(IUIAutomationSelectionPattern2*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedFirstSelectedItem : Proc(IUIAutomationSelectionPattern2*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedLastSelectedItem : Proc(IUIAutomationSelectionPattern2*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedCurrentSelectedItem : Proc(IUIAutomationSelectionPattern2*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedItemCount : Proc(IUIAutomationSelectionPattern2*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationSelectionPattern2, lpVtbl : IUIAutomationSelectionPattern2Vtbl* do
    GUID = LibC::GUID.new(0x532bfae_u32, 0xc011_u16, 0x4e32_u16, StaticArray[0xa3_u8, 0x43_u8, 0x6d_u8, 0x64_u8, 0x2d_u8, 0x79_u8, 0x85_u8, 0x55_u8])
    def query_interface(this : IUIAutomationSelectionPattern2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationSelectionPattern2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationSelectionPattern2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current_selection(this : IUIAutomationSelectionPattern2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_selection.call(this, retVal)
    end
    def get_CurrentCanSelectMultiple(this : IUIAutomationSelectionPattern2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCanSelectMultiple.call(this, retVal)
    end
    def get_CurrentIsSelectionRequired(this : IUIAutomationSelectionPattern2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsSelectionRequired.call(this, retVal)
    end
    def get_cached_selection(this : IUIAutomationSelectionPattern2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_selection.call(this, retVal)
    end
    def get_CachedCanSelectMultiple(this : IUIAutomationSelectionPattern2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCanSelectMultiple.call(this, retVal)
    end
    def get_CachedIsSelectionRequired(this : IUIAutomationSelectionPattern2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsSelectionRequired.call(this, retVal)
    end
    def get_CurrentFirstSelectedItem(this : IUIAutomationSelectionPattern2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFirstSelectedItem.call(this, retVal)
    end
    def get_CurrentLastSelectedItem(this : IUIAutomationSelectionPattern2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLastSelectedItem.call(this, retVal)
    end
    def get_CurrentCurrentSelectedItem(this : IUIAutomationSelectionPattern2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCurrentSelectedItem.call(this, retVal)
    end
    def get_CurrentItemCount(this : IUIAutomationSelectionPattern2*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemCount.call(this, retVal)
    end
    def get_CachedFirstSelectedItem(this : IUIAutomationSelectionPattern2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFirstSelectedItem.call(this, retVal)
    end
    def get_CachedLastSelectedItem(this : IUIAutomationSelectionPattern2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLastSelectedItem.call(this, retVal)
    end
    def get_CachedCurrentSelectedItem(this : IUIAutomationSelectionPattern2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCurrentSelectedItem.call(this, retVal)
    end
    def get_CachedItemCount(this : IUIAutomationSelectionPattern2*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemCount.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationSelectionItemPatternVtbl,
    query_interface : Proc(IUIAutomationSelectionItemPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationSelectionItemPattern*, UInt32),
    release : Proc(IUIAutomationSelectionItemPattern*, UInt32),
    select__ : Proc(IUIAutomationSelectionItemPattern*, Win32cr::Foundation::HRESULT),
    add_to_selection : Proc(IUIAutomationSelectionItemPattern*, Win32cr::Foundation::HRESULT),
    remove_from_selection : Proc(IUIAutomationSelectionItemPattern*, Win32cr::Foundation::HRESULT),
    get_CurrentIsSelected : Proc(IUIAutomationSelectionItemPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentSelectionContainer : Proc(IUIAutomationSelectionItemPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedIsSelected : Proc(IUIAutomationSelectionItemPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedSelectionContainer : Proc(IUIAutomationSelectionItemPattern*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationSelectionItemPattern, lpVtbl : IUIAutomationSelectionItemPatternVtbl* do
    GUID = LibC::GUID.new(0xa8efa66a_u32, 0xfda_u16, 0x421a_u16, StaticArray[0x91_u8, 0x94_u8, 0x38_u8, 0x2_u8, 0x1f_u8, 0x35_u8, 0x78_u8, 0xea_u8])
    def query_interface(this : IUIAutomationSelectionItemPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationSelectionItemPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationSelectionItemPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def select__(this : IUIAutomationSelectionItemPattern*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this)
    end
    def add_to_selection(this : IUIAutomationSelectionItemPattern*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_to_selection.call(this)
    end
    def remove_from_selection(this : IUIAutomationSelectionItemPattern*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_from_selection.call(this)
    end
    def get_CurrentIsSelected(this : IUIAutomationSelectionItemPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsSelected.call(this, retVal)
    end
    def get_CurrentSelectionContainer(this : IUIAutomationSelectionItemPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentSelectionContainer.call(this, retVal)
    end
    def get_CachedIsSelected(this : IUIAutomationSelectionItemPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsSelected.call(this, retVal)
    end
    def get_CachedSelectionContainer(this : IUIAutomationSelectionItemPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedSelectionContainer.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationSynchronizedInputPatternVtbl,
    query_interface : Proc(IUIAutomationSynchronizedInputPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationSynchronizedInputPattern*, UInt32),
    release : Proc(IUIAutomationSynchronizedInputPattern*, UInt32),
    start_listening : Proc(IUIAutomationSynchronizedInputPattern*, Win32cr::UI::Accessibility::SynchronizedInputType, Win32cr::Foundation::HRESULT),
    cancel : Proc(IUIAutomationSynchronizedInputPattern*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationSynchronizedInputPattern, lpVtbl : IUIAutomationSynchronizedInputPatternVtbl* do
    GUID = LibC::GUID.new(0x2233be0b_u32, 0xafb7_u16, 0x448b_u16, StaticArray[0x9f_u8, 0xda_u8, 0x3b_u8, 0x37_u8, 0x8a_u8, 0xa5_u8, 0xea_u8, 0xe1_u8])
    def query_interface(this : IUIAutomationSynchronizedInputPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationSynchronizedInputPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationSynchronizedInputPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def start_listening(this : IUIAutomationSynchronizedInputPattern*, inputType : Win32cr::UI::Accessibility::SynchronizedInputType) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.start_listening.call(this, inputType)
    end
    def cancel(this : IUIAutomationSynchronizedInputPattern*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.cancel.call(this)
    end

  end

  @[Extern]
  record IUIAutomationTablePatternVtbl,
    query_interface : Proc(IUIAutomationTablePattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTablePattern*, UInt32),
    release : Proc(IUIAutomationTablePattern*, UInt32),
    get_current_row_headers : Proc(IUIAutomationTablePattern*, Void**, Win32cr::Foundation::HRESULT),
    get_current_column_headers : Proc(IUIAutomationTablePattern*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentRowOrColumnMajor : Proc(IUIAutomationTablePattern*, Win32cr::UI::Accessibility::RowOrColumnMajor*, Win32cr::Foundation::HRESULT),
    get_cached_row_headers : Proc(IUIAutomationTablePattern*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_column_headers : Proc(IUIAutomationTablePattern*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedRowOrColumnMajor : Proc(IUIAutomationTablePattern*, Win32cr::UI::Accessibility::RowOrColumnMajor*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTablePattern, lpVtbl : IUIAutomationTablePatternVtbl* do
    GUID = LibC::GUID.new(0x620e691c_u32, 0xea96_u16, 0x4710_u16, StaticArray[0xa8_u8, 0x50_u8, 0x75_u8, 0x4b_u8, 0x24_u8, 0xce_u8, 0x24_u8, 0x17_u8])
    def query_interface(this : IUIAutomationTablePattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTablePattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTablePattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current_row_headers(this : IUIAutomationTablePattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_row_headers.call(this, retVal)
    end
    def get_current_column_headers(this : IUIAutomationTablePattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_column_headers.call(this, retVal)
    end
    def get_CurrentRowOrColumnMajor(this : IUIAutomationTablePattern*, retVal : Win32cr::UI::Accessibility::RowOrColumnMajor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentRowOrColumnMajor.call(this, retVal)
    end
    def get_cached_row_headers(this : IUIAutomationTablePattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_row_headers.call(this, retVal)
    end
    def get_cached_column_headers(this : IUIAutomationTablePattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_column_headers.call(this, retVal)
    end
    def get_CachedRowOrColumnMajor(this : IUIAutomationTablePattern*, retVal : Win32cr::UI::Accessibility::RowOrColumnMajor*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedRowOrColumnMajor.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationTableItemPatternVtbl,
    query_interface : Proc(IUIAutomationTableItemPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTableItemPattern*, UInt32),
    release : Proc(IUIAutomationTableItemPattern*, UInt32),
    get_current_row_header_items : Proc(IUIAutomationTableItemPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_current_column_header_items : Proc(IUIAutomationTableItemPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_row_header_items : Proc(IUIAutomationTableItemPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_column_header_items : Proc(IUIAutomationTableItemPattern*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTableItemPattern, lpVtbl : IUIAutomationTableItemPatternVtbl* do
    GUID = LibC::GUID.new(0xb964eb3_u32, 0xef2e_u16, 0x4464_u16, StaticArray[0x9c_u8, 0x79_u8, 0x61_u8, 0xd6_u8, 0x17_u8, 0x37_u8, 0xa2_u8, 0x7e_u8])
    def query_interface(this : IUIAutomationTableItemPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTableItemPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTableItemPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_current_row_header_items(this : IUIAutomationTableItemPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_row_header_items.call(this, retVal)
    end
    def get_current_column_header_items(this : IUIAutomationTableItemPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_column_header_items.call(this, retVal)
    end
    def get_cached_row_header_items(this : IUIAutomationTableItemPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_row_header_items.call(this, retVal)
    end
    def get_cached_column_header_items(this : IUIAutomationTableItemPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_column_header_items.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationTogglePatternVtbl,
    query_interface : Proc(IUIAutomationTogglePattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTogglePattern*, UInt32),
    release : Proc(IUIAutomationTogglePattern*, UInt32),
    toggle : Proc(IUIAutomationTogglePattern*, Win32cr::Foundation::HRESULT),
    get_CurrentToggleState : Proc(IUIAutomationTogglePattern*, Win32cr::UI::Accessibility::ToggleState*, Win32cr::Foundation::HRESULT),
    get_CachedToggleState : Proc(IUIAutomationTogglePattern*, Win32cr::UI::Accessibility::ToggleState*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTogglePattern, lpVtbl : IUIAutomationTogglePatternVtbl* do
    GUID = LibC::GUID.new(0x94cf8058_u32, 0x9b8d_u16, 0x4ab9_u16, StaticArray[0x8b_u8, 0xfd_u8, 0x4c_u8, 0xd0_u8, 0xa3_u8, 0x3c_u8, 0x8c_u8, 0x70_u8])
    def query_interface(this : IUIAutomationTogglePattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTogglePattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTogglePattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def toggle(this : IUIAutomationTogglePattern*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.toggle.call(this)
    end
    def get_CurrentToggleState(this : IUIAutomationTogglePattern*, retVal : Win32cr::UI::Accessibility::ToggleState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentToggleState.call(this, retVal)
    end
    def get_CachedToggleState(this : IUIAutomationTogglePattern*, retVal : Win32cr::UI::Accessibility::ToggleState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedToggleState.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationTransformPatternVtbl,
    query_interface : Proc(IUIAutomationTransformPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTransformPattern*, UInt32),
    release : Proc(IUIAutomationTransformPattern*, UInt32),
    move : Proc(IUIAutomationTransformPattern*, Float64, Float64, Win32cr::Foundation::HRESULT),
    resize : Proc(IUIAutomationTransformPattern*, Float64, Float64, Win32cr::Foundation::HRESULT),
    rotate : Proc(IUIAutomationTransformPattern*, Float64, Win32cr::Foundation::HRESULT),
    get_CurrentCanMove : Proc(IUIAutomationTransformPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentCanResize : Proc(IUIAutomationTransformPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentCanRotate : Proc(IUIAutomationTransformPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedCanMove : Proc(IUIAutomationTransformPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedCanResize : Proc(IUIAutomationTransformPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedCanRotate : Proc(IUIAutomationTransformPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTransformPattern, lpVtbl : IUIAutomationTransformPatternVtbl* do
    GUID = LibC::GUID.new(0xa9b55844_u32, 0xa55d_u16, 0x4ef0_u16, StaticArray[0x92_u8, 0x6d_u8, 0x56_u8, 0x9c_u8, 0x16_u8, 0xff_u8, 0x89_u8, 0xbb_u8])
    def query_interface(this : IUIAutomationTransformPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTransformPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTransformPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def move(this : IUIAutomationTransformPattern*, x : Float64, y : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, x, y)
    end
    def resize(this : IUIAutomationTransformPattern*, width : Float64, height : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize.call(this, width, height)
    end
    def rotate(this : IUIAutomationTransformPattern*, degrees : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rotate.call(this, degrees)
    end
    def get_CurrentCanMove(this : IUIAutomationTransformPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCanMove.call(this, retVal)
    end
    def get_CurrentCanResize(this : IUIAutomationTransformPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCanResize.call(this, retVal)
    end
    def get_CurrentCanRotate(this : IUIAutomationTransformPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCanRotate.call(this, retVal)
    end
    def get_CachedCanMove(this : IUIAutomationTransformPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCanMove.call(this, retVal)
    end
    def get_CachedCanResize(this : IUIAutomationTransformPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCanResize.call(this, retVal)
    end
    def get_CachedCanRotate(this : IUIAutomationTransformPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCanRotate.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationValuePatternVtbl,
    query_interface : Proc(IUIAutomationValuePattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationValuePattern*, UInt32),
    release : Proc(IUIAutomationValuePattern*, UInt32),
    set_value : Proc(IUIAutomationValuePattern*, Win32cr::Foundation::BSTR, Win32cr::Foundation::HRESULT),
    get_CurrentValue : Proc(IUIAutomationValuePattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsReadOnly : Proc(IUIAutomationValuePattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedValue : Proc(IUIAutomationValuePattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsReadOnly : Proc(IUIAutomationValuePattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationValuePattern, lpVtbl : IUIAutomationValuePatternVtbl* do
    GUID = LibC::GUID.new(0xa94cd8b1_u32, 0x844_u16, 0x4cd6_u16, StaticArray[0x9d_u8, 0x2d_u8, 0x64_u8, 0x5_u8, 0x37_u8, 0xab_u8, 0x39_u8, 0xe9_u8])
    def query_interface(this : IUIAutomationValuePattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationValuePattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationValuePattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_value(this : IUIAutomationValuePattern*, val : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, val)
    end
    def get_CurrentValue(this : IUIAutomationValuePattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentValue.call(this, retVal)
    end
    def get_CurrentIsReadOnly(this : IUIAutomationValuePattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsReadOnly.call(this, retVal)
    end
    def get_CachedValue(this : IUIAutomationValuePattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedValue.call(this, retVal)
    end
    def get_CachedIsReadOnly(this : IUIAutomationValuePattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsReadOnly.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationWindowPatternVtbl,
    query_interface : Proc(IUIAutomationWindowPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationWindowPattern*, UInt32),
    release : Proc(IUIAutomationWindowPattern*, UInt32),
    close : Proc(IUIAutomationWindowPattern*, Win32cr::Foundation::HRESULT),
    wait_for_input_idle : Proc(IUIAutomationWindowPattern*, Int32, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    set_window_visual_state : Proc(IUIAutomationWindowPattern*, Win32cr::UI::Accessibility::WindowVisualState, Win32cr::Foundation::HRESULT),
    get_CurrentCanMaximize : Proc(IUIAutomationWindowPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentCanMinimize : Proc(IUIAutomationWindowPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsModal : Proc(IUIAutomationWindowPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsTopmost : Proc(IUIAutomationWindowPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentWindowVisualState : Proc(IUIAutomationWindowPattern*, Win32cr::UI::Accessibility::WindowVisualState*, Win32cr::Foundation::HRESULT),
    get_CurrentWindowInteractionState : Proc(IUIAutomationWindowPattern*, Win32cr::UI::Accessibility::WindowInteractionState*, Win32cr::Foundation::HRESULT),
    get_CachedCanMaximize : Proc(IUIAutomationWindowPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedCanMinimize : Proc(IUIAutomationWindowPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsModal : Proc(IUIAutomationWindowPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsTopmost : Proc(IUIAutomationWindowPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedWindowVisualState : Proc(IUIAutomationWindowPattern*, Win32cr::UI::Accessibility::WindowVisualState*, Win32cr::Foundation::HRESULT),
    get_CachedWindowInteractionState : Proc(IUIAutomationWindowPattern*, Win32cr::UI::Accessibility::WindowInteractionState*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationWindowPattern, lpVtbl : IUIAutomationWindowPatternVtbl* do
    GUID = LibC::GUID.new(0xfaef453_u32, 0x9208_u16, 0x43ef_u16, StaticArray[0xbb_u8, 0xb2_u8, 0x3b_u8, 0x48_u8, 0x51_u8, 0x77_u8, 0x86_u8, 0x4f_u8])
    def query_interface(this : IUIAutomationWindowPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationWindowPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationWindowPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def close(this : IUIAutomationWindowPattern*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.close.call(this)
    end
    def wait_for_input_idle(this : IUIAutomationWindowPattern*, milliseconds : Int32, success : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.wait_for_input_idle.call(this, milliseconds, success)
    end
    def set_window_visual_state(this : IUIAutomationWindowPattern*, state : Win32cr::UI::Accessibility::WindowVisualState) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_window_visual_state.call(this, state)
    end
    def get_CurrentCanMaximize(this : IUIAutomationWindowPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCanMaximize.call(this, retVal)
    end
    def get_CurrentCanMinimize(this : IUIAutomationWindowPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCanMinimize.call(this, retVal)
    end
    def get_CurrentIsModal(this : IUIAutomationWindowPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsModal.call(this, retVal)
    end
    def get_CurrentIsTopmost(this : IUIAutomationWindowPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsTopmost.call(this, retVal)
    end
    def get_CurrentWindowVisualState(this : IUIAutomationWindowPattern*, retVal : Win32cr::UI::Accessibility::WindowVisualState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentWindowVisualState.call(this, retVal)
    end
    def get_CurrentWindowInteractionState(this : IUIAutomationWindowPattern*, retVal : Win32cr::UI::Accessibility::WindowInteractionState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentWindowInteractionState.call(this, retVal)
    end
    def get_CachedCanMaximize(this : IUIAutomationWindowPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCanMaximize.call(this, retVal)
    end
    def get_CachedCanMinimize(this : IUIAutomationWindowPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCanMinimize.call(this, retVal)
    end
    def get_CachedIsModal(this : IUIAutomationWindowPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsModal.call(this, retVal)
    end
    def get_CachedIsTopmost(this : IUIAutomationWindowPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsTopmost.call(this, retVal)
    end
    def get_CachedWindowVisualState(this : IUIAutomationWindowPattern*, retVal : Win32cr::UI::Accessibility::WindowVisualState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedWindowVisualState.call(this, retVal)
    end
    def get_CachedWindowInteractionState(this : IUIAutomationWindowPattern*, retVal : Win32cr::UI::Accessibility::WindowInteractionState*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedWindowInteractionState.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationTextRangeVtbl,
    query_interface : Proc(IUIAutomationTextRange*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTextRange*, UInt32),
    release : Proc(IUIAutomationTextRange*, UInt32),
    clone : Proc(IUIAutomationTextRange*, Void**, Win32cr::Foundation::HRESULT),
    compare : Proc(IUIAutomationTextRange*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    compare_endpoints : Proc(IUIAutomationTextRange*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Void*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Int32*, Win32cr::Foundation::HRESULT),
    expand_to_enclosing_unit : Proc(IUIAutomationTextRange*, Win32cr::UI::Accessibility::TextUnit, Win32cr::Foundation::HRESULT),
    find_attribute : Proc(IUIAutomationTextRange*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    find_text : Proc(IUIAutomationTextRange*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    get_attribute_value : Proc(IUIAutomationTextRange*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_bounding_rectangles : Proc(IUIAutomationTextRange*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_enclosing_element : Proc(IUIAutomationTextRange*, Void**, Win32cr::Foundation::HRESULT),
    get_text : Proc(IUIAutomationTextRange*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    move : Proc(IUIAutomationTextRange*, Win32cr::UI::Accessibility::TextUnit, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_endpoint_by_unit : Proc(IUIAutomationTextRange*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Win32cr::UI::Accessibility::TextUnit, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_endpoint_by_range : Proc(IUIAutomationTextRange*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Void*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Win32cr::Foundation::HRESULT),
    select__ : Proc(IUIAutomationTextRange*, Win32cr::Foundation::HRESULT),
    add_to_selection : Proc(IUIAutomationTextRange*, Win32cr::Foundation::HRESULT),
    remove_from_selection : Proc(IUIAutomationTextRange*, Win32cr::Foundation::HRESULT),
    scroll_into_view : Proc(IUIAutomationTextRange*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_children : Proc(IUIAutomationTextRange*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTextRange, lpVtbl : IUIAutomationTextRangeVtbl* do
    GUID = LibC::GUID.new(0xa543cc6a_u32, 0xf4ae_u16, 0x494b_u16, StaticArray[0x82_u8, 0x39_u8, 0xc8_u8, 0x14_u8, 0x48_u8, 0x11_u8, 0x87_u8, 0xa8_u8])
    def query_interface(this : IUIAutomationTextRange*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTextRange*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTextRange*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IUIAutomationTextRange*, clonedRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, clonedRange)
    end
    def compare(this : IUIAutomationTextRange*, range : Void*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare.call(this, range, areSame)
    end
    def compare_endpoints(this : IUIAutomationTextRange*, srcEndPoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, range : Void*, targetEndPoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, compValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_endpoints.call(this, srcEndPoint, range, targetEndPoint, compValue)
    end
    def expand_to_enclosing_unit(this : IUIAutomationTextRange*, textUnit : Win32cr::UI::Accessibility::TextUnit) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand_to_enclosing_unit.call(this, textUnit)
    end
    def find_attribute(this : IUIAutomationTextRange*, attr : Int32, val : Win32cr::System::Com::VARIANT, backward : Win32cr::Foundation::BOOL, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_attribute.call(this, attr, val, backward, found)
    end
    def find_text(this : IUIAutomationTextRange*, text : Win32cr::Foundation::BSTR, backward : Win32cr::Foundation::BOOL, ignoreCase : Win32cr::Foundation::BOOL, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text.call(this, text, backward, ignoreCase, found)
    end
    def get_attribute_value(this : IUIAutomationTextRange*, attr : Int32, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_value.call(this, attr, value)
    end
    def get_bounding_rectangles(this : IUIAutomationTextRange*, boundingRects : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bounding_rectangles.call(this, boundingRects)
    end
    def get_enclosing_element(this : IUIAutomationTextRange*, enclosingElement : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enclosing_element.call(this, enclosingElement)
    end
    def get_text(this : IUIAutomationTextRange*, maxLength : Int32, text : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, maxLength, text)
    end
    def move(this : IUIAutomationTextRange*, unit : Win32cr::UI::Accessibility::TextUnit, count : Int32, moved : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, unit, count, moved)
    end
    def move_endpoint_by_unit(this : IUIAutomationTextRange*, endpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, unit : Win32cr::UI::Accessibility::TextUnit, count : Int32, moved : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_endpoint_by_unit.call(this, endpoint, unit, count, moved)
    end
    def move_endpoint_by_range(this : IUIAutomationTextRange*, srcEndPoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, range : Void*, targetEndPoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_endpoint_by_range.call(this, srcEndPoint, range, targetEndPoint)
    end
    def select__(this : IUIAutomationTextRange*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this)
    end
    def add_to_selection(this : IUIAutomationTextRange*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_to_selection.call(this)
    end
    def remove_from_selection(this : IUIAutomationTextRange*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_from_selection.call(this)
    end
    def scroll_into_view(this : IUIAutomationTextRange*, alignToTop : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll_into_view.call(this, alignToTop)
    end
    def get_children(this : IUIAutomationTextRange*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_children.call(this, children)
    end

  end

  @[Extern]
  record IUIAutomationTextRange2Vtbl,
    query_interface : Proc(IUIAutomationTextRange2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTextRange2*, UInt32),
    release : Proc(IUIAutomationTextRange2*, UInt32),
    clone : Proc(IUIAutomationTextRange2*, Void**, Win32cr::Foundation::HRESULT),
    compare : Proc(IUIAutomationTextRange2*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    compare_endpoints : Proc(IUIAutomationTextRange2*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Void*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Int32*, Win32cr::Foundation::HRESULT),
    expand_to_enclosing_unit : Proc(IUIAutomationTextRange2*, Win32cr::UI::Accessibility::TextUnit, Win32cr::Foundation::HRESULT),
    find_attribute : Proc(IUIAutomationTextRange2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    find_text : Proc(IUIAutomationTextRange2*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    get_attribute_value : Proc(IUIAutomationTextRange2*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_bounding_rectangles : Proc(IUIAutomationTextRange2*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_enclosing_element : Proc(IUIAutomationTextRange2*, Void**, Win32cr::Foundation::HRESULT),
    get_text : Proc(IUIAutomationTextRange2*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    move : Proc(IUIAutomationTextRange2*, Win32cr::UI::Accessibility::TextUnit, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_endpoint_by_unit : Proc(IUIAutomationTextRange2*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Win32cr::UI::Accessibility::TextUnit, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_endpoint_by_range : Proc(IUIAutomationTextRange2*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Void*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Win32cr::Foundation::HRESULT),
    select__ : Proc(IUIAutomationTextRange2*, Win32cr::Foundation::HRESULT),
    add_to_selection : Proc(IUIAutomationTextRange2*, Win32cr::Foundation::HRESULT),
    remove_from_selection : Proc(IUIAutomationTextRange2*, Win32cr::Foundation::HRESULT),
    scroll_into_view : Proc(IUIAutomationTextRange2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_children : Proc(IUIAutomationTextRange2*, Void**, Win32cr::Foundation::HRESULT),
    show_context_menu : Proc(IUIAutomationTextRange2*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTextRange2, lpVtbl : IUIAutomationTextRange2Vtbl* do
    GUID = LibC::GUID.new(0xbb9b40e0_u32, 0x5e04_u16, 0x46bd_u16, StaticArray[0x9b_u8, 0xe0_u8, 0x4b_u8, 0x60_u8, 0x1b_u8, 0x9a_u8, 0xfa_u8, 0xd4_u8])
    def query_interface(this : IUIAutomationTextRange2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTextRange2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTextRange2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IUIAutomationTextRange2*, clonedRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, clonedRange)
    end
    def compare(this : IUIAutomationTextRange2*, range : Void*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare.call(this, range, areSame)
    end
    def compare_endpoints(this : IUIAutomationTextRange2*, srcEndPoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, range : Void*, targetEndPoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, compValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_endpoints.call(this, srcEndPoint, range, targetEndPoint, compValue)
    end
    def expand_to_enclosing_unit(this : IUIAutomationTextRange2*, textUnit : Win32cr::UI::Accessibility::TextUnit) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand_to_enclosing_unit.call(this, textUnit)
    end
    def find_attribute(this : IUIAutomationTextRange2*, attr : Int32, val : Win32cr::System::Com::VARIANT, backward : Win32cr::Foundation::BOOL, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_attribute.call(this, attr, val, backward, found)
    end
    def find_text(this : IUIAutomationTextRange2*, text : Win32cr::Foundation::BSTR, backward : Win32cr::Foundation::BOOL, ignoreCase : Win32cr::Foundation::BOOL, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text.call(this, text, backward, ignoreCase, found)
    end
    def get_attribute_value(this : IUIAutomationTextRange2*, attr : Int32, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_value.call(this, attr, value)
    end
    def get_bounding_rectangles(this : IUIAutomationTextRange2*, boundingRects : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bounding_rectangles.call(this, boundingRects)
    end
    def get_enclosing_element(this : IUIAutomationTextRange2*, enclosingElement : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enclosing_element.call(this, enclosingElement)
    end
    def get_text(this : IUIAutomationTextRange2*, maxLength : Int32, text : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, maxLength, text)
    end
    def move(this : IUIAutomationTextRange2*, unit : Win32cr::UI::Accessibility::TextUnit, count : Int32, moved : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, unit, count, moved)
    end
    def move_endpoint_by_unit(this : IUIAutomationTextRange2*, endpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, unit : Win32cr::UI::Accessibility::TextUnit, count : Int32, moved : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_endpoint_by_unit.call(this, endpoint, unit, count, moved)
    end
    def move_endpoint_by_range(this : IUIAutomationTextRange2*, srcEndPoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, range : Void*, targetEndPoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_endpoint_by_range.call(this, srcEndPoint, range, targetEndPoint)
    end
    def select__(this : IUIAutomationTextRange2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this)
    end
    def add_to_selection(this : IUIAutomationTextRange2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_to_selection.call(this)
    end
    def remove_from_selection(this : IUIAutomationTextRange2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_from_selection.call(this)
    end
    def scroll_into_view(this : IUIAutomationTextRange2*, alignToTop : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll_into_view.call(this, alignToTop)
    end
    def get_children(this : IUIAutomationTextRange2*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_children.call(this, children)
    end
    def show_context_menu(this : IUIAutomationTextRange2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_context_menu.call(this)
    end

  end

  @[Extern]
  record IUIAutomationTextRange3Vtbl,
    query_interface : Proc(IUIAutomationTextRange3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTextRange3*, UInt32),
    release : Proc(IUIAutomationTextRange3*, UInt32),
    clone : Proc(IUIAutomationTextRange3*, Void**, Win32cr::Foundation::HRESULT),
    compare : Proc(IUIAutomationTextRange3*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    compare_endpoints : Proc(IUIAutomationTextRange3*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Void*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Int32*, Win32cr::Foundation::HRESULT),
    expand_to_enclosing_unit : Proc(IUIAutomationTextRange3*, Win32cr::UI::Accessibility::TextUnit, Win32cr::Foundation::HRESULT),
    find_attribute : Proc(IUIAutomationTextRange3*, Int32, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    find_text : Proc(IUIAutomationTextRange3*, Win32cr::Foundation::BSTR, Win32cr::Foundation::BOOL, Win32cr::Foundation::BOOL, Void**, Win32cr::Foundation::HRESULT),
    get_attribute_value : Proc(IUIAutomationTextRange3*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_bounding_rectangles : Proc(IUIAutomationTextRange3*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_enclosing_element : Proc(IUIAutomationTextRange3*, Void**, Win32cr::Foundation::HRESULT),
    get_text : Proc(IUIAutomationTextRange3*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    move : Proc(IUIAutomationTextRange3*, Win32cr::UI::Accessibility::TextUnit, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_endpoint_by_unit : Proc(IUIAutomationTextRange3*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Win32cr::UI::Accessibility::TextUnit, Int32, Int32*, Win32cr::Foundation::HRESULT),
    move_endpoint_by_range : Proc(IUIAutomationTextRange3*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Void*, Win32cr::UI::Accessibility::TextPatternRangeEndpoint, Win32cr::Foundation::HRESULT),
    select__ : Proc(IUIAutomationTextRange3*, Win32cr::Foundation::HRESULT),
    add_to_selection : Proc(IUIAutomationTextRange3*, Win32cr::Foundation::HRESULT),
    remove_from_selection : Proc(IUIAutomationTextRange3*, Win32cr::Foundation::HRESULT),
    scroll_into_view : Proc(IUIAutomationTextRange3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_children : Proc(IUIAutomationTextRange3*, Void**, Win32cr::Foundation::HRESULT),
    show_context_menu : Proc(IUIAutomationTextRange3*, Win32cr::Foundation::HRESULT),
    get_enclosing_element_build_cache : Proc(IUIAutomationTextRange3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_children_build_cache : Proc(IUIAutomationTextRange3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_attribute_values : Proc(IUIAutomationTextRange3*, Int32*, Int32, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTextRange3, lpVtbl : IUIAutomationTextRange3Vtbl* do
    GUID = LibC::GUID.new(0x6a315d69_u32, 0x5512_u16, 0x4c2e_u16, StaticArray[0x85_u8, 0xf0_u8, 0x53_u8, 0xfc_u8, 0xe6_u8, 0xdd_u8, 0x4b_u8, 0xc2_u8])
    def query_interface(this : IUIAutomationTextRange3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTextRange3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTextRange3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def clone(this : IUIAutomationTextRange3*, clonedRange : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clone.call(this, clonedRange)
    end
    def compare(this : IUIAutomationTextRange3*, range : Void*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare.call(this, range, areSame)
    end
    def compare_endpoints(this : IUIAutomationTextRange3*, srcEndPoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, range : Void*, targetEndPoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, compValue : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_endpoints.call(this, srcEndPoint, range, targetEndPoint, compValue)
    end
    def expand_to_enclosing_unit(this : IUIAutomationTextRange3*, textUnit : Win32cr::UI::Accessibility::TextUnit) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.expand_to_enclosing_unit.call(this, textUnit)
    end
    def find_attribute(this : IUIAutomationTextRange3*, attr : Int32, val : Win32cr::System::Com::VARIANT, backward : Win32cr::Foundation::BOOL, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_attribute.call(this, attr, val, backward, found)
    end
    def find_text(this : IUIAutomationTextRange3*, text : Win32cr::Foundation::BSTR, backward : Win32cr::Foundation::BOOL, ignoreCase : Win32cr::Foundation::BOOL, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_text.call(this, text, backward, ignoreCase, found)
    end
    def get_attribute_value(this : IUIAutomationTextRange3*, attr : Int32, value : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_value.call(this, attr, value)
    end
    def get_bounding_rectangles(this : IUIAutomationTextRange3*, boundingRects : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_bounding_rectangles.call(this, boundingRects)
    end
    def get_enclosing_element(this : IUIAutomationTextRange3*, enclosingElement : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enclosing_element.call(this, enclosingElement)
    end
    def get_text(this : IUIAutomationTextRange3*, maxLength : Int32, text : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_text.call(this, maxLength, text)
    end
    def move(this : IUIAutomationTextRange3*, unit : Win32cr::UI::Accessibility::TextUnit, count : Int32, moved : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, unit, count, moved)
    end
    def move_endpoint_by_unit(this : IUIAutomationTextRange3*, endpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, unit : Win32cr::UI::Accessibility::TextUnit, count : Int32, moved : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_endpoint_by_unit.call(this, endpoint, unit, count, moved)
    end
    def move_endpoint_by_range(this : IUIAutomationTextRange3*, srcEndPoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, range : Void*, targetEndPoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_endpoint_by_range.call(this, srcEndPoint, range, targetEndPoint)
    end
    def select__(this : IUIAutomationTextRange3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this)
    end
    def add_to_selection(this : IUIAutomationTextRange3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_to_selection.call(this)
    end
    def remove_from_selection(this : IUIAutomationTextRange3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_from_selection.call(this)
    end
    def scroll_into_view(this : IUIAutomationTextRange3*, alignToTop : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.scroll_into_view.call(this, alignToTop)
    end
    def get_children(this : IUIAutomationTextRange3*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_children.call(this, children)
    end
    def show_context_menu(this : IUIAutomationTextRange3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_context_menu.call(this)
    end
    def get_enclosing_element_build_cache(this : IUIAutomationTextRange3*, cacheRequest : Void*, enclosingElement : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_enclosing_element_build_cache.call(this, cacheRequest, enclosingElement)
    end
    def get_children_build_cache(this : IUIAutomationTextRange3*, cacheRequest : Void*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_children_build_cache.call(this, cacheRequest, children)
    end
    def get_attribute_values(this : IUIAutomationTextRange3*, attributeIds : Int32*, attributeIdCount : Int32, attributeValues : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_attribute_values.call(this, attributeIds, attributeIdCount, attributeValues)
    end

  end

  @[Extern]
  record IUIAutomationTextRangeArrayVtbl,
    query_interface : Proc(IUIAutomationTextRangeArray*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTextRangeArray*, UInt32),
    release : Proc(IUIAutomationTextRangeArray*, UInt32),
    get_Length : Proc(IUIAutomationTextRangeArray*, Int32*, Win32cr::Foundation::HRESULT),
    get_element : Proc(IUIAutomationTextRangeArray*, Int32, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTextRangeArray, lpVtbl : IUIAutomationTextRangeArrayVtbl* do
    GUID = LibC::GUID.new(0xce4ae76a_u32, 0xe717_u16, 0x4c98_u16, StaticArray[0x81_u8, 0xea_u8, 0x47_u8, 0x37_u8, 0x1d_u8, 0x2_u8, 0x8e_u8, 0xb6_u8])
    def query_interface(this : IUIAutomationTextRangeArray*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTextRangeArray*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTextRangeArray*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Length(this : IUIAutomationTextRangeArray*, length : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Length.call(this, length)
    end
    def get_element(this : IUIAutomationTextRangeArray*, index : Int32, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_element.call(this, index, element)
    end

  end

  @[Extern]
  record IUIAutomationTextPatternVtbl,
    query_interface : Proc(IUIAutomationTextPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTextPattern*, UInt32),
    release : Proc(IUIAutomationTextPattern*, UInt32),
    range_from_point : Proc(IUIAutomationTextPattern*, Win32cr::Foundation::POINT, Void**, Win32cr::Foundation::HRESULT),
    range_from_child : Proc(IUIAutomationTextPattern*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_selection : Proc(IUIAutomationTextPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_visible_ranges : Proc(IUIAutomationTextPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_DocumentRange : Proc(IUIAutomationTextPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportedTextSelection : Proc(IUIAutomationTextPattern*, Win32cr::UI::Accessibility::SupportedTextSelection*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTextPattern, lpVtbl : IUIAutomationTextPatternVtbl* do
    GUID = LibC::GUID.new(0x32eba289_u32, 0x3583_u16, 0x42c9_u16, StaticArray[0x9c_u8, 0x59_u8, 0x3b_u8, 0x6d_u8, 0x9a_u8, 0x1e_u8, 0x9b_u8, 0x6a_u8])
    def query_interface(this : IUIAutomationTextPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTextPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTextPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def range_from_point(this : IUIAutomationTextPattern*, pt : Win32cr::Foundation::POINT, range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_point.call(this, pt, range)
    end
    def range_from_child(this : IUIAutomationTextPattern*, child : Void*, range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_child.call(this, child, range)
    end
    def get_selection(this : IUIAutomationTextPattern*, ranges : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, ranges)
    end
    def get_visible_ranges(this : IUIAutomationTextPattern*, ranges : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visible_ranges.call(this, ranges)
    end
    def get_DocumentRange(this : IUIAutomationTextPattern*, range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DocumentRange.call(this, range)
    end
    def get_SupportedTextSelection(this : IUIAutomationTextPattern*, supportedTextSelection : Win32cr::UI::Accessibility::SupportedTextSelection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportedTextSelection.call(this, supportedTextSelection)
    end

  end

  @[Extern]
  record IUIAutomationTextPattern2Vtbl,
    query_interface : Proc(IUIAutomationTextPattern2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTextPattern2*, UInt32),
    release : Proc(IUIAutomationTextPattern2*, UInt32),
    range_from_point : Proc(IUIAutomationTextPattern2*, Win32cr::Foundation::POINT, Void**, Win32cr::Foundation::HRESULT),
    range_from_child : Proc(IUIAutomationTextPattern2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_selection : Proc(IUIAutomationTextPattern2*, Void**, Win32cr::Foundation::HRESULT),
    get_visible_ranges : Proc(IUIAutomationTextPattern2*, Void**, Win32cr::Foundation::HRESULT),
    get_DocumentRange : Proc(IUIAutomationTextPattern2*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportedTextSelection : Proc(IUIAutomationTextPattern2*, Win32cr::UI::Accessibility::SupportedTextSelection*, Win32cr::Foundation::HRESULT),
    range_from_annotation : Proc(IUIAutomationTextPattern2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_caret_range : Proc(IUIAutomationTextPattern2*, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTextPattern2, lpVtbl : IUIAutomationTextPattern2Vtbl* do
    GUID = LibC::GUID.new(0x506a921a_u32, 0xfcc9_u16, 0x409f_u16, StaticArray[0xb2_u8, 0x3b_u8, 0x37_u8, 0xeb_u8, 0x74_u8, 0x10_u8, 0x68_u8, 0x72_u8])
    def query_interface(this : IUIAutomationTextPattern2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTextPattern2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTextPattern2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def range_from_point(this : IUIAutomationTextPattern2*, pt : Win32cr::Foundation::POINT, range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_point.call(this, pt, range)
    end
    def range_from_child(this : IUIAutomationTextPattern2*, child : Void*, range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_child.call(this, child, range)
    end
    def get_selection(this : IUIAutomationTextPattern2*, ranges : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, ranges)
    end
    def get_visible_ranges(this : IUIAutomationTextPattern2*, ranges : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visible_ranges.call(this, ranges)
    end
    def get_DocumentRange(this : IUIAutomationTextPattern2*, range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DocumentRange.call(this, range)
    end
    def get_SupportedTextSelection(this : IUIAutomationTextPattern2*, supportedTextSelection : Win32cr::UI::Accessibility::SupportedTextSelection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportedTextSelection.call(this, supportedTextSelection)
    end
    def range_from_annotation(this : IUIAutomationTextPattern2*, annotation__ : Void*, range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_annotation.call(this, annotation__, range)
    end
    def get_caret_range(this : IUIAutomationTextPattern2*, isActive : Win32cr::Foundation::BOOL*, range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_caret_range.call(this, isActive, range)
    end

  end

  @[Extern]
  record IUIAutomationTextEditPatternVtbl,
    query_interface : Proc(IUIAutomationTextEditPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTextEditPattern*, UInt32),
    release : Proc(IUIAutomationTextEditPattern*, UInt32),
    range_from_point : Proc(IUIAutomationTextEditPattern*, Win32cr::Foundation::POINT, Void**, Win32cr::Foundation::HRESULT),
    range_from_child : Proc(IUIAutomationTextEditPattern*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_selection : Proc(IUIAutomationTextEditPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_visible_ranges : Proc(IUIAutomationTextEditPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_DocumentRange : Proc(IUIAutomationTextEditPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_SupportedTextSelection : Proc(IUIAutomationTextEditPattern*, Win32cr::UI::Accessibility::SupportedTextSelection*, Win32cr::Foundation::HRESULT),
    get_active_composition : Proc(IUIAutomationTextEditPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_conversion_target : Proc(IUIAutomationTextEditPattern*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTextEditPattern, lpVtbl : IUIAutomationTextEditPatternVtbl* do
    GUID = LibC::GUID.new(0x17e21576_u32, 0x996c_u16, 0x4870_u16, StaticArray[0x99_u8, 0xd9_u8, 0xbf_u8, 0xf3_u8, 0x23_u8, 0x38_u8, 0xc_u8, 0x6_u8])
    def query_interface(this : IUIAutomationTextEditPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTextEditPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTextEditPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def range_from_point(this : IUIAutomationTextEditPattern*, pt : Win32cr::Foundation::POINT, range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_point.call(this, pt, range)
    end
    def range_from_child(this : IUIAutomationTextEditPattern*, child : Void*, range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.range_from_child.call(this, child, range)
    end
    def get_selection(this : IUIAutomationTextEditPattern*, ranges : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_selection.call(this, ranges)
    end
    def get_visible_ranges(this : IUIAutomationTextEditPattern*, ranges : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_visible_ranges.call(this, ranges)
    end
    def get_DocumentRange(this : IUIAutomationTextEditPattern*, range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_DocumentRange.call(this, range)
    end
    def get_SupportedTextSelection(this : IUIAutomationTextEditPattern*, supportedTextSelection : Win32cr::UI::Accessibility::SupportedTextSelection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SupportedTextSelection.call(this, supportedTextSelection)
    end
    def get_active_composition(this : IUIAutomationTextEditPattern*, range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_active_composition.call(this, range)
    end
    def get_conversion_target(this : IUIAutomationTextEditPattern*, range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_conversion_target.call(this, range)
    end

  end

  @[Extern]
  record IUIAutomationCustomNavigationPatternVtbl,
    query_interface : Proc(IUIAutomationCustomNavigationPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationCustomNavigationPattern*, UInt32),
    release : Proc(IUIAutomationCustomNavigationPattern*, UInt32),
    navigate : Proc(IUIAutomationCustomNavigationPattern*, Win32cr::UI::Accessibility::NavigateDirection, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationCustomNavigationPattern, lpVtbl : IUIAutomationCustomNavigationPatternVtbl* do
    GUID = LibC::GUID.new(0x1ea217a_u32, 0x1766_u16, 0x47ed_u16, StaticArray[0xa6_u8, 0xcc_u8, 0xac_u8, 0xf4_u8, 0x92_u8, 0x85_u8, 0x4b_u8, 0x1f_u8])
    def query_interface(this : IUIAutomationCustomNavigationPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationCustomNavigationPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationCustomNavigationPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def navigate(this : IUIAutomationCustomNavigationPattern*, direction : Win32cr::UI::Accessibility::NavigateDirection, pRetVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.navigate.call(this, direction, pRetVal)
    end

  end

  @[Extern]
  record IUIAutomationActiveTextPositionChangedEventHandlerVtbl,
    query_interface : Proc(IUIAutomationActiveTextPositionChangedEventHandler*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationActiveTextPositionChangedEventHandler*, UInt32),
    release : Proc(IUIAutomationActiveTextPositionChangedEventHandler*, UInt32),
    handle_active_text_position_changed_event : Proc(IUIAutomationActiveTextPositionChangedEventHandler*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationActiveTextPositionChangedEventHandler, lpVtbl : IUIAutomationActiveTextPositionChangedEventHandlerVtbl* do
    GUID = LibC::GUID.new(0xf97933b0_u32, 0x8dae_u16, 0x4496_u16, StaticArray[0x89_u8, 0x97_u8, 0x5b_u8, 0xa0_u8, 0x15_u8, 0xfe_u8, 0xd_u8, 0x82_u8])
    def query_interface(this : IUIAutomationActiveTextPositionChangedEventHandler*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationActiveTextPositionChangedEventHandler*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationActiveTextPositionChangedEventHandler*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def handle_active_text_position_changed_event(this : IUIAutomationActiveTextPositionChangedEventHandler*, sender : Void*, range : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.handle_active_text_position_changed_event.call(this, sender, range)
    end

  end

  @[Extern]
  record IUIAutomationLegacyIAccessiblePatternVtbl,
    query_interface : Proc(IUIAutomationLegacyIAccessiblePattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt32),
    release : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt32),
    select__ : Proc(IUIAutomationLegacyIAccessiblePattern*, Int32, Win32cr::Foundation::HRESULT),
    do_default_action : Proc(IUIAutomationLegacyIAccessiblePattern*, Win32cr::Foundation::HRESULT),
    set_value : Proc(IUIAutomationLegacyIAccessiblePattern*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_CurrentChildId : Proc(IUIAutomationLegacyIAccessiblePattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentName : Proc(IUIAutomationLegacyIAccessiblePattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentValue : Proc(IUIAutomationLegacyIAccessiblePattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentDescription : Proc(IUIAutomationLegacyIAccessiblePattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentRole : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CurrentState : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CurrentHelp : Proc(IUIAutomationLegacyIAccessiblePattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentKeyboardShortcut : Proc(IUIAutomationLegacyIAccessiblePattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_current_selection : Proc(IUIAutomationLegacyIAccessiblePattern*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentDefaultAction : Proc(IUIAutomationLegacyIAccessiblePattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedChildId : Proc(IUIAutomationLegacyIAccessiblePattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedName : Proc(IUIAutomationLegacyIAccessiblePattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedValue : Proc(IUIAutomationLegacyIAccessiblePattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedDescription : Proc(IUIAutomationLegacyIAccessiblePattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedRole : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CachedState : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt32*, Win32cr::Foundation::HRESULT),
    get_CachedHelp : Proc(IUIAutomationLegacyIAccessiblePattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedKeyboardShortcut : Proc(IUIAutomationLegacyIAccessiblePattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_cached_selection : Proc(IUIAutomationLegacyIAccessiblePattern*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedDefaultAction : Proc(IUIAutomationLegacyIAccessiblePattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_i_accessible : Proc(IUIAutomationLegacyIAccessiblePattern*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationLegacyIAccessiblePattern, lpVtbl : IUIAutomationLegacyIAccessiblePatternVtbl* do
    GUID = LibC::GUID.new(0x828055ad_u32, 0x355b_u16, 0x4435_u16, StaticArray[0x86_u8, 0xd5_u8, 0x3b_u8, 0x51_u8, 0xc1_u8, 0x4a_u8, 0x9b_u8, 0x1b_u8])
    def query_interface(this : IUIAutomationLegacyIAccessiblePattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationLegacyIAccessiblePattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationLegacyIAccessiblePattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def select__(this : IUIAutomationLegacyIAccessiblePattern*, flagsSelect : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.select__.call(this, flagsSelect)
    end
    def do_default_action(this : IUIAutomationLegacyIAccessiblePattern*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.do_default_action.call(this)
    end
    def set_value(this : IUIAutomationLegacyIAccessiblePattern*, szValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_value.call(this, szValue)
    end
    def get_CurrentChildId(this : IUIAutomationLegacyIAccessiblePattern*, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentChildId.call(this, pRetVal)
    end
    def get_CurrentName(this : IUIAutomationLegacyIAccessiblePattern*, pszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentName.call(this, pszName)
    end
    def get_CurrentValue(this : IUIAutomationLegacyIAccessiblePattern*, pszValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentValue.call(this, pszValue)
    end
    def get_CurrentDescription(this : IUIAutomationLegacyIAccessiblePattern*, pszDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDescription.call(this, pszDescription)
    end
    def get_CurrentRole(this : IUIAutomationLegacyIAccessiblePattern*, pdwRole : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentRole.call(this, pdwRole)
    end
    def get_CurrentState(this : IUIAutomationLegacyIAccessiblePattern*, pdwState : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentState.call(this, pdwState)
    end
    def get_CurrentHelp(this : IUIAutomationLegacyIAccessiblePattern*, pszHelp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHelp.call(this, pszHelp)
    end
    def get_CurrentKeyboardShortcut(this : IUIAutomationLegacyIAccessiblePattern*, pszKeyboardShortcut : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentKeyboardShortcut.call(this, pszKeyboardShortcut)
    end
    def get_current_selection(this : IUIAutomationLegacyIAccessiblePattern*, pvarSelectedChildren : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_selection.call(this, pvarSelectedChildren)
    end
    def get_CurrentDefaultAction(this : IUIAutomationLegacyIAccessiblePattern*, pszDefaultAction : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDefaultAction.call(this, pszDefaultAction)
    end
    def get_CachedChildId(this : IUIAutomationLegacyIAccessiblePattern*, pRetVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedChildId.call(this, pRetVal)
    end
    def get_CachedName(this : IUIAutomationLegacyIAccessiblePattern*, pszName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedName.call(this, pszName)
    end
    def get_CachedValue(this : IUIAutomationLegacyIAccessiblePattern*, pszValue : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedValue.call(this, pszValue)
    end
    def get_CachedDescription(this : IUIAutomationLegacyIAccessiblePattern*, pszDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDescription.call(this, pszDescription)
    end
    def get_CachedRole(this : IUIAutomationLegacyIAccessiblePattern*, pdwRole : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedRole.call(this, pdwRole)
    end
    def get_CachedState(this : IUIAutomationLegacyIAccessiblePattern*, pdwState : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedState.call(this, pdwState)
    end
    def get_CachedHelp(this : IUIAutomationLegacyIAccessiblePattern*, pszHelp : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHelp.call(this, pszHelp)
    end
    def get_CachedKeyboardShortcut(this : IUIAutomationLegacyIAccessiblePattern*, pszKeyboardShortcut : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedKeyboardShortcut.call(this, pszKeyboardShortcut)
    end
    def get_cached_selection(this : IUIAutomationLegacyIAccessiblePattern*, pvarSelectedChildren : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_selection.call(this, pvarSelectedChildren)
    end
    def get_CachedDefaultAction(this : IUIAutomationLegacyIAccessiblePattern*, pszDefaultAction : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDefaultAction.call(this, pszDefaultAction)
    end
    def get_i_accessible(this : IUIAutomationLegacyIAccessiblePattern*, ppAccessible : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_i_accessible.call(this, ppAccessible)
    end

  end

  @[Extern]
  record IUIAutomationItemContainerPatternVtbl,
    query_interface : Proc(IUIAutomationItemContainerPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationItemContainerPattern*, UInt32),
    release : Proc(IUIAutomationItemContainerPattern*, UInt32),
    find_item_by_property : Proc(IUIAutomationItemContainerPattern*, Void*, Int32, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationItemContainerPattern, lpVtbl : IUIAutomationItemContainerPatternVtbl* do
    GUID = LibC::GUID.new(0xc690fdb2_u32, 0x27a8_u16, 0x423c_u16, StaticArray[0x81_u8, 0x2d_u8, 0x42_u8, 0x97_u8, 0x73_u8, 0xc9_u8, 0x8_u8, 0x4e_u8])
    def query_interface(this : IUIAutomationItemContainerPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationItemContainerPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationItemContainerPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def find_item_by_property(this : IUIAutomationItemContainerPattern*, pStartAfter : Void*, propertyId : Int32, value : Win32cr::System::Com::VARIANT, pFound : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_item_by_property.call(this, pStartAfter, propertyId, value, pFound)
    end

  end

  @[Extern]
  record IUIAutomationVirtualizedItemPatternVtbl,
    query_interface : Proc(IUIAutomationVirtualizedItemPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationVirtualizedItemPattern*, UInt32),
    release : Proc(IUIAutomationVirtualizedItemPattern*, UInt32),
    realize : Proc(IUIAutomationVirtualizedItemPattern*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationVirtualizedItemPattern, lpVtbl : IUIAutomationVirtualizedItemPatternVtbl* do
    GUID = LibC::GUID.new(0x6ba3d7a6_u32, 0x4cf_u16, 0x4f11_u16, StaticArray[0x87_u8, 0x93_u8, 0xa8_u8, 0xd1_u8, 0xcd_u8, 0xe9_u8, 0x96_u8, 0x9f_u8])
    def query_interface(this : IUIAutomationVirtualizedItemPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationVirtualizedItemPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationVirtualizedItemPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def realize(this : IUIAutomationVirtualizedItemPattern*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.realize.call(this)
    end

  end

  @[Extern]
  record IUIAutomationAnnotationPatternVtbl,
    query_interface : Proc(IUIAutomationAnnotationPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationAnnotationPattern*, UInt32),
    release : Proc(IUIAutomationAnnotationPattern*, UInt32),
    get_CurrentAnnotationTypeId : Proc(IUIAutomationAnnotationPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentAnnotationTypeName : Proc(IUIAutomationAnnotationPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAuthor : Proc(IUIAutomationAnnotationPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentDateTime : Proc(IUIAutomationAnnotationPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentTarget : Proc(IUIAutomationAnnotationPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedAnnotationTypeId : Proc(IUIAutomationAnnotationPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedAnnotationTypeName : Proc(IUIAutomationAnnotationPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAuthor : Proc(IUIAutomationAnnotationPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedDateTime : Proc(IUIAutomationAnnotationPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedTarget : Proc(IUIAutomationAnnotationPattern*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationAnnotationPattern, lpVtbl : IUIAutomationAnnotationPatternVtbl* do
    GUID = LibC::GUID.new(0x9a175b21_u32, 0x339e_u16, 0x41b1_u16, StaticArray[0x8e_u8, 0x8b_u8, 0x62_u8, 0x3f_u8, 0x6b_u8, 0x68_u8, 0x10_u8, 0x98_u8])
    def query_interface(this : IUIAutomationAnnotationPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationAnnotationPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationAnnotationPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_CurrentAnnotationTypeId(this : IUIAutomationAnnotationPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAnnotationTypeId.call(this, retVal)
    end
    def get_CurrentAnnotationTypeName(this : IUIAutomationAnnotationPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAnnotationTypeName.call(this, retVal)
    end
    def get_CurrentAuthor(this : IUIAutomationAnnotationPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAuthor.call(this, retVal)
    end
    def get_CurrentDateTime(this : IUIAutomationAnnotationPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDateTime.call(this, retVal)
    end
    def get_CurrentTarget(this : IUIAutomationAnnotationPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentTarget.call(this, retVal)
    end
    def get_CachedAnnotationTypeId(this : IUIAutomationAnnotationPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAnnotationTypeId.call(this, retVal)
    end
    def get_CachedAnnotationTypeName(this : IUIAutomationAnnotationPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAnnotationTypeName.call(this, retVal)
    end
    def get_CachedAuthor(this : IUIAutomationAnnotationPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAuthor.call(this, retVal)
    end
    def get_CachedDateTime(this : IUIAutomationAnnotationPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDateTime.call(this, retVal)
    end
    def get_CachedTarget(this : IUIAutomationAnnotationPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedTarget.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationStylesPatternVtbl,
    query_interface : Proc(IUIAutomationStylesPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationStylesPattern*, UInt32),
    release : Proc(IUIAutomationStylesPattern*, UInt32),
    get_CurrentStyleId : Proc(IUIAutomationStylesPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentStyleName : Proc(IUIAutomationStylesPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentFillColor : Proc(IUIAutomationStylesPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentFillPatternStyle : Proc(IUIAutomationStylesPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentShape : Proc(IUIAutomationStylesPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentFillPatternColor : Proc(IUIAutomationStylesPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentExtendedProperties : Proc(IUIAutomationStylesPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_current_extended_properties_as_array : Proc(IUIAutomationStylesPattern*, Win32cr::UI::Accessibility::ExtendedProperty**, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedStyleId : Proc(IUIAutomationStylesPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedStyleName : Proc(IUIAutomationStylesPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedFillColor : Proc(IUIAutomationStylesPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedFillPatternStyle : Proc(IUIAutomationStylesPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedShape : Proc(IUIAutomationStylesPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedFillPatternColor : Proc(IUIAutomationStylesPattern*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedExtendedProperties : Proc(IUIAutomationStylesPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_cached_extended_properties_as_array : Proc(IUIAutomationStylesPattern*, Win32cr::UI::Accessibility::ExtendedProperty**, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationStylesPattern, lpVtbl : IUIAutomationStylesPatternVtbl* do
    GUID = LibC::GUID.new(0x85b5f0a2_u32, 0xbd79_u16, 0x484a_u16, StaticArray[0xad_u8, 0x2b_u8, 0x38_u8, 0x8c_u8, 0x98_u8, 0x38_u8, 0xd5_u8, 0xfb_u8])
    def query_interface(this : IUIAutomationStylesPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationStylesPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationStylesPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_CurrentStyleId(this : IUIAutomationStylesPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentStyleId.call(this, retVal)
    end
    def get_CurrentStyleName(this : IUIAutomationStylesPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentStyleName.call(this, retVal)
    end
    def get_CurrentFillColor(this : IUIAutomationStylesPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFillColor.call(this, retVal)
    end
    def get_CurrentFillPatternStyle(this : IUIAutomationStylesPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFillPatternStyle.call(this, retVal)
    end
    def get_CurrentShape(this : IUIAutomationStylesPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentShape.call(this, retVal)
    end
    def get_CurrentFillPatternColor(this : IUIAutomationStylesPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFillPatternColor.call(this, retVal)
    end
    def get_CurrentExtendedProperties(this : IUIAutomationStylesPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentExtendedProperties.call(this, retVal)
    end
    def get_current_extended_properties_as_array(this : IUIAutomationStylesPattern*, propertyArray : Win32cr::UI::Accessibility::ExtendedProperty**, propertyCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_extended_properties_as_array.call(this, propertyArray, propertyCount)
    end
    def get_CachedStyleId(this : IUIAutomationStylesPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedStyleId.call(this, retVal)
    end
    def get_CachedStyleName(this : IUIAutomationStylesPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedStyleName.call(this, retVal)
    end
    def get_CachedFillColor(this : IUIAutomationStylesPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFillColor.call(this, retVal)
    end
    def get_CachedFillPatternStyle(this : IUIAutomationStylesPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFillPatternStyle.call(this, retVal)
    end
    def get_CachedShape(this : IUIAutomationStylesPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedShape.call(this, retVal)
    end
    def get_CachedFillPatternColor(this : IUIAutomationStylesPattern*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFillPatternColor.call(this, retVal)
    end
    def get_CachedExtendedProperties(this : IUIAutomationStylesPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedExtendedProperties.call(this, retVal)
    end
    def get_cached_extended_properties_as_array(this : IUIAutomationStylesPattern*, propertyArray : Win32cr::UI::Accessibility::ExtendedProperty**, propertyCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_extended_properties_as_array.call(this, propertyArray, propertyCount)
    end

  end

  @[Extern]
  record IUIAutomationSpreadsheetPatternVtbl,
    query_interface : Proc(IUIAutomationSpreadsheetPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationSpreadsheetPattern*, UInt32),
    release : Proc(IUIAutomationSpreadsheetPattern*, UInt32),
    get_item_by_name : Proc(IUIAutomationSpreadsheetPattern*, Win32cr::Foundation::BSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationSpreadsheetPattern, lpVtbl : IUIAutomationSpreadsheetPatternVtbl* do
    GUID = LibC::GUID.new(0x7517a7c8_u32, 0xfaae_u16, 0x4de9_u16, StaticArray[0x9f_u8, 0x8_u8, 0x29_u8, 0xb9_u8, 0x1e_u8, 0x85_u8, 0x95_u8, 0xc1_u8])
    def query_interface(this : IUIAutomationSpreadsheetPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationSpreadsheetPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationSpreadsheetPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_item_by_name(this : IUIAutomationSpreadsheetPattern*, name : Win32cr::Foundation::BSTR, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_item_by_name.call(this, name, element)
    end

  end

  @[Extern]
  record IUIAutomationSpreadsheetItemPatternVtbl,
    query_interface : Proc(IUIAutomationSpreadsheetItemPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationSpreadsheetItemPattern*, UInt32),
    release : Proc(IUIAutomationSpreadsheetItemPattern*, UInt32),
    get_CurrentFormula : Proc(IUIAutomationSpreadsheetItemPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_current_annotation_objects : Proc(IUIAutomationSpreadsheetItemPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_current_annotation_types : Proc(IUIAutomationSpreadsheetItemPattern*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CachedFormula : Proc(IUIAutomationSpreadsheetItemPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_cached_annotation_objects : Proc(IUIAutomationSpreadsheetItemPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_annotation_types : Proc(IUIAutomationSpreadsheetItemPattern*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationSpreadsheetItemPattern, lpVtbl : IUIAutomationSpreadsheetItemPatternVtbl* do
    GUID = LibC::GUID.new(0x7d4fb86c_u32, 0x8d34_u16, 0x40e1_u16, StaticArray[0x8e_u8, 0x83_u8, 0x62_u8, 0xc1_u8, 0x52_u8, 0x4_u8, 0xe3_u8, 0x35_u8])
    def query_interface(this : IUIAutomationSpreadsheetItemPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationSpreadsheetItemPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationSpreadsheetItemPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_CurrentFormula(this : IUIAutomationSpreadsheetItemPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFormula.call(this, retVal)
    end
    def get_current_annotation_objects(this : IUIAutomationSpreadsheetItemPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_annotation_objects.call(this, retVal)
    end
    def get_current_annotation_types(this : IUIAutomationSpreadsheetItemPattern*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_annotation_types.call(this, retVal)
    end
    def get_CachedFormula(this : IUIAutomationSpreadsheetItemPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFormula.call(this, retVal)
    end
    def get_cached_annotation_objects(this : IUIAutomationSpreadsheetItemPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_annotation_objects.call(this, retVal)
    end
    def get_cached_annotation_types(this : IUIAutomationSpreadsheetItemPattern*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_annotation_types.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationTransformPattern2Vtbl,
    query_interface : Proc(IUIAutomationTransformPattern2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTransformPattern2*, UInt32),
    release : Proc(IUIAutomationTransformPattern2*, UInt32),
    move : Proc(IUIAutomationTransformPattern2*, Float64, Float64, Win32cr::Foundation::HRESULT),
    resize : Proc(IUIAutomationTransformPattern2*, Float64, Float64, Win32cr::Foundation::HRESULT),
    rotate : Proc(IUIAutomationTransformPattern2*, Float64, Win32cr::Foundation::HRESULT),
    get_CurrentCanMove : Proc(IUIAutomationTransformPattern2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentCanResize : Proc(IUIAutomationTransformPattern2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentCanRotate : Proc(IUIAutomationTransformPattern2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedCanMove : Proc(IUIAutomationTransformPattern2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedCanResize : Proc(IUIAutomationTransformPattern2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedCanRotate : Proc(IUIAutomationTransformPattern2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    zoom : Proc(IUIAutomationTransformPattern2*, Float64, Win32cr::Foundation::HRESULT),
    zoom_by_unit : Proc(IUIAutomationTransformPattern2*, Win32cr::UI::Accessibility::ZoomUnit, Win32cr::Foundation::HRESULT),
    get_CurrentCanZoom : Proc(IUIAutomationTransformPattern2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedCanZoom : Proc(IUIAutomationTransformPattern2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentZoomLevel : Proc(IUIAutomationTransformPattern2*, Float64*, Win32cr::Foundation::HRESULT),
    get_CachedZoomLevel : Proc(IUIAutomationTransformPattern2*, Float64*, Win32cr::Foundation::HRESULT),
    get_CurrentZoomMinimum : Proc(IUIAutomationTransformPattern2*, Float64*, Win32cr::Foundation::HRESULT),
    get_CachedZoomMinimum : Proc(IUIAutomationTransformPattern2*, Float64*, Win32cr::Foundation::HRESULT),
    get_CurrentZoomMaximum : Proc(IUIAutomationTransformPattern2*, Float64*, Win32cr::Foundation::HRESULT),
    get_CachedZoomMaximum : Proc(IUIAutomationTransformPattern2*, Float64*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTransformPattern2, lpVtbl : IUIAutomationTransformPattern2Vtbl* do
    GUID = LibC::GUID.new(0x6d74d017_u32, 0x6ecb_u16, 0x4381_u16, StaticArray[0xb3_u8, 0x8b_u8, 0x3c_u8, 0x17_u8, 0xa4_u8, 0x8f_u8, 0xf1_u8, 0xc2_u8])
    def query_interface(this : IUIAutomationTransformPattern2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTransformPattern2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTransformPattern2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def move(this : IUIAutomationTransformPattern2*, x : Float64, y : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move.call(this, x, y)
    end
    def resize(this : IUIAutomationTransformPattern2*, width : Float64, height : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.resize.call(this, width, height)
    end
    def rotate(this : IUIAutomationTransformPattern2*, degrees : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rotate.call(this, degrees)
    end
    def get_CurrentCanMove(this : IUIAutomationTransformPattern2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCanMove.call(this, retVal)
    end
    def get_CurrentCanResize(this : IUIAutomationTransformPattern2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCanResize.call(this, retVal)
    end
    def get_CurrentCanRotate(this : IUIAutomationTransformPattern2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCanRotate.call(this, retVal)
    end
    def get_CachedCanMove(this : IUIAutomationTransformPattern2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCanMove.call(this, retVal)
    end
    def get_CachedCanResize(this : IUIAutomationTransformPattern2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCanResize.call(this, retVal)
    end
    def get_CachedCanRotate(this : IUIAutomationTransformPattern2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCanRotate.call(this, retVal)
    end
    def zoom(this : IUIAutomationTransformPattern2*, zoomValue : Float64) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.zoom.call(this, zoomValue)
    end
    def zoom_by_unit(this : IUIAutomationTransformPattern2*, zoomUnit : Win32cr::UI::Accessibility::ZoomUnit) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.zoom_by_unit.call(this, zoomUnit)
    end
    def get_CurrentCanZoom(this : IUIAutomationTransformPattern2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCanZoom.call(this, retVal)
    end
    def get_CachedCanZoom(this : IUIAutomationTransformPattern2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCanZoom.call(this, retVal)
    end
    def get_CurrentZoomLevel(this : IUIAutomationTransformPattern2*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentZoomLevel.call(this, retVal)
    end
    def get_CachedZoomLevel(this : IUIAutomationTransformPattern2*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedZoomLevel.call(this, retVal)
    end
    def get_CurrentZoomMinimum(this : IUIAutomationTransformPattern2*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentZoomMinimum.call(this, retVal)
    end
    def get_CachedZoomMinimum(this : IUIAutomationTransformPattern2*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedZoomMinimum.call(this, retVal)
    end
    def get_CurrentZoomMaximum(this : IUIAutomationTransformPattern2*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentZoomMaximum.call(this, retVal)
    end
    def get_CachedZoomMaximum(this : IUIAutomationTransformPattern2*, retVal : Float64*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedZoomMaximum.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationTextChildPatternVtbl,
    query_interface : Proc(IUIAutomationTextChildPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationTextChildPattern*, UInt32),
    release : Proc(IUIAutomationTextChildPattern*, UInt32),
    get_TextContainer : Proc(IUIAutomationTextChildPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_TextRange : Proc(IUIAutomationTextChildPattern*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationTextChildPattern, lpVtbl : IUIAutomationTextChildPatternVtbl* do
    GUID = LibC::GUID.new(0x6552b038_u32, 0xae05_u16, 0x40c8_u16, StaticArray[0xab_u8, 0xfd_u8, 0xaa_u8, 0x8_u8, 0x35_u8, 0x2a_u8, 0xab_u8, 0x86_u8])
    def query_interface(this : IUIAutomationTextChildPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationTextChildPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationTextChildPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_TextContainer(this : IUIAutomationTextChildPattern*, container : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TextContainer.call(this, container)
    end
    def get_TextRange(this : IUIAutomationTextChildPattern*, range : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TextRange.call(this, range)
    end

  end

  @[Extern]
  record IUIAutomationDragPatternVtbl,
    query_interface : Proc(IUIAutomationDragPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationDragPattern*, UInt32),
    release : Proc(IUIAutomationDragPattern*, UInt32),
    get_CurrentIsGrabbed : Proc(IUIAutomationDragPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsGrabbed : Proc(IUIAutomationDragPattern*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentDropEffect : Proc(IUIAutomationDragPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedDropEffect : Proc(IUIAutomationDragPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentDropEffects : Proc(IUIAutomationDragPattern*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CachedDropEffects : Proc(IUIAutomationDragPattern*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_current_grabbed_items : Proc(IUIAutomationDragPattern*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_grabbed_items : Proc(IUIAutomationDragPattern*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationDragPattern, lpVtbl : IUIAutomationDragPatternVtbl* do
    GUID = LibC::GUID.new(0x1dc7b570_u32, 0x1f54_u16, 0x4bad_u16, StaticArray[0xbc_u8, 0xda_u8, 0xd3_u8, 0x6a_u8, 0x72_u8, 0x2f_u8, 0xb7_u8, 0xbd_u8])
    def query_interface(this : IUIAutomationDragPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationDragPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationDragPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_CurrentIsGrabbed(this : IUIAutomationDragPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsGrabbed.call(this, retVal)
    end
    def get_CachedIsGrabbed(this : IUIAutomationDragPattern*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsGrabbed.call(this, retVal)
    end
    def get_CurrentDropEffect(this : IUIAutomationDragPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDropEffect.call(this, retVal)
    end
    def get_CachedDropEffect(this : IUIAutomationDragPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDropEffect.call(this, retVal)
    end
    def get_CurrentDropEffects(this : IUIAutomationDragPattern*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDropEffects.call(this, retVal)
    end
    def get_CachedDropEffects(this : IUIAutomationDragPattern*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDropEffects.call(this, retVal)
    end
    def get_current_grabbed_items(this : IUIAutomationDragPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_grabbed_items.call(this, retVal)
    end
    def get_cached_grabbed_items(this : IUIAutomationDragPattern*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_grabbed_items.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationDropTargetPatternVtbl,
    query_interface : Proc(IUIAutomationDropTargetPattern*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationDropTargetPattern*, UInt32),
    release : Proc(IUIAutomationDropTargetPattern*, UInt32),
    get_CurrentDropTargetEffect : Proc(IUIAutomationDropTargetPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedDropTargetEffect : Proc(IUIAutomationDropTargetPattern*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentDropTargetEffects : Proc(IUIAutomationDropTargetPattern*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CachedDropTargetEffects : Proc(IUIAutomationDropTargetPattern*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationDropTargetPattern, lpVtbl : IUIAutomationDropTargetPatternVtbl* do
    GUID = LibC::GUID.new(0x69a095f7_u32, 0xeee4_u16, 0x430e_u16, StaticArray[0xa4_u8, 0x6b_u8, 0xfb_u8, 0x73_u8, 0xb1_u8, 0xae_u8, 0x39_u8, 0xa5_u8])
    def query_interface(this : IUIAutomationDropTargetPattern*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationDropTargetPattern*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationDropTargetPattern*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_CurrentDropTargetEffect(this : IUIAutomationDropTargetPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDropTargetEffect.call(this, retVal)
    end
    def get_CachedDropTargetEffect(this : IUIAutomationDropTargetPattern*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDropTargetEffect.call(this, retVal)
    end
    def get_CurrentDropTargetEffects(this : IUIAutomationDropTargetPattern*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDropTargetEffects.call(this, retVal)
    end
    def get_CachedDropTargetEffects(this : IUIAutomationDropTargetPattern*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDropTargetEffects.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationElement2Vtbl,
    query_interface : Proc(IUIAutomationElement2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationElement2*, UInt32),
    release : Proc(IUIAutomationElement2*, UInt32),
    set_focus : Proc(IUIAutomationElement2*, Win32cr::Foundation::HRESULT),
    get_runtime_id : Proc(IUIAutomationElement2*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    find_first : Proc(IUIAutomationElement2*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all : Proc(IUIAutomationElement2*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_first_build_cache : Proc(IUIAutomationElement2*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_build_cache : Proc(IUIAutomationElement2*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    build_updated_cache : Proc(IUIAutomationElement2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_current_property_value : Proc(IUIAutomationElement2*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_property_value_ex : Proc(IUIAutomationElement2*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value : Proc(IUIAutomationElement2*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value_ex : Proc(IUIAutomationElement2*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_pattern_as : Proc(IUIAutomationElement2*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern_as : Proc(IUIAutomationElement2*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_current_pattern : Proc(IUIAutomationElement2*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern : Proc(IUIAutomationElement2*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_parent : Proc(IUIAutomationElement2*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_children : Proc(IUIAutomationElement2*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProcessId : Proc(IUIAutomationElement2*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentControlType : Proc(IUIAutomationElement2*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLocalizedControlType : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentName : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAcceleratorKey : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAccessKey : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHasKeyboardFocus : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsKeyboardFocusable : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsEnabled : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentAutomationId : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentClassName : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHelpText : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentCulture : Proc(IUIAutomationElement2*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentIsControlElement : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsContentElement : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPassword : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentNativeWindowHandle : Proc(IUIAutomationElement2*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CurrentItemType : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsOffscreen : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOrientation : Proc(IUIAutomationElement2*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CurrentFrameworkId : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsRequiredForForm : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentItemStatus : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentBoundingRectangle : Proc(IUIAutomationElement2*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CurrentLabeledBy : Proc(IUIAutomationElement2*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentAriaRole : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAriaProperties : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsDataValidForForm : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentControllerFor : Proc(IUIAutomationElement2*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentDescribedBy : Proc(IUIAutomationElement2*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsTo : Proc(IUIAutomationElement2*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProviderDescription : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedProcessId : Proc(IUIAutomationElement2*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedControlType : Proc(IUIAutomationElement2*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLocalizedControlType : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedName : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAcceleratorKey : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAccessKey : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHasKeyboardFocus : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsKeyboardFocusable : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsEnabled : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedAutomationId : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedClassName : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHelpText : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedCulture : Proc(IUIAutomationElement2*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedIsControlElement : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsContentElement : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPassword : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedNativeWindowHandle : Proc(IUIAutomationElement2*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CachedItemType : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsOffscreen : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOrientation : Proc(IUIAutomationElement2*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CachedFrameworkId : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsRequiredForForm : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedItemStatus : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedBoundingRectangle : Proc(IUIAutomationElement2*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CachedLabeledBy : Proc(IUIAutomationElement2*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedAriaRole : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAriaProperties : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsDataValidForForm : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedControllerFor : Proc(IUIAutomationElement2*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedDescribedBy : Proc(IUIAutomationElement2*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsTo : Proc(IUIAutomationElement2*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedProviderDescription : Proc(IUIAutomationElement2*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_clickable_point : Proc(IUIAutomationElement2*, Win32cr::Foundation::POINT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOptimizeForVisualContent : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOptimizeForVisualContent : Proc(IUIAutomationElement2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentLiveSetting : Proc(IUIAutomationElement2*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CachedLiveSetting : Proc(IUIAutomationElement2*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsFrom : Proc(IUIAutomationElement2*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsFrom : Proc(IUIAutomationElement2*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationElement2, lpVtbl : IUIAutomationElement2Vtbl* do
    GUID = LibC::GUID.new(0x6749c683_u32, 0xf70d_u16, 0x4487_u16, StaticArray[0xa6_u8, 0x98_u8, 0x5f_u8, 0x79_u8, 0xd5_u8, 0x52_u8, 0x90_u8, 0xd6_u8])
    def query_interface(this : IUIAutomationElement2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationElement2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationElement2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_focus(this : IUIAutomationElement2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_focus.call(this)
    end
    def get_runtime_id(this : IUIAutomationElement2*, runtimeId : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_id.call(this, runtimeId)
    end
    def find_first(this : IUIAutomationElement2*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first.call(this, scope, condition, found)
    end
    def find_all(this : IUIAutomationElement2*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all.call(this, scope, condition, found)
    end
    def find_first_build_cache(this : IUIAutomationElement2*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def find_all_build_cache(this : IUIAutomationElement2*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def build_updated_cache(this : IUIAutomationElement2*, cacheRequest : Void*, updatedElement : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.build_updated_cache.call(this, cacheRequest, updatedElement)
    end
    def get_current_property_value(this : IUIAutomationElement2*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value.call(this, propertyId, retVal)
    end
    def get_current_property_value_ex(this : IUIAutomationElement2*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_cached_property_value(this : IUIAutomationElement2*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value.call(this, propertyId, retVal)
    end
    def get_cached_property_value_ex(this : IUIAutomationElement2*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_current_pattern_as(this : IUIAutomationElement2*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_cached_pattern_as(this : IUIAutomationElement2*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_current_pattern(this : IUIAutomationElement2*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern.call(this, patternId, patternObject)
    end
    def get_cached_pattern(this : IUIAutomationElement2*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern.call(this, patternId, patternObject)
    end
    def get_cached_parent(this : IUIAutomationElement2*, parent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_parent.call(this, parent)
    end
    def get_cached_children(this : IUIAutomationElement2*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_children.call(this, children)
    end
    def get_CurrentProcessId(this : IUIAutomationElement2*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProcessId.call(this, retVal)
    end
    def get_CurrentControlType(this : IUIAutomationElement2*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControlType.call(this, retVal)
    end
    def get_CurrentLocalizedControlType(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLocalizedControlType.call(this, retVal)
    end
    def get_CurrentName(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentName.call(this, retVal)
    end
    def get_CurrentAcceleratorKey(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAcceleratorKey.call(this, retVal)
    end
    def get_CurrentAccessKey(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAccessKey.call(this, retVal)
    end
    def get_CurrentHasKeyboardFocus(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHasKeyboardFocus.call(this, retVal)
    end
    def get_CurrentIsKeyboardFocusable(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsKeyboardFocusable.call(this, retVal)
    end
    def get_CurrentIsEnabled(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsEnabled.call(this, retVal)
    end
    def get_CurrentAutomationId(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAutomationId.call(this, retVal)
    end
    def get_CurrentClassName(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentClassName.call(this, retVal)
    end
    def get_CurrentHelpText(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHelpText.call(this, retVal)
    end
    def get_CurrentCulture(this : IUIAutomationElement2*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCulture.call(this, retVal)
    end
    def get_CurrentIsControlElement(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsControlElement.call(this, retVal)
    end
    def get_CurrentIsContentElement(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsContentElement.call(this, retVal)
    end
    def get_CurrentIsPassword(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPassword.call(this, retVal)
    end
    def get_CurrentNativeWindowHandle(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentNativeWindowHandle.call(this, retVal)
    end
    def get_CurrentItemType(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemType.call(this, retVal)
    end
    def get_CurrentIsOffscreen(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsOffscreen.call(this, retVal)
    end
    def get_CurrentOrientation(this : IUIAutomationElement2*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOrientation.call(this, retVal)
    end
    def get_CurrentFrameworkId(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFrameworkId.call(this, retVal)
    end
    def get_CurrentIsRequiredForForm(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsRequiredForForm.call(this, retVal)
    end
    def get_CurrentItemStatus(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemStatus.call(this, retVal)
    end
    def get_CurrentBoundingRectangle(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentBoundingRectangle.call(this, retVal)
    end
    def get_CurrentLabeledBy(this : IUIAutomationElement2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLabeledBy.call(this, retVal)
    end
    def get_CurrentAriaRole(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaRole.call(this, retVal)
    end
    def get_CurrentAriaProperties(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaProperties.call(this, retVal)
    end
    def get_CurrentIsDataValidForForm(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsDataValidForForm.call(this, retVal)
    end
    def get_CurrentControllerFor(this : IUIAutomationElement2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControllerFor.call(this, retVal)
    end
    def get_CurrentDescribedBy(this : IUIAutomationElement2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDescribedBy.call(this, retVal)
    end
    def get_CurrentFlowsTo(this : IUIAutomationElement2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsTo.call(this, retVal)
    end
    def get_CurrentProviderDescription(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProviderDescription.call(this, retVal)
    end
    def get_CachedProcessId(this : IUIAutomationElement2*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProcessId.call(this, retVal)
    end
    def get_CachedControlType(this : IUIAutomationElement2*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControlType.call(this, retVal)
    end
    def get_CachedLocalizedControlType(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLocalizedControlType.call(this, retVal)
    end
    def get_CachedName(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedName.call(this, retVal)
    end
    def get_CachedAcceleratorKey(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAcceleratorKey.call(this, retVal)
    end
    def get_CachedAccessKey(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAccessKey.call(this, retVal)
    end
    def get_CachedHasKeyboardFocus(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHasKeyboardFocus.call(this, retVal)
    end
    def get_CachedIsKeyboardFocusable(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsKeyboardFocusable.call(this, retVal)
    end
    def get_CachedIsEnabled(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsEnabled.call(this, retVal)
    end
    def get_CachedAutomationId(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAutomationId.call(this, retVal)
    end
    def get_CachedClassName(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedClassName.call(this, retVal)
    end
    def get_CachedHelpText(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHelpText.call(this, retVal)
    end
    def get_CachedCulture(this : IUIAutomationElement2*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCulture.call(this, retVal)
    end
    def get_CachedIsControlElement(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsControlElement.call(this, retVal)
    end
    def get_CachedIsContentElement(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsContentElement.call(this, retVal)
    end
    def get_CachedIsPassword(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPassword.call(this, retVal)
    end
    def get_CachedNativeWindowHandle(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedNativeWindowHandle.call(this, retVal)
    end
    def get_CachedItemType(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemType.call(this, retVal)
    end
    def get_CachedIsOffscreen(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsOffscreen.call(this, retVal)
    end
    def get_CachedOrientation(this : IUIAutomationElement2*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOrientation.call(this, retVal)
    end
    def get_CachedFrameworkId(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFrameworkId.call(this, retVal)
    end
    def get_CachedIsRequiredForForm(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsRequiredForForm.call(this, retVal)
    end
    def get_CachedItemStatus(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemStatus.call(this, retVal)
    end
    def get_CachedBoundingRectangle(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedBoundingRectangle.call(this, retVal)
    end
    def get_CachedLabeledBy(this : IUIAutomationElement2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLabeledBy.call(this, retVal)
    end
    def get_CachedAriaRole(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaRole.call(this, retVal)
    end
    def get_CachedAriaProperties(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaProperties.call(this, retVal)
    end
    def get_CachedIsDataValidForForm(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsDataValidForForm.call(this, retVal)
    end
    def get_CachedControllerFor(this : IUIAutomationElement2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControllerFor.call(this, retVal)
    end
    def get_CachedDescribedBy(this : IUIAutomationElement2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDescribedBy.call(this, retVal)
    end
    def get_CachedFlowsTo(this : IUIAutomationElement2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsTo.call(this, retVal)
    end
    def get_CachedProviderDescription(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProviderDescription.call(this, retVal)
    end
    def get_clickable_point(this : IUIAutomationElement2*, clickable : Win32cr::Foundation::POINT*, gotClickable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clickable_point.call(this, clickable, gotClickable)
    end
    def get_CurrentOptimizeForVisualContent(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOptimizeForVisualContent.call(this, retVal)
    end
    def get_CachedOptimizeForVisualContent(this : IUIAutomationElement2*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOptimizeForVisualContent.call(this, retVal)
    end
    def get_CurrentLiveSetting(this : IUIAutomationElement2*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLiveSetting.call(this, retVal)
    end
    def get_CachedLiveSetting(this : IUIAutomationElement2*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLiveSetting.call(this, retVal)
    end
    def get_CurrentFlowsFrom(this : IUIAutomationElement2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsFrom.call(this, retVal)
    end
    def get_CachedFlowsFrom(this : IUIAutomationElement2*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsFrom.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationElement3Vtbl,
    query_interface : Proc(IUIAutomationElement3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationElement3*, UInt32),
    release : Proc(IUIAutomationElement3*, UInt32),
    set_focus : Proc(IUIAutomationElement3*, Win32cr::Foundation::HRESULT),
    get_runtime_id : Proc(IUIAutomationElement3*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    find_first : Proc(IUIAutomationElement3*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all : Proc(IUIAutomationElement3*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_first_build_cache : Proc(IUIAutomationElement3*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_build_cache : Proc(IUIAutomationElement3*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    build_updated_cache : Proc(IUIAutomationElement3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_current_property_value : Proc(IUIAutomationElement3*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_property_value_ex : Proc(IUIAutomationElement3*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value : Proc(IUIAutomationElement3*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value_ex : Proc(IUIAutomationElement3*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_pattern_as : Proc(IUIAutomationElement3*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern_as : Proc(IUIAutomationElement3*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_current_pattern : Proc(IUIAutomationElement3*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern : Proc(IUIAutomationElement3*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_parent : Proc(IUIAutomationElement3*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_children : Proc(IUIAutomationElement3*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProcessId : Proc(IUIAutomationElement3*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentControlType : Proc(IUIAutomationElement3*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLocalizedControlType : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentName : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAcceleratorKey : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAccessKey : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHasKeyboardFocus : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsKeyboardFocusable : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsEnabled : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentAutomationId : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentClassName : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHelpText : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentCulture : Proc(IUIAutomationElement3*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentIsControlElement : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsContentElement : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPassword : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentNativeWindowHandle : Proc(IUIAutomationElement3*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CurrentItemType : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsOffscreen : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOrientation : Proc(IUIAutomationElement3*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CurrentFrameworkId : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsRequiredForForm : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentItemStatus : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentBoundingRectangle : Proc(IUIAutomationElement3*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CurrentLabeledBy : Proc(IUIAutomationElement3*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentAriaRole : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAriaProperties : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsDataValidForForm : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentControllerFor : Proc(IUIAutomationElement3*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentDescribedBy : Proc(IUIAutomationElement3*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsTo : Proc(IUIAutomationElement3*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProviderDescription : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedProcessId : Proc(IUIAutomationElement3*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedControlType : Proc(IUIAutomationElement3*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLocalizedControlType : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedName : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAcceleratorKey : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAccessKey : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHasKeyboardFocus : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsKeyboardFocusable : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsEnabled : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedAutomationId : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedClassName : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHelpText : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedCulture : Proc(IUIAutomationElement3*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedIsControlElement : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsContentElement : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPassword : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedNativeWindowHandle : Proc(IUIAutomationElement3*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CachedItemType : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsOffscreen : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOrientation : Proc(IUIAutomationElement3*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CachedFrameworkId : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsRequiredForForm : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedItemStatus : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedBoundingRectangle : Proc(IUIAutomationElement3*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CachedLabeledBy : Proc(IUIAutomationElement3*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedAriaRole : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAriaProperties : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsDataValidForForm : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedControllerFor : Proc(IUIAutomationElement3*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedDescribedBy : Proc(IUIAutomationElement3*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsTo : Proc(IUIAutomationElement3*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedProviderDescription : Proc(IUIAutomationElement3*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_clickable_point : Proc(IUIAutomationElement3*, Win32cr::Foundation::POINT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOptimizeForVisualContent : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOptimizeForVisualContent : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentLiveSetting : Proc(IUIAutomationElement3*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CachedLiveSetting : Proc(IUIAutomationElement3*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsFrom : Proc(IUIAutomationElement3*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsFrom : Proc(IUIAutomationElement3*, Void**, Win32cr::Foundation::HRESULT),
    show_context_menu : Proc(IUIAutomationElement3*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPeripheral : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPeripheral : Proc(IUIAutomationElement3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationElement3, lpVtbl : IUIAutomationElement3Vtbl* do
    GUID = LibC::GUID.new(0x8471df34_u32, 0xaee0_u16, 0x4a01_u16, StaticArray[0xa7_u8, 0xde_u8, 0x7d_u8, 0xb9_u8, 0xaf_u8, 0x12_u8, 0xc2_u8, 0x96_u8])
    def query_interface(this : IUIAutomationElement3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationElement3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationElement3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_focus(this : IUIAutomationElement3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_focus.call(this)
    end
    def get_runtime_id(this : IUIAutomationElement3*, runtimeId : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_id.call(this, runtimeId)
    end
    def find_first(this : IUIAutomationElement3*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first.call(this, scope, condition, found)
    end
    def find_all(this : IUIAutomationElement3*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all.call(this, scope, condition, found)
    end
    def find_first_build_cache(this : IUIAutomationElement3*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def find_all_build_cache(this : IUIAutomationElement3*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def build_updated_cache(this : IUIAutomationElement3*, cacheRequest : Void*, updatedElement : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.build_updated_cache.call(this, cacheRequest, updatedElement)
    end
    def get_current_property_value(this : IUIAutomationElement3*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value.call(this, propertyId, retVal)
    end
    def get_current_property_value_ex(this : IUIAutomationElement3*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_cached_property_value(this : IUIAutomationElement3*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value.call(this, propertyId, retVal)
    end
    def get_cached_property_value_ex(this : IUIAutomationElement3*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_current_pattern_as(this : IUIAutomationElement3*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_cached_pattern_as(this : IUIAutomationElement3*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_current_pattern(this : IUIAutomationElement3*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern.call(this, patternId, patternObject)
    end
    def get_cached_pattern(this : IUIAutomationElement3*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern.call(this, patternId, patternObject)
    end
    def get_cached_parent(this : IUIAutomationElement3*, parent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_parent.call(this, parent)
    end
    def get_cached_children(this : IUIAutomationElement3*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_children.call(this, children)
    end
    def get_CurrentProcessId(this : IUIAutomationElement3*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProcessId.call(this, retVal)
    end
    def get_CurrentControlType(this : IUIAutomationElement3*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControlType.call(this, retVal)
    end
    def get_CurrentLocalizedControlType(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLocalizedControlType.call(this, retVal)
    end
    def get_CurrentName(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentName.call(this, retVal)
    end
    def get_CurrentAcceleratorKey(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAcceleratorKey.call(this, retVal)
    end
    def get_CurrentAccessKey(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAccessKey.call(this, retVal)
    end
    def get_CurrentHasKeyboardFocus(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHasKeyboardFocus.call(this, retVal)
    end
    def get_CurrentIsKeyboardFocusable(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsKeyboardFocusable.call(this, retVal)
    end
    def get_CurrentIsEnabled(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsEnabled.call(this, retVal)
    end
    def get_CurrentAutomationId(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAutomationId.call(this, retVal)
    end
    def get_CurrentClassName(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentClassName.call(this, retVal)
    end
    def get_CurrentHelpText(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHelpText.call(this, retVal)
    end
    def get_CurrentCulture(this : IUIAutomationElement3*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCulture.call(this, retVal)
    end
    def get_CurrentIsControlElement(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsControlElement.call(this, retVal)
    end
    def get_CurrentIsContentElement(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsContentElement.call(this, retVal)
    end
    def get_CurrentIsPassword(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPassword.call(this, retVal)
    end
    def get_CurrentNativeWindowHandle(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentNativeWindowHandle.call(this, retVal)
    end
    def get_CurrentItemType(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemType.call(this, retVal)
    end
    def get_CurrentIsOffscreen(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsOffscreen.call(this, retVal)
    end
    def get_CurrentOrientation(this : IUIAutomationElement3*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOrientation.call(this, retVal)
    end
    def get_CurrentFrameworkId(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFrameworkId.call(this, retVal)
    end
    def get_CurrentIsRequiredForForm(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsRequiredForForm.call(this, retVal)
    end
    def get_CurrentItemStatus(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemStatus.call(this, retVal)
    end
    def get_CurrentBoundingRectangle(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentBoundingRectangle.call(this, retVal)
    end
    def get_CurrentLabeledBy(this : IUIAutomationElement3*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLabeledBy.call(this, retVal)
    end
    def get_CurrentAriaRole(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaRole.call(this, retVal)
    end
    def get_CurrentAriaProperties(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaProperties.call(this, retVal)
    end
    def get_CurrentIsDataValidForForm(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsDataValidForForm.call(this, retVal)
    end
    def get_CurrentControllerFor(this : IUIAutomationElement3*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControllerFor.call(this, retVal)
    end
    def get_CurrentDescribedBy(this : IUIAutomationElement3*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDescribedBy.call(this, retVal)
    end
    def get_CurrentFlowsTo(this : IUIAutomationElement3*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsTo.call(this, retVal)
    end
    def get_CurrentProviderDescription(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProviderDescription.call(this, retVal)
    end
    def get_CachedProcessId(this : IUIAutomationElement3*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProcessId.call(this, retVal)
    end
    def get_CachedControlType(this : IUIAutomationElement3*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControlType.call(this, retVal)
    end
    def get_CachedLocalizedControlType(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLocalizedControlType.call(this, retVal)
    end
    def get_CachedName(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedName.call(this, retVal)
    end
    def get_CachedAcceleratorKey(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAcceleratorKey.call(this, retVal)
    end
    def get_CachedAccessKey(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAccessKey.call(this, retVal)
    end
    def get_CachedHasKeyboardFocus(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHasKeyboardFocus.call(this, retVal)
    end
    def get_CachedIsKeyboardFocusable(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsKeyboardFocusable.call(this, retVal)
    end
    def get_CachedIsEnabled(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsEnabled.call(this, retVal)
    end
    def get_CachedAutomationId(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAutomationId.call(this, retVal)
    end
    def get_CachedClassName(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedClassName.call(this, retVal)
    end
    def get_CachedHelpText(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHelpText.call(this, retVal)
    end
    def get_CachedCulture(this : IUIAutomationElement3*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCulture.call(this, retVal)
    end
    def get_CachedIsControlElement(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsControlElement.call(this, retVal)
    end
    def get_CachedIsContentElement(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsContentElement.call(this, retVal)
    end
    def get_CachedIsPassword(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPassword.call(this, retVal)
    end
    def get_CachedNativeWindowHandle(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedNativeWindowHandle.call(this, retVal)
    end
    def get_CachedItemType(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemType.call(this, retVal)
    end
    def get_CachedIsOffscreen(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsOffscreen.call(this, retVal)
    end
    def get_CachedOrientation(this : IUIAutomationElement3*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOrientation.call(this, retVal)
    end
    def get_CachedFrameworkId(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFrameworkId.call(this, retVal)
    end
    def get_CachedIsRequiredForForm(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsRequiredForForm.call(this, retVal)
    end
    def get_CachedItemStatus(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemStatus.call(this, retVal)
    end
    def get_CachedBoundingRectangle(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedBoundingRectangle.call(this, retVal)
    end
    def get_CachedLabeledBy(this : IUIAutomationElement3*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLabeledBy.call(this, retVal)
    end
    def get_CachedAriaRole(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaRole.call(this, retVal)
    end
    def get_CachedAriaProperties(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaProperties.call(this, retVal)
    end
    def get_CachedIsDataValidForForm(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsDataValidForForm.call(this, retVal)
    end
    def get_CachedControllerFor(this : IUIAutomationElement3*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControllerFor.call(this, retVal)
    end
    def get_CachedDescribedBy(this : IUIAutomationElement3*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDescribedBy.call(this, retVal)
    end
    def get_CachedFlowsTo(this : IUIAutomationElement3*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsTo.call(this, retVal)
    end
    def get_CachedProviderDescription(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProviderDescription.call(this, retVal)
    end
    def get_clickable_point(this : IUIAutomationElement3*, clickable : Win32cr::Foundation::POINT*, gotClickable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clickable_point.call(this, clickable, gotClickable)
    end
    def get_CurrentOptimizeForVisualContent(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOptimizeForVisualContent.call(this, retVal)
    end
    def get_CachedOptimizeForVisualContent(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOptimizeForVisualContent.call(this, retVal)
    end
    def get_CurrentLiveSetting(this : IUIAutomationElement3*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLiveSetting.call(this, retVal)
    end
    def get_CachedLiveSetting(this : IUIAutomationElement3*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLiveSetting.call(this, retVal)
    end
    def get_CurrentFlowsFrom(this : IUIAutomationElement3*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsFrom.call(this, retVal)
    end
    def get_CachedFlowsFrom(this : IUIAutomationElement3*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsFrom.call(this, retVal)
    end
    def show_context_menu(this : IUIAutomationElement3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_context_menu.call(this)
    end
    def get_CurrentIsPeripheral(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPeripheral.call(this, retVal)
    end
    def get_CachedIsPeripheral(this : IUIAutomationElement3*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPeripheral.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationElement4Vtbl,
    query_interface : Proc(IUIAutomationElement4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationElement4*, UInt32),
    release : Proc(IUIAutomationElement4*, UInt32),
    set_focus : Proc(IUIAutomationElement4*, Win32cr::Foundation::HRESULT),
    get_runtime_id : Proc(IUIAutomationElement4*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    find_first : Proc(IUIAutomationElement4*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all : Proc(IUIAutomationElement4*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_first_build_cache : Proc(IUIAutomationElement4*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_build_cache : Proc(IUIAutomationElement4*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    build_updated_cache : Proc(IUIAutomationElement4*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_current_property_value : Proc(IUIAutomationElement4*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_property_value_ex : Proc(IUIAutomationElement4*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value : Proc(IUIAutomationElement4*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value_ex : Proc(IUIAutomationElement4*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_pattern_as : Proc(IUIAutomationElement4*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern_as : Proc(IUIAutomationElement4*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_current_pattern : Proc(IUIAutomationElement4*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern : Proc(IUIAutomationElement4*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_parent : Proc(IUIAutomationElement4*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_children : Proc(IUIAutomationElement4*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProcessId : Proc(IUIAutomationElement4*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentControlType : Proc(IUIAutomationElement4*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLocalizedControlType : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentName : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAcceleratorKey : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAccessKey : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHasKeyboardFocus : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsKeyboardFocusable : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsEnabled : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentAutomationId : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentClassName : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHelpText : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentCulture : Proc(IUIAutomationElement4*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentIsControlElement : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsContentElement : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPassword : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentNativeWindowHandle : Proc(IUIAutomationElement4*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CurrentItemType : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsOffscreen : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOrientation : Proc(IUIAutomationElement4*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CurrentFrameworkId : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsRequiredForForm : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentItemStatus : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentBoundingRectangle : Proc(IUIAutomationElement4*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CurrentLabeledBy : Proc(IUIAutomationElement4*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentAriaRole : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAriaProperties : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsDataValidForForm : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentControllerFor : Proc(IUIAutomationElement4*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentDescribedBy : Proc(IUIAutomationElement4*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsTo : Proc(IUIAutomationElement4*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProviderDescription : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedProcessId : Proc(IUIAutomationElement4*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedControlType : Proc(IUIAutomationElement4*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLocalizedControlType : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedName : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAcceleratorKey : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAccessKey : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHasKeyboardFocus : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsKeyboardFocusable : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsEnabled : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedAutomationId : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedClassName : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHelpText : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedCulture : Proc(IUIAutomationElement4*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedIsControlElement : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsContentElement : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPassword : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedNativeWindowHandle : Proc(IUIAutomationElement4*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CachedItemType : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsOffscreen : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOrientation : Proc(IUIAutomationElement4*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CachedFrameworkId : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsRequiredForForm : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedItemStatus : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedBoundingRectangle : Proc(IUIAutomationElement4*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CachedLabeledBy : Proc(IUIAutomationElement4*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedAriaRole : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAriaProperties : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsDataValidForForm : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedControllerFor : Proc(IUIAutomationElement4*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedDescribedBy : Proc(IUIAutomationElement4*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsTo : Proc(IUIAutomationElement4*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedProviderDescription : Proc(IUIAutomationElement4*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_clickable_point : Proc(IUIAutomationElement4*, Win32cr::Foundation::POINT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOptimizeForVisualContent : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOptimizeForVisualContent : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentLiveSetting : Proc(IUIAutomationElement4*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CachedLiveSetting : Proc(IUIAutomationElement4*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsFrom : Proc(IUIAutomationElement4*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsFrom : Proc(IUIAutomationElement4*, Void**, Win32cr::Foundation::HRESULT),
    show_context_menu : Proc(IUIAutomationElement4*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPeripheral : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPeripheral : Proc(IUIAutomationElement4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentPositionInSet : Proc(IUIAutomationElement4*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentSizeOfSet : Proc(IUIAutomationElement4*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLevel : Proc(IUIAutomationElement4*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentAnnotationTypes : Proc(IUIAutomationElement4*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CurrentAnnotationObjects : Proc(IUIAutomationElement4*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedPositionInSet : Proc(IUIAutomationElement4*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedSizeOfSet : Proc(IUIAutomationElement4*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLevel : Proc(IUIAutomationElement4*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedAnnotationTypes : Proc(IUIAutomationElement4*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CachedAnnotationObjects : Proc(IUIAutomationElement4*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationElement4, lpVtbl : IUIAutomationElement4Vtbl* do
    GUID = LibC::GUID.new(0x3b6e233c_u32, 0x52fb_u16, 0x4063_u16, StaticArray[0xa4_u8, 0xc9_u8, 0x77_u8, 0xc0_u8, 0x75_u8, 0xc2_u8, 0xa0_u8, 0x6b_u8])
    def query_interface(this : IUIAutomationElement4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationElement4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationElement4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_focus(this : IUIAutomationElement4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_focus.call(this)
    end
    def get_runtime_id(this : IUIAutomationElement4*, runtimeId : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_id.call(this, runtimeId)
    end
    def find_first(this : IUIAutomationElement4*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first.call(this, scope, condition, found)
    end
    def find_all(this : IUIAutomationElement4*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all.call(this, scope, condition, found)
    end
    def find_first_build_cache(this : IUIAutomationElement4*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def find_all_build_cache(this : IUIAutomationElement4*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def build_updated_cache(this : IUIAutomationElement4*, cacheRequest : Void*, updatedElement : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.build_updated_cache.call(this, cacheRequest, updatedElement)
    end
    def get_current_property_value(this : IUIAutomationElement4*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value.call(this, propertyId, retVal)
    end
    def get_current_property_value_ex(this : IUIAutomationElement4*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_cached_property_value(this : IUIAutomationElement4*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value.call(this, propertyId, retVal)
    end
    def get_cached_property_value_ex(this : IUIAutomationElement4*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_current_pattern_as(this : IUIAutomationElement4*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_cached_pattern_as(this : IUIAutomationElement4*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_current_pattern(this : IUIAutomationElement4*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern.call(this, patternId, patternObject)
    end
    def get_cached_pattern(this : IUIAutomationElement4*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern.call(this, patternId, patternObject)
    end
    def get_cached_parent(this : IUIAutomationElement4*, parent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_parent.call(this, parent)
    end
    def get_cached_children(this : IUIAutomationElement4*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_children.call(this, children)
    end
    def get_CurrentProcessId(this : IUIAutomationElement4*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProcessId.call(this, retVal)
    end
    def get_CurrentControlType(this : IUIAutomationElement4*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControlType.call(this, retVal)
    end
    def get_CurrentLocalizedControlType(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLocalizedControlType.call(this, retVal)
    end
    def get_CurrentName(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentName.call(this, retVal)
    end
    def get_CurrentAcceleratorKey(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAcceleratorKey.call(this, retVal)
    end
    def get_CurrentAccessKey(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAccessKey.call(this, retVal)
    end
    def get_CurrentHasKeyboardFocus(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHasKeyboardFocus.call(this, retVal)
    end
    def get_CurrentIsKeyboardFocusable(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsKeyboardFocusable.call(this, retVal)
    end
    def get_CurrentIsEnabled(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsEnabled.call(this, retVal)
    end
    def get_CurrentAutomationId(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAutomationId.call(this, retVal)
    end
    def get_CurrentClassName(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentClassName.call(this, retVal)
    end
    def get_CurrentHelpText(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHelpText.call(this, retVal)
    end
    def get_CurrentCulture(this : IUIAutomationElement4*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCulture.call(this, retVal)
    end
    def get_CurrentIsControlElement(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsControlElement.call(this, retVal)
    end
    def get_CurrentIsContentElement(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsContentElement.call(this, retVal)
    end
    def get_CurrentIsPassword(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPassword.call(this, retVal)
    end
    def get_CurrentNativeWindowHandle(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentNativeWindowHandle.call(this, retVal)
    end
    def get_CurrentItemType(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemType.call(this, retVal)
    end
    def get_CurrentIsOffscreen(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsOffscreen.call(this, retVal)
    end
    def get_CurrentOrientation(this : IUIAutomationElement4*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOrientation.call(this, retVal)
    end
    def get_CurrentFrameworkId(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFrameworkId.call(this, retVal)
    end
    def get_CurrentIsRequiredForForm(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsRequiredForForm.call(this, retVal)
    end
    def get_CurrentItemStatus(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemStatus.call(this, retVal)
    end
    def get_CurrentBoundingRectangle(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentBoundingRectangle.call(this, retVal)
    end
    def get_CurrentLabeledBy(this : IUIAutomationElement4*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLabeledBy.call(this, retVal)
    end
    def get_CurrentAriaRole(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaRole.call(this, retVal)
    end
    def get_CurrentAriaProperties(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaProperties.call(this, retVal)
    end
    def get_CurrentIsDataValidForForm(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsDataValidForForm.call(this, retVal)
    end
    def get_CurrentControllerFor(this : IUIAutomationElement4*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControllerFor.call(this, retVal)
    end
    def get_CurrentDescribedBy(this : IUIAutomationElement4*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDescribedBy.call(this, retVal)
    end
    def get_CurrentFlowsTo(this : IUIAutomationElement4*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsTo.call(this, retVal)
    end
    def get_CurrentProviderDescription(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProviderDescription.call(this, retVal)
    end
    def get_CachedProcessId(this : IUIAutomationElement4*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProcessId.call(this, retVal)
    end
    def get_CachedControlType(this : IUIAutomationElement4*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControlType.call(this, retVal)
    end
    def get_CachedLocalizedControlType(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLocalizedControlType.call(this, retVal)
    end
    def get_CachedName(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedName.call(this, retVal)
    end
    def get_CachedAcceleratorKey(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAcceleratorKey.call(this, retVal)
    end
    def get_CachedAccessKey(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAccessKey.call(this, retVal)
    end
    def get_CachedHasKeyboardFocus(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHasKeyboardFocus.call(this, retVal)
    end
    def get_CachedIsKeyboardFocusable(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsKeyboardFocusable.call(this, retVal)
    end
    def get_CachedIsEnabled(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsEnabled.call(this, retVal)
    end
    def get_CachedAutomationId(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAutomationId.call(this, retVal)
    end
    def get_CachedClassName(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedClassName.call(this, retVal)
    end
    def get_CachedHelpText(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHelpText.call(this, retVal)
    end
    def get_CachedCulture(this : IUIAutomationElement4*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCulture.call(this, retVal)
    end
    def get_CachedIsControlElement(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsControlElement.call(this, retVal)
    end
    def get_CachedIsContentElement(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsContentElement.call(this, retVal)
    end
    def get_CachedIsPassword(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPassword.call(this, retVal)
    end
    def get_CachedNativeWindowHandle(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedNativeWindowHandle.call(this, retVal)
    end
    def get_CachedItemType(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemType.call(this, retVal)
    end
    def get_CachedIsOffscreen(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsOffscreen.call(this, retVal)
    end
    def get_CachedOrientation(this : IUIAutomationElement4*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOrientation.call(this, retVal)
    end
    def get_CachedFrameworkId(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFrameworkId.call(this, retVal)
    end
    def get_CachedIsRequiredForForm(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsRequiredForForm.call(this, retVal)
    end
    def get_CachedItemStatus(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemStatus.call(this, retVal)
    end
    def get_CachedBoundingRectangle(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedBoundingRectangle.call(this, retVal)
    end
    def get_CachedLabeledBy(this : IUIAutomationElement4*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLabeledBy.call(this, retVal)
    end
    def get_CachedAriaRole(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaRole.call(this, retVal)
    end
    def get_CachedAriaProperties(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaProperties.call(this, retVal)
    end
    def get_CachedIsDataValidForForm(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsDataValidForForm.call(this, retVal)
    end
    def get_CachedControllerFor(this : IUIAutomationElement4*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControllerFor.call(this, retVal)
    end
    def get_CachedDescribedBy(this : IUIAutomationElement4*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDescribedBy.call(this, retVal)
    end
    def get_CachedFlowsTo(this : IUIAutomationElement4*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsTo.call(this, retVal)
    end
    def get_CachedProviderDescription(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProviderDescription.call(this, retVal)
    end
    def get_clickable_point(this : IUIAutomationElement4*, clickable : Win32cr::Foundation::POINT*, gotClickable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clickable_point.call(this, clickable, gotClickable)
    end
    def get_CurrentOptimizeForVisualContent(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOptimizeForVisualContent.call(this, retVal)
    end
    def get_CachedOptimizeForVisualContent(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOptimizeForVisualContent.call(this, retVal)
    end
    def get_CurrentLiveSetting(this : IUIAutomationElement4*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLiveSetting.call(this, retVal)
    end
    def get_CachedLiveSetting(this : IUIAutomationElement4*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLiveSetting.call(this, retVal)
    end
    def get_CurrentFlowsFrom(this : IUIAutomationElement4*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsFrom.call(this, retVal)
    end
    def get_CachedFlowsFrom(this : IUIAutomationElement4*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsFrom.call(this, retVal)
    end
    def show_context_menu(this : IUIAutomationElement4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_context_menu.call(this)
    end
    def get_CurrentIsPeripheral(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPeripheral.call(this, retVal)
    end
    def get_CachedIsPeripheral(this : IUIAutomationElement4*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPeripheral.call(this, retVal)
    end
    def get_CurrentPositionInSet(this : IUIAutomationElement4*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentPositionInSet.call(this, retVal)
    end
    def get_CurrentSizeOfSet(this : IUIAutomationElement4*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentSizeOfSet.call(this, retVal)
    end
    def get_CurrentLevel(this : IUIAutomationElement4*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLevel.call(this, retVal)
    end
    def get_CurrentAnnotationTypes(this : IUIAutomationElement4*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAnnotationTypes.call(this, retVal)
    end
    def get_CurrentAnnotationObjects(this : IUIAutomationElement4*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAnnotationObjects.call(this, retVal)
    end
    def get_CachedPositionInSet(this : IUIAutomationElement4*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedPositionInSet.call(this, retVal)
    end
    def get_CachedSizeOfSet(this : IUIAutomationElement4*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedSizeOfSet.call(this, retVal)
    end
    def get_CachedLevel(this : IUIAutomationElement4*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLevel.call(this, retVal)
    end
    def get_CachedAnnotationTypes(this : IUIAutomationElement4*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAnnotationTypes.call(this, retVal)
    end
    def get_CachedAnnotationObjects(this : IUIAutomationElement4*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAnnotationObjects.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationElement5Vtbl,
    query_interface : Proc(IUIAutomationElement5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationElement5*, UInt32),
    release : Proc(IUIAutomationElement5*, UInt32),
    set_focus : Proc(IUIAutomationElement5*, Win32cr::Foundation::HRESULT),
    get_runtime_id : Proc(IUIAutomationElement5*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    find_first : Proc(IUIAutomationElement5*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all : Proc(IUIAutomationElement5*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_first_build_cache : Proc(IUIAutomationElement5*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_build_cache : Proc(IUIAutomationElement5*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    build_updated_cache : Proc(IUIAutomationElement5*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_current_property_value : Proc(IUIAutomationElement5*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_property_value_ex : Proc(IUIAutomationElement5*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value : Proc(IUIAutomationElement5*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value_ex : Proc(IUIAutomationElement5*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_pattern_as : Proc(IUIAutomationElement5*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern_as : Proc(IUIAutomationElement5*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_current_pattern : Proc(IUIAutomationElement5*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern : Proc(IUIAutomationElement5*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_parent : Proc(IUIAutomationElement5*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_children : Proc(IUIAutomationElement5*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProcessId : Proc(IUIAutomationElement5*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentControlType : Proc(IUIAutomationElement5*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLocalizedControlType : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentName : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAcceleratorKey : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAccessKey : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHasKeyboardFocus : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsKeyboardFocusable : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsEnabled : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentAutomationId : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentClassName : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHelpText : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentCulture : Proc(IUIAutomationElement5*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentIsControlElement : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsContentElement : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPassword : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentNativeWindowHandle : Proc(IUIAutomationElement5*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CurrentItemType : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsOffscreen : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOrientation : Proc(IUIAutomationElement5*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CurrentFrameworkId : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsRequiredForForm : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentItemStatus : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentBoundingRectangle : Proc(IUIAutomationElement5*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CurrentLabeledBy : Proc(IUIAutomationElement5*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentAriaRole : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAriaProperties : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsDataValidForForm : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentControllerFor : Proc(IUIAutomationElement5*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentDescribedBy : Proc(IUIAutomationElement5*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsTo : Proc(IUIAutomationElement5*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProviderDescription : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedProcessId : Proc(IUIAutomationElement5*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedControlType : Proc(IUIAutomationElement5*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLocalizedControlType : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedName : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAcceleratorKey : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAccessKey : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHasKeyboardFocus : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsKeyboardFocusable : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsEnabled : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedAutomationId : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedClassName : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHelpText : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedCulture : Proc(IUIAutomationElement5*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedIsControlElement : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsContentElement : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPassword : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedNativeWindowHandle : Proc(IUIAutomationElement5*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CachedItemType : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsOffscreen : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOrientation : Proc(IUIAutomationElement5*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CachedFrameworkId : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsRequiredForForm : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedItemStatus : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedBoundingRectangle : Proc(IUIAutomationElement5*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CachedLabeledBy : Proc(IUIAutomationElement5*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedAriaRole : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAriaProperties : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsDataValidForForm : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedControllerFor : Proc(IUIAutomationElement5*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedDescribedBy : Proc(IUIAutomationElement5*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsTo : Proc(IUIAutomationElement5*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedProviderDescription : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_clickable_point : Proc(IUIAutomationElement5*, Win32cr::Foundation::POINT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOptimizeForVisualContent : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOptimizeForVisualContent : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentLiveSetting : Proc(IUIAutomationElement5*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CachedLiveSetting : Proc(IUIAutomationElement5*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsFrom : Proc(IUIAutomationElement5*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsFrom : Proc(IUIAutomationElement5*, Void**, Win32cr::Foundation::HRESULT),
    show_context_menu : Proc(IUIAutomationElement5*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPeripheral : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPeripheral : Proc(IUIAutomationElement5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentPositionInSet : Proc(IUIAutomationElement5*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentSizeOfSet : Proc(IUIAutomationElement5*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLevel : Proc(IUIAutomationElement5*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentAnnotationTypes : Proc(IUIAutomationElement5*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CurrentAnnotationObjects : Proc(IUIAutomationElement5*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedPositionInSet : Proc(IUIAutomationElement5*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedSizeOfSet : Proc(IUIAutomationElement5*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLevel : Proc(IUIAutomationElement5*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedAnnotationTypes : Proc(IUIAutomationElement5*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CachedAnnotationObjects : Proc(IUIAutomationElement5*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentLandmarkType : Proc(IUIAutomationElement5*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLocalizedLandmarkType : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedLandmarkType : Proc(IUIAutomationElement5*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLocalizedLandmarkType : Proc(IUIAutomationElement5*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationElement5, lpVtbl : IUIAutomationElement5Vtbl* do
    GUID = LibC::GUID.new(0x98141c1d_u32, 0xd0e_u16, 0x4175_u16, StaticArray[0xbb_u8, 0xe2_u8, 0x6b_u8, 0xff_u8, 0x45_u8, 0x58_u8, 0x42_u8, 0xa7_u8])
    def query_interface(this : IUIAutomationElement5*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationElement5*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationElement5*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_focus(this : IUIAutomationElement5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_focus.call(this)
    end
    def get_runtime_id(this : IUIAutomationElement5*, runtimeId : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_id.call(this, runtimeId)
    end
    def find_first(this : IUIAutomationElement5*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first.call(this, scope, condition, found)
    end
    def find_all(this : IUIAutomationElement5*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all.call(this, scope, condition, found)
    end
    def find_first_build_cache(this : IUIAutomationElement5*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def find_all_build_cache(this : IUIAutomationElement5*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def build_updated_cache(this : IUIAutomationElement5*, cacheRequest : Void*, updatedElement : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.build_updated_cache.call(this, cacheRequest, updatedElement)
    end
    def get_current_property_value(this : IUIAutomationElement5*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value.call(this, propertyId, retVal)
    end
    def get_current_property_value_ex(this : IUIAutomationElement5*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_cached_property_value(this : IUIAutomationElement5*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value.call(this, propertyId, retVal)
    end
    def get_cached_property_value_ex(this : IUIAutomationElement5*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_current_pattern_as(this : IUIAutomationElement5*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_cached_pattern_as(this : IUIAutomationElement5*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_current_pattern(this : IUIAutomationElement5*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern.call(this, patternId, patternObject)
    end
    def get_cached_pattern(this : IUIAutomationElement5*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern.call(this, patternId, patternObject)
    end
    def get_cached_parent(this : IUIAutomationElement5*, parent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_parent.call(this, parent)
    end
    def get_cached_children(this : IUIAutomationElement5*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_children.call(this, children)
    end
    def get_CurrentProcessId(this : IUIAutomationElement5*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProcessId.call(this, retVal)
    end
    def get_CurrentControlType(this : IUIAutomationElement5*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControlType.call(this, retVal)
    end
    def get_CurrentLocalizedControlType(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLocalizedControlType.call(this, retVal)
    end
    def get_CurrentName(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentName.call(this, retVal)
    end
    def get_CurrentAcceleratorKey(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAcceleratorKey.call(this, retVal)
    end
    def get_CurrentAccessKey(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAccessKey.call(this, retVal)
    end
    def get_CurrentHasKeyboardFocus(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHasKeyboardFocus.call(this, retVal)
    end
    def get_CurrentIsKeyboardFocusable(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsKeyboardFocusable.call(this, retVal)
    end
    def get_CurrentIsEnabled(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsEnabled.call(this, retVal)
    end
    def get_CurrentAutomationId(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAutomationId.call(this, retVal)
    end
    def get_CurrentClassName(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentClassName.call(this, retVal)
    end
    def get_CurrentHelpText(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHelpText.call(this, retVal)
    end
    def get_CurrentCulture(this : IUIAutomationElement5*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCulture.call(this, retVal)
    end
    def get_CurrentIsControlElement(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsControlElement.call(this, retVal)
    end
    def get_CurrentIsContentElement(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsContentElement.call(this, retVal)
    end
    def get_CurrentIsPassword(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPassword.call(this, retVal)
    end
    def get_CurrentNativeWindowHandle(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentNativeWindowHandle.call(this, retVal)
    end
    def get_CurrentItemType(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemType.call(this, retVal)
    end
    def get_CurrentIsOffscreen(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsOffscreen.call(this, retVal)
    end
    def get_CurrentOrientation(this : IUIAutomationElement5*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOrientation.call(this, retVal)
    end
    def get_CurrentFrameworkId(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFrameworkId.call(this, retVal)
    end
    def get_CurrentIsRequiredForForm(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsRequiredForForm.call(this, retVal)
    end
    def get_CurrentItemStatus(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemStatus.call(this, retVal)
    end
    def get_CurrentBoundingRectangle(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentBoundingRectangle.call(this, retVal)
    end
    def get_CurrentLabeledBy(this : IUIAutomationElement5*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLabeledBy.call(this, retVal)
    end
    def get_CurrentAriaRole(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaRole.call(this, retVal)
    end
    def get_CurrentAriaProperties(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaProperties.call(this, retVal)
    end
    def get_CurrentIsDataValidForForm(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsDataValidForForm.call(this, retVal)
    end
    def get_CurrentControllerFor(this : IUIAutomationElement5*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControllerFor.call(this, retVal)
    end
    def get_CurrentDescribedBy(this : IUIAutomationElement5*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDescribedBy.call(this, retVal)
    end
    def get_CurrentFlowsTo(this : IUIAutomationElement5*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsTo.call(this, retVal)
    end
    def get_CurrentProviderDescription(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProviderDescription.call(this, retVal)
    end
    def get_CachedProcessId(this : IUIAutomationElement5*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProcessId.call(this, retVal)
    end
    def get_CachedControlType(this : IUIAutomationElement5*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControlType.call(this, retVal)
    end
    def get_CachedLocalizedControlType(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLocalizedControlType.call(this, retVal)
    end
    def get_CachedName(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedName.call(this, retVal)
    end
    def get_CachedAcceleratorKey(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAcceleratorKey.call(this, retVal)
    end
    def get_CachedAccessKey(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAccessKey.call(this, retVal)
    end
    def get_CachedHasKeyboardFocus(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHasKeyboardFocus.call(this, retVal)
    end
    def get_CachedIsKeyboardFocusable(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsKeyboardFocusable.call(this, retVal)
    end
    def get_CachedIsEnabled(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsEnabled.call(this, retVal)
    end
    def get_CachedAutomationId(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAutomationId.call(this, retVal)
    end
    def get_CachedClassName(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedClassName.call(this, retVal)
    end
    def get_CachedHelpText(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHelpText.call(this, retVal)
    end
    def get_CachedCulture(this : IUIAutomationElement5*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCulture.call(this, retVal)
    end
    def get_CachedIsControlElement(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsControlElement.call(this, retVal)
    end
    def get_CachedIsContentElement(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsContentElement.call(this, retVal)
    end
    def get_CachedIsPassword(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPassword.call(this, retVal)
    end
    def get_CachedNativeWindowHandle(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedNativeWindowHandle.call(this, retVal)
    end
    def get_CachedItemType(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemType.call(this, retVal)
    end
    def get_CachedIsOffscreen(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsOffscreen.call(this, retVal)
    end
    def get_CachedOrientation(this : IUIAutomationElement5*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOrientation.call(this, retVal)
    end
    def get_CachedFrameworkId(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFrameworkId.call(this, retVal)
    end
    def get_CachedIsRequiredForForm(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsRequiredForForm.call(this, retVal)
    end
    def get_CachedItemStatus(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemStatus.call(this, retVal)
    end
    def get_CachedBoundingRectangle(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedBoundingRectangle.call(this, retVal)
    end
    def get_CachedLabeledBy(this : IUIAutomationElement5*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLabeledBy.call(this, retVal)
    end
    def get_CachedAriaRole(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaRole.call(this, retVal)
    end
    def get_CachedAriaProperties(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaProperties.call(this, retVal)
    end
    def get_CachedIsDataValidForForm(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsDataValidForForm.call(this, retVal)
    end
    def get_CachedControllerFor(this : IUIAutomationElement5*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControllerFor.call(this, retVal)
    end
    def get_CachedDescribedBy(this : IUIAutomationElement5*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDescribedBy.call(this, retVal)
    end
    def get_CachedFlowsTo(this : IUIAutomationElement5*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsTo.call(this, retVal)
    end
    def get_CachedProviderDescription(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProviderDescription.call(this, retVal)
    end
    def get_clickable_point(this : IUIAutomationElement5*, clickable : Win32cr::Foundation::POINT*, gotClickable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clickable_point.call(this, clickable, gotClickable)
    end
    def get_CurrentOptimizeForVisualContent(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOptimizeForVisualContent.call(this, retVal)
    end
    def get_CachedOptimizeForVisualContent(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOptimizeForVisualContent.call(this, retVal)
    end
    def get_CurrentLiveSetting(this : IUIAutomationElement5*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLiveSetting.call(this, retVal)
    end
    def get_CachedLiveSetting(this : IUIAutomationElement5*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLiveSetting.call(this, retVal)
    end
    def get_CurrentFlowsFrom(this : IUIAutomationElement5*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsFrom.call(this, retVal)
    end
    def get_CachedFlowsFrom(this : IUIAutomationElement5*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsFrom.call(this, retVal)
    end
    def show_context_menu(this : IUIAutomationElement5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_context_menu.call(this)
    end
    def get_CurrentIsPeripheral(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPeripheral.call(this, retVal)
    end
    def get_CachedIsPeripheral(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPeripheral.call(this, retVal)
    end
    def get_CurrentPositionInSet(this : IUIAutomationElement5*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentPositionInSet.call(this, retVal)
    end
    def get_CurrentSizeOfSet(this : IUIAutomationElement5*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentSizeOfSet.call(this, retVal)
    end
    def get_CurrentLevel(this : IUIAutomationElement5*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLevel.call(this, retVal)
    end
    def get_CurrentAnnotationTypes(this : IUIAutomationElement5*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAnnotationTypes.call(this, retVal)
    end
    def get_CurrentAnnotationObjects(this : IUIAutomationElement5*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAnnotationObjects.call(this, retVal)
    end
    def get_CachedPositionInSet(this : IUIAutomationElement5*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedPositionInSet.call(this, retVal)
    end
    def get_CachedSizeOfSet(this : IUIAutomationElement5*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedSizeOfSet.call(this, retVal)
    end
    def get_CachedLevel(this : IUIAutomationElement5*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLevel.call(this, retVal)
    end
    def get_CachedAnnotationTypes(this : IUIAutomationElement5*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAnnotationTypes.call(this, retVal)
    end
    def get_CachedAnnotationObjects(this : IUIAutomationElement5*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAnnotationObjects.call(this, retVal)
    end
    def get_CurrentLandmarkType(this : IUIAutomationElement5*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLandmarkType.call(this, retVal)
    end
    def get_CurrentLocalizedLandmarkType(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLocalizedLandmarkType.call(this, retVal)
    end
    def get_CachedLandmarkType(this : IUIAutomationElement5*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLandmarkType.call(this, retVal)
    end
    def get_CachedLocalizedLandmarkType(this : IUIAutomationElement5*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLocalizedLandmarkType.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationElement6Vtbl,
    query_interface : Proc(IUIAutomationElement6*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationElement6*, UInt32),
    release : Proc(IUIAutomationElement6*, UInt32),
    set_focus : Proc(IUIAutomationElement6*, Win32cr::Foundation::HRESULT),
    get_runtime_id : Proc(IUIAutomationElement6*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    find_first : Proc(IUIAutomationElement6*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all : Proc(IUIAutomationElement6*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_first_build_cache : Proc(IUIAutomationElement6*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_build_cache : Proc(IUIAutomationElement6*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    build_updated_cache : Proc(IUIAutomationElement6*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_current_property_value : Proc(IUIAutomationElement6*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_property_value_ex : Proc(IUIAutomationElement6*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value : Proc(IUIAutomationElement6*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value_ex : Proc(IUIAutomationElement6*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_pattern_as : Proc(IUIAutomationElement6*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern_as : Proc(IUIAutomationElement6*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_current_pattern : Proc(IUIAutomationElement6*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern : Proc(IUIAutomationElement6*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_parent : Proc(IUIAutomationElement6*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_children : Proc(IUIAutomationElement6*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProcessId : Proc(IUIAutomationElement6*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentControlType : Proc(IUIAutomationElement6*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLocalizedControlType : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentName : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAcceleratorKey : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAccessKey : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHasKeyboardFocus : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsKeyboardFocusable : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsEnabled : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentAutomationId : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentClassName : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHelpText : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentCulture : Proc(IUIAutomationElement6*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentIsControlElement : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsContentElement : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPassword : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentNativeWindowHandle : Proc(IUIAutomationElement6*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CurrentItemType : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsOffscreen : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOrientation : Proc(IUIAutomationElement6*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CurrentFrameworkId : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsRequiredForForm : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentItemStatus : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentBoundingRectangle : Proc(IUIAutomationElement6*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CurrentLabeledBy : Proc(IUIAutomationElement6*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentAriaRole : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAriaProperties : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsDataValidForForm : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentControllerFor : Proc(IUIAutomationElement6*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentDescribedBy : Proc(IUIAutomationElement6*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsTo : Proc(IUIAutomationElement6*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProviderDescription : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedProcessId : Proc(IUIAutomationElement6*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedControlType : Proc(IUIAutomationElement6*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLocalizedControlType : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedName : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAcceleratorKey : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAccessKey : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHasKeyboardFocus : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsKeyboardFocusable : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsEnabled : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedAutomationId : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedClassName : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHelpText : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedCulture : Proc(IUIAutomationElement6*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedIsControlElement : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsContentElement : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPassword : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedNativeWindowHandle : Proc(IUIAutomationElement6*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CachedItemType : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsOffscreen : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOrientation : Proc(IUIAutomationElement6*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CachedFrameworkId : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsRequiredForForm : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedItemStatus : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedBoundingRectangle : Proc(IUIAutomationElement6*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CachedLabeledBy : Proc(IUIAutomationElement6*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedAriaRole : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAriaProperties : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsDataValidForForm : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedControllerFor : Proc(IUIAutomationElement6*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedDescribedBy : Proc(IUIAutomationElement6*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsTo : Proc(IUIAutomationElement6*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedProviderDescription : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_clickable_point : Proc(IUIAutomationElement6*, Win32cr::Foundation::POINT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOptimizeForVisualContent : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOptimizeForVisualContent : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentLiveSetting : Proc(IUIAutomationElement6*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CachedLiveSetting : Proc(IUIAutomationElement6*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsFrom : Proc(IUIAutomationElement6*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsFrom : Proc(IUIAutomationElement6*, Void**, Win32cr::Foundation::HRESULT),
    show_context_menu : Proc(IUIAutomationElement6*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPeripheral : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPeripheral : Proc(IUIAutomationElement6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentPositionInSet : Proc(IUIAutomationElement6*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentSizeOfSet : Proc(IUIAutomationElement6*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLevel : Proc(IUIAutomationElement6*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentAnnotationTypes : Proc(IUIAutomationElement6*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CurrentAnnotationObjects : Proc(IUIAutomationElement6*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedPositionInSet : Proc(IUIAutomationElement6*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedSizeOfSet : Proc(IUIAutomationElement6*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLevel : Proc(IUIAutomationElement6*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedAnnotationTypes : Proc(IUIAutomationElement6*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CachedAnnotationObjects : Proc(IUIAutomationElement6*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentLandmarkType : Proc(IUIAutomationElement6*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLocalizedLandmarkType : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedLandmarkType : Proc(IUIAutomationElement6*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLocalizedLandmarkType : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentFullDescription : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedFullDescription : Proc(IUIAutomationElement6*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationElement6, lpVtbl : IUIAutomationElement6Vtbl* do
    GUID = LibC::GUID.new(0x4780d450_u32, 0x8bca_u16, 0x4977_u16, StaticArray[0xaf_u8, 0xa5_u8, 0xa4_u8, 0xa5_u8, 0x17_u8, 0xf5_u8, 0x55_u8, 0xe3_u8])
    def query_interface(this : IUIAutomationElement6*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationElement6*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationElement6*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_focus(this : IUIAutomationElement6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_focus.call(this)
    end
    def get_runtime_id(this : IUIAutomationElement6*, runtimeId : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_id.call(this, runtimeId)
    end
    def find_first(this : IUIAutomationElement6*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first.call(this, scope, condition, found)
    end
    def find_all(this : IUIAutomationElement6*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all.call(this, scope, condition, found)
    end
    def find_first_build_cache(this : IUIAutomationElement6*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def find_all_build_cache(this : IUIAutomationElement6*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def build_updated_cache(this : IUIAutomationElement6*, cacheRequest : Void*, updatedElement : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.build_updated_cache.call(this, cacheRequest, updatedElement)
    end
    def get_current_property_value(this : IUIAutomationElement6*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value.call(this, propertyId, retVal)
    end
    def get_current_property_value_ex(this : IUIAutomationElement6*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_cached_property_value(this : IUIAutomationElement6*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value.call(this, propertyId, retVal)
    end
    def get_cached_property_value_ex(this : IUIAutomationElement6*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_current_pattern_as(this : IUIAutomationElement6*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_cached_pattern_as(this : IUIAutomationElement6*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_current_pattern(this : IUIAutomationElement6*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern.call(this, patternId, patternObject)
    end
    def get_cached_pattern(this : IUIAutomationElement6*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern.call(this, patternId, patternObject)
    end
    def get_cached_parent(this : IUIAutomationElement6*, parent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_parent.call(this, parent)
    end
    def get_cached_children(this : IUIAutomationElement6*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_children.call(this, children)
    end
    def get_CurrentProcessId(this : IUIAutomationElement6*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProcessId.call(this, retVal)
    end
    def get_CurrentControlType(this : IUIAutomationElement6*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControlType.call(this, retVal)
    end
    def get_CurrentLocalizedControlType(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLocalizedControlType.call(this, retVal)
    end
    def get_CurrentName(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentName.call(this, retVal)
    end
    def get_CurrentAcceleratorKey(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAcceleratorKey.call(this, retVal)
    end
    def get_CurrentAccessKey(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAccessKey.call(this, retVal)
    end
    def get_CurrentHasKeyboardFocus(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHasKeyboardFocus.call(this, retVal)
    end
    def get_CurrentIsKeyboardFocusable(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsKeyboardFocusable.call(this, retVal)
    end
    def get_CurrentIsEnabled(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsEnabled.call(this, retVal)
    end
    def get_CurrentAutomationId(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAutomationId.call(this, retVal)
    end
    def get_CurrentClassName(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentClassName.call(this, retVal)
    end
    def get_CurrentHelpText(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHelpText.call(this, retVal)
    end
    def get_CurrentCulture(this : IUIAutomationElement6*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCulture.call(this, retVal)
    end
    def get_CurrentIsControlElement(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsControlElement.call(this, retVal)
    end
    def get_CurrentIsContentElement(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsContentElement.call(this, retVal)
    end
    def get_CurrentIsPassword(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPassword.call(this, retVal)
    end
    def get_CurrentNativeWindowHandle(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentNativeWindowHandle.call(this, retVal)
    end
    def get_CurrentItemType(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemType.call(this, retVal)
    end
    def get_CurrentIsOffscreen(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsOffscreen.call(this, retVal)
    end
    def get_CurrentOrientation(this : IUIAutomationElement6*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOrientation.call(this, retVal)
    end
    def get_CurrentFrameworkId(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFrameworkId.call(this, retVal)
    end
    def get_CurrentIsRequiredForForm(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsRequiredForForm.call(this, retVal)
    end
    def get_CurrentItemStatus(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemStatus.call(this, retVal)
    end
    def get_CurrentBoundingRectangle(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentBoundingRectangle.call(this, retVal)
    end
    def get_CurrentLabeledBy(this : IUIAutomationElement6*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLabeledBy.call(this, retVal)
    end
    def get_CurrentAriaRole(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaRole.call(this, retVal)
    end
    def get_CurrentAriaProperties(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaProperties.call(this, retVal)
    end
    def get_CurrentIsDataValidForForm(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsDataValidForForm.call(this, retVal)
    end
    def get_CurrentControllerFor(this : IUIAutomationElement6*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControllerFor.call(this, retVal)
    end
    def get_CurrentDescribedBy(this : IUIAutomationElement6*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDescribedBy.call(this, retVal)
    end
    def get_CurrentFlowsTo(this : IUIAutomationElement6*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsTo.call(this, retVal)
    end
    def get_CurrentProviderDescription(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProviderDescription.call(this, retVal)
    end
    def get_CachedProcessId(this : IUIAutomationElement6*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProcessId.call(this, retVal)
    end
    def get_CachedControlType(this : IUIAutomationElement6*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControlType.call(this, retVal)
    end
    def get_CachedLocalizedControlType(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLocalizedControlType.call(this, retVal)
    end
    def get_CachedName(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedName.call(this, retVal)
    end
    def get_CachedAcceleratorKey(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAcceleratorKey.call(this, retVal)
    end
    def get_CachedAccessKey(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAccessKey.call(this, retVal)
    end
    def get_CachedHasKeyboardFocus(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHasKeyboardFocus.call(this, retVal)
    end
    def get_CachedIsKeyboardFocusable(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsKeyboardFocusable.call(this, retVal)
    end
    def get_CachedIsEnabled(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsEnabled.call(this, retVal)
    end
    def get_CachedAutomationId(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAutomationId.call(this, retVal)
    end
    def get_CachedClassName(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedClassName.call(this, retVal)
    end
    def get_CachedHelpText(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHelpText.call(this, retVal)
    end
    def get_CachedCulture(this : IUIAutomationElement6*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCulture.call(this, retVal)
    end
    def get_CachedIsControlElement(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsControlElement.call(this, retVal)
    end
    def get_CachedIsContentElement(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsContentElement.call(this, retVal)
    end
    def get_CachedIsPassword(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPassword.call(this, retVal)
    end
    def get_CachedNativeWindowHandle(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedNativeWindowHandle.call(this, retVal)
    end
    def get_CachedItemType(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemType.call(this, retVal)
    end
    def get_CachedIsOffscreen(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsOffscreen.call(this, retVal)
    end
    def get_CachedOrientation(this : IUIAutomationElement6*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOrientation.call(this, retVal)
    end
    def get_CachedFrameworkId(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFrameworkId.call(this, retVal)
    end
    def get_CachedIsRequiredForForm(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsRequiredForForm.call(this, retVal)
    end
    def get_CachedItemStatus(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemStatus.call(this, retVal)
    end
    def get_CachedBoundingRectangle(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedBoundingRectangle.call(this, retVal)
    end
    def get_CachedLabeledBy(this : IUIAutomationElement6*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLabeledBy.call(this, retVal)
    end
    def get_CachedAriaRole(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaRole.call(this, retVal)
    end
    def get_CachedAriaProperties(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaProperties.call(this, retVal)
    end
    def get_CachedIsDataValidForForm(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsDataValidForForm.call(this, retVal)
    end
    def get_CachedControllerFor(this : IUIAutomationElement6*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControllerFor.call(this, retVal)
    end
    def get_CachedDescribedBy(this : IUIAutomationElement6*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDescribedBy.call(this, retVal)
    end
    def get_CachedFlowsTo(this : IUIAutomationElement6*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsTo.call(this, retVal)
    end
    def get_CachedProviderDescription(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProviderDescription.call(this, retVal)
    end
    def get_clickable_point(this : IUIAutomationElement6*, clickable : Win32cr::Foundation::POINT*, gotClickable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clickable_point.call(this, clickable, gotClickable)
    end
    def get_CurrentOptimizeForVisualContent(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOptimizeForVisualContent.call(this, retVal)
    end
    def get_CachedOptimizeForVisualContent(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOptimizeForVisualContent.call(this, retVal)
    end
    def get_CurrentLiveSetting(this : IUIAutomationElement6*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLiveSetting.call(this, retVal)
    end
    def get_CachedLiveSetting(this : IUIAutomationElement6*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLiveSetting.call(this, retVal)
    end
    def get_CurrentFlowsFrom(this : IUIAutomationElement6*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsFrom.call(this, retVal)
    end
    def get_CachedFlowsFrom(this : IUIAutomationElement6*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsFrom.call(this, retVal)
    end
    def show_context_menu(this : IUIAutomationElement6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_context_menu.call(this)
    end
    def get_CurrentIsPeripheral(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPeripheral.call(this, retVal)
    end
    def get_CachedIsPeripheral(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPeripheral.call(this, retVal)
    end
    def get_CurrentPositionInSet(this : IUIAutomationElement6*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentPositionInSet.call(this, retVal)
    end
    def get_CurrentSizeOfSet(this : IUIAutomationElement6*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentSizeOfSet.call(this, retVal)
    end
    def get_CurrentLevel(this : IUIAutomationElement6*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLevel.call(this, retVal)
    end
    def get_CurrentAnnotationTypes(this : IUIAutomationElement6*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAnnotationTypes.call(this, retVal)
    end
    def get_CurrentAnnotationObjects(this : IUIAutomationElement6*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAnnotationObjects.call(this, retVal)
    end
    def get_CachedPositionInSet(this : IUIAutomationElement6*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedPositionInSet.call(this, retVal)
    end
    def get_CachedSizeOfSet(this : IUIAutomationElement6*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedSizeOfSet.call(this, retVal)
    end
    def get_CachedLevel(this : IUIAutomationElement6*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLevel.call(this, retVal)
    end
    def get_CachedAnnotationTypes(this : IUIAutomationElement6*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAnnotationTypes.call(this, retVal)
    end
    def get_CachedAnnotationObjects(this : IUIAutomationElement6*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAnnotationObjects.call(this, retVal)
    end
    def get_CurrentLandmarkType(this : IUIAutomationElement6*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLandmarkType.call(this, retVal)
    end
    def get_CurrentLocalizedLandmarkType(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLocalizedLandmarkType.call(this, retVal)
    end
    def get_CachedLandmarkType(this : IUIAutomationElement6*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLandmarkType.call(this, retVal)
    end
    def get_CachedLocalizedLandmarkType(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLocalizedLandmarkType.call(this, retVal)
    end
    def get_CurrentFullDescription(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFullDescription.call(this, retVal)
    end
    def get_CachedFullDescription(this : IUIAutomationElement6*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFullDescription.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationElement7Vtbl,
    query_interface : Proc(IUIAutomationElement7*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationElement7*, UInt32),
    release : Proc(IUIAutomationElement7*, UInt32),
    set_focus : Proc(IUIAutomationElement7*, Win32cr::Foundation::HRESULT),
    get_runtime_id : Proc(IUIAutomationElement7*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    find_first : Proc(IUIAutomationElement7*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all : Proc(IUIAutomationElement7*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_first_build_cache : Proc(IUIAutomationElement7*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_build_cache : Proc(IUIAutomationElement7*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    build_updated_cache : Proc(IUIAutomationElement7*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_current_property_value : Proc(IUIAutomationElement7*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_property_value_ex : Proc(IUIAutomationElement7*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value : Proc(IUIAutomationElement7*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value_ex : Proc(IUIAutomationElement7*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_pattern_as : Proc(IUIAutomationElement7*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern_as : Proc(IUIAutomationElement7*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_current_pattern : Proc(IUIAutomationElement7*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern : Proc(IUIAutomationElement7*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_parent : Proc(IUIAutomationElement7*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_children : Proc(IUIAutomationElement7*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProcessId : Proc(IUIAutomationElement7*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentControlType : Proc(IUIAutomationElement7*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLocalizedControlType : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentName : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAcceleratorKey : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAccessKey : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHasKeyboardFocus : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsKeyboardFocusable : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsEnabled : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentAutomationId : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentClassName : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHelpText : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentCulture : Proc(IUIAutomationElement7*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentIsControlElement : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsContentElement : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPassword : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentNativeWindowHandle : Proc(IUIAutomationElement7*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CurrentItemType : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsOffscreen : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOrientation : Proc(IUIAutomationElement7*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CurrentFrameworkId : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsRequiredForForm : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentItemStatus : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentBoundingRectangle : Proc(IUIAutomationElement7*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CurrentLabeledBy : Proc(IUIAutomationElement7*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentAriaRole : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAriaProperties : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsDataValidForForm : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentControllerFor : Proc(IUIAutomationElement7*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentDescribedBy : Proc(IUIAutomationElement7*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsTo : Proc(IUIAutomationElement7*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProviderDescription : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedProcessId : Proc(IUIAutomationElement7*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedControlType : Proc(IUIAutomationElement7*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLocalizedControlType : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedName : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAcceleratorKey : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAccessKey : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHasKeyboardFocus : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsKeyboardFocusable : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsEnabled : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedAutomationId : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedClassName : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHelpText : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedCulture : Proc(IUIAutomationElement7*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedIsControlElement : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsContentElement : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPassword : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedNativeWindowHandle : Proc(IUIAutomationElement7*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CachedItemType : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsOffscreen : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOrientation : Proc(IUIAutomationElement7*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CachedFrameworkId : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsRequiredForForm : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedItemStatus : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedBoundingRectangle : Proc(IUIAutomationElement7*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CachedLabeledBy : Proc(IUIAutomationElement7*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedAriaRole : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAriaProperties : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsDataValidForForm : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedControllerFor : Proc(IUIAutomationElement7*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedDescribedBy : Proc(IUIAutomationElement7*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsTo : Proc(IUIAutomationElement7*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedProviderDescription : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_clickable_point : Proc(IUIAutomationElement7*, Win32cr::Foundation::POINT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOptimizeForVisualContent : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOptimizeForVisualContent : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentLiveSetting : Proc(IUIAutomationElement7*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CachedLiveSetting : Proc(IUIAutomationElement7*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsFrom : Proc(IUIAutomationElement7*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsFrom : Proc(IUIAutomationElement7*, Void**, Win32cr::Foundation::HRESULT),
    show_context_menu : Proc(IUIAutomationElement7*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPeripheral : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPeripheral : Proc(IUIAutomationElement7*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentPositionInSet : Proc(IUIAutomationElement7*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentSizeOfSet : Proc(IUIAutomationElement7*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLevel : Proc(IUIAutomationElement7*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentAnnotationTypes : Proc(IUIAutomationElement7*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CurrentAnnotationObjects : Proc(IUIAutomationElement7*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedPositionInSet : Proc(IUIAutomationElement7*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedSizeOfSet : Proc(IUIAutomationElement7*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLevel : Proc(IUIAutomationElement7*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedAnnotationTypes : Proc(IUIAutomationElement7*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CachedAnnotationObjects : Proc(IUIAutomationElement7*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentLandmarkType : Proc(IUIAutomationElement7*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLocalizedLandmarkType : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedLandmarkType : Proc(IUIAutomationElement7*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLocalizedLandmarkType : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentFullDescription : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedFullDescription : Proc(IUIAutomationElement7*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    find_first_with_options : Proc(IUIAutomationElement7*, Win32cr::UI::Accessibility::TreeScope, Void*, Win32cr::UI::Accessibility::TreeTraversalOptions, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_with_options : Proc(IUIAutomationElement7*, Win32cr::UI::Accessibility::TreeScope, Void*, Win32cr::UI::Accessibility::TreeTraversalOptions, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_first_with_options_build_cache : Proc(IUIAutomationElement7*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::UI::Accessibility::TreeTraversalOptions, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_with_options_build_cache : Proc(IUIAutomationElement7*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::UI::Accessibility::TreeTraversalOptions, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_current_metadata_value : Proc(IUIAutomationElement7*, Int32, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationElement7, lpVtbl : IUIAutomationElement7Vtbl* do
    GUID = LibC::GUID.new(0x204e8572_u32, 0xcfc3_u16, 0x4c11_u16, StaticArray[0xb0_u8, 0xc8_u8, 0x7d_u8, 0xa7_u8, 0x42_u8, 0x7_u8, 0x50_u8, 0xb7_u8])
    def query_interface(this : IUIAutomationElement7*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationElement7*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationElement7*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_focus(this : IUIAutomationElement7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_focus.call(this)
    end
    def get_runtime_id(this : IUIAutomationElement7*, runtimeId : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_id.call(this, runtimeId)
    end
    def find_first(this : IUIAutomationElement7*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first.call(this, scope, condition, found)
    end
    def find_all(this : IUIAutomationElement7*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all.call(this, scope, condition, found)
    end
    def find_first_build_cache(this : IUIAutomationElement7*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def find_all_build_cache(this : IUIAutomationElement7*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def build_updated_cache(this : IUIAutomationElement7*, cacheRequest : Void*, updatedElement : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.build_updated_cache.call(this, cacheRequest, updatedElement)
    end
    def get_current_property_value(this : IUIAutomationElement7*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value.call(this, propertyId, retVal)
    end
    def get_current_property_value_ex(this : IUIAutomationElement7*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_cached_property_value(this : IUIAutomationElement7*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value.call(this, propertyId, retVal)
    end
    def get_cached_property_value_ex(this : IUIAutomationElement7*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_current_pattern_as(this : IUIAutomationElement7*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_cached_pattern_as(this : IUIAutomationElement7*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_current_pattern(this : IUIAutomationElement7*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern.call(this, patternId, patternObject)
    end
    def get_cached_pattern(this : IUIAutomationElement7*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern.call(this, patternId, patternObject)
    end
    def get_cached_parent(this : IUIAutomationElement7*, parent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_parent.call(this, parent)
    end
    def get_cached_children(this : IUIAutomationElement7*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_children.call(this, children)
    end
    def get_CurrentProcessId(this : IUIAutomationElement7*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProcessId.call(this, retVal)
    end
    def get_CurrentControlType(this : IUIAutomationElement7*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControlType.call(this, retVal)
    end
    def get_CurrentLocalizedControlType(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLocalizedControlType.call(this, retVal)
    end
    def get_CurrentName(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentName.call(this, retVal)
    end
    def get_CurrentAcceleratorKey(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAcceleratorKey.call(this, retVal)
    end
    def get_CurrentAccessKey(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAccessKey.call(this, retVal)
    end
    def get_CurrentHasKeyboardFocus(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHasKeyboardFocus.call(this, retVal)
    end
    def get_CurrentIsKeyboardFocusable(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsKeyboardFocusable.call(this, retVal)
    end
    def get_CurrentIsEnabled(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsEnabled.call(this, retVal)
    end
    def get_CurrentAutomationId(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAutomationId.call(this, retVal)
    end
    def get_CurrentClassName(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentClassName.call(this, retVal)
    end
    def get_CurrentHelpText(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHelpText.call(this, retVal)
    end
    def get_CurrentCulture(this : IUIAutomationElement7*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCulture.call(this, retVal)
    end
    def get_CurrentIsControlElement(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsControlElement.call(this, retVal)
    end
    def get_CurrentIsContentElement(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsContentElement.call(this, retVal)
    end
    def get_CurrentIsPassword(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPassword.call(this, retVal)
    end
    def get_CurrentNativeWindowHandle(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentNativeWindowHandle.call(this, retVal)
    end
    def get_CurrentItemType(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemType.call(this, retVal)
    end
    def get_CurrentIsOffscreen(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsOffscreen.call(this, retVal)
    end
    def get_CurrentOrientation(this : IUIAutomationElement7*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOrientation.call(this, retVal)
    end
    def get_CurrentFrameworkId(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFrameworkId.call(this, retVal)
    end
    def get_CurrentIsRequiredForForm(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsRequiredForForm.call(this, retVal)
    end
    def get_CurrentItemStatus(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemStatus.call(this, retVal)
    end
    def get_CurrentBoundingRectangle(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentBoundingRectangle.call(this, retVal)
    end
    def get_CurrentLabeledBy(this : IUIAutomationElement7*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLabeledBy.call(this, retVal)
    end
    def get_CurrentAriaRole(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaRole.call(this, retVal)
    end
    def get_CurrentAriaProperties(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaProperties.call(this, retVal)
    end
    def get_CurrentIsDataValidForForm(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsDataValidForForm.call(this, retVal)
    end
    def get_CurrentControllerFor(this : IUIAutomationElement7*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControllerFor.call(this, retVal)
    end
    def get_CurrentDescribedBy(this : IUIAutomationElement7*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDescribedBy.call(this, retVal)
    end
    def get_CurrentFlowsTo(this : IUIAutomationElement7*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsTo.call(this, retVal)
    end
    def get_CurrentProviderDescription(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProviderDescription.call(this, retVal)
    end
    def get_CachedProcessId(this : IUIAutomationElement7*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProcessId.call(this, retVal)
    end
    def get_CachedControlType(this : IUIAutomationElement7*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControlType.call(this, retVal)
    end
    def get_CachedLocalizedControlType(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLocalizedControlType.call(this, retVal)
    end
    def get_CachedName(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedName.call(this, retVal)
    end
    def get_CachedAcceleratorKey(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAcceleratorKey.call(this, retVal)
    end
    def get_CachedAccessKey(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAccessKey.call(this, retVal)
    end
    def get_CachedHasKeyboardFocus(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHasKeyboardFocus.call(this, retVal)
    end
    def get_CachedIsKeyboardFocusable(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsKeyboardFocusable.call(this, retVal)
    end
    def get_CachedIsEnabled(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsEnabled.call(this, retVal)
    end
    def get_CachedAutomationId(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAutomationId.call(this, retVal)
    end
    def get_CachedClassName(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedClassName.call(this, retVal)
    end
    def get_CachedHelpText(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHelpText.call(this, retVal)
    end
    def get_CachedCulture(this : IUIAutomationElement7*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCulture.call(this, retVal)
    end
    def get_CachedIsControlElement(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsControlElement.call(this, retVal)
    end
    def get_CachedIsContentElement(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsContentElement.call(this, retVal)
    end
    def get_CachedIsPassword(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPassword.call(this, retVal)
    end
    def get_CachedNativeWindowHandle(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedNativeWindowHandle.call(this, retVal)
    end
    def get_CachedItemType(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemType.call(this, retVal)
    end
    def get_CachedIsOffscreen(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsOffscreen.call(this, retVal)
    end
    def get_CachedOrientation(this : IUIAutomationElement7*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOrientation.call(this, retVal)
    end
    def get_CachedFrameworkId(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFrameworkId.call(this, retVal)
    end
    def get_CachedIsRequiredForForm(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsRequiredForForm.call(this, retVal)
    end
    def get_CachedItemStatus(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemStatus.call(this, retVal)
    end
    def get_CachedBoundingRectangle(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedBoundingRectangle.call(this, retVal)
    end
    def get_CachedLabeledBy(this : IUIAutomationElement7*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLabeledBy.call(this, retVal)
    end
    def get_CachedAriaRole(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaRole.call(this, retVal)
    end
    def get_CachedAriaProperties(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaProperties.call(this, retVal)
    end
    def get_CachedIsDataValidForForm(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsDataValidForForm.call(this, retVal)
    end
    def get_CachedControllerFor(this : IUIAutomationElement7*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControllerFor.call(this, retVal)
    end
    def get_CachedDescribedBy(this : IUIAutomationElement7*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDescribedBy.call(this, retVal)
    end
    def get_CachedFlowsTo(this : IUIAutomationElement7*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsTo.call(this, retVal)
    end
    def get_CachedProviderDescription(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProviderDescription.call(this, retVal)
    end
    def get_clickable_point(this : IUIAutomationElement7*, clickable : Win32cr::Foundation::POINT*, gotClickable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clickable_point.call(this, clickable, gotClickable)
    end
    def get_CurrentOptimizeForVisualContent(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOptimizeForVisualContent.call(this, retVal)
    end
    def get_CachedOptimizeForVisualContent(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOptimizeForVisualContent.call(this, retVal)
    end
    def get_CurrentLiveSetting(this : IUIAutomationElement7*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLiveSetting.call(this, retVal)
    end
    def get_CachedLiveSetting(this : IUIAutomationElement7*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLiveSetting.call(this, retVal)
    end
    def get_CurrentFlowsFrom(this : IUIAutomationElement7*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsFrom.call(this, retVal)
    end
    def get_CachedFlowsFrom(this : IUIAutomationElement7*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsFrom.call(this, retVal)
    end
    def show_context_menu(this : IUIAutomationElement7*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_context_menu.call(this)
    end
    def get_CurrentIsPeripheral(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPeripheral.call(this, retVal)
    end
    def get_CachedIsPeripheral(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPeripheral.call(this, retVal)
    end
    def get_CurrentPositionInSet(this : IUIAutomationElement7*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentPositionInSet.call(this, retVal)
    end
    def get_CurrentSizeOfSet(this : IUIAutomationElement7*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentSizeOfSet.call(this, retVal)
    end
    def get_CurrentLevel(this : IUIAutomationElement7*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLevel.call(this, retVal)
    end
    def get_CurrentAnnotationTypes(this : IUIAutomationElement7*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAnnotationTypes.call(this, retVal)
    end
    def get_CurrentAnnotationObjects(this : IUIAutomationElement7*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAnnotationObjects.call(this, retVal)
    end
    def get_CachedPositionInSet(this : IUIAutomationElement7*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedPositionInSet.call(this, retVal)
    end
    def get_CachedSizeOfSet(this : IUIAutomationElement7*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedSizeOfSet.call(this, retVal)
    end
    def get_CachedLevel(this : IUIAutomationElement7*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLevel.call(this, retVal)
    end
    def get_CachedAnnotationTypes(this : IUIAutomationElement7*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAnnotationTypes.call(this, retVal)
    end
    def get_CachedAnnotationObjects(this : IUIAutomationElement7*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAnnotationObjects.call(this, retVal)
    end
    def get_CurrentLandmarkType(this : IUIAutomationElement7*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLandmarkType.call(this, retVal)
    end
    def get_CurrentLocalizedLandmarkType(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLocalizedLandmarkType.call(this, retVal)
    end
    def get_CachedLandmarkType(this : IUIAutomationElement7*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLandmarkType.call(this, retVal)
    end
    def get_CachedLocalizedLandmarkType(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLocalizedLandmarkType.call(this, retVal)
    end
    def get_CurrentFullDescription(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFullDescription.call(this, retVal)
    end
    def get_CachedFullDescription(this : IUIAutomationElement7*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFullDescription.call(this, retVal)
    end
    def find_first_with_options(this : IUIAutomationElement7*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, traversalOptions : Win32cr::UI::Accessibility::TreeTraversalOptions, root : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_with_options.call(this, scope, condition, traversalOptions, root, found)
    end
    def find_all_with_options(this : IUIAutomationElement7*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, traversalOptions : Win32cr::UI::Accessibility::TreeTraversalOptions, root : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_with_options.call(this, scope, condition, traversalOptions, root, found)
    end
    def find_first_with_options_build_cache(this : IUIAutomationElement7*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, traversalOptions : Win32cr::UI::Accessibility::TreeTraversalOptions, root : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_with_options_build_cache.call(this, scope, condition, cacheRequest, traversalOptions, root, found)
    end
    def find_all_with_options_build_cache(this : IUIAutomationElement7*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, traversalOptions : Win32cr::UI::Accessibility::TreeTraversalOptions, root : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_with_options_build_cache.call(this, scope, condition, cacheRequest, traversalOptions, root, found)
    end
    def get_current_metadata_value(this : IUIAutomationElement7*, targetId : Int32, metadataId : Int32, returnVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_metadata_value.call(this, targetId, metadataId, returnVal)
    end

  end

  @[Extern]
  record IUIAutomationElement8Vtbl,
    query_interface : Proc(IUIAutomationElement8*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationElement8*, UInt32),
    release : Proc(IUIAutomationElement8*, UInt32),
    set_focus : Proc(IUIAutomationElement8*, Win32cr::Foundation::HRESULT),
    get_runtime_id : Proc(IUIAutomationElement8*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    find_first : Proc(IUIAutomationElement8*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all : Proc(IUIAutomationElement8*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_first_build_cache : Proc(IUIAutomationElement8*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_build_cache : Proc(IUIAutomationElement8*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    build_updated_cache : Proc(IUIAutomationElement8*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_current_property_value : Proc(IUIAutomationElement8*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_property_value_ex : Proc(IUIAutomationElement8*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value : Proc(IUIAutomationElement8*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value_ex : Proc(IUIAutomationElement8*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_pattern_as : Proc(IUIAutomationElement8*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern_as : Proc(IUIAutomationElement8*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_current_pattern : Proc(IUIAutomationElement8*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern : Proc(IUIAutomationElement8*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_parent : Proc(IUIAutomationElement8*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_children : Proc(IUIAutomationElement8*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProcessId : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentControlType : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLocalizedControlType : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentName : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAcceleratorKey : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAccessKey : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHasKeyboardFocus : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsKeyboardFocusable : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsEnabled : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentAutomationId : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentClassName : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHelpText : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentCulture : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentIsControlElement : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsContentElement : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPassword : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentNativeWindowHandle : Proc(IUIAutomationElement8*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CurrentItemType : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsOffscreen : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOrientation : Proc(IUIAutomationElement8*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CurrentFrameworkId : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsRequiredForForm : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentItemStatus : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentBoundingRectangle : Proc(IUIAutomationElement8*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CurrentLabeledBy : Proc(IUIAutomationElement8*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentAriaRole : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAriaProperties : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsDataValidForForm : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentControllerFor : Proc(IUIAutomationElement8*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentDescribedBy : Proc(IUIAutomationElement8*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsTo : Proc(IUIAutomationElement8*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProviderDescription : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedProcessId : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedControlType : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLocalizedControlType : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedName : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAcceleratorKey : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAccessKey : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHasKeyboardFocus : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsKeyboardFocusable : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsEnabled : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedAutomationId : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedClassName : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHelpText : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedCulture : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedIsControlElement : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsContentElement : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPassword : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedNativeWindowHandle : Proc(IUIAutomationElement8*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CachedItemType : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsOffscreen : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOrientation : Proc(IUIAutomationElement8*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CachedFrameworkId : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsRequiredForForm : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedItemStatus : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedBoundingRectangle : Proc(IUIAutomationElement8*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CachedLabeledBy : Proc(IUIAutomationElement8*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedAriaRole : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAriaProperties : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsDataValidForForm : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedControllerFor : Proc(IUIAutomationElement8*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedDescribedBy : Proc(IUIAutomationElement8*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsTo : Proc(IUIAutomationElement8*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedProviderDescription : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_clickable_point : Proc(IUIAutomationElement8*, Win32cr::Foundation::POINT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOptimizeForVisualContent : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOptimizeForVisualContent : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentLiveSetting : Proc(IUIAutomationElement8*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CachedLiveSetting : Proc(IUIAutomationElement8*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsFrom : Proc(IUIAutomationElement8*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsFrom : Proc(IUIAutomationElement8*, Void**, Win32cr::Foundation::HRESULT),
    show_context_menu : Proc(IUIAutomationElement8*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPeripheral : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPeripheral : Proc(IUIAutomationElement8*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentPositionInSet : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentSizeOfSet : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLevel : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentAnnotationTypes : Proc(IUIAutomationElement8*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CurrentAnnotationObjects : Proc(IUIAutomationElement8*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedPositionInSet : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedSizeOfSet : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLevel : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedAnnotationTypes : Proc(IUIAutomationElement8*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CachedAnnotationObjects : Proc(IUIAutomationElement8*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentLandmarkType : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLocalizedLandmarkType : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedLandmarkType : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLocalizedLandmarkType : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentFullDescription : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedFullDescription : Proc(IUIAutomationElement8*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    find_first_with_options : Proc(IUIAutomationElement8*, Win32cr::UI::Accessibility::TreeScope, Void*, Win32cr::UI::Accessibility::TreeTraversalOptions, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_with_options : Proc(IUIAutomationElement8*, Win32cr::UI::Accessibility::TreeScope, Void*, Win32cr::UI::Accessibility::TreeTraversalOptions, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_first_with_options_build_cache : Proc(IUIAutomationElement8*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::UI::Accessibility::TreeTraversalOptions, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_with_options_build_cache : Proc(IUIAutomationElement8*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::UI::Accessibility::TreeTraversalOptions, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_current_metadata_value : Proc(IUIAutomationElement8*, Int32, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_CurrentHeadingLevel : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedHeadingLevel : Proc(IUIAutomationElement8*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationElement8, lpVtbl : IUIAutomationElement8Vtbl* do
    GUID = LibC::GUID.new(0x8c60217d_u32, 0x5411_u16, 0x4cde_u16, StaticArray[0xbc_u8, 0xc0_u8, 0x1c_u8, 0xed_u8, 0xa2_u8, 0x23_u8, 0x83_u8, 0xc_u8])
    def query_interface(this : IUIAutomationElement8*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationElement8*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationElement8*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_focus(this : IUIAutomationElement8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_focus.call(this)
    end
    def get_runtime_id(this : IUIAutomationElement8*, runtimeId : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_id.call(this, runtimeId)
    end
    def find_first(this : IUIAutomationElement8*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first.call(this, scope, condition, found)
    end
    def find_all(this : IUIAutomationElement8*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all.call(this, scope, condition, found)
    end
    def find_first_build_cache(this : IUIAutomationElement8*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def find_all_build_cache(this : IUIAutomationElement8*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def build_updated_cache(this : IUIAutomationElement8*, cacheRequest : Void*, updatedElement : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.build_updated_cache.call(this, cacheRequest, updatedElement)
    end
    def get_current_property_value(this : IUIAutomationElement8*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value.call(this, propertyId, retVal)
    end
    def get_current_property_value_ex(this : IUIAutomationElement8*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_cached_property_value(this : IUIAutomationElement8*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value.call(this, propertyId, retVal)
    end
    def get_cached_property_value_ex(this : IUIAutomationElement8*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_current_pattern_as(this : IUIAutomationElement8*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_cached_pattern_as(this : IUIAutomationElement8*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_current_pattern(this : IUIAutomationElement8*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern.call(this, patternId, patternObject)
    end
    def get_cached_pattern(this : IUIAutomationElement8*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern.call(this, patternId, patternObject)
    end
    def get_cached_parent(this : IUIAutomationElement8*, parent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_parent.call(this, parent)
    end
    def get_cached_children(this : IUIAutomationElement8*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_children.call(this, children)
    end
    def get_CurrentProcessId(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProcessId.call(this, retVal)
    end
    def get_CurrentControlType(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControlType.call(this, retVal)
    end
    def get_CurrentLocalizedControlType(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLocalizedControlType.call(this, retVal)
    end
    def get_CurrentName(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentName.call(this, retVal)
    end
    def get_CurrentAcceleratorKey(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAcceleratorKey.call(this, retVal)
    end
    def get_CurrentAccessKey(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAccessKey.call(this, retVal)
    end
    def get_CurrentHasKeyboardFocus(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHasKeyboardFocus.call(this, retVal)
    end
    def get_CurrentIsKeyboardFocusable(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsKeyboardFocusable.call(this, retVal)
    end
    def get_CurrentIsEnabled(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsEnabled.call(this, retVal)
    end
    def get_CurrentAutomationId(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAutomationId.call(this, retVal)
    end
    def get_CurrentClassName(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentClassName.call(this, retVal)
    end
    def get_CurrentHelpText(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHelpText.call(this, retVal)
    end
    def get_CurrentCulture(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCulture.call(this, retVal)
    end
    def get_CurrentIsControlElement(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsControlElement.call(this, retVal)
    end
    def get_CurrentIsContentElement(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsContentElement.call(this, retVal)
    end
    def get_CurrentIsPassword(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPassword.call(this, retVal)
    end
    def get_CurrentNativeWindowHandle(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentNativeWindowHandle.call(this, retVal)
    end
    def get_CurrentItemType(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemType.call(this, retVal)
    end
    def get_CurrentIsOffscreen(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsOffscreen.call(this, retVal)
    end
    def get_CurrentOrientation(this : IUIAutomationElement8*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOrientation.call(this, retVal)
    end
    def get_CurrentFrameworkId(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFrameworkId.call(this, retVal)
    end
    def get_CurrentIsRequiredForForm(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsRequiredForForm.call(this, retVal)
    end
    def get_CurrentItemStatus(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemStatus.call(this, retVal)
    end
    def get_CurrentBoundingRectangle(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentBoundingRectangle.call(this, retVal)
    end
    def get_CurrentLabeledBy(this : IUIAutomationElement8*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLabeledBy.call(this, retVal)
    end
    def get_CurrentAriaRole(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaRole.call(this, retVal)
    end
    def get_CurrentAriaProperties(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaProperties.call(this, retVal)
    end
    def get_CurrentIsDataValidForForm(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsDataValidForForm.call(this, retVal)
    end
    def get_CurrentControllerFor(this : IUIAutomationElement8*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControllerFor.call(this, retVal)
    end
    def get_CurrentDescribedBy(this : IUIAutomationElement8*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDescribedBy.call(this, retVal)
    end
    def get_CurrentFlowsTo(this : IUIAutomationElement8*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsTo.call(this, retVal)
    end
    def get_CurrentProviderDescription(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProviderDescription.call(this, retVal)
    end
    def get_CachedProcessId(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProcessId.call(this, retVal)
    end
    def get_CachedControlType(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControlType.call(this, retVal)
    end
    def get_CachedLocalizedControlType(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLocalizedControlType.call(this, retVal)
    end
    def get_CachedName(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedName.call(this, retVal)
    end
    def get_CachedAcceleratorKey(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAcceleratorKey.call(this, retVal)
    end
    def get_CachedAccessKey(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAccessKey.call(this, retVal)
    end
    def get_CachedHasKeyboardFocus(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHasKeyboardFocus.call(this, retVal)
    end
    def get_CachedIsKeyboardFocusable(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsKeyboardFocusable.call(this, retVal)
    end
    def get_CachedIsEnabled(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsEnabled.call(this, retVal)
    end
    def get_CachedAutomationId(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAutomationId.call(this, retVal)
    end
    def get_CachedClassName(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedClassName.call(this, retVal)
    end
    def get_CachedHelpText(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHelpText.call(this, retVal)
    end
    def get_CachedCulture(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCulture.call(this, retVal)
    end
    def get_CachedIsControlElement(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsControlElement.call(this, retVal)
    end
    def get_CachedIsContentElement(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsContentElement.call(this, retVal)
    end
    def get_CachedIsPassword(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPassword.call(this, retVal)
    end
    def get_CachedNativeWindowHandle(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedNativeWindowHandle.call(this, retVal)
    end
    def get_CachedItemType(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemType.call(this, retVal)
    end
    def get_CachedIsOffscreen(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsOffscreen.call(this, retVal)
    end
    def get_CachedOrientation(this : IUIAutomationElement8*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOrientation.call(this, retVal)
    end
    def get_CachedFrameworkId(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFrameworkId.call(this, retVal)
    end
    def get_CachedIsRequiredForForm(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsRequiredForForm.call(this, retVal)
    end
    def get_CachedItemStatus(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemStatus.call(this, retVal)
    end
    def get_CachedBoundingRectangle(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedBoundingRectangle.call(this, retVal)
    end
    def get_CachedLabeledBy(this : IUIAutomationElement8*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLabeledBy.call(this, retVal)
    end
    def get_CachedAriaRole(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaRole.call(this, retVal)
    end
    def get_CachedAriaProperties(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaProperties.call(this, retVal)
    end
    def get_CachedIsDataValidForForm(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsDataValidForForm.call(this, retVal)
    end
    def get_CachedControllerFor(this : IUIAutomationElement8*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControllerFor.call(this, retVal)
    end
    def get_CachedDescribedBy(this : IUIAutomationElement8*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDescribedBy.call(this, retVal)
    end
    def get_CachedFlowsTo(this : IUIAutomationElement8*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsTo.call(this, retVal)
    end
    def get_CachedProviderDescription(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProviderDescription.call(this, retVal)
    end
    def get_clickable_point(this : IUIAutomationElement8*, clickable : Win32cr::Foundation::POINT*, gotClickable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clickable_point.call(this, clickable, gotClickable)
    end
    def get_CurrentOptimizeForVisualContent(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOptimizeForVisualContent.call(this, retVal)
    end
    def get_CachedOptimizeForVisualContent(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOptimizeForVisualContent.call(this, retVal)
    end
    def get_CurrentLiveSetting(this : IUIAutomationElement8*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLiveSetting.call(this, retVal)
    end
    def get_CachedLiveSetting(this : IUIAutomationElement8*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLiveSetting.call(this, retVal)
    end
    def get_CurrentFlowsFrom(this : IUIAutomationElement8*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsFrom.call(this, retVal)
    end
    def get_CachedFlowsFrom(this : IUIAutomationElement8*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsFrom.call(this, retVal)
    end
    def show_context_menu(this : IUIAutomationElement8*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_context_menu.call(this)
    end
    def get_CurrentIsPeripheral(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPeripheral.call(this, retVal)
    end
    def get_CachedIsPeripheral(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPeripheral.call(this, retVal)
    end
    def get_CurrentPositionInSet(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentPositionInSet.call(this, retVal)
    end
    def get_CurrentSizeOfSet(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentSizeOfSet.call(this, retVal)
    end
    def get_CurrentLevel(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLevel.call(this, retVal)
    end
    def get_CurrentAnnotationTypes(this : IUIAutomationElement8*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAnnotationTypes.call(this, retVal)
    end
    def get_CurrentAnnotationObjects(this : IUIAutomationElement8*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAnnotationObjects.call(this, retVal)
    end
    def get_CachedPositionInSet(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedPositionInSet.call(this, retVal)
    end
    def get_CachedSizeOfSet(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedSizeOfSet.call(this, retVal)
    end
    def get_CachedLevel(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLevel.call(this, retVal)
    end
    def get_CachedAnnotationTypes(this : IUIAutomationElement8*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAnnotationTypes.call(this, retVal)
    end
    def get_CachedAnnotationObjects(this : IUIAutomationElement8*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAnnotationObjects.call(this, retVal)
    end
    def get_CurrentLandmarkType(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLandmarkType.call(this, retVal)
    end
    def get_CurrentLocalizedLandmarkType(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLocalizedLandmarkType.call(this, retVal)
    end
    def get_CachedLandmarkType(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLandmarkType.call(this, retVal)
    end
    def get_CachedLocalizedLandmarkType(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLocalizedLandmarkType.call(this, retVal)
    end
    def get_CurrentFullDescription(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFullDescription.call(this, retVal)
    end
    def get_CachedFullDescription(this : IUIAutomationElement8*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFullDescription.call(this, retVal)
    end
    def find_first_with_options(this : IUIAutomationElement8*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, traversalOptions : Win32cr::UI::Accessibility::TreeTraversalOptions, root : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_with_options.call(this, scope, condition, traversalOptions, root, found)
    end
    def find_all_with_options(this : IUIAutomationElement8*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, traversalOptions : Win32cr::UI::Accessibility::TreeTraversalOptions, root : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_with_options.call(this, scope, condition, traversalOptions, root, found)
    end
    def find_first_with_options_build_cache(this : IUIAutomationElement8*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, traversalOptions : Win32cr::UI::Accessibility::TreeTraversalOptions, root : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_with_options_build_cache.call(this, scope, condition, cacheRequest, traversalOptions, root, found)
    end
    def find_all_with_options_build_cache(this : IUIAutomationElement8*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, traversalOptions : Win32cr::UI::Accessibility::TreeTraversalOptions, root : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_with_options_build_cache.call(this, scope, condition, cacheRequest, traversalOptions, root, found)
    end
    def get_current_metadata_value(this : IUIAutomationElement8*, targetId : Int32, metadataId : Int32, returnVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_metadata_value.call(this, targetId, metadataId, returnVal)
    end
    def get_CurrentHeadingLevel(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHeadingLevel.call(this, retVal)
    end
    def get_CachedHeadingLevel(this : IUIAutomationElement8*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHeadingLevel.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationElement9Vtbl,
    query_interface : Proc(IUIAutomationElement9*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationElement9*, UInt32),
    release : Proc(IUIAutomationElement9*, UInt32),
    set_focus : Proc(IUIAutomationElement9*, Win32cr::Foundation::HRESULT),
    get_runtime_id : Proc(IUIAutomationElement9*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    find_first : Proc(IUIAutomationElement9*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all : Proc(IUIAutomationElement9*, Win32cr::UI::Accessibility::TreeScope, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_first_build_cache : Proc(IUIAutomationElement9*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_build_cache : Proc(IUIAutomationElement9*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    build_updated_cache : Proc(IUIAutomationElement9*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_current_property_value : Proc(IUIAutomationElement9*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_property_value_ex : Proc(IUIAutomationElement9*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value : Proc(IUIAutomationElement9*, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_cached_property_value_ex : Proc(IUIAutomationElement9*, Int32, Win32cr::Foundation::BOOL, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_current_pattern_as : Proc(IUIAutomationElement9*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern_as : Proc(IUIAutomationElement9*, Int32, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    get_current_pattern : Proc(IUIAutomationElement9*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_pattern : Proc(IUIAutomationElement9*, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_cached_parent : Proc(IUIAutomationElement9*, Void**, Win32cr::Foundation::HRESULT),
    get_cached_children : Proc(IUIAutomationElement9*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProcessId : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentControlType : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLocalizedControlType : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentName : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAcceleratorKey : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAccessKey : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHasKeyboardFocus : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsKeyboardFocusable : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsEnabled : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentAutomationId : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentClassName : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentHelpText : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentCulture : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentIsControlElement : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsContentElement : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPassword : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentNativeWindowHandle : Proc(IUIAutomationElement9*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CurrentItemType : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsOffscreen : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOrientation : Proc(IUIAutomationElement9*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CurrentFrameworkId : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsRequiredForForm : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentItemStatus : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentBoundingRectangle : Proc(IUIAutomationElement9*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CurrentLabeledBy : Proc(IUIAutomationElement9*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentAriaRole : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentAriaProperties : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentIsDataValidForForm : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentControllerFor : Proc(IUIAutomationElement9*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentDescribedBy : Proc(IUIAutomationElement9*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsTo : Proc(IUIAutomationElement9*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentProviderDescription : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedProcessId : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedControlType : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLocalizedControlType : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedName : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAcceleratorKey : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAccessKey : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHasKeyboardFocus : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsKeyboardFocusable : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsEnabled : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedAutomationId : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedClassName : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedHelpText : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedCulture : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedIsControlElement : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsContentElement : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPassword : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedNativeWindowHandle : Proc(IUIAutomationElement9*, Win32cr::Foundation::HWND*, Win32cr::Foundation::HRESULT),
    get_CachedItemType : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsOffscreen : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOrientation : Proc(IUIAutomationElement9*, Win32cr::UI::Accessibility::OrientationType*, Win32cr::Foundation::HRESULT),
    get_CachedFrameworkId : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsRequiredForForm : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedItemStatus : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedBoundingRectangle : Proc(IUIAutomationElement9*, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    get_CachedLabeledBy : Proc(IUIAutomationElement9*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedAriaRole : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedAriaProperties : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedIsDataValidForForm : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedControllerFor : Proc(IUIAutomationElement9*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedDescribedBy : Proc(IUIAutomationElement9*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsTo : Proc(IUIAutomationElement9*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedProviderDescription : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_clickable_point : Proc(IUIAutomationElement9*, Win32cr::Foundation::POINT*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentOptimizeForVisualContent : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedOptimizeForVisualContent : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentLiveSetting : Proc(IUIAutomationElement9*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CachedLiveSetting : Proc(IUIAutomationElement9*, Win32cr::UI::Accessibility::LiveSetting*, Win32cr::Foundation::HRESULT),
    get_CurrentFlowsFrom : Proc(IUIAutomationElement9*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedFlowsFrom : Proc(IUIAutomationElement9*, Void**, Win32cr::Foundation::HRESULT),
    show_context_menu : Proc(IUIAutomationElement9*, Win32cr::Foundation::HRESULT),
    get_CurrentIsPeripheral : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsPeripheral : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CurrentPositionInSet : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentSizeOfSet : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLevel : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentAnnotationTypes : Proc(IUIAutomationElement9*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CurrentAnnotationObjects : Proc(IUIAutomationElement9*, Void**, Win32cr::Foundation::HRESULT),
    get_CachedPositionInSet : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedSizeOfSet : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLevel : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedAnnotationTypes : Proc(IUIAutomationElement9*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_CachedAnnotationObjects : Proc(IUIAutomationElement9*, Void**, Win32cr::Foundation::HRESULT),
    get_CurrentLandmarkType : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentLocalizedLandmarkType : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedLandmarkType : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedLocalizedLandmarkType : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CurrentFullDescription : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_CachedFullDescription : Proc(IUIAutomationElement9*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    find_first_with_options : Proc(IUIAutomationElement9*, Win32cr::UI::Accessibility::TreeScope, Void*, Win32cr::UI::Accessibility::TreeTraversalOptions, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_with_options : Proc(IUIAutomationElement9*, Win32cr::UI::Accessibility::TreeScope, Void*, Win32cr::UI::Accessibility::TreeTraversalOptions, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_first_with_options_build_cache : Proc(IUIAutomationElement9*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::UI::Accessibility::TreeTraversalOptions, Void*, Void**, Win32cr::Foundation::HRESULT),
    find_all_with_options_build_cache : Proc(IUIAutomationElement9*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::UI::Accessibility::TreeTraversalOptions, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_current_metadata_value : Proc(IUIAutomationElement9*, Int32, Int32, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    get_CurrentHeadingLevel : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CachedHeadingLevel : Proc(IUIAutomationElement9*, Int32*, Win32cr::Foundation::HRESULT),
    get_CurrentIsDialog : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CachedIsDialog : Proc(IUIAutomationElement9*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationElement9, lpVtbl : IUIAutomationElement9Vtbl* do
    GUID = LibC::GUID.new(0x39325fac_u32, 0x39d_u16, 0x440e_u16, StaticArray[0xa3_u8, 0xa3_u8, 0x5e_u8, 0xb8_u8, 0x1a_u8, 0x5c_u8, 0xec_u8, 0xc3_u8])
    def query_interface(this : IUIAutomationElement9*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationElement9*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationElement9*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def set_focus(this : IUIAutomationElement9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_focus.call(this)
    end
    def get_runtime_id(this : IUIAutomationElement9*, runtimeId : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_runtime_id.call(this, runtimeId)
    end
    def find_first(this : IUIAutomationElement9*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first.call(this, scope, condition, found)
    end
    def find_all(this : IUIAutomationElement9*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all.call(this, scope, condition, found)
    end
    def find_first_build_cache(this : IUIAutomationElement9*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def find_all_build_cache(this : IUIAutomationElement9*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_build_cache.call(this, scope, condition, cacheRequest, found)
    end
    def build_updated_cache(this : IUIAutomationElement9*, cacheRequest : Void*, updatedElement : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.build_updated_cache.call(this, cacheRequest, updatedElement)
    end
    def get_current_property_value(this : IUIAutomationElement9*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value.call(this, propertyId, retVal)
    end
    def get_current_property_value_ex(this : IUIAutomationElement9*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_cached_property_value(this : IUIAutomationElement9*, propertyId : Int32, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value.call(this, propertyId, retVal)
    end
    def get_cached_property_value_ex(this : IUIAutomationElement9*, propertyId : Int32, ignoreDefaultValue : Win32cr::Foundation::BOOL, retVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_property_value_ex.call(this, propertyId, ignoreDefaultValue, retVal)
    end
    def get_current_pattern_as(this : IUIAutomationElement9*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_cached_pattern_as(this : IUIAutomationElement9*, patternId : Int32, riid : LibC::GUID*, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern_as.call(this, patternId, riid, patternObject)
    end
    def get_current_pattern(this : IUIAutomationElement9*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_pattern.call(this, patternId, patternObject)
    end
    def get_cached_pattern(this : IUIAutomationElement9*, patternId : Int32, patternObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_pattern.call(this, patternId, patternObject)
    end
    def get_cached_parent(this : IUIAutomationElement9*, parent : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_parent.call(this, parent)
    end
    def get_cached_children(this : IUIAutomationElement9*, children : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_cached_children.call(this, children)
    end
    def get_CurrentProcessId(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProcessId.call(this, retVal)
    end
    def get_CurrentControlType(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControlType.call(this, retVal)
    end
    def get_CurrentLocalizedControlType(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLocalizedControlType.call(this, retVal)
    end
    def get_CurrentName(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentName.call(this, retVal)
    end
    def get_CurrentAcceleratorKey(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAcceleratorKey.call(this, retVal)
    end
    def get_CurrentAccessKey(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAccessKey.call(this, retVal)
    end
    def get_CurrentHasKeyboardFocus(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHasKeyboardFocus.call(this, retVal)
    end
    def get_CurrentIsKeyboardFocusable(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsKeyboardFocusable.call(this, retVal)
    end
    def get_CurrentIsEnabled(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsEnabled.call(this, retVal)
    end
    def get_CurrentAutomationId(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAutomationId.call(this, retVal)
    end
    def get_CurrentClassName(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentClassName.call(this, retVal)
    end
    def get_CurrentHelpText(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHelpText.call(this, retVal)
    end
    def get_CurrentCulture(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentCulture.call(this, retVal)
    end
    def get_CurrentIsControlElement(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsControlElement.call(this, retVal)
    end
    def get_CurrentIsContentElement(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsContentElement.call(this, retVal)
    end
    def get_CurrentIsPassword(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPassword.call(this, retVal)
    end
    def get_CurrentNativeWindowHandle(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentNativeWindowHandle.call(this, retVal)
    end
    def get_CurrentItemType(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemType.call(this, retVal)
    end
    def get_CurrentIsOffscreen(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsOffscreen.call(this, retVal)
    end
    def get_CurrentOrientation(this : IUIAutomationElement9*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOrientation.call(this, retVal)
    end
    def get_CurrentFrameworkId(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFrameworkId.call(this, retVal)
    end
    def get_CurrentIsRequiredForForm(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsRequiredForForm.call(this, retVal)
    end
    def get_CurrentItemStatus(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentItemStatus.call(this, retVal)
    end
    def get_CurrentBoundingRectangle(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentBoundingRectangle.call(this, retVal)
    end
    def get_CurrentLabeledBy(this : IUIAutomationElement9*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLabeledBy.call(this, retVal)
    end
    def get_CurrentAriaRole(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaRole.call(this, retVal)
    end
    def get_CurrentAriaProperties(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAriaProperties.call(this, retVal)
    end
    def get_CurrentIsDataValidForForm(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsDataValidForForm.call(this, retVal)
    end
    def get_CurrentControllerFor(this : IUIAutomationElement9*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentControllerFor.call(this, retVal)
    end
    def get_CurrentDescribedBy(this : IUIAutomationElement9*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentDescribedBy.call(this, retVal)
    end
    def get_CurrentFlowsTo(this : IUIAutomationElement9*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsTo.call(this, retVal)
    end
    def get_CurrentProviderDescription(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentProviderDescription.call(this, retVal)
    end
    def get_CachedProcessId(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProcessId.call(this, retVal)
    end
    def get_CachedControlType(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControlType.call(this, retVal)
    end
    def get_CachedLocalizedControlType(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLocalizedControlType.call(this, retVal)
    end
    def get_CachedName(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedName.call(this, retVal)
    end
    def get_CachedAcceleratorKey(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAcceleratorKey.call(this, retVal)
    end
    def get_CachedAccessKey(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAccessKey.call(this, retVal)
    end
    def get_CachedHasKeyboardFocus(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHasKeyboardFocus.call(this, retVal)
    end
    def get_CachedIsKeyboardFocusable(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsKeyboardFocusable.call(this, retVal)
    end
    def get_CachedIsEnabled(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsEnabled.call(this, retVal)
    end
    def get_CachedAutomationId(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAutomationId.call(this, retVal)
    end
    def get_CachedClassName(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedClassName.call(this, retVal)
    end
    def get_CachedHelpText(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHelpText.call(this, retVal)
    end
    def get_CachedCulture(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedCulture.call(this, retVal)
    end
    def get_CachedIsControlElement(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsControlElement.call(this, retVal)
    end
    def get_CachedIsContentElement(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsContentElement.call(this, retVal)
    end
    def get_CachedIsPassword(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPassword.call(this, retVal)
    end
    def get_CachedNativeWindowHandle(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedNativeWindowHandle.call(this, retVal)
    end
    def get_CachedItemType(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemType.call(this, retVal)
    end
    def get_CachedIsOffscreen(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsOffscreen.call(this, retVal)
    end
    def get_CachedOrientation(this : IUIAutomationElement9*, retVal : Win32cr::UI::Accessibility::OrientationType*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOrientation.call(this, retVal)
    end
    def get_CachedFrameworkId(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFrameworkId.call(this, retVal)
    end
    def get_CachedIsRequiredForForm(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsRequiredForForm.call(this, retVal)
    end
    def get_CachedItemStatus(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedItemStatus.call(this, retVal)
    end
    def get_CachedBoundingRectangle(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedBoundingRectangle.call(this, retVal)
    end
    def get_CachedLabeledBy(this : IUIAutomationElement9*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLabeledBy.call(this, retVal)
    end
    def get_CachedAriaRole(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaRole.call(this, retVal)
    end
    def get_CachedAriaProperties(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAriaProperties.call(this, retVal)
    end
    def get_CachedIsDataValidForForm(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsDataValidForForm.call(this, retVal)
    end
    def get_CachedControllerFor(this : IUIAutomationElement9*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedControllerFor.call(this, retVal)
    end
    def get_CachedDescribedBy(this : IUIAutomationElement9*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedDescribedBy.call(this, retVal)
    end
    def get_CachedFlowsTo(this : IUIAutomationElement9*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsTo.call(this, retVal)
    end
    def get_CachedProviderDescription(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedProviderDescription.call(this, retVal)
    end
    def get_clickable_point(this : IUIAutomationElement9*, clickable : Win32cr::Foundation::POINT*, gotClickable : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_clickable_point.call(this, clickable, gotClickable)
    end
    def get_CurrentOptimizeForVisualContent(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentOptimizeForVisualContent.call(this, retVal)
    end
    def get_CachedOptimizeForVisualContent(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedOptimizeForVisualContent.call(this, retVal)
    end
    def get_CurrentLiveSetting(this : IUIAutomationElement9*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLiveSetting.call(this, retVal)
    end
    def get_CachedLiveSetting(this : IUIAutomationElement9*, retVal : Win32cr::UI::Accessibility::LiveSetting*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLiveSetting.call(this, retVal)
    end
    def get_CurrentFlowsFrom(this : IUIAutomationElement9*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFlowsFrom.call(this, retVal)
    end
    def get_CachedFlowsFrom(this : IUIAutomationElement9*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFlowsFrom.call(this, retVal)
    end
    def show_context_menu(this : IUIAutomationElement9*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.show_context_menu.call(this)
    end
    def get_CurrentIsPeripheral(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsPeripheral.call(this, retVal)
    end
    def get_CachedIsPeripheral(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsPeripheral.call(this, retVal)
    end
    def get_CurrentPositionInSet(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentPositionInSet.call(this, retVal)
    end
    def get_CurrentSizeOfSet(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentSizeOfSet.call(this, retVal)
    end
    def get_CurrentLevel(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLevel.call(this, retVal)
    end
    def get_CurrentAnnotationTypes(this : IUIAutomationElement9*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAnnotationTypes.call(this, retVal)
    end
    def get_CurrentAnnotationObjects(this : IUIAutomationElement9*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentAnnotationObjects.call(this, retVal)
    end
    def get_CachedPositionInSet(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedPositionInSet.call(this, retVal)
    end
    def get_CachedSizeOfSet(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedSizeOfSet.call(this, retVal)
    end
    def get_CachedLevel(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLevel.call(this, retVal)
    end
    def get_CachedAnnotationTypes(this : IUIAutomationElement9*, retVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAnnotationTypes.call(this, retVal)
    end
    def get_CachedAnnotationObjects(this : IUIAutomationElement9*, retVal : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedAnnotationObjects.call(this, retVal)
    end
    def get_CurrentLandmarkType(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLandmarkType.call(this, retVal)
    end
    def get_CurrentLocalizedLandmarkType(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentLocalizedLandmarkType.call(this, retVal)
    end
    def get_CachedLandmarkType(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLandmarkType.call(this, retVal)
    end
    def get_CachedLocalizedLandmarkType(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedLocalizedLandmarkType.call(this, retVal)
    end
    def get_CurrentFullDescription(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentFullDescription.call(this, retVal)
    end
    def get_CachedFullDescription(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedFullDescription.call(this, retVal)
    end
    def find_first_with_options(this : IUIAutomationElement9*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, traversalOptions : Win32cr::UI::Accessibility::TreeTraversalOptions, root : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_with_options.call(this, scope, condition, traversalOptions, root, found)
    end
    def find_all_with_options(this : IUIAutomationElement9*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, traversalOptions : Win32cr::UI::Accessibility::TreeTraversalOptions, root : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_with_options.call(this, scope, condition, traversalOptions, root, found)
    end
    def find_first_with_options_build_cache(this : IUIAutomationElement9*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, traversalOptions : Win32cr::UI::Accessibility::TreeTraversalOptions, root : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_with_options_build_cache.call(this, scope, condition, cacheRequest, traversalOptions, root, found)
    end
    def find_all_with_options_build_cache(this : IUIAutomationElement9*, scope : Win32cr::UI::Accessibility::TreeScope, condition : Void*, cacheRequest : Void*, traversalOptions : Win32cr::UI::Accessibility::TreeTraversalOptions, root : Void*, found : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_all_with_options_build_cache.call(this, scope, condition, cacheRequest, traversalOptions, root, found)
    end
    def get_current_metadata_value(this : IUIAutomationElement9*, targetId : Int32, metadataId : Int32, returnVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current_metadata_value.call(this, targetId, metadataId, returnVal)
    end
    def get_CurrentHeadingLevel(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentHeadingLevel.call(this, retVal)
    end
    def get_CachedHeadingLevel(this : IUIAutomationElement9*, retVal : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedHeadingLevel.call(this, retVal)
    end
    def get_CurrentIsDialog(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CurrentIsDialog.call(this, retVal)
    end
    def get_CachedIsDialog(this : IUIAutomationElement9*, retVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CachedIsDialog.call(this, retVal)
    end

  end

  @[Extern]
  record IUIAutomationProxyFactoryVtbl,
    query_interface : Proc(IUIAutomationProxyFactory*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationProxyFactory*, UInt32),
    release : Proc(IUIAutomationProxyFactory*, UInt32),
    create_provider : Proc(IUIAutomationProxyFactory*, Win32cr::Foundation::HWND, Int32, Int32, Void**, Win32cr::Foundation::HRESULT),
    get_ProxyFactoryId : Proc(IUIAutomationProxyFactory*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationProxyFactory, lpVtbl : IUIAutomationProxyFactoryVtbl* do
    GUID = LibC::GUID.new(0x85b94ecd_u32, 0x849d_u16, 0x42b6_u16, StaticArray[0xb9_u8, 0x4d_u8, 0xd6_u8, 0xdb_u8, 0x23_u8, 0xfd_u8, 0xf5_u8, 0xa4_u8])
    def query_interface(this : IUIAutomationProxyFactory*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationProxyFactory*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationProxyFactory*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def create_provider(this : IUIAutomationProxyFactory*, hwnd : Win32cr::Foundation::HWND, idObject : Int32, idChild : Int32, provider : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_provider.call(this, hwnd, idObject, idChild, provider)
    end
    def get_ProxyFactoryId(this : IUIAutomationProxyFactory*, factoryId : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProxyFactoryId.call(this, factoryId)
    end

  end

  @[Extern]
  record IUIAutomationProxyFactoryEntryVtbl,
    query_interface : Proc(IUIAutomationProxyFactoryEntry*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationProxyFactoryEntry*, UInt32),
    release : Proc(IUIAutomationProxyFactoryEntry*, UInt32),
    get_ProxyFactory : Proc(IUIAutomationProxyFactoryEntry*, Void**, Win32cr::Foundation::HRESULT),
    get_ClassName : Proc(IUIAutomationProxyFactoryEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_ImageName : Proc(IUIAutomationProxyFactoryEntry*, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_AllowSubstringMatch : Proc(IUIAutomationProxyFactoryEntry*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_CanCheckBaseClass : Proc(IUIAutomationProxyFactoryEntry*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_NeedsAdviseEvents : Proc(IUIAutomationProxyFactoryEntry*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_ClassName : Proc(IUIAutomationProxyFactoryEntry*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    put_ImageName : Proc(IUIAutomationProxyFactoryEntry*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    put_AllowSubstringMatch : Proc(IUIAutomationProxyFactoryEntry*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    put_CanCheckBaseClass : Proc(IUIAutomationProxyFactoryEntry*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    put_NeedsAdviseEvents : Proc(IUIAutomationProxyFactoryEntry*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    set_win_events_for_automation_event : Proc(IUIAutomationProxyFactoryEntry*, Int32, Int32, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    get_win_events_for_automation_event : Proc(IUIAutomationProxyFactoryEntry*, Int32, Int32, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationProxyFactoryEntry, lpVtbl : IUIAutomationProxyFactoryEntryVtbl* do
    GUID = LibC::GUID.new(0xd50e472e_u32, 0xb64b_u16, 0x490c_u16, StaticArray[0xbc_u8, 0xa1_u8, 0xd3_u8, 0x6_u8, 0x96_u8, 0xf9_u8, 0xf2_u8, 0x89_u8])
    def query_interface(this : IUIAutomationProxyFactoryEntry*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationProxyFactoryEntry*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationProxyFactoryEntry*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_ProxyFactory(this : IUIAutomationProxyFactoryEntry*, factory : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProxyFactory.call(this, factory)
    end
    def get_ClassName(this : IUIAutomationProxyFactoryEntry*, className : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ClassName.call(this, className)
    end
    def get_ImageName(this : IUIAutomationProxyFactoryEntry*, imageName : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ImageName.call(this, imageName)
    end
    def get_AllowSubstringMatch(this : IUIAutomationProxyFactoryEntry*, allowSubstringMatch : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AllowSubstringMatch.call(this, allowSubstringMatch)
    end
    def get_CanCheckBaseClass(this : IUIAutomationProxyFactoryEntry*, canCheckBaseClass : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CanCheckBaseClass.call(this, canCheckBaseClass)
    end
    def get_NeedsAdviseEvents(this : IUIAutomationProxyFactoryEntry*, adviseEvents : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NeedsAdviseEvents.call(this, adviseEvents)
    end
    def put_ClassName(this : IUIAutomationProxyFactoryEntry*, className : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ClassName.call(this, className)
    end
    def put_ImageName(this : IUIAutomationProxyFactoryEntry*, imageName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ImageName.call(this, imageName)
    end
    def put_AllowSubstringMatch(this : IUIAutomationProxyFactoryEntry*, allowSubstringMatch : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AllowSubstringMatch.call(this, allowSubstringMatch)
    end
    def put_CanCheckBaseClass(this : IUIAutomationProxyFactoryEntry*, canCheckBaseClass : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CanCheckBaseClass.call(this, canCheckBaseClass)
    end
    def put_NeedsAdviseEvents(this : IUIAutomationProxyFactoryEntry*, adviseEvents : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NeedsAdviseEvents.call(this, adviseEvents)
    end
    def set_win_events_for_automation_event(this : IUIAutomationProxyFactoryEntry*, eventId : Int32, propertyId : Int32, winEvents : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_win_events_for_automation_event.call(this, eventId, propertyId, winEvents)
    end
    def get_win_events_for_automation_event(this : IUIAutomationProxyFactoryEntry*, eventId : Int32, propertyId : Int32, winEvents : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_win_events_for_automation_event.call(this, eventId, propertyId, winEvents)
    end

  end

  @[Extern]
  record IUIAutomationProxyFactoryMappingVtbl,
    query_interface : Proc(IUIAutomationProxyFactoryMapping*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationProxyFactoryMapping*, UInt32),
    release : Proc(IUIAutomationProxyFactoryMapping*, UInt32),
    get_Count : Proc(IUIAutomationProxyFactoryMapping*, UInt32*, Win32cr::Foundation::HRESULT),
    get_table : Proc(IUIAutomationProxyFactoryMapping*, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    get_entry : Proc(IUIAutomationProxyFactoryMapping*, UInt32, Void**, Win32cr::Foundation::HRESULT),
    set_table : Proc(IUIAutomationProxyFactoryMapping*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    insert_entries : Proc(IUIAutomationProxyFactoryMapping*, UInt32, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    insert_entry : Proc(IUIAutomationProxyFactoryMapping*, UInt32, Void*, Win32cr::Foundation::HRESULT),
    remove_entry : Proc(IUIAutomationProxyFactoryMapping*, UInt32, Win32cr::Foundation::HRESULT),
    clear_table : Proc(IUIAutomationProxyFactoryMapping*, Win32cr::Foundation::HRESULT),
    restore_default_table : Proc(IUIAutomationProxyFactoryMapping*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationProxyFactoryMapping, lpVtbl : IUIAutomationProxyFactoryMappingVtbl* do
    GUID = LibC::GUID.new(0x9e31e18_u32, 0x872d_u16, 0x4873_u16, StaticArray[0x93_u8, 0xd1_u8, 0x1e_u8, 0x54_u8, 0x1e_u8, 0xc1_u8, 0x33_u8, 0xfd_u8])
    def query_interface(this : IUIAutomationProxyFactoryMapping*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationProxyFactoryMapping*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationProxyFactoryMapping*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_Count(this : IUIAutomationProxyFactoryMapping*, count : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, count)
    end
    def get_table(this : IUIAutomationProxyFactoryMapping*, table : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_table.call(this, table)
    end
    def get_entry(this : IUIAutomationProxyFactoryMapping*, index : UInt32, entry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_entry.call(this, index, entry)
    end
    def set_table(this : IUIAutomationProxyFactoryMapping*, factoryList : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_table.call(this, factoryList)
    end
    def insert_entries(this : IUIAutomationProxyFactoryMapping*, before : UInt32, factoryList : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_entries.call(this, before, factoryList)
    end
    def insert_entry(this : IUIAutomationProxyFactoryMapping*, before : UInt32, factory : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.insert_entry.call(this, before, factory)
    end
    def remove_entry(this : IUIAutomationProxyFactoryMapping*, index : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_entry.call(this, index)
    end
    def clear_table(this : IUIAutomationProxyFactoryMapping*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.clear_table.call(this)
    end
    def restore_default_table(this : IUIAutomationProxyFactoryMapping*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.restore_default_table.call(this)
    end

  end

  @[Extern]
  record IUIAutomationEventHandlerGroupVtbl,
    query_interface : Proc(IUIAutomationEventHandlerGroup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomationEventHandlerGroup*, UInt32),
    release : Proc(IUIAutomationEventHandlerGroup*, UInt32),
    add_active_text_position_changed_event_handler : Proc(IUIAutomationEventHandlerGroup*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_automation_event_handler : Proc(IUIAutomationEventHandlerGroup*, Int32, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_changes_event_handler : Proc(IUIAutomationEventHandlerGroup*, Win32cr::UI::Accessibility::TreeScope, Int32*, Int32, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_notification_event_handler : Proc(IUIAutomationEventHandlerGroup*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_property_changed_event_handler : Proc(IUIAutomationEventHandlerGroup*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Int32*, Int32, Win32cr::Foundation::HRESULT),
    add_structure_changed_event_handler : Proc(IUIAutomationEventHandlerGroup*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_text_edit_text_changed_event_handler : Proc(IUIAutomationEventHandlerGroup*, Win32cr::UI::Accessibility::TreeScope, Win32cr::UI::Accessibility::TextEditChangeType, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomationEventHandlerGroup, lpVtbl : IUIAutomationEventHandlerGroupVtbl* do
    GUID = LibC::GUID.new(0xc9ee12f2_u32, 0xc13b_u16, 0x4408_u16, StaticArray[0x99_u8, 0x7c_u8, 0x63_u8, 0x99_u8, 0x14_u8, 0x37_u8, 0x7f_u8, 0x4e_u8])
    def query_interface(this : IUIAutomationEventHandlerGroup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomationEventHandlerGroup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomationEventHandlerGroup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def add_active_text_position_changed_event_handler(this : IUIAutomationEventHandlerGroup*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_active_text_position_changed_event_handler.call(this, scope, cacheRequest, handler)
    end
    def add_automation_event_handler(this : IUIAutomationEventHandlerGroup*, eventId : Int32, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_automation_event_handler.call(this, eventId, scope, cacheRequest, handler)
    end
    def add_changes_event_handler(this : IUIAutomationEventHandlerGroup*, scope : Win32cr::UI::Accessibility::TreeScope, changeTypes : Int32*, changesCount : Int32, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_changes_event_handler.call(this, scope, changeTypes, changesCount, cacheRequest, handler)
    end
    def add_notification_event_handler(this : IUIAutomationEventHandlerGroup*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_notification_event_handler.call(this, scope, cacheRequest, handler)
    end
    def add_property_changed_event_handler(this : IUIAutomationEventHandlerGroup*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*, propertyArray : Int32*, propertyCount : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_changed_event_handler.call(this, scope, cacheRequest, handler, propertyArray, propertyCount)
    end
    def add_structure_changed_event_handler(this : IUIAutomationEventHandlerGroup*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_structure_changed_event_handler.call(this, scope, cacheRequest, handler)
    end
    def add_text_edit_text_changed_event_handler(this : IUIAutomationEventHandlerGroup*, scope : Win32cr::UI::Accessibility::TreeScope, textEditChangeType : Win32cr::UI::Accessibility::TextEditChangeType, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_text_edit_text_changed_event_handler.call(this, scope, textEditChangeType, cacheRequest, handler)
    end

  end

  @[Extern]
  record IUIAutomationVtbl,
    query_interface : Proc(IUIAutomation*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomation*, UInt32),
    release : Proc(IUIAutomation*, UInt32),
    compare_elements : Proc(IUIAutomation*, Void*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    compare_runtime_ids : Proc(IUIAutomation*, Win32cr::System::Com::SAFEARRAY*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_root_element : Proc(IUIAutomation*, Void**, Win32cr::Foundation::HRESULT),
    element_from_handle : Proc(IUIAutomation*, Win32cr::Foundation::HWND, Void**, Win32cr::Foundation::HRESULT),
    element_from_point : Proc(IUIAutomation*, Win32cr::Foundation::POINT, Void**, Win32cr::Foundation::HRESULT),
    get_focused_element : Proc(IUIAutomation*, Void**, Win32cr::Foundation::HRESULT),
    get_root_element_build_cache : Proc(IUIAutomation*, Void*, Void**, Win32cr::Foundation::HRESULT),
    element_from_handle_build_cache : Proc(IUIAutomation*, Win32cr::Foundation::HWND, Void*, Void**, Win32cr::Foundation::HRESULT),
    element_from_point_build_cache : Proc(IUIAutomation*, Win32cr::Foundation::POINT, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_focused_element_build_cache : Proc(IUIAutomation*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_tree_walker : Proc(IUIAutomation*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_ControlViewWalker : Proc(IUIAutomation*, Void**, Win32cr::Foundation::HRESULT),
    get_ContentViewWalker : Proc(IUIAutomation*, Void**, Win32cr::Foundation::HRESULT),
    get_RawViewWalker : Proc(IUIAutomation*, Void**, Win32cr::Foundation::HRESULT),
    get_RawViewCondition : Proc(IUIAutomation*, Void**, Win32cr::Foundation::HRESULT),
    get_ControlViewCondition : Proc(IUIAutomation*, Void**, Win32cr::Foundation::HRESULT),
    get_ContentViewCondition : Proc(IUIAutomation*, Void**, Win32cr::Foundation::HRESULT),
    create_cache_request : Proc(IUIAutomation*, Void**, Win32cr::Foundation::HRESULT),
    create_true_condition : Proc(IUIAutomation*, Void**, Win32cr::Foundation::HRESULT),
    create_false_condition : Proc(IUIAutomation*, Void**, Win32cr::Foundation::HRESULT),
    create_property_condition : Proc(IUIAutomation*, Int32, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_property_condition_ex : Proc(IUIAutomation*, Int32, Win32cr::System::Com::VARIANT, Win32cr::UI::Accessibility::PropertyConditionFlags, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition : Proc(IUIAutomation*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition_from_array : Proc(IUIAutomation*, Win32cr::System::Com::SAFEARRAY*, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition_from_native_array : Proc(IUIAutomation*, Void**, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition : Proc(IUIAutomation*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition_from_array : Proc(IUIAutomation*, Win32cr::System::Com::SAFEARRAY*, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition_from_native_array : Proc(IUIAutomation*, Void**, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_not_condition : Proc(IUIAutomation*, Void*, Void**, Win32cr::Foundation::HRESULT),
    add_automation_event_handler : Proc(IUIAutomation*, Int32, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_automation_event_handler : Proc(IUIAutomation*, Int32, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_property_changed_event_handler_native_array : Proc(IUIAutomation*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Int32*, Int32, Win32cr::Foundation::HRESULT),
    add_property_changed_event_handler : Proc(IUIAutomation*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    remove_property_changed_event_handler : Proc(IUIAutomation*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_structure_changed_event_handler : Proc(IUIAutomation*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_structure_changed_event_handler : Proc(IUIAutomation*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_focus_changed_event_handler : Proc(IUIAutomation*, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_focus_changed_event_handler : Proc(IUIAutomation*, Void*, Win32cr::Foundation::HRESULT),
    remove_all_event_handlers : Proc(IUIAutomation*, Win32cr::Foundation::HRESULT),
    int_native_array_to_safe_array : Proc(IUIAutomation*, Int32*, Int32, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    int_safe_array_to_native_array : Proc(IUIAutomation*, Win32cr::System::Com::SAFEARRAY*, Int32**, Int32*, Win32cr::Foundation::HRESULT),
    rect_to_variant : Proc(IUIAutomation*, Win32cr::Foundation::RECT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    variant_to_rect : Proc(IUIAutomation*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    safe_array_to_rect_native_array : Proc(IUIAutomation*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::RECT**, Int32*, Win32cr::Foundation::HRESULT),
    create_proxy_factory_entry : Proc(IUIAutomation*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_ProxyFactoryMapping : Proc(IUIAutomation*, Void**, Win32cr::Foundation::HRESULT),
    get_property_programmatic_name : Proc(IUIAutomation*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_pattern_programmatic_name : Proc(IUIAutomation*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    poll_for_potential_supported_patterns : Proc(IUIAutomation*, Void*, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    poll_for_potential_supported_properties : Proc(IUIAutomation*, Void*, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    check_not_supported : Proc(IUIAutomation*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_ReservedNotSupportedValue : Proc(IUIAutomation*, Void**, Win32cr::Foundation::HRESULT),
    get_ReservedMixedAttributeValue : Proc(IUIAutomation*, Void**, Win32cr::Foundation::HRESULT),
    element_from_i_accessible : Proc(IUIAutomation*, Void*, Int32, Void**, Win32cr::Foundation::HRESULT),
    element_from_i_accessible_build_cache : Proc(IUIAutomation*, Void*, Int32, Void*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomation, lpVtbl : IUIAutomationVtbl* do
    GUID = LibC::GUID.new(0x30cbe57d_u32, 0xd9d0_u16, 0x452a_u16, StaticArray[0xab_u8, 0x13_u8, 0x7a_u8, 0xc5_u8, 0xac_u8, 0x48_u8, 0x25_u8, 0xee_u8])
    def query_interface(this : IUIAutomation*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomation*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomation*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def compare_elements(this : IUIAutomation*, el1 : Void*, el2 : Void*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_elements.call(this, el1, el2, areSame)
    end
    def compare_runtime_ids(this : IUIAutomation*, runtimeId1 : Win32cr::System::Com::SAFEARRAY*, runtimeId2 : Win32cr::System::Com::SAFEARRAY*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_runtime_ids.call(this, runtimeId1, runtimeId2, areSame)
    end
    def get_root_element(this : IUIAutomation*, root : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_element.call(this, root)
    end
    def element_from_handle(this : IUIAutomation*, hwnd : Win32cr::Foundation::HWND, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_handle.call(this, hwnd, element)
    end
    def element_from_point(this : IUIAutomation*, pt : Win32cr::Foundation::POINT, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_point.call(this, pt, element)
    end
    def get_focused_element(this : IUIAutomation*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focused_element.call(this, element)
    end
    def get_root_element_build_cache(this : IUIAutomation*, cacheRequest : Void*, root : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_element_build_cache.call(this, cacheRequest, root)
    end
    def element_from_handle_build_cache(this : IUIAutomation*, hwnd : Win32cr::Foundation::HWND, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_handle_build_cache.call(this, hwnd, cacheRequest, element)
    end
    def element_from_point_build_cache(this : IUIAutomation*, pt : Win32cr::Foundation::POINT, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_point_build_cache.call(this, pt, cacheRequest, element)
    end
    def get_focused_element_build_cache(this : IUIAutomation*, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focused_element_build_cache.call(this, cacheRequest, element)
    end
    def create_tree_walker(this : IUIAutomation*, pCondition : Void*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_tree_walker.call(this, pCondition, walker)
    end
    def get_ControlViewWalker(this : IUIAutomation*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ControlViewWalker.call(this, walker)
    end
    def get_ContentViewWalker(this : IUIAutomation*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentViewWalker.call(this, walker)
    end
    def get_RawViewWalker(this : IUIAutomation*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RawViewWalker.call(this, walker)
    end
    def get_RawViewCondition(this : IUIAutomation*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RawViewCondition.call(this, condition)
    end
    def get_ControlViewCondition(this : IUIAutomation*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ControlViewCondition.call(this, condition)
    end
    def get_ContentViewCondition(this : IUIAutomation*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentViewCondition.call(this, condition)
    end
    def create_cache_request(this : IUIAutomation*, cacheRequest : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_cache_request.call(this, cacheRequest)
    end
    def create_true_condition(this : IUIAutomation*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_true_condition.call(this, newCondition)
    end
    def create_false_condition(this : IUIAutomation*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_false_condition.call(this, newCondition)
    end
    def create_property_condition(this : IUIAutomation*, propertyId : Int32, value : Win32cr::System::Com::VARIANT, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_condition.call(this, propertyId, value, newCondition)
    end
    def create_property_condition_ex(this : IUIAutomation*, propertyId : Int32, value : Win32cr::System::Com::VARIANT, flags : Win32cr::UI::Accessibility::PropertyConditionFlags, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_condition_ex.call(this, propertyId, value, flags, newCondition)
    end
    def create_and_condition(this : IUIAutomation*, condition1 : Void*, condition2 : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition.call(this, condition1, condition2, newCondition)
    end
    def create_and_condition_from_array(this : IUIAutomation*, conditions : Win32cr::System::Com::SAFEARRAY*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition_from_array.call(this, conditions, newCondition)
    end
    def create_and_condition_from_native_array(this : IUIAutomation*, conditions : Void**, conditionCount : Int32, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition_from_native_array.call(this, conditions, conditionCount, newCondition)
    end
    def create_or_condition(this : IUIAutomation*, condition1 : Void*, condition2 : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition.call(this, condition1, condition2, newCondition)
    end
    def create_or_condition_from_array(this : IUIAutomation*, conditions : Win32cr::System::Com::SAFEARRAY*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition_from_array.call(this, conditions, newCondition)
    end
    def create_or_condition_from_native_array(this : IUIAutomation*, conditions : Void**, conditionCount : Int32, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition_from_native_array.call(this, conditions, conditionCount, newCondition)
    end
    def create_not_condition(this : IUIAutomation*, condition : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_not_condition.call(this, condition, newCondition)
    end
    def add_automation_event_handler(this : IUIAutomation*, eventId : Int32, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_automation_event_handler.call(this, eventId, element, scope, cacheRequest, handler)
    end
    def remove_automation_event_handler(this : IUIAutomation*, eventId : Int32, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_automation_event_handler.call(this, eventId, element, handler)
    end
    def add_property_changed_event_handler_native_array(this : IUIAutomation*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*, propertyArray : Int32*, propertyCount : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_changed_event_handler_native_array.call(this, element, scope, cacheRequest, handler, propertyArray, propertyCount)
    end
    def add_property_changed_event_handler(this : IUIAutomation*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*, propertyArray : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_changed_event_handler.call(this, element, scope, cacheRequest, handler, propertyArray)
    end
    def remove_property_changed_event_handler(this : IUIAutomation*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_property_changed_event_handler.call(this, element, handler)
    end
    def add_structure_changed_event_handler(this : IUIAutomation*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_structure_changed_event_handler.call(this, element, scope, cacheRequest, handler)
    end
    def remove_structure_changed_event_handler(this : IUIAutomation*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_structure_changed_event_handler.call(this, element, handler)
    end
    def add_focus_changed_event_handler(this : IUIAutomation*, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_focus_changed_event_handler.call(this, cacheRequest, handler)
    end
    def remove_focus_changed_event_handler(this : IUIAutomation*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_focus_changed_event_handler.call(this, handler)
    end
    def remove_all_event_handlers(this : IUIAutomation*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_event_handlers.call(this)
    end
    def int_native_array_to_safe_array(this : IUIAutomation*, array : Int32*, arrayCount : Int32, safeArray : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.int_native_array_to_safe_array.call(this, array, arrayCount, safeArray)
    end
    def int_safe_array_to_native_array(this : IUIAutomation*, intArray : Win32cr::System::Com::SAFEARRAY*, array : Int32**, arrayCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.int_safe_array_to_native_array.call(this, intArray, array, arrayCount)
    end
    def rect_to_variant(this : IUIAutomation*, rc : Win32cr::Foundation::RECT, var : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rect_to_variant.call(this, rc, var)
    end
    def variant_to_rect(this : IUIAutomation*, var : Win32cr::System::Com::VARIANT, rc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.variant_to_rect.call(this, var, rc)
    end
    def safe_array_to_rect_native_array(this : IUIAutomation*, rects : Win32cr::System::Com::SAFEARRAY*, rectArray : Win32cr::Foundation::RECT**, rectArrayCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.safe_array_to_rect_native_array.call(this, rects, rectArray, rectArrayCount)
    end
    def create_proxy_factory_entry(this : IUIAutomation*, factory : Void*, factoryEntry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_proxy_factory_entry.call(this, factory, factoryEntry)
    end
    def get_ProxyFactoryMapping(this : IUIAutomation*, factoryMapping : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProxyFactoryMapping.call(this, factoryMapping)
    end
    def get_property_programmatic_name(this : IUIAutomation*, property : Int32, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_programmatic_name.call(this, property, name)
    end
    def get_pattern_programmatic_name(this : IUIAutomation*, pattern : Int32, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pattern_programmatic_name.call(this, pattern, name)
    end
    def poll_for_potential_supported_patterns(this : IUIAutomation*, pElement : Void*, patternIds : Win32cr::System::Com::SAFEARRAY**, patternNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.poll_for_potential_supported_patterns.call(this, pElement, patternIds, patternNames)
    end
    def poll_for_potential_supported_properties(this : IUIAutomation*, pElement : Void*, propertyIds : Win32cr::System::Com::SAFEARRAY**, propertyNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.poll_for_potential_supported_properties.call(this, pElement, propertyIds, propertyNames)
    end
    def check_not_supported(this : IUIAutomation*, value : Win32cr::System::Com::VARIANT, isNotSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_not_supported.call(this, value, isNotSupported)
    end
    def get_ReservedNotSupportedValue(this : IUIAutomation*, notSupportedValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReservedNotSupportedValue.call(this, notSupportedValue)
    end
    def get_ReservedMixedAttributeValue(this : IUIAutomation*, mixedAttributeValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReservedMixedAttributeValue.call(this, mixedAttributeValue)
    end
    def element_from_i_accessible(this : IUIAutomation*, accessible : Void*, childId : Int32, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_i_accessible.call(this, accessible, childId, element)
    end
    def element_from_i_accessible_build_cache(this : IUIAutomation*, accessible : Void*, childId : Int32, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_i_accessible_build_cache.call(this, accessible, childId, cacheRequest, element)
    end

  end

  @[Extern]
  record IUIAutomation2Vtbl,
    query_interface : Proc(IUIAutomation2*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomation2*, UInt32),
    release : Proc(IUIAutomation2*, UInt32),
    compare_elements : Proc(IUIAutomation2*, Void*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    compare_runtime_ids : Proc(IUIAutomation2*, Win32cr::System::Com::SAFEARRAY*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_root_element : Proc(IUIAutomation2*, Void**, Win32cr::Foundation::HRESULT),
    element_from_handle : Proc(IUIAutomation2*, Win32cr::Foundation::HWND, Void**, Win32cr::Foundation::HRESULT),
    element_from_point : Proc(IUIAutomation2*, Win32cr::Foundation::POINT, Void**, Win32cr::Foundation::HRESULT),
    get_focused_element : Proc(IUIAutomation2*, Void**, Win32cr::Foundation::HRESULT),
    get_root_element_build_cache : Proc(IUIAutomation2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    element_from_handle_build_cache : Proc(IUIAutomation2*, Win32cr::Foundation::HWND, Void*, Void**, Win32cr::Foundation::HRESULT),
    element_from_point_build_cache : Proc(IUIAutomation2*, Win32cr::Foundation::POINT, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_focused_element_build_cache : Proc(IUIAutomation2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_tree_walker : Proc(IUIAutomation2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_ControlViewWalker : Proc(IUIAutomation2*, Void**, Win32cr::Foundation::HRESULT),
    get_ContentViewWalker : Proc(IUIAutomation2*, Void**, Win32cr::Foundation::HRESULT),
    get_RawViewWalker : Proc(IUIAutomation2*, Void**, Win32cr::Foundation::HRESULT),
    get_RawViewCondition : Proc(IUIAutomation2*, Void**, Win32cr::Foundation::HRESULT),
    get_ControlViewCondition : Proc(IUIAutomation2*, Void**, Win32cr::Foundation::HRESULT),
    get_ContentViewCondition : Proc(IUIAutomation2*, Void**, Win32cr::Foundation::HRESULT),
    create_cache_request : Proc(IUIAutomation2*, Void**, Win32cr::Foundation::HRESULT),
    create_true_condition : Proc(IUIAutomation2*, Void**, Win32cr::Foundation::HRESULT),
    create_false_condition : Proc(IUIAutomation2*, Void**, Win32cr::Foundation::HRESULT),
    create_property_condition : Proc(IUIAutomation2*, Int32, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_property_condition_ex : Proc(IUIAutomation2*, Int32, Win32cr::System::Com::VARIANT, Win32cr::UI::Accessibility::PropertyConditionFlags, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition : Proc(IUIAutomation2*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition_from_array : Proc(IUIAutomation2*, Win32cr::System::Com::SAFEARRAY*, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition_from_native_array : Proc(IUIAutomation2*, Void**, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition : Proc(IUIAutomation2*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition_from_array : Proc(IUIAutomation2*, Win32cr::System::Com::SAFEARRAY*, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition_from_native_array : Proc(IUIAutomation2*, Void**, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_not_condition : Proc(IUIAutomation2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    add_automation_event_handler : Proc(IUIAutomation2*, Int32, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_automation_event_handler : Proc(IUIAutomation2*, Int32, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_property_changed_event_handler_native_array : Proc(IUIAutomation2*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Int32*, Int32, Win32cr::Foundation::HRESULT),
    add_property_changed_event_handler : Proc(IUIAutomation2*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    remove_property_changed_event_handler : Proc(IUIAutomation2*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_structure_changed_event_handler : Proc(IUIAutomation2*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_structure_changed_event_handler : Proc(IUIAutomation2*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_focus_changed_event_handler : Proc(IUIAutomation2*, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_focus_changed_event_handler : Proc(IUIAutomation2*, Void*, Win32cr::Foundation::HRESULT),
    remove_all_event_handlers : Proc(IUIAutomation2*, Win32cr::Foundation::HRESULT),
    int_native_array_to_safe_array : Proc(IUIAutomation2*, Int32*, Int32, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    int_safe_array_to_native_array : Proc(IUIAutomation2*, Win32cr::System::Com::SAFEARRAY*, Int32**, Int32*, Win32cr::Foundation::HRESULT),
    rect_to_variant : Proc(IUIAutomation2*, Win32cr::Foundation::RECT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    variant_to_rect : Proc(IUIAutomation2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    safe_array_to_rect_native_array : Proc(IUIAutomation2*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::RECT**, Int32*, Win32cr::Foundation::HRESULT),
    create_proxy_factory_entry : Proc(IUIAutomation2*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_ProxyFactoryMapping : Proc(IUIAutomation2*, Void**, Win32cr::Foundation::HRESULT),
    get_property_programmatic_name : Proc(IUIAutomation2*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_pattern_programmatic_name : Proc(IUIAutomation2*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    poll_for_potential_supported_patterns : Proc(IUIAutomation2*, Void*, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    poll_for_potential_supported_properties : Proc(IUIAutomation2*, Void*, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    check_not_supported : Proc(IUIAutomation2*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_ReservedNotSupportedValue : Proc(IUIAutomation2*, Void**, Win32cr::Foundation::HRESULT),
    get_ReservedMixedAttributeValue : Proc(IUIAutomation2*, Void**, Win32cr::Foundation::HRESULT),
    element_from_i_accessible : Proc(IUIAutomation2*, Void*, Int32, Void**, Win32cr::Foundation::HRESULT),
    element_from_i_accessible_build_cache : Proc(IUIAutomation2*, Void*, Int32, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_AutoSetFocus : Proc(IUIAutomation2*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_AutoSetFocus : Proc(IUIAutomation2*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_ConnectionTimeout : Proc(IUIAutomation2*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ConnectionTimeout : Proc(IUIAutomation2*, UInt32, Win32cr::Foundation::HRESULT),
    get_TransactionTimeout : Proc(IUIAutomation2*, UInt32*, Win32cr::Foundation::HRESULT),
    put_TransactionTimeout : Proc(IUIAutomation2*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomation2, lpVtbl : IUIAutomation2Vtbl* do
    GUID = LibC::GUID.new(0x34723aff_u32, 0xc9d_u16, 0x49d0_u16, StaticArray[0x98_u8, 0x96_u8, 0x7a_u8, 0xb5_u8, 0x2d_u8, 0xf8_u8, 0xcd_u8, 0x8a_u8])
    def query_interface(this : IUIAutomation2*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomation2*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomation2*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def compare_elements(this : IUIAutomation2*, el1 : Void*, el2 : Void*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_elements.call(this, el1, el2, areSame)
    end
    def compare_runtime_ids(this : IUIAutomation2*, runtimeId1 : Win32cr::System::Com::SAFEARRAY*, runtimeId2 : Win32cr::System::Com::SAFEARRAY*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_runtime_ids.call(this, runtimeId1, runtimeId2, areSame)
    end
    def get_root_element(this : IUIAutomation2*, root : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_element.call(this, root)
    end
    def element_from_handle(this : IUIAutomation2*, hwnd : Win32cr::Foundation::HWND, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_handle.call(this, hwnd, element)
    end
    def element_from_point(this : IUIAutomation2*, pt : Win32cr::Foundation::POINT, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_point.call(this, pt, element)
    end
    def get_focused_element(this : IUIAutomation2*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focused_element.call(this, element)
    end
    def get_root_element_build_cache(this : IUIAutomation2*, cacheRequest : Void*, root : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_element_build_cache.call(this, cacheRequest, root)
    end
    def element_from_handle_build_cache(this : IUIAutomation2*, hwnd : Win32cr::Foundation::HWND, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_handle_build_cache.call(this, hwnd, cacheRequest, element)
    end
    def element_from_point_build_cache(this : IUIAutomation2*, pt : Win32cr::Foundation::POINT, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_point_build_cache.call(this, pt, cacheRequest, element)
    end
    def get_focused_element_build_cache(this : IUIAutomation2*, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focused_element_build_cache.call(this, cacheRequest, element)
    end
    def create_tree_walker(this : IUIAutomation2*, pCondition : Void*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_tree_walker.call(this, pCondition, walker)
    end
    def get_ControlViewWalker(this : IUIAutomation2*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ControlViewWalker.call(this, walker)
    end
    def get_ContentViewWalker(this : IUIAutomation2*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentViewWalker.call(this, walker)
    end
    def get_RawViewWalker(this : IUIAutomation2*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RawViewWalker.call(this, walker)
    end
    def get_RawViewCondition(this : IUIAutomation2*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RawViewCondition.call(this, condition)
    end
    def get_ControlViewCondition(this : IUIAutomation2*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ControlViewCondition.call(this, condition)
    end
    def get_ContentViewCondition(this : IUIAutomation2*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentViewCondition.call(this, condition)
    end
    def create_cache_request(this : IUIAutomation2*, cacheRequest : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_cache_request.call(this, cacheRequest)
    end
    def create_true_condition(this : IUIAutomation2*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_true_condition.call(this, newCondition)
    end
    def create_false_condition(this : IUIAutomation2*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_false_condition.call(this, newCondition)
    end
    def create_property_condition(this : IUIAutomation2*, propertyId : Int32, value : Win32cr::System::Com::VARIANT, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_condition.call(this, propertyId, value, newCondition)
    end
    def create_property_condition_ex(this : IUIAutomation2*, propertyId : Int32, value : Win32cr::System::Com::VARIANT, flags : Win32cr::UI::Accessibility::PropertyConditionFlags, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_condition_ex.call(this, propertyId, value, flags, newCondition)
    end
    def create_and_condition(this : IUIAutomation2*, condition1 : Void*, condition2 : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition.call(this, condition1, condition2, newCondition)
    end
    def create_and_condition_from_array(this : IUIAutomation2*, conditions : Win32cr::System::Com::SAFEARRAY*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition_from_array.call(this, conditions, newCondition)
    end
    def create_and_condition_from_native_array(this : IUIAutomation2*, conditions : Void**, conditionCount : Int32, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition_from_native_array.call(this, conditions, conditionCount, newCondition)
    end
    def create_or_condition(this : IUIAutomation2*, condition1 : Void*, condition2 : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition.call(this, condition1, condition2, newCondition)
    end
    def create_or_condition_from_array(this : IUIAutomation2*, conditions : Win32cr::System::Com::SAFEARRAY*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition_from_array.call(this, conditions, newCondition)
    end
    def create_or_condition_from_native_array(this : IUIAutomation2*, conditions : Void**, conditionCount : Int32, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition_from_native_array.call(this, conditions, conditionCount, newCondition)
    end
    def create_not_condition(this : IUIAutomation2*, condition : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_not_condition.call(this, condition, newCondition)
    end
    def add_automation_event_handler(this : IUIAutomation2*, eventId : Int32, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_automation_event_handler.call(this, eventId, element, scope, cacheRequest, handler)
    end
    def remove_automation_event_handler(this : IUIAutomation2*, eventId : Int32, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_automation_event_handler.call(this, eventId, element, handler)
    end
    def add_property_changed_event_handler_native_array(this : IUIAutomation2*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*, propertyArray : Int32*, propertyCount : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_changed_event_handler_native_array.call(this, element, scope, cacheRequest, handler, propertyArray, propertyCount)
    end
    def add_property_changed_event_handler(this : IUIAutomation2*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*, propertyArray : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_changed_event_handler.call(this, element, scope, cacheRequest, handler, propertyArray)
    end
    def remove_property_changed_event_handler(this : IUIAutomation2*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_property_changed_event_handler.call(this, element, handler)
    end
    def add_structure_changed_event_handler(this : IUIAutomation2*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_structure_changed_event_handler.call(this, element, scope, cacheRequest, handler)
    end
    def remove_structure_changed_event_handler(this : IUIAutomation2*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_structure_changed_event_handler.call(this, element, handler)
    end
    def add_focus_changed_event_handler(this : IUIAutomation2*, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_focus_changed_event_handler.call(this, cacheRequest, handler)
    end
    def remove_focus_changed_event_handler(this : IUIAutomation2*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_focus_changed_event_handler.call(this, handler)
    end
    def remove_all_event_handlers(this : IUIAutomation2*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_event_handlers.call(this)
    end
    def int_native_array_to_safe_array(this : IUIAutomation2*, array : Int32*, arrayCount : Int32, safeArray : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.int_native_array_to_safe_array.call(this, array, arrayCount, safeArray)
    end
    def int_safe_array_to_native_array(this : IUIAutomation2*, intArray : Win32cr::System::Com::SAFEARRAY*, array : Int32**, arrayCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.int_safe_array_to_native_array.call(this, intArray, array, arrayCount)
    end
    def rect_to_variant(this : IUIAutomation2*, rc : Win32cr::Foundation::RECT, var : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rect_to_variant.call(this, rc, var)
    end
    def variant_to_rect(this : IUIAutomation2*, var : Win32cr::System::Com::VARIANT, rc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.variant_to_rect.call(this, var, rc)
    end
    def safe_array_to_rect_native_array(this : IUIAutomation2*, rects : Win32cr::System::Com::SAFEARRAY*, rectArray : Win32cr::Foundation::RECT**, rectArrayCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.safe_array_to_rect_native_array.call(this, rects, rectArray, rectArrayCount)
    end
    def create_proxy_factory_entry(this : IUIAutomation2*, factory : Void*, factoryEntry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_proxy_factory_entry.call(this, factory, factoryEntry)
    end
    def get_ProxyFactoryMapping(this : IUIAutomation2*, factoryMapping : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProxyFactoryMapping.call(this, factoryMapping)
    end
    def get_property_programmatic_name(this : IUIAutomation2*, property : Int32, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_programmatic_name.call(this, property, name)
    end
    def get_pattern_programmatic_name(this : IUIAutomation2*, pattern : Int32, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pattern_programmatic_name.call(this, pattern, name)
    end
    def poll_for_potential_supported_patterns(this : IUIAutomation2*, pElement : Void*, patternIds : Win32cr::System::Com::SAFEARRAY**, patternNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.poll_for_potential_supported_patterns.call(this, pElement, patternIds, patternNames)
    end
    def poll_for_potential_supported_properties(this : IUIAutomation2*, pElement : Void*, propertyIds : Win32cr::System::Com::SAFEARRAY**, propertyNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.poll_for_potential_supported_properties.call(this, pElement, propertyIds, propertyNames)
    end
    def check_not_supported(this : IUIAutomation2*, value : Win32cr::System::Com::VARIANT, isNotSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_not_supported.call(this, value, isNotSupported)
    end
    def get_ReservedNotSupportedValue(this : IUIAutomation2*, notSupportedValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReservedNotSupportedValue.call(this, notSupportedValue)
    end
    def get_ReservedMixedAttributeValue(this : IUIAutomation2*, mixedAttributeValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReservedMixedAttributeValue.call(this, mixedAttributeValue)
    end
    def element_from_i_accessible(this : IUIAutomation2*, accessible : Void*, childId : Int32, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_i_accessible.call(this, accessible, childId, element)
    end
    def element_from_i_accessible_build_cache(this : IUIAutomation2*, accessible : Void*, childId : Int32, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_i_accessible_build_cache.call(this, accessible, childId, cacheRequest, element)
    end
    def get_AutoSetFocus(this : IUIAutomation2*, autoSetFocus : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSetFocus.call(this, autoSetFocus)
    end
    def put_AutoSetFocus(this : IUIAutomation2*, autoSetFocus : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AutoSetFocus.call(this, autoSetFocus)
    end
    def get_ConnectionTimeout(this : IUIAutomation2*, timeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectionTimeout.call(this, timeout)
    end
    def put_ConnectionTimeout(this : IUIAutomation2*, timeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ConnectionTimeout.call(this, timeout)
    end
    def get_TransactionTimeout(this : IUIAutomation2*, timeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionTimeout.call(this, timeout)
    end
    def put_TransactionTimeout(this : IUIAutomation2*, timeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TransactionTimeout.call(this, timeout)
    end

  end

  @[Extern]
  record IUIAutomation3Vtbl,
    query_interface : Proc(IUIAutomation3*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomation3*, UInt32),
    release : Proc(IUIAutomation3*, UInt32),
    compare_elements : Proc(IUIAutomation3*, Void*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    compare_runtime_ids : Proc(IUIAutomation3*, Win32cr::System::Com::SAFEARRAY*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_root_element : Proc(IUIAutomation3*, Void**, Win32cr::Foundation::HRESULT),
    element_from_handle : Proc(IUIAutomation3*, Win32cr::Foundation::HWND, Void**, Win32cr::Foundation::HRESULT),
    element_from_point : Proc(IUIAutomation3*, Win32cr::Foundation::POINT, Void**, Win32cr::Foundation::HRESULT),
    get_focused_element : Proc(IUIAutomation3*, Void**, Win32cr::Foundation::HRESULT),
    get_root_element_build_cache : Proc(IUIAutomation3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    element_from_handle_build_cache : Proc(IUIAutomation3*, Win32cr::Foundation::HWND, Void*, Void**, Win32cr::Foundation::HRESULT),
    element_from_point_build_cache : Proc(IUIAutomation3*, Win32cr::Foundation::POINT, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_focused_element_build_cache : Proc(IUIAutomation3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_tree_walker : Proc(IUIAutomation3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_ControlViewWalker : Proc(IUIAutomation3*, Void**, Win32cr::Foundation::HRESULT),
    get_ContentViewWalker : Proc(IUIAutomation3*, Void**, Win32cr::Foundation::HRESULT),
    get_RawViewWalker : Proc(IUIAutomation3*, Void**, Win32cr::Foundation::HRESULT),
    get_RawViewCondition : Proc(IUIAutomation3*, Void**, Win32cr::Foundation::HRESULT),
    get_ControlViewCondition : Proc(IUIAutomation3*, Void**, Win32cr::Foundation::HRESULT),
    get_ContentViewCondition : Proc(IUIAutomation3*, Void**, Win32cr::Foundation::HRESULT),
    create_cache_request : Proc(IUIAutomation3*, Void**, Win32cr::Foundation::HRESULT),
    create_true_condition : Proc(IUIAutomation3*, Void**, Win32cr::Foundation::HRESULT),
    create_false_condition : Proc(IUIAutomation3*, Void**, Win32cr::Foundation::HRESULT),
    create_property_condition : Proc(IUIAutomation3*, Int32, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_property_condition_ex : Proc(IUIAutomation3*, Int32, Win32cr::System::Com::VARIANT, Win32cr::UI::Accessibility::PropertyConditionFlags, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition : Proc(IUIAutomation3*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition_from_array : Proc(IUIAutomation3*, Win32cr::System::Com::SAFEARRAY*, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition_from_native_array : Proc(IUIAutomation3*, Void**, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition : Proc(IUIAutomation3*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition_from_array : Proc(IUIAutomation3*, Win32cr::System::Com::SAFEARRAY*, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition_from_native_array : Proc(IUIAutomation3*, Void**, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_not_condition : Proc(IUIAutomation3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    add_automation_event_handler : Proc(IUIAutomation3*, Int32, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_automation_event_handler : Proc(IUIAutomation3*, Int32, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_property_changed_event_handler_native_array : Proc(IUIAutomation3*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Int32*, Int32, Win32cr::Foundation::HRESULT),
    add_property_changed_event_handler : Proc(IUIAutomation3*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    remove_property_changed_event_handler : Proc(IUIAutomation3*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_structure_changed_event_handler : Proc(IUIAutomation3*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_structure_changed_event_handler : Proc(IUIAutomation3*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_focus_changed_event_handler : Proc(IUIAutomation3*, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_focus_changed_event_handler : Proc(IUIAutomation3*, Void*, Win32cr::Foundation::HRESULT),
    remove_all_event_handlers : Proc(IUIAutomation3*, Win32cr::Foundation::HRESULT),
    int_native_array_to_safe_array : Proc(IUIAutomation3*, Int32*, Int32, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    int_safe_array_to_native_array : Proc(IUIAutomation3*, Win32cr::System::Com::SAFEARRAY*, Int32**, Int32*, Win32cr::Foundation::HRESULT),
    rect_to_variant : Proc(IUIAutomation3*, Win32cr::Foundation::RECT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    variant_to_rect : Proc(IUIAutomation3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    safe_array_to_rect_native_array : Proc(IUIAutomation3*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::RECT**, Int32*, Win32cr::Foundation::HRESULT),
    create_proxy_factory_entry : Proc(IUIAutomation3*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_ProxyFactoryMapping : Proc(IUIAutomation3*, Void**, Win32cr::Foundation::HRESULT),
    get_property_programmatic_name : Proc(IUIAutomation3*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_pattern_programmatic_name : Proc(IUIAutomation3*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    poll_for_potential_supported_patterns : Proc(IUIAutomation3*, Void*, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    poll_for_potential_supported_properties : Proc(IUIAutomation3*, Void*, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    check_not_supported : Proc(IUIAutomation3*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_ReservedNotSupportedValue : Proc(IUIAutomation3*, Void**, Win32cr::Foundation::HRESULT),
    get_ReservedMixedAttributeValue : Proc(IUIAutomation3*, Void**, Win32cr::Foundation::HRESULT),
    element_from_i_accessible : Proc(IUIAutomation3*, Void*, Int32, Void**, Win32cr::Foundation::HRESULT),
    element_from_i_accessible_build_cache : Proc(IUIAutomation3*, Void*, Int32, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_AutoSetFocus : Proc(IUIAutomation3*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_AutoSetFocus : Proc(IUIAutomation3*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_ConnectionTimeout : Proc(IUIAutomation3*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ConnectionTimeout : Proc(IUIAutomation3*, UInt32, Win32cr::Foundation::HRESULT),
    get_TransactionTimeout : Proc(IUIAutomation3*, UInt32*, Win32cr::Foundation::HRESULT),
    put_TransactionTimeout : Proc(IUIAutomation3*, UInt32, Win32cr::Foundation::HRESULT),
    add_text_edit_text_changed_event_handler : Proc(IUIAutomation3*, Void*, Win32cr::UI::Accessibility::TreeScope, Win32cr::UI::Accessibility::TextEditChangeType, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_text_edit_text_changed_event_handler : Proc(IUIAutomation3*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomation3, lpVtbl : IUIAutomation3Vtbl* do
    GUID = LibC::GUID.new(0x73d768da_u32, 0x9b51_u16, 0x4b89_u16, StaticArray[0x93_u8, 0x6e_u8, 0xc2_u8, 0x9_u8, 0x29_u8, 0x9_u8, 0x73_u8, 0xe7_u8])
    def query_interface(this : IUIAutomation3*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomation3*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomation3*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def compare_elements(this : IUIAutomation3*, el1 : Void*, el2 : Void*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_elements.call(this, el1, el2, areSame)
    end
    def compare_runtime_ids(this : IUIAutomation3*, runtimeId1 : Win32cr::System::Com::SAFEARRAY*, runtimeId2 : Win32cr::System::Com::SAFEARRAY*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_runtime_ids.call(this, runtimeId1, runtimeId2, areSame)
    end
    def get_root_element(this : IUIAutomation3*, root : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_element.call(this, root)
    end
    def element_from_handle(this : IUIAutomation3*, hwnd : Win32cr::Foundation::HWND, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_handle.call(this, hwnd, element)
    end
    def element_from_point(this : IUIAutomation3*, pt : Win32cr::Foundation::POINT, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_point.call(this, pt, element)
    end
    def get_focused_element(this : IUIAutomation3*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focused_element.call(this, element)
    end
    def get_root_element_build_cache(this : IUIAutomation3*, cacheRequest : Void*, root : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_element_build_cache.call(this, cacheRequest, root)
    end
    def element_from_handle_build_cache(this : IUIAutomation3*, hwnd : Win32cr::Foundation::HWND, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_handle_build_cache.call(this, hwnd, cacheRequest, element)
    end
    def element_from_point_build_cache(this : IUIAutomation3*, pt : Win32cr::Foundation::POINT, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_point_build_cache.call(this, pt, cacheRequest, element)
    end
    def get_focused_element_build_cache(this : IUIAutomation3*, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focused_element_build_cache.call(this, cacheRequest, element)
    end
    def create_tree_walker(this : IUIAutomation3*, pCondition : Void*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_tree_walker.call(this, pCondition, walker)
    end
    def get_ControlViewWalker(this : IUIAutomation3*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ControlViewWalker.call(this, walker)
    end
    def get_ContentViewWalker(this : IUIAutomation3*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentViewWalker.call(this, walker)
    end
    def get_RawViewWalker(this : IUIAutomation3*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RawViewWalker.call(this, walker)
    end
    def get_RawViewCondition(this : IUIAutomation3*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RawViewCondition.call(this, condition)
    end
    def get_ControlViewCondition(this : IUIAutomation3*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ControlViewCondition.call(this, condition)
    end
    def get_ContentViewCondition(this : IUIAutomation3*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentViewCondition.call(this, condition)
    end
    def create_cache_request(this : IUIAutomation3*, cacheRequest : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_cache_request.call(this, cacheRequest)
    end
    def create_true_condition(this : IUIAutomation3*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_true_condition.call(this, newCondition)
    end
    def create_false_condition(this : IUIAutomation3*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_false_condition.call(this, newCondition)
    end
    def create_property_condition(this : IUIAutomation3*, propertyId : Int32, value : Win32cr::System::Com::VARIANT, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_condition.call(this, propertyId, value, newCondition)
    end
    def create_property_condition_ex(this : IUIAutomation3*, propertyId : Int32, value : Win32cr::System::Com::VARIANT, flags : Win32cr::UI::Accessibility::PropertyConditionFlags, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_condition_ex.call(this, propertyId, value, flags, newCondition)
    end
    def create_and_condition(this : IUIAutomation3*, condition1 : Void*, condition2 : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition.call(this, condition1, condition2, newCondition)
    end
    def create_and_condition_from_array(this : IUIAutomation3*, conditions : Win32cr::System::Com::SAFEARRAY*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition_from_array.call(this, conditions, newCondition)
    end
    def create_and_condition_from_native_array(this : IUIAutomation3*, conditions : Void**, conditionCount : Int32, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition_from_native_array.call(this, conditions, conditionCount, newCondition)
    end
    def create_or_condition(this : IUIAutomation3*, condition1 : Void*, condition2 : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition.call(this, condition1, condition2, newCondition)
    end
    def create_or_condition_from_array(this : IUIAutomation3*, conditions : Win32cr::System::Com::SAFEARRAY*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition_from_array.call(this, conditions, newCondition)
    end
    def create_or_condition_from_native_array(this : IUIAutomation3*, conditions : Void**, conditionCount : Int32, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition_from_native_array.call(this, conditions, conditionCount, newCondition)
    end
    def create_not_condition(this : IUIAutomation3*, condition : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_not_condition.call(this, condition, newCondition)
    end
    def add_automation_event_handler(this : IUIAutomation3*, eventId : Int32, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_automation_event_handler.call(this, eventId, element, scope, cacheRequest, handler)
    end
    def remove_automation_event_handler(this : IUIAutomation3*, eventId : Int32, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_automation_event_handler.call(this, eventId, element, handler)
    end
    def add_property_changed_event_handler_native_array(this : IUIAutomation3*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*, propertyArray : Int32*, propertyCount : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_changed_event_handler_native_array.call(this, element, scope, cacheRequest, handler, propertyArray, propertyCount)
    end
    def add_property_changed_event_handler(this : IUIAutomation3*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*, propertyArray : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_changed_event_handler.call(this, element, scope, cacheRequest, handler, propertyArray)
    end
    def remove_property_changed_event_handler(this : IUIAutomation3*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_property_changed_event_handler.call(this, element, handler)
    end
    def add_structure_changed_event_handler(this : IUIAutomation3*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_structure_changed_event_handler.call(this, element, scope, cacheRequest, handler)
    end
    def remove_structure_changed_event_handler(this : IUIAutomation3*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_structure_changed_event_handler.call(this, element, handler)
    end
    def add_focus_changed_event_handler(this : IUIAutomation3*, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_focus_changed_event_handler.call(this, cacheRequest, handler)
    end
    def remove_focus_changed_event_handler(this : IUIAutomation3*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_focus_changed_event_handler.call(this, handler)
    end
    def remove_all_event_handlers(this : IUIAutomation3*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_event_handlers.call(this)
    end
    def int_native_array_to_safe_array(this : IUIAutomation3*, array : Int32*, arrayCount : Int32, safeArray : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.int_native_array_to_safe_array.call(this, array, arrayCount, safeArray)
    end
    def int_safe_array_to_native_array(this : IUIAutomation3*, intArray : Win32cr::System::Com::SAFEARRAY*, array : Int32**, arrayCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.int_safe_array_to_native_array.call(this, intArray, array, arrayCount)
    end
    def rect_to_variant(this : IUIAutomation3*, rc : Win32cr::Foundation::RECT, var : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rect_to_variant.call(this, rc, var)
    end
    def variant_to_rect(this : IUIAutomation3*, var : Win32cr::System::Com::VARIANT, rc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.variant_to_rect.call(this, var, rc)
    end
    def safe_array_to_rect_native_array(this : IUIAutomation3*, rects : Win32cr::System::Com::SAFEARRAY*, rectArray : Win32cr::Foundation::RECT**, rectArrayCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.safe_array_to_rect_native_array.call(this, rects, rectArray, rectArrayCount)
    end
    def create_proxy_factory_entry(this : IUIAutomation3*, factory : Void*, factoryEntry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_proxy_factory_entry.call(this, factory, factoryEntry)
    end
    def get_ProxyFactoryMapping(this : IUIAutomation3*, factoryMapping : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProxyFactoryMapping.call(this, factoryMapping)
    end
    def get_property_programmatic_name(this : IUIAutomation3*, property : Int32, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_programmatic_name.call(this, property, name)
    end
    def get_pattern_programmatic_name(this : IUIAutomation3*, pattern : Int32, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pattern_programmatic_name.call(this, pattern, name)
    end
    def poll_for_potential_supported_patterns(this : IUIAutomation3*, pElement : Void*, patternIds : Win32cr::System::Com::SAFEARRAY**, patternNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.poll_for_potential_supported_patterns.call(this, pElement, patternIds, patternNames)
    end
    def poll_for_potential_supported_properties(this : IUIAutomation3*, pElement : Void*, propertyIds : Win32cr::System::Com::SAFEARRAY**, propertyNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.poll_for_potential_supported_properties.call(this, pElement, propertyIds, propertyNames)
    end
    def check_not_supported(this : IUIAutomation3*, value : Win32cr::System::Com::VARIANT, isNotSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_not_supported.call(this, value, isNotSupported)
    end
    def get_ReservedNotSupportedValue(this : IUIAutomation3*, notSupportedValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReservedNotSupportedValue.call(this, notSupportedValue)
    end
    def get_ReservedMixedAttributeValue(this : IUIAutomation3*, mixedAttributeValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReservedMixedAttributeValue.call(this, mixedAttributeValue)
    end
    def element_from_i_accessible(this : IUIAutomation3*, accessible : Void*, childId : Int32, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_i_accessible.call(this, accessible, childId, element)
    end
    def element_from_i_accessible_build_cache(this : IUIAutomation3*, accessible : Void*, childId : Int32, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_i_accessible_build_cache.call(this, accessible, childId, cacheRequest, element)
    end
    def get_AutoSetFocus(this : IUIAutomation3*, autoSetFocus : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSetFocus.call(this, autoSetFocus)
    end
    def put_AutoSetFocus(this : IUIAutomation3*, autoSetFocus : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AutoSetFocus.call(this, autoSetFocus)
    end
    def get_ConnectionTimeout(this : IUIAutomation3*, timeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectionTimeout.call(this, timeout)
    end
    def put_ConnectionTimeout(this : IUIAutomation3*, timeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ConnectionTimeout.call(this, timeout)
    end
    def get_TransactionTimeout(this : IUIAutomation3*, timeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionTimeout.call(this, timeout)
    end
    def put_TransactionTimeout(this : IUIAutomation3*, timeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TransactionTimeout.call(this, timeout)
    end
    def add_text_edit_text_changed_event_handler(this : IUIAutomation3*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, textEditChangeType : Win32cr::UI::Accessibility::TextEditChangeType, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_text_edit_text_changed_event_handler.call(this, element, scope, textEditChangeType, cacheRequest, handler)
    end
    def remove_text_edit_text_changed_event_handler(this : IUIAutomation3*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_text_edit_text_changed_event_handler.call(this, element, handler)
    end

  end

  @[Extern]
  record IUIAutomation4Vtbl,
    query_interface : Proc(IUIAutomation4*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomation4*, UInt32),
    release : Proc(IUIAutomation4*, UInt32),
    compare_elements : Proc(IUIAutomation4*, Void*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    compare_runtime_ids : Proc(IUIAutomation4*, Win32cr::System::Com::SAFEARRAY*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_root_element : Proc(IUIAutomation4*, Void**, Win32cr::Foundation::HRESULT),
    element_from_handle : Proc(IUIAutomation4*, Win32cr::Foundation::HWND, Void**, Win32cr::Foundation::HRESULT),
    element_from_point : Proc(IUIAutomation4*, Win32cr::Foundation::POINT, Void**, Win32cr::Foundation::HRESULT),
    get_focused_element : Proc(IUIAutomation4*, Void**, Win32cr::Foundation::HRESULT),
    get_root_element_build_cache : Proc(IUIAutomation4*, Void*, Void**, Win32cr::Foundation::HRESULT),
    element_from_handle_build_cache : Proc(IUIAutomation4*, Win32cr::Foundation::HWND, Void*, Void**, Win32cr::Foundation::HRESULT),
    element_from_point_build_cache : Proc(IUIAutomation4*, Win32cr::Foundation::POINT, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_focused_element_build_cache : Proc(IUIAutomation4*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_tree_walker : Proc(IUIAutomation4*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_ControlViewWalker : Proc(IUIAutomation4*, Void**, Win32cr::Foundation::HRESULT),
    get_ContentViewWalker : Proc(IUIAutomation4*, Void**, Win32cr::Foundation::HRESULT),
    get_RawViewWalker : Proc(IUIAutomation4*, Void**, Win32cr::Foundation::HRESULT),
    get_RawViewCondition : Proc(IUIAutomation4*, Void**, Win32cr::Foundation::HRESULT),
    get_ControlViewCondition : Proc(IUIAutomation4*, Void**, Win32cr::Foundation::HRESULT),
    get_ContentViewCondition : Proc(IUIAutomation4*, Void**, Win32cr::Foundation::HRESULT),
    create_cache_request : Proc(IUIAutomation4*, Void**, Win32cr::Foundation::HRESULT),
    create_true_condition : Proc(IUIAutomation4*, Void**, Win32cr::Foundation::HRESULT),
    create_false_condition : Proc(IUIAutomation4*, Void**, Win32cr::Foundation::HRESULT),
    create_property_condition : Proc(IUIAutomation4*, Int32, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_property_condition_ex : Proc(IUIAutomation4*, Int32, Win32cr::System::Com::VARIANT, Win32cr::UI::Accessibility::PropertyConditionFlags, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition : Proc(IUIAutomation4*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition_from_array : Proc(IUIAutomation4*, Win32cr::System::Com::SAFEARRAY*, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition_from_native_array : Proc(IUIAutomation4*, Void**, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition : Proc(IUIAutomation4*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition_from_array : Proc(IUIAutomation4*, Win32cr::System::Com::SAFEARRAY*, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition_from_native_array : Proc(IUIAutomation4*, Void**, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_not_condition : Proc(IUIAutomation4*, Void*, Void**, Win32cr::Foundation::HRESULT),
    add_automation_event_handler : Proc(IUIAutomation4*, Int32, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_automation_event_handler : Proc(IUIAutomation4*, Int32, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_property_changed_event_handler_native_array : Proc(IUIAutomation4*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Int32*, Int32, Win32cr::Foundation::HRESULT),
    add_property_changed_event_handler : Proc(IUIAutomation4*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    remove_property_changed_event_handler : Proc(IUIAutomation4*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_structure_changed_event_handler : Proc(IUIAutomation4*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_structure_changed_event_handler : Proc(IUIAutomation4*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_focus_changed_event_handler : Proc(IUIAutomation4*, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_focus_changed_event_handler : Proc(IUIAutomation4*, Void*, Win32cr::Foundation::HRESULT),
    remove_all_event_handlers : Proc(IUIAutomation4*, Win32cr::Foundation::HRESULT),
    int_native_array_to_safe_array : Proc(IUIAutomation4*, Int32*, Int32, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    int_safe_array_to_native_array : Proc(IUIAutomation4*, Win32cr::System::Com::SAFEARRAY*, Int32**, Int32*, Win32cr::Foundation::HRESULT),
    rect_to_variant : Proc(IUIAutomation4*, Win32cr::Foundation::RECT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    variant_to_rect : Proc(IUIAutomation4*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    safe_array_to_rect_native_array : Proc(IUIAutomation4*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::RECT**, Int32*, Win32cr::Foundation::HRESULT),
    create_proxy_factory_entry : Proc(IUIAutomation4*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_ProxyFactoryMapping : Proc(IUIAutomation4*, Void**, Win32cr::Foundation::HRESULT),
    get_property_programmatic_name : Proc(IUIAutomation4*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_pattern_programmatic_name : Proc(IUIAutomation4*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    poll_for_potential_supported_patterns : Proc(IUIAutomation4*, Void*, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    poll_for_potential_supported_properties : Proc(IUIAutomation4*, Void*, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    check_not_supported : Proc(IUIAutomation4*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_ReservedNotSupportedValue : Proc(IUIAutomation4*, Void**, Win32cr::Foundation::HRESULT),
    get_ReservedMixedAttributeValue : Proc(IUIAutomation4*, Void**, Win32cr::Foundation::HRESULT),
    element_from_i_accessible : Proc(IUIAutomation4*, Void*, Int32, Void**, Win32cr::Foundation::HRESULT),
    element_from_i_accessible_build_cache : Proc(IUIAutomation4*, Void*, Int32, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_AutoSetFocus : Proc(IUIAutomation4*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_AutoSetFocus : Proc(IUIAutomation4*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_ConnectionTimeout : Proc(IUIAutomation4*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ConnectionTimeout : Proc(IUIAutomation4*, UInt32, Win32cr::Foundation::HRESULT),
    get_TransactionTimeout : Proc(IUIAutomation4*, UInt32*, Win32cr::Foundation::HRESULT),
    put_TransactionTimeout : Proc(IUIAutomation4*, UInt32, Win32cr::Foundation::HRESULT),
    add_text_edit_text_changed_event_handler : Proc(IUIAutomation4*, Void*, Win32cr::UI::Accessibility::TreeScope, Win32cr::UI::Accessibility::TextEditChangeType, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_text_edit_text_changed_event_handler : Proc(IUIAutomation4*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_changes_event_handler : Proc(IUIAutomation4*, Void*, Win32cr::UI::Accessibility::TreeScope, Int32*, Int32, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_changes_event_handler : Proc(IUIAutomation4*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomation4, lpVtbl : IUIAutomation4Vtbl* do
    GUID = LibC::GUID.new(0x1189c02a_u32, 0x5f8_u16, 0x4319_u16, StaticArray[0x8e_u8, 0x21_u8, 0xe8_u8, 0x17_u8, 0xe3_u8, 0xdb_u8, 0x28_u8, 0x60_u8])
    def query_interface(this : IUIAutomation4*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomation4*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomation4*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def compare_elements(this : IUIAutomation4*, el1 : Void*, el2 : Void*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_elements.call(this, el1, el2, areSame)
    end
    def compare_runtime_ids(this : IUIAutomation4*, runtimeId1 : Win32cr::System::Com::SAFEARRAY*, runtimeId2 : Win32cr::System::Com::SAFEARRAY*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_runtime_ids.call(this, runtimeId1, runtimeId2, areSame)
    end
    def get_root_element(this : IUIAutomation4*, root : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_element.call(this, root)
    end
    def element_from_handle(this : IUIAutomation4*, hwnd : Win32cr::Foundation::HWND, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_handle.call(this, hwnd, element)
    end
    def element_from_point(this : IUIAutomation4*, pt : Win32cr::Foundation::POINT, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_point.call(this, pt, element)
    end
    def get_focused_element(this : IUIAutomation4*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focused_element.call(this, element)
    end
    def get_root_element_build_cache(this : IUIAutomation4*, cacheRequest : Void*, root : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_element_build_cache.call(this, cacheRequest, root)
    end
    def element_from_handle_build_cache(this : IUIAutomation4*, hwnd : Win32cr::Foundation::HWND, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_handle_build_cache.call(this, hwnd, cacheRequest, element)
    end
    def element_from_point_build_cache(this : IUIAutomation4*, pt : Win32cr::Foundation::POINT, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_point_build_cache.call(this, pt, cacheRequest, element)
    end
    def get_focused_element_build_cache(this : IUIAutomation4*, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focused_element_build_cache.call(this, cacheRequest, element)
    end
    def create_tree_walker(this : IUIAutomation4*, pCondition : Void*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_tree_walker.call(this, pCondition, walker)
    end
    def get_ControlViewWalker(this : IUIAutomation4*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ControlViewWalker.call(this, walker)
    end
    def get_ContentViewWalker(this : IUIAutomation4*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentViewWalker.call(this, walker)
    end
    def get_RawViewWalker(this : IUIAutomation4*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RawViewWalker.call(this, walker)
    end
    def get_RawViewCondition(this : IUIAutomation4*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RawViewCondition.call(this, condition)
    end
    def get_ControlViewCondition(this : IUIAutomation4*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ControlViewCondition.call(this, condition)
    end
    def get_ContentViewCondition(this : IUIAutomation4*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentViewCondition.call(this, condition)
    end
    def create_cache_request(this : IUIAutomation4*, cacheRequest : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_cache_request.call(this, cacheRequest)
    end
    def create_true_condition(this : IUIAutomation4*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_true_condition.call(this, newCondition)
    end
    def create_false_condition(this : IUIAutomation4*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_false_condition.call(this, newCondition)
    end
    def create_property_condition(this : IUIAutomation4*, propertyId : Int32, value : Win32cr::System::Com::VARIANT, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_condition.call(this, propertyId, value, newCondition)
    end
    def create_property_condition_ex(this : IUIAutomation4*, propertyId : Int32, value : Win32cr::System::Com::VARIANT, flags : Win32cr::UI::Accessibility::PropertyConditionFlags, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_condition_ex.call(this, propertyId, value, flags, newCondition)
    end
    def create_and_condition(this : IUIAutomation4*, condition1 : Void*, condition2 : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition.call(this, condition1, condition2, newCondition)
    end
    def create_and_condition_from_array(this : IUIAutomation4*, conditions : Win32cr::System::Com::SAFEARRAY*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition_from_array.call(this, conditions, newCondition)
    end
    def create_and_condition_from_native_array(this : IUIAutomation4*, conditions : Void**, conditionCount : Int32, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition_from_native_array.call(this, conditions, conditionCount, newCondition)
    end
    def create_or_condition(this : IUIAutomation4*, condition1 : Void*, condition2 : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition.call(this, condition1, condition2, newCondition)
    end
    def create_or_condition_from_array(this : IUIAutomation4*, conditions : Win32cr::System::Com::SAFEARRAY*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition_from_array.call(this, conditions, newCondition)
    end
    def create_or_condition_from_native_array(this : IUIAutomation4*, conditions : Void**, conditionCount : Int32, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition_from_native_array.call(this, conditions, conditionCount, newCondition)
    end
    def create_not_condition(this : IUIAutomation4*, condition : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_not_condition.call(this, condition, newCondition)
    end
    def add_automation_event_handler(this : IUIAutomation4*, eventId : Int32, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_automation_event_handler.call(this, eventId, element, scope, cacheRequest, handler)
    end
    def remove_automation_event_handler(this : IUIAutomation4*, eventId : Int32, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_automation_event_handler.call(this, eventId, element, handler)
    end
    def add_property_changed_event_handler_native_array(this : IUIAutomation4*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*, propertyArray : Int32*, propertyCount : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_changed_event_handler_native_array.call(this, element, scope, cacheRequest, handler, propertyArray, propertyCount)
    end
    def add_property_changed_event_handler(this : IUIAutomation4*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*, propertyArray : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_changed_event_handler.call(this, element, scope, cacheRequest, handler, propertyArray)
    end
    def remove_property_changed_event_handler(this : IUIAutomation4*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_property_changed_event_handler.call(this, element, handler)
    end
    def add_structure_changed_event_handler(this : IUIAutomation4*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_structure_changed_event_handler.call(this, element, scope, cacheRequest, handler)
    end
    def remove_structure_changed_event_handler(this : IUIAutomation4*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_structure_changed_event_handler.call(this, element, handler)
    end
    def add_focus_changed_event_handler(this : IUIAutomation4*, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_focus_changed_event_handler.call(this, cacheRequest, handler)
    end
    def remove_focus_changed_event_handler(this : IUIAutomation4*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_focus_changed_event_handler.call(this, handler)
    end
    def remove_all_event_handlers(this : IUIAutomation4*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_event_handlers.call(this)
    end
    def int_native_array_to_safe_array(this : IUIAutomation4*, array : Int32*, arrayCount : Int32, safeArray : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.int_native_array_to_safe_array.call(this, array, arrayCount, safeArray)
    end
    def int_safe_array_to_native_array(this : IUIAutomation4*, intArray : Win32cr::System::Com::SAFEARRAY*, array : Int32**, arrayCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.int_safe_array_to_native_array.call(this, intArray, array, arrayCount)
    end
    def rect_to_variant(this : IUIAutomation4*, rc : Win32cr::Foundation::RECT, var : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rect_to_variant.call(this, rc, var)
    end
    def variant_to_rect(this : IUIAutomation4*, var : Win32cr::System::Com::VARIANT, rc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.variant_to_rect.call(this, var, rc)
    end
    def safe_array_to_rect_native_array(this : IUIAutomation4*, rects : Win32cr::System::Com::SAFEARRAY*, rectArray : Win32cr::Foundation::RECT**, rectArrayCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.safe_array_to_rect_native_array.call(this, rects, rectArray, rectArrayCount)
    end
    def create_proxy_factory_entry(this : IUIAutomation4*, factory : Void*, factoryEntry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_proxy_factory_entry.call(this, factory, factoryEntry)
    end
    def get_ProxyFactoryMapping(this : IUIAutomation4*, factoryMapping : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProxyFactoryMapping.call(this, factoryMapping)
    end
    def get_property_programmatic_name(this : IUIAutomation4*, property : Int32, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_programmatic_name.call(this, property, name)
    end
    def get_pattern_programmatic_name(this : IUIAutomation4*, pattern : Int32, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pattern_programmatic_name.call(this, pattern, name)
    end
    def poll_for_potential_supported_patterns(this : IUIAutomation4*, pElement : Void*, patternIds : Win32cr::System::Com::SAFEARRAY**, patternNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.poll_for_potential_supported_patterns.call(this, pElement, patternIds, patternNames)
    end
    def poll_for_potential_supported_properties(this : IUIAutomation4*, pElement : Void*, propertyIds : Win32cr::System::Com::SAFEARRAY**, propertyNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.poll_for_potential_supported_properties.call(this, pElement, propertyIds, propertyNames)
    end
    def check_not_supported(this : IUIAutomation4*, value : Win32cr::System::Com::VARIANT, isNotSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_not_supported.call(this, value, isNotSupported)
    end
    def get_ReservedNotSupportedValue(this : IUIAutomation4*, notSupportedValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReservedNotSupportedValue.call(this, notSupportedValue)
    end
    def get_ReservedMixedAttributeValue(this : IUIAutomation4*, mixedAttributeValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReservedMixedAttributeValue.call(this, mixedAttributeValue)
    end
    def element_from_i_accessible(this : IUIAutomation4*, accessible : Void*, childId : Int32, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_i_accessible.call(this, accessible, childId, element)
    end
    def element_from_i_accessible_build_cache(this : IUIAutomation4*, accessible : Void*, childId : Int32, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_i_accessible_build_cache.call(this, accessible, childId, cacheRequest, element)
    end
    def get_AutoSetFocus(this : IUIAutomation4*, autoSetFocus : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSetFocus.call(this, autoSetFocus)
    end
    def put_AutoSetFocus(this : IUIAutomation4*, autoSetFocus : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AutoSetFocus.call(this, autoSetFocus)
    end
    def get_ConnectionTimeout(this : IUIAutomation4*, timeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectionTimeout.call(this, timeout)
    end
    def put_ConnectionTimeout(this : IUIAutomation4*, timeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ConnectionTimeout.call(this, timeout)
    end
    def get_TransactionTimeout(this : IUIAutomation4*, timeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionTimeout.call(this, timeout)
    end
    def put_TransactionTimeout(this : IUIAutomation4*, timeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TransactionTimeout.call(this, timeout)
    end
    def add_text_edit_text_changed_event_handler(this : IUIAutomation4*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, textEditChangeType : Win32cr::UI::Accessibility::TextEditChangeType, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_text_edit_text_changed_event_handler.call(this, element, scope, textEditChangeType, cacheRequest, handler)
    end
    def remove_text_edit_text_changed_event_handler(this : IUIAutomation4*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_text_edit_text_changed_event_handler.call(this, element, handler)
    end
    def add_changes_event_handler(this : IUIAutomation4*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, changeTypes : Int32*, changesCount : Int32, pCacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_changes_event_handler.call(this, element, scope, changeTypes, changesCount, pCacheRequest, handler)
    end
    def remove_changes_event_handler(this : IUIAutomation4*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_changes_event_handler.call(this, element, handler)
    end

  end

  @[Extern]
  record IUIAutomation5Vtbl,
    query_interface : Proc(IUIAutomation5*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomation5*, UInt32),
    release : Proc(IUIAutomation5*, UInt32),
    compare_elements : Proc(IUIAutomation5*, Void*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    compare_runtime_ids : Proc(IUIAutomation5*, Win32cr::System::Com::SAFEARRAY*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_root_element : Proc(IUIAutomation5*, Void**, Win32cr::Foundation::HRESULT),
    element_from_handle : Proc(IUIAutomation5*, Win32cr::Foundation::HWND, Void**, Win32cr::Foundation::HRESULT),
    element_from_point : Proc(IUIAutomation5*, Win32cr::Foundation::POINT, Void**, Win32cr::Foundation::HRESULT),
    get_focused_element : Proc(IUIAutomation5*, Void**, Win32cr::Foundation::HRESULT),
    get_root_element_build_cache : Proc(IUIAutomation5*, Void*, Void**, Win32cr::Foundation::HRESULT),
    element_from_handle_build_cache : Proc(IUIAutomation5*, Win32cr::Foundation::HWND, Void*, Void**, Win32cr::Foundation::HRESULT),
    element_from_point_build_cache : Proc(IUIAutomation5*, Win32cr::Foundation::POINT, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_focused_element_build_cache : Proc(IUIAutomation5*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_tree_walker : Proc(IUIAutomation5*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_ControlViewWalker : Proc(IUIAutomation5*, Void**, Win32cr::Foundation::HRESULT),
    get_ContentViewWalker : Proc(IUIAutomation5*, Void**, Win32cr::Foundation::HRESULT),
    get_RawViewWalker : Proc(IUIAutomation5*, Void**, Win32cr::Foundation::HRESULT),
    get_RawViewCondition : Proc(IUIAutomation5*, Void**, Win32cr::Foundation::HRESULT),
    get_ControlViewCondition : Proc(IUIAutomation5*, Void**, Win32cr::Foundation::HRESULT),
    get_ContentViewCondition : Proc(IUIAutomation5*, Void**, Win32cr::Foundation::HRESULT),
    create_cache_request : Proc(IUIAutomation5*, Void**, Win32cr::Foundation::HRESULT),
    create_true_condition : Proc(IUIAutomation5*, Void**, Win32cr::Foundation::HRESULT),
    create_false_condition : Proc(IUIAutomation5*, Void**, Win32cr::Foundation::HRESULT),
    create_property_condition : Proc(IUIAutomation5*, Int32, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_property_condition_ex : Proc(IUIAutomation5*, Int32, Win32cr::System::Com::VARIANT, Win32cr::UI::Accessibility::PropertyConditionFlags, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition : Proc(IUIAutomation5*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition_from_array : Proc(IUIAutomation5*, Win32cr::System::Com::SAFEARRAY*, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition_from_native_array : Proc(IUIAutomation5*, Void**, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition : Proc(IUIAutomation5*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition_from_array : Proc(IUIAutomation5*, Win32cr::System::Com::SAFEARRAY*, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition_from_native_array : Proc(IUIAutomation5*, Void**, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_not_condition : Proc(IUIAutomation5*, Void*, Void**, Win32cr::Foundation::HRESULT),
    add_automation_event_handler : Proc(IUIAutomation5*, Int32, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_automation_event_handler : Proc(IUIAutomation5*, Int32, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_property_changed_event_handler_native_array : Proc(IUIAutomation5*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Int32*, Int32, Win32cr::Foundation::HRESULT),
    add_property_changed_event_handler : Proc(IUIAutomation5*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    remove_property_changed_event_handler : Proc(IUIAutomation5*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_structure_changed_event_handler : Proc(IUIAutomation5*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_structure_changed_event_handler : Proc(IUIAutomation5*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_focus_changed_event_handler : Proc(IUIAutomation5*, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_focus_changed_event_handler : Proc(IUIAutomation5*, Void*, Win32cr::Foundation::HRESULT),
    remove_all_event_handlers : Proc(IUIAutomation5*, Win32cr::Foundation::HRESULT),
    int_native_array_to_safe_array : Proc(IUIAutomation5*, Int32*, Int32, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    int_safe_array_to_native_array : Proc(IUIAutomation5*, Win32cr::System::Com::SAFEARRAY*, Int32**, Int32*, Win32cr::Foundation::HRESULT),
    rect_to_variant : Proc(IUIAutomation5*, Win32cr::Foundation::RECT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    variant_to_rect : Proc(IUIAutomation5*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    safe_array_to_rect_native_array : Proc(IUIAutomation5*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::RECT**, Int32*, Win32cr::Foundation::HRESULT),
    create_proxy_factory_entry : Proc(IUIAutomation5*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_ProxyFactoryMapping : Proc(IUIAutomation5*, Void**, Win32cr::Foundation::HRESULT),
    get_property_programmatic_name : Proc(IUIAutomation5*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_pattern_programmatic_name : Proc(IUIAutomation5*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    poll_for_potential_supported_patterns : Proc(IUIAutomation5*, Void*, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    poll_for_potential_supported_properties : Proc(IUIAutomation5*, Void*, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    check_not_supported : Proc(IUIAutomation5*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_ReservedNotSupportedValue : Proc(IUIAutomation5*, Void**, Win32cr::Foundation::HRESULT),
    get_ReservedMixedAttributeValue : Proc(IUIAutomation5*, Void**, Win32cr::Foundation::HRESULT),
    element_from_i_accessible : Proc(IUIAutomation5*, Void*, Int32, Void**, Win32cr::Foundation::HRESULT),
    element_from_i_accessible_build_cache : Proc(IUIAutomation5*, Void*, Int32, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_AutoSetFocus : Proc(IUIAutomation5*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_AutoSetFocus : Proc(IUIAutomation5*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_ConnectionTimeout : Proc(IUIAutomation5*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ConnectionTimeout : Proc(IUIAutomation5*, UInt32, Win32cr::Foundation::HRESULT),
    get_TransactionTimeout : Proc(IUIAutomation5*, UInt32*, Win32cr::Foundation::HRESULT),
    put_TransactionTimeout : Proc(IUIAutomation5*, UInt32, Win32cr::Foundation::HRESULT),
    add_text_edit_text_changed_event_handler : Proc(IUIAutomation5*, Void*, Win32cr::UI::Accessibility::TreeScope, Win32cr::UI::Accessibility::TextEditChangeType, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_text_edit_text_changed_event_handler : Proc(IUIAutomation5*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_changes_event_handler : Proc(IUIAutomation5*, Void*, Win32cr::UI::Accessibility::TreeScope, Int32*, Int32, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_changes_event_handler : Proc(IUIAutomation5*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_notification_event_handler : Proc(IUIAutomation5*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_notification_event_handler : Proc(IUIAutomation5*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomation5, lpVtbl : IUIAutomation5Vtbl* do
    GUID = LibC::GUID.new(0x25f700c8_u32, 0xd816_u16, 0x4057_u16, StaticArray[0xa9_u8, 0xdc_u8, 0x3c_u8, 0xbd_u8, 0xee_u8, 0x77_u8, 0xe2_u8, 0x56_u8])
    def query_interface(this : IUIAutomation5*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomation5*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomation5*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def compare_elements(this : IUIAutomation5*, el1 : Void*, el2 : Void*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_elements.call(this, el1, el2, areSame)
    end
    def compare_runtime_ids(this : IUIAutomation5*, runtimeId1 : Win32cr::System::Com::SAFEARRAY*, runtimeId2 : Win32cr::System::Com::SAFEARRAY*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_runtime_ids.call(this, runtimeId1, runtimeId2, areSame)
    end
    def get_root_element(this : IUIAutomation5*, root : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_element.call(this, root)
    end
    def element_from_handle(this : IUIAutomation5*, hwnd : Win32cr::Foundation::HWND, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_handle.call(this, hwnd, element)
    end
    def element_from_point(this : IUIAutomation5*, pt : Win32cr::Foundation::POINT, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_point.call(this, pt, element)
    end
    def get_focused_element(this : IUIAutomation5*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focused_element.call(this, element)
    end
    def get_root_element_build_cache(this : IUIAutomation5*, cacheRequest : Void*, root : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_element_build_cache.call(this, cacheRequest, root)
    end
    def element_from_handle_build_cache(this : IUIAutomation5*, hwnd : Win32cr::Foundation::HWND, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_handle_build_cache.call(this, hwnd, cacheRequest, element)
    end
    def element_from_point_build_cache(this : IUIAutomation5*, pt : Win32cr::Foundation::POINT, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_point_build_cache.call(this, pt, cacheRequest, element)
    end
    def get_focused_element_build_cache(this : IUIAutomation5*, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focused_element_build_cache.call(this, cacheRequest, element)
    end
    def create_tree_walker(this : IUIAutomation5*, pCondition : Void*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_tree_walker.call(this, pCondition, walker)
    end
    def get_ControlViewWalker(this : IUIAutomation5*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ControlViewWalker.call(this, walker)
    end
    def get_ContentViewWalker(this : IUIAutomation5*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentViewWalker.call(this, walker)
    end
    def get_RawViewWalker(this : IUIAutomation5*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RawViewWalker.call(this, walker)
    end
    def get_RawViewCondition(this : IUIAutomation5*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RawViewCondition.call(this, condition)
    end
    def get_ControlViewCondition(this : IUIAutomation5*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ControlViewCondition.call(this, condition)
    end
    def get_ContentViewCondition(this : IUIAutomation5*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentViewCondition.call(this, condition)
    end
    def create_cache_request(this : IUIAutomation5*, cacheRequest : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_cache_request.call(this, cacheRequest)
    end
    def create_true_condition(this : IUIAutomation5*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_true_condition.call(this, newCondition)
    end
    def create_false_condition(this : IUIAutomation5*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_false_condition.call(this, newCondition)
    end
    def create_property_condition(this : IUIAutomation5*, propertyId : Int32, value : Win32cr::System::Com::VARIANT, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_condition.call(this, propertyId, value, newCondition)
    end
    def create_property_condition_ex(this : IUIAutomation5*, propertyId : Int32, value : Win32cr::System::Com::VARIANT, flags : Win32cr::UI::Accessibility::PropertyConditionFlags, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_condition_ex.call(this, propertyId, value, flags, newCondition)
    end
    def create_and_condition(this : IUIAutomation5*, condition1 : Void*, condition2 : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition.call(this, condition1, condition2, newCondition)
    end
    def create_and_condition_from_array(this : IUIAutomation5*, conditions : Win32cr::System::Com::SAFEARRAY*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition_from_array.call(this, conditions, newCondition)
    end
    def create_and_condition_from_native_array(this : IUIAutomation5*, conditions : Void**, conditionCount : Int32, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition_from_native_array.call(this, conditions, conditionCount, newCondition)
    end
    def create_or_condition(this : IUIAutomation5*, condition1 : Void*, condition2 : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition.call(this, condition1, condition2, newCondition)
    end
    def create_or_condition_from_array(this : IUIAutomation5*, conditions : Win32cr::System::Com::SAFEARRAY*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition_from_array.call(this, conditions, newCondition)
    end
    def create_or_condition_from_native_array(this : IUIAutomation5*, conditions : Void**, conditionCount : Int32, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition_from_native_array.call(this, conditions, conditionCount, newCondition)
    end
    def create_not_condition(this : IUIAutomation5*, condition : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_not_condition.call(this, condition, newCondition)
    end
    def add_automation_event_handler(this : IUIAutomation5*, eventId : Int32, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_automation_event_handler.call(this, eventId, element, scope, cacheRequest, handler)
    end
    def remove_automation_event_handler(this : IUIAutomation5*, eventId : Int32, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_automation_event_handler.call(this, eventId, element, handler)
    end
    def add_property_changed_event_handler_native_array(this : IUIAutomation5*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*, propertyArray : Int32*, propertyCount : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_changed_event_handler_native_array.call(this, element, scope, cacheRequest, handler, propertyArray, propertyCount)
    end
    def add_property_changed_event_handler(this : IUIAutomation5*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*, propertyArray : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_changed_event_handler.call(this, element, scope, cacheRequest, handler, propertyArray)
    end
    def remove_property_changed_event_handler(this : IUIAutomation5*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_property_changed_event_handler.call(this, element, handler)
    end
    def add_structure_changed_event_handler(this : IUIAutomation5*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_structure_changed_event_handler.call(this, element, scope, cacheRequest, handler)
    end
    def remove_structure_changed_event_handler(this : IUIAutomation5*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_structure_changed_event_handler.call(this, element, handler)
    end
    def add_focus_changed_event_handler(this : IUIAutomation5*, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_focus_changed_event_handler.call(this, cacheRequest, handler)
    end
    def remove_focus_changed_event_handler(this : IUIAutomation5*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_focus_changed_event_handler.call(this, handler)
    end
    def remove_all_event_handlers(this : IUIAutomation5*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_event_handlers.call(this)
    end
    def int_native_array_to_safe_array(this : IUIAutomation5*, array : Int32*, arrayCount : Int32, safeArray : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.int_native_array_to_safe_array.call(this, array, arrayCount, safeArray)
    end
    def int_safe_array_to_native_array(this : IUIAutomation5*, intArray : Win32cr::System::Com::SAFEARRAY*, array : Int32**, arrayCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.int_safe_array_to_native_array.call(this, intArray, array, arrayCount)
    end
    def rect_to_variant(this : IUIAutomation5*, rc : Win32cr::Foundation::RECT, var : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rect_to_variant.call(this, rc, var)
    end
    def variant_to_rect(this : IUIAutomation5*, var : Win32cr::System::Com::VARIANT, rc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.variant_to_rect.call(this, var, rc)
    end
    def safe_array_to_rect_native_array(this : IUIAutomation5*, rects : Win32cr::System::Com::SAFEARRAY*, rectArray : Win32cr::Foundation::RECT**, rectArrayCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.safe_array_to_rect_native_array.call(this, rects, rectArray, rectArrayCount)
    end
    def create_proxy_factory_entry(this : IUIAutomation5*, factory : Void*, factoryEntry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_proxy_factory_entry.call(this, factory, factoryEntry)
    end
    def get_ProxyFactoryMapping(this : IUIAutomation5*, factoryMapping : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProxyFactoryMapping.call(this, factoryMapping)
    end
    def get_property_programmatic_name(this : IUIAutomation5*, property : Int32, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_programmatic_name.call(this, property, name)
    end
    def get_pattern_programmatic_name(this : IUIAutomation5*, pattern : Int32, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pattern_programmatic_name.call(this, pattern, name)
    end
    def poll_for_potential_supported_patterns(this : IUIAutomation5*, pElement : Void*, patternIds : Win32cr::System::Com::SAFEARRAY**, patternNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.poll_for_potential_supported_patterns.call(this, pElement, patternIds, patternNames)
    end
    def poll_for_potential_supported_properties(this : IUIAutomation5*, pElement : Void*, propertyIds : Win32cr::System::Com::SAFEARRAY**, propertyNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.poll_for_potential_supported_properties.call(this, pElement, propertyIds, propertyNames)
    end
    def check_not_supported(this : IUIAutomation5*, value : Win32cr::System::Com::VARIANT, isNotSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_not_supported.call(this, value, isNotSupported)
    end
    def get_ReservedNotSupportedValue(this : IUIAutomation5*, notSupportedValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReservedNotSupportedValue.call(this, notSupportedValue)
    end
    def get_ReservedMixedAttributeValue(this : IUIAutomation5*, mixedAttributeValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReservedMixedAttributeValue.call(this, mixedAttributeValue)
    end
    def element_from_i_accessible(this : IUIAutomation5*, accessible : Void*, childId : Int32, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_i_accessible.call(this, accessible, childId, element)
    end
    def element_from_i_accessible_build_cache(this : IUIAutomation5*, accessible : Void*, childId : Int32, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_i_accessible_build_cache.call(this, accessible, childId, cacheRequest, element)
    end
    def get_AutoSetFocus(this : IUIAutomation5*, autoSetFocus : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSetFocus.call(this, autoSetFocus)
    end
    def put_AutoSetFocus(this : IUIAutomation5*, autoSetFocus : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AutoSetFocus.call(this, autoSetFocus)
    end
    def get_ConnectionTimeout(this : IUIAutomation5*, timeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectionTimeout.call(this, timeout)
    end
    def put_ConnectionTimeout(this : IUIAutomation5*, timeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ConnectionTimeout.call(this, timeout)
    end
    def get_TransactionTimeout(this : IUIAutomation5*, timeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionTimeout.call(this, timeout)
    end
    def put_TransactionTimeout(this : IUIAutomation5*, timeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TransactionTimeout.call(this, timeout)
    end
    def add_text_edit_text_changed_event_handler(this : IUIAutomation5*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, textEditChangeType : Win32cr::UI::Accessibility::TextEditChangeType, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_text_edit_text_changed_event_handler.call(this, element, scope, textEditChangeType, cacheRequest, handler)
    end
    def remove_text_edit_text_changed_event_handler(this : IUIAutomation5*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_text_edit_text_changed_event_handler.call(this, element, handler)
    end
    def add_changes_event_handler(this : IUIAutomation5*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, changeTypes : Int32*, changesCount : Int32, pCacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_changes_event_handler.call(this, element, scope, changeTypes, changesCount, pCacheRequest, handler)
    end
    def remove_changes_event_handler(this : IUIAutomation5*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_changes_event_handler.call(this, element, handler)
    end
    def add_notification_event_handler(this : IUIAutomation5*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_notification_event_handler.call(this, element, scope, cacheRequest, handler)
    end
    def remove_notification_event_handler(this : IUIAutomation5*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_notification_event_handler.call(this, element, handler)
    end

  end

  @[Extern]
  record IUIAutomation6Vtbl,
    query_interface : Proc(IUIAutomation6*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IUIAutomation6*, UInt32),
    release : Proc(IUIAutomation6*, UInt32),
    compare_elements : Proc(IUIAutomation6*, Void*, Void*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    compare_runtime_ids : Proc(IUIAutomation6*, Win32cr::System::Com::SAFEARRAY*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_root_element : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    element_from_handle : Proc(IUIAutomation6*, Win32cr::Foundation::HWND, Void**, Win32cr::Foundation::HRESULT),
    element_from_point : Proc(IUIAutomation6*, Win32cr::Foundation::POINT, Void**, Win32cr::Foundation::HRESULT),
    get_focused_element : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    get_root_element_build_cache : Proc(IUIAutomation6*, Void*, Void**, Win32cr::Foundation::HRESULT),
    element_from_handle_build_cache : Proc(IUIAutomation6*, Win32cr::Foundation::HWND, Void*, Void**, Win32cr::Foundation::HRESULT),
    element_from_point_build_cache : Proc(IUIAutomation6*, Win32cr::Foundation::POINT, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_focused_element_build_cache : Proc(IUIAutomation6*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_tree_walker : Proc(IUIAutomation6*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_ControlViewWalker : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    get_ContentViewWalker : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    get_RawViewWalker : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    get_RawViewCondition : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    get_ControlViewCondition : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    get_ContentViewCondition : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    create_cache_request : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    create_true_condition : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    create_false_condition : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    create_property_condition : Proc(IUIAutomation6*, Int32, Win32cr::System::Com::VARIANT, Void**, Win32cr::Foundation::HRESULT),
    create_property_condition_ex : Proc(IUIAutomation6*, Int32, Win32cr::System::Com::VARIANT, Win32cr::UI::Accessibility::PropertyConditionFlags, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition : Proc(IUIAutomation6*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition_from_array : Proc(IUIAutomation6*, Win32cr::System::Com::SAFEARRAY*, Void**, Win32cr::Foundation::HRESULT),
    create_and_condition_from_native_array : Proc(IUIAutomation6*, Void**, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition : Proc(IUIAutomation6*, Void*, Void*, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition_from_array : Proc(IUIAutomation6*, Win32cr::System::Com::SAFEARRAY*, Void**, Win32cr::Foundation::HRESULT),
    create_or_condition_from_native_array : Proc(IUIAutomation6*, Void**, Int32, Void**, Win32cr::Foundation::HRESULT),
    create_not_condition : Proc(IUIAutomation6*, Void*, Void**, Win32cr::Foundation::HRESULT),
    add_automation_event_handler : Proc(IUIAutomation6*, Int32, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_automation_event_handler : Proc(IUIAutomation6*, Int32, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_property_changed_event_handler_native_array : Proc(IUIAutomation6*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Int32*, Int32, Win32cr::Foundation::HRESULT),
    add_property_changed_event_handler : Proc(IUIAutomation6*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::HRESULT),
    remove_property_changed_event_handler : Proc(IUIAutomation6*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_structure_changed_event_handler : Proc(IUIAutomation6*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_structure_changed_event_handler : Proc(IUIAutomation6*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_focus_changed_event_handler : Proc(IUIAutomation6*, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_focus_changed_event_handler : Proc(IUIAutomation6*, Void*, Win32cr::Foundation::HRESULT),
    remove_all_event_handlers : Proc(IUIAutomation6*, Win32cr::Foundation::HRESULT),
    int_native_array_to_safe_array : Proc(IUIAutomation6*, Int32*, Int32, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    int_safe_array_to_native_array : Proc(IUIAutomation6*, Win32cr::System::Com::SAFEARRAY*, Int32**, Int32*, Win32cr::Foundation::HRESULT),
    rect_to_variant : Proc(IUIAutomation6*, Win32cr::Foundation::RECT, Win32cr::System::Com::VARIANT*, Win32cr::Foundation::HRESULT),
    variant_to_rect : Proc(IUIAutomation6*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::RECT*, Win32cr::Foundation::HRESULT),
    safe_array_to_rect_native_array : Proc(IUIAutomation6*, Win32cr::System::Com::SAFEARRAY*, Win32cr::Foundation::RECT**, Int32*, Win32cr::Foundation::HRESULT),
    create_proxy_factory_entry : Proc(IUIAutomation6*, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_ProxyFactoryMapping : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    get_property_programmatic_name : Proc(IUIAutomation6*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    get_pattern_programmatic_name : Proc(IUIAutomation6*, Int32, Win32cr::Foundation::BSTR*, Win32cr::Foundation::HRESULT),
    poll_for_potential_supported_patterns : Proc(IUIAutomation6*, Void*, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    poll_for_potential_supported_properties : Proc(IUIAutomation6*, Void*, Win32cr::System::Com::SAFEARRAY**, Win32cr::System::Com::SAFEARRAY**, Win32cr::Foundation::HRESULT),
    check_not_supported : Proc(IUIAutomation6*, Win32cr::System::Com::VARIANT, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_ReservedNotSupportedValue : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    get_ReservedMixedAttributeValue : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    element_from_i_accessible : Proc(IUIAutomation6*, Void*, Int32, Void**, Win32cr::Foundation::HRESULT),
    element_from_i_accessible_build_cache : Proc(IUIAutomation6*, Void*, Int32, Void*, Void**, Win32cr::Foundation::HRESULT),
    get_AutoSetFocus : Proc(IUIAutomation6*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_AutoSetFocus : Proc(IUIAutomation6*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_ConnectionTimeout : Proc(IUIAutomation6*, UInt32*, Win32cr::Foundation::HRESULT),
    put_ConnectionTimeout : Proc(IUIAutomation6*, UInt32, Win32cr::Foundation::HRESULT),
    get_TransactionTimeout : Proc(IUIAutomation6*, UInt32*, Win32cr::Foundation::HRESULT),
    put_TransactionTimeout : Proc(IUIAutomation6*, UInt32, Win32cr::Foundation::HRESULT),
    add_text_edit_text_changed_event_handler : Proc(IUIAutomation6*, Void*, Win32cr::UI::Accessibility::TreeScope, Win32cr::UI::Accessibility::TextEditChangeType, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_text_edit_text_changed_event_handler : Proc(IUIAutomation6*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_changes_event_handler : Proc(IUIAutomation6*, Void*, Win32cr::UI::Accessibility::TreeScope, Int32*, Int32, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_changes_event_handler : Proc(IUIAutomation6*, Void*, Void*, Win32cr::Foundation::HRESULT),
    add_notification_event_handler : Proc(IUIAutomation6*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_notification_event_handler : Proc(IUIAutomation6*, Void*, Void*, Win32cr::Foundation::HRESULT),
    create_event_handler_group : Proc(IUIAutomation6*, Void**, Win32cr::Foundation::HRESULT),
    add_event_handler_group : Proc(IUIAutomation6*, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_event_handler_group : Proc(IUIAutomation6*, Void*, Void*, Win32cr::Foundation::HRESULT),
    get_ConnectionRecoveryBehavior : Proc(IUIAutomation6*, Win32cr::UI::Accessibility::ConnectionRecoveryBehaviorOptions*, Win32cr::Foundation::HRESULT),
    put_ConnectionRecoveryBehavior : Proc(IUIAutomation6*, Win32cr::UI::Accessibility::ConnectionRecoveryBehaviorOptions, Win32cr::Foundation::HRESULT),
    get_CoalesceEvents : Proc(IUIAutomation6*, Win32cr::UI::Accessibility::CoalesceEventsOptions*, Win32cr::Foundation::HRESULT),
    put_CoalesceEvents : Proc(IUIAutomation6*, Win32cr::UI::Accessibility::CoalesceEventsOptions, Win32cr::Foundation::HRESULT),
    add_active_text_position_changed_event_handler : Proc(IUIAutomation6*, Void*, Win32cr::UI::Accessibility::TreeScope, Void*, Void*, Win32cr::Foundation::HRESULT),
    remove_active_text_position_changed_event_handler : Proc(IUIAutomation6*, Void*, Void*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IUIAutomation6, lpVtbl : IUIAutomation6Vtbl* do
    GUID = LibC::GUID.new(0xaae072da_u32, 0x29e3_u16, 0x413d_u16, StaticArray[0x87_u8, 0xa7_u8, 0x19_u8, 0x2d_u8, 0xbf_u8, 0x81_u8, 0xed_u8, 0x10_u8])
    def query_interface(this : IUIAutomation6*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IUIAutomation6*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IUIAutomation6*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def compare_elements(this : IUIAutomation6*, el1 : Void*, el2 : Void*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_elements.call(this, el1, el2, areSame)
    end
    def compare_runtime_ids(this : IUIAutomation6*, runtimeId1 : Win32cr::System::Com::SAFEARRAY*, runtimeId2 : Win32cr::System::Com::SAFEARRAY*, areSame : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.compare_runtime_ids.call(this, runtimeId1, runtimeId2, areSame)
    end
    def get_root_element(this : IUIAutomation6*, root : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_element.call(this, root)
    end
    def element_from_handle(this : IUIAutomation6*, hwnd : Win32cr::Foundation::HWND, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_handle.call(this, hwnd, element)
    end
    def element_from_point(this : IUIAutomation6*, pt : Win32cr::Foundation::POINT, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_point.call(this, pt, element)
    end
    def get_focused_element(this : IUIAutomation6*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focused_element.call(this, element)
    end
    def get_root_element_build_cache(this : IUIAutomation6*, cacheRequest : Void*, root : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_root_element_build_cache.call(this, cacheRequest, root)
    end
    def element_from_handle_build_cache(this : IUIAutomation6*, hwnd : Win32cr::Foundation::HWND, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_handle_build_cache.call(this, hwnd, cacheRequest, element)
    end
    def element_from_point_build_cache(this : IUIAutomation6*, pt : Win32cr::Foundation::POINT, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_point_build_cache.call(this, pt, cacheRequest, element)
    end
    def get_focused_element_build_cache(this : IUIAutomation6*, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_focused_element_build_cache.call(this, cacheRequest, element)
    end
    def create_tree_walker(this : IUIAutomation6*, pCondition : Void*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_tree_walker.call(this, pCondition, walker)
    end
    def get_ControlViewWalker(this : IUIAutomation6*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ControlViewWalker.call(this, walker)
    end
    def get_ContentViewWalker(this : IUIAutomation6*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentViewWalker.call(this, walker)
    end
    def get_RawViewWalker(this : IUIAutomation6*, walker : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RawViewWalker.call(this, walker)
    end
    def get_RawViewCondition(this : IUIAutomation6*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RawViewCondition.call(this, condition)
    end
    def get_ControlViewCondition(this : IUIAutomation6*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ControlViewCondition.call(this, condition)
    end
    def get_ContentViewCondition(this : IUIAutomation6*, condition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ContentViewCondition.call(this, condition)
    end
    def create_cache_request(this : IUIAutomation6*, cacheRequest : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_cache_request.call(this, cacheRequest)
    end
    def create_true_condition(this : IUIAutomation6*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_true_condition.call(this, newCondition)
    end
    def create_false_condition(this : IUIAutomation6*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_false_condition.call(this, newCondition)
    end
    def create_property_condition(this : IUIAutomation6*, propertyId : Int32, value : Win32cr::System::Com::VARIANT, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_condition.call(this, propertyId, value, newCondition)
    end
    def create_property_condition_ex(this : IUIAutomation6*, propertyId : Int32, value : Win32cr::System::Com::VARIANT, flags : Win32cr::UI::Accessibility::PropertyConditionFlags, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_property_condition_ex.call(this, propertyId, value, flags, newCondition)
    end
    def create_and_condition(this : IUIAutomation6*, condition1 : Void*, condition2 : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition.call(this, condition1, condition2, newCondition)
    end
    def create_and_condition_from_array(this : IUIAutomation6*, conditions : Win32cr::System::Com::SAFEARRAY*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition_from_array.call(this, conditions, newCondition)
    end
    def create_and_condition_from_native_array(this : IUIAutomation6*, conditions : Void**, conditionCount : Int32, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_and_condition_from_native_array.call(this, conditions, conditionCount, newCondition)
    end
    def create_or_condition(this : IUIAutomation6*, condition1 : Void*, condition2 : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition.call(this, condition1, condition2, newCondition)
    end
    def create_or_condition_from_array(this : IUIAutomation6*, conditions : Win32cr::System::Com::SAFEARRAY*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition_from_array.call(this, conditions, newCondition)
    end
    def create_or_condition_from_native_array(this : IUIAutomation6*, conditions : Void**, conditionCount : Int32, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_condition_from_native_array.call(this, conditions, conditionCount, newCondition)
    end
    def create_not_condition(this : IUIAutomation6*, condition : Void*, newCondition : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_not_condition.call(this, condition, newCondition)
    end
    def add_automation_event_handler(this : IUIAutomation6*, eventId : Int32, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_automation_event_handler.call(this, eventId, element, scope, cacheRequest, handler)
    end
    def remove_automation_event_handler(this : IUIAutomation6*, eventId : Int32, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_automation_event_handler.call(this, eventId, element, handler)
    end
    def add_property_changed_event_handler_native_array(this : IUIAutomation6*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*, propertyArray : Int32*, propertyCount : Int32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_changed_event_handler_native_array.call(this, element, scope, cacheRequest, handler, propertyArray, propertyCount)
    end
    def add_property_changed_event_handler(this : IUIAutomation6*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*, propertyArray : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_property_changed_event_handler.call(this, element, scope, cacheRequest, handler, propertyArray)
    end
    def remove_property_changed_event_handler(this : IUIAutomation6*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_property_changed_event_handler.call(this, element, handler)
    end
    def add_structure_changed_event_handler(this : IUIAutomation6*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_structure_changed_event_handler.call(this, element, scope, cacheRequest, handler)
    end
    def remove_structure_changed_event_handler(this : IUIAutomation6*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_structure_changed_event_handler.call(this, element, handler)
    end
    def add_focus_changed_event_handler(this : IUIAutomation6*, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_focus_changed_event_handler.call(this, cacheRequest, handler)
    end
    def remove_focus_changed_event_handler(this : IUIAutomation6*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_focus_changed_event_handler.call(this, handler)
    end
    def remove_all_event_handlers(this : IUIAutomation6*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_all_event_handlers.call(this)
    end
    def int_native_array_to_safe_array(this : IUIAutomation6*, array : Int32*, arrayCount : Int32, safeArray : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.int_native_array_to_safe_array.call(this, array, arrayCount, safeArray)
    end
    def int_safe_array_to_native_array(this : IUIAutomation6*, intArray : Win32cr::System::Com::SAFEARRAY*, array : Int32**, arrayCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.int_safe_array_to_native_array.call(this, intArray, array, arrayCount)
    end
    def rect_to_variant(this : IUIAutomation6*, rc : Win32cr::Foundation::RECT, var : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.rect_to_variant.call(this, rc, var)
    end
    def variant_to_rect(this : IUIAutomation6*, var : Win32cr::System::Com::VARIANT, rc : Win32cr::Foundation::RECT*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.variant_to_rect.call(this, var, rc)
    end
    def safe_array_to_rect_native_array(this : IUIAutomation6*, rects : Win32cr::System::Com::SAFEARRAY*, rectArray : Win32cr::Foundation::RECT**, rectArrayCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.safe_array_to_rect_native_array.call(this, rects, rectArray, rectArrayCount)
    end
    def create_proxy_factory_entry(this : IUIAutomation6*, factory : Void*, factoryEntry : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_proxy_factory_entry.call(this, factory, factoryEntry)
    end
    def get_ProxyFactoryMapping(this : IUIAutomation6*, factoryMapping : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ProxyFactoryMapping.call(this, factoryMapping)
    end
    def get_property_programmatic_name(this : IUIAutomation6*, property : Int32, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_programmatic_name.call(this, property, name)
    end
    def get_pattern_programmatic_name(this : IUIAutomation6*, pattern : Int32, name : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_pattern_programmatic_name.call(this, pattern, name)
    end
    def poll_for_potential_supported_patterns(this : IUIAutomation6*, pElement : Void*, patternIds : Win32cr::System::Com::SAFEARRAY**, patternNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.poll_for_potential_supported_patterns.call(this, pElement, patternIds, patternNames)
    end
    def poll_for_potential_supported_properties(this : IUIAutomation6*, pElement : Void*, propertyIds : Win32cr::System::Com::SAFEARRAY**, propertyNames : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.poll_for_potential_supported_properties.call(this, pElement, propertyIds, propertyNames)
    end
    def check_not_supported(this : IUIAutomation6*, value : Win32cr::System::Com::VARIANT, isNotSupported : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.check_not_supported.call(this, value, isNotSupported)
    end
    def get_ReservedNotSupportedValue(this : IUIAutomation6*, notSupportedValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReservedNotSupportedValue.call(this, notSupportedValue)
    end
    def get_ReservedMixedAttributeValue(this : IUIAutomation6*, mixedAttributeValue : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ReservedMixedAttributeValue.call(this, mixedAttributeValue)
    end
    def element_from_i_accessible(this : IUIAutomation6*, accessible : Void*, childId : Int32, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_i_accessible.call(this, accessible, childId, element)
    end
    def element_from_i_accessible_build_cache(this : IUIAutomation6*, accessible : Void*, childId : Int32, cacheRequest : Void*, element : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.element_from_i_accessible_build_cache.call(this, accessible, childId, cacheRequest, element)
    end
    def get_AutoSetFocus(this : IUIAutomation6*, autoSetFocus : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AutoSetFocus.call(this, autoSetFocus)
    end
    def put_AutoSetFocus(this : IUIAutomation6*, autoSetFocus : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AutoSetFocus.call(this, autoSetFocus)
    end
    def get_ConnectionTimeout(this : IUIAutomation6*, timeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectionTimeout.call(this, timeout)
    end
    def put_ConnectionTimeout(this : IUIAutomation6*, timeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ConnectionTimeout.call(this, timeout)
    end
    def get_TransactionTimeout(this : IUIAutomation6*, timeout : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_TransactionTimeout.call(this, timeout)
    end
    def put_TransactionTimeout(this : IUIAutomation6*, timeout : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_TransactionTimeout.call(this, timeout)
    end
    def add_text_edit_text_changed_event_handler(this : IUIAutomation6*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, textEditChangeType : Win32cr::UI::Accessibility::TextEditChangeType, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_text_edit_text_changed_event_handler.call(this, element, scope, textEditChangeType, cacheRequest, handler)
    end
    def remove_text_edit_text_changed_event_handler(this : IUIAutomation6*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_text_edit_text_changed_event_handler.call(this, element, handler)
    end
    def add_changes_event_handler(this : IUIAutomation6*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, changeTypes : Int32*, changesCount : Int32, pCacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_changes_event_handler.call(this, element, scope, changeTypes, changesCount, pCacheRequest, handler)
    end
    def remove_changes_event_handler(this : IUIAutomation6*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_changes_event_handler.call(this, element, handler)
    end
    def add_notification_event_handler(this : IUIAutomation6*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_notification_event_handler.call(this, element, scope, cacheRequest, handler)
    end
    def remove_notification_event_handler(this : IUIAutomation6*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_notification_event_handler.call(this, element, handler)
    end
    def create_event_handler_group(this : IUIAutomation6*, handlerGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_event_handler_group.call(this, handlerGroup)
    end
    def add_event_handler_group(this : IUIAutomation6*, element : Void*, handlerGroup : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_event_handler_group.call(this, element, handlerGroup)
    end
    def remove_event_handler_group(this : IUIAutomation6*, element : Void*, handlerGroup : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_event_handler_group.call(this, element, handlerGroup)
    end
    def get_ConnectionRecoveryBehavior(this : IUIAutomation6*, connectionRecoveryBehaviorOptions : Win32cr::UI::Accessibility::ConnectionRecoveryBehaviorOptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ConnectionRecoveryBehavior.call(this, connectionRecoveryBehaviorOptions)
    end
    def put_ConnectionRecoveryBehavior(this : IUIAutomation6*, connectionRecoveryBehaviorOptions : Win32cr::UI::Accessibility::ConnectionRecoveryBehaviorOptions) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ConnectionRecoveryBehavior.call(this, connectionRecoveryBehaviorOptions)
    end
    def get_CoalesceEvents(this : IUIAutomation6*, coalesceEventsOptions : Win32cr::UI::Accessibility::CoalesceEventsOptions*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_CoalesceEvents.call(this, coalesceEventsOptions)
    end
    def put_CoalesceEvents(this : IUIAutomation6*, coalesceEventsOptions : Win32cr::UI::Accessibility::CoalesceEventsOptions) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_CoalesceEvents.call(this, coalesceEventsOptions)
    end
    def add_active_text_position_changed_event_handler(this : IUIAutomation6*, element : Void*, scope : Win32cr::UI::Accessibility::TreeScope, cacheRequest : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add_active_text_position_changed_event_handler.call(this, element, scope, cacheRequest, handler)
    end
    def remove_active_text_position_changed_event_handler(this : IUIAutomation6*, element : Void*, handler : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove_active_text_position_changed_event_handler.call(this, element, handler)
    end

  end

  @[Link("oleacc")]
  @[Link("uiautomationcore")]
  @[Link("user32")]
  lib C
    fun LresultFromObject(riid : LibC::GUID*, wParam : Win32cr::Foundation::WPARAM, punk : Void*) : Win32cr::Foundation::LRESULT

    fun ObjectFromLresult(lResult : Win32cr::Foundation::LRESULT, riid : LibC::GUID*, wParam : Win32cr::Foundation::WPARAM, ppvObject : Void**) : Win32cr::Foundation::HRESULT

    fun WindowFromAccessibleObject(param0 : Void*, phwnd : Win32cr::Foundation::HWND*) : Win32cr::Foundation::HRESULT

    fun AccessibleObjectFromWindow(hwnd : Win32cr::Foundation::HWND, dwId : UInt32, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT

    fun AccessibleObjectFromEvent(hwnd : Win32cr::Foundation::HWND, dwId : UInt32, dwChildId : UInt32, ppacc : Void**, pvarChild : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun AccessibleObjectFromPoint(ptScreen : Win32cr::Foundation::POINT, ppacc : Void**, pvarChild : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun AccessibleChildren(paccContainer : Void*, iChildStart : Int32, cChildren : Int32, rgvarChildren : Win32cr::System::Com::VARIANT*, pcObtained : Int32*) : Win32cr::Foundation::HRESULT

    fun GetRoleTextA(lRole : UInt32, lpszRole : UInt8*, cchRoleMax : UInt32) : UInt32

    fun GetRoleTextW(lRole : UInt32, lpszRole : UInt16*, cchRoleMax : UInt32) : UInt32

    fun GetStateTextA(lStateBit : UInt32, lpszState : UInt8*, cchState : UInt32) : UInt32

    fun GetStateTextW(lStateBit : UInt32, lpszState : UInt16*, cchState : UInt32) : UInt32

    fun GetOleaccVersionInfo(pVer : UInt32*, pBuild : UInt32*) : Void

    fun CreateStdAccessibleObject(hwnd : Win32cr::Foundation::HWND, idObject : Int32, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT

    fun CreateStdAccessibleProxyA(hwnd : Win32cr::Foundation::HWND, pClassName : Win32cr::Foundation::PSTR, idObject : Int32, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT

    fun CreateStdAccessibleProxyW(hwnd : Win32cr::Foundation::HWND, pClassName : Win32cr::Foundation::PWSTR, idObject : Int32, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT

    fun AccSetRunningUtilityState(hwndApp : Win32cr::Foundation::HWND, dwUtilityStateMask : UInt32, dwUtilityState : Win32cr::UI::Accessibility::ACC_UTILITY_STATE_FLAGS) : Win32cr::Foundation::HRESULT

    fun AccNotifyTouchInteraction(hwndApp : Win32cr::Foundation::HWND, hwndTarget : Win32cr::Foundation::HWND, ptTarget : Win32cr::Foundation::POINT) : Win32cr::Foundation::HRESULT

    fun UiaGetErrorDescription(pDescription : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::BOOL

    fun UiaHUiaNodeFromVariant(pvar : Win32cr::System::Com::VARIANT*, phnode : Win32cr::UI::Accessibility::HUIANODE*) : Win32cr::Foundation::HRESULT

    fun UiaHPatternObjectFromVariant(pvar : Win32cr::System::Com::VARIANT*, phobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT*) : Win32cr::Foundation::HRESULT

    fun UiaHTextRangeFromVariant(pvar : Win32cr::System::Com::VARIANT*, phtextrange : Win32cr::UI::Accessibility::HUIATEXTRANGE*) : Win32cr::Foundation::HRESULT

    fun UiaNodeRelease(hnode : Win32cr::UI::Accessibility::HUIANODE) : Win32cr::Foundation::BOOL

    fun UiaGetPropertyValue(hnode : Win32cr::UI::Accessibility::HUIANODE, propertyId : Int32, pValue : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun UiaGetPatternProvider(hnode : Win32cr::UI::Accessibility::HUIANODE, patternId : Int32, phobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT*) : Win32cr::Foundation::HRESULT

    fun UiaGetRuntimeId(hnode : Win32cr::UI::Accessibility::HUIANODE, pruntimeId : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT

    fun UiaSetFocus(hnode : Win32cr::UI::Accessibility::HUIANODE) : Win32cr::Foundation::HRESULT

    fun UiaNavigate(hnode : Win32cr::UI::Accessibility::HUIANODE, direction : Win32cr::UI::Accessibility::NavigateDirection, pCondition : Win32cr::UI::Accessibility::UiaCondition*, pRequest : Win32cr::UI::Accessibility::UiaCacheRequest*, ppRequestedData : Win32cr::System::Com::SAFEARRAY**, ppTreeStructure : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    fun UiaGetUpdatedCache(hnode : Win32cr::UI::Accessibility::HUIANODE, pRequest : Win32cr::UI::Accessibility::UiaCacheRequest*, normalizeState : Win32cr::UI::Accessibility::NormalizeState, pNormalizeCondition : Win32cr::UI::Accessibility::UiaCondition*, ppRequestedData : Win32cr::System::Com::SAFEARRAY**, ppTreeStructure : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    fun UiaFind(hnode : Win32cr::UI::Accessibility::HUIANODE, pParams : Win32cr::UI::Accessibility::UiaFindParams*, pRequest : Win32cr::UI::Accessibility::UiaCacheRequest*, ppRequestedData : Win32cr::System::Com::SAFEARRAY**, ppOffsets : Win32cr::System::Com::SAFEARRAY**, ppTreeStructures : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT

    fun UiaNodeFromPoint(x : Float64, y : Float64, pRequest : Win32cr::UI::Accessibility::UiaCacheRequest*, ppRequestedData : Win32cr::System::Com::SAFEARRAY**, ppTreeStructure : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    fun UiaNodeFromFocus(pRequest : Win32cr::UI::Accessibility::UiaCacheRequest*, ppRequestedData : Win32cr::System::Com::SAFEARRAY**, ppTreeStructure : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    fun UiaNodeFromHandle(hwnd : Win32cr::Foundation::HWND, phnode : Win32cr::UI::Accessibility::HUIANODE*) : Win32cr::Foundation::HRESULT

    fun UiaNodeFromProvider(pProvider : Void*, phnode : Win32cr::UI::Accessibility::HUIANODE*) : Win32cr::Foundation::HRESULT

    fun UiaGetRootNode(phnode : Win32cr::UI::Accessibility::HUIANODE*) : Win32cr::Foundation::HRESULT

    fun UiaRegisterProviderCallback(pCallback : Win32cr::UI::Accessibility::UiaProviderCallback*) : Void

    fun UiaLookupId(type__ : Win32cr::UI::Accessibility::AutomationIdentifierType, pGuid : LibC::GUID*) : Int32

    fun UiaGetReservedNotSupportedValue(punkNotSupportedValue : Void**) : Win32cr::Foundation::HRESULT

    fun UiaGetReservedMixedAttributeValue(punkMixedAttributeValue : Void**) : Win32cr::Foundation::HRESULT

    fun UiaClientsAreListening : Win32cr::Foundation::BOOL

    fun UiaRaiseAutomationPropertyChangedEvent(pProvider : Void*, id : Int32, oldValue : Win32cr::System::Com::VARIANT, newValue : Win32cr::System::Com::VARIANT) : Win32cr::Foundation::HRESULT

    fun UiaRaiseAutomationEvent(pProvider : Void*, id : Int32) : Win32cr::Foundation::HRESULT

    fun UiaRaiseStructureChangedEvent(pProvider : Void*, structureChangeType : Win32cr::UI::Accessibility::StructureChangeType, pRuntimeId : Int32*, cRuntimeIdLen : Int32) : Win32cr::Foundation::HRESULT

    fun UiaRaiseAsyncContentLoadedEvent(pProvider : Void*, asyncContentLoadedState : Win32cr::UI::Accessibility::AsyncContentLoadedState, percentComplete : Float64) : Win32cr::Foundation::HRESULT

    fun UiaRaiseTextEditTextChangedEvent(pProvider : Void*, textEditChangeType : Win32cr::UI::Accessibility::TextEditChangeType, pChangedData : Win32cr::System::Com::SAFEARRAY*) : Win32cr::Foundation::HRESULT

    fun UiaRaiseChangesEvent(pProvider : Void*, eventIdCount : Int32, pUiaChanges : Win32cr::UI::Accessibility::UiaChangeInfo*) : Win32cr::Foundation::HRESULT

    fun UiaRaiseNotificationEvent(provider : Void*, notificationKind : Win32cr::UI::Accessibility::NotificationKind, notificationProcessing : Win32cr::UI::Accessibility::NotificationProcessing, displayString : Win32cr::Foundation::BSTR, activityId : Win32cr::Foundation::BSTR) : Win32cr::Foundation::HRESULT

    fun UiaRaiseActiveTextPositionChangedEvent(provider : Void*, textRange : Void*) : Win32cr::Foundation::HRESULT

    fun UiaAddEvent(hnode : Win32cr::UI::Accessibility::HUIANODE, eventId : Int32, pCallback : Win32cr::UI::Accessibility::UiaEventCallback*, scope : Win32cr::UI::Accessibility::TreeScope, pProperties : Int32*, cProperties : Int32, pRequest : Win32cr::UI::Accessibility::UiaCacheRequest*, phEvent : Win32cr::UI::Accessibility::HUIAEVENT*) : Win32cr::Foundation::HRESULT

    fun UiaRemoveEvent(hEvent : Win32cr::UI::Accessibility::HUIAEVENT) : Win32cr::Foundation::HRESULT

    fun UiaEventAddWindow(hEvent : Win32cr::UI::Accessibility::HUIAEVENT, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT

    fun UiaEventRemoveWindow(hEvent : Win32cr::UI::Accessibility::HUIAEVENT, hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::HRESULT

    fun DockPattern_SetDockPosition(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, dockPosition : Win32cr::UI::Accessibility::DockPosition) : Win32cr::Foundation::HRESULT

    fun ExpandCollapsePattern_Collapse(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT) : Win32cr::Foundation::HRESULT

    fun ExpandCollapsePattern_Expand(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT) : Win32cr::Foundation::HRESULT

    fun GridPattern_GetItem(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, row : Int32, column : Int32, pResult : Win32cr::UI::Accessibility::HUIANODE*) : Win32cr::Foundation::HRESULT

    fun InvokePattern_Invoke(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT) : Win32cr::Foundation::HRESULT

    fun MultipleViewPattern_GetViewName(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, viewId : Int32, ppStr : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    fun MultipleViewPattern_SetCurrentView(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, viewId : Int32) : Win32cr::Foundation::HRESULT

    fun RangeValuePattern_SetValue(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, val : Float64) : Win32cr::Foundation::HRESULT

    fun ScrollItemPattern_ScrollIntoView(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT) : Win32cr::Foundation::HRESULT

    fun ScrollPattern_Scroll(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, horizontalAmount : Win32cr::UI::Accessibility::ScrollAmount, verticalAmount : Win32cr::UI::Accessibility::ScrollAmount) : Win32cr::Foundation::HRESULT

    fun ScrollPattern_SetScrollPercent(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, horizontalPercent : Float64, verticalPercent : Float64) : Win32cr::Foundation::HRESULT

    fun SelectionItemPattern_AddToSelection(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT) : Win32cr::Foundation::HRESULT

    fun SelectionItemPattern_RemoveFromSelection(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT) : Win32cr::Foundation::HRESULT

    fun SelectionItemPattern_Select(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT) : Win32cr::Foundation::HRESULT

    fun TogglePattern_Toggle(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT) : Win32cr::Foundation::HRESULT

    fun TransformPattern_Move(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, x : Float64, y : Float64) : Win32cr::Foundation::HRESULT

    fun TransformPattern_Resize(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, width : Float64, height : Float64) : Win32cr::Foundation::HRESULT

    fun TransformPattern_Rotate(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, degrees : Float64) : Win32cr::Foundation::HRESULT

    fun ValuePattern_SetValue(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, pVal : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun WindowPattern_Close(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT) : Win32cr::Foundation::HRESULT

    fun WindowPattern_SetWindowVisualState(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, state : Win32cr::UI::Accessibility::WindowVisualState) : Win32cr::Foundation::HRESULT

    fun WindowPattern_WaitForInputIdle(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, milliseconds : Int32, pResult : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun TextPattern_GetSelection(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT

    fun TextPattern_GetVisibleRanges(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT

    fun TextPattern_RangeFromChild(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, hnodeChild : Win32cr::UI::Accessibility::HUIANODE, pRetVal : Win32cr::UI::Accessibility::HUIATEXTRANGE*) : Win32cr::Foundation::HRESULT

    fun TextPattern_RangeFromPoint(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, point : Win32cr::UI::Accessibility::UiaPoint, pRetVal : Win32cr::UI::Accessibility::HUIATEXTRANGE*) : Win32cr::Foundation::HRESULT

    fun TextPattern_get_DocumentRange(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, pRetVal : Win32cr::UI::Accessibility::HUIATEXTRANGE*) : Win32cr::Foundation::HRESULT

    fun TextPattern_get_SupportedTextSelection(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, pRetVal : Win32cr::UI::Accessibility::SupportedTextSelection*) : Win32cr::Foundation::HRESULT

    fun TextRange_Clone(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, pRetVal : Win32cr::UI::Accessibility::HUIATEXTRANGE*) : Win32cr::Foundation::HRESULT

    fun TextRange_Compare(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, range : Win32cr::UI::Accessibility::HUIATEXTRANGE, pRetVal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT

    fun TextRange_CompareEndpoints(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, endpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, targetRange : Win32cr::UI::Accessibility::HUIATEXTRANGE, targetEndpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, pRetVal : Int32*) : Win32cr::Foundation::HRESULT

    fun TextRange_ExpandToEnclosingUnit(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, unit : Win32cr::UI::Accessibility::TextUnit) : Win32cr::Foundation::HRESULT

    fun TextRange_GetAttributeValue(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, attributeId : Int32, pRetVal : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun TextRange_FindAttribute(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, attributeId : Int32, val : Win32cr::System::Com::VARIANT, backward : Win32cr::Foundation::BOOL, pRetVal : Win32cr::UI::Accessibility::HUIATEXTRANGE*) : Win32cr::Foundation::HRESULT

    fun TextRange_FindText(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, text : Win32cr::Foundation::BSTR, backward : Win32cr::Foundation::BOOL, ignoreCase : Win32cr::Foundation::BOOL, pRetVal : Win32cr::UI::Accessibility::HUIATEXTRANGE*) : Win32cr::Foundation::HRESULT

    fun TextRange_GetBoundingRectangles(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT

    fun TextRange_GetEnclosingElement(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, pRetVal : Win32cr::UI::Accessibility::HUIANODE*) : Win32cr::Foundation::HRESULT

    fun TextRange_GetText(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, maxLength : Int32, pRetVal : Win32cr::Foundation::BSTR*) : Win32cr::Foundation::HRESULT

    fun TextRange_Move(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, unit : Win32cr::UI::Accessibility::TextUnit, count : Int32, pRetVal : Int32*) : Win32cr::Foundation::HRESULT

    fun TextRange_MoveEndpointByUnit(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, endpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, unit : Win32cr::UI::Accessibility::TextUnit, count : Int32, pRetVal : Int32*) : Win32cr::Foundation::HRESULT

    fun TextRange_MoveEndpointByRange(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, endpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint, targetRange : Win32cr::UI::Accessibility::HUIATEXTRANGE, targetEndpoint : Win32cr::UI::Accessibility::TextPatternRangeEndpoint) : Win32cr::Foundation::HRESULT

    fun TextRange_Select(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE) : Win32cr::Foundation::HRESULT

    fun TextRange_AddToSelection(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE) : Win32cr::Foundation::HRESULT

    fun TextRange_RemoveFromSelection(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE) : Win32cr::Foundation::HRESULT

    fun TextRange_ScrollIntoView(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, alignToTop : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT

    fun TextRange_GetChildren(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE, pRetVal : Win32cr::System::Com::SAFEARRAY**) : Win32cr::Foundation::HRESULT

    fun ItemContainerPattern_FindItemByProperty(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, hnodeStartAfter : Win32cr::UI::Accessibility::HUIANODE, propertyId : Int32, value : Win32cr::System::Com::VARIANT, pFound : Win32cr::UI::Accessibility::HUIANODE*) : Win32cr::Foundation::HRESULT

    fun LegacyIAccessiblePattern_Select(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, flagsSelect : Int32) : Win32cr::Foundation::HRESULT

    fun LegacyIAccessiblePattern_DoDefaultAction(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT) : Win32cr::Foundation::HRESULT

    fun LegacyIAccessiblePattern_SetValue(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, szValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT

    fun LegacyIAccessiblePattern_GetIAccessible(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, pAccessible : Void**) : Win32cr::Foundation::HRESULT

    fun SynchronizedInputPattern_StartListening(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT, inputType : Win32cr::UI::Accessibility::SynchronizedInputType) : Win32cr::Foundation::HRESULT

    fun SynchronizedInputPattern_Cancel(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT) : Win32cr::Foundation::HRESULT

    fun VirtualizedItemPattern_Realize(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT) : Win32cr::Foundation::HRESULT

    fun UiaPatternRelease(hobj : Win32cr::UI::Accessibility::HUIAPATTERNOBJECT) : Win32cr::Foundation::BOOL

    fun UiaTextRangeRelease(hobj : Win32cr::UI::Accessibility::HUIATEXTRANGE) : Win32cr::Foundation::BOOL

    fun UiaReturnRawElementProvider(hwnd : Win32cr::Foundation::HWND, wParam : Win32cr::Foundation::WPARAM, lParam : Win32cr::Foundation::LPARAM, el : Void*) : Win32cr::Foundation::LRESULT

    fun UiaHostProviderFromHwnd(hwnd : Win32cr::Foundation::HWND, ppProvider : Void**) : Win32cr::Foundation::HRESULT

    fun UiaProviderForNonClient(hwnd : Win32cr::Foundation::HWND, idObject : Int32, idChild : Int32, ppProvider : Void**) : Win32cr::Foundation::HRESULT

    fun UiaIAccessibleFromProvider(pProvider : Void*, dwFlags : UInt32, ppAccessible : Void**, pvarChild : Win32cr::System::Com::VARIANT*) : Win32cr::Foundation::HRESULT

    fun UiaProviderFromIAccessible(pAccessible : Void*, idChild : Int32, dwFlags : UInt32, ppProvider : Void**) : Win32cr::Foundation::HRESULT

    fun UiaDisconnectAllProviders : Win32cr::Foundation::HRESULT

    fun UiaDisconnectProvider(pProvider : Void*) : Win32cr::Foundation::HRESULT

    fun UiaHasServerSideProvider(hwnd : Win32cr::Foundation::HWND) : Win32cr::Foundation::BOOL

    fun RegisterPointerInputTarget(hwnd : Win32cr::Foundation::HWND, pointerType : Win32cr::UI::WindowsAndMessaging::POINTER_INPUT_TYPE) : Win32cr::Foundation::BOOL

    fun UnregisterPointerInputTarget(hwnd : Win32cr::Foundation::HWND, pointerType : Win32cr::UI::WindowsAndMessaging::POINTER_INPUT_TYPE) : Win32cr::Foundation::BOOL

    fun RegisterPointerInputTargetEx(hwnd : Win32cr::Foundation::HWND, pointerType : Win32cr::UI::WindowsAndMessaging::POINTER_INPUT_TYPE, fObserve : Win32cr::Foundation::BOOL) : Win32cr::Foundation::BOOL

    fun UnregisterPointerInputTargetEx(hwnd : Win32cr::Foundation::HWND, pointerType : Win32cr::UI::WindowsAndMessaging::POINTER_INPUT_TYPE) : Win32cr::Foundation::BOOL

    fun NotifyWinEvent(event : UInt32, hwnd : Win32cr::Foundation::HWND, idObject : Int32, idChild : Int32) : Void

    fun SetWinEventHook(eventMin : UInt32, eventMax : UInt32, hmodWinEventProc : Win32cr::Foundation::HINSTANCE, pfnWinEventProc : Win32cr::UI::Accessibility::WINEVENTPROC, idProcess : UInt32, idThread : UInt32, dwFlags : UInt32) : Win32cr::UI::Accessibility::HWINEVENTHOOK

    fun IsWinEventHookInstalled(event : UInt32) : Win32cr::Foundation::BOOL

    fun UnhookWinEvent(hWinEventHook : Win32cr::UI::Accessibility::HWINEVENTHOOK) : Win32cr::Foundation::BOOL

  end
end