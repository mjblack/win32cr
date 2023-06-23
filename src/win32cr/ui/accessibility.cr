require "../system/com.cr"
require "../foundation.cr"
require "../ui/windowsandmessaging.cr"

{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link("delayimp")]
{% end %}
@[Link("user32")]
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/IGNORE:4199")]
{% end %}
{% if compare_versions(Crystal::VERSION, "1.8.2") <= 0 %}
@[Link(ldflags: "/DELAYLOAD:oleacc.dll")]
@[Link(ldflags: "/DELAYLOAD:uiautomationcore.dll")]
@[Link(ldflags: "/DELAYLOAD:user32.dll")]
{% else %}
@[Link("oleacc")]
@[Link("uiautomationcore")]
@[Link("user32")]
{% end %}
lib LibWin32
  alias HWINEVENTHOOK = LibC::IntPtrT
  alias HUIANODE = LibC::IntPtrT
  alias HUIAPATTERNOBJECT = LibC::IntPtrT
  alias HUIATEXTRANGE = LibC::IntPtrT
  alias HUIAEVENT = LibC::IntPtrT

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
  UIA_ScrollPatternNoScroll = "-1.0_f64"
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

  alias LPFNLRESULTFROMOBJECT = Proc(Guid*, LibC::UINT_PTR, IUnknown, LRESULT)
  alias LPFNOBJECTFROMLRESULT = Proc(LRESULT, Guid*, LibC::UINT_PTR, Void**, HRESULT)
  alias LPFNACCESSIBLEOBJECTFROMWINDOW = Proc(LibC::HANDLE, UInt32, Guid*, Void**, HRESULT)
  alias LPFNACCESSIBLEOBJECTFROMPOINT = Proc(POINT, IAccessible*, VARIANT*, HRESULT)
  alias LPFNCREATESTDACCESSIBLEOBJECT = Proc(LibC::HANDLE, Int32, Guid*, Void**, HRESULT)
  alias LPFNACCESSIBLECHILDREN = Proc(IAccessible, Int32, Int32, VARIANT*, Int32*, HRESULT)
  alias UiaProviderCallback = Proc(LibC::HANDLE, ProviderType, SAFEARRAY*)
  alias UiaEventCallback = Proc(UiaEventArgs*, SAFEARRAY*, UInt8*, Void)
  alias WINEVENTPROC = Proc(HWINEVENTHOOK, UInt32, LibC::HANDLE, Int32, Int32, UInt32, UInt32, Void)


  enum STICKYKEYS_FLAGS : UInt32
    SKF_STICKYKEYSON = 1
    SKF_AVAILABLE = 2
    SKF_HOTKEYACTIVE = 4
    SKF_CONFIRMHOTKEY = 8
    SKF_HOTKEYSOUND = 16
    SKF_INDICATOR = 32
    SKF_AUDIBLEFEEDBACK = 64
    SKF_TRISTATE = 128
    SKF_TWOKEYSOFF = 256
    SKF_LALTLATCHED = 268435456
    SKF_LCTLLATCHED = 67108864
    SKF_LSHIFTLATCHED = 16777216
    SKF_RALTLATCHED = 536870912
    SKF_RCTLLATCHED = 134217728
    SKF_RSHIFTLATCHED = 33554432
    SKF_LWINLATCHED = 1073741824
    SKF_RWINLATCHED = 2147483648
    SKF_LALTLOCKED = 1048576
    SKF_LCTLLOCKED = 262144
    SKF_LSHIFTLOCKED = 65536
    SKF_RALTLOCKED = 2097152
    SKF_RCTLLOCKED = 524288
    SKF_RSHIFTLOCKED = 131072
    SKF_LWINLOCKED = 4194304
    SKF_RWINLOCKED = 8388608
  end

  enum SOUNDSENTRY_FLAGS : UInt32
    SSF_SOUNDSENTRYON = 1
    SSF_AVAILABLE = 2
    SSF_INDICATOR = 4
  end

  enum ACC_UTILITY_STATE_FLAGS : UInt32
    ANRUS_ON_SCREEN_KEYBOARD_ACTIVE = 1
    ANRUS_TOUCH_MODIFICATION_ACTIVE = 2
    ANRUS_PRIORITY_AUDIO_ACTIVE = 4
    ANRUS_PRIORITY_AUDIO_ACTIVE_NODUCK = 8
  end

  enum SOUND_SENTRY_GRAPHICS_EFFECT : UInt32
    SSGF_DISPLAY = 3
    SSGF_NONE = 0
  end

  enum SERIALKEYS_FLAGS : UInt32
    SERKF_AVAILABLE = 2
    SERKF_INDICATOR = 4
    SERKF_SERIALKEYSON = 1
  end

  enum HIGHCONTRASTW_FLAGS : UInt32
    HCF_HIGHCONTRASTON = 1
    HCF_AVAILABLE = 2
    HCF_HOTKEYACTIVE = 4
    HCF_CONFIRMHOTKEY = 8
    HCF_HOTKEYSOUND = 16
    HCF_INDICATOR = 32
    HCF_HOTKEYAVAILABLE = 64
    HCF_OPTION_NOTHEMECHANGE = 4096
  end

  enum SOUNDSENTRY_TEXT_EFFECT : UInt32
    SSTF_BORDER = 2
    SSTF_CHARS = 1
    SSTF_DISPLAY = 3
    SSTF_NONE = 0
  end

  enum SOUNDSENTRY_WINDOWS_EFFECT : UInt32
    SSWF_CUSTOM = 4
    SSWF_DISPLAY = 3
    SSWF_NONE = 0
    SSWF_TITLE = 1
    SSWF_WINDOW = 2
  end

  enum AnnoScope : Int32
    ANNO_THIS = 0
    ANNO_CONTAINER = 1
  end

  enum NavigateDirection : Int32
    NavigateDirection_Parent = 0
    NavigateDirection_NextSibling = 1
    NavigateDirection_PreviousSibling = 2
    NavigateDirection_FirstChild = 3
    NavigateDirection_LastChild = 4
  end

  enum ProviderOptions : Int32
    ProviderOptions_ClientSideProvider = 1
    ProviderOptions_ServerSideProvider = 2
    ProviderOptions_NonClientAreaProvider = 4
    ProviderOptions_OverrideProvider = 8
    ProviderOptions_ProviderOwnsSetFocus = 16
    ProviderOptions_UseComThreading = 32
    ProviderOptions_RefuseNonClientSupport = 64
    ProviderOptions_HasNativeIAccessible = 128
    ProviderOptions_UseClientCoordinates = 256
  end

  enum StructureChangeType : Int32
    StructureChangeType_ChildAdded = 0
    StructureChangeType_ChildRemoved = 1
    StructureChangeType_ChildrenInvalidated = 2
    StructureChangeType_ChildrenBulkAdded = 3
    StructureChangeType_ChildrenBulkRemoved = 4
    StructureChangeType_ChildrenReordered = 5
  end

  enum TextEditChangeType : Int32
    TextEditChangeType_None = 0
    TextEditChangeType_AutoCorrect = 1
    TextEditChangeType_Composition = 2
    TextEditChangeType_CompositionFinalized = 3
    TextEditChangeType_AutoComplete = 4
  end

  enum OrientationType : Int32
    OrientationType_None = 0
    OrientationType_Horizontal = 1
    OrientationType_Vertical = 2
  end

  enum DockPosition : Int32
    DockPosition_Top = 0
    DockPosition_Left = 1
    DockPosition_Bottom = 2
    DockPosition_Right = 3
    DockPosition_Fill = 4
    DockPosition_None = 5
  end

  enum ExpandCollapseState : Int32
    ExpandCollapseState_Collapsed = 0
    ExpandCollapseState_Expanded = 1
    ExpandCollapseState_PartiallyExpanded = 2
    ExpandCollapseState_LeafNode = 3
  end

  enum ScrollAmount : Int32
    ScrollAmount_LargeDecrement = 0
    ScrollAmount_SmallDecrement = 1
    ScrollAmount_NoAmount = 2
    ScrollAmount_LargeIncrement = 3
    ScrollAmount_SmallIncrement = 4
  end

  enum RowOrColumnMajor : Int32
    RowOrColumnMajor_RowMajor = 0
    RowOrColumnMajor_ColumnMajor = 1
    RowOrColumnMajor_Indeterminate = 2
  end

  enum ToggleState : Int32
    ToggleState_Off = 0
    ToggleState_On = 1
    ToggleState_Indeterminate = 2
  end

  enum WindowVisualState : Int32
    WindowVisualState_Normal = 0
    WindowVisualState_Maximized = 1
    WindowVisualState_Minimized = 2
  end

  enum SynchronizedInputType : Int32
    SynchronizedInputType_KeyUp = 1
    SynchronizedInputType_KeyDown = 2
    SynchronizedInputType_LeftMouseUp = 4
    SynchronizedInputType_LeftMouseDown = 8
    SynchronizedInputType_RightMouseUp = 16
    SynchronizedInputType_RightMouseDown = 32
  end

  enum WindowInteractionState : Int32
    WindowInteractionState_Running = 0
    WindowInteractionState_Closing = 1
    WindowInteractionState_ReadyForUserInteraction = 2
    WindowInteractionState_BlockedByModalWindow = 3
    WindowInteractionState_NotResponding = 4
  end

  enum SayAsInterpretAs : Int32
    SayAsInterpretAs_None = 0
    SayAsInterpretAs_Spell = 1
    SayAsInterpretAs_Cardinal = 2
    SayAsInterpretAs_Ordinal = 3
    SayAsInterpretAs_Number = 4
    SayAsInterpretAs_Date = 5
    SayAsInterpretAs_Time = 6
    SayAsInterpretAs_Telephone = 7
    SayAsInterpretAs_Currency = 8
    SayAsInterpretAs_Net = 9
    SayAsInterpretAs_Url = 10
    SayAsInterpretAs_Address = 11
    SayAsInterpretAs_Alphanumeric = 12
    SayAsInterpretAs_Name = 13
    SayAsInterpretAs_Media = 14
    SayAsInterpretAs_Date_MonthDayYear = 15
    SayAsInterpretAs_Date_DayMonthYear = 16
    SayAsInterpretAs_Date_YearMonthDay = 17
    SayAsInterpretAs_Date_YearMonth = 18
    SayAsInterpretAs_Date_MonthYear = 19
    SayAsInterpretAs_Date_DayMonth = 20
    SayAsInterpretAs_Date_MonthDay = 21
    SayAsInterpretAs_Date_Year = 22
    SayAsInterpretAs_Time_HoursMinutesSeconds12 = 23
    SayAsInterpretAs_Time_HoursMinutes12 = 24
    SayAsInterpretAs_Time_HoursMinutesSeconds24 = 25
    SayAsInterpretAs_Time_HoursMinutes24 = 26
  end

  enum TextUnit : Int32
    TextUnit_Character = 0
    TextUnit_Format = 1
    TextUnit_Word = 2
    TextUnit_Line = 3
    TextUnit_Paragraph = 4
    TextUnit_Page = 5
    TextUnit_Document = 6
  end

  enum TextPatternRangeEndpoint : Int32
    TextPatternRangeEndpoint_Start = 0
    TextPatternRangeEndpoint_End = 1
  end

  enum SupportedTextSelection : Int32
    SupportedTextSelection_None = 0
    SupportedTextSelection_Single = 1
    SupportedTextSelection_Multiple = 2
  end

  enum LiveSetting : Int32
    Off = 0
    Polite = 1
    Assertive = 2
  end

  enum ActiveEnd : Int32
    ActiveEnd_None = 0
    ActiveEnd_Start = 1
    ActiveEnd_End = 2
  end

  enum CaretPosition : Int32
    CaretPosition_Unknown = 0
    CaretPosition_EndOfLine = 1
    CaretPosition_BeginningOfLine = 2
  end

  enum CaretBidiMode : Int32
    CaretBidiMode_LTR = 0
    CaretBidiMode_RTL = 1
  end

  enum ZoomUnit : Int32
    ZoomUnit_NoAmount = 0
    ZoomUnit_LargeDecrement = 1
    ZoomUnit_SmallDecrement = 2
    ZoomUnit_LargeIncrement = 3
    ZoomUnit_SmallIncrement = 4
  end

  enum AnimationStyle : Int32
    AnimationStyle_None = 0
    AnimationStyle_LasVegasLights = 1
    AnimationStyle_BlinkingBackground = 2
    AnimationStyle_SparkleText = 3
    AnimationStyle_MarchingBlackAnts = 4
    AnimationStyle_MarchingRedAnts = 5
    AnimationStyle_Shimmer = 6
    AnimationStyle_Other = -1
  end

  enum BulletStyle : Int32
    BulletStyle_None = 0
    BulletStyle_HollowRoundBullet = 1
    BulletStyle_FilledRoundBullet = 2
    BulletStyle_HollowSquareBullet = 3
    BulletStyle_FilledSquareBullet = 4
    BulletStyle_DashBullet = 5
    BulletStyle_Other = -1
  end

  enum CapStyle : Int32
    CapStyle_None = 0
    CapStyle_SmallCap = 1
    CapStyle_AllCap = 2
    CapStyle_AllPetiteCaps = 3
    CapStyle_PetiteCaps = 4
    CapStyle_Unicase = 5
    CapStyle_Titling = 6
    CapStyle_Other = -1
  end

  enum FillType : Int32
    FillType_None = 0
    FillType_Color = 1
    FillType_Gradient = 2
    FillType_Picture = 3
    FillType_Pattern = 4
  end

  enum FlowDirections : Int32
    FlowDirections_Default = 0
    FlowDirections_RightToLeft = 1
    FlowDirections_BottomToTop = 2
    FlowDirections_Vertical = 4
  end

  enum HorizontalTextAlignment : Int32
    HorizontalTextAlignment_Left = 0
    HorizontalTextAlignment_Centered = 1
    HorizontalTextAlignment_Right = 2
    HorizontalTextAlignment_Justified = 3
  end

  enum OutlineStyles : Int32
    OutlineStyles_None = 0
    OutlineStyles_Outline = 1
    OutlineStyles_Shadow = 2
    OutlineStyles_Engraved = 4
    OutlineStyles_Embossed = 8
  end

  enum TextDecorationLineStyle : Int32
    TextDecorationLineStyle_None = 0
    TextDecorationLineStyle_Single = 1
    TextDecorationLineStyle_WordsOnly = 2
    TextDecorationLineStyle_Double = 3
    TextDecorationLineStyle_Dot = 4
    TextDecorationLineStyle_Dash = 5
    TextDecorationLineStyle_DashDot = 6
    TextDecorationLineStyle_DashDotDot = 7
    TextDecorationLineStyle_Wavy = 8
    TextDecorationLineStyle_ThickSingle = 9
    TextDecorationLineStyle_DoubleWavy = 11
    TextDecorationLineStyle_ThickWavy = 12
    TextDecorationLineStyle_LongDash = 13
    TextDecorationLineStyle_ThickDash = 14
    TextDecorationLineStyle_ThickDashDot = 15
    TextDecorationLineStyle_ThickDashDotDot = 16
    TextDecorationLineStyle_ThickDot = 17
    TextDecorationLineStyle_ThickLongDash = 18
    TextDecorationLineStyle_Other = -1
  end

  enum VisualEffects : Int32
    VisualEffects_None = 0
    VisualEffects_Shadow = 1
    VisualEffects_Reflection = 2
    VisualEffects_Glow = 4
    VisualEffects_SoftEdges = 8
    VisualEffects_Bevel = 16
  end

  enum NotificationProcessing : Int32
    NotificationProcessing_ImportantAll = 0
    NotificationProcessing_ImportantMostRecent = 1
    NotificationProcessing_All = 2
    NotificationProcessing_MostRecent = 3
    NotificationProcessing_CurrentThenMostRecent = 4
  end

  enum NotificationKind : Int32
    NotificationKind_ItemAdded = 0
    NotificationKind_ItemRemoved = 1
    NotificationKind_ActionCompleted = 2
    NotificationKind_ActionAborted = 3
    NotificationKind_Other = 4
  end

  enum UIAutomationType : Int32
    UIAutomationType_Int = 1
    UIAutomationType_Bool = 2
    UIAutomationType_String = 3
    UIAutomationType_Double = 4
    UIAutomationType_Point = 5
    UIAutomationType_Rect = 6
    UIAutomationType_Element = 7
    UIAutomationType_Array = 65536
    UIAutomationType_Out = 131072
    UIAutomationType_IntArray = 65537
    UIAutomationType_BoolArray = 65538
    UIAutomationType_StringArray = 65539
    UIAutomationType_DoubleArray = 65540
    UIAutomationType_PointArray = 65541
    UIAutomationType_RectArray = 65542
    UIAutomationType_ElementArray = 65543
    UIAutomationType_OutInt = 131073
    UIAutomationType_OutBool = 131074
    UIAutomationType_OutString = 131075
    UIAutomationType_OutDouble = 131076
    UIAutomationType_OutPoint = 131077
    UIAutomationType_OutRect = 131078
    UIAutomationType_OutElement = 131079
    UIAutomationType_OutIntArray = 196609
    UIAutomationType_OutBoolArray = 196610
    UIAutomationType_OutStringArray = 196611
    UIAutomationType_OutDoubleArray = 196612
    UIAutomationType_OutPointArray = 196613
    UIAutomationType_OutRectArray = 196614
    UIAutomationType_OutElementArray = 196615
  end

  enum TreeScope : Int32
    TreeScope_None = 0
    TreeScope_Element = 1
    TreeScope_Children = 2
    TreeScope_Descendants = 4
    TreeScope_Parent = 8
    TreeScope_Ancestors = 16
    TreeScope_Subtree = 7
  end

  enum PropertyConditionFlags : Int32
    PropertyConditionFlags_None = 0
    PropertyConditionFlags_IgnoreCase = 1
    PropertyConditionFlags_MatchSubstring = 2
  end

  enum AutomationElementMode : Int32
    AutomationElementMode_None = 0
    AutomationElementMode_Full = 1
  end

  enum TreeTraversalOptions : Int32
    TreeTraversalOptions_Default = 0
    TreeTraversalOptions_PostOrder = 1
    TreeTraversalOptions_LastToFirstOrder = 2
  end

  enum ConnectionRecoveryBehaviorOptions : Int32
    ConnectionRecoveryBehaviorOptions_Disabled = 0
    ConnectionRecoveryBehaviorOptions_Enabled = 1
  end

  enum CoalesceEventsOptions : Int32
    CoalesceEventsOptions_Disabled = 0
    CoalesceEventsOptions_Enabled = 1
  end

  enum ConditionType : Int32
    ConditionType_True = 0
    ConditionType_False = 1
    ConditionType_Property = 2
    ConditionType_And = 3
    ConditionType_Or = 4
    ConditionType_Not = 5
  end

  enum NormalizeState : Int32
    NormalizeState_None = 0
    NormalizeState_View = 1
    NormalizeState_Custom = 2
  end

  enum ProviderType : Int32
    ProviderType_BaseHwnd = 0
    ProviderType_Proxy = 1
    ProviderType_NonClientArea = 2
  end

  enum AutomationIdentifierType : Int32
    AutomationIdentifierType_Property = 0
    AutomationIdentifierType_Pattern = 1
    AutomationIdentifierType_Event = 2
    AutomationIdentifierType_ControlType = 3
    AutomationIdentifierType_TextAttribute = 4
    AutomationIdentifierType_LandmarkType = 5
    AutomationIdentifierType_Annotation = 6
    AutomationIdentifierType_Changes = 7
    AutomationIdentifierType_Style = 8
  end

  enum EventArgsType : Int32
    EventArgsType_Simple = 0
    EventArgsType_PropertyChanged = 1
    EventArgsType_StructureChanged = 2
    EventArgsType_AsyncContentLoaded = 3
    EventArgsType_WindowClosed = 4
    EventArgsType_TextEditTextChanged = 5
    EventArgsType_Changes = 6
    EventArgsType_Notification = 7
    EventArgsType_ActiveTextPositionChanged = 8
    EventArgsType_StructuredMarkup = 9
  end

  enum AsyncContentLoadedState : Int32
    AsyncContentLoadedState_Beginning = 0
    AsyncContentLoadedState_Progress = 1
    AsyncContentLoadedState_Completed = 2
  end

  struct MSAAMENUINFO
    dw_msaa_signature : UInt32
    cch_w_text : UInt32
    psz_w_text : LibC::LPWSTR
  end
  struct UiaRect
    left : Float64
    top : Float64
    width : Float64
    height : Float64
  end
  struct UiaPoint
    x : Float64
    y : Float64
  end
  struct UiaChangeInfo
    uia_id : Int32
    payload : VARIANT
    extra_info : VARIANT
  end
  struct UIAutomationParameter
    type : UIAutomationType
    p_data : Void*
  end
  struct UIAutomationPropertyInfo
    guid : Guid
    p_programmatic_name : LibC::LPWSTR
    type : UIAutomationType
  end
  struct UIAutomationEventInfo
    guid : Guid
    p_programmatic_name : LibC::LPWSTR
  end
  struct UIAutomationMethodInfo
    p_programmatic_name : LibC::LPWSTR
    do_set_focus : LibC::BOOL
    c_in_parameters : UInt32
    c_out_parameters : UInt32
    p_parameter_types : UIAutomationType*
    p_parameter_names : LibC::LPWSTR*
  end
  struct UIAutomationPatternInfo
    guid : Guid
    p_programmatic_name : LibC::LPWSTR
    provider_interface_id : Guid
    client_interface_id : Guid
    c_properties : UInt32
    p_properties : UIAutomationPropertyInfo*
    c_methods : UInt32
    p_methods : UIAutomationMethodInfo*
    c_events : UInt32
    p_events : UIAutomationEventInfo*
    p_pattern_handler : IUIAutomationPatternHandler
  end
  struct ExtendedProperty
    property_name : UInt8*
    property_value : UInt8*
  end
  struct UiaCondition
    condition_type : ConditionType
  end
  struct UiaPropertyCondition
    condition_type : ConditionType
    property_id : Int32
    value : VARIANT
    flags : PropertyConditionFlags
  end
  struct UiaAndOrCondition
    condition_type : ConditionType
    pp_conditions : UiaCondition**
    c_conditions : Int32
  end
  struct UiaNotCondition
    condition_type : ConditionType
    p_condition : UiaCondition*
  end
  struct UiaCacheRequest
    p_view_condition : UiaCondition*
    scope : TreeScope
    p_properties : Int32*
    c_properties : Int32
    p_patterns : Int32*
    c_patterns : Int32
    automation_element_mode : AutomationElementMode
  end
  struct UiaFindParams
    max_depth : Int32
    find_first : LibC::BOOL
    exclude_root : LibC::BOOL
    p_find_condition : UiaCondition*
  end
  struct UiaEventArgs
    type : EventArgsType
    event_id : Int32
  end
  struct UiaPropertyChangedEventArgs
    type : EventArgsType
    event_id : Int32
    property_id : Int32
    old_value : VARIANT
    new_value : VARIANT
  end
  struct UiaStructureChangedEventArgs
    type : EventArgsType
    event_id : Int32
    structure_change_type : StructureChangeType
    p_runtime_id : Int32*
    c_runtime_id_len : Int32
  end
  struct UiaTextEditTextChangedEventArgs
    type : EventArgsType
    event_id : Int32
    text_edit_change_type : TextEditChangeType
    p_text_change : SAFEARRAY*
  end
  struct UiaChangesEventArgs
    type : EventArgsType
    event_id : Int32
    event_id_count : Int32
    p_uia_changes : UiaChangeInfo*
  end
  struct UiaAsyncContentLoadedEventArgs
    type : EventArgsType
    event_id : Int32
    async_content_loaded_state : AsyncContentLoadedState
    percent_complete : Float64
  end
  struct UiaWindowClosedEventArgs
    type : EventArgsType
    event_id : Int32
    p_runtime_id : Int32*
    c_runtime_id_len : Int32
  end
  struct SERIALKEYSA
    cb_size : UInt32
    dw_flags : SERIALKEYS_FLAGS
    lpsz_active_port : PSTR
    lpsz_port : PSTR
    i_baud_rate : UInt32
    i_port_state : UInt32
    i_active : UInt32
  end
  struct SERIALKEYSW
    cb_size : UInt32
    dw_flags : SERIALKEYS_FLAGS
    lpsz_active_port : LibC::LPWSTR
    lpsz_port : LibC::LPWSTR
    i_baud_rate : UInt32
    i_port_state : UInt32
    i_active : UInt32
  end
  struct HIGHCONTRASTA
    cb_size : UInt32
    dw_flags : HIGHCONTRASTW_FLAGS
    lpsz_default_scheme : PSTR
  end
  struct HIGHCONTRASTW
    cb_size : UInt32
    dw_flags : HIGHCONTRASTW_FLAGS
    lpsz_default_scheme : LibC::LPWSTR
  end
  struct FILTERKEYS
    cb_size : UInt32
    dw_flags : UInt32
    i_wait_m_sec : UInt32
    i_delay_m_sec : UInt32
    i_repeat_m_sec : UInt32
    i_bounce_m_sec : UInt32
  end
  struct STICKYKEYS
    cb_size : UInt32
    dw_flags : STICKYKEYS_FLAGS
  end
  struct MOUSEKEYS
    cb_size : UInt32
    dw_flags : UInt32
    i_max_speed : UInt32
    i_time_to_max_speed : UInt32
    i_ctrl_speed : UInt32
    dw_reserved1 : UInt32
    dw_reserved2 : UInt32
  end
  struct ACCESSTIMEOUT
    cb_size : UInt32
    dw_flags : UInt32
    i_time_out_m_sec : UInt32
  end
  struct SOUNDSENTRYA
    cb_size : UInt32
    dw_flags : SOUNDSENTRY_FLAGS
    i_fs_text_effect : SOUNDSENTRY_TEXT_EFFECT
    i_fs_text_effect_m_sec : UInt32
    i_fs_text_effect_color_bits : UInt32
    i_fs_graf_effect : SOUND_SENTRY_GRAPHICS_EFFECT
    i_fs_graf_effect_m_sec : UInt32
    i_fs_graf_effect_color : UInt32
    i_windows_effect : SOUNDSENTRY_WINDOWS_EFFECT
    i_windows_effect_m_sec : UInt32
    lpsz_windows_effect_dll : PSTR
    i_windows_effect_ordinal : UInt32
  end
  struct SOUNDSENTRYW
    cb_size : UInt32
    dw_flags : SOUNDSENTRY_FLAGS
    i_fs_text_effect : SOUNDSENTRY_TEXT_EFFECT
    i_fs_text_effect_m_sec : UInt32
    i_fs_text_effect_color_bits : UInt32
    i_fs_graf_effect : SOUND_SENTRY_GRAPHICS_EFFECT
    i_fs_graf_effect_m_sec : UInt32
    i_fs_graf_effect_color : UInt32
    i_windows_effect : SOUNDSENTRY_WINDOWS_EFFECT
    i_windows_effect_m_sec : UInt32
    lpsz_windows_effect_dll : LibC::LPWSTR
    i_windows_effect_ordinal : UInt32
  end
  struct TOGGLEKEYS
    cb_size : UInt32
    dw_flags : UInt32
  end


  struct IRicheditWindowlessAccessibilityVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_provider : UInt64
  end

  struct IRicheditWindowlessAccessibility
    lpVtbl : IRicheditWindowlessAccessibilityVTbl*
  end

  struct IRichEditUiaInformationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_boundary_rectangle : UInt64
    is_visible : UInt64
  end

  struct IRichEditUiaInformation
    lpVtbl : IRichEditUiaInformationVTbl*
  end

  struct IAccessibleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_type_info_count : UInt64
    get_type_info : UInt64
    get_i_ds_of_names : UInt64
    invoke : UInt64
    get_acc_parent : UInt64
    get_acc_child_count : UInt64
    get_acc_child : UInt64
    get_acc_name : UInt64
    get_acc_value : UInt64
    get_acc_description : UInt64
    get_acc_role : UInt64
    get_acc_state : UInt64
    get_acc_help : UInt64
    get_acc_help_topic : UInt64
    get_acc_keyboard_shortcut : UInt64
    get_acc_focus : UInt64
    get_acc_selection : UInt64
    get_acc_default_action : UInt64
    acc_select : UInt64
    acc_location : UInt64
    acc_navigate : UInt64
    acc_hit_test : UInt64
    acc_do_default_action : UInt64
    put_acc_name : UInt64
    put_acc_value : UInt64
  end

  IAccessible_GUID = "618736e0-3c3d-11cf-810c-00aa00389b71"
  IID_IAccessible = LibC::GUID.new(0x618736e0_u32, 0x3c3d_u16, 0x11cf_u16, StaticArray[0x81_u8, 0xc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x38_u8, 0x9b_u8, 0x71_u8])
  struct IAccessible
    lpVtbl : IAccessibleVTbl*
  end

  struct IAccessibleHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    accessible_object_from_id : UInt64
  end

  IAccessibleHandler_GUID = "03022430-abc4-11d0-bde2-00aa001a1953"
  IID_IAccessibleHandler = LibC::GUID.new(0x3022430_u32, 0xabc4_u16, 0x11d0_u16, StaticArray[0xbd_u8, 0xe2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x1a_u8, 0x19_u8, 0x53_u8])
  struct IAccessibleHandler
    lpVtbl : IAccessibleHandlerVTbl*
  end

  struct IAccessibleWindowlessSiteVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    acquire_object_id_range : UInt64
    release_object_id_range : UInt64
    query_object_id_ranges : UInt64
    get_parent_accessible : UInt64
  end

  IAccessibleWindowlessSite_GUID = "bf3abd9c-76da-4389-9eb6-1427d25abab7"
  IID_IAccessibleWindowlessSite = LibC::GUID.new(0xbf3abd9c_u32, 0x76da_u16, 0x4389_u16, StaticArray[0x9e_u8, 0xb6_u8, 0x14_u8, 0x27_u8, 0xd2_u8, 0x5a_u8, 0xba_u8, 0xb7_u8])
  struct IAccessibleWindowlessSite
    lpVtbl : IAccessibleWindowlessSiteVTbl*
  end

  struct IAccIdentityVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_identity_string : UInt64
  end

  IAccIdentity_GUID = "7852b78d-1cfd-41c1-a615-9c0c85960b5f"
  IID_IAccIdentity = LibC::GUID.new(0x7852b78d_u32, 0x1cfd_u16, 0x41c1_u16, StaticArray[0xa6_u8, 0x15_u8, 0x9c_u8, 0xc_u8, 0x85_u8, 0x96_u8, 0xb_u8, 0x5f_u8])
  struct IAccIdentity
    lpVtbl : IAccIdentityVTbl*
  end

  struct IAccPropServerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_prop_value : UInt64
  end

  IAccPropServer_GUID = "76c0dbbb-15e0-4e7b-b61b-20eeea2001e0"
  IID_IAccPropServer = LibC::GUID.new(0x76c0dbbb_u32, 0x15e0_u16, 0x4e7b_u16, StaticArray[0xb6_u8, 0x1b_u8, 0x20_u8, 0xee_u8, 0xea_u8, 0x20_u8, 0x1_u8, 0xe0_u8])
  struct IAccPropServer
    lpVtbl : IAccPropServerVTbl*
  end

  struct IAccPropServicesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_prop_value : UInt64
    set_prop_server : UInt64
    clear_props : UInt64
    set_hwnd_prop : UInt64
    set_hwnd_prop_str : UInt64
    set_hwnd_prop_server : UInt64
    clear_hwnd_props : UInt64
    compose_hwnd_identity_string : UInt64
    decompose_hwnd_identity_string : UInt64
    set_hmenu_prop : UInt64
    set_hmenu_prop_str : UInt64
    set_hmenu_prop_server : UInt64
    clear_hmenu_props : UInt64
    compose_hmenu_identity_string : UInt64
    decompose_hmenu_identity_string : UInt64
  end

  IAccPropServices_GUID = "6e26e776-04f0-495d-80e4-3330352e3169"
  IID_IAccPropServices = LibC::GUID.new(0x6e26e776_u32, 0x4f0_u16, 0x495d_u16, StaticArray[0x80_u8, 0xe4_u8, 0x33_u8, 0x30_u8, 0x35_u8, 0x2e_u8, 0x31_u8, 0x69_u8])
  struct IAccPropServices
    lpVtbl : IAccPropServicesVTbl*
  end

  struct IRawElementProviderSimpleVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_provider_options : UInt64
    get_pattern_provider : UInt64
    get_property_value : UInt64
    get_host_raw_element_provider : UInt64
  end

  IRawElementProviderSimple_GUID = "d6dd68d1-86fd-4332-8666-9abedea2d24c"
  IID_IRawElementProviderSimple = LibC::GUID.new(0xd6dd68d1_u32, 0x86fd_u16, 0x4332_u16, StaticArray[0x86_u8, 0x66_u8, 0x9a_u8, 0xbe_u8, 0xde_u8, 0xa2_u8, 0xd2_u8, 0x4c_u8])
  struct IRawElementProviderSimple
    lpVtbl : IRawElementProviderSimpleVTbl*
  end

  struct IAccessibleExVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_object_for_child : UInt64
    get_i_accessible_pair : UInt64
    get_runtime_id : UInt64
    convert_returned_element : UInt64
  end

  IAccessibleEx_GUID = "f8b80ada-2c44-48d0-89be-5ff23c9cd875"
  IID_IAccessibleEx = LibC::GUID.new(0xf8b80ada_u32, 0x2c44_u16, 0x48d0_u16, StaticArray[0x89_u8, 0xbe_u8, 0x5f_u8, 0xf2_u8, 0x3c_u8, 0x9c_u8, 0xd8_u8, 0x75_u8])
  struct IAccessibleEx
    lpVtbl : IAccessibleExVTbl*
  end

  struct IRawElementProviderSimple2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_provider_options : UInt64
    get_pattern_provider : UInt64
    get_property_value : UInt64
    get_host_raw_element_provider : UInt64
    show_context_menu : UInt64
  end

  IRawElementProviderSimple2_GUID = "a0a839a9-8da1-4a82-806a-8e0d44e79f56"
  IID_IRawElementProviderSimple2 = LibC::GUID.new(0xa0a839a9_u32, 0x8da1_u16, 0x4a82_u16, StaticArray[0x80_u8, 0x6a_u8, 0x8e_u8, 0xd_u8, 0x44_u8, 0xe7_u8, 0x9f_u8, 0x56_u8])
  struct IRawElementProviderSimple2
    lpVtbl : IRawElementProviderSimple2VTbl*
  end

  struct IRawElementProviderSimple3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_provider_options : UInt64
    get_pattern_provider : UInt64
    get_property_value : UInt64
    get_host_raw_element_provider : UInt64
    show_context_menu : UInt64
    get_metadata_value : UInt64
  end

  IRawElementProviderSimple3_GUID = "fcf5d820-d7ec-4613-bdf6-42a84ce7daaf"
  IID_IRawElementProviderSimple3 = LibC::GUID.new(0xfcf5d820_u32, 0xd7ec_u16, 0x4613_u16, StaticArray[0xbd_u8, 0xf6_u8, 0x42_u8, 0xa8_u8, 0x4c_u8, 0xe7_u8, 0xda_u8, 0xaf_u8])
  struct IRawElementProviderSimple3
    lpVtbl : IRawElementProviderSimple3VTbl*
  end

  struct IRawElementProviderFragmentRootVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    element_provider_from_point : UInt64
    get_focus : UInt64
  end

  IRawElementProviderFragmentRoot_GUID = "620ce2a5-ab8f-40a9-86cb-de3c75599b58"
  IID_IRawElementProviderFragmentRoot = LibC::GUID.new(0x620ce2a5_u32, 0xab8f_u16, 0x40a9_u16, StaticArray[0x86_u8, 0xcb_u8, 0xde_u8, 0x3c_u8, 0x75_u8, 0x59_u8, 0x9b_u8, 0x58_u8])
  struct IRawElementProviderFragmentRoot
    lpVtbl : IRawElementProviderFragmentRootVTbl*
  end

  struct IRawElementProviderFragmentVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    navigate : UInt64
    get_runtime_id : UInt64
    get_bounding_rectangle : UInt64
    get_embedded_fragment_roots : UInt64
    set_focus : UInt64
    get_fragment_root : UInt64
  end

  IRawElementProviderFragment_GUID = "f7063da8-8359-439c-9297-bbc5299a7d87"
  IID_IRawElementProviderFragment = LibC::GUID.new(0xf7063da8_u32, 0x8359_u16, 0x439c_u16, StaticArray[0x92_u8, 0x97_u8, 0xbb_u8, 0xc5_u8, 0x29_u8, 0x9a_u8, 0x7d_u8, 0x87_u8])
  struct IRawElementProviderFragment
    lpVtbl : IRawElementProviderFragmentVTbl*
  end

  struct IRawElementProviderAdviseEventsVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    advise_event_added : UInt64
    advise_event_removed : UInt64
  end

  IRawElementProviderAdviseEvents_GUID = "a407b27b-0f6d-4427-9292-473c7bf93258"
  IID_IRawElementProviderAdviseEvents = LibC::GUID.new(0xa407b27b_u32, 0xf6d_u16, 0x4427_u16, StaticArray[0x92_u8, 0x92_u8, 0x47_u8, 0x3c_u8, 0x7b_u8, 0xf9_u8, 0x32_u8, 0x58_u8])
  struct IRawElementProviderAdviseEvents
    lpVtbl : IRawElementProviderAdviseEventsVTbl*
  end

  struct IRawElementProviderHwndOverrideVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_override_provider_for_hwnd : UInt64
  end

  IRawElementProviderHwndOverride_GUID = "1d5df27c-8947-4425-b8d9-79787bb460b8"
  IID_IRawElementProviderHwndOverride = LibC::GUID.new(0x1d5df27c_u32, 0x8947_u16, 0x4425_u16, StaticArray[0xb8_u8, 0xd9_u8, 0x79_u8, 0x78_u8, 0x7b_u8, 0xb4_u8, 0x60_u8, 0xb8_u8])
  struct IRawElementProviderHwndOverride
    lpVtbl : IRawElementProviderHwndOverrideVTbl*
  end

  struct IProxyProviderWinEventSinkVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_automation_property_changed_event : UInt64
    add_automation_event : UInt64
    add_structure_changed_event : UInt64
  end

  IProxyProviderWinEventSink_GUID = "4fd82b78-a43e-46ac-9803-0a6969c7c183"
  IID_IProxyProviderWinEventSink = LibC::GUID.new(0x4fd82b78_u32, 0xa43e_u16, 0x46ac_u16, StaticArray[0x98_u8, 0x3_u8, 0xa_u8, 0x69_u8, 0x69_u8, 0xc7_u8, 0xc1_u8, 0x83_u8])
  struct IProxyProviderWinEventSink
    lpVtbl : IProxyProviderWinEventSinkVTbl*
  end

  struct IProxyProviderWinEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    respond_to_win_event : UInt64
  end

  IProxyProviderWinEventHandler_GUID = "89592ad4-f4e0-43d5-a3b6-bad7e111b435"
  IID_IProxyProviderWinEventHandler = LibC::GUID.new(0x89592ad4_u32, 0xf4e0_u16, 0x43d5_u16, StaticArray[0xa3_u8, 0xb6_u8, 0xba_u8, 0xd7_u8, 0xe1_u8, 0x11_u8, 0xb4_u8, 0x35_u8])
  struct IProxyProviderWinEventHandler
    lpVtbl : IProxyProviderWinEventHandlerVTbl*
  end

  struct IRawElementProviderWindowlessSiteVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_adjacent_fragment : UInt64
    get_runtime_id_prefix : UInt64
  end

  IRawElementProviderWindowlessSite_GUID = "0a2a93cc-bfad-42ac-9b2e-0991fb0d3ea0"
  IID_IRawElementProviderWindowlessSite = LibC::GUID.new(0xa2a93cc_u32, 0xbfad_u16, 0x42ac_u16, StaticArray[0x9b_u8, 0x2e_u8, 0x9_u8, 0x91_u8, 0xfb_u8, 0xd_u8, 0x3e_u8, 0xa0_u8])
  struct IRawElementProviderWindowlessSite
    lpVtbl : IRawElementProviderWindowlessSiteVTbl*
  end

  struct IAccessibleHostingElementProvidersVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_embedded_fragment_roots : UInt64
    get_object_id_for_provider : UInt64
  end

  IAccessibleHostingElementProviders_GUID = "33ac331b-943e-4020-b295-db37784974a3"
  IID_IAccessibleHostingElementProviders = LibC::GUID.new(0x33ac331b_u32, 0x943e_u16, 0x4020_u16, StaticArray[0xb2_u8, 0x95_u8, 0xdb_u8, 0x37_u8, 0x78_u8, 0x49_u8, 0x74_u8, 0xa3_u8])
  struct IAccessibleHostingElementProviders
    lpVtbl : IAccessibleHostingElementProvidersVTbl*
  end

  struct IRawElementProviderHostingAccessiblesVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_embedded_accessibles : UInt64
  end

  IRawElementProviderHostingAccessibles_GUID = "24be0b07-d37d-487a-98cf-a13ed465e9b3"
  IID_IRawElementProviderHostingAccessibles = LibC::GUID.new(0x24be0b07_u32, 0xd37d_u16, 0x487a_u16, StaticArray[0x98_u8, 0xcf_u8, 0xa1_u8, 0x3e_u8, 0xd4_u8, 0x65_u8, 0xe9_u8, 0xb3_u8])
  struct IRawElementProviderHostingAccessibles
    lpVtbl : IRawElementProviderHostingAccessiblesVTbl*
  end

  struct IDockProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_dock_position : UInt64
    get_dock_position : UInt64
  end

  IDockProvider_GUID = "159bc72c-4ad3-485e-9637-d7052edf0146"
  IID_IDockProvider = LibC::GUID.new(0x159bc72c_u32, 0x4ad3_u16, 0x485e_u16, StaticArray[0x96_u8, 0x37_u8, 0xd7_u8, 0x5_u8, 0x2e_u8, 0xdf_u8, 0x1_u8, 0x46_u8])
  struct IDockProvider
    lpVtbl : IDockProviderVTbl*
  end

  struct IExpandCollapseProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    expand : UInt64
    collapse : UInt64
    get_expand_collapse_state : UInt64
  end

  IExpandCollapseProvider_GUID = "d847d3a5-cab0-4a98-8c32-ecb45c59ad24"
  IID_IExpandCollapseProvider = LibC::GUID.new(0xd847d3a5_u32, 0xcab0_u16, 0x4a98_u16, StaticArray[0x8c_u8, 0x32_u8, 0xec_u8, 0xb4_u8, 0x5c_u8, 0x59_u8, 0xad_u8, 0x24_u8])
  struct IExpandCollapseProvider
    lpVtbl : IExpandCollapseProviderVTbl*
  end

  struct IGridProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_item : UInt64
    get_row_count : UInt64
    get_column_count : UInt64
  end

  IGridProvider_GUID = "b17d6187-0907-464b-a168-0ef17a1572b1"
  IID_IGridProvider = LibC::GUID.new(0xb17d6187_u32, 0x907_u16, 0x464b_u16, StaticArray[0xa1_u8, 0x68_u8, 0xe_u8, 0xf1_u8, 0x7a_u8, 0x15_u8, 0x72_u8, 0xb1_u8])
  struct IGridProvider
    lpVtbl : IGridProviderVTbl*
  end

  struct IGridItemProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_row : UInt64
    get_column : UInt64
    get_row_span : UInt64
    get_column_span : UInt64
    get_containing_grid : UInt64
  end

  IGridItemProvider_GUID = "d02541f1-fb81-4d64-ae32-f520f8a6dbd1"
  IID_IGridItemProvider = LibC::GUID.new(0xd02541f1_u32, 0xfb81_u16, 0x4d64_u16, StaticArray[0xae_u8, 0x32_u8, 0xf5_u8, 0x20_u8, 0xf8_u8, 0xa6_u8, 0xdb_u8, 0xd1_u8])
  struct IGridItemProvider
    lpVtbl : IGridItemProviderVTbl*
  end

  struct IInvokeProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    invoke : UInt64
  end

  IInvokeProvider_GUID = "54fcb24b-e18e-47a2-b4d3-eccbe77599a2"
  IID_IInvokeProvider = LibC::GUID.new(0x54fcb24b_u32, 0xe18e_u16, 0x47a2_u16, StaticArray[0xb4_u8, 0xd3_u8, 0xec_u8, 0xcb_u8, 0xe7_u8, 0x75_u8, 0x99_u8, 0xa2_u8])
  struct IInvokeProvider
    lpVtbl : IInvokeProviderVTbl*
  end

  struct IMultipleViewProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_view_name : UInt64
    set_current_view : UInt64
    get_current_view : UInt64
    get_supported_views : UInt64
  end

  IMultipleViewProvider_GUID = "6278cab1-b556-4a1a-b4e0-418acc523201"
  IID_IMultipleViewProvider = LibC::GUID.new(0x6278cab1_u32, 0xb556_u16, 0x4a1a_u16, StaticArray[0xb4_u8, 0xe0_u8, 0x41_u8, 0x8a_u8, 0xcc_u8, 0x52_u8, 0x32_u8, 0x1_u8])
  struct IMultipleViewProvider
    lpVtbl : IMultipleViewProviderVTbl*
  end

  struct IRangeValueProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_value : UInt64
    get_value : UInt64
    get_is_read_only : UInt64
    get_maximum : UInt64
    get_minimum : UInt64
    get_large_change : UInt64
    get_small_change : UInt64
  end

  IRangeValueProvider_GUID = "36dc7aef-33e6-4691-afe1-2be7274b3d33"
  IID_IRangeValueProvider = LibC::GUID.new(0x36dc7aef_u32, 0x33e6_u16, 0x4691_u16, StaticArray[0xaf_u8, 0xe1_u8, 0x2b_u8, 0xe7_u8, 0x27_u8, 0x4b_u8, 0x3d_u8, 0x33_u8])
  struct IRangeValueProvider
    lpVtbl : IRangeValueProviderVTbl*
  end

  struct IScrollItemProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    scroll_into_view : UInt64
  end

  IScrollItemProvider_GUID = "2360c714-4bf1-4b26-ba65-9b21316127eb"
  IID_IScrollItemProvider = LibC::GUID.new(0x2360c714_u32, 0x4bf1_u16, 0x4b26_u16, StaticArray[0xba_u8, 0x65_u8, 0x9b_u8, 0x21_u8, 0x31_u8, 0x61_u8, 0x27_u8, 0xeb_u8])
  struct IScrollItemProvider
    lpVtbl : IScrollItemProviderVTbl*
  end

  struct ISelectionProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_selection : UInt64
    get_can_select_multiple : UInt64
    get_is_selection_required : UInt64
  end

  ISelectionProvider_GUID = "fb8b03af-3bdf-48d4-bd36-1a65793be168"
  IID_ISelectionProvider = LibC::GUID.new(0xfb8b03af_u32, 0x3bdf_u16, 0x48d4_u16, StaticArray[0xbd_u8, 0x36_u8, 0x1a_u8, 0x65_u8, 0x79_u8, 0x3b_u8, 0xe1_u8, 0x68_u8])
  struct ISelectionProvider
    lpVtbl : ISelectionProviderVTbl*
  end

  struct ISelectionProvider2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_selection : UInt64
    get_can_select_multiple : UInt64
    get_is_selection_required : UInt64
    get_first_selected_item : UInt64
    get_last_selected_item : UInt64
    get_current_selected_item : UInt64
    get_item_count : UInt64
  end

  ISelectionProvider2_GUID = "14f68475-ee1c-44f6-a869-d239381f0fe7"
  IID_ISelectionProvider2 = LibC::GUID.new(0x14f68475_u32, 0xee1c_u16, 0x44f6_u16, StaticArray[0xa8_u8, 0x69_u8, 0xd2_u8, 0x39_u8, 0x38_u8, 0x1f_u8, 0xf_u8, 0xe7_u8])
  struct ISelectionProvider2
    lpVtbl : ISelectionProvider2VTbl*
  end

  struct IScrollProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    scroll : UInt64
    set_scroll_percent : UInt64
    get_horizontal_scroll_percent : UInt64
    get_vertical_scroll_percent : UInt64
    get_horizontal_view_size : UInt64
    get_vertical_view_size : UInt64
    get_horizontally_scrollable : UInt64
    get_vertically_scrollable : UInt64
  end

  IScrollProvider_GUID = "b38b8077-1fc3-42a5-8cae-d40c2215055a"
  IID_IScrollProvider = LibC::GUID.new(0xb38b8077_u32, 0x1fc3_u16, 0x42a5_u16, StaticArray[0x8c_u8, 0xae_u8, 0xd4_u8, 0xc_u8, 0x22_u8, 0x15_u8, 0x5_u8, 0x5a_u8])
  struct IScrollProvider
    lpVtbl : IScrollProviderVTbl*
  end

  struct ISelectionItemProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    select : UInt64
    add_to_selection : UInt64
    remove_from_selection : UInt64
    get_is_selected : UInt64
    get_selection_container : UInt64
  end

  ISelectionItemProvider_GUID = "2acad808-b2d4-452d-a407-91ff1ad167b2"
  IID_ISelectionItemProvider = LibC::GUID.new(0x2acad808_u32, 0xb2d4_u16, 0x452d_u16, StaticArray[0xa4_u8, 0x7_u8, 0x91_u8, 0xff_u8, 0x1a_u8, 0xd1_u8, 0x67_u8, 0xb2_u8])
  struct ISelectionItemProvider
    lpVtbl : ISelectionItemProviderVTbl*
  end

  struct ISynchronizedInputProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    start_listening : UInt64
    cancel : UInt64
  end

  ISynchronizedInputProvider_GUID = "29db1a06-02ce-4cf7-9b42-565d4fab20ee"
  IID_ISynchronizedInputProvider = LibC::GUID.new(0x29db1a06_u32, 0x2ce_u16, 0x4cf7_u16, StaticArray[0x9b_u8, 0x42_u8, 0x56_u8, 0x5d_u8, 0x4f_u8, 0xab_u8, 0x20_u8, 0xee_u8])
  struct ISynchronizedInputProvider
    lpVtbl : ISynchronizedInputProviderVTbl*
  end

  struct ITableProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_row_headers : UInt64
    get_column_headers : UInt64
    get_row_or_column_major : UInt64
  end

  ITableProvider_GUID = "9c860395-97b3-490a-b52a-858cc22af166"
  IID_ITableProvider = LibC::GUID.new(0x9c860395_u32, 0x97b3_u16, 0x490a_u16, StaticArray[0xb5_u8, 0x2a_u8, 0x85_u8, 0x8c_u8, 0xc2_u8, 0x2a_u8, 0xf1_u8, 0x66_u8])
  struct ITableProvider
    lpVtbl : ITableProviderVTbl*
  end

  struct ITableItemProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_row_header_items : UInt64
    get_column_header_items : UInt64
  end

  ITableItemProvider_GUID = "b9734fa6-771f-4d78-9c90-2517999349cd"
  IID_ITableItemProvider = LibC::GUID.new(0xb9734fa6_u32, 0x771f_u16, 0x4d78_u16, StaticArray[0x9c_u8, 0x90_u8, 0x25_u8, 0x17_u8, 0x99_u8, 0x93_u8, 0x49_u8, 0xcd_u8])
  struct ITableItemProvider
    lpVtbl : ITableItemProviderVTbl*
  end

  struct IToggleProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    toggle : UInt64
    get_toggle_state : UInt64
  end

  IToggleProvider_GUID = "56d00bd0-c4f4-433c-a836-1a52a57e0892"
  IID_IToggleProvider = LibC::GUID.new(0x56d00bd0_u32, 0xc4f4_u16, 0x433c_u16, StaticArray[0xa8_u8, 0x36_u8, 0x1a_u8, 0x52_u8, 0xa5_u8, 0x7e_u8, 0x8_u8, 0x92_u8])
  struct IToggleProvider
    lpVtbl : IToggleProviderVTbl*
  end

  struct ITransformProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    move : UInt64
    resize : UInt64
    rotate : UInt64
    get_can_move : UInt64
    get_can_resize : UInt64
    get_can_rotate : UInt64
  end

  ITransformProvider_GUID = "6829ddc4-4f91-4ffa-b86f-bd3e2987cb4c"
  IID_ITransformProvider = LibC::GUID.new(0x6829ddc4_u32, 0x4f91_u16, 0x4ffa_u16, StaticArray[0xb8_u8, 0x6f_u8, 0xbd_u8, 0x3e_u8, 0x29_u8, 0x87_u8, 0xcb_u8, 0x4c_u8])
  struct ITransformProvider
    lpVtbl : ITransformProviderVTbl*
  end

  struct IValueProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_value : UInt64
    get_value : UInt64
    get_is_read_only : UInt64
  end

  IValueProvider_GUID = "c7935180-6fb3-4201-b174-7df73adbf64a"
  IID_IValueProvider = LibC::GUID.new(0xc7935180_u32, 0x6fb3_u16, 0x4201_u16, StaticArray[0xb1_u8, 0x74_u8, 0x7d_u8, 0xf7_u8, 0x3a_u8, 0xdb_u8, 0xf6_u8, 0x4a_u8])
  struct IValueProvider
    lpVtbl : IValueProviderVTbl*
  end

  struct IWindowProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_visual_state : UInt64
    close : UInt64
    wait_for_input_idle : UInt64
    get_can_maximize : UInt64
    get_can_minimize : UInt64
    get_is_modal : UInt64
    get_window_visual_state : UInt64
    get_window_interaction_state : UInt64
    get_is_topmost : UInt64
  end

  IWindowProvider_GUID = "987df77b-db06-4d77-8f8a-86a9c3bb90b9"
  IID_IWindowProvider = LibC::GUID.new(0x987df77b_u32, 0xdb06_u16, 0x4d77_u16, StaticArray[0x8f_u8, 0x8a_u8, 0x86_u8, 0xa9_u8, 0xc3_u8, 0xbb_u8, 0x90_u8, 0xb9_u8])
  struct IWindowProvider
    lpVtbl : IWindowProviderVTbl*
  end

  struct ILegacyIAccessibleProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    select : UInt64
    do_default_action : UInt64
    set_value : UInt64
    get_i_accessible : UInt64
    get_child_id : UInt64
    get_name : UInt64
    get_value : UInt64
    get_description : UInt64
    get_role : UInt64
    get_state : UInt64
    get_help : UInt64
    get_keyboard_shortcut : UInt64
    get_selection : UInt64
    get_default_action : UInt64
  end

  ILegacyIAccessibleProvider_GUID = "e44c3566-915d-4070-99c6-047bff5a08f5"
  IID_ILegacyIAccessibleProvider = LibC::GUID.new(0xe44c3566_u32, 0x915d_u16, 0x4070_u16, StaticArray[0x99_u8, 0xc6_u8, 0x4_u8, 0x7b_u8, 0xff_u8, 0x5a_u8, 0x8_u8, 0xf5_u8])
  struct ILegacyIAccessibleProvider
    lpVtbl : ILegacyIAccessibleProviderVTbl*
  end

  struct IItemContainerProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    find_item_by_property : UInt64
  end

  IItemContainerProvider_GUID = "e747770b-39ce-4382-ab30-d8fb3f336f24"
  IID_IItemContainerProvider = LibC::GUID.new(0xe747770b_u32, 0x39ce_u16, 0x4382_u16, StaticArray[0xab_u8, 0x30_u8, 0xd8_u8, 0xfb_u8, 0x3f_u8, 0x33_u8, 0x6f_u8, 0x24_u8])
  struct IItemContainerProvider
    lpVtbl : IItemContainerProviderVTbl*
  end

  struct IVirtualizedItemProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    realize : UInt64
  end

  IVirtualizedItemProvider_GUID = "cb98b665-2d35-4fac-ad35-f3c60d0c0b8b"
  IID_IVirtualizedItemProvider = LibC::GUID.new(0xcb98b665_u32, 0x2d35_u16, 0x4fac_u16, StaticArray[0xad_u8, 0x35_u8, 0xf3_u8, 0xc6_u8, 0xd_u8, 0xc_u8, 0xb_u8, 0x8b_u8])
  struct IVirtualizedItemProvider
    lpVtbl : IVirtualizedItemProviderVTbl*
  end

  struct IObjectModelProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_underlying_object_model : UInt64
  end

  IObjectModelProvider_GUID = "3ad86ebd-f5ef-483d-bb18-b1042a475d64"
  IID_IObjectModelProvider = LibC::GUID.new(0x3ad86ebd_u32, 0xf5ef_u16, 0x483d_u16, StaticArray[0xbb_u8, 0x18_u8, 0xb1_u8, 0x4_u8, 0x2a_u8, 0x47_u8, 0x5d_u8, 0x64_u8])
  struct IObjectModelProvider
    lpVtbl : IObjectModelProviderVTbl*
  end

  struct IAnnotationProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_annotation_type_id : UInt64
    get_annotation_type_name : UInt64
    get_author : UInt64
    get_date_time : UInt64
    get_target : UInt64
  end

  IAnnotationProvider_GUID = "f95c7e80-bd63-4601-9782-445ebff011fc"
  IID_IAnnotationProvider = LibC::GUID.new(0xf95c7e80_u32, 0xbd63_u16, 0x4601_u16, StaticArray[0x97_u8, 0x82_u8, 0x44_u8, 0x5e_u8, 0xbf_u8, 0xf0_u8, 0x11_u8, 0xfc_u8])
  struct IAnnotationProvider
    lpVtbl : IAnnotationProviderVTbl*
  end

  struct IStylesProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_style_id : UInt64
    get_style_name : UInt64
    get_fill_color : UInt64
    get_fill_pattern_style : UInt64
    get_shape : UInt64
    get_fill_pattern_color : UInt64
    get_extended_properties : UInt64
  end

  IStylesProvider_GUID = "19b6b649-f5d7-4a6d-bdcb-129252be588a"
  IID_IStylesProvider = LibC::GUID.new(0x19b6b649_u32, 0xf5d7_u16, 0x4a6d_u16, StaticArray[0xbd_u8, 0xcb_u8, 0x12_u8, 0x92_u8, 0x52_u8, 0xbe_u8, 0x58_u8, 0x8a_u8])
  struct IStylesProvider
    lpVtbl : IStylesProviderVTbl*
  end

  struct ISpreadsheetProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_item_by_name : UInt64
  end

  ISpreadsheetProvider_GUID = "6f6b5d35-5525-4f80-b758-85473832ffc7"
  IID_ISpreadsheetProvider = LibC::GUID.new(0x6f6b5d35_u32, 0x5525_u16, 0x4f80_u16, StaticArray[0xb7_u8, 0x58_u8, 0x85_u8, 0x47_u8, 0x38_u8, 0x32_u8, 0xff_u8, 0xc7_u8])
  struct ISpreadsheetProvider
    lpVtbl : ISpreadsheetProviderVTbl*
  end

  struct ISpreadsheetItemProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_formula : UInt64
    get_annotation_objects : UInt64
    get_annotation_types : UInt64
  end

  ISpreadsheetItemProvider_GUID = "eaed4660-7b3d-4879-a2e6-365ce603f3d0"
  IID_ISpreadsheetItemProvider = LibC::GUID.new(0xeaed4660_u32, 0x7b3d_u16, 0x4879_u16, StaticArray[0xa2_u8, 0xe6_u8, 0x36_u8, 0x5c_u8, 0xe6_u8, 0x3_u8, 0xf3_u8, 0xd0_u8])
  struct ISpreadsheetItemProvider
    lpVtbl : ISpreadsheetItemProviderVTbl*
  end

  struct ITransformProvider2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    move : UInt64
    resize : UInt64
    rotate : UInt64
    get_can_move : UInt64
    get_can_resize : UInt64
    get_can_rotate : UInt64
    zoom : UInt64
    get_can_zoom : UInt64
    get_zoom_level : UInt64
    get_zoom_minimum : UInt64
    get_zoom_maximum : UInt64
    zoom_by_unit : UInt64
  end

  ITransformProvider2_GUID = "4758742f-7ac2-460c-bc48-09fc09308a93"
  IID_ITransformProvider2 = LibC::GUID.new(0x4758742f_u32, 0x7ac2_u16, 0x460c_u16, StaticArray[0xbc_u8, 0x48_u8, 0x9_u8, 0xfc_u8, 0x9_u8, 0x30_u8, 0x8a_u8, 0x93_u8])
  struct ITransformProvider2
    lpVtbl : ITransformProvider2VTbl*
  end

  struct IDragProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_is_grabbed : UInt64
    get_drop_effect : UInt64
    get_drop_effects : UInt64
    get_grabbed_items : UInt64
  end

  IDragProvider_GUID = "6aa7bbbb-7ff9-497d-904f-d20b897929d8"
  IID_IDragProvider = LibC::GUID.new(0x6aa7bbbb_u32, 0x7ff9_u16, 0x497d_u16, StaticArray[0x90_u8, 0x4f_u8, 0xd2_u8, 0xb_u8, 0x89_u8, 0x79_u8, 0x29_u8, 0xd8_u8])
  struct IDragProvider
    lpVtbl : IDragProviderVTbl*
  end

  struct IDropTargetProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_drop_target_effect : UInt64
    get_drop_target_effects : UInt64
  end

  IDropTargetProvider_GUID = "bae82bfd-358a-481c-85a0-d8b4d90a5d61"
  IID_IDropTargetProvider = LibC::GUID.new(0xbae82bfd_u32, 0x358a_u16, 0x481c_u16, StaticArray[0x85_u8, 0xa0_u8, 0xd8_u8, 0xb4_u8, 0xd9_u8, 0xa_u8, 0x5d_u8, 0x61_u8])
  struct IDropTargetProvider
    lpVtbl : IDropTargetProviderVTbl*
  end

  struct ITextRangeProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    compare : UInt64
    compare_endpoints : UInt64
    expand_to_enclosing_unit : UInt64
    find_attribute : UInt64
    find_text : UInt64
    get_attribute_value : UInt64
    get_bounding_rectangles : UInt64
    get_enclosing_element : UInt64
    get_text : UInt64
    move : UInt64
    move_endpoint_by_unit : UInt64
    move_endpoint_by_range : UInt64
    select : UInt64
    add_to_selection : UInt64
    remove_from_selection : UInt64
    scroll_into_view : UInt64
    get_children : UInt64
  end

  ITextRangeProvider_GUID = "5347ad7b-c355-46f8-aff5-909033582f63"
  IID_ITextRangeProvider = LibC::GUID.new(0x5347ad7b_u32, 0xc355_u16, 0x46f8_u16, StaticArray[0xaf_u8, 0xf5_u8, 0x90_u8, 0x90_u8, 0x33_u8, 0x58_u8, 0x2f_u8, 0x63_u8])
  struct ITextRangeProvider
    lpVtbl : ITextRangeProviderVTbl*
  end

  struct ITextProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_selection : UInt64
    get_visible_ranges : UInt64
    range_from_child : UInt64
    range_from_point : UInt64
    get_document_range : UInt64
    get_supported_text_selection : UInt64
  end

  ITextProvider_GUID = "3589c92c-63f3-4367-99bb-ada653b77cf2"
  IID_ITextProvider = LibC::GUID.new(0x3589c92c_u32, 0x63f3_u16, 0x4367_u16, StaticArray[0x99_u8, 0xbb_u8, 0xad_u8, 0xa6_u8, 0x53_u8, 0xb7_u8, 0x7c_u8, 0xf2_u8])
  struct ITextProvider
    lpVtbl : ITextProviderVTbl*
  end

  struct ITextProvider2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_selection : UInt64
    get_visible_ranges : UInt64
    range_from_child : UInt64
    range_from_point : UInt64
    get_document_range : UInt64
    get_supported_text_selection : UInt64
    range_from_annotation : UInt64
    get_caret_range : UInt64
  end

  ITextProvider2_GUID = "0dc5e6ed-3e16-4bf1-8f9a-a979878bc195"
  IID_ITextProvider2 = LibC::GUID.new(0xdc5e6ed_u32, 0x3e16_u16, 0x4bf1_u16, StaticArray[0x8f_u8, 0x9a_u8, 0xa9_u8, 0x79_u8, 0x87_u8, 0x8b_u8, 0xc1_u8, 0x95_u8])
  struct ITextProvider2
    lpVtbl : ITextProvider2VTbl*
  end

  struct ITextEditProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_selection : UInt64
    get_visible_ranges : UInt64
    range_from_child : UInt64
    range_from_point : UInt64
    get_document_range : UInt64
    get_supported_text_selection : UInt64
    get_active_composition : UInt64
    get_conversion_target : UInt64
  end

  ITextEditProvider_GUID = "ea3605b4-3a05-400e-b5f9-4e91b40f6176"
  IID_ITextEditProvider = LibC::GUID.new(0xea3605b4_u32, 0x3a05_u16, 0x400e_u16, StaticArray[0xb5_u8, 0xf9_u8, 0x4e_u8, 0x91_u8, 0xb4_u8, 0xf_u8, 0x61_u8, 0x76_u8])
  struct ITextEditProvider
    lpVtbl : ITextEditProviderVTbl*
  end

  struct ITextRangeProvider2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    compare : UInt64
    compare_endpoints : UInt64
    expand_to_enclosing_unit : UInt64
    find_attribute : UInt64
    find_text : UInt64
    get_attribute_value : UInt64
    get_bounding_rectangles : UInt64
    get_enclosing_element : UInt64
    get_text : UInt64
    move : UInt64
    move_endpoint_by_unit : UInt64
    move_endpoint_by_range : UInt64
    select : UInt64
    add_to_selection : UInt64
    remove_from_selection : UInt64
    scroll_into_view : UInt64
    get_children : UInt64
    show_context_menu : UInt64
  end

  ITextRangeProvider2_GUID = "9bbce42c-1921-4f18-89ca-dba1910a0386"
  IID_ITextRangeProvider2 = LibC::GUID.new(0x9bbce42c_u32, 0x1921_u16, 0x4f18_u16, StaticArray[0x89_u8, 0xca_u8, 0xdb_u8, 0xa1_u8, 0x91_u8, 0xa_u8, 0x3_u8, 0x86_u8])
  struct ITextRangeProvider2
    lpVtbl : ITextRangeProvider2VTbl*
  end

  struct ITextChildProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_text_container : UInt64
    get_text_range : UInt64
  end

  ITextChildProvider_GUID = "4c2de2b9-c88f-4f88-a111-f1d336b7d1a9"
  IID_ITextChildProvider = LibC::GUID.new(0x4c2de2b9_u32, 0xc88f_u16, 0x4f88_u16, StaticArray[0xa1_u8, 0x11_u8, 0xf1_u8, 0xd3_u8, 0x36_u8, 0xb7_u8, 0xd1_u8, 0xa9_u8])
  struct ITextChildProvider
    lpVtbl : ITextChildProviderVTbl*
  end

  struct ICustomNavigationProviderVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    navigate : UInt64
  end

  ICustomNavigationProvider_GUID = "2062a28a-8c07-4b94-8e12-7037c622aeb8"
  IID_ICustomNavigationProvider = LibC::GUID.new(0x2062a28a_u32, 0x8c07_u16, 0x4b94_u16, StaticArray[0x8e_u8, 0x12_u8, 0x70_u8, 0x37_u8, 0xc6_u8, 0x22_u8, 0xae_u8, 0xb8_u8])
  struct ICustomNavigationProvider
    lpVtbl : ICustomNavigationProviderVTbl*
  end

  struct IUIAutomationPatternInstanceVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property : UInt64
    call_method : UInt64
  end

  IUIAutomationPatternInstance_GUID = "c03a7fe4-9431-409f-bed8-ae7c2299bc8d"
  IID_IUIAutomationPatternInstance = LibC::GUID.new(0xc03a7fe4_u32, 0x9431_u16, 0x409f_u16, StaticArray[0xbe_u8, 0xd8_u8, 0xae_u8, 0x7c_u8, 0x22_u8, 0x99_u8, 0xbc_u8, 0x8d_u8])
  struct IUIAutomationPatternInstance
    lpVtbl : IUIAutomationPatternInstanceVTbl*
  end

  struct IUIAutomationPatternHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_client_wrapper : UInt64
    dispatch : UInt64
  end

  IUIAutomationPatternHandler_GUID = "d97022f3-a947-465e-8b2a-ac4315fa54e8"
  IID_IUIAutomationPatternHandler = LibC::GUID.new(0xd97022f3_u32, 0xa947_u16, 0x465e_u16, StaticArray[0x8b_u8, 0x2a_u8, 0xac_u8, 0x43_u8, 0x15_u8, 0xfa_u8, 0x54_u8, 0xe8_u8])
  struct IUIAutomationPatternHandler
    lpVtbl : IUIAutomationPatternHandlerVTbl*
  end

  struct IUIAutomationRegistrarVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    register_property : UInt64
    register_event : UInt64
    register_pattern : UInt64
  end

  IUIAutomationRegistrar_GUID = "8609c4ec-4a1a-4d88-a357-5a66e060e1cf"
  IID_IUIAutomationRegistrar = LibC::GUID.new(0x8609c4ec_u32, 0x4a1a_u16, 0x4d88_u16, StaticArray[0xa3_u8, 0x57_u8, 0x5a_u8, 0x66_u8, 0xe0_u8, 0x60_u8, 0xe1_u8, 0xcf_u8])
  struct IUIAutomationRegistrar
    lpVtbl : IUIAutomationRegistrarVTbl*
  end

  struct IUIAutomationElementVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_focus : UInt64
    get_runtime_id : UInt64
    find_first : UInt64
    find_all : UInt64
    find_first_build_cache : UInt64
    find_all_build_cache : UInt64
    build_updated_cache : UInt64
    get_current_property_value : UInt64
    get_current_property_value_ex : UInt64
    get_cached_property_value : UInt64
    get_cached_property_value_ex : UInt64
    get_current_pattern_as : UInt64
    get_cached_pattern_as : UInt64
    get_current_pattern : UInt64
    get_cached_pattern : UInt64
    get_cached_parent : UInt64
    get_cached_children : UInt64
    get_current_process_id : UInt64
    get_current_control_type : UInt64
    get_current_localized_control_type : UInt64
    get_current_name : UInt64
    get_current_accelerator_key : UInt64
    get_current_access_key : UInt64
    get_current_has_keyboard_focus : UInt64
    get_current_is_keyboard_focusable : UInt64
    get_current_is_enabled : UInt64
    get_current_automation_id : UInt64
    get_current_class_name : UInt64
    get_current_help_text : UInt64
    get_current_culture : UInt64
    get_current_is_control_element : UInt64
    get_current_is_content_element : UInt64
    get_current_is_password : UInt64
    get_current_native_window_handle : UInt64
    get_current_item_type : UInt64
    get_current_is_offscreen : UInt64
    get_current_orientation : UInt64
    get_current_framework_id : UInt64
    get_current_is_required_for_form : UInt64
    get_current_item_status : UInt64
    get_current_bounding_rectangle : UInt64
    get_current_labeled_by : UInt64
    get_current_aria_role : UInt64
    get_current_aria_properties : UInt64
    get_current_is_data_valid_for_form : UInt64
    get_current_controller_for : UInt64
    get_current_described_by : UInt64
    get_current_flows_to : UInt64
    get_current_provider_description : UInt64
    get_cached_process_id : UInt64
    get_cached_control_type : UInt64
    get_cached_localized_control_type : UInt64
    get_cached_name : UInt64
    get_cached_accelerator_key : UInt64
    get_cached_access_key : UInt64
    get_cached_has_keyboard_focus : UInt64
    get_cached_is_keyboard_focusable : UInt64
    get_cached_is_enabled : UInt64
    get_cached_automation_id : UInt64
    get_cached_class_name : UInt64
    get_cached_help_text : UInt64
    get_cached_culture : UInt64
    get_cached_is_control_element : UInt64
    get_cached_is_content_element : UInt64
    get_cached_is_password : UInt64
    get_cached_native_window_handle : UInt64
    get_cached_item_type : UInt64
    get_cached_is_offscreen : UInt64
    get_cached_orientation : UInt64
    get_cached_framework_id : UInt64
    get_cached_is_required_for_form : UInt64
    get_cached_item_status : UInt64
    get_cached_bounding_rectangle : UInt64
    get_cached_labeled_by : UInt64
    get_cached_aria_role : UInt64
    get_cached_aria_properties : UInt64
    get_cached_is_data_valid_for_form : UInt64
    get_cached_controller_for : UInt64
    get_cached_described_by : UInt64
    get_cached_flows_to : UInt64
    get_cached_provider_description : UInt64
    get_clickable_point : UInt64
  end

  IUIAutomationElement_GUID = "d22108aa-8ac5-49a5-837b-37bbb3d7591e"
  IID_IUIAutomationElement = LibC::GUID.new(0xd22108aa_u32, 0x8ac5_u16, 0x49a5_u16, StaticArray[0x83_u8, 0x7b_u8, 0x37_u8, 0xbb_u8, 0xb3_u8, 0xd7_u8, 0x59_u8, 0x1e_u8])
  struct IUIAutomationElement
    lpVtbl : IUIAutomationElementVTbl*
  end

  struct IUIAutomationElementArrayVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_length : UInt64
    get_element : UInt64
  end

  IUIAutomationElementArray_GUID = "14314595-b4bc-4055-95f2-58f2e42c9855"
  IID_IUIAutomationElementArray = LibC::GUID.new(0x14314595_u32, 0xb4bc_u16, 0x4055_u16, StaticArray[0x95_u8, 0xf2_u8, 0x58_u8, 0xf2_u8, 0xe4_u8, 0x2c_u8, 0x98_u8, 0x55_u8])
  struct IUIAutomationElementArray
    lpVtbl : IUIAutomationElementArrayVTbl*
  end

  struct IUIAutomationConditionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
  end

  IUIAutomationCondition_GUID = "352ffba8-0973-437c-a61f-f64cafd81df9"
  IID_IUIAutomationCondition = LibC::GUID.new(0x352ffba8_u32, 0x973_u16, 0x437c_u16, StaticArray[0xa6_u8, 0x1f_u8, 0xf6_u8, 0x4c_u8, 0xaf_u8, 0xd8_u8, 0x1d_u8, 0xf9_u8])
  struct IUIAutomationCondition
    lpVtbl : IUIAutomationConditionVTbl*
  end

  struct IUIAutomationBoolConditionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_boolean_value : UInt64
  end

  IUIAutomationBoolCondition_GUID = "1b4e1f2e-75eb-4d0b-8952-5a69988e2307"
  IID_IUIAutomationBoolCondition = LibC::GUID.new(0x1b4e1f2e_u32, 0x75eb_u16, 0x4d0b_u16, StaticArray[0x89_u8, 0x52_u8, 0x5a_u8, 0x69_u8, 0x98_u8, 0x8e_u8, 0x23_u8, 0x7_u8])
  struct IUIAutomationBoolCondition
    lpVtbl : IUIAutomationBoolConditionVTbl*
  end

  struct IUIAutomationPropertyConditionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_property_id : UInt64
    get_property_value : UInt64
    get_property_condition_flags : UInt64
  end

  IUIAutomationPropertyCondition_GUID = "99ebf2cb-5578-4267-9ad4-afd6ea77e94b"
  IID_IUIAutomationPropertyCondition = LibC::GUID.new(0x99ebf2cb_u32, 0x5578_u16, 0x4267_u16, StaticArray[0x9a_u8, 0xd4_u8, 0xaf_u8, 0xd6_u8, 0xea_u8, 0x77_u8, 0xe9_u8, 0x4b_u8])
  struct IUIAutomationPropertyCondition
    lpVtbl : IUIAutomationPropertyConditionVTbl*
  end

  struct IUIAutomationAndConditionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_child_count : UInt64
    get_children_as_native_array : UInt64
    get_children : UInt64
  end

  IUIAutomationAndCondition_GUID = "a7d0af36-b912-45fe-9855-091ddc174aec"
  IID_IUIAutomationAndCondition = LibC::GUID.new(0xa7d0af36_u32, 0xb912_u16, 0x45fe_u16, StaticArray[0x98_u8, 0x55_u8, 0x9_u8, 0x1d_u8, 0xdc_u8, 0x17_u8, 0x4a_u8, 0xec_u8])
  struct IUIAutomationAndCondition
    lpVtbl : IUIAutomationAndConditionVTbl*
  end

  struct IUIAutomationOrConditionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_child_count : UInt64
    get_children_as_native_array : UInt64
    get_children : UInt64
  end

  IUIAutomationOrCondition_GUID = "8753f032-3db1-47b5-a1fc-6e34a266c712"
  IID_IUIAutomationOrCondition = LibC::GUID.new(0x8753f032_u32, 0x3db1_u16, 0x47b5_u16, StaticArray[0xa1_u8, 0xfc_u8, 0x6e_u8, 0x34_u8, 0xa2_u8, 0x66_u8, 0xc7_u8, 0x12_u8])
  struct IUIAutomationOrCondition
    lpVtbl : IUIAutomationOrConditionVTbl*
  end

  struct IUIAutomationNotConditionVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_child : UInt64
  end

  IUIAutomationNotCondition_GUID = "f528b657-847b-498c-8896-d52b565407a1"
  IID_IUIAutomationNotCondition = LibC::GUID.new(0xf528b657_u32, 0x847b_u16, 0x498c_u16, StaticArray[0x88_u8, 0x96_u8, 0xd5_u8, 0x2b_u8, 0x56_u8, 0x54_u8, 0x7_u8, 0xa1_u8])
  struct IUIAutomationNotCondition
    lpVtbl : IUIAutomationNotConditionVTbl*
  end

  struct IUIAutomationCacheRequestVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_property : UInt64
    add_pattern : UInt64
    clone : UInt64
    get_tree_scope : UInt64
    put_tree_scope : UInt64
    get_tree_filter : UInt64
    put_tree_filter : UInt64
    get_automation_element_mode : UInt64
    put_automation_element_mode : UInt64
  end

  IUIAutomationCacheRequest_GUID = "b32a92b5-bc25-4078-9c08-d7ee95c48e03"
  IID_IUIAutomationCacheRequest = LibC::GUID.new(0xb32a92b5_u32, 0xbc25_u16, 0x4078_u16, StaticArray[0x9c_u8, 0x8_u8, 0xd7_u8, 0xee_u8, 0x95_u8, 0xc4_u8, 0x8e_u8, 0x3_u8])
  struct IUIAutomationCacheRequest
    lpVtbl : IUIAutomationCacheRequestVTbl*
  end

  struct IUIAutomationTreeWalkerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_parent_element : UInt64
    get_first_child_element : UInt64
    get_last_child_element : UInt64
    get_next_sibling_element : UInt64
    get_previous_sibling_element : UInt64
    normalize_element : UInt64
    get_parent_element_build_cache : UInt64
    get_first_child_element_build_cache : UInt64
    get_last_child_element_build_cache : UInt64
    get_next_sibling_element_build_cache : UInt64
    get_previous_sibling_element_build_cache : UInt64
    normalize_element_build_cache : UInt64
    get_condition : UInt64
  end

  IUIAutomationTreeWalker_GUID = "4042c624-389c-4afc-a630-9df854a541fc"
  IID_IUIAutomationTreeWalker = LibC::GUID.new(0x4042c624_u32, 0x389c_u16, 0x4afc_u16, StaticArray[0xa6_u8, 0x30_u8, 0x9d_u8, 0xf8_u8, 0x54_u8, 0xa5_u8, 0x41_u8, 0xfc_u8])
  struct IUIAutomationTreeWalker
    lpVtbl : IUIAutomationTreeWalkerVTbl*
  end

  struct IUIAutomationEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    handle_automation_event : UInt64
  end

  IUIAutomationEventHandler_GUID = "146c3c17-f12e-4e22-8c27-f894b9b79c69"
  IID_IUIAutomationEventHandler = LibC::GUID.new(0x146c3c17_u32, 0xf12e_u16, 0x4e22_u16, StaticArray[0x8c_u8, 0x27_u8, 0xf8_u8, 0x94_u8, 0xb9_u8, 0xb7_u8, 0x9c_u8, 0x69_u8])
  struct IUIAutomationEventHandler
    lpVtbl : IUIAutomationEventHandlerVTbl*
  end

  struct IUIAutomationPropertyChangedEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    handle_property_changed_event : UInt64
  end

  IUIAutomationPropertyChangedEventHandler_GUID = "40cd37d4-c756-4b0c-8c6f-bddfeeb13b50"
  IID_IUIAutomationPropertyChangedEventHandler = LibC::GUID.new(0x40cd37d4_u32, 0xc756_u16, 0x4b0c_u16, StaticArray[0x8c_u8, 0x6f_u8, 0xbd_u8, 0xdf_u8, 0xee_u8, 0xb1_u8, 0x3b_u8, 0x50_u8])
  struct IUIAutomationPropertyChangedEventHandler
    lpVtbl : IUIAutomationPropertyChangedEventHandlerVTbl*
  end

  struct IUIAutomationStructureChangedEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    handle_structure_changed_event : UInt64
  end

  IUIAutomationStructureChangedEventHandler_GUID = "e81d1b4e-11c5-42f8-9754-e7036c79f054"
  IID_IUIAutomationStructureChangedEventHandler = LibC::GUID.new(0xe81d1b4e_u32, 0x11c5_u16, 0x42f8_u16, StaticArray[0x97_u8, 0x54_u8, 0xe7_u8, 0x3_u8, 0x6c_u8, 0x79_u8, 0xf0_u8, 0x54_u8])
  struct IUIAutomationStructureChangedEventHandler
    lpVtbl : IUIAutomationStructureChangedEventHandlerVTbl*
  end

  struct IUIAutomationFocusChangedEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    handle_focus_changed_event : UInt64
  end

  IUIAutomationFocusChangedEventHandler_GUID = "c270f6b5-5c69-4290-9745-7a7f97169468"
  IID_IUIAutomationFocusChangedEventHandler = LibC::GUID.new(0xc270f6b5_u32, 0x5c69_u16, 0x4290_u16, StaticArray[0x97_u8, 0x45_u8, 0x7a_u8, 0x7f_u8, 0x97_u8, 0x16_u8, 0x94_u8, 0x68_u8])
  struct IUIAutomationFocusChangedEventHandler
    lpVtbl : IUIAutomationFocusChangedEventHandlerVTbl*
  end

  struct IUIAutomationTextEditTextChangedEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    handle_text_edit_text_changed_event : UInt64
  end

  IUIAutomationTextEditTextChangedEventHandler_GUID = "92faa680-e704-4156-931a-e32d5bb38f3f"
  IID_IUIAutomationTextEditTextChangedEventHandler = LibC::GUID.new(0x92faa680_u32, 0xe704_u16, 0x4156_u16, StaticArray[0x93_u8, 0x1a_u8, 0xe3_u8, 0x2d_u8, 0x5b_u8, 0xb3_u8, 0x8f_u8, 0x3f_u8])
  struct IUIAutomationTextEditTextChangedEventHandler
    lpVtbl : IUIAutomationTextEditTextChangedEventHandlerVTbl*
  end

  struct IUIAutomationChangesEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    handle_changes_event : UInt64
  end

  IUIAutomationChangesEventHandler_GUID = "58edca55-2c3e-4980-b1b9-56c17f27a2a0"
  IID_IUIAutomationChangesEventHandler = LibC::GUID.new(0x58edca55_u32, 0x2c3e_u16, 0x4980_u16, StaticArray[0xb1_u8, 0xb9_u8, 0x56_u8, 0xc1_u8, 0x7f_u8, 0x27_u8, 0xa2_u8, 0xa0_u8])
  struct IUIAutomationChangesEventHandler
    lpVtbl : IUIAutomationChangesEventHandlerVTbl*
  end

  struct IUIAutomationNotificationEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    handle_notification_event : UInt64
  end

  IUIAutomationNotificationEventHandler_GUID = "c7cb2637-e6c2-4d0c-85de-4948c02175c7"
  IID_IUIAutomationNotificationEventHandler = LibC::GUID.new(0xc7cb2637_u32, 0xe6c2_u16, 0x4d0c_u16, StaticArray[0x85_u8, 0xde_u8, 0x49_u8, 0x48_u8, 0xc0_u8, 0x21_u8, 0x75_u8, 0xc7_u8])
  struct IUIAutomationNotificationEventHandler
    lpVtbl : IUIAutomationNotificationEventHandlerVTbl*
  end

  struct IUIAutomationInvokePatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    invoke : UInt64
  end

  IUIAutomationInvokePattern_GUID = "fb377fbe-8ea6-46d5-9c73-6499642d3059"
  IID_IUIAutomationInvokePattern = LibC::GUID.new(0xfb377fbe_u32, 0x8ea6_u16, 0x46d5_u16, StaticArray[0x9c_u8, 0x73_u8, 0x64_u8, 0x99_u8, 0x64_u8, 0x2d_u8, 0x30_u8, 0x59_u8])
  struct IUIAutomationInvokePattern
    lpVtbl : IUIAutomationInvokePatternVTbl*
  end

  struct IUIAutomationDockPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_dock_position : UInt64
    get_current_dock_position : UInt64
    get_cached_dock_position : UInt64
  end

  IUIAutomationDockPattern_GUID = "fde5ef97-1464-48f6-90bf-43d0948e86ec"
  IID_IUIAutomationDockPattern = LibC::GUID.new(0xfde5ef97_u32, 0x1464_u16, 0x48f6_u16, StaticArray[0x90_u8, 0xbf_u8, 0x43_u8, 0xd0_u8, 0x94_u8, 0x8e_u8, 0x86_u8, 0xec_u8])
  struct IUIAutomationDockPattern
    lpVtbl : IUIAutomationDockPatternVTbl*
  end

  struct IUIAutomationExpandCollapsePatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    expand : UInt64
    collapse : UInt64
    get_current_expand_collapse_state : UInt64
    get_cached_expand_collapse_state : UInt64
  end

  IUIAutomationExpandCollapsePattern_GUID = "619be086-1f4e-4ee4-bafa-210128738730"
  IID_IUIAutomationExpandCollapsePattern = LibC::GUID.new(0x619be086_u32, 0x1f4e_u16, 0x4ee4_u16, StaticArray[0xba_u8, 0xfa_u8, 0x21_u8, 0x1_u8, 0x28_u8, 0x73_u8, 0x87_u8, 0x30_u8])
  struct IUIAutomationExpandCollapsePattern
    lpVtbl : IUIAutomationExpandCollapsePatternVTbl*
  end

  struct IUIAutomationGridPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_item : UInt64
    get_current_row_count : UInt64
    get_current_column_count : UInt64
    get_cached_row_count : UInt64
    get_cached_column_count : UInt64
  end

  IUIAutomationGridPattern_GUID = "414c3cdc-856b-4f5b-8538-3131c6302550"
  IID_IUIAutomationGridPattern = LibC::GUID.new(0x414c3cdc_u32, 0x856b_u16, 0x4f5b_u16, StaticArray[0x85_u8, 0x38_u8, 0x31_u8, 0x31_u8, 0xc6_u8, 0x30_u8, 0x25_u8, 0x50_u8])
  struct IUIAutomationGridPattern
    lpVtbl : IUIAutomationGridPatternVTbl*
  end

  struct IUIAutomationGridItemPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current_containing_grid : UInt64
    get_current_row : UInt64
    get_current_column : UInt64
    get_current_row_span : UInt64
    get_current_column_span : UInt64
    get_cached_containing_grid : UInt64
    get_cached_row : UInt64
    get_cached_column : UInt64
    get_cached_row_span : UInt64
    get_cached_column_span : UInt64
  end

  IUIAutomationGridItemPattern_GUID = "78f8ef57-66c3-4e09-bd7c-e79b2004894d"
  IID_IUIAutomationGridItemPattern = LibC::GUID.new(0x78f8ef57_u32, 0x66c3_u16, 0x4e09_u16, StaticArray[0xbd_u8, 0x7c_u8, 0xe7_u8, 0x9b_u8, 0x20_u8, 0x4_u8, 0x89_u8, 0x4d_u8])
  struct IUIAutomationGridItemPattern
    lpVtbl : IUIAutomationGridItemPatternVTbl*
  end

  struct IUIAutomationMultipleViewPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_view_name : UInt64
    set_current_view : UInt64
    get_current_current_view : UInt64
    get_current_supported_views : UInt64
    get_cached_current_view : UInt64
    get_cached_supported_views : UInt64
  end

  IUIAutomationMultipleViewPattern_GUID = "8d253c91-1dc5-4bb5-b18f-ade16fa495e8"
  IID_IUIAutomationMultipleViewPattern = LibC::GUID.new(0x8d253c91_u32, 0x1dc5_u16, 0x4bb5_u16, StaticArray[0xb1_u8, 0x8f_u8, 0xad_u8, 0xe1_u8, 0x6f_u8, 0xa4_u8, 0x95_u8, 0xe8_u8])
  struct IUIAutomationMultipleViewPattern
    lpVtbl : IUIAutomationMultipleViewPatternVTbl*
  end

  struct IUIAutomationObjectModelPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_underlying_object_model : UInt64
  end

  IUIAutomationObjectModelPattern_GUID = "71c284b3-c14d-4d14-981e-19751b0d756d"
  IID_IUIAutomationObjectModelPattern = LibC::GUID.new(0x71c284b3_u32, 0xc14d_u16, 0x4d14_u16, StaticArray[0x98_u8, 0x1e_u8, 0x19_u8, 0x75_u8, 0x1b_u8, 0xd_u8, 0x75_u8, 0x6d_u8])
  struct IUIAutomationObjectModelPattern
    lpVtbl : IUIAutomationObjectModelPatternVTbl*
  end

  struct IUIAutomationRangeValuePatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_value : UInt64
    get_current_value : UInt64
    get_current_is_read_only : UInt64
    get_current_maximum : UInt64
    get_current_minimum : UInt64
    get_current_large_change : UInt64
    get_current_small_change : UInt64
    get_cached_value : UInt64
    get_cached_is_read_only : UInt64
    get_cached_maximum : UInt64
    get_cached_minimum : UInt64
    get_cached_large_change : UInt64
    get_cached_small_change : UInt64
  end

  IUIAutomationRangeValuePattern_GUID = "59213f4f-7346-49e5-b120-80555987a148"
  IID_IUIAutomationRangeValuePattern = LibC::GUID.new(0x59213f4f_u32, 0x7346_u16, 0x49e5_u16, StaticArray[0xb1_u8, 0x20_u8, 0x80_u8, 0x55_u8, 0x59_u8, 0x87_u8, 0xa1_u8, 0x48_u8])
  struct IUIAutomationRangeValuePattern
    lpVtbl : IUIAutomationRangeValuePatternVTbl*
  end

  struct IUIAutomationScrollPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    scroll : UInt64
    set_scroll_percent : UInt64
    get_current_horizontal_scroll_percent : UInt64
    get_current_vertical_scroll_percent : UInt64
    get_current_horizontal_view_size : UInt64
    get_current_vertical_view_size : UInt64
    get_current_horizontally_scrollable : UInt64
    get_current_vertically_scrollable : UInt64
    get_cached_horizontal_scroll_percent : UInt64
    get_cached_vertical_scroll_percent : UInt64
    get_cached_horizontal_view_size : UInt64
    get_cached_vertical_view_size : UInt64
    get_cached_horizontally_scrollable : UInt64
    get_cached_vertically_scrollable : UInt64
  end

  IUIAutomationScrollPattern_GUID = "88f4d42a-e881-459d-a77c-73bbbb7e02dc"
  IID_IUIAutomationScrollPattern = LibC::GUID.new(0x88f4d42a_u32, 0xe881_u16, 0x459d_u16, StaticArray[0xa7_u8, 0x7c_u8, 0x73_u8, 0xbb_u8, 0xbb_u8, 0x7e_u8, 0x2_u8, 0xdc_u8])
  struct IUIAutomationScrollPattern
    lpVtbl : IUIAutomationScrollPatternVTbl*
  end

  struct IUIAutomationScrollItemPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    scroll_into_view : UInt64
  end

  IUIAutomationScrollItemPattern_GUID = "b488300f-d015-4f19-9c29-bb595e3645ef"
  IID_IUIAutomationScrollItemPattern = LibC::GUID.new(0xb488300f_u32, 0xd015_u16, 0x4f19_u16, StaticArray[0x9c_u8, 0x29_u8, 0xbb_u8, 0x59_u8, 0x5e_u8, 0x36_u8, 0x45_u8, 0xef_u8])
  struct IUIAutomationScrollItemPattern
    lpVtbl : IUIAutomationScrollItemPatternVTbl*
  end

  struct IUIAutomationSelectionPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current_selection : UInt64
    get_current_can_select_multiple : UInt64
    get_current_is_selection_required : UInt64
    get_cached_selection : UInt64
    get_cached_can_select_multiple : UInt64
    get_cached_is_selection_required : UInt64
  end

  IUIAutomationSelectionPattern_GUID = "5ed5202e-b2ac-47a6-b638-4b0bf140d78e"
  IID_IUIAutomationSelectionPattern = LibC::GUID.new(0x5ed5202e_u32, 0xb2ac_u16, 0x47a6_u16, StaticArray[0xb6_u8, 0x38_u8, 0x4b_u8, 0xb_u8, 0xf1_u8, 0x40_u8, 0xd7_u8, 0x8e_u8])
  struct IUIAutomationSelectionPattern
    lpVtbl : IUIAutomationSelectionPatternVTbl*
  end

  struct IUIAutomationSelectionPattern2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current_selection : UInt64
    get_current_can_select_multiple : UInt64
    get_current_is_selection_required : UInt64
    get_cached_selection : UInt64
    get_cached_can_select_multiple : UInt64
    get_cached_is_selection_required : UInt64
    get_current_first_selected_item : UInt64
    get_current_last_selected_item : UInt64
    get_current_current_selected_item : UInt64
    get_current_item_count : UInt64
    get_cached_first_selected_item : UInt64
    get_cached_last_selected_item : UInt64
    get_cached_current_selected_item : UInt64
    get_cached_item_count : UInt64
  end

  IUIAutomationSelectionPattern2_GUID = "0532bfae-c011-4e32-a343-6d642d798555"
  IID_IUIAutomationSelectionPattern2 = LibC::GUID.new(0x532bfae_u32, 0xc011_u16, 0x4e32_u16, StaticArray[0xa3_u8, 0x43_u8, 0x6d_u8, 0x64_u8, 0x2d_u8, 0x79_u8, 0x85_u8, 0x55_u8])
  struct IUIAutomationSelectionPattern2
    lpVtbl : IUIAutomationSelectionPattern2VTbl*
  end

  struct IUIAutomationSelectionItemPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    select : UInt64
    add_to_selection : UInt64
    remove_from_selection : UInt64
    get_current_is_selected : UInt64
    get_current_selection_container : UInt64
    get_cached_is_selected : UInt64
    get_cached_selection_container : UInt64
  end

  IUIAutomationSelectionItemPattern_GUID = "a8efa66a-0fda-421a-9194-38021f3578ea"
  IID_IUIAutomationSelectionItemPattern = LibC::GUID.new(0xa8efa66a_u32, 0xfda_u16, 0x421a_u16, StaticArray[0x91_u8, 0x94_u8, 0x38_u8, 0x2_u8, 0x1f_u8, 0x35_u8, 0x78_u8, 0xea_u8])
  struct IUIAutomationSelectionItemPattern
    lpVtbl : IUIAutomationSelectionItemPatternVTbl*
  end

  struct IUIAutomationSynchronizedInputPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    start_listening : UInt64
    cancel : UInt64
  end

  IUIAutomationSynchronizedInputPattern_GUID = "2233be0b-afb7-448b-9fda-3b378aa5eae1"
  IID_IUIAutomationSynchronizedInputPattern = LibC::GUID.new(0x2233be0b_u32, 0xafb7_u16, 0x448b_u16, StaticArray[0x9f_u8, 0xda_u8, 0x3b_u8, 0x37_u8, 0x8a_u8, 0xa5_u8, 0xea_u8, 0xe1_u8])
  struct IUIAutomationSynchronizedInputPattern
    lpVtbl : IUIAutomationSynchronizedInputPatternVTbl*
  end

  struct IUIAutomationTablePatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current_row_headers : UInt64
    get_current_column_headers : UInt64
    get_current_row_or_column_major : UInt64
    get_cached_row_headers : UInt64
    get_cached_column_headers : UInt64
    get_cached_row_or_column_major : UInt64
  end

  IUIAutomationTablePattern_GUID = "620e691c-ea96-4710-a850-754b24ce2417"
  IID_IUIAutomationTablePattern = LibC::GUID.new(0x620e691c_u32, 0xea96_u16, 0x4710_u16, StaticArray[0xa8_u8, 0x50_u8, 0x75_u8, 0x4b_u8, 0x24_u8, 0xce_u8, 0x24_u8, 0x17_u8])
  struct IUIAutomationTablePattern
    lpVtbl : IUIAutomationTablePatternVTbl*
  end

  struct IUIAutomationTableItemPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current_row_header_items : UInt64
    get_current_column_header_items : UInt64
    get_cached_row_header_items : UInt64
    get_cached_column_header_items : UInt64
  end

  IUIAutomationTableItemPattern_GUID = "0b964eb3-ef2e-4464-9c79-61d61737a27e"
  IID_IUIAutomationTableItemPattern = LibC::GUID.new(0xb964eb3_u32, 0xef2e_u16, 0x4464_u16, StaticArray[0x9c_u8, 0x79_u8, 0x61_u8, 0xd6_u8, 0x17_u8, 0x37_u8, 0xa2_u8, 0x7e_u8])
  struct IUIAutomationTableItemPattern
    lpVtbl : IUIAutomationTableItemPatternVTbl*
  end

  struct IUIAutomationTogglePatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    toggle : UInt64
    get_current_toggle_state : UInt64
    get_cached_toggle_state : UInt64
  end

  IUIAutomationTogglePattern_GUID = "94cf8058-9b8d-4ab9-8bfd-4cd0a33c8c70"
  IID_IUIAutomationTogglePattern = LibC::GUID.new(0x94cf8058_u32, 0x9b8d_u16, 0x4ab9_u16, StaticArray[0x8b_u8, 0xfd_u8, 0x4c_u8, 0xd0_u8, 0xa3_u8, 0x3c_u8, 0x8c_u8, 0x70_u8])
  struct IUIAutomationTogglePattern
    lpVtbl : IUIAutomationTogglePatternVTbl*
  end

  struct IUIAutomationTransformPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    move : UInt64
    resize : UInt64
    rotate : UInt64
    get_current_can_move : UInt64
    get_current_can_resize : UInt64
    get_current_can_rotate : UInt64
    get_cached_can_move : UInt64
    get_cached_can_resize : UInt64
    get_cached_can_rotate : UInt64
  end

  IUIAutomationTransformPattern_GUID = "a9b55844-a55d-4ef0-926d-569c16ff89bb"
  IID_IUIAutomationTransformPattern = LibC::GUID.new(0xa9b55844_u32, 0xa55d_u16, 0x4ef0_u16, StaticArray[0x92_u8, 0x6d_u8, 0x56_u8, 0x9c_u8, 0x16_u8, 0xff_u8, 0x89_u8, 0xbb_u8])
  struct IUIAutomationTransformPattern
    lpVtbl : IUIAutomationTransformPatternVTbl*
  end

  struct IUIAutomationValuePatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_value : UInt64
    get_current_value : UInt64
    get_current_is_read_only : UInt64
    get_cached_value : UInt64
    get_cached_is_read_only : UInt64
  end

  IUIAutomationValuePattern_GUID = "a94cd8b1-0844-4cd6-9d2d-640537ab39e9"
  IID_IUIAutomationValuePattern = LibC::GUID.new(0xa94cd8b1_u32, 0x844_u16, 0x4cd6_u16, StaticArray[0x9d_u8, 0x2d_u8, 0x64_u8, 0x5_u8, 0x37_u8, 0xab_u8, 0x39_u8, 0xe9_u8])
  struct IUIAutomationValuePattern
    lpVtbl : IUIAutomationValuePatternVTbl*
  end

  struct IUIAutomationWindowPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    close : UInt64
    wait_for_input_idle : UInt64
    set_window_visual_state : UInt64
    get_current_can_maximize : UInt64
    get_current_can_minimize : UInt64
    get_current_is_modal : UInt64
    get_current_is_topmost : UInt64
    get_current_window_visual_state : UInt64
    get_current_window_interaction_state : UInt64
    get_cached_can_maximize : UInt64
    get_cached_can_minimize : UInt64
    get_cached_is_modal : UInt64
    get_cached_is_topmost : UInt64
    get_cached_window_visual_state : UInt64
    get_cached_window_interaction_state : UInt64
  end

  IUIAutomationWindowPattern_GUID = "0faef453-9208-43ef-bbb2-3b485177864f"
  IID_IUIAutomationWindowPattern = LibC::GUID.new(0xfaef453_u32, 0x9208_u16, 0x43ef_u16, StaticArray[0xbb_u8, 0xb2_u8, 0x3b_u8, 0x48_u8, 0x51_u8, 0x77_u8, 0x86_u8, 0x4f_u8])
  struct IUIAutomationWindowPattern
    lpVtbl : IUIAutomationWindowPatternVTbl*
  end

  struct IUIAutomationTextRangeVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    compare : UInt64
    compare_endpoints : UInt64
    expand_to_enclosing_unit : UInt64
    find_attribute : UInt64
    find_text : UInt64
    get_attribute_value : UInt64
    get_bounding_rectangles : UInt64
    get_enclosing_element : UInt64
    get_text : UInt64
    move : UInt64
    move_endpoint_by_unit : UInt64
    move_endpoint_by_range : UInt64
    select : UInt64
    add_to_selection : UInt64
    remove_from_selection : UInt64
    scroll_into_view : UInt64
    get_children : UInt64
  end

  IUIAutomationTextRange_GUID = "a543cc6a-f4ae-494b-8239-c814481187a8"
  IID_IUIAutomationTextRange = LibC::GUID.new(0xa543cc6a_u32, 0xf4ae_u16, 0x494b_u16, StaticArray[0x82_u8, 0x39_u8, 0xc8_u8, 0x14_u8, 0x48_u8, 0x11_u8, 0x87_u8, 0xa8_u8])
  struct IUIAutomationTextRange
    lpVtbl : IUIAutomationTextRangeVTbl*
  end

  struct IUIAutomationTextRange2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    compare : UInt64
    compare_endpoints : UInt64
    expand_to_enclosing_unit : UInt64
    find_attribute : UInt64
    find_text : UInt64
    get_attribute_value : UInt64
    get_bounding_rectangles : UInt64
    get_enclosing_element : UInt64
    get_text : UInt64
    move : UInt64
    move_endpoint_by_unit : UInt64
    move_endpoint_by_range : UInt64
    select : UInt64
    add_to_selection : UInt64
    remove_from_selection : UInt64
    scroll_into_view : UInt64
    get_children : UInt64
    show_context_menu : UInt64
  end

  IUIAutomationTextRange2_GUID = "bb9b40e0-5e04-46bd-9be0-4b601b9afad4"
  IID_IUIAutomationTextRange2 = LibC::GUID.new(0xbb9b40e0_u32, 0x5e04_u16, 0x46bd_u16, StaticArray[0x9b_u8, 0xe0_u8, 0x4b_u8, 0x60_u8, 0x1b_u8, 0x9a_u8, 0xfa_u8, 0xd4_u8])
  struct IUIAutomationTextRange2
    lpVtbl : IUIAutomationTextRange2VTbl*
  end

  struct IUIAutomationTextRange3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    clone : UInt64
    compare : UInt64
    compare_endpoints : UInt64
    expand_to_enclosing_unit : UInt64
    find_attribute : UInt64
    find_text : UInt64
    get_attribute_value : UInt64
    get_bounding_rectangles : UInt64
    get_enclosing_element : UInt64
    get_text : UInt64
    move : UInt64
    move_endpoint_by_unit : UInt64
    move_endpoint_by_range : UInt64
    select : UInt64
    add_to_selection : UInt64
    remove_from_selection : UInt64
    scroll_into_view : UInt64
    get_children : UInt64
    show_context_menu : UInt64
    get_enclosing_element_build_cache : UInt64
    get_children_build_cache : UInt64
    get_attribute_values : UInt64
  end

  IUIAutomationTextRange3_GUID = "6a315d69-5512-4c2e-85f0-53fce6dd4bc2"
  IID_IUIAutomationTextRange3 = LibC::GUID.new(0x6a315d69_u32, 0x5512_u16, 0x4c2e_u16, StaticArray[0x85_u8, 0xf0_u8, 0x53_u8, 0xfc_u8, 0xe6_u8, 0xdd_u8, 0x4b_u8, 0xc2_u8])
  struct IUIAutomationTextRange3
    lpVtbl : IUIAutomationTextRange3VTbl*
  end

  struct IUIAutomationTextRangeArrayVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_length : UInt64
    get_element : UInt64
  end

  IUIAutomationTextRangeArray_GUID = "ce4ae76a-e717-4c98-81ea-47371d028eb6"
  IID_IUIAutomationTextRangeArray = LibC::GUID.new(0xce4ae76a_u32, 0xe717_u16, 0x4c98_u16, StaticArray[0x81_u8, 0xea_u8, 0x47_u8, 0x37_u8, 0x1d_u8, 0x2_u8, 0x8e_u8, 0xb6_u8])
  struct IUIAutomationTextRangeArray
    lpVtbl : IUIAutomationTextRangeArrayVTbl*
  end

  struct IUIAutomationTextPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    range_from_point : UInt64
    range_from_child : UInt64
    get_selection : UInt64
    get_visible_ranges : UInt64
    get_document_range : UInt64
    get_supported_text_selection : UInt64
  end

  IUIAutomationTextPattern_GUID = "32eba289-3583-42c9-9c59-3b6d9a1e9b6a"
  IID_IUIAutomationTextPattern = LibC::GUID.new(0x32eba289_u32, 0x3583_u16, 0x42c9_u16, StaticArray[0x9c_u8, 0x59_u8, 0x3b_u8, 0x6d_u8, 0x9a_u8, 0x1e_u8, 0x9b_u8, 0x6a_u8])
  struct IUIAutomationTextPattern
    lpVtbl : IUIAutomationTextPatternVTbl*
  end

  struct IUIAutomationTextPattern2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    range_from_point : UInt64
    range_from_child : UInt64
    get_selection : UInt64
    get_visible_ranges : UInt64
    get_document_range : UInt64
    get_supported_text_selection : UInt64
    range_from_annotation : UInt64
    get_caret_range : UInt64
  end

  IUIAutomationTextPattern2_GUID = "506a921a-fcc9-409f-b23b-37eb74106872"
  IID_IUIAutomationTextPattern2 = LibC::GUID.new(0x506a921a_u32, 0xfcc9_u16, 0x409f_u16, StaticArray[0xb2_u8, 0x3b_u8, 0x37_u8, 0xeb_u8, 0x74_u8, 0x10_u8, 0x68_u8, 0x72_u8])
  struct IUIAutomationTextPattern2
    lpVtbl : IUIAutomationTextPattern2VTbl*
  end

  struct IUIAutomationTextEditPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    range_from_point : UInt64
    range_from_child : UInt64
    get_selection : UInt64
    get_visible_ranges : UInt64
    get_document_range : UInt64
    get_supported_text_selection : UInt64
    get_active_composition : UInt64
    get_conversion_target : UInt64
  end

  IUIAutomationTextEditPattern_GUID = "17e21576-996c-4870-99d9-bff323380c06"
  IID_IUIAutomationTextEditPattern = LibC::GUID.new(0x17e21576_u32, 0x996c_u16, 0x4870_u16, StaticArray[0x99_u8, 0xd9_u8, 0xbf_u8, 0xf3_u8, 0x23_u8, 0x38_u8, 0xc_u8, 0x6_u8])
  struct IUIAutomationTextEditPattern
    lpVtbl : IUIAutomationTextEditPatternVTbl*
  end

  struct IUIAutomationCustomNavigationPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    navigate : UInt64
  end

  IUIAutomationCustomNavigationPattern_GUID = "01ea217a-1766-47ed-a6cc-acf492854b1f"
  IID_IUIAutomationCustomNavigationPattern = LibC::GUID.new(0x1ea217a_u32, 0x1766_u16, 0x47ed_u16, StaticArray[0xa6_u8, 0xcc_u8, 0xac_u8, 0xf4_u8, 0x92_u8, 0x85_u8, 0x4b_u8, 0x1f_u8])
  struct IUIAutomationCustomNavigationPattern
    lpVtbl : IUIAutomationCustomNavigationPatternVTbl*
  end

  struct IUIAutomationActiveTextPositionChangedEventHandlerVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    handle_active_text_position_changed_event : UInt64
  end

  IUIAutomationActiveTextPositionChangedEventHandler_GUID = "f97933b0-8dae-4496-8997-5ba015fe0d82"
  IID_IUIAutomationActiveTextPositionChangedEventHandler = LibC::GUID.new(0xf97933b0_u32, 0x8dae_u16, 0x4496_u16, StaticArray[0x89_u8, 0x97_u8, 0x5b_u8, 0xa0_u8, 0x15_u8, 0xfe_u8, 0xd_u8, 0x82_u8])
  struct IUIAutomationActiveTextPositionChangedEventHandler
    lpVtbl : IUIAutomationActiveTextPositionChangedEventHandlerVTbl*
  end

  struct IUIAutomationLegacyIAccessiblePatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    select : UInt64
    do_default_action : UInt64
    set_value : UInt64
    get_current_child_id : UInt64
    get_current_name : UInt64
    get_current_value : UInt64
    get_current_description : UInt64
    get_current_role : UInt64
    get_current_state : UInt64
    get_current_help : UInt64
    get_current_keyboard_shortcut : UInt64
    get_current_selection : UInt64
    get_current_default_action : UInt64
    get_cached_child_id : UInt64
    get_cached_name : UInt64
    get_cached_value : UInt64
    get_cached_description : UInt64
    get_cached_role : UInt64
    get_cached_state : UInt64
    get_cached_help : UInt64
    get_cached_keyboard_shortcut : UInt64
    get_cached_selection : UInt64
    get_cached_default_action : UInt64
    get_i_accessible : UInt64
  end

  IUIAutomationLegacyIAccessiblePattern_GUID = "828055ad-355b-4435-86d5-3b51c14a9b1b"
  IID_IUIAutomationLegacyIAccessiblePattern = LibC::GUID.new(0x828055ad_u32, 0x355b_u16, 0x4435_u16, StaticArray[0x86_u8, 0xd5_u8, 0x3b_u8, 0x51_u8, 0xc1_u8, 0x4a_u8, 0x9b_u8, 0x1b_u8])
  struct IUIAutomationLegacyIAccessiblePattern
    lpVtbl : IUIAutomationLegacyIAccessiblePatternVTbl*
  end

  struct IUIAutomationItemContainerPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    find_item_by_property : UInt64
  end

  IUIAutomationItemContainerPattern_GUID = "c690fdb2-27a8-423c-812d-429773c9084e"
  IID_IUIAutomationItemContainerPattern = LibC::GUID.new(0xc690fdb2_u32, 0x27a8_u16, 0x423c_u16, StaticArray[0x81_u8, 0x2d_u8, 0x42_u8, 0x97_u8, 0x73_u8, 0xc9_u8, 0x8_u8, 0x4e_u8])
  struct IUIAutomationItemContainerPattern
    lpVtbl : IUIAutomationItemContainerPatternVTbl*
  end

  struct IUIAutomationVirtualizedItemPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    realize : UInt64
  end

  IUIAutomationVirtualizedItemPattern_GUID = "6ba3d7a6-04cf-4f11-8793-a8d1cde9969f"
  IID_IUIAutomationVirtualizedItemPattern = LibC::GUID.new(0x6ba3d7a6_u32, 0x4cf_u16, 0x4f11_u16, StaticArray[0x87_u8, 0x93_u8, 0xa8_u8, 0xd1_u8, 0xcd_u8, 0xe9_u8, 0x96_u8, 0x9f_u8])
  struct IUIAutomationVirtualizedItemPattern
    lpVtbl : IUIAutomationVirtualizedItemPatternVTbl*
  end

  struct IUIAutomationAnnotationPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current_annotation_type_id : UInt64
    get_current_annotation_type_name : UInt64
    get_current_author : UInt64
    get_current_date_time : UInt64
    get_current_target : UInt64
    get_cached_annotation_type_id : UInt64
    get_cached_annotation_type_name : UInt64
    get_cached_author : UInt64
    get_cached_date_time : UInt64
    get_cached_target : UInt64
  end

  IUIAutomationAnnotationPattern_GUID = "9a175b21-339e-41b1-8e8b-623f6b681098"
  IID_IUIAutomationAnnotationPattern = LibC::GUID.new(0x9a175b21_u32, 0x339e_u16, 0x41b1_u16, StaticArray[0x8e_u8, 0x8b_u8, 0x62_u8, 0x3f_u8, 0x6b_u8, 0x68_u8, 0x10_u8, 0x98_u8])
  struct IUIAutomationAnnotationPattern
    lpVtbl : IUIAutomationAnnotationPatternVTbl*
  end

  struct IUIAutomationStylesPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current_style_id : UInt64
    get_current_style_name : UInt64
    get_current_fill_color : UInt64
    get_current_fill_pattern_style : UInt64
    get_current_shape : UInt64
    get_current_fill_pattern_color : UInt64
    get_current_extended_properties : UInt64
    get_current_extended_properties_as_array : UInt64
    get_cached_style_id : UInt64
    get_cached_style_name : UInt64
    get_cached_fill_color : UInt64
    get_cached_fill_pattern_style : UInt64
    get_cached_shape : UInt64
    get_cached_fill_pattern_color : UInt64
    get_cached_extended_properties : UInt64
    get_cached_extended_properties_as_array : UInt64
  end

  IUIAutomationStylesPattern_GUID = "85b5f0a2-bd79-484a-ad2b-388c9838d5fb"
  IID_IUIAutomationStylesPattern = LibC::GUID.new(0x85b5f0a2_u32, 0xbd79_u16, 0x484a_u16, StaticArray[0xad_u8, 0x2b_u8, 0x38_u8, 0x8c_u8, 0x98_u8, 0x38_u8, 0xd5_u8, 0xfb_u8])
  struct IUIAutomationStylesPattern
    lpVtbl : IUIAutomationStylesPatternVTbl*
  end

  struct IUIAutomationSpreadsheetPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_item_by_name : UInt64
  end

  IUIAutomationSpreadsheetPattern_GUID = "7517a7c8-faae-4de9-9f08-29b91e8595c1"
  IID_IUIAutomationSpreadsheetPattern = LibC::GUID.new(0x7517a7c8_u32, 0xfaae_u16, 0x4de9_u16, StaticArray[0x9f_u8, 0x8_u8, 0x29_u8, 0xb9_u8, 0x1e_u8, 0x85_u8, 0x95_u8, 0xc1_u8])
  struct IUIAutomationSpreadsheetPattern
    lpVtbl : IUIAutomationSpreadsheetPatternVTbl*
  end

  struct IUIAutomationSpreadsheetItemPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current_formula : UInt64
    get_current_annotation_objects : UInt64
    get_current_annotation_types : UInt64
    get_cached_formula : UInt64
    get_cached_annotation_objects : UInt64
    get_cached_annotation_types : UInt64
  end

  IUIAutomationSpreadsheetItemPattern_GUID = "7d4fb86c-8d34-40e1-8e83-62c15204e335"
  IID_IUIAutomationSpreadsheetItemPattern = LibC::GUID.new(0x7d4fb86c_u32, 0x8d34_u16, 0x40e1_u16, StaticArray[0x8e_u8, 0x83_u8, 0x62_u8, 0xc1_u8, 0x52_u8, 0x4_u8, 0xe3_u8, 0x35_u8])
  struct IUIAutomationSpreadsheetItemPattern
    lpVtbl : IUIAutomationSpreadsheetItemPatternVTbl*
  end

  struct IUIAutomationTransformPattern2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    move : UInt64
    resize : UInt64
    rotate : UInt64
    get_current_can_move : UInt64
    get_current_can_resize : UInt64
    get_current_can_rotate : UInt64
    get_cached_can_move : UInt64
    get_cached_can_resize : UInt64
    get_cached_can_rotate : UInt64
    zoom : UInt64
    zoom_by_unit : UInt64
    get_current_can_zoom : UInt64
    get_cached_can_zoom : UInt64
    get_current_zoom_level : UInt64
    get_cached_zoom_level : UInt64
    get_current_zoom_minimum : UInt64
    get_cached_zoom_minimum : UInt64
    get_current_zoom_maximum : UInt64
    get_cached_zoom_maximum : UInt64
  end

  IUIAutomationTransformPattern2_GUID = "6d74d017-6ecb-4381-b38b-3c17a48ff1c2"
  IID_IUIAutomationTransformPattern2 = LibC::GUID.new(0x6d74d017_u32, 0x6ecb_u16, 0x4381_u16, StaticArray[0xb3_u8, 0x8b_u8, 0x3c_u8, 0x17_u8, 0xa4_u8, 0x8f_u8, 0xf1_u8, 0xc2_u8])
  struct IUIAutomationTransformPattern2
    lpVtbl : IUIAutomationTransformPattern2VTbl*
  end

  struct IUIAutomationTextChildPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_text_container : UInt64
    get_text_range : UInt64
  end

  IUIAutomationTextChildPattern_GUID = "6552b038-ae05-40c8-abfd-aa08352aab86"
  IID_IUIAutomationTextChildPattern = LibC::GUID.new(0x6552b038_u32, 0xae05_u16, 0x40c8_u16, StaticArray[0xab_u8, 0xfd_u8, 0xaa_u8, 0x8_u8, 0x35_u8, 0x2a_u8, 0xab_u8, 0x86_u8])
  struct IUIAutomationTextChildPattern
    lpVtbl : IUIAutomationTextChildPatternVTbl*
  end

  struct IUIAutomationDragPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current_is_grabbed : UInt64
    get_cached_is_grabbed : UInt64
    get_current_drop_effect : UInt64
    get_cached_drop_effect : UInt64
    get_current_drop_effects : UInt64
    get_cached_drop_effects : UInt64
    get_current_grabbed_items : UInt64
    get_cached_grabbed_items : UInt64
  end

  IUIAutomationDragPattern_GUID = "1dc7b570-1f54-4bad-bcda-d36a722fb7bd"
  IID_IUIAutomationDragPattern = LibC::GUID.new(0x1dc7b570_u32, 0x1f54_u16, 0x4bad_u16, StaticArray[0xbc_u8, 0xda_u8, 0xd3_u8, 0x6a_u8, 0x72_u8, 0x2f_u8, 0xb7_u8, 0xbd_u8])
  struct IUIAutomationDragPattern
    lpVtbl : IUIAutomationDragPatternVTbl*
  end

  struct IUIAutomationDropTargetPatternVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_current_drop_target_effect : UInt64
    get_cached_drop_target_effect : UInt64
    get_current_drop_target_effects : UInt64
    get_cached_drop_target_effects : UInt64
  end

  IUIAutomationDropTargetPattern_GUID = "69a095f7-eee4-430e-a46b-fb73b1ae39a5"
  IID_IUIAutomationDropTargetPattern = LibC::GUID.new(0x69a095f7_u32, 0xeee4_u16, 0x430e_u16, StaticArray[0xa4_u8, 0x6b_u8, 0xfb_u8, 0x73_u8, 0xb1_u8, 0xae_u8, 0x39_u8, 0xa5_u8])
  struct IUIAutomationDropTargetPattern
    lpVtbl : IUIAutomationDropTargetPatternVTbl*
  end

  struct IUIAutomationElement2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_focus : UInt64
    get_runtime_id : UInt64
    find_first : UInt64
    find_all : UInt64
    find_first_build_cache : UInt64
    find_all_build_cache : UInt64
    build_updated_cache : UInt64
    get_current_property_value : UInt64
    get_current_property_value_ex : UInt64
    get_cached_property_value : UInt64
    get_cached_property_value_ex : UInt64
    get_current_pattern_as : UInt64
    get_cached_pattern_as : UInt64
    get_current_pattern : UInt64
    get_cached_pattern : UInt64
    get_cached_parent : UInt64
    get_cached_children : UInt64
    get_current_process_id : UInt64
    get_current_control_type : UInt64
    get_current_localized_control_type : UInt64
    get_current_name : UInt64
    get_current_accelerator_key : UInt64
    get_current_access_key : UInt64
    get_current_has_keyboard_focus : UInt64
    get_current_is_keyboard_focusable : UInt64
    get_current_is_enabled : UInt64
    get_current_automation_id : UInt64
    get_current_class_name : UInt64
    get_current_help_text : UInt64
    get_current_culture : UInt64
    get_current_is_control_element : UInt64
    get_current_is_content_element : UInt64
    get_current_is_password : UInt64
    get_current_native_window_handle : UInt64
    get_current_item_type : UInt64
    get_current_is_offscreen : UInt64
    get_current_orientation : UInt64
    get_current_framework_id : UInt64
    get_current_is_required_for_form : UInt64
    get_current_item_status : UInt64
    get_current_bounding_rectangle : UInt64
    get_current_labeled_by : UInt64
    get_current_aria_role : UInt64
    get_current_aria_properties : UInt64
    get_current_is_data_valid_for_form : UInt64
    get_current_controller_for : UInt64
    get_current_described_by : UInt64
    get_current_flows_to : UInt64
    get_current_provider_description : UInt64
    get_cached_process_id : UInt64
    get_cached_control_type : UInt64
    get_cached_localized_control_type : UInt64
    get_cached_name : UInt64
    get_cached_accelerator_key : UInt64
    get_cached_access_key : UInt64
    get_cached_has_keyboard_focus : UInt64
    get_cached_is_keyboard_focusable : UInt64
    get_cached_is_enabled : UInt64
    get_cached_automation_id : UInt64
    get_cached_class_name : UInt64
    get_cached_help_text : UInt64
    get_cached_culture : UInt64
    get_cached_is_control_element : UInt64
    get_cached_is_content_element : UInt64
    get_cached_is_password : UInt64
    get_cached_native_window_handle : UInt64
    get_cached_item_type : UInt64
    get_cached_is_offscreen : UInt64
    get_cached_orientation : UInt64
    get_cached_framework_id : UInt64
    get_cached_is_required_for_form : UInt64
    get_cached_item_status : UInt64
    get_cached_bounding_rectangle : UInt64
    get_cached_labeled_by : UInt64
    get_cached_aria_role : UInt64
    get_cached_aria_properties : UInt64
    get_cached_is_data_valid_for_form : UInt64
    get_cached_controller_for : UInt64
    get_cached_described_by : UInt64
    get_cached_flows_to : UInt64
    get_cached_provider_description : UInt64
    get_clickable_point : UInt64
    get_current_optimize_for_visual_content : UInt64
    get_cached_optimize_for_visual_content : UInt64
    get_current_live_setting : UInt64
    get_cached_live_setting : UInt64
    get_current_flows_from : UInt64
    get_cached_flows_from : UInt64
  end

  IUIAutomationElement2_GUID = "6749c683-f70d-4487-a698-5f79d55290d6"
  IID_IUIAutomationElement2 = LibC::GUID.new(0x6749c683_u32, 0xf70d_u16, 0x4487_u16, StaticArray[0xa6_u8, 0x98_u8, 0x5f_u8, 0x79_u8, 0xd5_u8, 0x52_u8, 0x90_u8, 0xd6_u8])
  struct IUIAutomationElement2
    lpVtbl : IUIAutomationElement2VTbl*
  end

  struct IUIAutomationElement3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_focus : UInt64
    get_runtime_id : UInt64
    find_first : UInt64
    find_all : UInt64
    find_first_build_cache : UInt64
    find_all_build_cache : UInt64
    build_updated_cache : UInt64
    get_current_property_value : UInt64
    get_current_property_value_ex : UInt64
    get_cached_property_value : UInt64
    get_cached_property_value_ex : UInt64
    get_current_pattern_as : UInt64
    get_cached_pattern_as : UInt64
    get_current_pattern : UInt64
    get_cached_pattern : UInt64
    get_cached_parent : UInt64
    get_cached_children : UInt64
    get_current_process_id : UInt64
    get_current_control_type : UInt64
    get_current_localized_control_type : UInt64
    get_current_name : UInt64
    get_current_accelerator_key : UInt64
    get_current_access_key : UInt64
    get_current_has_keyboard_focus : UInt64
    get_current_is_keyboard_focusable : UInt64
    get_current_is_enabled : UInt64
    get_current_automation_id : UInt64
    get_current_class_name : UInt64
    get_current_help_text : UInt64
    get_current_culture : UInt64
    get_current_is_control_element : UInt64
    get_current_is_content_element : UInt64
    get_current_is_password : UInt64
    get_current_native_window_handle : UInt64
    get_current_item_type : UInt64
    get_current_is_offscreen : UInt64
    get_current_orientation : UInt64
    get_current_framework_id : UInt64
    get_current_is_required_for_form : UInt64
    get_current_item_status : UInt64
    get_current_bounding_rectangle : UInt64
    get_current_labeled_by : UInt64
    get_current_aria_role : UInt64
    get_current_aria_properties : UInt64
    get_current_is_data_valid_for_form : UInt64
    get_current_controller_for : UInt64
    get_current_described_by : UInt64
    get_current_flows_to : UInt64
    get_current_provider_description : UInt64
    get_cached_process_id : UInt64
    get_cached_control_type : UInt64
    get_cached_localized_control_type : UInt64
    get_cached_name : UInt64
    get_cached_accelerator_key : UInt64
    get_cached_access_key : UInt64
    get_cached_has_keyboard_focus : UInt64
    get_cached_is_keyboard_focusable : UInt64
    get_cached_is_enabled : UInt64
    get_cached_automation_id : UInt64
    get_cached_class_name : UInt64
    get_cached_help_text : UInt64
    get_cached_culture : UInt64
    get_cached_is_control_element : UInt64
    get_cached_is_content_element : UInt64
    get_cached_is_password : UInt64
    get_cached_native_window_handle : UInt64
    get_cached_item_type : UInt64
    get_cached_is_offscreen : UInt64
    get_cached_orientation : UInt64
    get_cached_framework_id : UInt64
    get_cached_is_required_for_form : UInt64
    get_cached_item_status : UInt64
    get_cached_bounding_rectangle : UInt64
    get_cached_labeled_by : UInt64
    get_cached_aria_role : UInt64
    get_cached_aria_properties : UInt64
    get_cached_is_data_valid_for_form : UInt64
    get_cached_controller_for : UInt64
    get_cached_described_by : UInt64
    get_cached_flows_to : UInt64
    get_cached_provider_description : UInt64
    get_clickable_point : UInt64
    get_current_optimize_for_visual_content : UInt64
    get_cached_optimize_for_visual_content : UInt64
    get_current_live_setting : UInt64
    get_cached_live_setting : UInt64
    get_current_flows_from : UInt64
    get_cached_flows_from : UInt64
    show_context_menu : UInt64
    get_current_is_peripheral : UInt64
    get_cached_is_peripheral : UInt64
  end

  IUIAutomationElement3_GUID = "8471df34-aee0-4a01-a7de-7db9af12c296"
  IID_IUIAutomationElement3 = LibC::GUID.new(0x8471df34_u32, 0xaee0_u16, 0x4a01_u16, StaticArray[0xa7_u8, 0xde_u8, 0x7d_u8, 0xb9_u8, 0xaf_u8, 0x12_u8, 0xc2_u8, 0x96_u8])
  struct IUIAutomationElement3
    lpVtbl : IUIAutomationElement3VTbl*
  end

  struct IUIAutomationElement4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_focus : UInt64
    get_runtime_id : UInt64
    find_first : UInt64
    find_all : UInt64
    find_first_build_cache : UInt64
    find_all_build_cache : UInt64
    build_updated_cache : UInt64
    get_current_property_value : UInt64
    get_current_property_value_ex : UInt64
    get_cached_property_value : UInt64
    get_cached_property_value_ex : UInt64
    get_current_pattern_as : UInt64
    get_cached_pattern_as : UInt64
    get_current_pattern : UInt64
    get_cached_pattern : UInt64
    get_cached_parent : UInt64
    get_cached_children : UInt64
    get_current_process_id : UInt64
    get_current_control_type : UInt64
    get_current_localized_control_type : UInt64
    get_current_name : UInt64
    get_current_accelerator_key : UInt64
    get_current_access_key : UInt64
    get_current_has_keyboard_focus : UInt64
    get_current_is_keyboard_focusable : UInt64
    get_current_is_enabled : UInt64
    get_current_automation_id : UInt64
    get_current_class_name : UInt64
    get_current_help_text : UInt64
    get_current_culture : UInt64
    get_current_is_control_element : UInt64
    get_current_is_content_element : UInt64
    get_current_is_password : UInt64
    get_current_native_window_handle : UInt64
    get_current_item_type : UInt64
    get_current_is_offscreen : UInt64
    get_current_orientation : UInt64
    get_current_framework_id : UInt64
    get_current_is_required_for_form : UInt64
    get_current_item_status : UInt64
    get_current_bounding_rectangle : UInt64
    get_current_labeled_by : UInt64
    get_current_aria_role : UInt64
    get_current_aria_properties : UInt64
    get_current_is_data_valid_for_form : UInt64
    get_current_controller_for : UInt64
    get_current_described_by : UInt64
    get_current_flows_to : UInt64
    get_current_provider_description : UInt64
    get_cached_process_id : UInt64
    get_cached_control_type : UInt64
    get_cached_localized_control_type : UInt64
    get_cached_name : UInt64
    get_cached_accelerator_key : UInt64
    get_cached_access_key : UInt64
    get_cached_has_keyboard_focus : UInt64
    get_cached_is_keyboard_focusable : UInt64
    get_cached_is_enabled : UInt64
    get_cached_automation_id : UInt64
    get_cached_class_name : UInt64
    get_cached_help_text : UInt64
    get_cached_culture : UInt64
    get_cached_is_control_element : UInt64
    get_cached_is_content_element : UInt64
    get_cached_is_password : UInt64
    get_cached_native_window_handle : UInt64
    get_cached_item_type : UInt64
    get_cached_is_offscreen : UInt64
    get_cached_orientation : UInt64
    get_cached_framework_id : UInt64
    get_cached_is_required_for_form : UInt64
    get_cached_item_status : UInt64
    get_cached_bounding_rectangle : UInt64
    get_cached_labeled_by : UInt64
    get_cached_aria_role : UInt64
    get_cached_aria_properties : UInt64
    get_cached_is_data_valid_for_form : UInt64
    get_cached_controller_for : UInt64
    get_cached_described_by : UInt64
    get_cached_flows_to : UInt64
    get_cached_provider_description : UInt64
    get_clickable_point : UInt64
    get_current_optimize_for_visual_content : UInt64
    get_cached_optimize_for_visual_content : UInt64
    get_current_live_setting : UInt64
    get_cached_live_setting : UInt64
    get_current_flows_from : UInt64
    get_cached_flows_from : UInt64
    show_context_menu : UInt64
    get_current_is_peripheral : UInt64
    get_cached_is_peripheral : UInt64
    get_current_position_in_set : UInt64
    get_current_size_of_set : UInt64
    get_current_level : UInt64
    get_current_annotation_types : UInt64
    get_current_annotation_objects : UInt64
    get_cached_position_in_set : UInt64
    get_cached_size_of_set : UInt64
    get_cached_level : UInt64
    get_cached_annotation_types : UInt64
    get_cached_annotation_objects : UInt64
  end

  IUIAutomationElement4_GUID = "3b6e233c-52fb-4063-a4c9-77c075c2a06b"
  IID_IUIAutomationElement4 = LibC::GUID.new(0x3b6e233c_u32, 0x52fb_u16, 0x4063_u16, StaticArray[0xa4_u8, 0xc9_u8, 0x77_u8, 0xc0_u8, 0x75_u8, 0xc2_u8, 0xa0_u8, 0x6b_u8])
  struct IUIAutomationElement4
    lpVtbl : IUIAutomationElement4VTbl*
  end

  struct IUIAutomationElement5VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_focus : UInt64
    get_runtime_id : UInt64
    find_first : UInt64
    find_all : UInt64
    find_first_build_cache : UInt64
    find_all_build_cache : UInt64
    build_updated_cache : UInt64
    get_current_property_value : UInt64
    get_current_property_value_ex : UInt64
    get_cached_property_value : UInt64
    get_cached_property_value_ex : UInt64
    get_current_pattern_as : UInt64
    get_cached_pattern_as : UInt64
    get_current_pattern : UInt64
    get_cached_pattern : UInt64
    get_cached_parent : UInt64
    get_cached_children : UInt64
    get_current_process_id : UInt64
    get_current_control_type : UInt64
    get_current_localized_control_type : UInt64
    get_current_name : UInt64
    get_current_accelerator_key : UInt64
    get_current_access_key : UInt64
    get_current_has_keyboard_focus : UInt64
    get_current_is_keyboard_focusable : UInt64
    get_current_is_enabled : UInt64
    get_current_automation_id : UInt64
    get_current_class_name : UInt64
    get_current_help_text : UInt64
    get_current_culture : UInt64
    get_current_is_control_element : UInt64
    get_current_is_content_element : UInt64
    get_current_is_password : UInt64
    get_current_native_window_handle : UInt64
    get_current_item_type : UInt64
    get_current_is_offscreen : UInt64
    get_current_orientation : UInt64
    get_current_framework_id : UInt64
    get_current_is_required_for_form : UInt64
    get_current_item_status : UInt64
    get_current_bounding_rectangle : UInt64
    get_current_labeled_by : UInt64
    get_current_aria_role : UInt64
    get_current_aria_properties : UInt64
    get_current_is_data_valid_for_form : UInt64
    get_current_controller_for : UInt64
    get_current_described_by : UInt64
    get_current_flows_to : UInt64
    get_current_provider_description : UInt64
    get_cached_process_id : UInt64
    get_cached_control_type : UInt64
    get_cached_localized_control_type : UInt64
    get_cached_name : UInt64
    get_cached_accelerator_key : UInt64
    get_cached_access_key : UInt64
    get_cached_has_keyboard_focus : UInt64
    get_cached_is_keyboard_focusable : UInt64
    get_cached_is_enabled : UInt64
    get_cached_automation_id : UInt64
    get_cached_class_name : UInt64
    get_cached_help_text : UInt64
    get_cached_culture : UInt64
    get_cached_is_control_element : UInt64
    get_cached_is_content_element : UInt64
    get_cached_is_password : UInt64
    get_cached_native_window_handle : UInt64
    get_cached_item_type : UInt64
    get_cached_is_offscreen : UInt64
    get_cached_orientation : UInt64
    get_cached_framework_id : UInt64
    get_cached_is_required_for_form : UInt64
    get_cached_item_status : UInt64
    get_cached_bounding_rectangle : UInt64
    get_cached_labeled_by : UInt64
    get_cached_aria_role : UInt64
    get_cached_aria_properties : UInt64
    get_cached_is_data_valid_for_form : UInt64
    get_cached_controller_for : UInt64
    get_cached_described_by : UInt64
    get_cached_flows_to : UInt64
    get_cached_provider_description : UInt64
    get_clickable_point : UInt64
    get_current_optimize_for_visual_content : UInt64
    get_cached_optimize_for_visual_content : UInt64
    get_current_live_setting : UInt64
    get_cached_live_setting : UInt64
    get_current_flows_from : UInt64
    get_cached_flows_from : UInt64
    show_context_menu : UInt64
    get_current_is_peripheral : UInt64
    get_cached_is_peripheral : UInt64
    get_current_position_in_set : UInt64
    get_current_size_of_set : UInt64
    get_current_level : UInt64
    get_current_annotation_types : UInt64
    get_current_annotation_objects : UInt64
    get_cached_position_in_set : UInt64
    get_cached_size_of_set : UInt64
    get_cached_level : UInt64
    get_cached_annotation_types : UInt64
    get_cached_annotation_objects : UInt64
    get_current_landmark_type : UInt64
    get_current_localized_landmark_type : UInt64
    get_cached_landmark_type : UInt64
    get_cached_localized_landmark_type : UInt64
  end

  IUIAutomationElement5_GUID = "98141c1d-0d0e-4175-bbe2-6bff455842a7"
  IID_IUIAutomationElement5 = LibC::GUID.new(0x98141c1d_u32, 0xd0e_u16, 0x4175_u16, StaticArray[0xbb_u8, 0xe2_u8, 0x6b_u8, 0xff_u8, 0x45_u8, 0x58_u8, 0x42_u8, 0xa7_u8])
  struct IUIAutomationElement5
    lpVtbl : IUIAutomationElement5VTbl*
  end

  struct IUIAutomationElement6VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_focus : UInt64
    get_runtime_id : UInt64
    find_first : UInt64
    find_all : UInt64
    find_first_build_cache : UInt64
    find_all_build_cache : UInt64
    build_updated_cache : UInt64
    get_current_property_value : UInt64
    get_current_property_value_ex : UInt64
    get_cached_property_value : UInt64
    get_cached_property_value_ex : UInt64
    get_current_pattern_as : UInt64
    get_cached_pattern_as : UInt64
    get_current_pattern : UInt64
    get_cached_pattern : UInt64
    get_cached_parent : UInt64
    get_cached_children : UInt64
    get_current_process_id : UInt64
    get_current_control_type : UInt64
    get_current_localized_control_type : UInt64
    get_current_name : UInt64
    get_current_accelerator_key : UInt64
    get_current_access_key : UInt64
    get_current_has_keyboard_focus : UInt64
    get_current_is_keyboard_focusable : UInt64
    get_current_is_enabled : UInt64
    get_current_automation_id : UInt64
    get_current_class_name : UInt64
    get_current_help_text : UInt64
    get_current_culture : UInt64
    get_current_is_control_element : UInt64
    get_current_is_content_element : UInt64
    get_current_is_password : UInt64
    get_current_native_window_handle : UInt64
    get_current_item_type : UInt64
    get_current_is_offscreen : UInt64
    get_current_orientation : UInt64
    get_current_framework_id : UInt64
    get_current_is_required_for_form : UInt64
    get_current_item_status : UInt64
    get_current_bounding_rectangle : UInt64
    get_current_labeled_by : UInt64
    get_current_aria_role : UInt64
    get_current_aria_properties : UInt64
    get_current_is_data_valid_for_form : UInt64
    get_current_controller_for : UInt64
    get_current_described_by : UInt64
    get_current_flows_to : UInt64
    get_current_provider_description : UInt64
    get_cached_process_id : UInt64
    get_cached_control_type : UInt64
    get_cached_localized_control_type : UInt64
    get_cached_name : UInt64
    get_cached_accelerator_key : UInt64
    get_cached_access_key : UInt64
    get_cached_has_keyboard_focus : UInt64
    get_cached_is_keyboard_focusable : UInt64
    get_cached_is_enabled : UInt64
    get_cached_automation_id : UInt64
    get_cached_class_name : UInt64
    get_cached_help_text : UInt64
    get_cached_culture : UInt64
    get_cached_is_control_element : UInt64
    get_cached_is_content_element : UInt64
    get_cached_is_password : UInt64
    get_cached_native_window_handle : UInt64
    get_cached_item_type : UInt64
    get_cached_is_offscreen : UInt64
    get_cached_orientation : UInt64
    get_cached_framework_id : UInt64
    get_cached_is_required_for_form : UInt64
    get_cached_item_status : UInt64
    get_cached_bounding_rectangle : UInt64
    get_cached_labeled_by : UInt64
    get_cached_aria_role : UInt64
    get_cached_aria_properties : UInt64
    get_cached_is_data_valid_for_form : UInt64
    get_cached_controller_for : UInt64
    get_cached_described_by : UInt64
    get_cached_flows_to : UInt64
    get_cached_provider_description : UInt64
    get_clickable_point : UInt64
    get_current_optimize_for_visual_content : UInt64
    get_cached_optimize_for_visual_content : UInt64
    get_current_live_setting : UInt64
    get_cached_live_setting : UInt64
    get_current_flows_from : UInt64
    get_cached_flows_from : UInt64
    show_context_menu : UInt64
    get_current_is_peripheral : UInt64
    get_cached_is_peripheral : UInt64
    get_current_position_in_set : UInt64
    get_current_size_of_set : UInt64
    get_current_level : UInt64
    get_current_annotation_types : UInt64
    get_current_annotation_objects : UInt64
    get_cached_position_in_set : UInt64
    get_cached_size_of_set : UInt64
    get_cached_level : UInt64
    get_cached_annotation_types : UInt64
    get_cached_annotation_objects : UInt64
    get_current_landmark_type : UInt64
    get_current_localized_landmark_type : UInt64
    get_cached_landmark_type : UInt64
    get_cached_localized_landmark_type : UInt64
    get_current_full_description : UInt64
    get_cached_full_description : UInt64
  end

  IUIAutomationElement6_GUID = "4780d450-8bca-4977-afa5-a4a517f555e3"
  IID_IUIAutomationElement6 = LibC::GUID.new(0x4780d450_u32, 0x8bca_u16, 0x4977_u16, StaticArray[0xaf_u8, 0xa5_u8, 0xa4_u8, 0xa5_u8, 0x17_u8, 0xf5_u8, 0x55_u8, 0xe3_u8])
  struct IUIAutomationElement6
    lpVtbl : IUIAutomationElement6VTbl*
  end

  struct IUIAutomationElement7VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_focus : UInt64
    get_runtime_id : UInt64
    find_first : UInt64
    find_all : UInt64
    find_first_build_cache : UInt64
    find_all_build_cache : UInt64
    build_updated_cache : UInt64
    get_current_property_value : UInt64
    get_current_property_value_ex : UInt64
    get_cached_property_value : UInt64
    get_cached_property_value_ex : UInt64
    get_current_pattern_as : UInt64
    get_cached_pattern_as : UInt64
    get_current_pattern : UInt64
    get_cached_pattern : UInt64
    get_cached_parent : UInt64
    get_cached_children : UInt64
    get_current_process_id : UInt64
    get_current_control_type : UInt64
    get_current_localized_control_type : UInt64
    get_current_name : UInt64
    get_current_accelerator_key : UInt64
    get_current_access_key : UInt64
    get_current_has_keyboard_focus : UInt64
    get_current_is_keyboard_focusable : UInt64
    get_current_is_enabled : UInt64
    get_current_automation_id : UInt64
    get_current_class_name : UInt64
    get_current_help_text : UInt64
    get_current_culture : UInt64
    get_current_is_control_element : UInt64
    get_current_is_content_element : UInt64
    get_current_is_password : UInt64
    get_current_native_window_handle : UInt64
    get_current_item_type : UInt64
    get_current_is_offscreen : UInt64
    get_current_orientation : UInt64
    get_current_framework_id : UInt64
    get_current_is_required_for_form : UInt64
    get_current_item_status : UInt64
    get_current_bounding_rectangle : UInt64
    get_current_labeled_by : UInt64
    get_current_aria_role : UInt64
    get_current_aria_properties : UInt64
    get_current_is_data_valid_for_form : UInt64
    get_current_controller_for : UInt64
    get_current_described_by : UInt64
    get_current_flows_to : UInt64
    get_current_provider_description : UInt64
    get_cached_process_id : UInt64
    get_cached_control_type : UInt64
    get_cached_localized_control_type : UInt64
    get_cached_name : UInt64
    get_cached_accelerator_key : UInt64
    get_cached_access_key : UInt64
    get_cached_has_keyboard_focus : UInt64
    get_cached_is_keyboard_focusable : UInt64
    get_cached_is_enabled : UInt64
    get_cached_automation_id : UInt64
    get_cached_class_name : UInt64
    get_cached_help_text : UInt64
    get_cached_culture : UInt64
    get_cached_is_control_element : UInt64
    get_cached_is_content_element : UInt64
    get_cached_is_password : UInt64
    get_cached_native_window_handle : UInt64
    get_cached_item_type : UInt64
    get_cached_is_offscreen : UInt64
    get_cached_orientation : UInt64
    get_cached_framework_id : UInt64
    get_cached_is_required_for_form : UInt64
    get_cached_item_status : UInt64
    get_cached_bounding_rectangle : UInt64
    get_cached_labeled_by : UInt64
    get_cached_aria_role : UInt64
    get_cached_aria_properties : UInt64
    get_cached_is_data_valid_for_form : UInt64
    get_cached_controller_for : UInt64
    get_cached_described_by : UInt64
    get_cached_flows_to : UInt64
    get_cached_provider_description : UInt64
    get_clickable_point : UInt64
    get_current_optimize_for_visual_content : UInt64
    get_cached_optimize_for_visual_content : UInt64
    get_current_live_setting : UInt64
    get_cached_live_setting : UInt64
    get_current_flows_from : UInt64
    get_cached_flows_from : UInt64
    show_context_menu : UInt64
    get_current_is_peripheral : UInt64
    get_cached_is_peripheral : UInt64
    get_current_position_in_set : UInt64
    get_current_size_of_set : UInt64
    get_current_level : UInt64
    get_current_annotation_types : UInt64
    get_current_annotation_objects : UInt64
    get_cached_position_in_set : UInt64
    get_cached_size_of_set : UInt64
    get_cached_level : UInt64
    get_cached_annotation_types : UInt64
    get_cached_annotation_objects : UInt64
    get_current_landmark_type : UInt64
    get_current_localized_landmark_type : UInt64
    get_cached_landmark_type : UInt64
    get_cached_localized_landmark_type : UInt64
    get_current_full_description : UInt64
    get_cached_full_description : UInt64
    find_first_with_options : UInt64
    find_all_with_options : UInt64
    find_first_with_options_build_cache : UInt64
    find_all_with_options_build_cache : UInt64
    get_current_metadata_value : UInt64
  end

  IUIAutomationElement7_GUID = "204e8572-cfc3-4c11-b0c8-7da7420750b7"
  IID_IUIAutomationElement7 = LibC::GUID.new(0x204e8572_u32, 0xcfc3_u16, 0x4c11_u16, StaticArray[0xb0_u8, 0xc8_u8, 0x7d_u8, 0xa7_u8, 0x42_u8, 0x7_u8, 0x50_u8, 0xb7_u8])
  struct IUIAutomationElement7
    lpVtbl : IUIAutomationElement7VTbl*
  end

  struct IUIAutomationElement8VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_focus : UInt64
    get_runtime_id : UInt64
    find_first : UInt64
    find_all : UInt64
    find_first_build_cache : UInt64
    find_all_build_cache : UInt64
    build_updated_cache : UInt64
    get_current_property_value : UInt64
    get_current_property_value_ex : UInt64
    get_cached_property_value : UInt64
    get_cached_property_value_ex : UInt64
    get_current_pattern_as : UInt64
    get_cached_pattern_as : UInt64
    get_current_pattern : UInt64
    get_cached_pattern : UInt64
    get_cached_parent : UInt64
    get_cached_children : UInt64
    get_current_process_id : UInt64
    get_current_control_type : UInt64
    get_current_localized_control_type : UInt64
    get_current_name : UInt64
    get_current_accelerator_key : UInt64
    get_current_access_key : UInt64
    get_current_has_keyboard_focus : UInt64
    get_current_is_keyboard_focusable : UInt64
    get_current_is_enabled : UInt64
    get_current_automation_id : UInt64
    get_current_class_name : UInt64
    get_current_help_text : UInt64
    get_current_culture : UInt64
    get_current_is_control_element : UInt64
    get_current_is_content_element : UInt64
    get_current_is_password : UInt64
    get_current_native_window_handle : UInt64
    get_current_item_type : UInt64
    get_current_is_offscreen : UInt64
    get_current_orientation : UInt64
    get_current_framework_id : UInt64
    get_current_is_required_for_form : UInt64
    get_current_item_status : UInt64
    get_current_bounding_rectangle : UInt64
    get_current_labeled_by : UInt64
    get_current_aria_role : UInt64
    get_current_aria_properties : UInt64
    get_current_is_data_valid_for_form : UInt64
    get_current_controller_for : UInt64
    get_current_described_by : UInt64
    get_current_flows_to : UInt64
    get_current_provider_description : UInt64
    get_cached_process_id : UInt64
    get_cached_control_type : UInt64
    get_cached_localized_control_type : UInt64
    get_cached_name : UInt64
    get_cached_accelerator_key : UInt64
    get_cached_access_key : UInt64
    get_cached_has_keyboard_focus : UInt64
    get_cached_is_keyboard_focusable : UInt64
    get_cached_is_enabled : UInt64
    get_cached_automation_id : UInt64
    get_cached_class_name : UInt64
    get_cached_help_text : UInt64
    get_cached_culture : UInt64
    get_cached_is_control_element : UInt64
    get_cached_is_content_element : UInt64
    get_cached_is_password : UInt64
    get_cached_native_window_handle : UInt64
    get_cached_item_type : UInt64
    get_cached_is_offscreen : UInt64
    get_cached_orientation : UInt64
    get_cached_framework_id : UInt64
    get_cached_is_required_for_form : UInt64
    get_cached_item_status : UInt64
    get_cached_bounding_rectangle : UInt64
    get_cached_labeled_by : UInt64
    get_cached_aria_role : UInt64
    get_cached_aria_properties : UInt64
    get_cached_is_data_valid_for_form : UInt64
    get_cached_controller_for : UInt64
    get_cached_described_by : UInt64
    get_cached_flows_to : UInt64
    get_cached_provider_description : UInt64
    get_clickable_point : UInt64
    get_current_optimize_for_visual_content : UInt64
    get_cached_optimize_for_visual_content : UInt64
    get_current_live_setting : UInt64
    get_cached_live_setting : UInt64
    get_current_flows_from : UInt64
    get_cached_flows_from : UInt64
    show_context_menu : UInt64
    get_current_is_peripheral : UInt64
    get_cached_is_peripheral : UInt64
    get_current_position_in_set : UInt64
    get_current_size_of_set : UInt64
    get_current_level : UInt64
    get_current_annotation_types : UInt64
    get_current_annotation_objects : UInt64
    get_cached_position_in_set : UInt64
    get_cached_size_of_set : UInt64
    get_cached_level : UInt64
    get_cached_annotation_types : UInt64
    get_cached_annotation_objects : UInt64
    get_current_landmark_type : UInt64
    get_current_localized_landmark_type : UInt64
    get_cached_landmark_type : UInt64
    get_cached_localized_landmark_type : UInt64
    get_current_full_description : UInt64
    get_cached_full_description : UInt64
    find_first_with_options : UInt64
    find_all_with_options : UInt64
    find_first_with_options_build_cache : UInt64
    find_all_with_options_build_cache : UInt64
    get_current_metadata_value : UInt64
    get_current_heading_level : UInt64
    get_cached_heading_level : UInt64
  end

  IUIAutomationElement8_GUID = "8c60217d-5411-4cde-bcc0-1ceda223830c"
  IID_IUIAutomationElement8 = LibC::GUID.new(0x8c60217d_u32, 0x5411_u16, 0x4cde_u16, StaticArray[0xbc_u8, 0xc0_u8, 0x1c_u8, 0xed_u8, 0xa2_u8, 0x23_u8, 0x83_u8, 0xc_u8])
  struct IUIAutomationElement8
    lpVtbl : IUIAutomationElement8VTbl*
  end

  struct IUIAutomationElement9VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    set_focus : UInt64
    get_runtime_id : UInt64
    find_first : UInt64
    find_all : UInt64
    find_first_build_cache : UInt64
    find_all_build_cache : UInt64
    build_updated_cache : UInt64
    get_current_property_value : UInt64
    get_current_property_value_ex : UInt64
    get_cached_property_value : UInt64
    get_cached_property_value_ex : UInt64
    get_current_pattern_as : UInt64
    get_cached_pattern_as : UInt64
    get_current_pattern : UInt64
    get_cached_pattern : UInt64
    get_cached_parent : UInt64
    get_cached_children : UInt64
    get_current_process_id : UInt64
    get_current_control_type : UInt64
    get_current_localized_control_type : UInt64
    get_current_name : UInt64
    get_current_accelerator_key : UInt64
    get_current_access_key : UInt64
    get_current_has_keyboard_focus : UInt64
    get_current_is_keyboard_focusable : UInt64
    get_current_is_enabled : UInt64
    get_current_automation_id : UInt64
    get_current_class_name : UInt64
    get_current_help_text : UInt64
    get_current_culture : UInt64
    get_current_is_control_element : UInt64
    get_current_is_content_element : UInt64
    get_current_is_password : UInt64
    get_current_native_window_handle : UInt64
    get_current_item_type : UInt64
    get_current_is_offscreen : UInt64
    get_current_orientation : UInt64
    get_current_framework_id : UInt64
    get_current_is_required_for_form : UInt64
    get_current_item_status : UInt64
    get_current_bounding_rectangle : UInt64
    get_current_labeled_by : UInt64
    get_current_aria_role : UInt64
    get_current_aria_properties : UInt64
    get_current_is_data_valid_for_form : UInt64
    get_current_controller_for : UInt64
    get_current_described_by : UInt64
    get_current_flows_to : UInt64
    get_current_provider_description : UInt64
    get_cached_process_id : UInt64
    get_cached_control_type : UInt64
    get_cached_localized_control_type : UInt64
    get_cached_name : UInt64
    get_cached_accelerator_key : UInt64
    get_cached_access_key : UInt64
    get_cached_has_keyboard_focus : UInt64
    get_cached_is_keyboard_focusable : UInt64
    get_cached_is_enabled : UInt64
    get_cached_automation_id : UInt64
    get_cached_class_name : UInt64
    get_cached_help_text : UInt64
    get_cached_culture : UInt64
    get_cached_is_control_element : UInt64
    get_cached_is_content_element : UInt64
    get_cached_is_password : UInt64
    get_cached_native_window_handle : UInt64
    get_cached_item_type : UInt64
    get_cached_is_offscreen : UInt64
    get_cached_orientation : UInt64
    get_cached_framework_id : UInt64
    get_cached_is_required_for_form : UInt64
    get_cached_item_status : UInt64
    get_cached_bounding_rectangle : UInt64
    get_cached_labeled_by : UInt64
    get_cached_aria_role : UInt64
    get_cached_aria_properties : UInt64
    get_cached_is_data_valid_for_form : UInt64
    get_cached_controller_for : UInt64
    get_cached_described_by : UInt64
    get_cached_flows_to : UInt64
    get_cached_provider_description : UInt64
    get_clickable_point : UInt64
    get_current_optimize_for_visual_content : UInt64
    get_cached_optimize_for_visual_content : UInt64
    get_current_live_setting : UInt64
    get_cached_live_setting : UInt64
    get_current_flows_from : UInt64
    get_cached_flows_from : UInt64
    show_context_menu : UInt64
    get_current_is_peripheral : UInt64
    get_cached_is_peripheral : UInt64
    get_current_position_in_set : UInt64
    get_current_size_of_set : UInt64
    get_current_level : UInt64
    get_current_annotation_types : UInt64
    get_current_annotation_objects : UInt64
    get_cached_position_in_set : UInt64
    get_cached_size_of_set : UInt64
    get_cached_level : UInt64
    get_cached_annotation_types : UInt64
    get_cached_annotation_objects : UInt64
    get_current_landmark_type : UInt64
    get_current_localized_landmark_type : UInt64
    get_cached_landmark_type : UInt64
    get_cached_localized_landmark_type : UInt64
    get_current_full_description : UInt64
    get_cached_full_description : UInt64
    find_first_with_options : UInt64
    find_all_with_options : UInt64
    find_first_with_options_build_cache : UInt64
    find_all_with_options_build_cache : UInt64
    get_current_metadata_value : UInt64
    get_current_heading_level : UInt64
    get_cached_heading_level : UInt64
    get_current_is_dialog : UInt64
    get_cached_is_dialog : UInt64
  end

  IUIAutomationElement9_GUID = "39325fac-039d-440e-a3a3-5eb81a5cecc3"
  IID_IUIAutomationElement9 = LibC::GUID.new(0x39325fac_u32, 0x39d_u16, 0x440e_u16, StaticArray[0xa3_u8, 0xa3_u8, 0x5e_u8, 0xb8_u8, 0x1a_u8, 0x5c_u8, 0xec_u8, 0xc3_u8])
  struct IUIAutomationElement9
    lpVtbl : IUIAutomationElement9VTbl*
  end

  struct IUIAutomationProxyFactoryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    create_provider : UInt64
    get_proxy_factory_id : UInt64
  end

  IUIAutomationProxyFactory_GUID = "85b94ecd-849d-42b6-b94d-d6db23fdf5a4"
  IID_IUIAutomationProxyFactory = LibC::GUID.new(0x85b94ecd_u32, 0x849d_u16, 0x42b6_u16, StaticArray[0xb9_u8, 0x4d_u8, 0xd6_u8, 0xdb_u8, 0x23_u8, 0xfd_u8, 0xf5_u8, 0xa4_u8])
  struct IUIAutomationProxyFactory
    lpVtbl : IUIAutomationProxyFactoryVTbl*
  end

  struct IUIAutomationProxyFactoryEntryVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_proxy_factory : UInt64
    get_class_name : UInt64
    get_image_name : UInt64
    get_allow_substring_match : UInt64
    get_can_check_base_class : UInt64
    get_needs_advise_events : UInt64
    put_class_name : UInt64
    put_image_name : UInt64
    put_allow_substring_match : UInt64
    put_can_check_base_class : UInt64
    put_needs_advise_events : UInt64
    set_win_events_for_automation_event : UInt64
    get_win_events_for_automation_event : UInt64
  end

  IUIAutomationProxyFactoryEntry_GUID = "d50e472e-b64b-490c-bca1-d30696f9f289"
  IID_IUIAutomationProxyFactoryEntry = LibC::GUID.new(0xd50e472e_u32, 0xb64b_u16, 0x490c_u16, StaticArray[0xbc_u8, 0xa1_u8, 0xd3_u8, 0x6_u8, 0x96_u8, 0xf9_u8, 0xf2_u8, 0x89_u8])
  struct IUIAutomationProxyFactoryEntry
    lpVtbl : IUIAutomationProxyFactoryEntryVTbl*
  end

  struct IUIAutomationProxyFactoryMappingVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    get_count : UInt64
    get_table : UInt64
    get_entry : UInt64
    set_table : UInt64
    insert_entries : UInt64
    insert_entry : UInt64
    remove_entry : UInt64
    clear_table : UInt64
    restore_default_table : UInt64
  end

  IUIAutomationProxyFactoryMapping_GUID = "09e31e18-872d-4873-93d1-1e541ec133fd"
  IID_IUIAutomationProxyFactoryMapping = LibC::GUID.new(0x9e31e18_u32, 0x872d_u16, 0x4873_u16, StaticArray[0x93_u8, 0xd1_u8, 0x1e_u8, 0x54_u8, 0x1e_u8, 0xc1_u8, 0x33_u8, 0xfd_u8])
  struct IUIAutomationProxyFactoryMapping
    lpVtbl : IUIAutomationProxyFactoryMappingVTbl*
  end

  struct IUIAutomationEventHandlerGroupVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    add_active_text_position_changed_event_handler : UInt64
    add_automation_event_handler : UInt64
    add_changes_event_handler : UInt64
    add_notification_event_handler : UInt64
    add_property_changed_event_handler : UInt64
    add_structure_changed_event_handler : UInt64
    add_text_edit_text_changed_event_handler : UInt64
  end

  IUIAutomationEventHandlerGroup_GUID = "c9ee12f2-c13b-4408-997c-639914377f4e"
  IID_IUIAutomationEventHandlerGroup = LibC::GUID.new(0xc9ee12f2_u32, 0xc13b_u16, 0x4408_u16, StaticArray[0x99_u8, 0x7c_u8, 0x63_u8, 0x99_u8, 0x14_u8, 0x37_u8, 0x7f_u8, 0x4e_u8])
  struct IUIAutomationEventHandlerGroup
    lpVtbl : IUIAutomationEventHandlerGroupVTbl*
  end

  struct IUIAutomationVTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    compare_elements : UInt64
    compare_runtime_ids : UInt64
    get_root_element : UInt64
    element_from_handle : UInt64
    element_from_point : UInt64
    get_focused_element : UInt64
    get_root_element_build_cache : UInt64
    element_from_handle_build_cache : UInt64
    element_from_point_build_cache : UInt64
    get_focused_element_build_cache : UInt64
    create_tree_walker : UInt64
    get_control_view_walker : UInt64
    get_content_view_walker : UInt64
    get_raw_view_walker : UInt64
    get_raw_view_condition : UInt64
    get_control_view_condition : UInt64
    get_content_view_condition : UInt64
    create_cache_request : UInt64
    create_true_condition : UInt64
    create_false_condition : UInt64
    create_property_condition : UInt64
    create_property_condition_ex : UInt64
    create_and_condition : UInt64
    create_and_condition_from_array : UInt64
    create_and_condition_from_native_array : UInt64
    create_or_condition : UInt64
    create_or_condition_from_array : UInt64
    create_or_condition_from_native_array : UInt64
    create_not_condition : UInt64
    add_automation_event_handler : UInt64
    remove_automation_event_handler : UInt64
    add_property_changed_event_handler_native_array : UInt64
    add_property_changed_event_handler : UInt64
    remove_property_changed_event_handler : UInt64
    add_structure_changed_event_handler : UInt64
    remove_structure_changed_event_handler : UInt64
    add_focus_changed_event_handler : UInt64
    remove_focus_changed_event_handler : UInt64
    remove_all_event_handlers : UInt64
    int_native_array_to_safe_array : UInt64
    int_safe_array_to_native_array : UInt64
    rect_to_variant : UInt64
    variant_to_rect : UInt64
    safe_array_to_rect_native_array : UInt64
    create_proxy_factory_entry : UInt64
    get_proxy_factory_mapping : UInt64
    get_property_programmatic_name : UInt64
    get_pattern_programmatic_name : UInt64
    poll_for_potential_supported_patterns : UInt64
    poll_for_potential_supported_properties : UInt64
    check_not_supported : UInt64
    get_reserved_not_supported_value : UInt64
    get_reserved_mixed_attribute_value : UInt64
    element_from_i_accessible : UInt64
    element_from_i_accessible_build_cache : UInt64
  end

  IUIAutomation_GUID = "30cbe57d-d9d0-452a-ab13-7ac5ac4825ee"
  IID_IUIAutomation = LibC::GUID.new(0x30cbe57d_u32, 0xd9d0_u16, 0x452a_u16, StaticArray[0xab_u8, 0x13_u8, 0x7a_u8, 0xc5_u8, 0xac_u8, 0x48_u8, 0x25_u8, 0xee_u8])
  struct IUIAutomation
    lpVtbl : IUIAutomationVTbl*
  end

  struct IUIAutomation2VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    compare_elements : UInt64
    compare_runtime_ids : UInt64
    get_root_element : UInt64
    element_from_handle : UInt64
    element_from_point : UInt64
    get_focused_element : UInt64
    get_root_element_build_cache : UInt64
    element_from_handle_build_cache : UInt64
    element_from_point_build_cache : UInt64
    get_focused_element_build_cache : UInt64
    create_tree_walker : UInt64
    get_control_view_walker : UInt64
    get_content_view_walker : UInt64
    get_raw_view_walker : UInt64
    get_raw_view_condition : UInt64
    get_control_view_condition : UInt64
    get_content_view_condition : UInt64
    create_cache_request : UInt64
    create_true_condition : UInt64
    create_false_condition : UInt64
    create_property_condition : UInt64
    create_property_condition_ex : UInt64
    create_and_condition : UInt64
    create_and_condition_from_array : UInt64
    create_and_condition_from_native_array : UInt64
    create_or_condition : UInt64
    create_or_condition_from_array : UInt64
    create_or_condition_from_native_array : UInt64
    create_not_condition : UInt64
    add_automation_event_handler : UInt64
    remove_automation_event_handler : UInt64
    add_property_changed_event_handler_native_array : UInt64
    add_property_changed_event_handler : UInt64
    remove_property_changed_event_handler : UInt64
    add_structure_changed_event_handler : UInt64
    remove_structure_changed_event_handler : UInt64
    add_focus_changed_event_handler : UInt64
    remove_focus_changed_event_handler : UInt64
    remove_all_event_handlers : UInt64
    int_native_array_to_safe_array : UInt64
    int_safe_array_to_native_array : UInt64
    rect_to_variant : UInt64
    variant_to_rect : UInt64
    safe_array_to_rect_native_array : UInt64
    create_proxy_factory_entry : UInt64
    get_proxy_factory_mapping : UInt64
    get_property_programmatic_name : UInt64
    get_pattern_programmatic_name : UInt64
    poll_for_potential_supported_patterns : UInt64
    poll_for_potential_supported_properties : UInt64
    check_not_supported : UInt64
    get_reserved_not_supported_value : UInt64
    get_reserved_mixed_attribute_value : UInt64
    element_from_i_accessible : UInt64
    element_from_i_accessible_build_cache : UInt64
    get_auto_set_focus : UInt64
    put_auto_set_focus : UInt64
    get_connection_timeout : UInt64
    put_connection_timeout : UInt64
    get_transaction_timeout : UInt64
    put_transaction_timeout : UInt64
  end

  IUIAutomation2_GUID = "34723aff-0c9d-49d0-9896-7ab52df8cd8a"
  IID_IUIAutomation2 = LibC::GUID.new(0x34723aff_u32, 0xc9d_u16, 0x49d0_u16, StaticArray[0x98_u8, 0x96_u8, 0x7a_u8, 0xb5_u8, 0x2d_u8, 0xf8_u8, 0xcd_u8, 0x8a_u8])
  struct IUIAutomation2
    lpVtbl : IUIAutomation2VTbl*
  end

  struct IUIAutomation3VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    compare_elements : UInt64
    compare_runtime_ids : UInt64
    get_root_element : UInt64
    element_from_handle : UInt64
    element_from_point : UInt64
    get_focused_element : UInt64
    get_root_element_build_cache : UInt64
    element_from_handle_build_cache : UInt64
    element_from_point_build_cache : UInt64
    get_focused_element_build_cache : UInt64
    create_tree_walker : UInt64
    get_control_view_walker : UInt64
    get_content_view_walker : UInt64
    get_raw_view_walker : UInt64
    get_raw_view_condition : UInt64
    get_control_view_condition : UInt64
    get_content_view_condition : UInt64
    create_cache_request : UInt64
    create_true_condition : UInt64
    create_false_condition : UInt64
    create_property_condition : UInt64
    create_property_condition_ex : UInt64
    create_and_condition : UInt64
    create_and_condition_from_array : UInt64
    create_and_condition_from_native_array : UInt64
    create_or_condition : UInt64
    create_or_condition_from_array : UInt64
    create_or_condition_from_native_array : UInt64
    create_not_condition : UInt64
    add_automation_event_handler : UInt64
    remove_automation_event_handler : UInt64
    add_property_changed_event_handler_native_array : UInt64
    add_property_changed_event_handler : UInt64
    remove_property_changed_event_handler : UInt64
    add_structure_changed_event_handler : UInt64
    remove_structure_changed_event_handler : UInt64
    add_focus_changed_event_handler : UInt64
    remove_focus_changed_event_handler : UInt64
    remove_all_event_handlers : UInt64
    int_native_array_to_safe_array : UInt64
    int_safe_array_to_native_array : UInt64
    rect_to_variant : UInt64
    variant_to_rect : UInt64
    safe_array_to_rect_native_array : UInt64
    create_proxy_factory_entry : UInt64
    get_proxy_factory_mapping : UInt64
    get_property_programmatic_name : UInt64
    get_pattern_programmatic_name : UInt64
    poll_for_potential_supported_patterns : UInt64
    poll_for_potential_supported_properties : UInt64
    check_not_supported : UInt64
    get_reserved_not_supported_value : UInt64
    get_reserved_mixed_attribute_value : UInt64
    element_from_i_accessible : UInt64
    element_from_i_accessible_build_cache : UInt64
    get_auto_set_focus : UInt64
    put_auto_set_focus : UInt64
    get_connection_timeout : UInt64
    put_connection_timeout : UInt64
    get_transaction_timeout : UInt64
    put_transaction_timeout : UInt64
    add_text_edit_text_changed_event_handler : UInt64
    remove_text_edit_text_changed_event_handler : UInt64
  end

  IUIAutomation3_GUID = "73d768da-9b51-4b89-936e-c209290973e7"
  IID_IUIAutomation3 = LibC::GUID.new(0x73d768da_u32, 0x9b51_u16, 0x4b89_u16, StaticArray[0x93_u8, 0x6e_u8, 0xc2_u8, 0x9_u8, 0x29_u8, 0x9_u8, 0x73_u8, 0xe7_u8])
  struct IUIAutomation3
    lpVtbl : IUIAutomation3VTbl*
  end

  struct IUIAutomation4VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    compare_elements : UInt64
    compare_runtime_ids : UInt64
    get_root_element : UInt64
    element_from_handle : UInt64
    element_from_point : UInt64
    get_focused_element : UInt64
    get_root_element_build_cache : UInt64
    element_from_handle_build_cache : UInt64
    element_from_point_build_cache : UInt64
    get_focused_element_build_cache : UInt64
    create_tree_walker : UInt64
    get_control_view_walker : UInt64
    get_content_view_walker : UInt64
    get_raw_view_walker : UInt64
    get_raw_view_condition : UInt64
    get_control_view_condition : UInt64
    get_content_view_condition : UInt64
    create_cache_request : UInt64
    create_true_condition : UInt64
    create_false_condition : UInt64
    create_property_condition : UInt64
    create_property_condition_ex : UInt64
    create_and_condition : UInt64
    create_and_condition_from_array : UInt64
    create_and_condition_from_native_array : UInt64
    create_or_condition : UInt64
    create_or_condition_from_array : UInt64
    create_or_condition_from_native_array : UInt64
    create_not_condition : UInt64
    add_automation_event_handler : UInt64
    remove_automation_event_handler : UInt64
    add_property_changed_event_handler_native_array : UInt64
    add_property_changed_event_handler : UInt64
    remove_property_changed_event_handler : UInt64
    add_structure_changed_event_handler : UInt64
    remove_structure_changed_event_handler : UInt64
    add_focus_changed_event_handler : UInt64
    remove_focus_changed_event_handler : UInt64
    remove_all_event_handlers : UInt64
    int_native_array_to_safe_array : UInt64
    int_safe_array_to_native_array : UInt64
    rect_to_variant : UInt64
    variant_to_rect : UInt64
    safe_array_to_rect_native_array : UInt64
    create_proxy_factory_entry : UInt64
    get_proxy_factory_mapping : UInt64
    get_property_programmatic_name : UInt64
    get_pattern_programmatic_name : UInt64
    poll_for_potential_supported_patterns : UInt64
    poll_for_potential_supported_properties : UInt64
    check_not_supported : UInt64
    get_reserved_not_supported_value : UInt64
    get_reserved_mixed_attribute_value : UInt64
    element_from_i_accessible : UInt64
    element_from_i_accessible_build_cache : UInt64
    get_auto_set_focus : UInt64
    put_auto_set_focus : UInt64
    get_connection_timeout : UInt64
    put_connection_timeout : UInt64
    get_transaction_timeout : UInt64
    put_transaction_timeout : UInt64
    add_text_edit_text_changed_event_handler : UInt64
    remove_text_edit_text_changed_event_handler : UInt64
    add_changes_event_handler : UInt64
    remove_changes_event_handler : UInt64
  end

  IUIAutomation4_GUID = "1189c02a-05f8-4319-8e21-e817e3db2860"
  IID_IUIAutomation4 = LibC::GUID.new(0x1189c02a_u32, 0x5f8_u16, 0x4319_u16, StaticArray[0x8e_u8, 0x21_u8, 0xe8_u8, 0x17_u8, 0xe3_u8, 0xdb_u8, 0x28_u8, 0x60_u8])
  struct IUIAutomation4
    lpVtbl : IUIAutomation4VTbl*
  end

  struct IUIAutomation5VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    compare_elements : UInt64
    compare_runtime_ids : UInt64
    get_root_element : UInt64
    element_from_handle : UInt64
    element_from_point : UInt64
    get_focused_element : UInt64
    get_root_element_build_cache : UInt64
    element_from_handle_build_cache : UInt64
    element_from_point_build_cache : UInt64
    get_focused_element_build_cache : UInt64
    create_tree_walker : UInt64
    get_control_view_walker : UInt64
    get_content_view_walker : UInt64
    get_raw_view_walker : UInt64
    get_raw_view_condition : UInt64
    get_control_view_condition : UInt64
    get_content_view_condition : UInt64
    create_cache_request : UInt64
    create_true_condition : UInt64
    create_false_condition : UInt64
    create_property_condition : UInt64
    create_property_condition_ex : UInt64
    create_and_condition : UInt64
    create_and_condition_from_array : UInt64
    create_and_condition_from_native_array : UInt64
    create_or_condition : UInt64
    create_or_condition_from_array : UInt64
    create_or_condition_from_native_array : UInt64
    create_not_condition : UInt64
    add_automation_event_handler : UInt64
    remove_automation_event_handler : UInt64
    add_property_changed_event_handler_native_array : UInt64
    add_property_changed_event_handler : UInt64
    remove_property_changed_event_handler : UInt64
    add_structure_changed_event_handler : UInt64
    remove_structure_changed_event_handler : UInt64
    add_focus_changed_event_handler : UInt64
    remove_focus_changed_event_handler : UInt64
    remove_all_event_handlers : UInt64
    int_native_array_to_safe_array : UInt64
    int_safe_array_to_native_array : UInt64
    rect_to_variant : UInt64
    variant_to_rect : UInt64
    safe_array_to_rect_native_array : UInt64
    create_proxy_factory_entry : UInt64
    get_proxy_factory_mapping : UInt64
    get_property_programmatic_name : UInt64
    get_pattern_programmatic_name : UInt64
    poll_for_potential_supported_patterns : UInt64
    poll_for_potential_supported_properties : UInt64
    check_not_supported : UInt64
    get_reserved_not_supported_value : UInt64
    get_reserved_mixed_attribute_value : UInt64
    element_from_i_accessible : UInt64
    element_from_i_accessible_build_cache : UInt64
    get_auto_set_focus : UInt64
    put_auto_set_focus : UInt64
    get_connection_timeout : UInt64
    put_connection_timeout : UInt64
    get_transaction_timeout : UInt64
    put_transaction_timeout : UInt64
    add_text_edit_text_changed_event_handler : UInt64
    remove_text_edit_text_changed_event_handler : UInt64
    add_changes_event_handler : UInt64
    remove_changes_event_handler : UInt64
    add_notification_event_handler : UInt64
    remove_notification_event_handler : UInt64
  end

  IUIAutomation5_GUID = "25f700c8-d816-4057-a9dc-3cbdee77e256"
  IID_IUIAutomation5 = LibC::GUID.new(0x25f700c8_u32, 0xd816_u16, 0x4057_u16, StaticArray[0xa9_u8, 0xdc_u8, 0x3c_u8, 0xbd_u8, 0xee_u8, 0x77_u8, 0xe2_u8, 0x56_u8])
  struct IUIAutomation5
    lpVtbl : IUIAutomation5VTbl*
  end

  struct IUIAutomation6VTbl
    query_interface : UInt64
    add_ref : UInt64
    release : UInt64
    compare_elements : UInt64
    compare_runtime_ids : UInt64
    get_root_element : UInt64
    element_from_handle : UInt64
    element_from_point : UInt64
    get_focused_element : UInt64
    get_root_element_build_cache : UInt64
    element_from_handle_build_cache : UInt64
    element_from_point_build_cache : UInt64
    get_focused_element_build_cache : UInt64
    create_tree_walker : UInt64
    get_control_view_walker : UInt64
    get_content_view_walker : UInt64
    get_raw_view_walker : UInt64
    get_raw_view_condition : UInt64
    get_control_view_condition : UInt64
    get_content_view_condition : UInt64
    create_cache_request : UInt64
    create_true_condition : UInt64
    create_false_condition : UInt64
    create_property_condition : UInt64
    create_property_condition_ex : UInt64
    create_and_condition : UInt64
    create_and_condition_from_array : UInt64
    create_and_condition_from_native_array : UInt64
    create_or_condition : UInt64
    create_or_condition_from_array : UInt64
    create_or_condition_from_native_array : UInt64
    create_not_condition : UInt64
    add_automation_event_handler : UInt64
    remove_automation_event_handler : UInt64
    add_property_changed_event_handler_native_array : UInt64
    add_property_changed_event_handler : UInt64
    remove_property_changed_event_handler : UInt64
    add_structure_changed_event_handler : UInt64
    remove_structure_changed_event_handler : UInt64
    add_focus_changed_event_handler : UInt64
    remove_focus_changed_event_handler : UInt64
    remove_all_event_handlers : UInt64
    int_native_array_to_safe_array : UInt64
    int_safe_array_to_native_array : UInt64
    rect_to_variant : UInt64
    variant_to_rect : UInt64
    safe_array_to_rect_native_array : UInt64
    create_proxy_factory_entry : UInt64
    get_proxy_factory_mapping : UInt64
    get_property_programmatic_name : UInt64
    get_pattern_programmatic_name : UInt64
    poll_for_potential_supported_patterns : UInt64
    poll_for_potential_supported_properties : UInt64
    check_not_supported : UInt64
    get_reserved_not_supported_value : UInt64
    get_reserved_mixed_attribute_value : UInt64
    element_from_i_accessible : UInt64
    element_from_i_accessible_build_cache : UInt64
    get_auto_set_focus : UInt64
    put_auto_set_focus : UInt64
    get_connection_timeout : UInt64
    put_connection_timeout : UInt64
    get_transaction_timeout : UInt64
    put_transaction_timeout : UInt64
    add_text_edit_text_changed_event_handler : UInt64
    remove_text_edit_text_changed_event_handler : UInt64
    add_changes_event_handler : UInt64
    remove_changes_event_handler : UInt64
    add_notification_event_handler : UInt64
    remove_notification_event_handler : UInt64
    create_event_handler_group : UInt64
    add_event_handler_group : UInt64
    remove_event_handler_group : UInt64
    get_connection_recovery_behavior : UInt64
    put_connection_recovery_behavior : UInt64
    get_coalesce_events : UInt64
    put_coalesce_events : UInt64
    add_active_text_position_changed_event_handler : UInt64
    remove_active_text_position_changed_event_handler : UInt64
  end

  IUIAutomation6_GUID = "aae072da-29e3-413d-87a7-192dbf81ed10"
  IID_IUIAutomation6 = LibC::GUID.new(0xaae072da_u32, 0x29e3_u16, 0x413d_u16, StaticArray[0x87_u8, 0xa7_u8, 0x19_u8, 0x2d_u8, 0xbf_u8, 0x81_u8, 0xed_u8, 0x10_u8])
  struct IUIAutomation6
    lpVtbl : IUIAutomation6VTbl*
  end


  # Params # riid : Guid* [In],wparam : LibC::UINT_PTR [In],punk : IUnknown [In]
  fun LresultFromObject(riid : Guid*, wparam : LibC::UINT_PTR, punk : IUnknown) : LRESULT

  # Params # lresult : LRESULT [In],riid : Guid* [In],wparam : LibC::UINT_PTR [In],ppvobject : Void** [In]
  fun ObjectFromLresult(lresult : LRESULT, riid : Guid*, wparam : LibC::UINT_PTR, ppvobject : Void**) : HRESULT

  # Params # param0 : IAccessible [In],phwnd : HANDLE* [In]
  fun WindowFromAccessibleObject(param0 : IAccessible, phwnd : HANDLE*) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],dwid : UInt32 [In],riid : Guid* [In],ppvobject : Void** [In]
  fun AccessibleObjectFromWindow(hwnd : LibC::HANDLE, dwid : UInt32, riid : Guid*, ppvobject : Void**) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],dwid : UInt32 [In],dwchildid : UInt32 [In],ppacc : IAccessible* [In],pvarchild : VARIANT* [In]
  fun AccessibleObjectFromEvent(hwnd : LibC::HANDLE, dwid : UInt32, dwchildid : UInt32, ppacc : IAccessible*, pvarchild : VARIANT*) : HRESULT

  # Params # ptscreen : POINT [In],ppacc : IAccessible* [In],pvarchild : VARIANT* [In]
  fun AccessibleObjectFromPoint(ptscreen : POINT, ppacc : IAccessible*, pvarchild : VARIANT*) : HRESULT

  # Params # pacccontainer : IAccessible [In],ichildstart : Int32 [In],cchildren : Int32 [In],rgvarchildren : VARIANT* [In],pcobtained : Int32* [In]
  fun AccessibleChildren(pacccontainer : IAccessible, ichildstart : Int32, cchildren : Int32, rgvarchildren : VARIANT*, pcobtained : Int32*) : HRESULT

  # Params # lrole : UInt32 [In],lpszrole : UInt8* [In],cchrolemax : UInt32 [In]
  fun GetRoleTextA(lrole : UInt32, lpszrole : UInt8*, cchrolemax : UInt32) : UInt32

  # Params # lrole : UInt32 [In],lpszrole : Char* [In],cchrolemax : UInt32 [In]
  fun GetRoleTextW(lrole : UInt32, lpszrole : Char*, cchrolemax : UInt32) : UInt32

  # Params # lstatebit : UInt32 [In],lpszstate : UInt8* [In],cchstate : UInt32 [In]
  fun GetStateTextA(lstatebit : UInt32, lpszstate : UInt8*, cchstate : UInt32) : UInt32

  # Params # lstatebit : UInt32 [In],lpszstate : Char* [In],cchstate : UInt32 [In]
  fun GetStateTextW(lstatebit : UInt32, lpszstate : Char*, cchstate : UInt32) : UInt32

  # Params # pver : UInt32* [In],pbuild : UInt32* [In]
  fun GetOleaccVersionInfo(pver : UInt32*, pbuild : UInt32*) : Void

  # Params # hwnd : LibC::HANDLE [In],idobject : Int32 [In],riid : Guid* [In],ppvobject : Void** [In]
  fun CreateStdAccessibleObject(hwnd : LibC::HANDLE, idobject : Int32, riid : Guid*, ppvobject : Void**) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],pclassname : PSTR [In],idobject : Int32 [In],riid : Guid* [In],ppvobject : Void** [In]
  fun CreateStdAccessibleProxyA(hwnd : LibC::HANDLE, pclassname : PSTR, idobject : Int32, riid : Guid*, ppvobject : Void**) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],pclassname : LibC::LPWSTR [In],idobject : Int32 [In],riid : Guid* [In],ppvobject : Void** [In]
  fun CreateStdAccessibleProxyW(hwnd : LibC::HANDLE, pclassname : LibC::LPWSTR, idobject : Int32, riid : Guid*, ppvobject : Void**) : HRESULT

  # Params # hwndapp : LibC::HANDLE [In],dwutilitystatemask : UInt32 [In],dwutilitystate : ACC_UTILITY_STATE_FLAGS [In]
  fun AccSetRunningUtilityState(hwndapp : LibC::HANDLE, dwutilitystatemask : UInt32, dwutilitystate : ACC_UTILITY_STATE_FLAGS) : HRESULT

  # Params # hwndapp : LibC::HANDLE [In],hwndtarget : LibC::HANDLE [In],pttarget : POINT [In]
  fun AccNotifyTouchInteraction(hwndapp : LibC::HANDLE, hwndtarget : LibC::HANDLE, pttarget : POINT) : HRESULT

  # Params # pdescription : UInt8** [In]
  fun UiaGetErrorDescription(pdescription : UInt8**) : LibC::BOOL

  # Params # pvar : VARIANT* [In],phnode : HUIANODE* [In]
  fun UiaHUiaNodeFromVariant(pvar : VARIANT*, phnode : HUIANODE*) : HRESULT

  # Params # pvar : VARIANT* [In],phobj : HUIAPATTERNOBJECT* [In]
  fun UiaHPatternObjectFromVariant(pvar : VARIANT*, phobj : HUIAPATTERNOBJECT*) : HRESULT

  # Params # pvar : VARIANT* [In],phtextrange : HUIATEXTRANGE* [In]
  fun UiaHTextRangeFromVariant(pvar : VARIANT*, phtextrange : HUIATEXTRANGE*) : HRESULT

  # Params # hnode : HUIANODE [In]
  fun UiaNodeRelease(hnode : HUIANODE) : LibC::BOOL

  # Params # hnode : HUIANODE [In],propertyid : Int32 [In],pvalue : VARIANT* [In]
  fun UiaGetPropertyValue(hnode : HUIANODE, propertyid : Int32, pvalue : VARIANT*) : HRESULT

  # Params # hnode : HUIANODE [In],patternid : Int32 [In],phobj : HUIAPATTERNOBJECT* [In]
  fun UiaGetPatternProvider(hnode : HUIANODE, patternid : Int32, phobj : HUIAPATTERNOBJECT*) : HRESULT

  # Params # hnode : HUIANODE [In],pruntimeid : SAFEARRAY** [In]
  fun UiaGetRuntimeId(hnode : HUIANODE, pruntimeid : SAFEARRAY**) : HRESULT

  # Params # hnode : HUIANODE [In]
  fun UiaSetFocus(hnode : HUIANODE) : HRESULT

  # Params # hnode : HUIANODE [In],direction : NavigateDirection [In],pcondition : UiaCondition* [In],prequest : UiaCacheRequest* [In],pprequesteddata : SAFEARRAY** [In],pptreestructure : UInt8** [In]
  fun UiaNavigate(hnode : HUIANODE, direction : NavigateDirection, pcondition : UiaCondition*, prequest : UiaCacheRequest*, pprequesteddata : SAFEARRAY**, pptreestructure : UInt8**) : HRESULT

  # Params # hnode : HUIANODE [In],prequest : UiaCacheRequest* [In],normalizestate : NormalizeState [In],pnormalizecondition : UiaCondition* [In],pprequesteddata : SAFEARRAY** [In],pptreestructure : UInt8** [In]
  fun UiaGetUpdatedCache(hnode : HUIANODE, prequest : UiaCacheRequest*, normalizestate : NormalizeState, pnormalizecondition : UiaCondition*, pprequesteddata : SAFEARRAY**, pptreestructure : UInt8**) : HRESULT

  # Params # hnode : HUIANODE [In],pparams : UiaFindParams* [In],prequest : UiaCacheRequest* [In],pprequesteddata : SAFEARRAY** [In],ppoffsets : SAFEARRAY** [In],pptreestructures : SAFEARRAY** [In]
  fun UiaFind(hnode : HUIANODE, pparams : UiaFindParams*, prequest : UiaCacheRequest*, pprequesteddata : SAFEARRAY**, ppoffsets : SAFEARRAY**, pptreestructures : SAFEARRAY**) : HRESULT

  # Params # x : Float64 [In],y : Float64 [In],prequest : UiaCacheRequest* [In],pprequesteddata : SAFEARRAY** [In],pptreestructure : UInt8** [In]
  fun UiaNodeFromPoint(x : Float64, y : Float64, prequest : UiaCacheRequest*, pprequesteddata : SAFEARRAY**, pptreestructure : UInt8**) : HRESULT

  # Params # prequest : UiaCacheRequest* [In],pprequesteddata : SAFEARRAY** [In],pptreestructure : UInt8** [In]
  fun UiaNodeFromFocus(prequest : UiaCacheRequest*, pprequesteddata : SAFEARRAY**, pptreestructure : UInt8**) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],phnode : HUIANODE* [In]
  fun UiaNodeFromHandle(hwnd : LibC::HANDLE, phnode : HUIANODE*) : HRESULT

  # Params # pprovider : IRawElementProviderSimple [In],phnode : HUIANODE* [In]
  fun UiaNodeFromProvider(pprovider : IRawElementProviderSimple, phnode : HUIANODE*) : HRESULT

  # Params # phnode : HUIANODE* [In]
  fun UiaGetRootNode(phnode : HUIANODE*) : HRESULT

  # Params # pcallback : UiaProviderCallback* [In]
  fun UiaRegisterProviderCallback(pcallback : UiaProviderCallback*) : Void

  # Params # type : AutomationIdentifierType [In],pguid : Guid* [In]
  fun UiaLookupId(type : AutomationIdentifierType, pguid : Guid*) : Int32

  # Params # punknotsupportedvalue : IUnknown* [In]
  fun UiaGetReservedNotSupportedValue(punknotsupportedvalue : IUnknown*) : HRESULT

  # Params # punkmixedattributevalue : IUnknown* [In]
  fun UiaGetReservedMixedAttributeValue(punkmixedattributevalue : IUnknown*) : HRESULT

  # Params # 
  fun UiaClientsAreListening : LibC::BOOL

  # Params # pprovider : IRawElementProviderSimple [In],id : Int32 [In],oldvalue : VARIANT [In],newvalue : VARIANT [In]
  fun UiaRaiseAutomationPropertyChangedEvent(pprovider : IRawElementProviderSimple, id : Int32, oldvalue : VARIANT, newvalue : VARIANT) : HRESULT

  # Params # pprovider : IRawElementProviderSimple [In],id : Int32 [In]
  fun UiaRaiseAutomationEvent(pprovider : IRawElementProviderSimple, id : Int32) : HRESULT

  # Params # pprovider : IRawElementProviderSimple [In],structurechangetype : StructureChangeType [In],pruntimeid : Int32* [In],cruntimeidlen : Int32 [In]
  fun UiaRaiseStructureChangedEvent(pprovider : IRawElementProviderSimple, structurechangetype : StructureChangeType, pruntimeid : Int32*, cruntimeidlen : Int32) : HRESULT

  # Params # pprovider : IRawElementProviderSimple [In],asynccontentloadedstate : AsyncContentLoadedState [In],percentcomplete : Float64 [In]
  fun UiaRaiseAsyncContentLoadedEvent(pprovider : IRawElementProviderSimple, asynccontentloadedstate : AsyncContentLoadedState, percentcomplete : Float64) : HRESULT

  # Params # pprovider : IRawElementProviderSimple [In],texteditchangetype : TextEditChangeType [In],pchangeddata : SAFEARRAY* [In]
  fun UiaRaiseTextEditTextChangedEvent(pprovider : IRawElementProviderSimple, texteditchangetype : TextEditChangeType, pchangeddata : SAFEARRAY*) : HRESULT

  # Params # pprovider : IRawElementProviderSimple [In],eventidcount : Int32 [In],puiachanges : UiaChangeInfo* [In]
  fun UiaRaiseChangesEvent(pprovider : IRawElementProviderSimple, eventidcount : Int32, puiachanges : UiaChangeInfo*) : HRESULT

  # Params # provider : IRawElementProviderSimple [In],notificationkind : NotificationKind [In],notificationprocessing : NotificationProcessing [In],displaystring : UInt8* [In],activityid : UInt8* [In]
  fun UiaRaiseNotificationEvent(provider : IRawElementProviderSimple, notificationkind : NotificationKind, notificationprocessing : NotificationProcessing, displaystring : UInt8*, activityid : UInt8*) : HRESULT

  # Params # provider : IRawElementProviderSimple [In],textrange : ITextRangeProvider [In]
  fun UiaRaiseActiveTextPositionChangedEvent(provider : IRawElementProviderSimple, textrange : ITextRangeProvider) : HRESULT

  # Params # hnode : HUIANODE [In],eventid : Int32 [In],pcallback : UiaEventCallback* [In],scope : TreeScope [In],pproperties : Int32* [In],cproperties : Int32 [In],prequest : UiaCacheRequest* [In],phevent : HUIAEVENT* [In]
  fun UiaAddEvent(hnode : HUIANODE, eventid : Int32, pcallback : UiaEventCallback*, scope : TreeScope, pproperties : Int32*, cproperties : Int32, prequest : UiaCacheRequest*, phevent : HUIAEVENT*) : HRESULT

  # Params # hevent : HUIAEVENT [In]
  fun UiaRemoveEvent(hevent : HUIAEVENT) : HRESULT

  # Params # hevent : HUIAEVENT [In],hwnd : LibC::HANDLE [In]
  fun UiaEventAddWindow(hevent : HUIAEVENT, hwnd : LibC::HANDLE) : HRESULT

  # Params # hevent : HUIAEVENT [In],hwnd : LibC::HANDLE [In]
  fun UiaEventRemoveWindow(hevent : HUIAEVENT, hwnd : LibC::HANDLE) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],dockposition : DockPosition [In]
  fun DockPattern_SetDockPosition(hobj : HUIAPATTERNOBJECT, dockposition : DockPosition) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In]
  fun ExpandCollapsePattern_Collapse(hobj : HUIAPATTERNOBJECT) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In]
  fun ExpandCollapsePattern_Expand(hobj : HUIAPATTERNOBJECT) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],row : Int32 [In],column : Int32 [In],presult : HUIANODE* [In]
  fun GridPattern_GetItem(hobj : HUIAPATTERNOBJECT, row : Int32, column : Int32, presult : HUIANODE*) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In]
  fun InvokePattern_Invoke(hobj : HUIAPATTERNOBJECT) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],viewid : Int32 [In],ppstr : UInt8** [In]
  fun MultipleViewPattern_GetViewName(hobj : HUIAPATTERNOBJECT, viewid : Int32, ppstr : UInt8**) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],viewid : Int32 [In]
  fun MultipleViewPattern_SetCurrentView(hobj : HUIAPATTERNOBJECT, viewid : Int32) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],val : Float64 [In]
  fun RangeValuePattern_SetValue(hobj : HUIAPATTERNOBJECT, val : Float64) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In]
  fun ScrollItemPattern_ScrollIntoView(hobj : HUIAPATTERNOBJECT) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],horizontalamount : ScrollAmount [In],verticalamount : ScrollAmount [In]
  fun ScrollPattern_Scroll(hobj : HUIAPATTERNOBJECT, horizontalamount : ScrollAmount, verticalamount : ScrollAmount) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],horizontalpercent : Float64 [In],verticalpercent : Float64 [In]
  fun ScrollPattern_SetScrollPercent(hobj : HUIAPATTERNOBJECT, horizontalpercent : Float64, verticalpercent : Float64) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In]
  fun SelectionItemPattern_AddToSelection(hobj : HUIAPATTERNOBJECT) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In]
  fun SelectionItemPattern_RemoveFromSelection(hobj : HUIAPATTERNOBJECT) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In]
  fun SelectionItemPattern_Select(hobj : HUIAPATTERNOBJECT) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In]
  fun TogglePattern_Toggle(hobj : HUIAPATTERNOBJECT) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],x : Float64 [In],y : Float64 [In]
  fun TransformPattern_Move(hobj : HUIAPATTERNOBJECT, x : Float64, y : Float64) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],width : Float64 [In],height : Float64 [In]
  fun TransformPattern_Resize(hobj : HUIAPATTERNOBJECT, width : Float64, height : Float64) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],degrees : Float64 [In]
  fun TransformPattern_Rotate(hobj : HUIAPATTERNOBJECT, degrees : Float64) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],pval : LibC::LPWSTR [In]
  fun ValuePattern_SetValue(hobj : HUIAPATTERNOBJECT, pval : LibC::LPWSTR) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In]
  fun WindowPattern_Close(hobj : HUIAPATTERNOBJECT) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],state : WindowVisualState [In]
  fun WindowPattern_SetWindowVisualState(hobj : HUIAPATTERNOBJECT, state : WindowVisualState) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],milliseconds : Int32 [In],presult : LibC::BOOL* [In]
  fun WindowPattern_WaitForInputIdle(hobj : HUIAPATTERNOBJECT, milliseconds : Int32, presult : LibC::BOOL*) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],pretval : SAFEARRAY** [In]
  fun TextPattern_GetSelection(hobj : HUIAPATTERNOBJECT, pretval : SAFEARRAY**) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],pretval : SAFEARRAY** [In]
  fun TextPattern_GetVisibleRanges(hobj : HUIAPATTERNOBJECT, pretval : SAFEARRAY**) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],hnodechild : HUIANODE [In],pretval : HUIATEXTRANGE* [In]
  fun TextPattern_RangeFromChild(hobj : HUIAPATTERNOBJECT, hnodechild : HUIANODE, pretval : HUIATEXTRANGE*) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],point : UiaPoint [In],pretval : HUIATEXTRANGE* [In]
  fun TextPattern_RangeFromPoint(hobj : HUIAPATTERNOBJECT, point : UiaPoint, pretval : HUIATEXTRANGE*) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],pretval : HUIATEXTRANGE* [In]
  fun TextPattern_get_DocumentRange(hobj : HUIAPATTERNOBJECT, pretval : HUIATEXTRANGE*) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],pretval : SupportedTextSelection* [In]
  fun TextPattern_get_SupportedTextSelection(hobj : HUIAPATTERNOBJECT, pretval : SupportedTextSelection*) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],pretval : HUIATEXTRANGE* [In]
  fun TextRange_Clone(hobj : HUIATEXTRANGE, pretval : HUIATEXTRANGE*) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],range : HUIATEXTRANGE [In],pretval : LibC::BOOL* [In]
  fun TextRange_Compare(hobj : HUIATEXTRANGE, range : HUIATEXTRANGE, pretval : LibC::BOOL*) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],endpoint : TextPatternRangeEndpoint [In],targetrange : HUIATEXTRANGE [In],targetendpoint : TextPatternRangeEndpoint [In],pretval : Int32* [In]
  fun TextRange_CompareEndpoints(hobj : HUIATEXTRANGE, endpoint : TextPatternRangeEndpoint, targetrange : HUIATEXTRANGE, targetendpoint : TextPatternRangeEndpoint, pretval : Int32*) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],unit : TextUnit [In]
  fun TextRange_ExpandToEnclosingUnit(hobj : HUIATEXTRANGE, unit : TextUnit) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],attributeid : Int32 [In],pretval : VARIANT* [In]
  fun TextRange_GetAttributeValue(hobj : HUIATEXTRANGE, attributeid : Int32, pretval : VARIANT*) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],attributeid : Int32 [In],val : VARIANT [In],backward : LibC::BOOL [In],pretval : HUIATEXTRANGE* [In]
  fun TextRange_FindAttribute(hobj : HUIATEXTRANGE, attributeid : Int32, val : VARIANT, backward : LibC::BOOL, pretval : HUIATEXTRANGE*) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],text : UInt8* [In],backward : LibC::BOOL [In],ignorecase : LibC::BOOL [In],pretval : HUIATEXTRANGE* [In]
  fun TextRange_FindText(hobj : HUIATEXTRANGE, text : UInt8*, backward : LibC::BOOL, ignorecase : LibC::BOOL, pretval : HUIATEXTRANGE*) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],pretval : SAFEARRAY** [In]
  fun TextRange_GetBoundingRectangles(hobj : HUIATEXTRANGE, pretval : SAFEARRAY**) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],pretval : HUIANODE* [In]
  fun TextRange_GetEnclosingElement(hobj : HUIATEXTRANGE, pretval : HUIANODE*) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],maxlength : Int32 [In],pretval : UInt8** [In]
  fun TextRange_GetText(hobj : HUIATEXTRANGE, maxlength : Int32, pretval : UInt8**) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],unit : TextUnit [In],count : Int32 [In],pretval : Int32* [In]
  fun TextRange_Move(hobj : HUIATEXTRANGE, unit : TextUnit, count : Int32, pretval : Int32*) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],endpoint : TextPatternRangeEndpoint [In],unit : TextUnit [In],count : Int32 [In],pretval : Int32* [In]
  fun TextRange_MoveEndpointByUnit(hobj : HUIATEXTRANGE, endpoint : TextPatternRangeEndpoint, unit : TextUnit, count : Int32, pretval : Int32*) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],endpoint : TextPatternRangeEndpoint [In],targetrange : HUIATEXTRANGE [In],targetendpoint : TextPatternRangeEndpoint [In]
  fun TextRange_MoveEndpointByRange(hobj : HUIATEXTRANGE, endpoint : TextPatternRangeEndpoint, targetrange : HUIATEXTRANGE, targetendpoint : TextPatternRangeEndpoint) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In]
  fun TextRange_Select(hobj : HUIATEXTRANGE) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In]
  fun TextRange_AddToSelection(hobj : HUIATEXTRANGE) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In]
  fun TextRange_RemoveFromSelection(hobj : HUIATEXTRANGE) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],aligntotop : LibC::BOOL [In]
  fun TextRange_ScrollIntoView(hobj : HUIATEXTRANGE, aligntotop : LibC::BOOL) : HRESULT

  # Params # hobj : HUIATEXTRANGE [In],pretval : SAFEARRAY** [In]
  fun TextRange_GetChildren(hobj : HUIATEXTRANGE, pretval : SAFEARRAY**) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],hnodestartafter : HUIANODE [In],propertyid : Int32 [In],value : VARIANT [In],pfound : HUIANODE* [In]
  fun ItemContainerPattern_FindItemByProperty(hobj : HUIAPATTERNOBJECT, hnodestartafter : HUIANODE, propertyid : Int32, value : VARIANT, pfound : HUIANODE*) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],flagsselect : Int32 [In]
  fun LegacyIAccessiblePattern_Select(hobj : HUIAPATTERNOBJECT, flagsselect : Int32) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In]
  fun LegacyIAccessiblePattern_DoDefaultAction(hobj : HUIAPATTERNOBJECT) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],szvalue : LibC::LPWSTR [In]
  fun LegacyIAccessiblePattern_SetValue(hobj : HUIAPATTERNOBJECT, szvalue : LibC::LPWSTR) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],paccessible : IAccessible* [In]
  fun LegacyIAccessiblePattern_GetIAccessible(hobj : HUIAPATTERNOBJECT, paccessible : IAccessible*) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In],inputtype : SynchronizedInputType [In]
  fun SynchronizedInputPattern_StartListening(hobj : HUIAPATTERNOBJECT, inputtype : SynchronizedInputType) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In]
  fun SynchronizedInputPattern_Cancel(hobj : HUIAPATTERNOBJECT) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In]
  fun VirtualizedItemPattern_Realize(hobj : HUIAPATTERNOBJECT) : HRESULT

  # Params # hobj : HUIAPATTERNOBJECT [In]
  fun UiaPatternRelease(hobj : HUIAPATTERNOBJECT) : LibC::BOOL

  # Params # hobj : HUIATEXTRANGE [In]
  fun UiaTextRangeRelease(hobj : HUIATEXTRANGE) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],wparam : LibC::UINT_PTR [In],lparam : LPARAM [In],el : IRawElementProviderSimple [In]
  fun UiaReturnRawElementProvider(hwnd : LibC::HANDLE, wparam : LibC::UINT_PTR, lparam : LPARAM, el : IRawElementProviderSimple) : LRESULT

  # Params # hwnd : LibC::HANDLE [In],ppprovider : IRawElementProviderSimple* [In]
  fun UiaHostProviderFromHwnd(hwnd : LibC::HANDLE, ppprovider : IRawElementProviderSimple*) : HRESULT

  # Params # hwnd : LibC::HANDLE [In],idobject : Int32 [In],idchild : Int32 [In],ppprovider : IRawElementProviderSimple* [In]
  fun UiaProviderForNonClient(hwnd : LibC::HANDLE, idobject : Int32, idchild : Int32, ppprovider : IRawElementProviderSimple*) : HRESULT

  # Params # pprovider : IRawElementProviderSimple [In],dwflags : UInt32 [In],ppaccessible : IAccessible* [In],pvarchild : VARIANT* [In]
  fun UiaIAccessibleFromProvider(pprovider : IRawElementProviderSimple, dwflags : UInt32, ppaccessible : IAccessible*, pvarchild : VARIANT*) : HRESULT

  # Params # paccessible : IAccessible [In],idchild : Int32 [In],dwflags : UInt32 [In],ppprovider : IRawElementProviderSimple* [In]
  fun UiaProviderFromIAccessible(paccessible : IAccessible, idchild : Int32, dwflags : UInt32, ppprovider : IRawElementProviderSimple*) : HRESULT

  # Params # 
  fun UiaDisconnectAllProviders : HRESULT

  # Params # pprovider : IRawElementProviderSimple [In]
  fun UiaDisconnectProvider(pprovider : IRawElementProviderSimple) : HRESULT

  # Params # hwnd : LibC::HANDLE [In]
  fun UiaHasServerSideProvider(hwnd : LibC::HANDLE) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],pointertype : POINTER_INPUT_TYPE [In]
  fun RegisterPointerInputTarget(hwnd : LibC::HANDLE, pointertype : POINTER_INPUT_TYPE) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],pointertype : POINTER_INPUT_TYPE [In]
  fun UnregisterPointerInputTarget(hwnd : LibC::HANDLE, pointertype : POINTER_INPUT_TYPE) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],pointertype : POINTER_INPUT_TYPE [In],fobserve : LibC::BOOL [In]
  fun RegisterPointerInputTargetEx(hwnd : LibC::HANDLE, pointertype : POINTER_INPUT_TYPE, fobserve : LibC::BOOL) : LibC::BOOL

  # Params # hwnd : LibC::HANDLE [In],pointertype : POINTER_INPUT_TYPE [In]
  fun UnregisterPointerInputTargetEx(hwnd : LibC::HANDLE, pointertype : POINTER_INPUT_TYPE) : LibC::BOOL

  # Params # event : UInt32 [In],hwnd : LibC::HANDLE [In],idobject : Int32 [In],idchild : Int32 [In]
  fun NotifyWinEvent(event : UInt32, hwnd : LibC::HANDLE, idobject : Int32, idchild : Int32) : Void

  # Params # eventmin : UInt32 [In],eventmax : UInt32 [In],hmodwineventproc : HINSTANCE [In],pfnwineventproc : WINEVENTPROC [In],idprocess : UInt32 [In],idthread : UInt32 [In],dwflags : UInt32 [In]
  fun SetWinEventHook(eventmin : UInt32, eventmax : UInt32, hmodwineventproc : HINSTANCE, pfnwineventproc : WINEVENTPROC, idprocess : UInt32, idthread : UInt32, dwflags : UInt32) : HWINEVENTHOOK

  # Params # event : UInt32 [In]
  fun IsWinEventHookInstalled(event : UInt32) : LibC::BOOL

  # Params # hwineventhook : HWINEVENTHOOK [In]
  fun UnhookWinEvent(hwineventhook : HWINEVENTHOOK) : LibC::BOOL
end
struct LibWin32::IRicheditWindowlessAccessibility
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_provider(psite : IRawElementProviderWindowlessSite, ppprovider : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.create_provider.unsafe_as(Proc(IRawElementProviderWindowlessSite, IRawElementProviderSimple*, HRESULT)).call(psite, ppprovider)
  end
end
struct LibWin32::IRichEditUiaInformation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_boundary_rectangle(puiarect : UiaRect*) : HRESULT
    @lpVtbl.value.get_boundary_rectangle.unsafe_as(Proc(UiaRect*, HRESULT)).call(puiarect)
  end
  def is_visible : HRESULT
    @lpVtbl.value.is_visible.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IAccessible
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_type_info_count(pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.unsafe_as(Proc(UInt32*, HRESULT)).call(pctinfo)
  end
  def get_type_info(itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.unsafe_as(Proc(UInt32, UInt32, ITypeInfo*, HRESULT)).call(itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.unsafe_as(Proc(Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)).call(riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)).call(dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_acc_parent(ppdispparent : IDispatch*) : HRESULT
    @lpVtbl.value.get_acc_parent.unsafe_as(Proc(IDispatch*, HRESULT)).call(ppdispparent)
  end
  def get_acc_child_count(pcountchildren : Int32*) : HRESULT
    @lpVtbl.value.get_acc_child_count.unsafe_as(Proc(Int32*, HRESULT)).call(pcountchildren)
  end
  def get_acc_child(varchild : VARIANT, ppdispchild : IDispatch*) : HRESULT
    @lpVtbl.value.get_acc_child.unsafe_as(Proc(VARIANT, IDispatch*, HRESULT)).call(varchild, ppdispchild)
  end
  def get_acc_name(varchild : VARIANT, pszname : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_name.unsafe_as(Proc(VARIANT, UInt8**, HRESULT)).call(varchild, pszname)
  end
  def get_acc_value(varchild : VARIANT, pszvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_value.unsafe_as(Proc(VARIANT, UInt8**, HRESULT)).call(varchild, pszvalue)
  end
  def get_acc_description(varchild : VARIANT, pszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_description.unsafe_as(Proc(VARIANT, UInt8**, HRESULT)).call(varchild, pszdescription)
  end
  def get_acc_role(varchild : VARIANT, pvarrole : VARIANT*) : HRESULT
    @lpVtbl.value.get_acc_role.unsafe_as(Proc(VARIANT, VARIANT*, HRESULT)).call(varchild, pvarrole)
  end
  def get_acc_state(varchild : VARIANT, pvarstate : VARIANT*) : HRESULT
    @lpVtbl.value.get_acc_state.unsafe_as(Proc(VARIANT, VARIANT*, HRESULT)).call(varchild, pvarstate)
  end
  def get_acc_help(varchild : VARIANT, pszhelp : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_help.unsafe_as(Proc(VARIANT, UInt8**, HRESULT)).call(varchild, pszhelp)
  end
  def get_acc_help_topic(pszhelpfile : UInt8**, varchild : VARIANT, pidtopic : Int32*) : HRESULT
    @lpVtbl.value.get_acc_help_topic.unsafe_as(Proc(UInt8**, VARIANT, Int32*, HRESULT)).call(pszhelpfile, varchild, pidtopic)
  end
  def get_acc_keyboard_shortcut(varchild : VARIANT, pszkeyboardshortcut : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_keyboard_shortcut.unsafe_as(Proc(VARIANT, UInt8**, HRESULT)).call(varchild, pszkeyboardshortcut)
  end
  def get_acc_focus(pvarchild : VARIANT*) : HRESULT
    @lpVtbl.value.get_acc_focus.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarchild)
  end
  def get_acc_selection(pvarchildren : VARIANT*) : HRESULT
    @lpVtbl.value.get_acc_selection.unsafe_as(Proc(VARIANT*, HRESULT)).call(pvarchildren)
  end
  def get_acc_default_action(varchild : VARIANT, pszdefaultaction : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_default_action.unsafe_as(Proc(VARIANT, UInt8**, HRESULT)).call(varchild, pszdefaultaction)
  end
  def acc_select(flagsselect : Int32, varchild : VARIANT) : HRESULT
    @lpVtbl.value.acc_select.unsafe_as(Proc(Int32, VARIANT, HRESULT)).call(flagsselect, varchild)
  end
  def acc_location(pxleft : Int32*, pytop : Int32*, pcxwidth : Int32*, pcyheight : Int32*, varchild : VARIANT) : HRESULT
    @lpVtbl.value.acc_location.unsafe_as(Proc(Int32*, Int32*, Int32*, Int32*, VARIANT, HRESULT)).call(pxleft, pytop, pcxwidth, pcyheight, varchild)
  end
  def acc_navigate(navdir : Int32, varstart : VARIANT, pvarendupat : VARIANT*) : HRESULT
    @lpVtbl.value.acc_navigate.unsafe_as(Proc(Int32, VARIANT, VARIANT*, HRESULT)).call(navdir, varstart, pvarendupat)
  end
  def acc_hit_test(xleft : Int32, ytop : Int32, pvarchild : VARIANT*) : HRESULT
    @lpVtbl.value.acc_hit_test.unsafe_as(Proc(Int32, Int32, VARIANT*, HRESULT)).call(xleft, ytop, pvarchild)
  end
  def acc_do_default_action(varchild : VARIANT) : HRESULT
    @lpVtbl.value.acc_do_default_action.unsafe_as(Proc(VARIANT, HRESULT)).call(varchild)
  end
  def put_acc_name(varchild : VARIANT, szname : UInt8*) : HRESULT
    @lpVtbl.value.put_acc_name.unsafe_as(Proc(VARIANT, UInt8*, HRESULT)).call(varchild, szname)
  end
  def put_acc_value(varchild : VARIANT, szvalue : UInt8*) : HRESULT
    @lpVtbl.value.put_acc_value.unsafe_as(Proc(VARIANT, UInt8*, HRESULT)).call(varchild, szvalue)
  end
end
struct LibWin32::IAccessibleHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def accessible_object_from_id(hwnd : Int32, lobjectid : Int32, piaccessible : IAccessible*) : HRESULT
    @lpVtbl.value.accessible_object_from_id.unsafe_as(Proc(Int32, Int32, IAccessible*, HRESULT)).call(hwnd, lobjectid, piaccessible)
  end
end
struct LibWin32::IAccessibleWindowlessSite
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def acquire_object_id_range(rangesize : Int32, prangeowner : IAccessibleHandler, prangebase : Int32*) : HRESULT
    @lpVtbl.value.acquire_object_id_range.unsafe_as(Proc(Int32, IAccessibleHandler, Int32*, HRESULT)).call(rangesize, prangeowner, prangebase)
  end
  def release_object_id_range(rangebase : Int32, prangeowner : IAccessibleHandler) : HRESULT
    @lpVtbl.value.release_object_id_range.unsafe_as(Proc(Int32, IAccessibleHandler, HRESULT)).call(rangebase, prangeowner)
  end
  def query_object_id_ranges(prangesowner : IAccessibleHandler, psaranges : SAFEARRAY**) : HRESULT
    @lpVtbl.value.query_object_id_ranges.unsafe_as(Proc(IAccessibleHandler, SAFEARRAY**, HRESULT)).call(prangesowner, psaranges)
  end
  def get_parent_accessible(ppparent : IAccessible*) : HRESULT
    @lpVtbl.value.get_parent_accessible.unsafe_as(Proc(IAccessible*, HRESULT)).call(ppparent)
  end
end
struct LibWin32::IAccIdentity
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_identity_string(dwidchild : UInt32, ppidstring : UInt8**, pdwidstringlen : UInt32*) : HRESULT
    @lpVtbl.value.get_identity_string.unsafe_as(Proc(UInt32, UInt8**, UInt32*, HRESULT)).call(dwidchild, ppidstring, pdwidstringlen)
  end
end
struct LibWin32::IAccPropServer
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_prop_value(pidstring : UInt8*, dwidstringlen : UInt32, idprop : Guid, pvarvalue : VARIANT*, pfhasprop : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_prop_value.unsafe_as(Proc(UInt8*, UInt32, Guid, VARIANT*, LibC::BOOL*, HRESULT)).call(pidstring, dwidstringlen, idprop, pvarvalue, pfhasprop)
  end
end
struct LibWin32::IAccPropServices
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_prop_value(pidstring : UInt8*, dwidstringlen : UInt32, idprop : Guid, var : VARIANT) : HRESULT
    @lpVtbl.value.set_prop_value.unsafe_as(Proc(UInt8*, UInt32, Guid, VARIANT, HRESULT)).call(pidstring, dwidstringlen, idprop, var)
  end
  def set_prop_server(pidstring : UInt8*, dwidstringlen : UInt32, paprops : Guid*, cprops : Int32, pserver : IAccPropServer, annoscope : AnnoScope) : HRESULT
    @lpVtbl.value.set_prop_server.unsafe_as(Proc(UInt8*, UInt32, Guid*, Int32, IAccPropServer, AnnoScope, HRESULT)).call(pidstring, dwidstringlen, paprops, cprops, pserver, annoscope)
  end
  def clear_props(pidstring : UInt8*, dwidstringlen : UInt32, paprops : Guid*, cprops : Int32) : HRESULT
    @lpVtbl.value.clear_props.unsafe_as(Proc(UInt8*, UInt32, Guid*, Int32, HRESULT)).call(pidstring, dwidstringlen, paprops, cprops)
  end
  def set_hwnd_prop(hwnd : LibC::HANDLE, idobject : UInt32, idchild : UInt32, idprop : Guid, var : VARIANT) : HRESULT
    @lpVtbl.value.set_hwnd_prop.unsafe_as(Proc(LibC::HANDLE, UInt32, UInt32, Guid, VARIANT, HRESULT)).call(hwnd, idobject, idchild, idprop, var)
  end
  def set_hwnd_prop_str(hwnd : LibC::HANDLE, idobject : UInt32, idchild : UInt32, idprop : Guid, str : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_hwnd_prop_str.unsafe_as(Proc(LibC::HANDLE, UInt32, UInt32, Guid, LibC::LPWSTR, HRESULT)).call(hwnd, idobject, idchild, idprop, str)
  end
  def set_hwnd_prop_server(hwnd : LibC::HANDLE, idobject : UInt32, idchild : UInt32, paprops : Guid*, cprops : Int32, pserver : IAccPropServer, annoscope : AnnoScope) : HRESULT
    @lpVtbl.value.set_hwnd_prop_server.unsafe_as(Proc(LibC::HANDLE, UInt32, UInt32, Guid*, Int32, IAccPropServer, AnnoScope, HRESULT)).call(hwnd, idobject, idchild, paprops, cprops, pserver, annoscope)
  end
  def clear_hwnd_props(hwnd : LibC::HANDLE, idobject : UInt32, idchild : UInt32, paprops : Guid*, cprops : Int32) : HRESULT
    @lpVtbl.value.clear_hwnd_props.unsafe_as(Proc(LibC::HANDLE, UInt32, UInt32, Guid*, Int32, HRESULT)).call(hwnd, idobject, idchild, paprops, cprops)
  end
  def compose_hwnd_identity_string(hwnd : LibC::HANDLE, idobject : UInt32, idchild : UInt32, ppidstring : UInt8**, pdwidstringlen : UInt32*) : HRESULT
    @lpVtbl.value.compose_hwnd_identity_string.unsafe_as(Proc(LibC::HANDLE, UInt32, UInt32, UInt8**, UInt32*, HRESULT)).call(hwnd, idobject, idchild, ppidstring, pdwidstringlen)
  end
  def decompose_hwnd_identity_string(pidstring : UInt8*, dwidstringlen : UInt32, phwnd : HANDLE*, pidobject : UInt32*, pidchild : UInt32*) : HRESULT
    @lpVtbl.value.decompose_hwnd_identity_string.unsafe_as(Proc(UInt8*, UInt32, HANDLE*, UInt32*, UInt32*, HRESULT)).call(pidstring, dwidstringlen, phwnd, pidobject, pidchild)
  end
  def set_hmenu_prop(hmenu : LibC::HANDLE, idchild : UInt32, idprop : Guid, var : VARIANT) : HRESULT
    @lpVtbl.value.set_hmenu_prop.unsafe_as(Proc(LibC::HANDLE, UInt32, Guid, VARIANT, HRESULT)).call(hmenu, idchild, idprop, var)
  end
  def set_hmenu_prop_str(hmenu : LibC::HANDLE, idchild : UInt32, idprop : Guid, str : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_hmenu_prop_str.unsafe_as(Proc(LibC::HANDLE, UInt32, Guid, LibC::LPWSTR, HRESULT)).call(hmenu, idchild, idprop, str)
  end
  def set_hmenu_prop_server(hmenu : LibC::HANDLE, idchild : UInt32, paprops : Guid*, cprops : Int32, pserver : IAccPropServer, annoscope : AnnoScope) : HRESULT
    @lpVtbl.value.set_hmenu_prop_server.unsafe_as(Proc(LibC::HANDLE, UInt32, Guid*, Int32, IAccPropServer, AnnoScope, HRESULT)).call(hmenu, idchild, paprops, cprops, pserver, annoscope)
  end
  def clear_hmenu_props(hmenu : LibC::HANDLE, idchild : UInt32, paprops : Guid*, cprops : Int32) : HRESULT
    @lpVtbl.value.clear_hmenu_props.unsafe_as(Proc(LibC::HANDLE, UInt32, Guid*, Int32, HRESULT)).call(hmenu, idchild, paprops, cprops)
  end
  def compose_hmenu_identity_string(hmenu : LibC::HANDLE, idchild : UInt32, ppidstring : UInt8**, pdwidstringlen : UInt32*) : HRESULT
    @lpVtbl.value.compose_hmenu_identity_string.unsafe_as(Proc(LibC::HANDLE, UInt32, UInt8**, UInt32*, HRESULT)).call(hmenu, idchild, ppidstring, pdwidstringlen)
  end
  def decompose_hmenu_identity_string(pidstring : UInt8*, dwidstringlen : UInt32, phmenu : HANDLE*, pidchild : UInt32*) : HRESULT
    @lpVtbl.value.decompose_hmenu_identity_string.unsafe_as(Proc(UInt8*, UInt32, HANDLE*, UInt32*, HRESULT)).call(pidstring, dwidstringlen, phmenu, pidchild)
  end
end
struct LibWin32::IRawElementProviderSimple
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_provider_options(pretval : ProviderOptions*) : HRESULT
    @lpVtbl.value.get_provider_options.unsafe_as(Proc(ProviderOptions*, HRESULT)).call(pretval)
  end
  def get_pattern_provider(patternid : Int32, pretval : IUnknown*) : HRESULT
    @lpVtbl.value.get_pattern_provider.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, pretval)
  end
  def get_property_value(propertyid : Int32, pretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, pretval)
  end
  def get_host_raw_element_provider(pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_host_raw_element_provider.unsafe_as(Proc(IRawElementProviderSimple*, HRESULT)).call(pretval)
  end
end
struct LibWin32::IAccessibleEx
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_object_for_child(idchild : Int32, pretval : IAccessibleEx*) : HRESULT
    @lpVtbl.value.get_object_for_child.unsafe_as(Proc(Int32, IAccessibleEx*, HRESULT)).call(idchild, pretval)
  end
  def get_i_accessible_pair(ppacc : IAccessible*, pidchild : Int32*) : HRESULT
    @lpVtbl.value.get_i_accessible_pair.unsafe_as(Proc(IAccessible*, Int32*, HRESULT)).call(ppacc, pidchild)
  end
  def get_runtime_id(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def convert_returned_element(pin : IRawElementProviderSimple, ppretvalout : IAccessibleEx*) : HRESULT
    @lpVtbl.value.convert_returned_element.unsafe_as(Proc(IRawElementProviderSimple, IAccessibleEx*, HRESULT)).call(pin, ppretvalout)
  end
end
struct LibWin32::IRawElementProviderSimple2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_provider_options(pretval : ProviderOptions*) : HRESULT
    @lpVtbl.value.get_provider_options.unsafe_as(Proc(ProviderOptions*, HRESULT)).call(pretval)
  end
  def get_pattern_provider(patternid : Int32, pretval : IUnknown*) : HRESULT
    @lpVtbl.value.get_pattern_provider.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, pretval)
  end
  def get_property_value(propertyid : Int32, pretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, pretval)
  end
  def get_host_raw_element_provider(pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_host_raw_element_provider.unsafe_as(Proc(IRawElementProviderSimple*, HRESULT)).call(pretval)
  end
  def show_context_menu : HRESULT
    @lpVtbl.value.show_context_menu.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IRawElementProviderSimple3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_provider_options(pretval : ProviderOptions*) : HRESULT
    @lpVtbl.value.get_provider_options.unsafe_as(Proc(ProviderOptions*, HRESULT)).call(pretval)
  end
  def get_pattern_provider(patternid : Int32, pretval : IUnknown*) : HRESULT
    @lpVtbl.value.get_pattern_provider.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, pretval)
  end
  def get_property_value(propertyid : Int32, pretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, pretval)
  end
  def get_host_raw_element_provider(pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_host_raw_element_provider.unsafe_as(Proc(IRawElementProviderSimple*, HRESULT)).call(pretval)
  end
  def show_context_menu : HRESULT
    @lpVtbl.value.show_context_menu.unsafe_as(Proc(HRESULT)).call
  end
  def get_metadata_value(targetid : Int32, metadataid : Int32, returnval : VARIANT*) : HRESULT
    @lpVtbl.value.get_metadata_value.unsafe_as(Proc(Int32, Int32, VARIANT*, HRESULT)).call(targetid, metadataid, returnval)
  end
end
struct LibWin32::IRawElementProviderFragmentRoot
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def element_provider_from_point(x : Float64, y : Float64, pretval : IRawElementProviderFragment*) : HRESULT
    @lpVtbl.value.element_provider_from_point.unsafe_as(Proc(Float64, Float64, IRawElementProviderFragment*, HRESULT)).call(x, y, pretval)
  end
  def get_focus(pretval : IRawElementProviderFragment*) : HRESULT
    @lpVtbl.value.get_focus.unsafe_as(Proc(IRawElementProviderFragment*, HRESULT)).call(pretval)
  end
end
struct LibWin32::IRawElementProviderFragment
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def navigate(direction : NavigateDirection, pretval : IRawElementProviderFragment*) : HRESULT
    @lpVtbl.value.navigate.unsafe_as(Proc(NavigateDirection, IRawElementProviderFragment*, HRESULT)).call(direction, pretval)
  end
  def get_runtime_id(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def get_bounding_rectangle(pretval : UiaRect*) : HRESULT
    @lpVtbl.value.get_bounding_rectangle.unsafe_as(Proc(UiaRect*, HRESULT)).call(pretval)
  end
  def get_embedded_fragment_roots(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_embedded_fragment_roots.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def set_focus : HRESULT
    @lpVtbl.value.set_focus.unsafe_as(Proc(HRESULT)).call
  end
  def get_fragment_root(pretval : IRawElementProviderFragmentRoot*) : HRESULT
    @lpVtbl.value.get_fragment_root.unsafe_as(Proc(IRawElementProviderFragmentRoot*, HRESULT)).call(pretval)
  end
end
struct LibWin32::IRawElementProviderAdviseEvents
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def advise_event_added(eventid : Int32, propertyids : SAFEARRAY*) : HRESULT
    @lpVtbl.value.advise_event_added.unsafe_as(Proc(Int32, SAFEARRAY*, HRESULT)).call(eventid, propertyids)
  end
  def advise_event_removed(eventid : Int32, propertyids : SAFEARRAY*) : HRESULT
    @lpVtbl.value.advise_event_removed.unsafe_as(Proc(Int32, SAFEARRAY*, HRESULT)).call(eventid, propertyids)
  end
end
struct LibWin32::IRawElementProviderHwndOverride
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_override_provider_for_hwnd(hwnd : LibC::HANDLE, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_override_provider_for_hwnd.unsafe_as(Proc(LibC::HANDLE, IRawElementProviderSimple*, HRESULT)).call(hwnd, pretval)
  end
end
struct LibWin32::IProxyProviderWinEventSink
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_automation_property_changed_event(pprovider : IRawElementProviderSimple, id : Int32, newvalue : VARIANT) : HRESULT
    @lpVtbl.value.add_automation_property_changed_event.unsafe_as(Proc(IRawElementProviderSimple, Int32, VARIANT, HRESULT)).call(pprovider, id, newvalue)
  end
  def add_automation_event(pprovider : IRawElementProviderSimple, id : Int32) : HRESULT
    @lpVtbl.value.add_automation_event.unsafe_as(Proc(IRawElementProviderSimple, Int32, HRESULT)).call(pprovider, id)
  end
  def add_structure_changed_event(pprovider : IRawElementProviderSimple, structurechangetype : StructureChangeType, runtimeid : SAFEARRAY*) : HRESULT
    @lpVtbl.value.add_structure_changed_event.unsafe_as(Proc(IRawElementProviderSimple, StructureChangeType, SAFEARRAY*, HRESULT)).call(pprovider, structurechangetype, runtimeid)
  end
end
struct LibWin32::IProxyProviderWinEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def respond_to_win_event(idwinevent : UInt32, hwnd : LibC::HANDLE, idobject : Int32, idchild : Int32, psink : IProxyProviderWinEventSink) : HRESULT
    @lpVtbl.value.respond_to_win_event.unsafe_as(Proc(UInt32, LibC::HANDLE, Int32, Int32, IProxyProviderWinEventSink, HRESULT)).call(idwinevent, hwnd, idobject, idchild, psink)
  end
end
struct LibWin32::IRawElementProviderWindowlessSite
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_adjacent_fragment(direction : NavigateDirection, ppparent : IRawElementProviderFragment*) : HRESULT
    @lpVtbl.value.get_adjacent_fragment.unsafe_as(Proc(NavigateDirection, IRawElementProviderFragment*, HRESULT)).call(direction, ppparent)
  end
  def get_runtime_id_prefix(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id_prefix.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
end
struct LibWin32::IAccessibleHostingElementProviders
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_embedded_fragment_roots(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_embedded_fragment_roots.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def get_object_id_for_provider(pprovider : IRawElementProviderSimple, pidobject : Int32*) : HRESULT
    @lpVtbl.value.get_object_id_for_provider.unsafe_as(Proc(IRawElementProviderSimple, Int32*, HRESULT)).call(pprovider, pidobject)
  end
end
struct LibWin32::IRawElementProviderHostingAccessibles
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_embedded_accessibles(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_embedded_accessibles.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
end
struct LibWin32::IDockProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_dock_position(dockposition : DockPosition) : HRESULT
    @lpVtbl.value.set_dock_position.unsafe_as(Proc(DockPosition, HRESULT)).call(dockposition)
  end
  def get_dock_position(pretval : DockPosition*) : HRESULT
    @lpVtbl.value.get_dock_position.unsafe_as(Proc(DockPosition*, HRESULT)).call(pretval)
  end
end
struct LibWin32::IExpandCollapseProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def expand : HRESULT
    @lpVtbl.value.expand.unsafe_as(Proc(HRESULT)).call
  end
  def collapse : HRESULT
    @lpVtbl.value.collapse.unsafe_as(Proc(HRESULT)).call
  end
  def get_expand_collapse_state(pretval : ExpandCollapseState*) : HRESULT
    @lpVtbl.value.get_expand_collapse_state.unsafe_as(Proc(ExpandCollapseState*, HRESULT)).call(pretval)
  end
end
struct LibWin32::IGridProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_item(row : Int32, column : Int32, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, Int32, IRawElementProviderSimple*, HRESULT)).call(row, column, pretval)
  end
  def get_row_count(pretval : Int32*) : HRESULT
    @lpVtbl.value.get_row_count.unsafe_as(Proc(Int32*, HRESULT)).call(pretval)
  end
  def get_column_count(pretval : Int32*) : HRESULT
    @lpVtbl.value.get_column_count.unsafe_as(Proc(Int32*, HRESULT)).call(pretval)
  end
end
struct LibWin32::IGridItemProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_row(pretval : Int32*) : HRESULT
    @lpVtbl.value.get_row.unsafe_as(Proc(Int32*, HRESULT)).call(pretval)
  end
  def get_column(pretval : Int32*) : HRESULT
    @lpVtbl.value.get_column.unsafe_as(Proc(Int32*, HRESULT)).call(pretval)
  end
  def get_row_span(pretval : Int32*) : HRESULT
    @lpVtbl.value.get_row_span.unsafe_as(Proc(Int32*, HRESULT)).call(pretval)
  end
  def get_column_span(pretval : Int32*) : HRESULT
    @lpVtbl.value.get_column_span.unsafe_as(Proc(Int32*, HRESULT)).call(pretval)
  end
  def get_containing_grid(pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_containing_grid.unsafe_as(Proc(IRawElementProviderSimple*, HRESULT)).call(pretval)
  end
end
struct LibWin32::IInvokeProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def invoke : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IMultipleViewProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_view_name(viewid : Int32, pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_view_name.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(viewid, pretval)
  end
  def set_current_view(viewid : Int32) : HRESULT
    @lpVtbl.value.set_current_view.unsafe_as(Proc(Int32, HRESULT)).call(viewid)
  end
  def get_current_view(pretval : Int32*) : HRESULT
    @lpVtbl.value.get_current_view.unsafe_as(Proc(Int32*, HRESULT)).call(pretval)
  end
  def get_supported_views(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_supported_views.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
end
struct LibWin32::IRangeValueProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_value(val : Float64) : HRESULT
    @lpVtbl.value.set_value.unsafe_as(Proc(Float64, HRESULT)).call(val)
  end
  def get_value(pretval : Float64*) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(Float64*, HRESULT)).call(pretval)
  end
  def get_is_read_only(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_read_only.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_maximum(pretval : Float64*) : HRESULT
    @lpVtbl.value.get_maximum.unsafe_as(Proc(Float64*, HRESULT)).call(pretval)
  end
  def get_minimum(pretval : Float64*) : HRESULT
    @lpVtbl.value.get_minimum.unsafe_as(Proc(Float64*, HRESULT)).call(pretval)
  end
  def get_large_change(pretval : Float64*) : HRESULT
    @lpVtbl.value.get_large_change.unsafe_as(Proc(Float64*, HRESULT)).call(pretval)
  end
  def get_small_change(pretval : Float64*) : HRESULT
    @lpVtbl.value.get_small_change.unsafe_as(Proc(Float64*, HRESULT)).call(pretval)
  end
end
struct LibWin32::IScrollItemProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def scroll_into_view : HRESULT
    @lpVtbl.value.scroll_into_view.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ISelectionProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_selection(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def get_can_select_multiple(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_select_multiple.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_is_selection_required(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_selection_required.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
end
struct LibWin32::ISelectionProvider2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_selection(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def get_can_select_multiple(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_select_multiple.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_is_selection_required(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_selection_required.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_first_selected_item(retval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_first_selected_item.unsafe_as(Proc(IRawElementProviderSimple*, HRESULT)).call(retval)
  end
  def get_last_selected_item(retval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_last_selected_item.unsafe_as(Proc(IRawElementProviderSimple*, HRESULT)).call(retval)
  end
  def get_current_selected_item(retval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_current_selected_item.unsafe_as(Proc(IRawElementProviderSimple*, HRESULT)).call(retval)
  end
  def get_item_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_item_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::IScrollProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def scroll(horizontalamount : ScrollAmount, verticalamount : ScrollAmount) : HRESULT
    @lpVtbl.value.scroll.unsafe_as(Proc(ScrollAmount, ScrollAmount, HRESULT)).call(horizontalamount, verticalamount)
  end
  def set_scroll_percent(horizontalpercent : Float64, verticalpercent : Float64) : HRESULT
    @lpVtbl.value.set_scroll_percent.unsafe_as(Proc(Float64, Float64, HRESULT)).call(horizontalpercent, verticalpercent)
  end
  def get_horizontal_scroll_percent(pretval : Float64*) : HRESULT
    @lpVtbl.value.get_horizontal_scroll_percent.unsafe_as(Proc(Float64*, HRESULT)).call(pretval)
  end
  def get_vertical_scroll_percent(pretval : Float64*) : HRESULT
    @lpVtbl.value.get_vertical_scroll_percent.unsafe_as(Proc(Float64*, HRESULT)).call(pretval)
  end
  def get_horizontal_view_size(pretval : Float64*) : HRESULT
    @lpVtbl.value.get_horizontal_view_size.unsafe_as(Proc(Float64*, HRESULT)).call(pretval)
  end
  def get_vertical_view_size(pretval : Float64*) : HRESULT
    @lpVtbl.value.get_vertical_view_size.unsafe_as(Proc(Float64*, HRESULT)).call(pretval)
  end
  def get_horizontally_scrollable(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_horizontally_scrollable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_vertically_scrollable(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_vertically_scrollable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
end
struct LibWin32::ISelectionItemProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def select : HRESULT
    @lpVtbl.value.select.unsafe_as(Proc(HRESULT)).call
  end
  def add_to_selection : HRESULT
    @lpVtbl.value.add_to_selection.unsafe_as(Proc(HRESULT)).call
  end
  def remove_from_selection : HRESULT
    @lpVtbl.value.remove_from_selection.unsafe_as(Proc(HRESULT)).call
  end
  def get_is_selected(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_selected.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_selection_container(pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_selection_container.unsafe_as(Proc(IRawElementProviderSimple*, HRESULT)).call(pretval)
  end
end
struct LibWin32::ISynchronizedInputProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def start_listening(inputtype : SynchronizedInputType) : HRESULT
    @lpVtbl.value.start_listening.unsafe_as(Proc(SynchronizedInputType, HRESULT)).call(inputtype)
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITableProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_row_headers(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_row_headers.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def get_column_headers(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_column_headers.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def get_row_or_column_major(pretval : RowOrColumnMajor*) : HRESULT
    @lpVtbl.value.get_row_or_column_major.unsafe_as(Proc(RowOrColumnMajor*, HRESULT)).call(pretval)
  end
end
struct LibWin32::ITableItemProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_row_header_items(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_row_header_items.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def get_column_header_items(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_column_header_items.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
end
struct LibWin32::IToggleProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def toggle : HRESULT
    @lpVtbl.value.toggle.unsafe_as(Proc(HRESULT)).call
  end
  def get_toggle_state(pretval : ToggleState*) : HRESULT
    @lpVtbl.value.get_toggle_state.unsafe_as(Proc(ToggleState*, HRESULT)).call(pretval)
  end
end
struct LibWin32::ITransformProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def move(x : Float64, y : Float64) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(Float64, Float64, HRESULT)).call(x, y)
  end
  def resize(width : Float64, height : Float64) : HRESULT
    @lpVtbl.value.resize.unsafe_as(Proc(Float64, Float64, HRESULT)).call(width, height)
  end
  def rotate(degrees : Float64) : HRESULT
    @lpVtbl.value.rotate.unsafe_as(Proc(Float64, HRESULT)).call(degrees)
  end
  def get_can_move(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_move.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_can_resize(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_resize.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_can_rotate(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_rotate.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
end
struct LibWin32::IValueProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_value(val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_value.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(val)
  end
  def get_value(pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(UInt8**, HRESULT)).call(pretval)
  end
  def get_is_read_only(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_read_only.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
end
struct LibWin32::IWindowProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_visual_state(state : WindowVisualState) : HRESULT
    @lpVtbl.value.set_visual_state.unsafe_as(Proc(WindowVisualState, HRESULT)).call(state)
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_input_idle(milliseconds : Int32, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.wait_for_input_idle.unsafe_as(Proc(Int32, LibC::BOOL*, HRESULT)).call(milliseconds, pretval)
  end
  def get_can_maximize(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_maximize.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_can_minimize(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_minimize.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_is_modal(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_modal.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_window_visual_state(pretval : WindowVisualState*) : HRESULT
    @lpVtbl.value.get_window_visual_state.unsafe_as(Proc(WindowVisualState*, HRESULT)).call(pretval)
  end
  def get_window_interaction_state(pretval : WindowInteractionState*) : HRESULT
    @lpVtbl.value.get_window_interaction_state.unsafe_as(Proc(WindowInteractionState*, HRESULT)).call(pretval)
  end
  def get_is_topmost(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_topmost.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
end
struct LibWin32::ILegacyIAccessibleProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def select(flagsselect : Int32) : HRESULT
    @lpVtbl.value.select.unsafe_as(Proc(Int32, HRESULT)).call(flagsselect)
  end
  def do_default_action : HRESULT
    @lpVtbl.value.do_default_action.unsafe_as(Proc(HRESULT)).call
  end
  def set_value(szvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_value.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(szvalue)
  end
  def get_i_accessible(ppaccessible : IAccessible*) : HRESULT
    @lpVtbl.value.get_i_accessible.unsafe_as(Proc(IAccessible*, HRESULT)).call(ppaccessible)
  end
  def get_child_id(pretval : Int32*) : HRESULT
    @lpVtbl.value.get_child_id.unsafe_as(Proc(Int32*, HRESULT)).call(pretval)
  end
  def get_name(pszname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pszname)
  end
  def get_value(pszvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_value.unsafe_as(Proc(UInt8**, HRESULT)).call(pszvalue)
  end
  def get_description(pszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pszdescription)
  end
  def get_role(pdwrole : UInt32*) : HRESULT
    @lpVtbl.value.get_role.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwrole)
  end
  def get_state(pdwstate : UInt32*) : HRESULT
    @lpVtbl.value.get_state.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstate)
  end
  def get_help(pszhelp : UInt8**) : HRESULT
    @lpVtbl.value.get_help.unsafe_as(Proc(UInt8**, HRESULT)).call(pszhelp)
  end
  def get_keyboard_shortcut(pszkeyboardshortcut : UInt8**) : HRESULT
    @lpVtbl.value.get_keyboard_shortcut.unsafe_as(Proc(UInt8**, HRESULT)).call(pszkeyboardshortcut)
  end
  def get_selection(pvarselectedchildren : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pvarselectedchildren)
  end
  def get_default_action(pszdefaultaction : UInt8**) : HRESULT
    @lpVtbl.value.get_default_action.unsafe_as(Proc(UInt8**, HRESULT)).call(pszdefaultaction)
  end
end
struct LibWin32::IItemContainerProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def find_item_by_property(pstartafter : IRawElementProviderSimple, propertyid : Int32, value : VARIANT, pfound : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.find_item_by_property.unsafe_as(Proc(IRawElementProviderSimple, Int32, VARIANT, IRawElementProviderSimple*, HRESULT)).call(pstartafter, propertyid, value, pfound)
  end
end
struct LibWin32::IVirtualizedItemProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def realize : HRESULT
    @lpVtbl.value.realize.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IObjectModelProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_underlying_object_model(ppunknown : IUnknown*) : HRESULT
    @lpVtbl.value.get_underlying_object_model.unsafe_as(Proc(IUnknown*, HRESULT)).call(ppunknown)
  end
end
struct LibWin32::IAnnotationProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_annotation_type_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_annotation_type_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_annotation_type_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_annotation_type_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_author(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_author.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_date_time(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_date_time.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_target(retval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_target.unsafe_as(Proc(IRawElementProviderSimple*, HRESULT)).call(retval)
  end
end
struct LibWin32::IStylesProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_style_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_style_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_style_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_style_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_fill_color(retval : Int32*) : HRESULT
    @lpVtbl.value.get_fill_color.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_fill_pattern_style(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_fill_pattern_style.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_shape(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_shape.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_fill_pattern_color(retval : Int32*) : HRESULT
    @lpVtbl.value.get_fill_pattern_color.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_extended_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_extended_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
end
struct LibWin32::ISpreadsheetProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_item_by_name(name : LibC::LPWSTR, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_item_by_name.unsafe_as(Proc(LibC::LPWSTR, IRawElementProviderSimple*, HRESULT)).call(name, pretval)
  end
end
struct LibWin32::ISpreadsheetItemProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_formula(pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_formula.unsafe_as(Proc(UInt8**, HRESULT)).call(pretval)
  end
  def get_annotation_objects(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_annotation_objects.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def get_annotation_types(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
end
struct LibWin32::ITransformProvider2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def move(x : Float64, y : Float64) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(Float64, Float64, HRESULT)).call(x, y)
  end
  def resize(width : Float64, height : Float64) : HRESULT
    @lpVtbl.value.resize.unsafe_as(Proc(Float64, Float64, HRESULT)).call(width, height)
  end
  def rotate(degrees : Float64) : HRESULT
    @lpVtbl.value.rotate.unsafe_as(Proc(Float64, HRESULT)).call(degrees)
  end
  def get_can_move(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_move.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_can_resize(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_resize.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_can_rotate(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_rotate.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def zoom(zoom : Float64) : HRESULT
    @lpVtbl.value.zoom.unsafe_as(Proc(Float64, HRESULT)).call(zoom)
  end
  def get_can_zoom(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_zoom.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_zoom_level(pretval : Float64*) : HRESULT
    @lpVtbl.value.get_zoom_level.unsafe_as(Proc(Float64*, HRESULT)).call(pretval)
  end
  def get_zoom_minimum(pretval : Float64*) : HRESULT
    @lpVtbl.value.get_zoom_minimum.unsafe_as(Proc(Float64*, HRESULT)).call(pretval)
  end
  def get_zoom_maximum(pretval : Float64*) : HRESULT
    @lpVtbl.value.get_zoom_maximum.unsafe_as(Proc(Float64*, HRESULT)).call(pretval)
  end
  def zoom_by_unit(zoomunit : ZoomUnit) : HRESULT
    @lpVtbl.value.zoom_by_unit.unsafe_as(Proc(ZoomUnit, HRESULT)).call(zoomunit)
  end
end
struct LibWin32::IDragProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_is_grabbed(pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_grabbed.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(pretval)
  end
  def get_drop_effect(pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_drop_effect.unsafe_as(Proc(UInt8**, HRESULT)).call(pretval)
  end
  def get_drop_effects(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_drop_effects.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def get_grabbed_items(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_grabbed_items.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
end
struct LibWin32::IDropTargetProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_drop_target_effect(pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_drop_target_effect.unsafe_as(Proc(UInt8**, HRESULT)).call(pretval)
  end
  def get_drop_target_effects(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_drop_target_effects.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
end
struct LibWin32::ITextRangeProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(ITextRangeProvider*, HRESULT)).call(pretval)
  end
  def compare(range : ITextRangeProvider, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare.unsafe_as(Proc(ITextRangeProvider, LibC::BOOL*, HRESULT)).call(range, pretval)
  end
  def compare_endpoints(endpoint : TextPatternRangeEndpoint, targetrange : ITextRangeProvider, targetendpoint : TextPatternRangeEndpoint, pretval : Int32*) : HRESULT
    @lpVtbl.value.compare_endpoints.unsafe_as(Proc(TextPatternRangeEndpoint, ITextRangeProvider, TextPatternRangeEndpoint, Int32*, HRESULT)).call(endpoint, targetrange, targetendpoint, pretval)
  end
  def expand_to_enclosing_unit(unit : TextUnit) : HRESULT
    @lpVtbl.value.expand_to_enclosing_unit.unsafe_as(Proc(TextUnit, HRESULT)).call(unit)
  end
  def find_attribute(attributeid : Int32, val : VARIANT, backward : LibC::BOOL, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.find_attribute.unsafe_as(Proc(Int32, VARIANT, LibC::BOOL, ITextRangeProvider*, HRESULT)).call(attributeid, val, backward, pretval)
  end
  def find_text(text : UInt8*, backward : LibC::BOOL, ignorecase : LibC::BOOL, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.find_text.unsafe_as(Proc(UInt8*, LibC::BOOL, LibC::BOOL, ITextRangeProvider*, HRESULT)).call(text, backward, ignorecase, pretval)
  end
  def get_attribute_value(attributeid : Int32, pretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(attributeid, pretval)
  end
  def get_bounding_rectangles(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_bounding_rectangles.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def get_enclosing_element(pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_enclosing_element.unsafe_as(Proc(IRawElementProviderSimple*, HRESULT)).call(pretval)
  end
  def get_text(maxlength : Int32, pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(maxlength, pretval)
  end
  def move(unit : TextUnit, count : Int32, pretval : Int32*) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(TextUnit, Int32, Int32*, HRESULT)).call(unit, count, pretval)
  end
  def move_endpoint_by_unit(endpoint : TextPatternRangeEndpoint, unit : TextUnit, count : Int32, pretval : Int32*) : HRESULT
    @lpVtbl.value.move_endpoint_by_unit.unsafe_as(Proc(TextPatternRangeEndpoint, TextUnit, Int32, Int32*, HRESULT)).call(endpoint, unit, count, pretval)
  end
  def move_endpoint_by_range(endpoint : TextPatternRangeEndpoint, targetrange : ITextRangeProvider, targetendpoint : TextPatternRangeEndpoint) : HRESULT
    @lpVtbl.value.move_endpoint_by_range.unsafe_as(Proc(TextPatternRangeEndpoint, ITextRangeProvider, TextPatternRangeEndpoint, HRESULT)).call(endpoint, targetrange, targetendpoint)
  end
  def select : HRESULT
    @lpVtbl.value.select.unsafe_as(Proc(HRESULT)).call
  end
  def add_to_selection : HRESULT
    @lpVtbl.value.add_to_selection.unsafe_as(Proc(HRESULT)).call
  end
  def remove_from_selection : HRESULT
    @lpVtbl.value.remove_from_selection.unsafe_as(Proc(HRESULT)).call
  end
  def scroll_into_view(aligntotop : LibC::BOOL) : HRESULT
    @lpVtbl.value.scroll_into_view.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(aligntotop)
  end
  def get_children(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_children.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
end
struct LibWin32::ITextProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_selection(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def get_visible_ranges(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_visible_ranges.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def range_from_child(childelement : IRawElementProviderSimple, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.range_from_child.unsafe_as(Proc(IRawElementProviderSimple, ITextRangeProvider*, HRESULT)).call(childelement, pretval)
  end
  def range_from_point(point : UiaPoint, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.range_from_point.unsafe_as(Proc(UiaPoint, ITextRangeProvider*, HRESULT)).call(point, pretval)
  end
  def get_document_range(pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.get_document_range.unsafe_as(Proc(ITextRangeProvider*, HRESULT)).call(pretval)
  end
  def get_supported_text_selection(pretval : SupportedTextSelection*) : HRESULT
    @lpVtbl.value.get_supported_text_selection.unsafe_as(Proc(SupportedTextSelection*, HRESULT)).call(pretval)
  end
end
struct LibWin32::ITextProvider2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_selection(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def get_visible_ranges(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_visible_ranges.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def range_from_child(childelement : IRawElementProviderSimple, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.range_from_child.unsafe_as(Proc(IRawElementProviderSimple, ITextRangeProvider*, HRESULT)).call(childelement, pretval)
  end
  def range_from_point(point : UiaPoint, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.range_from_point.unsafe_as(Proc(UiaPoint, ITextRangeProvider*, HRESULT)).call(point, pretval)
  end
  def get_document_range(pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.get_document_range.unsafe_as(Proc(ITextRangeProvider*, HRESULT)).call(pretval)
  end
  def get_supported_text_selection(pretval : SupportedTextSelection*) : HRESULT
    @lpVtbl.value.get_supported_text_selection.unsafe_as(Proc(SupportedTextSelection*, HRESULT)).call(pretval)
  end
  def range_from_annotation(annotationelement : IRawElementProviderSimple, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.range_from_annotation.unsafe_as(Proc(IRawElementProviderSimple, ITextRangeProvider*, HRESULT)).call(annotationelement, pretval)
  end
  def get_caret_range(isactive : LibC::BOOL*, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.get_caret_range.unsafe_as(Proc(LibC::BOOL*, ITextRangeProvider*, HRESULT)).call(isactive, pretval)
  end
end
struct LibWin32::ITextEditProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_selection(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def get_visible_ranges(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_visible_ranges.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def range_from_child(childelement : IRawElementProviderSimple, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.range_from_child.unsafe_as(Proc(IRawElementProviderSimple, ITextRangeProvider*, HRESULT)).call(childelement, pretval)
  end
  def range_from_point(point : UiaPoint, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.range_from_point.unsafe_as(Proc(UiaPoint, ITextRangeProvider*, HRESULT)).call(point, pretval)
  end
  def get_document_range(pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.get_document_range.unsafe_as(Proc(ITextRangeProvider*, HRESULT)).call(pretval)
  end
  def get_supported_text_selection(pretval : SupportedTextSelection*) : HRESULT
    @lpVtbl.value.get_supported_text_selection.unsafe_as(Proc(SupportedTextSelection*, HRESULT)).call(pretval)
  end
  def get_active_composition(pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.get_active_composition.unsafe_as(Proc(ITextRangeProvider*, HRESULT)).call(pretval)
  end
  def get_conversion_target(pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.get_conversion_target.unsafe_as(Proc(ITextRangeProvider*, HRESULT)).call(pretval)
  end
end
struct LibWin32::ITextRangeProvider2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(ITextRangeProvider*, HRESULT)).call(pretval)
  end
  def compare(range : ITextRangeProvider, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare.unsafe_as(Proc(ITextRangeProvider, LibC::BOOL*, HRESULT)).call(range, pretval)
  end
  def compare_endpoints(endpoint : TextPatternRangeEndpoint, targetrange : ITextRangeProvider, targetendpoint : TextPatternRangeEndpoint, pretval : Int32*) : HRESULT
    @lpVtbl.value.compare_endpoints.unsafe_as(Proc(TextPatternRangeEndpoint, ITextRangeProvider, TextPatternRangeEndpoint, Int32*, HRESULT)).call(endpoint, targetrange, targetendpoint, pretval)
  end
  def expand_to_enclosing_unit(unit : TextUnit) : HRESULT
    @lpVtbl.value.expand_to_enclosing_unit.unsafe_as(Proc(TextUnit, HRESULT)).call(unit)
  end
  def find_attribute(attributeid : Int32, val : VARIANT, backward : LibC::BOOL, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.find_attribute.unsafe_as(Proc(Int32, VARIANT, LibC::BOOL, ITextRangeProvider*, HRESULT)).call(attributeid, val, backward, pretval)
  end
  def find_text(text : UInt8*, backward : LibC::BOOL, ignorecase : LibC::BOOL, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.find_text.unsafe_as(Proc(UInt8*, LibC::BOOL, LibC::BOOL, ITextRangeProvider*, HRESULT)).call(text, backward, ignorecase, pretval)
  end
  def get_attribute_value(attributeid : Int32, pretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(attributeid, pretval)
  end
  def get_bounding_rectangles(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_bounding_rectangles.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def get_enclosing_element(pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_enclosing_element.unsafe_as(Proc(IRawElementProviderSimple*, HRESULT)).call(pretval)
  end
  def get_text(maxlength : Int32, pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(maxlength, pretval)
  end
  def move(unit : TextUnit, count : Int32, pretval : Int32*) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(TextUnit, Int32, Int32*, HRESULT)).call(unit, count, pretval)
  end
  def move_endpoint_by_unit(endpoint : TextPatternRangeEndpoint, unit : TextUnit, count : Int32, pretval : Int32*) : HRESULT
    @lpVtbl.value.move_endpoint_by_unit.unsafe_as(Proc(TextPatternRangeEndpoint, TextUnit, Int32, Int32*, HRESULT)).call(endpoint, unit, count, pretval)
  end
  def move_endpoint_by_range(endpoint : TextPatternRangeEndpoint, targetrange : ITextRangeProvider, targetendpoint : TextPatternRangeEndpoint) : HRESULT
    @lpVtbl.value.move_endpoint_by_range.unsafe_as(Proc(TextPatternRangeEndpoint, ITextRangeProvider, TextPatternRangeEndpoint, HRESULT)).call(endpoint, targetrange, targetendpoint)
  end
  def select : HRESULT
    @lpVtbl.value.select.unsafe_as(Proc(HRESULT)).call
  end
  def add_to_selection : HRESULT
    @lpVtbl.value.add_to_selection.unsafe_as(Proc(HRESULT)).call
  end
  def remove_from_selection : HRESULT
    @lpVtbl.value.remove_from_selection.unsafe_as(Proc(HRESULT)).call
  end
  def scroll_into_view(aligntotop : LibC::BOOL) : HRESULT
    @lpVtbl.value.scroll_into_view.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(aligntotop)
  end
  def get_children(pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_children.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(pretval)
  end
  def show_context_menu : HRESULT
    @lpVtbl.value.show_context_menu.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::ITextChildProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_text_container(pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_text_container.unsafe_as(Proc(IRawElementProviderSimple*, HRESULT)).call(pretval)
  end
  def get_text_range(pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.get_text_range.unsafe_as(Proc(ITextRangeProvider*, HRESULT)).call(pretval)
  end
end
struct LibWin32::ICustomNavigationProvider
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def navigate(direction : NavigateDirection, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.navigate.unsafe_as(Proc(NavigateDirection, IRawElementProviderSimple*, HRESULT)).call(direction, pretval)
  end
end
struct LibWin32::IUIAutomationPatternInstance
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property(index : UInt32, cached : LibC::BOOL, type : UIAutomationType, pptr : Void*) : HRESULT
    @lpVtbl.value.get_property.unsafe_as(Proc(UInt32, LibC::BOOL, UIAutomationType, Void*, HRESULT)).call(index, cached, type, pptr)
  end
  def call_method(index : UInt32, pparams : UIAutomationParameter*, cparams : UInt32) : HRESULT
    @lpVtbl.value.call_method.unsafe_as(Proc(UInt32, UIAutomationParameter*, UInt32, HRESULT)).call(index, pparams, cparams)
  end
end
struct LibWin32::IUIAutomationPatternHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_client_wrapper(ppatterninstance : IUIAutomationPatternInstance, pclientwrapper : IUnknown*) : HRESULT
    @lpVtbl.value.create_client_wrapper.unsafe_as(Proc(IUIAutomationPatternInstance, IUnknown*, HRESULT)).call(ppatterninstance, pclientwrapper)
  end
  def dispatch(ptarget : IUnknown, index : UInt32, pparams : UIAutomationParameter*, cparams : UInt32) : HRESULT
    @lpVtbl.value.dispatch.unsafe_as(Proc(IUnknown, UInt32, UIAutomationParameter*, UInt32, HRESULT)).call(ptarget, index, pparams, cparams)
  end
end
struct LibWin32::IUIAutomationRegistrar
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def register_property(property : UIAutomationPropertyInfo*, propertyid : Int32*) : HRESULT
    @lpVtbl.value.register_property.unsafe_as(Proc(UIAutomationPropertyInfo*, Int32*, HRESULT)).call(property, propertyid)
  end
  def register_event(event : UIAutomationEventInfo*, eventid : Int32*) : HRESULT
    @lpVtbl.value.register_event.unsafe_as(Proc(UIAutomationEventInfo*, Int32*, HRESULT)).call(event, eventid)
  end
  def register_pattern(pattern : UIAutomationPatternInfo*, ppatternid : Int32*, ppatternavailablepropertyid : Int32*, propertyidcount : UInt32, ppropertyids : Int32*, eventidcount : UInt32, peventids : Int32*) : HRESULT
    @lpVtbl.value.register_pattern.unsafe_as(Proc(UIAutomationPatternInfo*, Int32*, Int32*, UInt32, Int32*, UInt32, Int32*, HRESULT)).call(pattern, ppatternid, ppatternavailablepropertyid, propertyidcount, ppropertyids, eventidcount, peventids)
  end
end
struct LibWin32::IUIAutomationElement
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_focus : HRESULT
    @lpVtbl.value.set_focus.unsafe_as(Proc(HRESULT)).call
  end
  def get_runtime_id(runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(runtimeid)
  end
  def find_first(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)).call(scope, condition, found)
  end
  def find_all(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)).call(scope, condition, found)
  end
  def find_first_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def find_all_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def build_updated_cache(cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, updatedelement)
  end
  def get_current_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_current_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_cached_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_cached_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_current_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_parent(parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(parent)
  end
  def get_cached_children(children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(children)
  end
  def get_current_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_current_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_current_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_current_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_current_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_cached_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_cached_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_cached_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_clickable_point(clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.unsafe_as(Proc(POINT*, LibC::BOOL*, HRESULT)).call(clickable, gotclickable)
  end
end
struct LibWin32::IUIAutomationElementArray
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_length(length : Int32*) : HRESULT
    @lpVtbl.value.get_length.unsafe_as(Proc(Int32*, HRESULT)).call(length)
  end
  def get_element(index : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_element.unsafe_as(Proc(Int32, IUIAutomationElement*, HRESULT)).call(index, element)
  end
end
struct LibWin32::IUIAutomationCondition
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
end
struct LibWin32::IUIAutomationBoolCondition
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_boolean_value(boolval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_boolean_value.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(boolval)
  end
end
struct LibWin32::IUIAutomationPropertyCondition
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_property_id(propertyid : Int32*) : HRESULT
    @lpVtbl.value.get_property_id.unsafe_as(Proc(Int32*, HRESULT)).call(propertyid)
  end
  def get_property_value(propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_property_value.unsafe_as(Proc(VARIANT*, HRESULT)).call(propertyvalue)
  end
  def get_property_condition_flags(flags : PropertyConditionFlags*) : HRESULT
    @lpVtbl.value.get_property_condition_flags.unsafe_as(Proc(PropertyConditionFlags*, HRESULT)).call(flags)
  end
end
struct LibWin32::IUIAutomationAndCondition
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_child_count(childcount : Int32*) : HRESULT
    @lpVtbl.value.get_child_count.unsafe_as(Proc(Int32*, HRESULT)).call(childcount)
  end
  def get_children_as_native_array(childarray : IUIAutomationCondition**, childarraycount : Int32*) : HRESULT
    @lpVtbl.value.get_children_as_native_array.unsafe_as(Proc(IUIAutomationCondition**, Int32*, HRESULT)).call(childarray, childarraycount)
  end
  def get_children(childarray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_children.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(childarray)
  end
end
struct LibWin32::IUIAutomationOrCondition
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_child_count(childcount : Int32*) : HRESULT
    @lpVtbl.value.get_child_count.unsafe_as(Proc(Int32*, HRESULT)).call(childcount)
  end
  def get_children_as_native_array(childarray : IUIAutomationCondition**, childarraycount : Int32*) : HRESULT
    @lpVtbl.value.get_children_as_native_array.unsafe_as(Proc(IUIAutomationCondition**, Int32*, HRESULT)).call(childarray, childarraycount)
  end
  def get_children(childarray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_children.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(childarray)
  end
end
struct LibWin32::IUIAutomationNotCondition
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_child(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_child.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
end
struct LibWin32::IUIAutomationCacheRequest
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_property(propertyid : Int32) : HRESULT
    @lpVtbl.value.add_property.unsafe_as(Proc(Int32, HRESULT)).call(propertyid)
  end
  def add_pattern(patternid : Int32) : HRESULT
    @lpVtbl.value.add_pattern.unsafe_as(Proc(Int32, HRESULT)).call(patternid)
  end
  def clone(clonedrequest : IUIAutomationCacheRequest*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IUIAutomationCacheRequest*, HRESULT)).call(clonedrequest)
  end
  def get_tree_scope(scope : TreeScope*) : HRESULT
    @lpVtbl.value.get_tree_scope.unsafe_as(Proc(TreeScope*, HRESULT)).call(scope)
  end
  def put_tree_scope(scope : TreeScope) : HRESULT
    @lpVtbl.value.put_tree_scope.unsafe_as(Proc(TreeScope, HRESULT)).call(scope)
  end
  def get_tree_filter(filter : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_tree_filter.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(filter)
  end
  def put_tree_filter(filter : IUIAutomationCondition) : HRESULT
    @lpVtbl.value.put_tree_filter.unsafe_as(Proc(IUIAutomationCondition, HRESULT)).call(filter)
  end
  def get_automation_element_mode(mode : AutomationElementMode*) : HRESULT
    @lpVtbl.value.get_automation_element_mode.unsafe_as(Proc(AutomationElementMode*, HRESULT)).call(mode)
  end
  def put_automation_element_mode(mode : AutomationElementMode) : HRESULT
    @lpVtbl.value.put_automation_element_mode.unsafe_as(Proc(AutomationElementMode, HRESULT)).call(mode)
  end
end
struct LibWin32::IUIAutomationTreeWalker
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_parent_element(element : IUIAutomationElement, parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_parent_element.unsafe_as(Proc(IUIAutomationElement, IUIAutomationElement*, HRESULT)).call(element, parent)
  end
  def get_first_child_element(element : IUIAutomationElement, first : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_first_child_element.unsafe_as(Proc(IUIAutomationElement, IUIAutomationElement*, HRESULT)).call(element, first)
  end
  def get_last_child_element(element : IUIAutomationElement, last : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_last_child_element.unsafe_as(Proc(IUIAutomationElement, IUIAutomationElement*, HRESULT)).call(element, last)
  end
  def get_next_sibling_element(element : IUIAutomationElement, next : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_next_sibling_element.unsafe_as(Proc(IUIAutomationElement, IUIAutomationElement*, HRESULT)).call(element, next)
  end
  def get_previous_sibling_element(element : IUIAutomationElement, previous : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_previous_sibling_element.unsafe_as(Proc(IUIAutomationElement, IUIAutomationElement*, HRESULT)).call(element, previous)
  end
  def normalize_element(element : IUIAutomationElement, normalized : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.normalize_element.unsafe_as(Proc(IUIAutomationElement, IUIAutomationElement*, HRESULT)).call(element, normalized)
  end
  def get_parent_element_build_cache(element : IUIAutomationElement, cacherequest : IUIAutomationCacheRequest, parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_parent_element_build_cache.unsafe_as(Proc(IUIAutomationElement, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(element, cacherequest, parent)
  end
  def get_first_child_element_build_cache(element : IUIAutomationElement, cacherequest : IUIAutomationCacheRequest, first : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_first_child_element_build_cache.unsafe_as(Proc(IUIAutomationElement, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(element, cacherequest, first)
  end
  def get_last_child_element_build_cache(element : IUIAutomationElement, cacherequest : IUIAutomationCacheRequest, last : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_last_child_element_build_cache.unsafe_as(Proc(IUIAutomationElement, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(element, cacherequest, last)
  end
  def get_next_sibling_element_build_cache(element : IUIAutomationElement, cacherequest : IUIAutomationCacheRequest, next : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_next_sibling_element_build_cache.unsafe_as(Proc(IUIAutomationElement, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(element, cacherequest, next)
  end
  def get_previous_sibling_element_build_cache(element : IUIAutomationElement, cacherequest : IUIAutomationCacheRequest, previous : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_previous_sibling_element_build_cache.unsafe_as(Proc(IUIAutomationElement, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(element, cacherequest, previous)
  end
  def normalize_element_build_cache(element : IUIAutomationElement, cacherequest : IUIAutomationCacheRequest, normalized : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.normalize_element_build_cache.unsafe_as(Proc(IUIAutomationElement, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(element, cacherequest, normalized)
  end
  def get_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
end
struct LibWin32::IUIAutomationEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def handle_automation_event(sender : IUIAutomationElement, eventid : Int32) : HRESULT
    @lpVtbl.value.handle_automation_event.unsafe_as(Proc(IUIAutomationElement, Int32, HRESULT)).call(sender, eventid)
  end
end
struct LibWin32::IUIAutomationPropertyChangedEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def handle_property_changed_event(sender : IUIAutomationElement, propertyid : Int32, newvalue : VARIANT) : HRESULT
    @lpVtbl.value.handle_property_changed_event.unsafe_as(Proc(IUIAutomationElement, Int32, VARIANT, HRESULT)).call(sender, propertyid, newvalue)
  end
end
struct LibWin32::IUIAutomationStructureChangedEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def handle_structure_changed_event(sender : IUIAutomationElement, changetype : StructureChangeType, runtimeid : SAFEARRAY*) : HRESULT
    @lpVtbl.value.handle_structure_changed_event.unsafe_as(Proc(IUIAutomationElement, StructureChangeType, SAFEARRAY*, HRESULT)).call(sender, changetype, runtimeid)
  end
end
struct LibWin32::IUIAutomationFocusChangedEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def handle_focus_changed_event(sender : IUIAutomationElement) : HRESULT
    @lpVtbl.value.handle_focus_changed_event.unsafe_as(Proc(IUIAutomationElement, HRESULT)).call(sender)
  end
end
struct LibWin32::IUIAutomationTextEditTextChangedEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def handle_text_edit_text_changed_event(sender : IUIAutomationElement, texteditchangetype : TextEditChangeType, eventstrings : SAFEARRAY*) : HRESULT
    @lpVtbl.value.handle_text_edit_text_changed_event.unsafe_as(Proc(IUIAutomationElement, TextEditChangeType, SAFEARRAY*, HRESULT)).call(sender, texteditchangetype, eventstrings)
  end
end
struct LibWin32::IUIAutomationChangesEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def handle_changes_event(sender : IUIAutomationElement, uiachanges : UiaChangeInfo*, changescount : Int32) : HRESULT
    @lpVtbl.value.handle_changes_event.unsafe_as(Proc(IUIAutomationElement, UiaChangeInfo*, Int32, HRESULT)).call(sender, uiachanges, changescount)
  end
end
struct LibWin32::IUIAutomationNotificationEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def handle_notification_event(sender : IUIAutomationElement, notificationkind : NotificationKind, notificationprocessing : NotificationProcessing, displaystring : UInt8*, activityid : UInt8*) : HRESULT
    @lpVtbl.value.handle_notification_event.unsafe_as(Proc(IUIAutomationElement, NotificationKind, NotificationProcessing, UInt8*, UInt8*, HRESULT)).call(sender, notificationkind, notificationprocessing, displaystring, activityid)
  end
end
struct LibWin32::IUIAutomationInvokePattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def invoke : HRESULT
    @lpVtbl.value.invoke.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IUIAutomationDockPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_dock_position(dockpos : DockPosition) : HRESULT
    @lpVtbl.value.set_dock_position.unsafe_as(Proc(DockPosition, HRESULT)).call(dockpos)
  end
  def get_current_dock_position(retval : DockPosition*) : HRESULT
    @lpVtbl.value.get_current_dock_position.unsafe_as(Proc(DockPosition*, HRESULT)).call(retval)
  end
  def get_cached_dock_position(retval : DockPosition*) : HRESULT
    @lpVtbl.value.get_cached_dock_position.unsafe_as(Proc(DockPosition*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationExpandCollapsePattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def expand : HRESULT
    @lpVtbl.value.expand.unsafe_as(Proc(HRESULT)).call
  end
  def collapse : HRESULT
    @lpVtbl.value.collapse.unsafe_as(Proc(HRESULT)).call
  end
  def get_current_expand_collapse_state(retval : ExpandCollapseState*) : HRESULT
    @lpVtbl.value.get_current_expand_collapse_state.unsafe_as(Proc(ExpandCollapseState*, HRESULT)).call(retval)
  end
  def get_cached_expand_collapse_state(retval : ExpandCollapseState*) : HRESULT
    @lpVtbl.value.get_cached_expand_collapse_state.unsafe_as(Proc(ExpandCollapseState*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationGridPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_item(row : Int32, column : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_item.unsafe_as(Proc(Int32, Int32, IUIAutomationElement*, HRESULT)).call(row, column, element)
  end
  def get_current_row_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_row_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_column_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_column_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_row_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_row_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_column_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_column_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationGridItemPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current_containing_grid(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_containing_grid.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_current_row(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_row.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_column(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_column.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_row_span(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_row_span.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_column_span(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_column_span.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_containing_grid(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_containing_grid.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_row(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_row.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_column(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_column.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_row_span(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_row_span.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_column_span(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_column_span.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationMultipleViewPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_view_name(view : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_view_name.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(view, name)
  end
  def set_current_view(view : Int32) : HRESULT
    @lpVtbl.value.set_current_view.unsafe_as(Proc(Int32, HRESULT)).call(view)
  end
  def get_current_current_view(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_current_view.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_supported_views(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_supported_views.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_cached_current_view(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_current_view.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_supported_views(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_supported_views.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationObjectModelPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_underlying_object_model(retval : IUnknown*) : HRESULT
    @lpVtbl.value.get_underlying_object_model.unsafe_as(Proc(IUnknown*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationRangeValuePattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_value(val : Float64) : HRESULT
    @lpVtbl.value.set_value.unsafe_as(Proc(Float64, HRESULT)).call(val)
  end
  def get_current_value(retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_value.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_current_is_read_only(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_read_only.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_maximum(retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_maximum.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_current_minimum(retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_minimum.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_current_large_change(retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_large_change.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_current_small_change(retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_small_change.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_cached_value(retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_value.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_cached_is_read_only(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_read_only.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_maximum(retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_maximum.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_cached_minimum(retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_minimum.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_cached_large_change(retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_large_change.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_cached_small_change(retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_small_change.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationScrollPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def scroll(horizontalamount : ScrollAmount, verticalamount : ScrollAmount) : HRESULT
    @lpVtbl.value.scroll.unsafe_as(Proc(ScrollAmount, ScrollAmount, HRESULT)).call(horizontalamount, verticalamount)
  end
  def set_scroll_percent(horizontalpercent : Float64, verticalpercent : Float64) : HRESULT
    @lpVtbl.value.set_scroll_percent.unsafe_as(Proc(Float64, Float64, HRESULT)).call(horizontalpercent, verticalpercent)
  end
  def get_current_horizontal_scroll_percent(retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_horizontal_scroll_percent.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_current_vertical_scroll_percent(retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_vertical_scroll_percent.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_current_horizontal_view_size(retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_horizontal_view_size.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_current_vertical_view_size(retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_vertical_view_size.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_current_horizontally_scrollable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_horizontally_scrollable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_vertically_scrollable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_vertically_scrollable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_horizontal_scroll_percent(retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_horizontal_scroll_percent.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_cached_vertical_scroll_percent(retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_vertical_scroll_percent.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_cached_horizontal_view_size(retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_horizontal_view_size.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_cached_vertical_view_size(retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_vertical_view_size.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_cached_horizontally_scrollable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_horizontally_scrollable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_vertically_scrollable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_vertically_scrollable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationScrollItemPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def scroll_into_view : HRESULT
    @lpVtbl.value.scroll_into_view.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IUIAutomationSelectionPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current_selection(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_selection.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_can_select_multiple(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_select_multiple.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_selection_required(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_selection_required.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_selection(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_selection.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_can_select_multiple(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_select_multiple.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_selection_required(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_selection_required.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationSelectionPattern2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current_selection(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_selection.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_can_select_multiple(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_select_multiple.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_selection_required(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_selection_required.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_selection(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_selection.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_can_select_multiple(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_select_multiple.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_selection_required(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_selection_required.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_first_selected_item(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_first_selected_item.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_current_last_selected_item(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_last_selected_item.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_current_current_selected_item(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_current_selected_item.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_current_item_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_item_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_first_selected_item(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_first_selected_item.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_last_selected_item(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_last_selected_item.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_current_selected_item(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_current_selected_item.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_item_count(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_item_count.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationSelectionItemPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def select : HRESULT
    @lpVtbl.value.select.unsafe_as(Proc(HRESULT)).call
  end
  def add_to_selection : HRESULT
    @lpVtbl.value.add_to_selection.unsafe_as(Proc(HRESULT)).call
  end
  def remove_from_selection : HRESULT
    @lpVtbl.value.remove_from_selection.unsafe_as(Proc(HRESULT)).call
  end
  def get_current_is_selected(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_selected.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_selection_container(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_selection_container.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_is_selected(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_selected.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_selection_container(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_selection_container.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationSynchronizedInputPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def start_listening(inputtype : SynchronizedInputType) : HRESULT
    @lpVtbl.value.start_listening.unsafe_as(Proc(SynchronizedInputType, HRESULT)).call(inputtype)
  end
  def cancel : HRESULT
    @lpVtbl.value.cancel.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IUIAutomationTablePattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current_row_headers(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_row_headers.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_column_headers(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_column_headers.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_row_or_column_major(retval : RowOrColumnMajor*) : HRESULT
    @lpVtbl.value.get_current_row_or_column_major.unsafe_as(Proc(RowOrColumnMajor*, HRESULT)).call(retval)
  end
  def get_cached_row_headers(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_row_headers.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_column_headers(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_column_headers.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_row_or_column_major(retval : RowOrColumnMajor*) : HRESULT
    @lpVtbl.value.get_cached_row_or_column_major.unsafe_as(Proc(RowOrColumnMajor*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationTableItemPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current_row_header_items(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_row_header_items.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_column_header_items(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_column_header_items.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_row_header_items(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_row_header_items.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_column_header_items(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_column_header_items.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationTogglePattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def toggle : HRESULT
    @lpVtbl.value.toggle.unsafe_as(Proc(HRESULT)).call
  end
  def get_current_toggle_state(retval : ToggleState*) : HRESULT
    @lpVtbl.value.get_current_toggle_state.unsafe_as(Proc(ToggleState*, HRESULT)).call(retval)
  end
  def get_cached_toggle_state(retval : ToggleState*) : HRESULT
    @lpVtbl.value.get_cached_toggle_state.unsafe_as(Proc(ToggleState*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationTransformPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def move(x : Float64, y : Float64) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(Float64, Float64, HRESULT)).call(x, y)
  end
  def resize(width : Float64, height : Float64) : HRESULT
    @lpVtbl.value.resize.unsafe_as(Proc(Float64, Float64, HRESULT)).call(width, height)
  end
  def rotate(degrees : Float64) : HRESULT
    @lpVtbl.value.rotate.unsafe_as(Proc(Float64, HRESULT)).call(degrees)
  end
  def get_current_can_move(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_move.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_can_resize(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_resize.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_can_rotate(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_rotate.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_can_move(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_move.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_can_resize(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_resize.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_can_rotate(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_rotate.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationValuePattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_value(val : UInt8*) : HRESULT
    @lpVtbl.value.set_value.unsafe_as(Proc(UInt8*, HRESULT)).call(val)
  end
  def get_current_value(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_value.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_read_only(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_read_only.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_value(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_value.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_read_only(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_read_only.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationWindowPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def close : HRESULT
    @lpVtbl.value.close.unsafe_as(Proc(HRESULT)).call
  end
  def wait_for_input_idle(milliseconds : Int32, success : LibC::BOOL*) : HRESULT
    @lpVtbl.value.wait_for_input_idle.unsafe_as(Proc(Int32, LibC::BOOL*, HRESULT)).call(milliseconds, success)
  end
  def set_window_visual_state(state : WindowVisualState) : HRESULT
    @lpVtbl.value.set_window_visual_state.unsafe_as(Proc(WindowVisualState, HRESULT)).call(state)
  end
  def get_current_can_maximize(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_maximize.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_can_minimize(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_minimize.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_modal(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_modal.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_topmost(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_topmost.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_window_visual_state(retval : WindowVisualState*) : HRESULT
    @lpVtbl.value.get_current_window_visual_state.unsafe_as(Proc(WindowVisualState*, HRESULT)).call(retval)
  end
  def get_current_window_interaction_state(retval : WindowInteractionState*) : HRESULT
    @lpVtbl.value.get_current_window_interaction_state.unsafe_as(Proc(WindowInteractionState*, HRESULT)).call(retval)
  end
  def get_cached_can_maximize(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_maximize.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_can_minimize(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_minimize.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_modal(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_modal.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_topmost(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_topmost.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_window_visual_state(retval : WindowVisualState*) : HRESULT
    @lpVtbl.value.get_cached_window_visual_state.unsafe_as(Proc(WindowVisualState*, HRESULT)).call(retval)
  end
  def get_cached_window_interaction_state(retval : WindowInteractionState*) : HRESULT
    @lpVtbl.value.get_cached_window_interaction_state.unsafe_as(Proc(WindowInteractionState*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationTextRange
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(clonedrange : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IUIAutomationTextRange*, HRESULT)).call(clonedrange)
  end
  def compare(range : IUIAutomationTextRange, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare.unsafe_as(Proc(IUIAutomationTextRange, LibC::BOOL*, HRESULT)).call(range, aresame)
  end
  def compare_endpoints(srcendpoint : TextPatternRangeEndpoint, range : IUIAutomationTextRange, targetendpoint : TextPatternRangeEndpoint, compvalue : Int32*) : HRESULT
    @lpVtbl.value.compare_endpoints.unsafe_as(Proc(TextPatternRangeEndpoint, IUIAutomationTextRange, TextPatternRangeEndpoint, Int32*, HRESULT)).call(srcendpoint, range, targetendpoint, compvalue)
  end
  def expand_to_enclosing_unit(textunit : TextUnit) : HRESULT
    @lpVtbl.value.expand_to_enclosing_unit.unsafe_as(Proc(TextUnit, HRESULT)).call(textunit)
  end
  def find_attribute(attr : Int32, val : VARIANT, backward : LibC::BOOL, found : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.find_attribute.unsafe_as(Proc(Int32, VARIANT, LibC::BOOL, IUIAutomationTextRange*, HRESULT)).call(attr, val, backward, found)
  end
  def find_text(text : UInt8*, backward : LibC::BOOL, ignorecase : LibC::BOOL, found : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.find_text.unsafe_as(Proc(UInt8*, LibC::BOOL, LibC::BOOL, IUIAutomationTextRange*, HRESULT)).call(text, backward, ignorecase, found)
  end
  def get_attribute_value(attr : Int32, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(attr, value)
  end
  def get_bounding_rectangles(boundingrects : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_bounding_rectangles.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(boundingrects)
  end
  def get_enclosing_element(enclosingelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_enclosing_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(enclosingelement)
  end
  def get_text(maxlength : Int32, text : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(maxlength, text)
  end
  def move(unit : TextUnit, count : Int32, moved : Int32*) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(TextUnit, Int32, Int32*, HRESULT)).call(unit, count, moved)
  end
  def move_endpoint_by_unit(endpoint : TextPatternRangeEndpoint, unit : TextUnit, count : Int32, moved : Int32*) : HRESULT
    @lpVtbl.value.move_endpoint_by_unit.unsafe_as(Proc(TextPatternRangeEndpoint, TextUnit, Int32, Int32*, HRESULT)).call(endpoint, unit, count, moved)
  end
  def move_endpoint_by_range(srcendpoint : TextPatternRangeEndpoint, range : IUIAutomationTextRange, targetendpoint : TextPatternRangeEndpoint) : HRESULT
    @lpVtbl.value.move_endpoint_by_range.unsafe_as(Proc(TextPatternRangeEndpoint, IUIAutomationTextRange, TextPatternRangeEndpoint, HRESULT)).call(srcendpoint, range, targetendpoint)
  end
  def select : HRESULT
    @lpVtbl.value.select.unsafe_as(Proc(HRESULT)).call
  end
  def add_to_selection : HRESULT
    @lpVtbl.value.add_to_selection.unsafe_as(Proc(HRESULT)).call
  end
  def remove_from_selection : HRESULT
    @lpVtbl.value.remove_from_selection.unsafe_as(Proc(HRESULT)).call
  end
  def scroll_into_view(aligntotop : LibC::BOOL) : HRESULT
    @lpVtbl.value.scroll_into_view.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(aligntotop)
  end
  def get_children(children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_children.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(children)
  end
end
struct LibWin32::IUIAutomationTextRange2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(clonedrange : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IUIAutomationTextRange*, HRESULT)).call(clonedrange)
  end
  def compare(range : IUIAutomationTextRange, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare.unsafe_as(Proc(IUIAutomationTextRange, LibC::BOOL*, HRESULT)).call(range, aresame)
  end
  def compare_endpoints(srcendpoint : TextPatternRangeEndpoint, range : IUIAutomationTextRange, targetendpoint : TextPatternRangeEndpoint, compvalue : Int32*) : HRESULT
    @lpVtbl.value.compare_endpoints.unsafe_as(Proc(TextPatternRangeEndpoint, IUIAutomationTextRange, TextPatternRangeEndpoint, Int32*, HRESULT)).call(srcendpoint, range, targetendpoint, compvalue)
  end
  def expand_to_enclosing_unit(textunit : TextUnit) : HRESULT
    @lpVtbl.value.expand_to_enclosing_unit.unsafe_as(Proc(TextUnit, HRESULT)).call(textunit)
  end
  def find_attribute(attr : Int32, val : VARIANT, backward : LibC::BOOL, found : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.find_attribute.unsafe_as(Proc(Int32, VARIANT, LibC::BOOL, IUIAutomationTextRange*, HRESULT)).call(attr, val, backward, found)
  end
  def find_text(text : UInt8*, backward : LibC::BOOL, ignorecase : LibC::BOOL, found : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.find_text.unsafe_as(Proc(UInt8*, LibC::BOOL, LibC::BOOL, IUIAutomationTextRange*, HRESULT)).call(text, backward, ignorecase, found)
  end
  def get_attribute_value(attr : Int32, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(attr, value)
  end
  def get_bounding_rectangles(boundingrects : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_bounding_rectangles.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(boundingrects)
  end
  def get_enclosing_element(enclosingelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_enclosing_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(enclosingelement)
  end
  def get_text(maxlength : Int32, text : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(maxlength, text)
  end
  def move(unit : TextUnit, count : Int32, moved : Int32*) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(TextUnit, Int32, Int32*, HRESULT)).call(unit, count, moved)
  end
  def move_endpoint_by_unit(endpoint : TextPatternRangeEndpoint, unit : TextUnit, count : Int32, moved : Int32*) : HRESULT
    @lpVtbl.value.move_endpoint_by_unit.unsafe_as(Proc(TextPatternRangeEndpoint, TextUnit, Int32, Int32*, HRESULT)).call(endpoint, unit, count, moved)
  end
  def move_endpoint_by_range(srcendpoint : TextPatternRangeEndpoint, range : IUIAutomationTextRange, targetendpoint : TextPatternRangeEndpoint) : HRESULT
    @lpVtbl.value.move_endpoint_by_range.unsafe_as(Proc(TextPatternRangeEndpoint, IUIAutomationTextRange, TextPatternRangeEndpoint, HRESULT)).call(srcendpoint, range, targetendpoint)
  end
  def select : HRESULT
    @lpVtbl.value.select.unsafe_as(Proc(HRESULT)).call
  end
  def add_to_selection : HRESULT
    @lpVtbl.value.add_to_selection.unsafe_as(Proc(HRESULT)).call
  end
  def remove_from_selection : HRESULT
    @lpVtbl.value.remove_from_selection.unsafe_as(Proc(HRESULT)).call
  end
  def scroll_into_view(aligntotop : LibC::BOOL) : HRESULT
    @lpVtbl.value.scroll_into_view.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(aligntotop)
  end
  def get_children(children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_children.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(children)
  end
  def show_context_menu : HRESULT
    @lpVtbl.value.show_context_menu.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IUIAutomationTextRange3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def clone(clonedrange : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.clone.unsafe_as(Proc(IUIAutomationTextRange*, HRESULT)).call(clonedrange)
  end
  def compare(range : IUIAutomationTextRange, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare.unsafe_as(Proc(IUIAutomationTextRange, LibC::BOOL*, HRESULT)).call(range, aresame)
  end
  def compare_endpoints(srcendpoint : TextPatternRangeEndpoint, range : IUIAutomationTextRange, targetendpoint : TextPatternRangeEndpoint, compvalue : Int32*) : HRESULT
    @lpVtbl.value.compare_endpoints.unsafe_as(Proc(TextPatternRangeEndpoint, IUIAutomationTextRange, TextPatternRangeEndpoint, Int32*, HRESULT)).call(srcendpoint, range, targetendpoint, compvalue)
  end
  def expand_to_enclosing_unit(textunit : TextUnit) : HRESULT
    @lpVtbl.value.expand_to_enclosing_unit.unsafe_as(Proc(TextUnit, HRESULT)).call(textunit)
  end
  def find_attribute(attr : Int32, val : VARIANT, backward : LibC::BOOL, found : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.find_attribute.unsafe_as(Proc(Int32, VARIANT, LibC::BOOL, IUIAutomationTextRange*, HRESULT)).call(attr, val, backward, found)
  end
  def find_text(text : UInt8*, backward : LibC::BOOL, ignorecase : LibC::BOOL, found : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.find_text.unsafe_as(Proc(UInt8*, LibC::BOOL, LibC::BOOL, IUIAutomationTextRange*, HRESULT)).call(text, backward, ignorecase, found)
  end
  def get_attribute_value(attr : Int32, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(attr, value)
  end
  def get_bounding_rectangles(boundingrects : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_bounding_rectangles.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(boundingrects)
  end
  def get_enclosing_element(enclosingelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_enclosing_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(enclosingelement)
  end
  def get_text(maxlength : Int32, text : UInt8**) : HRESULT
    @lpVtbl.value.get_text.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(maxlength, text)
  end
  def move(unit : TextUnit, count : Int32, moved : Int32*) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(TextUnit, Int32, Int32*, HRESULT)).call(unit, count, moved)
  end
  def move_endpoint_by_unit(endpoint : TextPatternRangeEndpoint, unit : TextUnit, count : Int32, moved : Int32*) : HRESULT
    @lpVtbl.value.move_endpoint_by_unit.unsafe_as(Proc(TextPatternRangeEndpoint, TextUnit, Int32, Int32*, HRESULT)).call(endpoint, unit, count, moved)
  end
  def move_endpoint_by_range(srcendpoint : TextPatternRangeEndpoint, range : IUIAutomationTextRange, targetendpoint : TextPatternRangeEndpoint) : HRESULT
    @lpVtbl.value.move_endpoint_by_range.unsafe_as(Proc(TextPatternRangeEndpoint, IUIAutomationTextRange, TextPatternRangeEndpoint, HRESULT)).call(srcendpoint, range, targetendpoint)
  end
  def select : HRESULT
    @lpVtbl.value.select.unsafe_as(Proc(HRESULT)).call
  end
  def add_to_selection : HRESULT
    @lpVtbl.value.add_to_selection.unsafe_as(Proc(HRESULT)).call
  end
  def remove_from_selection : HRESULT
    @lpVtbl.value.remove_from_selection.unsafe_as(Proc(HRESULT)).call
  end
  def scroll_into_view(aligntotop : LibC::BOOL) : HRESULT
    @lpVtbl.value.scroll_into_view.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(aligntotop)
  end
  def get_children(children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_children.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(children)
  end
  def show_context_menu : HRESULT
    @lpVtbl.value.show_context_menu.unsafe_as(Proc(HRESULT)).call
  end
  def get_enclosing_element_build_cache(cacherequest : IUIAutomationCacheRequest, enclosingelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_enclosing_element_build_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, enclosingelement)
  end
  def get_children_build_cache(cacherequest : IUIAutomationCacheRequest, children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_children_build_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)).call(cacherequest, children)
  end
  def get_attribute_values(attributeids : Int32*, attributeidcount : Int32, attributevalues : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_attribute_values.unsafe_as(Proc(Int32*, Int32, SAFEARRAY**, HRESULT)).call(attributeids, attributeidcount, attributevalues)
  end
end
struct LibWin32::IUIAutomationTextRangeArray
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_length(length : Int32*) : HRESULT
    @lpVtbl.value.get_length.unsafe_as(Proc(Int32*, HRESULT)).call(length)
  end
  def get_element(index : Int32, element : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_element.unsafe_as(Proc(Int32, IUIAutomationTextRange*, HRESULT)).call(index, element)
  end
end
struct LibWin32::IUIAutomationTextPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def range_from_point(pt : POINT, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.range_from_point.unsafe_as(Proc(POINT, IUIAutomationTextRange*, HRESULT)).call(pt, range)
  end
  def range_from_child(child : IUIAutomationElement, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.range_from_child.unsafe_as(Proc(IUIAutomationElement, IUIAutomationTextRange*, HRESULT)).call(child, range)
  end
  def get_selection(ranges : IUIAutomationTextRangeArray*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(IUIAutomationTextRangeArray*, HRESULT)).call(ranges)
  end
  def get_visible_ranges(ranges : IUIAutomationTextRangeArray*) : HRESULT
    @lpVtbl.value.get_visible_ranges.unsafe_as(Proc(IUIAutomationTextRangeArray*, HRESULT)).call(ranges)
  end
  def get_document_range(range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_document_range.unsafe_as(Proc(IUIAutomationTextRange*, HRESULT)).call(range)
  end
  def get_supported_text_selection(supportedtextselection : SupportedTextSelection*) : HRESULT
    @lpVtbl.value.get_supported_text_selection.unsafe_as(Proc(SupportedTextSelection*, HRESULT)).call(supportedtextselection)
  end
end
struct LibWin32::IUIAutomationTextPattern2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def range_from_point(pt : POINT, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.range_from_point.unsafe_as(Proc(POINT, IUIAutomationTextRange*, HRESULT)).call(pt, range)
  end
  def range_from_child(child : IUIAutomationElement, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.range_from_child.unsafe_as(Proc(IUIAutomationElement, IUIAutomationTextRange*, HRESULT)).call(child, range)
  end
  def get_selection(ranges : IUIAutomationTextRangeArray*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(IUIAutomationTextRangeArray*, HRESULT)).call(ranges)
  end
  def get_visible_ranges(ranges : IUIAutomationTextRangeArray*) : HRESULT
    @lpVtbl.value.get_visible_ranges.unsafe_as(Proc(IUIAutomationTextRangeArray*, HRESULT)).call(ranges)
  end
  def get_document_range(range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_document_range.unsafe_as(Proc(IUIAutomationTextRange*, HRESULT)).call(range)
  end
  def get_supported_text_selection(supportedtextselection : SupportedTextSelection*) : HRESULT
    @lpVtbl.value.get_supported_text_selection.unsafe_as(Proc(SupportedTextSelection*, HRESULT)).call(supportedtextselection)
  end
  def range_from_annotation(annotation : IUIAutomationElement, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.range_from_annotation.unsafe_as(Proc(IUIAutomationElement, IUIAutomationTextRange*, HRESULT)).call(annotation, range)
  end
  def get_caret_range(isactive : LibC::BOOL*, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_caret_range.unsafe_as(Proc(LibC::BOOL*, IUIAutomationTextRange*, HRESULT)).call(isactive, range)
  end
end
struct LibWin32::IUIAutomationTextEditPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def range_from_point(pt : POINT, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.range_from_point.unsafe_as(Proc(POINT, IUIAutomationTextRange*, HRESULT)).call(pt, range)
  end
  def range_from_child(child : IUIAutomationElement, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.range_from_child.unsafe_as(Proc(IUIAutomationElement, IUIAutomationTextRange*, HRESULT)).call(child, range)
  end
  def get_selection(ranges : IUIAutomationTextRangeArray*) : HRESULT
    @lpVtbl.value.get_selection.unsafe_as(Proc(IUIAutomationTextRangeArray*, HRESULT)).call(ranges)
  end
  def get_visible_ranges(ranges : IUIAutomationTextRangeArray*) : HRESULT
    @lpVtbl.value.get_visible_ranges.unsafe_as(Proc(IUIAutomationTextRangeArray*, HRESULT)).call(ranges)
  end
  def get_document_range(range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_document_range.unsafe_as(Proc(IUIAutomationTextRange*, HRESULT)).call(range)
  end
  def get_supported_text_selection(supportedtextselection : SupportedTextSelection*) : HRESULT
    @lpVtbl.value.get_supported_text_selection.unsafe_as(Proc(SupportedTextSelection*, HRESULT)).call(supportedtextselection)
  end
  def get_active_composition(range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_active_composition.unsafe_as(Proc(IUIAutomationTextRange*, HRESULT)).call(range)
  end
  def get_conversion_target(range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_conversion_target.unsafe_as(Proc(IUIAutomationTextRange*, HRESULT)).call(range)
  end
end
struct LibWin32::IUIAutomationCustomNavigationPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def navigate(direction : NavigateDirection, pretval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.navigate.unsafe_as(Proc(NavigateDirection, IUIAutomationElement*, HRESULT)).call(direction, pretval)
  end
end
struct LibWin32::IUIAutomationActiveTextPositionChangedEventHandler
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def handle_active_text_position_changed_event(sender : IUIAutomationElement, range : IUIAutomationTextRange) : HRESULT
    @lpVtbl.value.handle_active_text_position_changed_event.unsafe_as(Proc(IUIAutomationElement, IUIAutomationTextRange, HRESULT)).call(sender, range)
  end
end
struct LibWin32::IUIAutomationLegacyIAccessiblePattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def select(flagsselect : Int32) : HRESULT
    @lpVtbl.value.select.unsafe_as(Proc(Int32, HRESULT)).call(flagsselect)
  end
  def do_default_action : HRESULT
    @lpVtbl.value.do_default_action.unsafe_as(Proc(HRESULT)).call
  end
  def set_value(szvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_value.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(szvalue)
  end
  def get_current_child_id(pretval : Int32*) : HRESULT
    @lpVtbl.value.get_current_child_id.unsafe_as(Proc(Int32*, HRESULT)).call(pretval)
  end
  def get_current_name(pszname : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pszname)
  end
  def get_current_value(pszvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_current_value.unsafe_as(Proc(UInt8**, HRESULT)).call(pszvalue)
  end
  def get_current_description(pszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_current_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pszdescription)
  end
  def get_current_role(pdwrole : UInt32*) : HRESULT
    @lpVtbl.value.get_current_role.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwrole)
  end
  def get_current_state(pdwstate : UInt32*) : HRESULT
    @lpVtbl.value.get_current_state.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstate)
  end
  def get_current_help(pszhelp : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help.unsafe_as(Proc(UInt8**, HRESULT)).call(pszhelp)
  end
  def get_current_keyboard_shortcut(pszkeyboardshortcut : UInt8**) : HRESULT
    @lpVtbl.value.get_current_keyboard_shortcut.unsafe_as(Proc(UInt8**, HRESULT)).call(pszkeyboardshortcut)
  end
  def get_current_selection(pvarselectedchildren : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_selection.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(pvarselectedchildren)
  end
  def get_current_default_action(pszdefaultaction : UInt8**) : HRESULT
    @lpVtbl.value.get_current_default_action.unsafe_as(Proc(UInt8**, HRESULT)).call(pszdefaultaction)
  end
  def get_cached_child_id(pretval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_child_id.unsafe_as(Proc(Int32*, HRESULT)).call(pretval)
  end
  def get_cached_name(pszname : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.unsafe_as(Proc(UInt8**, HRESULT)).call(pszname)
  end
  def get_cached_value(pszvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_value.unsafe_as(Proc(UInt8**, HRESULT)).call(pszvalue)
  end
  def get_cached_description(pszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_description.unsafe_as(Proc(UInt8**, HRESULT)).call(pszdescription)
  end
  def get_cached_role(pdwrole : UInt32*) : HRESULT
    @lpVtbl.value.get_cached_role.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwrole)
  end
  def get_cached_state(pdwstate : UInt32*) : HRESULT
    @lpVtbl.value.get_cached_state.unsafe_as(Proc(UInt32*, HRESULT)).call(pdwstate)
  end
  def get_cached_help(pszhelp : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help.unsafe_as(Proc(UInt8**, HRESULT)).call(pszhelp)
  end
  def get_cached_keyboard_shortcut(pszkeyboardshortcut : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_keyboard_shortcut.unsafe_as(Proc(UInt8**, HRESULT)).call(pszkeyboardshortcut)
  end
  def get_cached_selection(pvarselectedchildren : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_selection.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(pvarselectedchildren)
  end
  def get_cached_default_action(pszdefaultaction : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_default_action.unsafe_as(Proc(UInt8**, HRESULT)).call(pszdefaultaction)
  end
  def get_i_accessible(ppaccessible : IAccessible*) : HRESULT
    @lpVtbl.value.get_i_accessible.unsafe_as(Proc(IAccessible*, HRESULT)).call(ppaccessible)
  end
end
struct LibWin32::IUIAutomationItemContainerPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def find_item_by_property(pstartafter : IUIAutomationElement, propertyid : Int32, value : VARIANT, pfound : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_item_by_property.unsafe_as(Proc(IUIAutomationElement, Int32, VARIANT, IUIAutomationElement*, HRESULT)).call(pstartafter, propertyid, value, pfound)
  end
end
struct LibWin32::IUIAutomationVirtualizedItemPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def realize : HRESULT
    @lpVtbl.value.realize.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IUIAutomationAnnotationPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current_annotation_type_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_annotation_type_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_annotation_type_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_annotation_type_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_author(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_author.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_date_time(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_date_time.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_target(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_target.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_annotation_type_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_annotation_type_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_annotation_type_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_annotation_type_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_author(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_author.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_date_time(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_date_time.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_target(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_target.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationStylesPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current_style_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_style_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_style_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_style_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_fill_color(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_fill_color.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_fill_pattern_style(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_fill_pattern_style.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_shape(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_shape.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_fill_pattern_color(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_fill_pattern_color.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_extended_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_extended_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_extended_properties_as_array(propertyarray : ExtendedProperty**, propertycount : Int32*) : HRESULT
    @lpVtbl.value.get_current_extended_properties_as_array.unsafe_as(Proc(ExtendedProperty**, Int32*, HRESULT)).call(propertyarray, propertycount)
  end
  def get_cached_style_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_style_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_style_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_style_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_fill_color(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_fill_color.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_fill_pattern_style(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_fill_pattern_style.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_shape(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_shape.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_fill_pattern_color(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_fill_pattern_color.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_extended_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_extended_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_extended_properties_as_array(propertyarray : ExtendedProperty**, propertycount : Int32*) : HRESULT
    @lpVtbl.value.get_cached_extended_properties_as_array.unsafe_as(Proc(ExtendedProperty**, Int32*, HRESULT)).call(propertyarray, propertycount)
  end
end
struct LibWin32::IUIAutomationSpreadsheetPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_item_by_name(name : UInt8*, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_item_by_name.unsafe_as(Proc(UInt8*, IUIAutomationElement*, HRESULT)).call(name, element)
  end
end
struct LibWin32::IUIAutomationSpreadsheetItemPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current_formula(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_formula.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_annotation_objects(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_annotation_objects.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_annotation_types(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_cached_formula(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_formula.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_annotation_objects(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_annotation_objects.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_annotation_types(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationTransformPattern2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def move(x : Float64, y : Float64) : HRESULT
    @lpVtbl.value.move.unsafe_as(Proc(Float64, Float64, HRESULT)).call(x, y)
  end
  def resize(width : Float64, height : Float64) : HRESULT
    @lpVtbl.value.resize.unsafe_as(Proc(Float64, Float64, HRESULT)).call(width, height)
  end
  def rotate(degrees : Float64) : HRESULT
    @lpVtbl.value.rotate.unsafe_as(Proc(Float64, HRESULT)).call(degrees)
  end
  def get_current_can_move(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_move.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_can_resize(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_resize.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_can_rotate(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_rotate.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_can_move(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_move.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_can_resize(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_resize.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_can_rotate(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_rotate.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def zoom(zoomvalue : Float64) : HRESULT
    @lpVtbl.value.zoom.unsafe_as(Proc(Float64, HRESULT)).call(zoomvalue)
  end
  def zoom_by_unit(zoomunit : ZoomUnit) : HRESULT
    @lpVtbl.value.zoom_by_unit.unsafe_as(Proc(ZoomUnit, HRESULT)).call(zoomunit)
  end
  def get_current_can_zoom(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_zoom.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_can_zoom(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_zoom.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_zoom_level(retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_zoom_level.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_cached_zoom_level(retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_zoom_level.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_current_zoom_minimum(retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_zoom_minimum.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_cached_zoom_minimum(retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_zoom_minimum.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_current_zoom_maximum(retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_zoom_maximum.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
  def get_cached_zoom_maximum(retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_zoom_maximum.unsafe_as(Proc(Float64*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationTextChildPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_text_container(container : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_text_container.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(container)
  end
  def get_text_range(range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_text_range.unsafe_as(Proc(IUIAutomationTextRange*, HRESULT)).call(range)
  end
end
struct LibWin32::IUIAutomationDragPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current_is_grabbed(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_grabbed.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_grabbed(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_grabbed.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_drop_effect(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_drop_effect.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_drop_effect(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_drop_effect.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_drop_effects(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_drop_effects.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_cached_drop_effects(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_drop_effects.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_current_grabbed_items(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_grabbed_items.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_grabbed_items(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_grabbed_items.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationDropTargetPattern
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_current_drop_target_effect(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_drop_target_effect.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_drop_target_effect(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_drop_target_effect.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_drop_target_effects(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_drop_target_effects.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_cached_drop_target_effects(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_drop_target_effects.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationElement2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_focus : HRESULT
    @lpVtbl.value.set_focus.unsafe_as(Proc(HRESULT)).call
  end
  def get_runtime_id(runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(runtimeid)
  end
  def find_first(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)).call(scope, condition, found)
  end
  def find_all(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)).call(scope, condition, found)
  end
  def find_first_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def find_all_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def build_updated_cache(cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, updatedelement)
  end
  def get_current_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_current_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_cached_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_cached_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_current_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_parent(parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(parent)
  end
  def get_cached_children(children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(children)
  end
  def get_current_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_current_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_current_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_current_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_current_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_cached_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_cached_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_cached_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_clickable_point(clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.unsafe_as(Proc(POINT*, LibC::BOOL*, HRESULT)).call(clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_cached_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_current_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationElement3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_focus : HRESULT
    @lpVtbl.value.set_focus.unsafe_as(Proc(HRESULT)).call
  end
  def get_runtime_id(runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(runtimeid)
  end
  def find_first(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)).call(scope, condition, found)
  end
  def find_all(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)).call(scope, condition, found)
  end
  def find_first_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def find_all_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def build_updated_cache(cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, updatedelement)
  end
  def get_current_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_current_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_cached_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_cached_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_current_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_parent(parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(parent)
  end
  def get_cached_children(children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(children)
  end
  def get_current_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_current_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_current_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_current_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_current_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_cached_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_cached_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_cached_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_clickable_point(clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.unsafe_as(Proc(POINT*, LibC::BOOL*, HRESULT)).call(clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_cached_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_current_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def show_context_menu : HRESULT
    @lpVtbl.value.show_context_menu.unsafe_as(Proc(HRESULT)).call
  end
  def get_current_is_peripheral(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_peripheral.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_peripheral(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_peripheral.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationElement4
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_focus : HRESULT
    @lpVtbl.value.set_focus.unsafe_as(Proc(HRESULT)).call
  end
  def get_runtime_id(runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(runtimeid)
  end
  def find_first(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)).call(scope, condition, found)
  end
  def find_all(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)).call(scope, condition, found)
  end
  def find_first_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def find_all_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def build_updated_cache(cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, updatedelement)
  end
  def get_current_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_current_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_cached_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_cached_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_current_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_parent(parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(parent)
  end
  def get_cached_children(children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(children)
  end
  def get_current_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_current_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_current_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_current_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_current_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_cached_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_cached_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_cached_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_clickable_point(clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.unsafe_as(Proc(POINT*, LibC::BOOL*, HRESULT)).call(clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_cached_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_current_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def show_context_menu : HRESULT
    @lpVtbl.value.show_context_menu.unsafe_as(Proc(HRESULT)).call
  end
  def get_current_is_peripheral(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_peripheral.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_peripheral(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_peripheral.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_position_in_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_position_in_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_size_of_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_size_of_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_annotation_types(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_current_annotation_objects(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_annotation_objects.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_position_in_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_position_in_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_size_of_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_size_of_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_annotation_types(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_cached_annotation_objects(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_annotation_objects.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationElement5
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_focus : HRESULT
    @lpVtbl.value.set_focus.unsafe_as(Proc(HRESULT)).call
  end
  def get_runtime_id(runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(runtimeid)
  end
  def find_first(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)).call(scope, condition, found)
  end
  def find_all(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)).call(scope, condition, found)
  end
  def find_first_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def find_all_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def build_updated_cache(cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, updatedelement)
  end
  def get_current_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_current_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_cached_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_cached_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_current_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_parent(parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(parent)
  end
  def get_cached_children(children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(children)
  end
  def get_current_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_current_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_current_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_current_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_current_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_cached_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_cached_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_cached_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_clickable_point(clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.unsafe_as(Proc(POINT*, LibC::BOOL*, HRESULT)).call(clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_cached_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_current_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def show_context_menu : HRESULT
    @lpVtbl.value.show_context_menu.unsafe_as(Proc(HRESULT)).call
  end
  def get_current_is_peripheral(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_peripheral.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_peripheral(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_peripheral.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_position_in_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_position_in_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_size_of_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_size_of_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_annotation_types(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_current_annotation_objects(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_annotation_objects.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_position_in_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_position_in_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_size_of_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_size_of_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_annotation_types(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_cached_annotation_objects(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_annotation_objects.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_landmark_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_landmark_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_localized_landmark_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_landmark_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_landmark_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_landmark_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_localized_landmark_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_landmark_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationElement6
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_focus : HRESULT
    @lpVtbl.value.set_focus.unsafe_as(Proc(HRESULT)).call
  end
  def get_runtime_id(runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(runtimeid)
  end
  def find_first(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)).call(scope, condition, found)
  end
  def find_all(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)).call(scope, condition, found)
  end
  def find_first_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def find_all_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def build_updated_cache(cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, updatedelement)
  end
  def get_current_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_current_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_cached_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_cached_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_current_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_parent(parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(parent)
  end
  def get_cached_children(children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(children)
  end
  def get_current_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_current_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_current_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_current_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_current_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_cached_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_cached_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_cached_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_clickable_point(clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.unsafe_as(Proc(POINT*, LibC::BOOL*, HRESULT)).call(clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_cached_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_current_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def show_context_menu : HRESULT
    @lpVtbl.value.show_context_menu.unsafe_as(Proc(HRESULT)).call
  end
  def get_current_is_peripheral(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_peripheral.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_peripheral(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_peripheral.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_position_in_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_position_in_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_size_of_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_size_of_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_annotation_types(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_current_annotation_objects(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_annotation_objects.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_position_in_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_position_in_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_size_of_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_size_of_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_annotation_types(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_cached_annotation_objects(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_annotation_objects.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_landmark_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_landmark_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_localized_landmark_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_landmark_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_landmark_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_landmark_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_localized_landmark_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_landmark_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_full_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_full_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_full_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_full_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationElement7
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_focus : HRESULT
    @lpVtbl.value.set_focus.unsafe_as(Proc(HRESULT)).call
  end
  def get_runtime_id(runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(runtimeid)
  end
  def find_first(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)).call(scope, condition, found)
  end
  def find_all(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)).call(scope, condition, found)
  end
  def find_first_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def find_all_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def build_updated_cache(cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, updatedelement)
  end
  def get_current_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_current_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_cached_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_cached_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_current_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_parent(parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(parent)
  end
  def get_cached_children(children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(children)
  end
  def get_current_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_current_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_current_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_current_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_current_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_cached_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_cached_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_cached_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_clickable_point(clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.unsafe_as(Proc(POINT*, LibC::BOOL*, HRESULT)).call(clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_cached_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_current_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def show_context_menu : HRESULT
    @lpVtbl.value.show_context_menu.unsafe_as(Proc(HRESULT)).call
  end
  def get_current_is_peripheral(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_peripheral.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_peripheral(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_peripheral.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_position_in_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_position_in_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_size_of_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_size_of_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_annotation_types(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_current_annotation_objects(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_annotation_objects.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_position_in_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_position_in_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_size_of_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_size_of_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_annotation_types(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_cached_annotation_objects(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_annotation_objects.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_landmark_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_landmark_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_localized_landmark_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_landmark_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_landmark_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_landmark_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_localized_landmark_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_landmark_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_full_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_full_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_full_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_full_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def find_first_with_options(scope : TreeScope, condition : IUIAutomationCondition, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_with_options.unsafe_as(Proc(TreeScope, IUIAutomationCondition, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElement*, HRESULT)).call(scope, condition, traversaloptions, root, found)
  end
  def find_all_with_options(scope : TreeScope, condition : IUIAutomationCondition, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_with_options.unsafe_as(Proc(TreeScope, IUIAutomationCondition, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElementArray*, HRESULT)).call(scope, condition, traversaloptions, root, found)
  end
  def find_first_with_options_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_with_options_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElement*, HRESULT)).call(scope, condition, cacherequest, traversaloptions, root, found)
  end
  def find_all_with_options_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_with_options_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElementArray*, HRESULT)).call(scope, condition, cacherequest, traversaloptions, root, found)
  end
  def get_current_metadata_value(targetid : Int32, metadataid : Int32, returnval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_metadata_value.unsafe_as(Proc(Int32, Int32, VARIANT*, HRESULT)).call(targetid, metadataid, returnval)
  end
end
struct LibWin32::IUIAutomationElement8
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_focus : HRESULT
    @lpVtbl.value.set_focus.unsafe_as(Proc(HRESULT)).call
  end
  def get_runtime_id(runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(runtimeid)
  end
  def find_first(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)).call(scope, condition, found)
  end
  def find_all(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)).call(scope, condition, found)
  end
  def find_first_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def find_all_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def build_updated_cache(cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, updatedelement)
  end
  def get_current_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_current_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_cached_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_cached_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_current_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_parent(parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(parent)
  end
  def get_cached_children(children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(children)
  end
  def get_current_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_current_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_current_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_current_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_current_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_cached_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_cached_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_cached_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_clickable_point(clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.unsafe_as(Proc(POINT*, LibC::BOOL*, HRESULT)).call(clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_cached_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_current_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def show_context_menu : HRESULT
    @lpVtbl.value.show_context_menu.unsafe_as(Proc(HRESULT)).call
  end
  def get_current_is_peripheral(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_peripheral.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_peripheral(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_peripheral.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_position_in_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_position_in_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_size_of_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_size_of_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_annotation_types(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_current_annotation_objects(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_annotation_objects.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_position_in_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_position_in_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_size_of_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_size_of_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_annotation_types(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_cached_annotation_objects(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_annotation_objects.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_landmark_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_landmark_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_localized_landmark_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_landmark_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_landmark_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_landmark_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_localized_landmark_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_landmark_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_full_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_full_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_full_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_full_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def find_first_with_options(scope : TreeScope, condition : IUIAutomationCondition, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_with_options.unsafe_as(Proc(TreeScope, IUIAutomationCondition, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElement*, HRESULT)).call(scope, condition, traversaloptions, root, found)
  end
  def find_all_with_options(scope : TreeScope, condition : IUIAutomationCondition, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_with_options.unsafe_as(Proc(TreeScope, IUIAutomationCondition, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElementArray*, HRESULT)).call(scope, condition, traversaloptions, root, found)
  end
  def find_first_with_options_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_with_options_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElement*, HRESULT)).call(scope, condition, cacherequest, traversaloptions, root, found)
  end
  def find_all_with_options_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_with_options_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElementArray*, HRESULT)).call(scope, condition, cacherequest, traversaloptions, root, found)
  end
  def get_current_metadata_value(targetid : Int32, metadataid : Int32, returnval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_metadata_value.unsafe_as(Proc(Int32, Int32, VARIANT*, HRESULT)).call(targetid, metadataid, returnval)
  end
  def get_current_heading_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_heading_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_heading_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_heading_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationElement9
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def set_focus : HRESULT
    @lpVtbl.value.set_focus.unsafe_as(Proc(HRESULT)).call
  end
  def get_runtime_id(runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(runtimeid)
  end
  def find_first(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)).call(scope, condition, found)
  end
  def find_all(scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)).call(scope, condition, found)
  end
  def find_first_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def find_all_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)).call(scope, condition, cacherequest, found)
  end
  def build_updated_cache(cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, updatedelement)
  end
  def get_current_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_current_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.unsafe_as(Proc(Int32, VARIANT*, HRESULT)).call(propertyid, retval)
  end
  def get_cached_property_value_ex(propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.unsafe_as(Proc(Int32, LibC::BOOL, VARIANT*, HRESULT)).call(propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_cached_pattern_as(patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.unsafe_as(Proc(Int32, Guid*, Void**, HRESULT)).call(patternid, riid, patternobject)
  end
  def get_current_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_pattern(patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.unsafe_as(Proc(Int32, IUnknown*, HRESULT)).call(patternid, patternobject)
  end
  def get_cached_parent(parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(parent)
  end
  def get_cached_children(children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(children)
  end
  def get_current_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_current_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_current_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_current_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_current_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_process_id(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_control_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_localized_control_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_accelerator_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_access_key(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_has_keyboard_focus(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_keyboard_focusable(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_enabled(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_automation_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_class_name(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_help_text(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_culture(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_is_control_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_content_element(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_password(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_native_window_handle(retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.unsafe_as(Proc(LibC::HANDLE, HRESULT)).call(retval)
  end
  def get_cached_item_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_offscreen(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_orientation(retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.unsafe_as(Proc(OrientationType*, HRESULT)).call(retval)
  end
  def get_cached_framework_id(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_required_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_item_status(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_bounding_rectangle(retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.unsafe_as(Proc(RECT*, HRESULT)).call(retval)
  end
  def get_cached_labeled_by(retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(retval)
  end
  def get_cached_aria_role(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_aria_properties(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_is_data_valid_for_form(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_controller_for(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_described_by(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_to(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_provider_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_clickable_point(clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.unsafe_as(Proc(POINT*, LibC::BOOL*, HRESULT)).call(clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_optimize_for_visual_content(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_cached_live_setting(retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.unsafe_as(Proc(LiveSetting*, HRESULT)).call(retval)
  end
  def get_current_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_flows_from(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def show_context_menu : HRESULT
    @lpVtbl.value.show_context_menu.unsafe_as(Proc(HRESULT)).call
  end
  def get_current_is_peripheral(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_peripheral.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_peripheral(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_peripheral.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_current_position_in_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_position_in_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_size_of_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_size_of_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_annotation_types(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_current_annotation_objects(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_annotation_objects.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_cached_position_in_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_position_in_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_size_of_set(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_size_of_set.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_annotation_types(retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_annotation_types.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(retval)
  end
  def get_cached_annotation_objects(retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_annotation_objects.unsafe_as(Proc(IUIAutomationElementArray*, HRESULT)).call(retval)
  end
  def get_current_landmark_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_landmark_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_localized_landmark_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_landmark_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_landmark_type(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_landmark_type.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_localized_landmark_type(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_landmark_type.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_current_full_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_full_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def get_cached_full_description(retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_full_description.unsafe_as(Proc(UInt8**, HRESULT)).call(retval)
  end
  def find_first_with_options(scope : TreeScope, condition : IUIAutomationCondition, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_with_options.unsafe_as(Proc(TreeScope, IUIAutomationCondition, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElement*, HRESULT)).call(scope, condition, traversaloptions, root, found)
  end
  def find_all_with_options(scope : TreeScope, condition : IUIAutomationCondition, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_with_options.unsafe_as(Proc(TreeScope, IUIAutomationCondition, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElementArray*, HRESULT)).call(scope, condition, traversaloptions, root, found)
  end
  def find_first_with_options_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_with_options_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElement*, HRESULT)).call(scope, condition, cacherequest, traversaloptions, root, found)
  end
  def find_all_with_options_build_cache(scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_with_options_build_cache.unsafe_as(Proc(TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElementArray*, HRESULT)).call(scope, condition, cacherequest, traversaloptions, root, found)
  end
  def get_current_metadata_value(targetid : Int32, metadataid : Int32, returnval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_metadata_value.unsafe_as(Proc(Int32, Int32, VARIANT*, HRESULT)).call(targetid, metadataid, returnval)
  end
  def get_current_heading_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_heading_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_cached_heading_level(retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_heading_level.unsafe_as(Proc(Int32*, HRESULT)).call(retval)
  end
  def get_current_is_dialog(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_dialog.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
  def get_cached_is_dialog(retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_dialog.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(retval)
  end
end
struct LibWin32::IUIAutomationProxyFactory
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def create_provider(hwnd : LibC::HANDLE, idobject : Int32, idchild : Int32, provider : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.create_provider.unsafe_as(Proc(LibC::HANDLE, Int32, Int32, IRawElementProviderSimple*, HRESULT)).call(hwnd, idobject, idchild, provider)
  end
  def get_proxy_factory_id(factoryid : UInt8**) : HRESULT
    @lpVtbl.value.get_proxy_factory_id.unsafe_as(Proc(UInt8**, HRESULT)).call(factoryid)
  end
end
struct LibWin32::IUIAutomationProxyFactoryEntry
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_proxy_factory(factory : IUIAutomationProxyFactory*) : HRESULT
    @lpVtbl.value.get_proxy_factory.unsafe_as(Proc(IUIAutomationProxyFactory*, HRESULT)).call(factory)
  end
  def get_class_name(classname : UInt8**) : HRESULT
    @lpVtbl.value.get_class_name.unsafe_as(Proc(UInt8**, HRESULT)).call(classname)
  end
  def get_image_name(imagename : UInt8**) : HRESULT
    @lpVtbl.value.get_image_name.unsafe_as(Proc(UInt8**, HRESULT)).call(imagename)
  end
  def get_allow_substring_match(allowsubstringmatch : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allow_substring_match.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(allowsubstringmatch)
  end
  def get_can_check_base_class(cancheckbaseclass : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_check_base_class.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(cancheckbaseclass)
  end
  def get_needs_advise_events(adviseevents : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_needs_advise_events.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(adviseevents)
  end
  def put_class_name(classname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_class_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(classname)
  end
  def put_image_name(imagename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_image_name.unsafe_as(Proc(LibC::LPWSTR, HRESULT)).call(imagename)
  end
  def put_allow_substring_match(allowsubstringmatch : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_allow_substring_match.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(allowsubstringmatch)
  end
  def put_can_check_base_class(cancheckbaseclass : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_can_check_base_class.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(cancheckbaseclass)
  end
  def put_needs_advise_events(adviseevents : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_needs_advise_events.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(adviseevents)
  end
  def set_win_events_for_automation_event(eventid : Int32, propertyid : Int32, winevents : SAFEARRAY*) : HRESULT
    @lpVtbl.value.set_win_events_for_automation_event.unsafe_as(Proc(Int32, Int32, SAFEARRAY*, HRESULT)).call(eventid, propertyid, winevents)
  end
  def get_win_events_for_automation_event(eventid : Int32, propertyid : Int32, winevents : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_win_events_for_automation_event.unsafe_as(Proc(Int32, Int32, SAFEARRAY**, HRESULT)).call(eventid, propertyid, winevents)
  end
end
struct LibWin32::IUIAutomationProxyFactoryMapping
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def get_count(count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.unsafe_as(Proc(UInt32*, HRESULT)).call(count)
  end
  def get_table(table : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_table.unsafe_as(Proc(SAFEARRAY**, HRESULT)).call(table)
  end
  def get_entry(index : UInt32, entry : IUIAutomationProxyFactoryEntry*) : HRESULT
    @lpVtbl.value.get_entry.unsafe_as(Proc(UInt32, IUIAutomationProxyFactoryEntry*, HRESULT)).call(index, entry)
  end
  def set_table(factorylist : SAFEARRAY*) : HRESULT
    @lpVtbl.value.set_table.unsafe_as(Proc(SAFEARRAY*, HRESULT)).call(factorylist)
  end
  def insert_entries(before : UInt32, factorylist : SAFEARRAY*) : HRESULT
    @lpVtbl.value.insert_entries.unsafe_as(Proc(UInt32, SAFEARRAY*, HRESULT)).call(before, factorylist)
  end
  def insert_entry(before : UInt32, factory : IUIAutomationProxyFactoryEntry) : HRESULT
    @lpVtbl.value.insert_entry.unsafe_as(Proc(UInt32, IUIAutomationProxyFactoryEntry, HRESULT)).call(before, factory)
  end
  def remove_entry(index : UInt32) : HRESULT
    @lpVtbl.value.remove_entry.unsafe_as(Proc(UInt32, HRESULT)).call(index)
  end
  def clear_table : HRESULT
    @lpVtbl.value.clear_table.unsafe_as(Proc(HRESULT)).call
  end
  def restore_default_table : HRESULT
    @lpVtbl.value.restore_default_table.unsafe_as(Proc(HRESULT)).call
  end
end
struct LibWin32::IUIAutomationEventHandlerGroup
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def add_active_text_position_changed_event_handler(scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationActiveTextPositionChangedEventHandler) : HRESULT
    @lpVtbl.value.add_active_text_position_changed_event_handler.unsafe_as(Proc(TreeScope, IUIAutomationCacheRequest, IUIAutomationActiveTextPositionChangedEventHandler, HRESULT)).call(scope, cacherequest, handler)
  end
  def add_automation_event_handler(eventid : Int32, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.add_automation_event_handler.unsafe_as(Proc(Int32, TreeScope, IUIAutomationCacheRequest, IUIAutomationEventHandler, HRESULT)).call(eventid, scope, cacherequest, handler)
  end
  def add_changes_event_handler(scope : TreeScope, changetypes : Int32*, changescount : Int32, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationChangesEventHandler) : HRESULT
    @lpVtbl.value.add_changes_event_handler.unsafe_as(Proc(TreeScope, Int32*, Int32, IUIAutomationCacheRequest, IUIAutomationChangesEventHandler, HRESULT)).call(scope, changetypes, changescount, cacherequest, handler)
  end
  def add_notification_event_handler(scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationNotificationEventHandler) : HRESULT
    @lpVtbl.value.add_notification_event_handler.unsafe_as(Proc(TreeScope, IUIAutomationCacheRequest, IUIAutomationNotificationEventHandler, HRESULT)).call(scope, cacherequest, handler)
  end
  def add_property_changed_event_handler(scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : Int32*, propertycount : Int32) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler.unsafe_as(Proc(TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, Int32*, Int32, HRESULT)).call(scope, cacherequest, handler, propertyarray, propertycount)
  end
  def add_structure_changed_event_handler(scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.add_structure_changed_event_handler.unsafe_as(Proc(TreeScope, IUIAutomationCacheRequest, IUIAutomationStructureChangedEventHandler, HRESULT)).call(scope, cacherequest, handler)
  end
  def add_text_edit_text_changed_event_handler(scope : TreeScope, texteditchangetype : TextEditChangeType, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.add_text_edit_text_changed_event_handler.unsafe_as(Proc(TreeScope, TextEditChangeType, IUIAutomationCacheRequest, IUIAutomationTextEditTextChangedEventHandler, HRESULT)).call(scope, texteditchangetype, cacherequest, handler)
  end
end
struct LibWin32::IUIAutomation
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def compare_elements(el1 : IUIAutomationElement, el2 : IUIAutomationElement, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_elements.unsafe_as(Proc(IUIAutomationElement, IUIAutomationElement, LibC::BOOL*, HRESULT)).call(el1, el2, aresame)
  end
  def compare_runtime_ids(runtimeid1 : SAFEARRAY*, runtimeid2 : SAFEARRAY*, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_runtime_ids.unsafe_as(Proc(SAFEARRAY*, SAFEARRAY*, LibC::BOOL*, HRESULT)).call(runtimeid1, runtimeid2, aresame)
  end
  def get_root_element(root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(root)
  end
  def element_from_handle(hwnd : LibC::HANDLE, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle.unsafe_as(Proc(LibC::HANDLE, IUIAutomationElement*, HRESULT)).call(hwnd, element)
  end
  def element_from_point(pt : POINT, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point.unsafe_as(Proc(POINT, IUIAutomationElement*, HRESULT)).call(pt, element)
  end
  def get_focused_element(element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(element)
  end
  def get_root_element_build_cache(cacherequest : IUIAutomationCacheRequest, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element_build_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, root)
  end
  def element_from_handle_build_cache(hwnd : LibC::HANDLE, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle_build_cache.unsafe_as(Proc(LibC::HANDLE, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(hwnd, cacherequest, element)
  end
  def element_from_point_build_cache(pt : POINT, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point_build_cache.unsafe_as(Proc(POINT, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(pt, cacherequest, element)
  end
  def get_focused_element_build_cache(cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element_build_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, element)
  end
  def create_tree_walker(pcondition : IUIAutomationCondition, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.create_tree_walker.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationTreeWalker*, HRESULT)).call(pcondition, walker)
  end
  def get_control_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_control_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_content_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_content_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_raw_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_raw_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_raw_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_raw_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def get_control_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_control_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def get_content_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_content_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def create_cache_request(cacherequest : IUIAutomationCacheRequest*) : HRESULT
    @lpVtbl.value.create_cache_request.unsafe_as(Proc(IUIAutomationCacheRequest*, HRESULT)).call(cacherequest)
  end
  def create_true_condition(newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_true_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(newcondition)
  end
  def create_false_condition(newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_false_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(newcondition)
  end
  def create_property_condition(propertyid : Int32, value : VARIANT, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition.unsafe_as(Proc(Int32, VARIANT, IUIAutomationCondition*, HRESULT)).call(propertyid, value, newcondition)
  end
  def create_property_condition_ex(propertyid : Int32, value : VARIANT, flags : PropertyConditionFlags, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition_ex.unsafe_as(Proc(Int32, VARIANT, PropertyConditionFlags, IUIAutomationCondition*, HRESULT)).call(propertyid, value, flags, newcondition)
  end
  def create_and_condition(condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition1, condition2, newcondition)
  end
  def create_and_condition_from_array(conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_array.unsafe_as(Proc(SAFEARRAY*, IUIAutomationCondition*, HRESULT)).call(conditions, newcondition)
  end
  def create_and_condition_from_native_array(conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_native_array.unsafe_as(Proc(IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)).call(conditions, conditioncount, newcondition)
  end
  def create_or_condition(condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition1, condition2, newcondition)
  end
  def create_or_condition_from_array(conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_array.unsafe_as(Proc(SAFEARRAY*, IUIAutomationCondition*, HRESULT)).call(conditions, newcondition)
  end
  def create_or_condition_from_native_array(conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_native_array.unsafe_as(Proc(IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)).call(conditions, conditioncount, newcondition)
  end
  def create_not_condition(condition : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_not_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition, newcondition)
  end
  def add_automation_event_handler(eventid : Int32, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.add_automation_event_handler.unsafe_as(Proc(Int32, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationEventHandler, HRESULT)).call(eventid, element, scope, cacherequest, handler)
  end
  def remove_automation_event_handler(eventid : Int32, element : IUIAutomationElement, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.remove_automation_event_handler.unsafe_as(Proc(Int32, IUIAutomationElement, IUIAutomationEventHandler, HRESULT)).call(eventid, element, handler)
  end
  def add_property_changed_event_handler_native_array(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : Int32*, propertycount : Int32) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler_native_array.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, Int32*, Int32, HRESULT)).call(element, scope, cacherequest, handler, propertyarray, propertycount)
  end
  def add_property_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : SAFEARRAY*) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, SAFEARRAY*, HRESULT)).call(element, scope, cacherequest, handler, propertyarray)
  end
  def remove_property_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationPropertyChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_property_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationPropertyChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_structure_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.add_structure_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationStructureChangedEventHandler, HRESULT)).call(element, scope, cacherequest, handler)
  end
  def remove_structure_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_structure_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationStructureChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_focus_changed_event_handler(cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.add_focus_changed_event_handler.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationFocusChangedEventHandler, HRESULT)).call(cacherequest, handler)
  end
  def remove_focus_changed_event_handler(handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_focus_changed_event_handler.unsafe_as(Proc(IUIAutomationFocusChangedEventHandler, HRESULT)).call(handler)
  end
  def remove_all_event_handlers : HRESULT
    @lpVtbl.value.remove_all_event_handlers.unsafe_as(Proc(HRESULT)).call
  end
  def int_native_array_to_safe_array(array : Int32*, arraycount : Int32, safearray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.int_native_array_to_safe_array.unsafe_as(Proc(Int32*, Int32, SAFEARRAY**, HRESULT)).call(array, arraycount, safearray)
  end
  def int_safe_array_to_native_array(intarray : SAFEARRAY*, array : Int32**, arraycount : Int32*) : HRESULT
    @lpVtbl.value.int_safe_array_to_native_array.unsafe_as(Proc(SAFEARRAY*, Int32**, Int32*, HRESULT)).call(intarray, array, arraycount)
  end
  def rect_to_variant(rc : RECT, var : VARIANT*) : HRESULT
    @lpVtbl.value.rect_to_variant.unsafe_as(Proc(RECT, VARIANT*, HRESULT)).call(rc, var)
  end
  def variant_to_rect(var : VARIANT, rc : RECT*) : HRESULT
    @lpVtbl.value.variant_to_rect.unsafe_as(Proc(VARIANT, RECT*, HRESULT)).call(var, rc)
  end
  def safe_array_to_rect_native_array(rects : SAFEARRAY*, rectarray : RECT**, rectarraycount : Int32*) : HRESULT
    @lpVtbl.value.safe_array_to_rect_native_array.unsafe_as(Proc(SAFEARRAY*, RECT**, Int32*, HRESULT)).call(rects, rectarray, rectarraycount)
  end
  def create_proxy_factory_entry(factory : IUIAutomationProxyFactory, factoryentry : IUIAutomationProxyFactoryEntry*) : HRESULT
    @lpVtbl.value.create_proxy_factory_entry.unsafe_as(Proc(IUIAutomationProxyFactory, IUIAutomationProxyFactoryEntry*, HRESULT)).call(factory, factoryentry)
  end
  def get_proxy_factory_mapping(factorymapping : IUIAutomationProxyFactoryMapping*) : HRESULT
    @lpVtbl.value.get_proxy_factory_mapping.unsafe_as(Proc(IUIAutomationProxyFactoryMapping*, HRESULT)).call(factorymapping)
  end
  def get_property_programmatic_name(property : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_property_programmatic_name.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(property, name)
  end
  def get_pattern_programmatic_name(pattern : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_pattern_programmatic_name.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(pattern, name)
  end
  def poll_for_potential_supported_patterns(pelement : IUIAutomationElement, patternids : SAFEARRAY**, patternnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_patterns.unsafe_as(Proc(IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(pelement, patternids, patternnames)
  end
  def poll_for_potential_supported_properties(pelement : IUIAutomationElement, propertyids : SAFEARRAY**, propertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_properties.unsafe_as(Proc(IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(pelement, propertyids, propertynames)
  end
  def check_not_supported(value : VARIANT, isnotsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_not_supported.unsafe_as(Proc(VARIANT, LibC::BOOL*, HRESULT)).call(value, isnotsupported)
  end
  def get_reserved_not_supported_value(notsupportedvalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_not_supported_value.unsafe_as(Proc(IUnknown*, HRESULT)).call(notsupportedvalue)
  end
  def get_reserved_mixed_attribute_value(mixedattributevalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_mixed_attribute_value.unsafe_as(Proc(IUnknown*, HRESULT)).call(mixedattributevalue)
  end
  def element_from_i_accessible(accessible : IAccessible, childid : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible.unsafe_as(Proc(IAccessible, Int32, IUIAutomationElement*, HRESULT)).call(accessible, childid, element)
  end
  def element_from_i_accessible_build_cache(accessible : IAccessible, childid : Int32, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible_build_cache.unsafe_as(Proc(IAccessible, Int32, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(accessible, childid, cacherequest, element)
  end
end
struct LibWin32::IUIAutomation2
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def compare_elements(el1 : IUIAutomationElement, el2 : IUIAutomationElement, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_elements.unsafe_as(Proc(IUIAutomationElement, IUIAutomationElement, LibC::BOOL*, HRESULT)).call(el1, el2, aresame)
  end
  def compare_runtime_ids(runtimeid1 : SAFEARRAY*, runtimeid2 : SAFEARRAY*, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_runtime_ids.unsafe_as(Proc(SAFEARRAY*, SAFEARRAY*, LibC::BOOL*, HRESULT)).call(runtimeid1, runtimeid2, aresame)
  end
  def get_root_element(root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(root)
  end
  def element_from_handle(hwnd : LibC::HANDLE, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle.unsafe_as(Proc(LibC::HANDLE, IUIAutomationElement*, HRESULT)).call(hwnd, element)
  end
  def element_from_point(pt : POINT, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point.unsafe_as(Proc(POINT, IUIAutomationElement*, HRESULT)).call(pt, element)
  end
  def get_focused_element(element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(element)
  end
  def get_root_element_build_cache(cacherequest : IUIAutomationCacheRequest, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element_build_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, root)
  end
  def element_from_handle_build_cache(hwnd : LibC::HANDLE, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle_build_cache.unsafe_as(Proc(LibC::HANDLE, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(hwnd, cacherequest, element)
  end
  def element_from_point_build_cache(pt : POINT, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point_build_cache.unsafe_as(Proc(POINT, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(pt, cacherequest, element)
  end
  def get_focused_element_build_cache(cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element_build_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, element)
  end
  def create_tree_walker(pcondition : IUIAutomationCondition, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.create_tree_walker.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationTreeWalker*, HRESULT)).call(pcondition, walker)
  end
  def get_control_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_control_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_content_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_content_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_raw_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_raw_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_raw_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_raw_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def get_control_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_control_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def get_content_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_content_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def create_cache_request(cacherequest : IUIAutomationCacheRequest*) : HRESULT
    @lpVtbl.value.create_cache_request.unsafe_as(Proc(IUIAutomationCacheRequest*, HRESULT)).call(cacherequest)
  end
  def create_true_condition(newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_true_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(newcondition)
  end
  def create_false_condition(newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_false_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(newcondition)
  end
  def create_property_condition(propertyid : Int32, value : VARIANT, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition.unsafe_as(Proc(Int32, VARIANT, IUIAutomationCondition*, HRESULT)).call(propertyid, value, newcondition)
  end
  def create_property_condition_ex(propertyid : Int32, value : VARIANT, flags : PropertyConditionFlags, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition_ex.unsafe_as(Proc(Int32, VARIANT, PropertyConditionFlags, IUIAutomationCondition*, HRESULT)).call(propertyid, value, flags, newcondition)
  end
  def create_and_condition(condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition1, condition2, newcondition)
  end
  def create_and_condition_from_array(conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_array.unsafe_as(Proc(SAFEARRAY*, IUIAutomationCondition*, HRESULT)).call(conditions, newcondition)
  end
  def create_and_condition_from_native_array(conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_native_array.unsafe_as(Proc(IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)).call(conditions, conditioncount, newcondition)
  end
  def create_or_condition(condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition1, condition2, newcondition)
  end
  def create_or_condition_from_array(conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_array.unsafe_as(Proc(SAFEARRAY*, IUIAutomationCondition*, HRESULT)).call(conditions, newcondition)
  end
  def create_or_condition_from_native_array(conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_native_array.unsafe_as(Proc(IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)).call(conditions, conditioncount, newcondition)
  end
  def create_not_condition(condition : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_not_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition, newcondition)
  end
  def add_automation_event_handler(eventid : Int32, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.add_automation_event_handler.unsafe_as(Proc(Int32, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationEventHandler, HRESULT)).call(eventid, element, scope, cacherequest, handler)
  end
  def remove_automation_event_handler(eventid : Int32, element : IUIAutomationElement, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.remove_automation_event_handler.unsafe_as(Proc(Int32, IUIAutomationElement, IUIAutomationEventHandler, HRESULT)).call(eventid, element, handler)
  end
  def add_property_changed_event_handler_native_array(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : Int32*, propertycount : Int32) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler_native_array.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, Int32*, Int32, HRESULT)).call(element, scope, cacherequest, handler, propertyarray, propertycount)
  end
  def add_property_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : SAFEARRAY*) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, SAFEARRAY*, HRESULT)).call(element, scope, cacherequest, handler, propertyarray)
  end
  def remove_property_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationPropertyChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_property_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationPropertyChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_structure_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.add_structure_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationStructureChangedEventHandler, HRESULT)).call(element, scope, cacherequest, handler)
  end
  def remove_structure_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_structure_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationStructureChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_focus_changed_event_handler(cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.add_focus_changed_event_handler.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationFocusChangedEventHandler, HRESULT)).call(cacherequest, handler)
  end
  def remove_focus_changed_event_handler(handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_focus_changed_event_handler.unsafe_as(Proc(IUIAutomationFocusChangedEventHandler, HRESULT)).call(handler)
  end
  def remove_all_event_handlers : HRESULT
    @lpVtbl.value.remove_all_event_handlers.unsafe_as(Proc(HRESULT)).call
  end
  def int_native_array_to_safe_array(array : Int32*, arraycount : Int32, safearray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.int_native_array_to_safe_array.unsafe_as(Proc(Int32*, Int32, SAFEARRAY**, HRESULT)).call(array, arraycount, safearray)
  end
  def int_safe_array_to_native_array(intarray : SAFEARRAY*, array : Int32**, arraycount : Int32*) : HRESULT
    @lpVtbl.value.int_safe_array_to_native_array.unsafe_as(Proc(SAFEARRAY*, Int32**, Int32*, HRESULT)).call(intarray, array, arraycount)
  end
  def rect_to_variant(rc : RECT, var : VARIANT*) : HRESULT
    @lpVtbl.value.rect_to_variant.unsafe_as(Proc(RECT, VARIANT*, HRESULT)).call(rc, var)
  end
  def variant_to_rect(var : VARIANT, rc : RECT*) : HRESULT
    @lpVtbl.value.variant_to_rect.unsafe_as(Proc(VARIANT, RECT*, HRESULT)).call(var, rc)
  end
  def safe_array_to_rect_native_array(rects : SAFEARRAY*, rectarray : RECT**, rectarraycount : Int32*) : HRESULT
    @lpVtbl.value.safe_array_to_rect_native_array.unsafe_as(Proc(SAFEARRAY*, RECT**, Int32*, HRESULT)).call(rects, rectarray, rectarraycount)
  end
  def create_proxy_factory_entry(factory : IUIAutomationProxyFactory, factoryentry : IUIAutomationProxyFactoryEntry*) : HRESULT
    @lpVtbl.value.create_proxy_factory_entry.unsafe_as(Proc(IUIAutomationProxyFactory, IUIAutomationProxyFactoryEntry*, HRESULT)).call(factory, factoryentry)
  end
  def get_proxy_factory_mapping(factorymapping : IUIAutomationProxyFactoryMapping*) : HRESULT
    @lpVtbl.value.get_proxy_factory_mapping.unsafe_as(Proc(IUIAutomationProxyFactoryMapping*, HRESULT)).call(factorymapping)
  end
  def get_property_programmatic_name(property : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_property_programmatic_name.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(property, name)
  end
  def get_pattern_programmatic_name(pattern : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_pattern_programmatic_name.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(pattern, name)
  end
  def poll_for_potential_supported_patterns(pelement : IUIAutomationElement, patternids : SAFEARRAY**, patternnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_patterns.unsafe_as(Proc(IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(pelement, patternids, patternnames)
  end
  def poll_for_potential_supported_properties(pelement : IUIAutomationElement, propertyids : SAFEARRAY**, propertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_properties.unsafe_as(Proc(IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(pelement, propertyids, propertynames)
  end
  def check_not_supported(value : VARIANT, isnotsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_not_supported.unsafe_as(Proc(VARIANT, LibC::BOOL*, HRESULT)).call(value, isnotsupported)
  end
  def get_reserved_not_supported_value(notsupportedvalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_not_supported_value.unsafe_as(Proc(IUnknown*, HRESULT)).call(notsupportedvalue)
  end
  def get_reserved_mixed_attribute_value(mixedattributevalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_mixed_attribute_value.unsafe_as(Proc(IUnknown*, HRESULT)).call(mixedattributevalue)
  end
  def element_from_i_accessible(accessible : IAccessible, childid : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible.unsafe_as(Proc(IAccessible, Int32, IUIAutomationElement*, HRESULT)).call(accessible, childid, element)
  end
  def element_from_i_accessible_build_cache(accessible : IAccessible, childid : Int32, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible_build_cache.unsafe_as(Proc(IAccessible, Int32, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(accessible, childid, cacherequest, element)
  end
  def get_auto_set_focus(autosetfocus : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_auto_set_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(autosetfocus)
  end
  def put_auto_set_focus(autosetfocus : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_auto_set_focus.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(autosetfocus)
  end
  def get_connection_timeout(timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(timeout)
  end
  def put_connection_timeout(timeout : UInt32) : HRESULT
    @lpVtbl.value.put_connection_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(timeout)
  end
  def get_transaction_timeout(timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_transaction_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(timeout)
  end
  def put_transaction_timeout(timeout : UInt32) : HRESULT
    @lpVtbl.value.put_transaction_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(timeout)
  end
end
struct LibWin32::IUIAutomation3
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def compare_elements(el1 : IUIAutomationElement, el2 : IUIAutomationElement, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_elements.unsafe_as(Proc(IUIAutomationElement, IUIAutomationElement, LibC::BOOL*, HRESULT)).call(el1, el2, aresame)
  end
  def compare_runtime_ids(runtimeid1 : SAFEARRAY*, runtimeid2 : SAFEARRAY*, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_runtime_ids.unsafe_as(Proc(SAFEARRAY*, SAFEARRAY*, LibC::BOOL*, HRESULT)).call(runtimeid1, runtimeid2, aresame)
  end
  def get_root_element(root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(root)
  end
  def element_from_handle(hwnd : LibC::HANDLE, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle.unsafe_as(Proc(LibC::HANDLE, IUIAutomationElement*, HRESULT)).call(hwnd, element)
  end
  def element_from_point(pt : POINT, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point.unsafe_as(Proc(POINT, IUIAutomationElement*, HRESULT)).call(pt, element)
  end
  def get_focused_element(element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(element)
  end
  def get_root_element_build_cache(cacherequest : IUIAutomationCacheRequest, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element_build_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, root)
  end
  def element_from_handle_build_cache(hwnd : LibC::HANDLE, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle_build_cache.unsafe_as(Proc(LibC::HANDLE, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(hwnd, cacherequest, element)
  end
  def element_from_point_build_cache(pt : POINT, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point_build_cache.unsafe_as(Proc(POINT, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(pt, cacherequest, element)
  end
  def get_focused_element_build_cache(cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element_build_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, element)
  end
  def create_tree_walker(pcondition : IUIAutomationCondition, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.create_tree_walker.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationTreeWalker*, HRESULT)).call(pcondition, walker)
  end
  def get_control_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_control_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_content_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_content_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_raw_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_raw_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_raw_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_raw_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def get_control_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_control_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def get_content_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_content_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def create_cache_request(cacherequest : IUIAutomationCacheRequest*) : HRESULT
    @lpVtbl.value.create_cache_request.unsafe_as(Proc(IUIAutomationCacheRequest*, HRESULT)).call(cacherequest)
  end
  def create_true_condition(newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_true_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(newcondition)
  end
  def create_false_condition(newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_false_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(newcondition)
  end
  def create_property_condition(propertyid : Int32, value : VARIANT, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition.unsafe_as(Proc(Int32, VARIANT, IUIAutomationCondition*, HRESULT)).call(propertyid, value, newcondition)
  end
  def create_property_condition_ex(propertyid : Int32, value : VARIANT, flags : PropertyConditionFlags, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition_ex.unsafe_as(Proc(Int32, VARIANT, PropertyConditionFlags, IUIAutomationCondition*, HRESULT)).call(propertyid, value, flags, newcondition)
  end
  def create_and_condition(condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition1, condition2, newcondition)
  end
  def create_and_condition_from_array(conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_array.unsafe_as(Proc(SAFEARRAY*, IUIAutomationCondition*, HRESULT)).call(conditions, newcondition)
  end
  def create_and_condition_from_native_array(conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_native_array.unsafe_as(Proc(IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)).call(conditions, conditioncount, newcondition)
  end
  def create_or_condition(condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition1, condition2, newcondition)
  end
  def create_or_condition_from_array(conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_array.unsafe_as(Proc(SAFEARRAY*, IUIAutomationCondition*, HRESULT)).call(conditions, newcondition)
  end
  def create_or_condition_from_native_array(conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_native_array.unsafe_as(Proc(IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)).call(conditions, conditioncount, newcondition)
  end
  def create_not_condition(condition : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_not_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition, newcondition)
  end
  def add_automation_event_handler(eventid : Int32, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.add_automation_event_handler.unsafe_as(Proc(Int32, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationEventHandler, HRESULT)).call(eventid, element, scope, cacherequest, handler)
  end
  def remove_automation_event_handler(eventid : Int32, element : IUIAutomationElement, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.remove_automation_event_handler.unsafe_as(Proc(Int32, IUIAutomationElement, IUIAutomationEventHandler, HRESULT)).call(eventid, element, handler)
  end
  def add_property_changed_event_handler_native_array(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : Int32*, propertycount : Int32) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler_native_array.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, Int32*, Int32, HRESULT)).call(element, scope, cacherequest, handler, propertyarray, propertycount)
  end
  def add_property_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : SAFEARRAY*) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, SAFEARRAY*, HRESULT)).call(element, scope, cacherequest, handler, propertyarray)
  end
  def remove_property_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationPropertyChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_property_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationPropertyChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_structure_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.add_structure_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationStructureChangedEventHandler, HRESULT)).call(element, scope, cacherequest, handler)
  end
  def remove_structure_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_structure_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationStructureChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_focus_changed_event_handler(cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.add_focus_changed_event_handler.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationFocusChangedEventHandler, HRESULT)).call(cacherequest, handler)
  end
  def remove_focus_changed_event_handler(handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_focus_changed_event_handler.unsafe_as(Proc(IUIAutomationFocusChangedEventHandler, HRESULT)).call(handler)
  end
  def remove_all_event_handlers : HRESULT
    @lpVtbl.value.remove_all_event_handlers.unsafe_as(Proc(HRESULT)).call
  end
  def int_native_array_to_safe_array(array : Int32*, arraycount : Int32, safearray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.int_native_array_to_safe_array.unsafe_as(Proc(Int32*, Int32, SAFEARRAY**, HRESULT)).call(array, arraycount, safearray)
  end
  def int_safe_array_to_native_array(intarray : SAFEARRAY*, array : Int32**, arraycount : Int32*) : HRESULT
    @lpVtbl.value.int_safe_array_to_native_array.unsafe_as(Proc(SAFEARRAY*, Int32**, Int32*, HRESULT)).call(intarray, array, arraycount)
  end
  def rect_to_variant(rc : RECT, var : VARIANT*) : HRESULT
    @lpVtbl.value.rect_to_variant.unsafe_as(Proc(RECT, VARIANT*, HRESULT)).call(rc, var)
  end
  def variant_to_rect(var : VARIANT, rc : RECT*) : HRESULT
    @lpVtbl.value.variant_to_rect.unsafe_as(Proc(VARIANT, RECT*, HRESULT)).call(var, rc)
  end
  def safe_array_to_rect_native_array(rects : SAFEARRAY*, rectarray : RECT**, rectarraycount : Int32*) : HRESULT
    @lpVtbl.value.safe_array_to_rect_native_array.unsafe_as(Proc(SAFEARRAY*, RECT**, Int32*, HRESULT)).call(rects, rectarray, rectarraycount)
  end
  def create_proxy_factory_entry(factory : IUIAutomationProxyFactory, factoryentry : IUIAutomationProxyFactoryEntry*) : HRESULT
    @lpVtbl.value.create_proxy_factory_entry.unsafe_as(Proc(IUIAutomationProxyFactory, IUIAutomationProxyFactoryEntry*, HRESULT)).call(factory, factoryentry)
  end
  def get_proxy_factory_mapping(factorymapping : IUIAutomationProxyFactoryMapping*) : HRESULT
    @lpVtbl.value.get_proxy_factory_mapping.unsafe_as(Proc(IUIAutomationProxyFactoryMapping*, HRESULT)).call(factorymapping)
  end
  def get_property_programmatic_name(property : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_property_programmatic_name.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(property, name)
  end
  def get_pattern_programmatic_name(pattern : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_pattern_programmatic_name.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(pattern, name)
  end
  def poll_for_potential_supported_patterns(pelement : IUIAutomationElement, patternids : SAFEARRAY**, patternnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_patterns.unsafe_as(Proc(IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(pelement, patternids, patternnames)
  end
  def poll_for_potential_supported_properties(pelement : IUIAutomationElement, propertyids : SAFEARRAY**, propertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_properties.unsafe_as(Proc(IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(pelement, propertyids, propertynames)
  end
  def check_not_supported(value : VARIANT, isnotsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_not_supported.unsafe_as(Proc(VARIANT, LibC::BOOL*, HRESULT)).call(value, isnotsupported)
  end
  def get_reserved_not_supported_value(notsupportedvalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_not_supported_value.unsafe_as(Proc(IUnknown*, HRESULT)).call(notsupportedvalue)
  end
  def get_reserved_mixed_attribute_value(mixedattributevalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_mixed_attribute_value.unsafe_as(Proc(IUnknown*, HRESULT)).call(mixedattributevalue)
  end
  def element_from_i_accessible(accessible : IAccessible, childid : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible.unsafe_as(Proc(IAccessible, Int32, IUIAutomationElement*, HRESULT)).call(accessible, childid, element)
  end
  def element_from_i_accessible_build_cache(accessible : IAccessible, childid : Int32, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible_build_cache.unsafe_as(Proc(IAccessible, Int32, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(accessible, childid, cacherequest, element)
  end
  def get_auto_set_focus(autosetfocus : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_auto_set_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(autosetfocus)
  end
  def put_auto_set_focus(autosetfocus : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_auto_set_focus.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(autosetfocus)
  end
  def get_connection_timeout(timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(timeout)
  end
  def put_connection_timeout(timeout : UInt32) : HRESULT
    @lpVtbl.value.put_connection_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(timeout)
  end
  def get_transaction_timeout(timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_transaction_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(timeout)
  end
  def put_transaction_timeout(timeout : UInt32) : HRESULT
    @lpVtbl.value.put_transaction_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(timeout)
  end
  def add_text_edit_text_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, texteditchangetype : TextEditChangeType, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.add_text_edit_text_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, TextEditChangeType, IUIAutomationCacheRequest, IUIAutomationTextEditTextChangedEventHandler, HRESULT)).call(element, scope, texteditchangetype, cacherequest, handler)
  end
  def remove_text_edit_text_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_text_edit_text_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationTextEditTextChangedEventHandler, HRESULT)).call(element, handler)
  end
end
struct LibWin32::IUIAutomation4
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def compare_elements(el1 : IUIAutomationElement, el2 : IUIAutomationElement, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_elements.unsafe_as(Proc(IUIAutomationElement, IUIAutomationElement, LibC::BOOL*, HRESULT)).call(el1, el2, aresame)
  end
  def compare_runtime_ids(runtimeid1 : SAFEARRAY*, runtimeid2 : SAFEARRAY*, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_runtime_ids.unsafe_as(Proc(SAFEARRAY*, SAFEARRAY*, LibC::BOOL*, HRESULT)).call(runtimeid1, runtimeid2, aresame)
  end
  def get_root_element(root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(root)
  end
  def element_from_handle(hwnd : LibC::HANDLE, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle.unsafe_as(Proc(LibC::HANDLE, IUIAutomationElement*, HRESULT)).call(hwnd, element)
  end
  def element_from_point(pt : POINT, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point.unsafe_as(Proc(POINT, IUIAutomationElement*, HRESULT)).call(pt, element)
  end
  def get_focused_element(element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(element)
  end
  def get_root_element_build_cache(cacherequest : IUIAutomationCacheRequest, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element_build_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, root)
  end
  def element_from_handle_build_cache(hwnd : LibC::HANDLE, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle_build_cache.unsafe_as(Proc(LibC::HANDLE, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(hwnd, cacherequest, element)
  end
  def element_from_point_build_cache(pt : POINT, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point_build_cache.unsafe_as(Proc(POINT, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(pt, cacherequest, element)
  end
  def get_focused_element_build_cache(cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element_build_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, element)
  end
  def create_tree_walker(pcondition : IUIAutomationCondition, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.create_tree_walker.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationTreeWalker*, HRESULT)).call(pcondition, walker)
  end
  def get_control_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_control_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_content_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_content_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_raw_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_raw_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_raw_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_raw_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def get_control_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_control_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def get_content_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_content_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def create_cache_request(cacherequest : IUIAutomationCacheRequest*) : HRESULT
    @lpVtbl.value.create_cache_request.unsafe_as(Proc(IUIAutomationCacheRequest*, HRESULT)).call(cacherequest)
  end
  def create_true_condition(newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_true_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(newcondition)
  end
  def create_false_condition(newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_false_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(newcondition)
  end
  def create_property_condition(propertyid : Int32, value : VARIANT, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition.unsafe_as(Proc(Int32, VARIANT, IUIAutomationCondition*, HRESULT)).call(propertyid, value, newcondition)
  end
  def create_property_condition_ex(propertyid : Int32, value : VARIANT, flags : PropertyConditionFlags, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition_ex.unsafe_as(Proc(Int32, VARIANT, PropertyConditionFlags, IUIAutomationCondition*, HRESULT)).call(propertyid, value, flags, newcondition)
  end
  def create_and_condition(condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition1, condition2, newcondition)
  end
  def create_and_condition_from_array(conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_array.unsafe_as(Proc(SAFEARRAY*, IUIAutomationCondition*, HRESULT)).call(conditions, newcondition)
  end
  def create_and_condition_from_native_array(conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_native_array.unsafe_as(Proc(IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)).call(conditions, conditioncount, newcondition)
  end
  def create_or_condition(condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition1, condition2, newcondition)
  end
  def create_or_condition_from_array(conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_array.unsafe_as(Proc(SAFEARRAY*, IUIAutomationCondition*, HRESULT)).call(conditions, newcondition)
  end
  def create_or_condition_from_native_array(conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_native_array.unsafe_as(Proc(IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)).call(conditions, conditioncount, newcondition)
  end
  def create_not_condition(condition : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_not_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition, newcondition)
  end
  def add_automation_event_handler(eventid : Int32, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.add_automation_event_handler.unsafe_as(Proc(Int32, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationEventHandler, HRESULT)).call(eventid, element, scope, cacherequest, handler)
  end
  def remove_automation_event_handler(eventid : Int32, element : IUIAutomationElement, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.remove_automation_event_handler.unsafe_as(Proc(Int32, IUIAutomationElement, IUIAutomationEventHandler, HRESULT)).call(eventid, element, handler)
  end
  def add_property_changed_event_handler_native_array(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : Int32*, propertycount : Int32) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler_native_array.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, Int32*, Int32, HRESULT)).call(element, scope, cacherequest, handler, propertyarray, propertycount)
  end
  def add_property_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : SAFEARRAY*) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, SAFEARRAY*, HRESULT)).call(element, scope, cacherequest, handler, propertyarray)
  end
  def remove_property_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationPropertyChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_property_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationPropertyChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_structure_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.add_structure_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationStructureChangedEventHandler, HRESULT)).call(element, scope, cacherequest, handler)
  end
  def remove_structure_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_structure_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationStructureChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_focus_changed_event_handler(cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.add_focus_changed_event_handler.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationFocusChangedEventHandler, HRESULT)).call(cacherequest, handler)
  end
  def remove_focus_changed_event_handler(handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_focus_changed_event_handler.unsafe_as(Proc(IUIAutomationFocusChangedEventHandler, HRESULT)).call(handler)
  end
  def remove_all_event_handlers : HRESULT
    @lpVtbl.value.remove_all_event_handlers.unsafe_as(Proc(HRESULT)).call
  end
  def int_native_array_to_safe_array(array : Int32*, arraycount : Int32, safearray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.int_native_array_to_safe_array.unsafe_as(Proc(Int32*, Int32, SAFEARRAY**, HRESULT)).call(array, arraycount, safearray)
  end
  def int_safe_array_to_native_array(intarray : SAFEARRAY*, array : Int32**, arraycount : Int32*) : HRESULT
    @lpVtbl.value.int_safe_array_to_native_array.unsafe_as(Proc(SAFEARRAY*, Int32**, Int32*, HRESULT)).call(intarray, array, arraycount)
  end
  def rect_to_variant(rc : RECT, var : VARIANT*) : HRESULT
    @lpVtbl.value.rect_to_variant.unsafe_as(Proc(RECT, VARIANT*, HRESULT)).call(rc, var)
  end
  def variant_to_rect(var : VARIANT, rc : RECT*) : HRESULT
    @lpVtbl.value.variant_to_rect.unsafe_as(Proc(VARIANT, RECT*, HRESULT)).call(var, rc)
  end
  def safe_array_to_rect_native_array(rects : SAFEARRAY*, rectarray : RECT**, rectarraycount : Int32*) : HRESULT
    @lpVtbl.value.safe_array_to_rect_native_array.unsafe_as(Proc(SAFEARRAY*, RECT**, Int32*, HRESULT)).call(rects, rectarray, rectarraycount)
  end
  def create_proxy_factory_entry(factory : IUIAutomationProxyFactory, factoryentry : IUIAutomationProxyFactoryEntry*) : HRESULT
    @lpVtbl.value.create_proxy_factory_entry.unsafe_as(Proc(IUIAutomationProxyFactory, IUIAutomationProxyFactoryEntry*, HRESULT)).call(factory, factoryentry)
  end
  def get_proxy_factory_mapping(factorymapping : IUIAutomationProxyFactoryMapping*) : HRESULT
    @lpVtbl.value.get_proxy_factory_mapping.unsafe_as(Proc(IUIAutomationProxyFactoryMapping*, HRESULT)).call(factorymapping)
  end
  def get_property_programmatic_name(property : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_property_programmatic_name.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(property, name)
  end
  def get_pattern_programmatic_name(pattern : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_pattern_programmatic_name.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(pattern, name)
  end
  def poll_for_potential_supported_patterns(pelement : IUIAutomationElement, patternids : SAFEARRAY**, patternnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_patterns.unsafe_as(Proc(IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(pelement, patternids, patternnames)
  end
  def poll_for_potential_supported_properties(pelement : IUIAutomationElement, propertyids : SAFEARRAY**, propertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_properties.unsafe_as(Proc(IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(pelement, propertyids, propertynames)
  end
  def check_not_supported(value : VARIANT, isnotsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_not_supported.unsafe_as(Proc(VARIANT, LibC::BOOL*, HRESULT)).call(value, isnotsupported)
  end
  def get_reserved_not_supported_value(notsupportedvalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_not_supported_value.unsafe_as(Proc(IUnknown*, HRESULT)).call(notsupportedvalue)
  end
  def get_reserved_mixed_attribute_value(mixedattributevalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_mixed_attribute_value.unsafe_as(Proc(IUnknown*, HRESULT)).call(mixedattributevalue)
  end
  def element_from_i_accessible(accessible : IAccessible, childid : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible.unsafe_as(Proc(IAccessible, Int32, IUIAutomationElement*, HRESULT)).call(accessible, childid, element)
  end
  def element_from_i_accessible_build_cache(accessible : IAccessible, childid : Int32, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible_build_cache.unsafe_as(Proc(IAccessible, Int32, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(accessible, childid, cacherequest, element)
  end
  def get_auto_set_focus(autosetfocus : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_auto_set_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(autosetfocus)
  end
  def put_auto_set_focus(autosetfocus : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_auto_set_focus.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(autosetfocus)
  end
  def get_connection_timeout(timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(timeout)
  end
  def put_connection_timeout(timeout : UInt32) : HRESULT
    @lpVtbl.value.put_connection_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(timeout)
  end
  def get_transaction_timeout(timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_transaction_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(timeout)
  end
  def put_transaction_timeout(timeout : UInt32) : HRESULT
    @lpVtbl.value.put_transaction_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(timeout)
  end
  def add_text_edit_text_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, texteditchangetype : TextEditChangeType, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.add_text_edit_text_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, TextEditChangeType, IUIAutomationCacheRequest, IUIAutomationTextEditTextChangedEventHandler, HRESULT)).call(element, scope, texteditchangetype, cacherequest, handler)
  end
  def remove_text_edit_text_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_text_edit_text_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationTextEditTextChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_changes_event_handler(element : IUIAutomationElement, scope : TreeScope, changetypes : Int32*, changescount : Int32, pcacherequest : IUIAutomationCacheRequest, handler : IUIAutomationChangesEventHandler) : HRESULT
    @lpVtbl.value.add_changes_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, Int32*, Int32, IUIAutomationCacheRequest, IUIAutomationChangesEventHandler, HRESULT)).call(element, scope, changetypes, changescount, pcacherequest, handler)
  end
  def remove_changes_event_handler(element : IUIAutomationElement, handler : IUIAutomationChangesEventHandler) : HRESULT
    @lpVtbl.value.remove_changes_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationChangesEventHandler, HRESULT)).call(element, handler)
  end
end
struct LibWin32::IUIAutomation5
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def compare_elements(el1 : IUIAutomationElement, el2 : IUIAutomationElement, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_elements.unsafe_as(Proc(IUIAutomationElement, IUIAutomationElement, LibC::BOOL*, HRESULT)).call(el1, el2, aresame)
  end
  def compare_runtime_ids(runtimeid1 : SAFEARRAY*, runtimeid2 : SAFEARRAY*, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_runtime_ids.unsafe_as(Proc(SAFEARRAY*, SAFEARRAY*, LibC::BOOL*, HRESULT)).call(runtimeid1, runtimeid2, aresame)
  end
  def get_root_element(root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(root)
  end
  def element_from_handle(hwnd : LibC::HANDLE, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle.unsafe_as(Proc(LibC::HANDLE, IUIAutomationElement*, HRESULT)).call(hwnd, element)
  end
  def element_from_point(pt : POINT, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point.unsafe_as(Proc(POINT, IUIAutomationElement*, HRESULT)).call(pt, element)
  end
  def get_focused_element(element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(element)
  end
  def get_root_element_build_cache(cacherequest : IUIAutomationCacheRequest, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element_build_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, root)
  end
  def element_from_handle_build_cache(hwnd : LibC::HANDLE, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle_build_cache.unsafe_as(Proc(LibC::HANDLE, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(hwnd, cacherequest, element)
  end
  def element_from_point_build_cache(pt : POINT, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point_build_cache.unsafe_as(Proc(POINT, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(pt, cacherequest, element)
  end
  def get_focused_element_build_cache(cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element_build_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, element)
  end
  def create_tree_walker(pcondition : IUIAutomationCondition, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.create_tree_walker.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationTreeWalker*, HRESULT)).call(pcondition, walker)
  end
  def get_control_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_control_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_content_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_content_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_raw_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_raw_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_raw_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_raw_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def get_control_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_control_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def get_content_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_content_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def create_cache_request(cacherequest : IUIAutomationCacheRequest*) : HRESULT
    @lpVtbl.value.create_cache_request.unsafe_as(Proc(IUIAutomationCacheRequest*, HRESULT)).call(cacherequest)
  end
  def create_true_condition(newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_true_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(newcondition)
  end
  def create_false_condition(newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_false_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(newcondition)
  end
  def create_property_condition(propertyid : Int32, value : VARIANT, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition.unsafe_as(Proc(Int32, VARIANT, IUIAutomationCondition*, HRESULT)).call(propertyid, value, newcondition)
  end
  def create_property_condition_ex(propertyid : Int32, value : VARIANT, flags : PropertyConditionFlags, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition_ex.unsafe_as(Proc(Int32, VARIANT, PropertyConditionFlags, IUIAutomationCondition*, HRESULT)).call(propertyid, value, flags, newcondition)
  end
  def create_and_condition(condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition1, condition2, newcondition)
  end
  def create_and_condition_from_array(conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_array.unsafe_as(Proc(SAFEARRAY*, IUIAutomationCondition*, HRESULT)).call(conditions, newcondition)
  end
  def create_and_condition_from_native_array(conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_native_array.unsafe_as(Proc(IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)).call(conditions, conditioncount, newcondition)
  end
  def create_or_condition(condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition1, condition2, newcondition)
  end
  def create_or_condition_from_array(conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_array.unsafe_as(Proc(SAFEARRAY*, IUIAutomationCondition*, HRESULT)).call(conditions, newcondition)
  end
  def create_or_condition_from_native_array(conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_native_array.unsafe_as(Proc(IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)).call(conditions, conditioncount, newcondition)
  end
  def create_not_condition(condition : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_not_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition, newcondition)
  end
  def add_automation_event_handler(eventid : Int32, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.add_automation_event_handler.unsafe_as(Proc(Int32, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationEventHandler, HRESULT)).call(eventid, element, scope, cacherequest, handler)
  end
  def remove_automation_event_handler(eventid : Int32, element : IUIAutomationElement, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.remove_automation_event_handler.unsafe_as(Proc(Int32, IUIAutomationElement, IUIAutomationEventHandler, HRESULT)).call(eventid, element, handler)
  end
  def add_property_changed_event_handler_native_array(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : Int32*, propertycount : Int32) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler_native_array.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, Int32*, Int32, HRESULT)).call(element, scope, cacherequest, handler, propertyarray, propertycount)
  end
  def add_property_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : SAFEARRAY*) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, SAFEARRAY*, HRESULT)).call(element, scope, cacherequest, handler, propertyarray)
  end
  def remove_property_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationPropertyChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_property_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationPropertyChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_structure_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.add_structure_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationStructureChangedEventHandler, HRESULT)).call(element, scope, cacherequest, handler)
  end
  def remove_structure_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_structure_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationStructureChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_focus_changed_event_handler(cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.add_focus_changed_event_handler.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationFocusChangedEventHandler, HRESULT)).call(cacherequest, handler)
  end
  def remove_focus_changed_event_handler(handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_focus_changed_event_handler.unsafe_as(Proc(IUIAutomationFocusChangedEventHandler, HRESULT)).call(handler)
  end
  def remove_all_event_handlers : HRESULT
    @lpVtbl.value.remove_all_event_handlers.unsafe_as(Proc(HRESULT)).call
  end
  def int_native_array_to_safe_array(array : Int32*, arraycount : Int32, safearray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.int_native_array_to_safe_array.unsafe_as(Proc(Int32*, Int32, SAFEARRAY**, HRESULT)).call(array, arraycount, safearray)
  end
  def int_safe_array_to_native_array(intarray : SAFEARRAY*, array : Int32**, arraycount : Int32*) : HRESULT
    @lpVtbl.value.int_safe_array_to_native_array.unsafe_as(Proc(SAFEARRAY*, Int32**, Int32*, HRESULT)).call(intarray, array, arraycount)
  end
  def rect_to_variant(rc : RECT, var : VARIANT*) : HRESULT
    @lpVtbl.value.rect_to_variant.unsafe_as(Proc(RECT, VARIANT*, HRESULT)).call(rc, var)
  end
  def variant_to_rect(var : VARIANT, rc : RECT*) : HRESULT
    @lpVtbl.value.variant_to_rect.unsafe_as(Proc(VARIANT, RECT*, HRESULT)).call(var, rc)
  end
  def safe_array_to_rect_native_array(rects : SAFEARRAY*, rectarray : RECT**, rectarraycount : Int32*) : HRESULT
    @lpVtbl.value.safe_array_to_rect_native_array.unsafe_as(Proc(SAFEARRAY*, RECT**, Int32*, HRESULT)).call(rects, rectarray, rectarraycount)
  end
  def create_proxy_factory_entry(factory : IUIAutomationProxyFactory, factoryentry : IUIAutomationProxyFactoryEntry*) : HRESULT
    @lpVtbl.value.create_proxy_factory_entry.unsafe_as(Proc(IUIAutomationProxyFactory, IUIAutomationProxyFactoryEntry*, HRESULT)).call(factory, factoryentry)
  end
  def get_proxy_factory_mapping(factorymapping : IUIAutomationProxyFactoryMapping*) : HRESULT
    @lpVtbl.value.get_proxy_factory_mapping.unsafe_as(Proc(IUIAutomationProxyFactoryMapping*, HRESULT)).call(factorymapping)
  end
  def get_property_programmatic_name(property : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_property_programmatic_name.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(property, name)
  end
  def get_pattern_programmatic_name(pattern : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_pattern_programmatic_name.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(pattern, name)
  end
  def poll_for_potential_supported_patterns(pelement : IUIAutomationElement, patternids : SAFEARRAY**, patternnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_patterns.unsafe_as(Proc(IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(pelement, patternids, patternnames)
  end
  def poll_for_potential_supported_properties(pelement : IUIAutomationElement, propertyids : SAFEARRAY**, propertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_properties.unsafe_as(Proc(IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(pelement, propertyids, propertynames)
  end
  def check_not_supported(value : VARIANT, isnotsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_not_supported.unsafe_as(Proc(VARIANT, LibC::BOOL*, HRESULT)).call(value, isnotsupported)
  end
  def get_reserved_not_supported_value(notsupportedvalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_not_supported_value.unsafe_as(Proc(IUnknown*, HRESULT)).call(notsupportedvalue)
  end
  def get_reserved_mixed_attribute_value(mixedattributevalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_mixed_attribute_value.unsafe_as(Proc(IUnknown*, HRESULT)).call(mixedattributevalue)
  end
  def element_from_i_accessible(accessible : IAccessible, childid : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible.unsafe_as(Proc(IAccessible, Int32, IUIAutomationElement*, HRESULT)).call(accessible, childid, element)
  end
  def element_from_i_accessible_build_cache(accessible : IAccessible, childid : Int32, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible_build_cache.unsafe_as(Proc(IAccessible, Int32, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(accessible, childid, cacherequest, element)
  end
  def get_auto_set_focus(autosetfocus : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_auto_set_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(autosetfocus)
  end
  def put_auto_set_focus(autosetfocus : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_auto_set_focus.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(autosetfocus)
  end
  def get_connection_timeout(timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(timeout)
  end
  def put_connection_timeout(timeout : UInt32) : HRESULT
    @lpVtbl.value.put_connection_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(timeout)
  end
  def get_transaction_timeout(timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_transaction_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(timeout)
  end
  def put_transaction_timeout(timeout : UInt32) : HRESULT
    @lpVtbl.value.put_transaction_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(timeout)
  end
  def add_text_edit_text_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, texteditchangetype : TextEditChangeType, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.add_text_edit_text_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, TextEditChangeType, IUIAutomationCacheRequest, IUIAutomationTextEditTextChangedEventHandler, HRESULT)).call(element, scope, texteditchangetype, cacherequest, handler)
  end
  def remove_text_edit_text_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_text_edit_text_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationTextEditTextChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_changes_event_handler(element : IUIAutomationElement, scope : TreeScope, changetypes : Int32*, changescount : Int32, pcacherequest : IUIAutomationCacheRequest, handler : IUIAutomationChangesEventHandler) : HRESULT
    @lpVtbl.value.add_changes_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, Int32*, Int32, IUIAutomationCacheRequest, IUIAutomationChangesEventHandler, HRESULT)).call(element, scope, changetypes, changescount, pcacherequest, handler)
  end
  def remove_changes_event_handler(element : IUIAutomationElement, handler : IUIAutomationChangesEventHandler) : HRESULT
    @lpVtbl.value.remove_changes_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationChangesEventHandler, HRESULT)).call(element, handler)
  end
  def add_notification_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationNotificationEventHandler) : HRESULT
    @lpVtbl.value.add_notification_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationNotificationEventHandler, HRESULT)).call(element, scope, cacherequest, handler)
  end
  def remove_notification_event_handler(element : IUIAutomationElement, handler : IUIAutomationNotificationEventHandler) : HRESULT
    @lpVtbl.value.remove_notification_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationNotificationEventHandler, HRESULT)).call(element, handler)
  end
end
struct LibWin32::IUIAutomation6
  def query_interface(riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.unsafe_as(Proc(Guid*, Void**, HRESULT)).call(riid, ppvobject)
  end
  def add_ref : UInt32
    @lpVtbl.value.add_ref.unsafe_as(Proc(UInt32)).call
  end
  def release : UInt32
    @lpVtbl.value.release.unsafe_as(Proc(UInt32)).call
  end
  def compare_elements(el1 : IUIAutomationElement, el2 : IUIAutomationElement, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_elements.unsafe_as(Proc(IUIAutomationElement, IUIAutomationElement, LibC::BOOL*, HRESULT)).call(el1, el2, aresame)
  end
  def compare_runtime_ids(runtimeid1 : SAFEARRAY*, runtimeid2 : SAFEARRAY*, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_runtime_ids.unsafe_as(Proc(SAFEARRAY*, SAFEARRAY*, LibC::BOOL*, HRESULT)).call(runtimeid1, runtimeid2, aresame)
  end
  def get_root_element(root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(root)
  end
  def element_from_handle(hwnd : LibC::HANDLE, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle.unsafe_as(Proc(LibC::HANDLE, IUIAutomationElement*, HRESULT)).call(hwnd, element)
  end
  def element_from_point(pt : POINT, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point.unsafe_as(Proc(POINT, IUIAutomationElement*, HRESULT)).call(pt, element)
  end
  def get_focused_element(element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element.unsafe_as(Proc(IUIAutomationElement*, HRESULT)).call(element)
  end
  def get_root_element_build_cache(cacherequest : IUIAutomationCacheRequest, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element_build_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, root)
  end
  def element_from_handle_build_cache(hwnd : LibC::HANDLE, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle_build_cache.unsafe_as(Proc(LibC::HANDLE, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(hwnd, cacherequest, element)
  end
  def element_from_point_build_cache(pt : POINT, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point_build_cache.unsafe_as(Proc(POINT, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(pt, cacherequest, element)
  end
  def get_focused_element_build_cache(cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element_build_cache.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(cacherequest, element)
  end
  def create_tree_walker(pcondition : IUIAutomationCondition, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.create_tree_walker.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationTreeWalker*, HRESULT)).call(pcondition, walker)
  end
  def get_control_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_control_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_content_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_content_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_raw_view_walker(walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_raw_view_walker.unsafe_as(Proc(IUIAutomationTreeWalker*, HRESULT)).call(walker)
  end
  def get_raw_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_raw_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def get_control_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_control_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def get_content_view_condition(condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_content_view_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(condition)
  end
  def create_cache_request(cacherequest : IUIAutomationCacheRequest*) : HRESULT
    @lpVtbl.value.create_cache_request.unsafe_as(Proc(IUIAutomationCacheRequest*, HRESULT)).call(cacherequest)
  end
  def create_true_condition(newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_true_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(newcondition)
  end
  def create_false_condition(newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_false_condition.unsafe_as(Proc(IUIAutomationCondition*, HRESULT)).call(newcondition)
  end
  def create_property_condition(propertyid : Int32, value : VARIANT, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition.unsafe_as(Proc(Int32, VARIANT, IUIAutomationCondition*, HRESULT)).call(propertyid, value, newcondition)
  end
  def create_property_condition_ex(propertyid : Int32, value : VARIANT, flags : PropertyConditionFlags, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition_ex.unsafe_as(Proc(Int32, VARIANT, PropertyConditionFlags, IUIAutomationCondition*, HRESULT)).call(propertyid, value, flags, newcondition)
  end
  def create_and_condition(condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition1, condition2, newcondition)
  end
  def create_and_condition_from_array(conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_array.unsafe_as(Proc(SAFEARRAY*, IUIAutomationCondition*, HRESULT)).call(conditions, newcondition)
  end
  def create_and_condition_from_native_array(conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_native_array.unsafe_as(Proc(IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)).call(conditions, conditioncount, newcondition)
  end
  def create_or_condition(condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition1, condition2, newcondition)
  end
  def create_or_condition_from_array(conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_array.unsafe_as(Proc(SAFEARRAY*, IUIAutomationCondition*, HRESULT)).call(conditions, newcondition)
  end
  def create_or_condition_from_native_array(conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_native_array.unsafe_as(Proc(IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)).call(conditions, conditioncount, newcondition)
  end
  def create_not_condition(condition : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_not_condition.unsafe_as(Proc(IUIAutomationCondition, IUIAutomationCondition*, HRESULT)).call(condition, newcondition)
  end
  def add_automation_event_handler(eventid : Int32, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.add_automation_event_handler.unsafe_as(Proc(Int32, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationEventHandler, HRESULT)).call(eventid, element, scope, cacherequest, handler)
  end
  def remove_automation_event_handler(eventid : Int32, element : IUIAutomationElement, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.remove_automation_event_handler.unsafe_as(Proc(Int32, IUIAutomationElement, IUIAutomationEventHandler, HRESULT)).call(eventid, element, handler)
  end
  def add_property_changed_event_handler_native_array(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : Int32*, propertycount : Int32) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler_native_array.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, Int32*, Int32, HRESULT)).call(element, scope, cacherequest, handler, propertyarray, propertycount)
  end
  def add_property_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : SAFEARRAY*) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, SAFEARRAY*, HRESULT)).call(element, scope, cacherequest, handler, propertyarray)
  end
  def remove_property_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationPropertyChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_property_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationPropertyChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_structure_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.add_structure_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationStructureChangedEventHandler, HRESULT)).call(element, scope, cacherequest, handler)
  end
  def remove_structure_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_structure_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationStructureChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_focus_changed_event_handler(cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.add_focus_changed_event_handler.unsafe_as(Proc(IUIAutomationCacheRequest, IUIAutomationFocusChangedEventHandler, HRESULT)).call(cacherequest, handler)
  end
  def remove_focus_changed_event_handler(handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_focus_changed_event_handler.unsafe_as(Proc(IUIAutomationFocusChangedEventHandler, HRESULT)).call(handler)
  end
  def remove_all_event_handlers : HRESULT
    @lpVtbl.value.remove_all_event_handlers.unsafe_as(Proc(HRESULT)).call
  end
  def int_native_array_to_safe_array(array : Int32*, arraycount : Int32, safearray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.int_native_array_to_safe_array.unsafe_as(Proc(Int32*, Int32, SAFEARRAY**, HRESULT)).call(array, arraycount, safearray)
  end
  def int_safe_array_to_native_array(intarray : SAFEARRAY*, array : Int32**, arraycount : Int32*) : HRESULT
    @lpVtbl.value.int_safe_array_to_native_array.unsafe_as(Proc(SAFEARRAY*, Int32**, Int32*, HRESULT)).call(intarray, array, arraycount)
  end
  def rect_to_variant(rc : RECT, var : VARIANT*) : HRESULT
    @lpVtbl.value.rect_to_variant.unsafe_as(Proc(RECT, VARIANT*, HRESULT)).call(rc, var)
  end
  def variant_to_rect(var : VARIANT, rc : RECT*) : HRESULT
    @lpVtbl.value.variant_to_rect.unsafe_as(Proc(VARIANT, RECT*, HRESULT)).call(var, rc)
  end
  def safe_array_to_rect_native_array(rects : SAFEARRAY*, rectarray : RECT**, rectarraycount : Int32*) : HRESULT
    @lpVtbl.value.safe_array_to_rect_native_array.unsafe_as(Proc(SAFEARRAY*, RECT**, Int32*, HRESULT)).call(rects, rectarray, rectarraycount)
  end
  def create_proxy_factory_entry(factory : IUIAutomationProxyFactory, factoryentry : IUIAutomationProxyFactoryEntry*) : HRESULT
    @lpVtbl.value.create_proxy_factory_entry.unsafe_as(Proc(IUIAutomationProxyFactory, IUIAutomationProxyFactoryEntry*, HRESULT)).call(factory, factoryentry)
  end
  def get_proxy_factory_mapping(factorymapping : IUIAutomationProxyFactoryMapping*) : HRESULT
    @lpVtbl.value.get_proxy_factory_mapping.unsafe_as(Proc(IUIAutomationProxyFactoryMapping*, HRESULT)).call(factorymapping)
  end
  def get_property_programmatic_name(property : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_property_programmatic_name.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(property, name)
  end
  def get_pattern_programmatic_name(pattern : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_pattern_programmatic_name.unsafe_as(Proc(Int32, UInt8**, HRESULT)).call(pattern, name)
  end
  def poll_for_potential_supported_patterns(pelement : IUIAutomationElement, patternids : SAFEARRAY**, patternnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_patterns.unsafe_as(Proc(IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(pelement, patternids, patternnames)
  end
  def poll_for_potential_supported_properties(pelement : IUIAutomationElement, propertyids : SAFEARRAY**, propertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_properties.unsafe_as(Proc(IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)).call(pelement, propertyids, propertynames)
  end
  def check_not_supported(value : VARIANT, isnotsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_not_supported.unsafe_as(Proc(VARIANT, LibC::BOOL*, HRESULT)).call(value, isnotsupported)
  end
  def get_reserved_not_supported_value(notsupportedvalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_not_supported_value.unsafe_as(Proc(IUnknown*, HRESULT)).call(notsupportedvalue)
  end
  def get_reserved_mixed_attribute_value(mixedattributevalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_mixed_attribute_value.unsafe_as(Proc(IUnknown*, HRESULT)).call(mixedattributevalue)
  end
  def element_from_i_accessible(accessible : IAccessible, childid : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible.unsafe_as(Proc(IAccessible, Int32, IUIAutomationElement*, HRESULT)).call(accessible, childid, element)
  end
  def element_from_i_accessible_build_cache(accessible : IAccessible, childid : Int32, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible_build_cache.unsafe_as(Proc(IAccessible, Int32, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)).call(accessible, childid, cacherequest, element)
  end
  def get_auto_set_focus(autosetfocus : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_auto_set_focus.unsafe_as(Proc(LibC::BOOL*, HRESULT)).call(autosetfocus)
  end
  def put_auto_set_focus(autosetfocus : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_auto_set_focus.unsafe_as(Proc(LibC::BOOL, HRESULT)).call(autosetfocus)
  end
  def get_connection_timeout(timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(timeout)
  end
  def put_connection_timeout(timeout : UInt32) : HRESULT
    @lpVtbl.value.put_connection_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(timeout)
  end
  def get_transaction_timeout(timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_transaction_timeout.unsafe_as(Proc(UInt32*, HRESULT)).call(timeout)
  end
  def put_transaction_timeout(timeout : UInt32) : HRESULT
    @lpVtbl.value.put_transaction_timeout.unsafe_as(Proc(UInt32, HRESULT)).call(timeout)
  end
  def add_text_edit_text_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, texteditchangetype : TextEditChangeType, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.add_text_edit_text_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, TextEditChangeType, IUIAutomationCacheRequest, IUIAutomationTextEditTextChangedEventHandler, HRESULT)).call(element, scope, texteditchangetype, cacherequest, handler)
  end
  def remove_text_edit_text_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_text_edit_text_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationTextEditTextChangedEventHandler, HRESULT)).call(element, handler)
  end
  def add_changes_event_handler(element : IUIAutomationElement, scope : TreeScope, changetypes : Int32*, changescount : Int32, pcacherequest : IUIAutomationCacheRequest, handler : IUIAutomationChangesEventHandler) : HRESULT
    @lpVtbl.value.add_changes_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, Int32*, Int32, IUIAutomationCacheRequest, IUIAutomationChangesEventHandler, HRESULT)).call(element, scope, changetypes, changescount, pcacherequest, handler)
  end
  def remove_changes_event_handler(element : IUIAutomationElement, handler : IUIAutomationChangesEventHandler) : HRESULT
    @lpVtbl.value.remove_changes_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationChangesEventHandler, HRESULT)).call(element, handler)
  end
  def add_notification_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationNotificationEventHandler) : HRESULT
    @lpVtbl.value.add_notification_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationNotificationEventHandler, HRESULT)).call(element, scope, cacherequest, handler)
  end
  def remove_notification_event_handler(element : IUIAutomationElement, handler : IUIAutomationNotificationEventHandler) : HRESULT
    @lpVtbl.value.remove_notification_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationNotificationEventHandler, HRESULT)).call(element, handler)
  end
  def create_event_handler_group(handlergroup : IUIAutomationEventHandlerGroup*) : HRESULT
    @lpVtbl.value.create_event_handler_group.unsafe_as(Proc(IUIAutomationEventHandlerGroup*, HRESULT)).call(handlergroup)
  end
  def add_event_handler_group(element : IUIAutomationElement, handlergroup : IUIAutomationEventHandlerGroup) : HRESULT
    @lpVtbl.value.add_event_handler_group.unsafe_as(Proc(IUIAutomationElement, IUIAutomationEventHandlerGroup, HRESULT)).call(element, handlergroup)
  end
  def remove_event_handler_group(element : IUIAutomationElement, handlergroup : IUIAutomationEventHandlerGroup) : HRESULT
    @lpVtbl.value.remove_event_handler_group.unsafe_as(Proc(IUIAutomationElement, IUIAutomationEventHandlerGroup, HRESULT)).call(element, handlergroup)
  end
  def get_connection_recovery_behavior(connectionrecoverybehavioroptions : ConnectionRecoveryBehaviorOptions*) : HRESULT
    @lpVtbl.value.get_connection_recovery_behavior.unsafe_as(Proc(ConnectionRecoveryBehaviorOptions*, HRESULT)).call(connectionrecoverybehavioroptions)
  end
  def put_connection_recovery_behavior(connectionrecoverybehavioroptions : ConnectionRecoveryBehaviorOptions) : HRESULT
    @lpVtbl.value.put_connection_recovery_behavior.unsafe_as(Proc(ConnectionRecoveryBehaviorOptions, HRESULT)).call(connectionrecoverybehavioroptions)
  end
  def get_coalesce_events(coalesceeventsoptions : CoalesceEventsOptions*) : HRESULT
    @lpVtbl.value.get_coalesce_events.unsafe_as(Proc(CoalesceEventsOptions*, HRESULT)).call(coalesceeventsoptions)
  end
  def put_coalesce_events(coalesceeventsoptions : CoalesceEventsOptions) : HRESULT
    @lpVtbl.value.put_coalesce_events.unsafe_as(Proc(CoalesceEventsOptions, HRESULT)).call(coalesceeventsoptions)
  end
  def add_active_text_position_changed_event_handler(element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationActiveTextPositionChangedEventHandler) : HRESULT
    @lpVtbl.value.add_active_text_position_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationActiveTextPositionChangedEventHandler, HRESULT)).call(element, scope, cacherequest, handler)
  end
  def remove_active_text_position_changed_event_handler(element : IUIAutomationElement, handler : IUIAutomationActiveTextPositionChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_active_text_position_changed_event_handler.unsafe_as(Proc(IUIAutomationElement, IUIAutomationActiveTextPositionChangedEventHandler, HRESULT)).call(element, handler)
  end
end
