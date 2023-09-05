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
    query_interface : Proc(IRicheditWindowlessAccessibility*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRicheditWindowlessAccessibility*, UInt32)
    release : Proc(IRicheditWindowlessAccessibility*, UInt32)
    create_provider : Proc(IRicheditWindowlessAccessibility*, IRawElementProviderWindowlessSite, IRawElementProviderSimple*, HRESULT)
  end

  struct IRicheditWindowlessAccessibility
    lpVtbl : IRicheditWindowlessAccessibilityVTbl*
  end

  struct IRichEditUiaInformationVTbl
    query_interface : Proc(IRichEditUiaInformation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRichEditUiaInformation*, UInt32)
    release : Proc(IRichEditUiaInformation*, UInt32)
    get_boundary_rectangle : Proc(IRichEditUiaInformation*, UiaRect*, HRESULT)
    is_visible : Proc(IRichEditUiaInformation*, HRESULT)
  end

  struct IRichEditUiaInformation
    lpVtbl : IRichEditUiaInformationVTbl*
  end

  struct IAccessibleVTbl
    query_interface : Proc(IAccessible*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccessible*, UInt32)
    release : Proc(IAccessible*, UInt32)
    get_type_info_count : Proc(IAccessible*, UInt32*, HRESULT)
    get_type_info : Proc(IAccessible*, UInt32, UInt32, ITypeInfo*, HRESULT)
    get_i_ds_of_names : Proc(IAccessible*, Guid*, LibC::LPWSTR*, UInt32, UInt32, Int32*, HRESULT)
    invoke : Proc(IAccessible*, Int32, Guid*, UInt32, UInt16, DISPPARAMS*, VARIANT*, EXCEPINFO*, UInt32*, HRESULT)
    get_acc_parent : Proc(IAccessible*, IDispatch*, HRESULT)
    get_acc_child_count : Proc(IAccessible*, Int32*, HRESULT)
    get_acc_child : Proc(IAccessible*, VARIANT, IDispatch*, HRESULT)
    get_acc_name : Proc(IAccessible*, VARIANT, UInt8**, HRESULT)
    get_acc_value : Proc(IAccessible*, VARIANT, UInt8**, HRESULT)
    get_acc_description : Proc(IAccessible*, VARIANT, UInt8**, HRESULT)
    get_acc_role : Proc(IAccessible*, VARIANT, VARIANT*, HRESULT)
    get_acc_state : Proc(IAccessible*, VARIANT, VARIANT*, HRESULT)
    get_acc_help : Proc(IAccessible*, VARIANT, UInt8**, HRESULT)
    get_acc_help_topic : Proc(IAccessible*, UInt8**, VARIANT, Int32*, HRESULT)
    get_acc_keyboard_shortcut : Proc(IAccessible*, VARIANT, UInt8**, HRESULT)
    get_acc_focus : Proc(IAccessible*, VARIANT*, HRESULT)
    get_acc_selection : Proc(IAccessible*, VARIANT*, HRESULT)
    get_acc_default_action : Proc(IAccessible*, VARIANT, UInt8**, HRESULT)
    acc_select : Proc(IAccessible*, Int32, VARIANT, HRESULT)
    acc_location : Proc(IAccessible*, Int32*, Int32*, Int32*, Int32*, VARIANT, HRESULT)
    acc_navigate : Proc(IAccessible*, Int32, VARIANT, VARIANT*, HRESULT)
    acc_hit_test : Proc(IAccessible*, Int32, Int32, VARIANT*, HRESULT)
    acc_do_default_action : Proc(IAccessible*, VARIANT, HRESULT)
    put_acc_name : Proc(IAccessible*, VARIANT, UInt8*, HRESULT)
    put_acc_value : Proc(IAccessible*, VARIANT, UInt8*, HRESULT)
  end

  IAccessible_GUID = "618736e0-3c3d-11cf-810c-00aa00389b71"
  IID_IAccessible = LibC::GUID.new(0x618736e0_u32, 0x3c3d_u16, 0x11cf_u16, StaticArray[0x81_u8, 0xc_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x38_u8, 0x9b_u8, 0x71_u8])
  struct IAccessible
    lpVtbl : IAccessibleVTbl*
  end

  struct IAccessibleHandlerVTbl
    query_interface : Proc(IAccessibleHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccessibleHandler*, UInt32)
    release : Proc(IAccessibleHandler*, UInt32)
    accessible_object_from_id : Proc(IAccessibleHandler*, Int32, Int32, IAccessible*, HRESULT)
  end

  IAccessibleHandler_GUID = "03022430-abc4-11d0-bde2-00aa001a1953"
  IID_IAccessibleHandler = LibC::GUID.new(0x3022430_u32, 0xabc4_u16, 0x11d0_u16, StaticArray[0xbd_u8, 0xe2_u8, 0x0_u8, 0xaa_u8, 0x0_u8, 0x1a_u8, 0x19_u8, 0x53_u8])
  struct IAccessibleHandler
    lpVtbl : IAccessibleHandlerVTbl*
  end

  struct IAccessibleWindowlessSiteVTbl
    query_interface : Proc(IAccessibleWindowlessSite*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccessibleWindowlessSite*, UInt32)
    release : Proc(IAccessibleWindowlessSite*, UInt32)
    acquire_object_id_range : Proc(IAccessibleWindowlessSite*, Int32, IAccessibleHandler, Int32*, HRESULT)
    release_object_id_range : Proc(IAccessibleWindowlessSite*, Int32, IAccessibleHandler, HRESULT)
    query_object_id_ranges : Proc(IAccessibleWindowlessSite*, IAccessibleHandler, SAFEARRAY**, HRESULT)
    get_parent_accessible : Proc(IAccessibleWindowlessSite*, IAccessible*, HRESULT)
  end

  IAccessibleWindowlessSite_GUID = "bf3abd9c-76da-4389-9eb6-1427d25abab7"
  IID_IAccessibleWindowlessSite = LibC::GUID.new(0xbf3abd9c_u32, 0x76da_u16, 0x4389_u16, StaticArray[0x9e_u8, 0xb6_u8, 0x14_u8, 0x27_u8, 0xd2_u8, 0x5a_u8, 0xba_u8, 0xb7_u8])
  struct IAccessibleWindowlessSite
    lpVtbl : IAccessibleWindowlessSiteVTbl*
  end

  struct IAccIdentityVTbl
    query_interface : Proc(IAccIdentity*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccIdentity*, UInt32)
    release : Proc(IAccIdentity*, UInt32)
    get_identity_string : Proc(IAccIdentity*, UInt32, UInt8**, UInt32*, HRESULT)
  end

  IAccIdentity_GUID = "7852b78d-1cfd-41c1-a615-9c0c85960b5f"
  IID_IAccIdentity = LibC::GUID.new(0x7852b78d_u32, 0x1cfd_u16, 0x41c1_u16, StaticArray[0xa6_u8, 0x15_u8, 0x9c_u8, 0xc_u8, 0x85_u8, 0x96_u8, 0xb_u8, 0x5f_u8])
  struct IAccIdentity
    lpVtbl : IAccIdentityVTbl*
  end

  struct IAccPropServerVTbl
    query_interface : Proc(IAccPropServer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccPropServer*, UInt32)
    release : Proc(IAccPropServer*, UInt32)
    get_prop_value : Proc(IAccPropServer*, UInt8*, UInt32, Guid, VARIANT*, LibC::BOOL*, HRESULT)
  end

  IAccPropServer_GUID = "76c0dbbb-15e0-4e7b-b61b-20eeea2001e0"
  IID_IAccPropServer = LibC::GUID.new(0x76c0dbbb_u32, 0x15e0_u16, 0x4e7b_u16, StaticArray[0xb6_u8, 0x1b_u8, 0x20_u8, 0xee_u8, 0xea_u8, 0x20_u8, 0x1_u8, 0xe0_u8])
  struct IAccPropServer
    lpVtbl : IAccPropServerVTbl*
  end

  struct IAccPropServicesVTbl
    query_interface : Proc(IAccPropServices*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccPropServices*, UInt32)
    release : Proc(IAccPropServices*, UInt32)
    set_prop_value : Proc(IAccPropServices*, UInt8*, UInt32, Guid, VARIANT, HRESULT)
    set_prop_server : Proc(IAccPropServices*, UInt8*, UInt32, Guid*, Int32, IAccPropServer, AnnoScope, HRESULT)
    clear_props : Proc(IAccPropServices*, UInt8*, UInt32, Guid*, Int32, HRESULT)
    set_hwnd_prop : Proc(IAccPropServices*, LibC::HANDLE, UInt32, UInt32, Guid, VARIANT, HRESULT)
    set_hwnd_prop_str : Proc(IAccPropServices*, LibC::HANDLE, UInt32, UInt32, Guid, LibC::LPWSTR, HRESULT)
    set_hwnd_prop_server : Proc(IAccPropServices*, LibC::HANDLE, UInt32, UInt32, Guid*, Int32, IAccPropServer, AnnoScope, HRESULT)
    clear_hwnd_props : Proc(IAccPropServices*, LibC::HANDLE, UInt32, UInt32, Guid*, Int32, HRESULT)
    compose_hwnd_identity_string : Proc(IAccPropServices*, LibC::HANDLE, UInt32, UInt32, UInt8**, UInt32*, HRESULT)
    decompose_hwnd_identity_string : Proc(IAccPropServices*, UInt8*, UInt32, HANDLE*, UInt32*, UInt32*, HRESULT)
    set_hmenu_prop : Proc(IAccPropServices*, LibC::HANDLE, UInt32, Guid, VARIANT, HRESULT)
    set_hmenu_prop_str : Proc(IAccPropServices*, LibC::HANDLE, UInt32, Guid, LibC::LPWSTR, HRESULT)
    set_hmenu_prop_server : Proc(IAccPropServices*, LibC::HANDLE, UInt32, Guid*, Int32, IAccPropServer, AnnoScope, HRESULT)
    clear_hmenu_props : Proc(IAccPropServices*, LibC::HANDLE, UInt32, Guid*, Int32, HRESULT)
    compose_hmenu_identity_string : Proc(IAccPropServices*, LibC::HANDLE, UInt32, UInt8**, UInt32*, HRESULT)
    decompose_hmenu_identity_string : Proc(IAccPropServices*, UInt8*, UInt32, HANDLE*, UInt32*, HRESULT)
  end

  IAccPropServices_GUID = "6e26e776-04f0-495d-80e4-3330352e3169"
  IID_IAccPropServices = LibC::GUID.new(0x6e26e776_u32, 0x4f0_u16, 0x495d_u16, StaticArray[0x80_u8, 0xe4_u8, 0x33_u8, 0x30_u8, 0x35_u8, 0x2e_u8, 0x31_u8, 0x69_u8])
  struct IAccPropServices
    lpVtbl : IAccPropServicesVTbl*
  end

  struct IRawElementProviderSimpleVTbl
    query_interface : Proc(IRawElementProviderSimple*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRawElementProviderSimple*, UInt32)
    release : Proc(IRawElementProviderSimple*, UInt32)
    get_provider_options : Proc(IRawElementProviderSimple*, ProviderOptions*, HRESULT)
    get_pattern_provider : Proc(IRawElementProviderSimple*, Int32, IUnknown*, HRESULT)
    get_property_value : Proc(IRawElementProviderSimple*, Int32, VARIANT*, HRESULT)
    get_host_raw_element_provider : Proc(IRawElementProviderSimple*, IRawElementProviderSimple*, HRESULT)
  end

  IRawElementProviderSimple_GUID = "d6dd68d1-86fd-4332-8666-9abedea2d24c"
  IID_IRawElementProviderSimple = LibC::GUID.new(0xd6dd68d1_u32, 0x86fd_u16, 0x4332_u16, StaticArray[0x86_u8, 0x66_u8, 0x9a_u8, 0xbe_u8, 0xde_u8, 0xa2_u8, 0xd2_u8, 0x4c_u8])
  struct IRawElementProviderSimple
    lpVtbl : IRawElementProviderSimpleVTbl*
  end

  struct IAccessibleExVTbl
    query_interface : Proc(IAccessibleEx*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccessibleEx*, UInt32)
    release : Proc(IAccessibleEx*, UInt32)
    get_object_for_child : Proc(IAccessibleEx*, Int32, IAccessibleEx*, HRESULT)
    get_i_accessible_pair : Proc(IAccessibleEx*, IAccessible*, Int32*, HRESULT)
    get_runtime_id : Proc(IAccessibleEx*, SAFEARRAY**, HRESULT)
    convert_returned_element : Proc(IAccessibleEx*, IRawElementProviderSimple, IAccessibleEx*, HRESULT)
  end

  IAccessibleEx_GUID = "f8b80ada-2c44-48d0-89be-5ff23c9cd875"
  IID_IAccessibleEx = LibC::GUID.new(0xf8b80ada_u32, 0x2c44_u16, 0x48d0_u16, StaticArray[0x89_u8, 0xbe_u8, 0x5f_u8, 0xf2_u8, 0x3c_u8, 0x9c_u8, 0xd8_u8, 0x75_u8])
  struct IAccessibleEx
    lpVtbl : IAccessibleExVTbl*
  end

  struct IRawElementProviderSimple2VTbl
    query_interface : Proc(IRawElementProviderSimple2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRawElementProviderSimple2*, UInt32)
    release : Proc(IRawElementProviderSimple2*, UInt32)
    get_provider_options : Proc(IRawElementProviderSimple2*, ProviderOptions*, HRESULT)
    get_pattern_provider : Proc(IRawElementProviderSimple2*, Int32, IUnknown*, HRESULT)
    get_property_value : Proc(IRawElementProviderSimple2*, Int32, VARIANT*, HRESULT)
    get_host_raw_element_provider : Proc(IRawElementProviderSimple2*, IRawElementProviderSimple*, HRESULT)
    show_context_menu : Proc(IRawElementProviderSimple2*, HRESULT)
  end

  IRawElementProviderSimple2_GUID = "a0a839a9-8da1-4a82-806a-8e0d44e79f56"
  IID_IRawElementProviderSimple2 = LibC::GUID.new(0xa0a839a9_u32, 0x8da1_u16, 0x4a82_u16, StaticArray[0x80_u8, 0x6a_u8, 0x8e_u8, 0xd_u8, 0x44_u8, 0xe7_u8, 0x9f_u8, 0x56_u8])
  struct IRawElementProviderSimple2
    lpVtbl : IRawElementProviderSimple2VTbl*
  end

  struct IRawElementProviderSimple3VTbl
    query_interface : Proc(IRawElementProviderSimple3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRawElementProviderSimple3*, UInt32)
    release : Proc(IRawElementProviderSimple3*, UInt32)
    get_provider_options : Proc(IRawElementProviderSimple3*, ProviderOptions*, HRESULT)
    get_pattern_provider : Proc(IRawElementProviderSimple3*, Int32, IUnknown*, HRESULT)
    get_property_value : Proc(IRawElementProviderSimple3*, Int32, VARIANT*, HRESULT)
    get_host_raw_element_provider : Proc(IRawElementProviderSimple3*, IRawElementProviderSimple*, HRESULT)
    show_context_menu : Proc(IRawElementProviderSimple3*, HRESULT)
    get_metadata_value : Proc(IRawElementProviderSimple3*, Int32, Int32, VARIANT*, HRESULT)
  end

  IRawElementProviderSimple3_GUID = "fcf5d820-d7ec-4613-bdf6-42a84ce7daaf"
  IID_IRawElementProviderSimple3 = LibC::GUID.new(0xfcf5d820_u32, 0xd7ec_u16, 0x4613_u16, StaticArray[0xbd_u8, 0xf6_u8, 0x42_u8, 0xa8_u8, 0x4c_u8, 0xe7_u8, 0xda_u8, 0xaf_u8])
  struct IRawElementProviderSimple3
    lpVtbl : IRawElementProviderSimple3VTbl*
  end

  struct IRawElementProviderFragmentRootVTbl
    query_interface : Proc(IRawElementProviderFragmentRoot*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRawElementProviderFragmentRoot*, UInt32)
    release : Proc(IRawElementProviderFragmentRoot*, UInt32)
    element_provider_from_point : Proc(IRawElementProviderFragmentRoot*, Float64, Float64, IRawElementProviderFragment*, HRESULT)
    get_focus : Proc(IRawElementProviderFragmentRoot*, IRawElementProviderFragment*, HRESULT)
  end

  IRawElementProviderFragmentRoot_GUID = "620ce2a5-ab8f-40a9-86cb-de3c75599b58"
  IID_IRawElementProviderFragmentRoot = LibC::GUID.new(0x620ce2a5_u32, 0xab8f_u16, 0x40a9_u16, StaticArray[0x86_u8, 0xcb_u8, 0xde_u8, 0x3c_u8, 0x75_u8, 0x59_u8, 0x9b_u8, 0x58_u8])
  struct IRawElementProviderFragmentRoot
    lpVtbl : IRawElementProviderFragmentRootVTbl*
  end

  struct IRawElementProviderFragmentVTbl
    query_interface : Proc(IRawElementProviderFragment*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRawElementProviderFragment*, UInt32)
    release : Proc(IRawElementProviderFragment*, UInt32)
    navigate : Proc(IRawElementProviderFragment*, NavigateDirection, IRawElementProviderFragment*, HRESULT)
    get_runtime_id : Proc(IRawElementProviderFragment*, SAFEARRAY**, HRESULT)
    get_bounding_rectangle : Proc(IRawElementProviderFragment*, UiaRect*, HRESULT)
    get_embedded_fragment_roots : Proc(IRawElementProviderFragment*, SAFEARRAY**, HRESULT)
    set_focus : Proc(IRawElementProviderFragment*, HRESULT)
    get_fragment_root : Proc(IRawElementProviderFragment*, IRawElementProviderFragmentRoot*, HRESULT)
  end

  IRawElementProviderFragment_GUID = "f7063da8-8359-439c-9297-bbc5299a7d87"
  IID_IRawElementProviderFragment = LibC::GUID.new(0xf7063da8_u32, 0x8359_u16, 0x439c_u16, StaticArray[0x92_u8, 0x97_u8, 0xbb_u8, 0xc5_u8, 0x29_u8, 0x9a_u8, 0x7d_u8, 0x87_u8])
  struct IRawElementProviderFragment
    lpVtbl : IRawElementProviderFragmentVTbl*
  end

  struct IRawElementProviderAdviseEventsVTbl
    query_interface : Proc(IRawElementProviderAdviseEvents*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRawElementProviderAdviseEvents*, UInt32)
    release : Proc(IRawElementProviderAdviseEvents*, UInt32)
    advise_event_added : Proc(IRawElementProviderAdviseEvents*, Int32, SAFEARRAY*, HRESULT)
    advise_event_removed : Proc(IRawElementProviderAdviseEvents*, Int32, SAFEARRAY*, HRESULT)
  end

  IRawElementProviderAdviseEvents_GUID = "a407b27b-0f6d-4427-9292-473c7bf93258"
  IID_IRawElementProviderAdviseEvents = LibC::GUID.new(0xa407b27b_u32, 0xf6d_u16, 0x4427_u16, StaticArray[0x92_u8, 0x92_u8, 0x47_u8, 0x3c_u8, 0x7b_u8, 0xf9_u8, 0x32_u8, 0x58_u8])
  struct IRawElementProviderAdviseEvents
    lpVtbl : IRawElementProviderAdviseEventsVTbl*
  end

  struct IRawElementProviderHwndOverrideVTbl
    query_interface : Proc(IRawElementProviderHwndOverride*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRawElementProviderHwndOverride*, UInt32)
    release : Proc(IRawElementProviderHwndOverride*, UInt32)
    get_override_provider_for_hwnd : Proc(IRawElementProviderHwndOverride*, LibC::HANDLE, IRawElementProviderSimple*, HRESULT)
  end

  IRawElementProviderHwndOverride_GUID = "1d5df27c-8947-4425-b8d9-79787bb460b8"
  IID_IRawElementProviderHwndOverride = LibC::GUID.new(0x1d5df27c_u32, 0x8947_u16, 0x4425_u16, StaticArray[0xb8_u8, 0xd9_u8, 0x79_u8, 0x78_u8, 0x7b_u8, 0xb4_u8, 0x60_u8, 0xb8_u8])
  struct IRawElementProviderHwndOverride
    lpVtbl : IRawElementProviderHwndOverrideVTbl*
  end

  struct IProxyProviderWinEventSinkVTbl
    query_interface : Proc(IProxyProviderWinEventSink*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProxyProviderWinEventSink*, UInt32)
    release : Proc(IProxyProviderWinEventSink*, UInt32)
    add_automation_property_changed_event : Proc(IProxyProviderWinEventSink*, IRawElementProviderSimple, Int32, VARIANT, HRESULT)
    add_automation_event : Proc(IProxyProviderWinEventSink*, IRawElementProviderSimple, Int32, HRESULT)
    add_structure_changed_event : Proc(IProxyProviderWinEventSink*, IRawElementProviderSimple, StructureChangeType, SAFEARRAY*, HRESULT)
  end

  IProxyProviderWinEventSink_GUID = "4fd82b78-a43e-46ac-9803-0a6969c7c183"
  IID_IProxyProviderWinEventSink = LibC::GUID.new(0x4fd82b78_u32, 0xa43e_u16, 0x46ac_u16, StaticArray[0x98_u8, 0x3_u8, 0xa_u8, 0x69_u8, 0x69_u8, 0xc7_u8, 0xc1_u8, 0x83_u8])
  struct IProxyProviderWinEventSink
    lpVtbl : IProxyProviderWinEventSinkVTbl*
  end

  struct IProxyProviderWinEventHandlerVTbl
    query_interface : Proc(IProxyProviderWinEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProxyProviderWinEventHandler*, UInt32)
    release : Proc(IProxyProviderWinEventHandler*, UInt32)
    respond_to_win_event : Proc(IProxyProviderWinEventHandler*, UInt32, LibC::HANDLE, Int32, Int32, IProxyProviderWinEventSink, HRESULT)
  end

  IProxyProviderWinEventHandler_GUID = "89592ad4-f4e0-43d5-a3b6-bad7e111b435"
  IID_IProxyProviderWinEventHandler = LibC::GUID.new(0x89592ad4_u32, 0xf4e0_u16, 0x43d5_u16, StaticArray[0xa3_u8, 0xb6_u8, 0xba_u8, 0xd7_u8, 0xe1_u8, 0x11_u8, 0xb4_u8, 0x35_u8])
  struct IProxyProviderWinEventHandler
    lpVtbl : IProxyProviderWinEventHandlerVTbl*
  end

  struct IRawElementProviderWindowlessSiteVTbl
    query_interface : Proc(IRawElementProviderWindowlessSite*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRawElementProviderWindowlessSite*, UInt32)
    release : Proc(IRawElementProviderWindowlessSite*, UInt32)
    get_adjacent_fragment : Proc(IRawElementProviderWindowlessSite*, NavigateDirection, IRawElementProviderFragment*, HRESULT)
    get_runtime_id_prefix : Proc(IRawElementProviderWindowlessSite*, SAFEARRAY**, HRESULT)
  end

  IRawElementProviderWindowlessSite_GUID = "0a2a93cc-bfad-42ac-9b2e-0991fb0d3ea0"
  IID_IRawElementProviderWindowlessSite = LibC::GUID.new(0xa2a93cc_u32, 0xbfad_u16, 0x42ac_u16, StaticArray[0x9b_u8, 0x2e_u8, 0x9_u8, 0x91_u8, 0xfb_u8, 0xd_u8, 0x3e_u8, 0xa0_u8])
  struct IRawElementProviderWindowlessSite
    lpVtbl : IRawElementProviderWindowlessSiteVTbl*
  end

  struct IAccessibleHostingElementProvidersVTbl
    query_interface : Proc(IAccessibleHostingElementProviders*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccessibleHostingElementProviders*, UInt32)
    release : Proc(IAccessibleHostingElementProviders*, UInt32)
    get_embedded_fragment_roots : Proc(IAccessibleHostingElementProviders*, SAFEARRAY**, HRESULT)
    get_object_id_for_provider : Proc(IAccessibleHostingElementProviders*, IRawElementProviderSimple, Int32*, HRESULT)
  end

  IAccessibleHostingElementProviders_GUID = "33ac331b-943e-4020-b295-db37784974a3"
  IID_IAccessibleHostingElementProviders = LibC::GUID.new(0x33ac331b_u32, 0x943e_u16, 0x4020_u16, StaticArray[0xb2_u8, 0x95_u8, 0xdb_u8, 0x37_u8, 0x78_u8, 0x49_u8, 0x74_u8, 0xa3_u8])
  struct IAccessibleHostingElementProviders
    lpVtbl : IAccessibleHostingElementProvidersVTbl*
  end

  struct IRawElementProviderHostingAccessiblesVTbl
    query_interface : Proc(IRawElementProviderHostingAccessibles*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRawElementProviderHostingAccessibles*, UInt32)
    release : Proc(IRawElementProviderHostingAccessibles*, UInt32)
    get_embedded_accessibles : Proc(IRawElementProviderHostingAccessibles*, SAFEARRAY**, HRESULT)
  end

  IRawElementProviderHostingAccessibles_GUID = "24be0b07-d37d-487a-98cf-a13ed465e9b3"
  IID_IRawElementProviderHostingAccessibles = LibC::GUID.new(0x24be0b07_u32, 0xd37d_u16, 0x487a_u16, StaticArray[0x98_u8, 0xcf_u8, 0xa1_u8, 0x3e_u8, 0xd4_u8, 0x65_u8, 0xe9_u8, 0xb3_u8])
  struct IRawElementProviderHostingAccessibles
    lpVtbl : IRawElementProviderHostingAccessiblesVTbl*
  end

  struct IDockProviderVTbl
    query_interface : Proc(IDockProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDockProvider*, UInt32)
    release : Proc(IDockProvider*, UInt32)
    set_dock_position : Proc(IDockProvider*, DockPosition, HRESULT)
    get_dock_position : Proc(IDockProvider*, DockPosition*, HRESULT)
  end

  IDockProvider_GUID = "159bc72c-4ad3-485e-9637-d7052edf0146"
  IID_IDockProvider = LibC::GUID.new(0x159bc72c_u32, 0x4ad3_u16, 0x485e_u16, StaticArray[0x96_u8, 0x37_u8, 0xd7_u8, 0x5_u8, 0x2e_u8, 0xdf_u8, 0x1_u8, 0x46_u8])
  struct IDockProvider
    lpVtbl : IDockProviderVTbl*
  end

  struct IExpandCollapseProviderVTbl
    query_interface : Proc(IExpandCollapseProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IExpandCollapseProvider*, UInt32)
    release : Proc(IExpandCollapseProvider*, UInt32)
    expand : Proc(IExpandCollapseProvider*, HRESULT)
    collapse : Proc(IExpandCollapseProvider*, HRESULT)
    get_expand_collapse_state : Proc(IExpandCollapseProvider*, ExpandCollapseState*, HRESULT)
  end

  IExpandCollapseProvider_GUID = "d847d3a5-cab0-4a98-8c32-ecb45c59ad24"
  IID_IExpandCollapseProvider = LibC::GUID.new(0xd847d3a5_u32, 0xcab0_u16, 0x4a98_u16, StaticArray[0x8c_u8, 0x32_u8, 0xec_u8, 0xb4_u8, 0x5c_u8, 0x59_u8, 0xad_u8, 0x24_u8])
  struct IExpandCollapseProvider
    lpVtbl : IExpandCollapseProviderVTbl*
  end

  struct IGridProviderVTbl
    query_interface : Proc(IGridProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGridProvider*, UInt32)
    release : Proc(IGridProvider*, UInt32)
    get_item : Proc(IGridProvider*, Int32, Int32, IRawElementProviderSimple*, HRESULT)
    get_row_count : Proc(IGridProvider*, Int32*, HRESULT)
    get_column_count : Proc(IGridProvider*, Int32*, HRESULT)
  end

  IGridProvider_GUID = "b17d6187-0907-464b-a168-0ef17a1572b1"
  IID_IGridProvider = LibC::GUID.new(0xb17d6187_u32, 0x907_u16, 0x464b_u16, StaticArray[0xa1_u8, 0x68_u8, 0xe_u8, 0xf1_u8, 0x7a_u8, 0x15_u8, 0x72_u8, 0xb1_u8])
  struct IGridProvider
    lpVtbl : IGridProviderVTbl*
  end

  struct IGridItemProviderVTbl
    query_interface : Proc(IGridItemProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IGridItemProvider*, UInt32)
    release : Proc(IGridItemProvider*, UInt32)
    get_row : Proc(IGridItemProvider*, Int32*, HRESULT)
    get_column : Proc(IGridItemProvider*, Int32*, HRESULT)
    get_row_span : Proc(IGridItemProvider*, Int32*, HRESULT)
    get_column_span : Proc(IGridItemProvider*, Int32*, HRESULT)
    get_containing_grid : Proc(IGridItemProvider*, IRawElementProviderSimple*, HRESULT)
  end

  IGridItemProvider_GUID = "d02541f1-fb81-4d64-ae32-f520f8a6dbd1"
  IID_IGridItemProvider = LibC::GUID.new(0xd02541f1_u32, 0xfb81_u16, 0x4d64_u16, StaticArray[0xae_u8, 0x32_u8, 0xf5_u8, 0x20_u8, 0xf8_u8, 0xa6_u8, 0xdb_u8, 0xd1_u8])
  struct IGridItemProvider
    lpVtbl : IGridItemProviderVTbl*
  end

  struct IInvokeProviderVTbl
    query_interface : Proc(IInvokeProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInvokeProvider*, UInt32)
    release : Proc(IInvokeProvider*, UInt32)
    invoke : Proc(IInvokeProvider*, HRESULT)
  end

  IInvokeProvider_GUID = "54fcb24b-e18e-47a2-b4d3-eccbe77599a2"
  IID_IInvokeProvider = LibC::GUID.new(0x54fcb24b_u32, 0xe18e_u16, 0x47a2_u16, StaticArray[0xb4_u8, 0xd3_u8, 0xec_u8, 0xcb_u8, 0xe7_u8, 0x75_u8, 0x99_u8, 0xa2_u8])
  struct IInvokeProvider
    lpVtbl : IInvokeProviderVTbl*
  end

  struct IMultipleViewProviderVTbl
    query_interface : Proc(IMultipleViewProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IMultipleViewProvider*, UInt32)
    release : Proc(IMultipleViewProvider*, UInt32)
    get_view_name : Proc(IMultipleViewProvider*, Int32, UInt8**, HRESULT)
    set_current_view : Proc(IMultipleViewProvider*, Int32, HRESULT)
    get_current_view : Proc(IMultipleViewProvider*, Int32*, HRESULT)
    get_supported_views : Proc(IMultipleViewProvider*, SAFEARRAY**, HRESULT)
  end

  IMultipleViewProvider_GUID = "6278cab1-b556-4a1a-b4e0-418acc523201"
  IID_IMultipleViewProvider = LibC::GUID.new(0x6278cab1_u32, 0xb556_u16, 0x4a1a_u16, StaticArray[0xb4_u8, 0xe0_u8, 0x41_u8, 0x8a_u8, 0xcc_u8, 0x52_u8, 0x32_u8, 0x1_u8])
  struct IMultipleViewProvider
    lpVtbl : IMultipleViewProviderVTbl*
  end

  struct IRangeValueProviderVTbl
    query_interface : Proc(IRangeValueProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRangeValueProvider*, UInt32)
    release : Proc(IRangeValueProvider*, UInt32)
    set_value : Proc(IRangeValueProvider*, Float64, HRESULT)
    get_value : Proc(IRangeValueProvider*, Float64*, HRESULT)
    get_is_read_only : Proc(IRangeValueProvider*, LibC::BOOL*, HRESULT)
    get_maximum : Proc(IRangeValueProvider*, Float64*, HRESULT)
    get_minimum : Proc(IRangeValueProvider*, Float64*, HRESULT)
    get_large_change : Proc(IRangeValueProvider*, Float64*, HRESULT)
    get_small_change : Proc(IRangeValueProvider*, Float64*, HRESULT)
  end

  IRangeValueProvider_GUID = "36dc7aef-33e6-4691-afe1-2be7274b3d33"
  IID_IRangeValueProvider = LibC::GUID.new(0x36dc7aef_u32, 0x33e6_u16, 0x4691_u16, StaticArray[0xaf_u8, 0xe1_u8, 0x2b_u8, 0xe7_u8, 0x27_u8, 0x4b_u8, 0x3d_u8, 0x33_u8])
  struct IRangeValueProvider
    lpVtbl : IRangeValueProviderVTbl*
  end

  struct IScrollItemProviderVTbl
    query_interface : Proc(IScrollItemProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IScrollItemProvider*, UInt32)
    release : Proc(IScrollItemProvider*, UInt32)
    scroll_into_view : Proc(IScrollItemProvider*, HRESULT)
  end

  IScrollItemProvider_GUID = "2360c714-4bf1-4b26-ba65-9b21316127eb"
  IID_IScrollItemProvider = LibC::GUID.new(0x2360c714_u32, 0x4bf1_u16, 0x4b26_u16, StaticArray[0xba_u8, 0x65_u8, 0x9b_u8, 0x21_u8, 0x31_u8, 0x61_u8, 0x27_u8, 0xeb_u8])
  struct IScrollItemProvider
    lpVtbl : IScrollItemProviderVTbl*
  end

  struct ISelectionProviderVTbl
    query_interface : Proc(ISelectionProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISelectionProvider*, UInt32)
    release : Proc(ISelectionProvider*, UInt32)
    get_selection : Proc(ISelectionProvider*, SAFEARRAY**, HRESULT)
    get_can_select_multiple : Proc(ISelectionProvider*, LibC::BOOL*, HRESULT)
    get_is_selection_required : Proc(ISelectionProvider*, LibC::BOOL*, HRESULT)
  end

  ISelectionProvider_GUID = "fb8b03af-3bdf-48d4-bd36-1a65793be168"
  IID_ISelectionProvider = LibC::GUID.new(0xfb8b03af_u32, 0x3bdf_u16, 0x48d4_u16, StaticArray[0xbd_u8, 0x36_u8, 0x1a_u8, 0x65_u8, 0x79_u8, 0x3b_u8, 0xe1_u8, 0x68_u8])
  struct ISelectionProvider
    lpVtbl : ISelectionProviderVTbl*
  end

  struct ISelectionProvider2VTbl
    query_interface : Proc(ISelectionProvider2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISelectionProvider2*, UInt32)
    release : Proc(ISelectionProvider2*, UInt32)
    get_selection : Proc(ISelectionProvider2*, SAFEARRAY**, HRESULT)
    get_can_select_multiple : Proc(ISelectionProvider2*, LibC::BOOL*, HRESULT)
    get_is_selection_required : Proc(ISelectionProvider2*, LibC::BOOL*, HRESULT)
    get_first_selected_item : Proc(ISelectionProvider2*, IRawElementProviderSimple*, HRESULT)
    get_last_selected_item : Proc(ISelectionProvider2*, IRawElementProviderSimple*, HRESULT)
    get_current_selected_item : Proc(ISelectionProvider2*, IRawElementProviderSimple*, HRESULT)
    get_item_count : Proc(ISelectionProvider2*, Int32*, HRESULT)
  end

  ISelectionProvider2_GUID = "14f68475-ee1c-44f6-a869-d239381f0fe7"
  IID_ISelectionProvider2 = LibC::GUID.new(0x14f68475_u32, 0xee1c_u16, 0x44f6_u16, StaticArray[0xa8_u8, 0x69_u8, 0xd2_u8, 0x39_u8, 0x38_u8, 0x1f_u8, 0xf_u8, 0xe7_u8])
  struct ISelectionProvider2
    lpVtbl : ISelectionProvider2VTbl*
  end

  struct IScrollProviderVTbl
    query_interface : Proc(IScrollProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IScrollProvider*, UInt32)
    release : Proc(IScrollProvider*, UInt32)
    scroll : Proc(IScrollProvider*, ScrollAmount, ScrollAmount, HRESULT)
    set_scroll_percent : Proc(IScrollProvider*, Float64, Float64, HRESULT)
    get_horizontal_scroll_percent : Proc(IScrollProvider*, Float64*, HRESULT)
    get_vertical_scroll_percent : Proc(IScrollProvider*, Float64*, HRESULT)
    get_horizontal_view_size : Proc(IScrollProvider*, Float64*, HRESULT)
    get_vertical_view_size : Proc(IScrollProvider*, Float64*, HRESULT)
    get_horizontally_scrollable : Proc(IScrollProvider*, LibC::BOOL*, HRESULT)
    get_vertically_scrollable : Proc(IScrollProvider*, LibC::BOOL*, HRESULT)
  end

  IScrollProvider_GUID = "b38b8077-1fc3-42a5-8cae-d40c2215055a"
  IID_IScrollProvider = LibC::GUID.new(0xb38b8077_u32, 0x1fc3_u16, 0x42a5_u16, StaticArray[0x8c_u8, 0xae_u8, 0xd4_u8, 0xc_u8, 0x22_u8, 0x15_u8, 0x5_u8, 0x5a_u8])
  struct IScrollProvider
    lpVtbl : IScrollProviderVTbl*
  end

  struct ISelectionItemProviderVTbl
    query_interface : Proc(ISelectionItemProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISelectionItemProvider*, UInt32)
    release : Proc(ISelectionItemProvider*, UInt32)
    select : Proc(ISelectionItemProvider*, HRESULT)
    add_to_selection : Proc(ISelectionItemProvider*, HRESULT)
    remove_from_selection : Proc(ISelectionItemProvider*, HRESULT)
    get_is_selected : Proc(ISelectionItemProvider*, LibC::BOOL*, HRESULT)
    get_selection_container : Proc(ISelectionItemProvider*, IRawElementProviderSimple*, HRESULT)
  end

  ISelectionItemProvider_GUID = "2acad808-b2d4-452d-a407-91ff1ad167b2"
  IID_ISelectionItemProvider = LibC::GUID.new(0x2acad808_u32, 0xb2d4_u16, 0x452d_u16, StaticArray[0xa4_u8, 0x7_u8, 0x91_u8, 0xff_u8, 0x1a_u8, 0xd1_u8, 0x67_u8, 0xb2_u8])
  struct ISelectionItemProvider
    lpVtbl : ISelectionItemProviderVTbl*
  end

  struct ISynchronizedInputProviderVTbl
    query_interface : Proc(ISynchronizedInputProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISynchronizedInputProvider*, UInt32)
    release : Proc(ISynchronizedInputProvider*, UInt32)
    start_listening : Proc(ISynchronizedInputProvider*, SynchronizedInputType, HRESULT)
    cancel : Proc(ISynchronizedInputProvider*, HRESULT)
  end

  ISynchronizedInputProvider_GUID = "29db1a06-02ce-4cf7-9b42-565d4fab20ee"
  IID_ISynchronizedInputProvider = LibC::GUID.new(0x29db1a06_u32, 0x2ce_u16, 0x4cf7_u16, StaticArray[0x9b_u8, 0x42_u8, 0x56_u8, 0x5d_u8, 0x4f_u8, 0xab_u8, 0x20_u8, 0xee_u8])
  struct ISynchronizedInputProvider
    lpVtbl : ISynchronizedInputProviderVTbl*
  end

  struct ITableProviderVTbl
    query_interface : Proc(ITableProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITableProvider*, UInt32)
    release : Proc(ITableProvider*, UInt32)
    get_row_headers : Proc(ITableProvider*, SAFEARRAY**, HRESULT)
    get_column_headers : Proc(ITableProvider*, SAFEARRAY**, HRESULT)
    get_row_or_column_major : Proc(ITableProvider*, RowOrColumnMajor*, HRESULT)
  end

  ITableProvider_GUID = "9c860395-97b3-490a-b52a-858cc22af166"
  IID_ITableProvider = LibC::GUID.new(0x9c860395_u32, 0x97b3_u16, 0x490a_u16, StaticArray[0xb5_u8, 0x2a_u8, 0x85_u8, 0x8c_u8, 0xc2_u8, 0x2a_u8, 0xf1_u8, 0x66_u8])
  struct ITableProvider
    lpVtbl : ITableProviderVTbl*
  end

  struct ITableItemProviderVTbl
    query_interface : Proc(ITableItemProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITableItemProvider*, UInt32)
    release : Proc(ITableItemProvider*, UInt32)
    get_row_header_items : Proc(ITableItemProvider*, SAFEARRAY**, HRESULT)
    get_column_header_items : Proc(ITableItemProvider*, SAFEARRAY**, HRESULT)
  end

  ITableItemProvider_GUID = "b9734fa6-771f-4d78-9c90-2517999349cd"
  IID_ITableItemProvider = LibC::GUID.new(0xb9734fa6_u32, 0x771f_u16, 0x4d78_u16, StaticArray[0x9c_u8, 0x90_u8, 0x25_u8, 0x17_u8, 0x99_u8, 0x93_u8, 0x49_u8, 0xcd_u8])
  struct ITableItemProvider
    lpVtbl : ITableItemProviderVTbl*
  end

  struct IToggleProviderVTbl
    query_interface : Proc(IToggleProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IToggleProvider*, UInt32)
    release : Proc(IToggleProvider*, UInt32)
    toggle : Proc(IToggleProvider*, HRESULT)
    get_toggle_state : Proc(IToggleProvider*, ToggleState*, HRESULT)
  end

  IToggleProvider_GUID = "56d00bd0-c4f4-433c-a836-1a52a57e0892"
  IID_IToggleProvider = LibC::GUID.new(0x56d00bd0_u32, 0xc4f4_u16, 0x433c_u16, StaticArray[0xa8_u8, 0x36_u8, 0x1a_u8, 0x52_u8, 0xa5_u8, 0x7e_u8, 0x8_u8, 0x92_u8])
  struct IToggleProvider
    lpVtbl : IToggleProviderVTbl*
  end

  struct ITransformProviderVTbl
    query_interface : Proc(ITransformProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransformProvider*, UInt32)
    release : Proc(ITransformProvider*, UInt32)
    move : Proc(ITransformProvider*, Float64, Float64, HRESULT)
    resize : Proc(ITransformProvider*, Float64, Float64, HRESULT)
    rotate : Proc(ITransformProvider*, Float64, HRESULT)
    get_can_move : Proc(ITransformProvider*, LibC::BOOL*, HRESULT)
    get_can_resize : Proc(ITransformProvider*, LibC::BOOL*, HRESULT)
    get_can_rotate : Proc(ITransformProvider*, LibC::BOOL*, HRESULT)
  end

  ITransformProvider_GUID = "6829ddc4-4f91-4ffa-b86f-bd3e2987cb4c"
  IID_ITransformProvider = LibC::GUID.new(0x6829ddc4_u32, 0x4f91_u16, 0x4ffa_u16, StaticArray[0xb8_u8, 0x6f_u8, 0xbd_u8, 0x3e_u8, 0x29_u8, 0x87_u8, 0xcb_u8, 0x4c_u8])
  struct ITransformProvider
    lpVtbl : ITransformProviderVTbl*
  end

  struct IValueProviderVTbl
    query_interface : Proc(IValueProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IValueProvider*, UInt32)
    release : Proc(IValueProvider*, UInt32)
    set_value : Proc(IValueProvider*, LibC::LPWSTR, HRESULT)
    get_value : Proc(IValueProvider*, UInt8**, HRESULT)
    get_is_read_only : Proc(IValueProvider*, LibC::BOOL*, HRESULT)
  end

  IValueProvider_GUID = "c7935180-6fb3-4201-b174-7df73adbf64a"
  IID_IValueProvider = LibC::GUID.new(0xc7935180_u32, 0x6fb3_u16, 0x4201_u16, StaticArray[0xb1_u8, 0x74_u8, 0x7d_u8, 0xf7_u8, 0x3a_u8, 0xdb_u8, 0xf6_u8, 0x4a_u8])
  struct IValueProvider
    lpVtbl : IValueProviderVTbl*
  end

  struct IWindowProviderVTbl
    query_interface : Proc(IWindowProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IWindowProvider*, UInt32)
    release : Proc(IWindowProvider*, UInt32)
    set_visual_state : Proc(IWindowProvider*, WindowVisualState, HRESULT)
    close : Proc(IWindowProvider*, HRESULT)
    wait_for_input_idle : Proc(IWindowProvider*, Int32, LibC::BOOL*, HRESULT)
    get_can_maximize : Proc(IWindowProvider*, LibC::BOOL*, HRESULT)
    get_can_minimize : Proc(IWindowProvider*, LibC::BOOL*, HRESULT)
    get_is_modal : Proc(IWindowProvider*, LibC::BOOL*, HRESULT)
    get_window_visual_state : Proc(IWindowProvider*, WindowVisualState*, HRESULT)
    get_window_interaction_state : Proc(IWindowProvider*, WindowInteractionState*, HRESULT)
    get_is_topmost : Proc(IWindowProvider*, LibC::BOOL*, HRESULT)
  end

  IWindowProvider_GUID = "987df77b-db06-4d77-8f8a-86a9c3bb90b9"
  IID_IWindowProvider = LibC::GUID.new(0x987df77b_u32, 0xdb06_u16, 0x4d77_u16, StaticArray[0x8f_u8, 0x8a_u8, 0x86_u8, 0xa9_u8, 0xc3_u8, 0xbb_u8, 0x90_u8, 0xb9_u8])
  struct IWindowProvider
    lpVtbl : IWindowProviderVTbl*
  end

  struct ILegacyIAccessibleProviderVTbl
    query_interface : Proc(ILegacyIAccessibleProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ILegacyIAccessibleProvider*, UInt32)
    release : Proc(ILegacyIAccessibleProvider*, UInt32)
    select : Proc(ILegacyIAccessibleProvider*, Int32, HRESULT)
    do_default_action : Proc(ILegacyIAccessibleProvider*, HRESULT)
    set_value : Proc(ILegacyIAccessibleProvider*, LibC::LPWSTR, HRESULT)
    get_i_accessible : Proc(ILegacyIAccessibleProvider*, IAccessible*, HRESULT)
    get_child_id : Proc(ILegacyIAccessibleProvider*, Int32*, HRESULT)
    get_name : Proc(ILegacyIAccessibleProvider*, UInt8**, HRESULT)
    get_value : Proc(ILegacyIAccessibleProvider*, UInt8**, HRESULT)
    get_description : Proc(ILegacyIAccessibleProvider*, UInt8**, HRESULT)
    get_role : Proc(ILegacyIAccessibleProvider*, UInt32*, HRESULT)
    get_state : Proc(ILegacyIAccessibleProvider*, UInt32*, HRESULT)
    get_help : Proc(ILegacyIAccessibleProvider*, UInt8**, HRESULT)
    get_keyboard_shortcut : Proc(ILegacyIAccessibleProvider*, UInt8**, HRESULT)
    get_selection : Proc(ILegacyIAccessibleProvider*, SAFEARRAY**, HRESULT)
    get_default_action : Proc(ILegacyIAccessibleProvider*, UInt8**, HRESULT)
  end

  ILegacyIAccessibleProvider_GUID = "e44c3566-915d-4070-99c6-047bff5a08f5"
  IID_ILegacyIAccessibleProvider = LibC::GUID.new(0xe44c3566_u32, 0x915d_u16, 0x4070_u16, StaticArray[0x99_u8, 0xc6_u8, 0x4_u8, 0x7b_u8, 0xff_u8, 0x5a_u8, 0x8_u8, 0xf5_u8])
  struct ILegacyIAccessibleProvider
    lpVtbl : ILegacyIAccessibleProviderVTbl*
  end

  struct IItemContainerProviderVTbl
    query_interface : Proc(IItemContainerProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IItemContainerProvider*, UInt32)
    release : Proc(IItemContainerProvider*, UInt32)
    find_item_by_property : Proc(IItemContainerProvider*, IRawElementProviderSimple, Int32, VARIANT, IRawElementProviderSimple*, HRESULT)
  end

  IItemContainerProvider_GUID = "e747770b-39ce-4382-ab30-d8fb3f336f24"
  IID_IItemContainerProvider = LibC::GUID.new(0xe747770b_u32, 0x39ce_u16, 0x4382_u16, StaticArray[0xab_u8, 0x30_u8, 0xd8_u8, 0xfb_u8, 0x3f_u8, 0x33_u8, 0x6f_u8, 0x24_u8])
  struct IItemContainerProvider
    lpVtbl : IItemContainerProviderVTbl*
  end

  struct IVirtualizedItemProviderVTbl
    query_interface : Proc(IVirtualizedItemProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVirtualizedItemProvider*, UInt32)
    release : Proc(IVirtualizedItemProvider*, UInt32)
    realize : Proc(IVirtualizedItemProvider*, HRESULT)
  end

  IVirtualizedItemProvider_GUID = "cb98b665-2d35-4fac-ad35-f3c60d0c0b8b"
  IID_IVirtualizedItemProvider = LibC::GUID.new(0xcb98b665_u32, 0x2d35_u16, 0x4fac_u16, StaticArray[0xad_u8, 0x35_u8, 0xf3_u8, 0xc6_u8, 0xd_u8, 0xc_u8, 0xb_u8, 0x8b_u8])
  struct IVirtualizedItemProvider
    lpVtbl : IVirtualizedItemProviderVTbl*
  end

  struct IObjectModelProviderVTbl
    query_interface : Proc(IObjectModelProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectModelProvider*, UInt32)
    release : Proc(IObjectModelProvider*, UInt32)
    get_underlying_object_model : Proc(IObjectModelProvider*, IUnknown*, HRESULT)
  end

  IObjectModelProvider_GUID = "3ad86ebd-f5ef-483d-bb18-b1042a475d64"
  IID_IObjectModelProvider = LibC::GUID.new(0x3ad86ebd_u32, 0xf5ef_u16, 0x483d_u16, StaticArray[0xbb_u8, 0x18_u8, 0xb1_u8, 0x4_u8, 0x2a_u8, 0x47_u8, 0x5d_u8, 0x64_u8])
  struct IObjectModelProvider
    lpVtbl : IObjectModelProviderVTbl*
  end

  struct IAnnotationProviderVTbl
    query_interface : Proc(IAnnotationProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAnnotationProvider*, UInt32)
    release : Proc(IAnnotationProvider*, UInt32)
    get_annotation_type_id : Proc(IAnnotationProvider*, Int32*, HRESULT)
    get_annotation_type_name : Proc(IAnnotationProvider*, UInt8**, HRESULT)
    get_author : Proc(IAnnotationProvider*, UInt8**, HRESULT)
    get_date_time : Proc(IAnnotationProvider*, UInt8**, HRESULT)
    get_target : Proc(IAnnotationProvider*, IRawElementProviderSimple*, HRESULT)
  end

  IAnnotationProvider_GUID = "f95c7e80-bd63-4601-9782-445ebff011fc"
  IID_IAnnotationProvider = LibC::GUID.new(0xf95c7e80_u32, 0xbd63_u16, 0x4601_u16, StaticArray[0x97_u8, 0x82_u8, 0x44_u8, 0x5e_u8, 0xbf_u8, 0xf0_u8, 0x11_u8, 0xfc_u8])
  struct IAnnotationProvider
    lpVtbl : IAnnotationProviderVTbl*
  end

  struct IStylesProviderVTbl
    query_interface : Proc(IStylesProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IStylesProvider*, UInt32)
    release : Proc(IStylesProvider*, UInt32)
    get_style_id : Proc(IStylesProvider*, Int32*, HRESULT)
    get_style_name : Proc(IStylesProvider*, UInt8**, HRESULT)
    get_fill_color : Proc(IStylesProvider*, Int32*, HRESULT)
    get_fill_pattern_style : Proc(IStylesProvider*, UInt8**, HRESULT)
    get_shape : Proc(IStylesProvider*, UInt8**, HRESULT)
    get_fill_pattern_color : Proc(IStylesProvider*, Int32*, HRESULT)
    get_extended_properties : Proc(IStylesProvider*, UInt8**, HRESULT)
  end

  IStylesProvider_GUID = "19b6b649-f5d7-4a6d-bdcb-129252be588a"
  IID_IStylesProvider = LibC::GUID.new(0x19b6b649_u32, 0xf5d7_u16, 0x4a6d_u16, StaticArray[0xbd_u8, 0xcb_u8, 0x12_u8, 0x92_u8, 0x52_u8, 0xbe_u8, 0x58_u8, 0x8a_u8])
  struct IStylesProvider
    lpVtbl : IStylesProviderVTbl*
  end

  struct ISpreadsheetProviderVTbl
    query_interface : Proc(ISpreadsheetProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpreadsheetProvider*, UInt32)
    release : Proc(ISpreadsheetProvider*, UInt32)
    get_item_by_name : Proc(ISpreadsheetProvider*, LibC::LPWSTR, IRawElementProviderSimple*, HRESULT)
  end

  ISpreadsheetProvider_GUID = "6f6b5d35-5525-4f80-b758-85473832ffc7"
  IID_ISpreadsheetProvider = LibC::GUID.new(0x6f6b5d35_u32, 0x5525_u16, 0x4f80_u16, StaticArray[0xb7_u8, 0x58_u8, 0x85_u8, 0x47_u8, 0x38_u8, 0x32_u8, 0xff_u8, 0xc7_u8])
  struct ISpreadsheetProvider
    lpVtbl : ISpreadsheetProviderVTbl*
  end

  struct ISpreadsheetItemProviderVTbl
    query_interface : Proc(ISpreadsheetItemProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpreadsheetItemProvider*, UInt32)
    release : Proc(ISpreadsheetItemProvider*, UInt32)
    get_formula : Proc(ISpreadsheetItemProvider*, UInt8**, HRESULT)
    get_annotation_objects : Proc(ISpreadsheetItemProvider*, SAFEARRAY**, HRESULT)
    get_annotation_types : Proc(ISpreadsheetItemProvider*, SAFEARRAY**, HRESULT)
  end

  ISpreadsheetItemProvider_GUID = "eaed4660-7b3d-4879-a2e6-365ce603f3d0"
  IID_ISpreadsheetItemProvider = LibC::GUID.new(0xeaed4660_u32, 0x7b3d_u16, 0x4879_u16, StaticArray[0xa2_u8, 0xe6_u8, 0x36_u8, 0x5c_u8, 0xe6_u8, 0x3_u8, 0xf3_u8, 0xd0_u8])
  struct ISpreadsheetItemProvider
    lpVtbl : ISpreadsheetItemProviderVTbl*
  end

  struct ITransformProvider2VTbl
    query_interface : Proc(ITransformProvider2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITransformProvider2*, UInt32)
    release : Proc(ITransformProvider2*, UInt32)
    move : Proc(ITransformProvider2*, Float64, Float64, HRESULT)
    resize : Proc(ITransformProvider2*, Float64, Float64, HRESULT)
    rotate : Proc(ITransformProvider2*, Float64, HRESULT)
    get_can_move : Proc(ITransformProvider2*, LibC::BOOL*, HRESULT)
    get_can_resize : Proc(ITransformProvider2*, LibC::BOOL*, HRESULT)
    get_can_rotate : Proc(ITransformProvider2*, LibC::BOOL*, HRESULT)
    zoom : Proc(ITransformProvider2*, Float64, HRESULT)
    get_can_zoom : Proc(ITransformProvider2*, LibC::BOOL*, HRESULT)
    get_zoom_level : Proc(ITransformProvider2*, Float64*, HRESULT)
    get_zoom_minimum : Proc(ITransformProvider2*, Float64*, HRESULT)
    get_zoom_maximum : Proc(ITransformProvider2*, Float64*, HRESULT)
    zoom_by_unit : Proc(ITransformProvider2*, ZoomUnit, HRESULT)
  end

  ITransformProvider2_GUID = "4758742f-7ac2-460c-bc48-09fc09308a93"
  IID_ITransformProvider2 = LibC::GUID.new(0x4758742f_u32, 0x7ac2_u16, 0x460c_u16, StaticArray[0xbc_u8, 0x48_u8, 0x9_u8, 0xfc_u8, 0x9_u8, 0x30_u8, 0x8a_u8, 0x93_u8])
  struct ITransformProvider2
    lpVtbl : ITransformProvider2VTbl*
  end

  struct IDragProviderVTbl
    query_interface : Proc(IDragProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDragProvider*, UInt32)
    release : Proc(IDragProvider*, UInt32)
    get_is_grabbed : Proc(IDragProvider*, LibC::BOOL*, HRESULT)
    get_drop_effect : Proc(IDragProvider*, UInt8**, HRESULT)
    get_drop_effects : Proc(IDragProvider*, SAFEARRAY**, HRESULT)
    get_grabbed_items : Proc(IDragProvider*, SAFEARRAY**, HRESULT)
  end

  IDragProvider_GUID = "6aa7bbbb-7ff9-497d-904f-d20b897929d8"
  IID_IDragProvider = LibC::GUID.new(0x6aa7bbbb_u32, 0x7ff9_u16, 0x497d_u16, StaticArray[0x90_u8, 0x4f_u8, 0xd2_u8, 0xb_u8, 0x89_u8, 0x79_u8, 0x29_u8, 0xd8_u8])
  struct IDragProvider
    lpVtbl : IDragProviderVTbl*
  end

  struct IDropTargetProviderVTbl
    query_interface : Proc(IDropTargetProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IDropTargetProvider*, UInt32)
    release : Proc(IDropTargetProvider*, UInt32)
    get_drop_target_effect : Proc(IDropTargetProvider*, UInt8**, HRESULT)
    get_drop_target_effects : Proc(IDropTargetProvider*, SAFEARRAY**, HRESULT)
  end

  IDropTargetProvider_GUID = "bae82bfd-358a-481c-85a0-d8b4d90a5d61"
  IID_IDropTargetProvider = LibC::GUID.new(0xbae82bfd_u32, 0x358a_u16, 0x481c_u16, StaticArray[0x85_u8, 0xa0_u8, 0xd8_u8, 0xb4_u8, 0xd9_u8, 0xa_u8, 0x5d_u8, 0x61_u8])
  struct IDropTargetProvider
    lpVtbl : IDropTargetProviderVTbl*
  end

  struct ITextRangeProviderVTbl
    query_interface : Proc(ITextRangeProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextRangeProvider*, UInt32)
    release : Proc(ITextRangeProvider*, UInt32)
    clone : Proc(ITextRangeProvider*, ITextRangeProvider*, HRESULT)
    compare : Proc(ITextRangeProvider*, ITextRangeProvider, LibC::BOOL*, HRESULT)
    compare_endpoints : Proc(ITextRangeProvider*, TextPatternRangeEndpoint, ITextRangeProvider, TextPatternRangeEndpoint, Int32*, HRESULT)
    expand_to_enclosing_unit : Proc(ITextRangeProvider*, TextUnit, HRESULT)
    find_attribute : Proc(ITextRangeProvider*, Int32, VARIANT, LibC::BOOL, ITextRangeProvider*, HRESULT)
    find_text : Proc(ITextRangeProvider*, UInt8*, LibC::BOOL, LibC::BOOL, ITextRangeProvider*, HRESULT)
    get_attribute_value : Proc(ITextRangeProvider*, Int32, VARIANT*, HRESULT)
    get_bounding_rectangles : Proc(ITextRangeProvider*, SAFEARRAY**, HRESULT)
    get_enclosing_element : Proc(ITextRangeProvider*, IRawElementProviderSimple*, HRESULT)
    get_text : Proc(ITextRangeProvider*, Int32, UInt8**, HRESULT)
    move : Proc(ITextRangeProvider*, TextUnit, Int32, Int32*, HRESULT)
    move_endpoint_by_unit : Proc(ITextRangeProvider*, TextPatternRangeEndpoint, TextUnit, Int32, Int32*, HRESULT)
    move_endpoint_by_range : Proc(ITextRangeProvider*, TextPatternRangeEndpoint, ITextRangeProvider, TextPatternRangeEndpoint, HRESULT)
    select : Proc(ITextRangeProvider*, HRESULT)
    add_to_selection : Proc(ITextRangeProvider*, HRESULT)
    remove_from_selection : Proc(ITextRangeProvider*, HRESULT)
    scroll_into_view : Proc(ITextRangeProvider*, LibC::BOOL, HRESULT)
    get_children : Proc(ITextRangeProvider*, SAFEARRAY**, HRESULT)
  end

  ITextRangeProvider_GUID = "5347ad7b-c355-46f8-aff5-909033582f63"
  IID_ITextRangeProvider = LibC::GUID.new(0x5347ad7b_u32, 0xc355_u16, 0x46f8_u16, StaticArray[0xaf_u8, 0xf5_u8, 0x90_u8, 0x90_u8, 0x33_u8, 0x58_u8, 0x2f_u8, 0x63_u8])
  struct ITextRangeProvider
    lpVtbl : ITextRangeProviderVTbl*
  end

  struct ITextProviderVTbl
    query_interface : Proc(ITextProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextProvider*, UInt32)
    release : Proc(ITextProvider*, UInt32)
    get_selection : Proc(ITextProvider*, SAFEARRAY**, HRESULT)
    get_visible_ranges : Proc(ITextProvider*, SAFEARRAY**, HRESULT)
    range_from_child : Proc(ITextProvider*, IRawElementProviderSimple, ITextRangeProvider*, HRESULT)
    range_from_point : Proc(ITextProvider*, UiaPoint, ITextRangeProvider*, HRESULT)
    get_document_range : Proc(ITextProvider*, ITextRangeProvider*, HRESULT)
    get_supported_text_selection : Proc(ITextProvider*, SupportedTextSelection*, HRESULT)
  end

  ITextProvider_GUID = "3589c92c-63f3-4367-99bb-ada653b77cf2"
  IID_ITextProvider = LibC::GUID.new(0x3589c92c_u32, 0x63f3_u16, 0x4367_u16, StaticArray[0x99_u8, 0xbb_u8, 0xad_u8, 0xa6_u8, 0x53_u8, 0xb7_u8, 0x7c_u8, 0xf2_u8])
  struct ITextProvider
    lpVtbl : ITextProviderVTbl*
  end

  struct ITextProvider2VTbl
    query_interface : Proc(ITextProvider2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextProvider2*, UInt32)
    release : Proc(ITextProvider2*, UInt32)
    get_selection : Proc(ITextProvider2*, SAFEARRAY**, HRESULT)
    get_visible_ranges : Proc(ITextProvider2*, SAFEARRAY**, HRESULT)
    range_from_child : Proc(ITextProvider2*, IRawElementProviderSimple, ITextRangeProvider*, HRESULT)
    range_from_point : Proc(ITextProvider2*, UiaPoint, ITextRangeProvider*, HRESULT)
    get_document_range : Proc(ITextProvider2*, ITextRangeProvider*, HRESULT)
    get_supported_text_selection : Proc(ITextProvider2*, SupportedTextSelection*, HRESULT)
    range_from_annotation : Proc(ITextProvider2*, IRawElementProviderSimple, ITextRangeProvider*, HRESULT)
    get_caret_range : Proc(ITextProvider2*, LibC::BOOL*, ITextRangeProvider*, HRESULT)
  end

  ITextProvider2_GUID = "0dc5e6ed-3e16-4bf1-8f9a-a979878bc195"
  IID_ITextProvider2 = LibC::GUID.new(0xdc5e6ed_u32, 0x3e16_u16, 0x4bf1_u16, StaticArray[0x8f_u8, 0x9a_u8, 0xa9_u8, 0x79_u8, 0x87_u8, 0x8b_u8, 0xc1_u8, 0x95_u8])
  struct ITextProvider2
    lpVtbl : ITextProvider2VTbl*
  end

  struct ITextEditProviderVTbl
    query_interface : Proc(ITextEditProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextEditProvider*, UInt32)
    release : Proc(ITextEditProvider*, UInt32)
    get_selection : Proc(ITextEditProvider*, SAFEARRAY**, HRESULT)
    get_visible_ranges : Proc(ITextEditProvider*, SAFEARRAY**, HRESULT)
    range_from_child : Proc(ITextEditProvider*, IRawElementProviderSimple, ITextRangeProvider*, HRESULT)
    range_from_point : Proc(ITextEditProvider*, UiaPoint, ITextRangeProvider*, HRESULT)
    get_document_range : Proc(ITextEditProvider*, ITextRangeProvider*, HRESULT)
    get_supported_text_selection : Proc(ITextEditProvider*, SupportedTextSelection*, HRESULT)
    get_active_composition : Proc(ITextEditProvider*, ITextRangeProvider*, HRESULT)
    get_conversion_target : Proc(ITextEditProvider*, ITextRangeProvider*, HRESULT)
  end

  ITextEditProvider_GUID = "ea3605b4-3a05-400e-b5f9-4e91b40f6176"
  IID_ITextEditProvider = LibC::GUID.new(0xea3605b4_u32, 0x3a05_u16, 0x400e_u16, StaticArray[0xb5_u8, 0xf9_u8, 0x4e_u8, 0x91_u8, 0xb4_u8, 0xf_u8, 0x61_u8, 0x76_u8])
  struct ITextEditProvider
    lpVtbl : ITextEditProviderVTbl*
  end

  struct ITextRangeProvider2VTbl
    query_interface : Proc(ITextRangeProvider2*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextRangeProvider2*, UInt32)
    release : Proc(ITextRangeProvider2*, UInt32)
    clone : Proc(ITextRangeProvider2*, ITextRangeProvider*, HRESULT)
    compare : Proc(ITextRangeProvider2*, ITextRangeProvider, LibC::BOOL*, HRESULT)
    compare_endpoints : Proc(ITextRangeProvider2*, TextPatternRangeEndpoint, ITextRangeProvider, TextPatternRangeEndpoint, Int32*, HRESULT)
    expand_to_enclosing_unit : Proc(ITextRangeProvider2*, TextUnit, HRESULT)
    find_attribute : Proc(ITextRangeProvider2*, Int32, VARIANT, LibC::BOOL, ITextRangeProvider*, HRESULT)
    find_text : Proc(ITextRangeProvider2*, UInt8*, LibC::BOOL, LibC::BOOL, ITextRangeProvider*, HRESULT)
    get_attribute_value : Proc(ITextRangeProvider2*, Int32, VARIANT*, HRESULT)
    get_bounding_rectangles : Proc(ITextRangeProvider2*, SAFEARRAY**, HRESULT)
    get_enclosing_element : Proc(ITextRangeProvider2*, IRawElementProviderSimple*, HRESULT)
    get_text : Proc(ITextRangeProvider2*, Int32, UInt8**, HRESULT)
    move : Proc(ITextRangeProvider2*, TextUnit, Int32, Int32*, HRESULT)
    move_endpoint_by_unit : Proc(ITextRangeProvider2*, TextPatternRangeEndpoint, TextUnit, Int32, Int32*, HRESULT)
    move_endpoint_by_range : Proc(ITextRangeProvider2*, TextPatternRangeEndpoint, ITextRangeProvider, TextPatternRangeEndpoint, HRESULT)
    select : Proc(ITextRangeProvider2*, HRESULT)
    add_to_selection : Proc(ITextRangeProvider2*, HRESULT)
    remove_from_selection : Proc(ITextRangeProvider2*, HRESULT)
    scroll_into_view : Proc(ITextRangeProvider2*, LibC::BOOL, HRESULT)
    get_children : Proc(ITextRangeProvider2*, SAFEARRAY**, HRESULT)
    show_context_menu : Proc(ITextRangeProvider2*, HRESULT)
  end

  ITextRangeProvider2_GUID = "9bbce42c-1921-4f18-89ca-dba1910a0386"
  IID_ITextRangeProvider2 = LibC::GUID.new(0x9bbce42c_u32, 0x1921_u16, 0x4f18_u16, StaticArray[0x89_u8, 0xca_u8, 0xdb_u8, 0xa1_u8, 0x91_u8, 0xa_u8, 0x3_u8, 0x86_u8])
  struct ITextRangeProvider2
    lpVtbl : ITextRangeProvider2VTbl*
  end

  struct ITextChildProviderVTbl
    query_interface : Proc(ITextChildProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ITextChildProvider*, UInt32)
    release : Proc(ITextChildProvider*, UInt32)
    get_text_container : Proc(ITextChildProvider*, IRawElementProviderSimple*, HRESULT)
    get_text_range : Proc(ITextChildProvider*, ITextRangeProvider*, HRESULT)
  end

  ITextChildProvider_GUID = "4c2de2b9-c88f-4f88-a111-f1d336b7d1a9"
  IID_ITextChildProvider = LibC::GUID.new(0x4c2de2b9_u32, 0xc88f_u16, 0x4f88_u16, StaticArray[0xa1_u8, 0x11_u8, 0xf1_u8, 0xd3_u8, 0x36_u8, 0xb7_u8, 0xd1_u8, 0xa9_u8])
  struct ITextChildProvider
    lpVtbl : ITextChildProviderVTbl*
  end

  struct ICustomNavigationProviderVTbl
    query_interface : Proc(ICustomNavigationProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICustomNavigationProvider*, UInt32)
    release : Proc(ICustomNavigationProvider*, UInt32)
    navigate : Proc(ICustomNavigationProvider*, NavigateDirection, IRawElementProviderSimple*, HRESULT)
  end

  ICustomNavigationProvider_GUID = "2062a28a-8c07-4b94-8e12-7037c622aeb8"
  IID_ICustomNavigationProvider = LibC::GUID.new(0x2062a28a_u32, 0x8c07_u16, 0x4b94_u16, StaticArray[0x8e_u8, 0x12_u8, 0x70_u8, 0x37_u8, 0xc6_u8, 0x22_u8, 0xae_u8, 0xb8_u8])
  struct ICustomNavigationProvider
    lpVtbl : ICustomNavigationProviderVTbl*
  end

  struct IUIAutomationPatternInstanceVTbl
    query_interface : Proc(IUIAutomationPatternInstance*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationPatternInstance*, UInt32)
    release : Proc(IUIAutomationPatternInstance*, UInt32)
    get_property : Proc(IUIAutomationPatternInstance*, UInt32, LibC::BOOL, UIAutomationType, Void*, HRESULT)
    call_method : Proc(IUIAutomationPatternInstance*, UInt32, UIAutomationParameter*, UInt32, HRESULT)
  end

  IUIAutomationPatternInstance_GUID = "c03a7fe4-9431-409f-bed8-ae7c2299bc8d"
  IID_IUIAutomationPatternInstance = LibC::GUID.new(0xc03a7fe4_u32, 0x9431_u16, 0x409f_u16, StaticArray[0xbe_u8, 0xd8_u8, 0xae_u8, 0x7c_u8, 0x22_u8, 0x99_u8, 0xbc_u8, 0x8d_u8])
  struct IUIAutomationPatternInstance
    lpVtbl : IUIAutomationPatternInstanceVTbl*
  end

  struct IUIAutomationPatternHandlerVTbl
    query_interface : Proc(IUIAutomationPatternHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationPatternHandler*, UInt32)
    release : Proc(IUIAutomationPatternHandler*, UInt32)
    create_client_wrapper : Proc(IUIAutomationPatternHandler*, IUIAutomationPatternInstance, IUnknown*, HRESULT)
    dispatch : Proc(IUIAutomationPatternHandler*, IUnknown, UInt32, UIAutomationParameter*, UInt32, HRESULT)
  end

  IUIAutomationPatternHandler_GUID = "d97022f3-a947-465e-8b2a-ac4315fa54e8"
  IID_IUIAutomationPatternHandler = LibC::GUID.new(0xd97022f3_u32, 0xa947_u16, 0x465e_u16, StaticArray[0x8b_u8, 0x2a_u8, 0xac_u8, 0x43_u8, 0x15_u8, 0xfa_u8, 0x54_u8, 0xe8_u8])
  struct IUIAutomationPatternHandler
    lpVtbl : IUIAutomationPatternHandlerVTbl*
  end

  struct IUIAutomationRegistrarVTbl
    query_interface : Proc(IUIAutomationRegistrar*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationRegistrar*, UInt32)
    release : Proc(IUIAutomationRegistrar*, UInt32)
    register_property : Proc(IUIAutomationRegistrar*, UIAutomationPropertyInfo*, Int32*, HRESULT)
    register_event : Proc(IUIAutomationRegistrar*, UIAutomationEventInfo*, Int32*, HRESULT)
    register_pattern : Proc(IUIAutomationRegistrar*, UIAutomationPatternInfo*, Int32*, Int32*, UInt32, Int32*, UInt32, Int32*, HRESULT)
  end

  IUIAutomationRegistrar_GUID = "8609c4ec-4a1a-4d88-a357-5a66e060e1cf"
  IID_IUIAutomationRegistrar = LibC::GUID.new(0x8609c4ec_u32, 0x4a1a_u16, 0x4d88_u16, StaticArray[0xa3_u8, 0x57_u8, 0x5a_u8, 0x66_u8, 0xe0_u8, 0x60_u8, 0xe1_u8, 0xcf_u8])
  struct IUIAutomationRegistrar
    lpVtbl : IUIAutomationRegistrarVTbl*
  end

  struct IUIAutomationElementVTbl
    query_interface : Proc(IUIAutomationElement*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationElement*, UInt32)
    release : Proc(IUIAutomationElement*, UInt32)
    set_focus : Proc(IUIAutomationElement*, HRESULT)
    get_runtime_id : Proc(IUIAutomationElement*, SAFEARRAY**, HRESULT)
    find_first : Proc(IUIAutomationElement*, TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)
    find_all : Proc(IUIAutomationElement*, TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)
    find_first_build_cache : Proc(IUIAutomationElement*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    find_all_build_cache : Proc(IUIAutomationElement*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)
    build_updated_cache : Proc(IUIAutomationElement*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_current_property_value : Proc(IUIAutomationElement*, Int32, VARIANT*, HRESULT)
    get_current_property_value_ex : Proc(IUIAutomationElement*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_cached_property_value : Proc(IUIAutomationElement*, Int32, VARIANT*, HRESULT)
    get_cached_property_value_ex : Proc(IUIAutomationElement*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_current_pattern_as : Proc(IUIAutomationElement*, Int32, Guid*, Void**, HRESULT)
    get_cached_pattern_as : Proc(IUIAutomationElement*, Int32, Guid*, Void**, HRESULT)
    get_current_pattern : Proc(IUIAutomationElement*, Int32, IUnknown*, HRESULT)
    get_cached_pattern : Proc(IUIAutomationElement*, Int32, IUnknown*, HRESULT)
    get_cached_parent : Proc(IUIAutomationElement*, IUIAutomationElement*, HRESULT)
    get_cached_children : Proc(IUIAutomationElement*, IUIAutomationElementArray*, HRESULT)
    get_current_process_id : Proc(IUIAutomationElement*, Int32*, HRESULT)
    get_current_control_type : Proc(IUIAutomationElement*, Int32*, HRESULT)
    get_current_localized_control_type : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_current_name : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_current_accelerator_key : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_current_access_key : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_current_has_keyboard_focus : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_current_is_keyboard_focusable : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_current_is_enabled : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_current_automation_id : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_current_class_name : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_current_help_text : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_current_culture : Proc(IUIAutomationElement*, Int32*, HRESULT)
    get_current_is_control_element : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_current_is_content_element : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_current_is_password : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_current_native_window_handle : Proc(IUIAutomationElement*, LibC::HANDLE, HRESULT)
    get_current_item_type : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_current_is_offscreen : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_current_orientation : Proc(IUIAutomationElement*, OrientationType*, HRESULT)
    get_current_framework_id : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_current_is_required_for_form : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_current_item_status : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_current_bounding_rectangle : Proc(IUIAutomationElement*, RECT*, HRESULT)
    get_current_labeled_by : Proc(IUIAutomationElement*, IUIAutomationElement*, HRESULT)
    get_current_aria_role : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_current_aria_properties : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_current_is_data_valid_for_form : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_current_controller_for : Proc(IUIAutomationElement*, IUIAutomationElementArray*, HRESULT)
    get_current_described_by : Proc(IUIAutomationElement*, IUIAutomationElementArray*, HRESULT)
    get_current_flows_to : Proc(IUIAutomationElement*, IUIAutomationElementArray*, HRESULT)
    get_current_provider_description : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_cached_process_id : Proc(IUIAutomationElement*, Int32*, HRESULT)
    get_cached_control_type : Proc(IUIAutomationElement*, Int32*, HRESULT)
    get_cached_localized_control_type : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_cached_name : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_cached_accelerator_key : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_cached_access_key : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_cached_has_keyboard_focus : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_cached_is_keyboard_focusable : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_cached_is_enabled : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_cached_automation_id : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_cached_class_name : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_cached_help_text : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_cached_culture : Proc(IUIAutomationElement*, Int32*, HRESULT)
    get_cached_is_control_element : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_cached_is_content_element : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_cached_is_password : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_cached_native_window_handle : Proc(IUIAutomationElement*, LibC::HANDLE, HRESULT)
    get_cached_item_type : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_cached_is_offscreen : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_cached_orientation : Proc(IUIAutomationElement*, OrientationType*, HRESULT)
    get_cached_framework_id : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_cached_is_required_for_form : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_cached_item_status : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_cached_bounding_rectangle : Proc(IUIAutomationElement*, RECT*, HRESULT)
    get_cached_labeled_by : Proc(IUIAutomationElement*, IUIAutomationElement*, HRESULT)
    get_cached_aria_role : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_cached_aria_properties : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_cached_is_data_valid_for_form : Proc(IUIAutomationElement*, LibC::BOOL*, HRESULT)
    get_cached_controller_for : Proc(IUIAutomationElement*, IUIAutomationElementArray*, HRESULT)
    get_cached_described_by : Proc(IUIAutomationElement*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_to : Proc(IUIAutomationElement*, IUIAutomationElementArray*, HRESULT)
    get_cached_provider_description : Proc(IUIAutomationElement*, UInt8**, HRESULT)
    get_clickable_point : Proc(IUIAutomationElement*, POINT*, LibC::BOOL*, HRESULT)
  end

  IUIAutomationElement_GUID = "d22108aa-8ac5-49a5-837b-37bbb3d7591e"
  IID_IUIAutomationElement = LibC::GUID.new(0xd22108aa_u32, 0x8ac5_u16, 0x49a5_u16, StaticArray[0x83_u8, 0x7b_u8, 0x37_u8, 0xbb_u8, 0xb3_u8, 0xd7_u8, 0x59_u8, 0x1e_u8])
  struct IUIAutomationElement
    lpVtbl : IUIAutomationElementVTbl*
  end

  struct IUIAutomationElementArrayVTbl
    query_interface : Proc(IUIAutomationElementArray*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationElementArray*, UInt32)
    release : Proc(IUIAutomationElementArray*, UInt32)
    get_length : Proc(IUIAutomationElementArray*, Int32*, HRESULT)
    get_element : Proc(IUIAutomationElementArray*, Int32, IUIAutomationElement*, HRESULT)
  end

  IUIAutomationElementArray_GUID = "14314595-b4bc-4055-95f2-58f2e42c9855"
  IID_IUIAutomationElementArray = LibC::GUID.new(0x14314595_u32, 0xb4bc_u16, 0x4055_u16, StaticArray[0x95_u8, 0xf2_u8, 0x58_u8, 0xf2_u8, 0xe4_u8, 0x2c_u8, 0x98_u8, 0x55_u8])
  struct IUIAutomationElementArray
    lpVtbl : IUIAutomationElementArrayVTbl*
  end

  struct IUIAutomationConditionVTbl
    query_interface : Proc(IUIAutomationCondition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationCondition*, UInt32)
    release : Proc(IUIAutomationCondition*, UInt32)
  end

  IUIAutomationCondition_GUID = "352ffba8-0973-437c-a61f-f64cafd81df9"
  IID_IUIAutomationCondition = LibC::GUID.new(0x352ffba8_u32, 0x973_u16, 0x437c_u16, StaticArray[0xa6_u8, 0x1f_u8, 0xf6_u8, 0x4c_u8, 0xaf_u8, 0xd8_u8, 0x1d_u8, 0xf9_u8])
  struct IUIAutomationCondition
    lpVtbl : IUIAutomationConditionVTbl*
  end

  struct IUIAutomationBoolConditionVTbl
    query_interface : Proc(IUIAutomationBoolCondition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationBoolCondition*, UInt32)
    release : Proc(IUIAutomationBoolCondition*, UInt32)
    get_boolean_value : Proc(IUIAutomationBoolCondition*, LibC::BOOL*, HRESULT)
  end

  IUIAutomationBoolCondition_GUID = "1b4e1f2e-75eb-4d0b-8952-5a69988e2307"
  IID_IUIAutomationBoolCondition = LibC::GUID.new(0x1b4e1f2e_u32, 0x75eb_u16, 0x4d0b_u16, StaticArray[0x89_u8, 0x52_u8, 0x5a_u8, 0x69_u8, 0x98_u8, 0x8e_u8, 0x23_u8, 0x7_u8])
  struct IUIAutomationBoolCondition
    lpVtbl : IUIAutomationBoolConditionVTbl*
  end

  struct IUIAutomationPropertyConditionVTbl
    query_interface : Proc(IUIAutomationPropertyCondition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationPropertyCondition*, UInt32)
    release : Proc(IUIAutomationPropertyCondition*, UInt32)
    get_property_id : Proc(IUIAutomationPropertyCondition*, Int32*, HRESULT)
    get_property_value : Proc(IUIAutomationPropertyCondition*, VARIANT*, HRESULT)
    get_property_condition_flags : Proc(IUIAutomationPropertyCondition*, PropertyConditionFlags*, HRESULT)
  end

  IUIAutomationPropertyCondition_GUID = "99ebf2cb-5578-4267-9ad4-afd6ea77e94b"
  IID_IUIAutomationPropertyCondition = LibC::GUID.new(0x99ebf2cb_u32, 0x5578_u16, 0x4267_u16, StaticArray[0x9a_u8, 0xd4_u8, 0xaf_u8, 0xd6_u8, 0xea_u8, 0x77_u8, 0xe9_u8, 0x4b_u8])
  struct IUIAutomationPropertyCondition
    lpVtbl : IUIAutomationPropertyConditionVTbl*
  end

  struct IUIAutomationAndConditionVTbl
    query_interface : Proc(IUIAutomationAndCondition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationAndCondition*, UInt32)
    release : Proc(IUIAutomationAndCondition*, UInt32)
    get_child_count : Proc(IUIAutomationAndCondition*, Int32*, HRESULT)
    get_children_as_native_array : Proc(IUIAutomationAndCondition*, IUIAutomationCondition**, Int32*, HRESULT)
    get_children : Proc(IUIAutomationAndCondition*, SAFEARRAY**, HRESULT)
  end

  IUIAutomationAndCondition_GUID = "a7d0af36-b912-45fe-9855-091ddc174aec"
  IID_IUIAutomationAndCondition = LibC::GUID.new(0xa7d0af36_u32, 0xb912_u16, 0x45fe_u16, StaticArray[0x98_u8, 0x55_u8, 0x9_u8, 0x1d_u8, 0xdc_u8, 0x17_u8, 0x4a_u8, 0xec_u8])
  struct IUIAutomationAndCondition
    lpVtbl : IUIAutomationAndConditionVTbl*
  end

  struct IUIAutomationOrConditionVTbl
    query_interface : Proc(IUIAutomationOrCondition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationOrCondition*, UInt32)
    release : Proc(IUIAutomationOrCondition*, UInt32)
    get_child_count : Proc(IUIAutomationOrCondition*, Int32*, HRESULT)
    get_children_as_native_array : Proc(IUIAutomationOrCondition*, IUIAutomationCondition**, Int32*, HRESULT)
    get_children : Proc(IUIAutomationOrCondition*, SAFEARRAY**, HRESULT)
  end

  IUIAutomationOrCondition_GUID = "8753f032-3db1-47b5-a1fc-6e34a266c712"
  IID_IUIAutomationOrCondition = LibC::GUID.new(0x8753f032_u32, 0x3db1_u16, 0x47b5_u16, StaticArray[0xa1_u8, 0xfc_u8, 0x6e_u8, 0x34_u8, 0xa2_u8, 0x66_u8, 0xc7_u8, 0x12_u8])
  struct IUIAutomationOrCondition
    lpVtbl : IUIAutomationOrConditionVTbl*
  end

  struct IUIAutomationNotConditionVTbl
    query_interface : Proc(IUIAutomationNotCondition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationNotCondition*, UInt32)
    release : Proc(IUIAutomationNotCondition*, UInt32)
    get_child : Proc(IUIAutomationNotCondition*, IUIAutomationCondition*, HRESULT)
  end

  IUIAutomationNotCondition_GUID = "f528b657-847b-498c-8896-d52b565407a1"
  IID_IUIAutomationNotCondition = LibC::GUID.new(0xf528b657_u32, 0x847b_u16, 0x498c_u16, StaticArray[0x88_u8, 0x96_u8, 0xd5_u8, 0x2b_u8, 0x56_u8, 0x54_u8, 0x7_u8, 0xa1_u8])
  struct IUIAutomationNotCondition
    lpVtbl : IUIAutomationNotConditionVTbl*
  end

  struct IUIAutomationCacheRequestVTbl
    query_interface : Proc(IUIAutomationCacheRequest*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationCacheRequest*, UInt32)
    release : Proc(IUIAutomationCacheRequest*, UInt32)
    add_property : Proc(IUIAutomationCacheRequest*, Int32, HRESULT)
    add_pattern : Proc(IUIAutomationCacheRequest*, Int32, HRESULT)
    clone : Proc(IUIAutomationCacheRequest*, IUIAutomationCacheRequest*, HRESULT)
    get_tree_scope : Proc(IUIAutomationCacheRequest*, TreeScope*, HRESULT)
    put_tree_scope : Proc(IUIAutomationCacheRequest*, TreeScope, HRESULT)
    get_tree_filter : Proc(IUIAutomationCacheRequest*, IUIAutomationCondition*, HRESULT)
    put_tree_filter : Proc(IUIAutomationCacheRequest*, IUIAutomationCondition, HRESULT)
    get_automation_element_mode : Proc(IUIAutomationCacheRequest*, AutomationElementMode*, HRESULT)
    put_automation_element_mode : Proc(IUIAutomationCacheRequest*, AutomationElementMode, HRESULT)
  end

  IUIAutomationCacheRequest_GUID = "b32a92b5-bc25-4078-9c08-d7ee95c48e03"
  IID_IUIAutomationCacheRequest = LibC::GUID.new(0xb32a92b5_u32, 0xbc25_u16, 0x4078_u16, StaticArray[0x9c_u8, 0x8_u8, 0xd7_u8, 0xee_u8, 0x95_u8, 0xc4_u8, 0x8e_u8, 0x3_u8])
  struct IUIAutomationCacheRequest
    lpVtbl : IUIAutomationCacheRequestVTbl*
  end

  struct IUIAutomationTreeWalkerVTbl
    query_interface : Proc(IUIAutomationTreeWalker*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTreeWalker*, UInt32)
    release : Proc(IUIAutomationTreeWalker*, UInt32)
    get_parent_element : Proc(IUIAutomationTreeWalker*, IUIAutomationElement, IUIAutomationElement*, HRESULT)
    get_first_child_element : Proc(IUIAutomationTreeWalker*, IUIAutomationElement, IUIAutomationElement*, HRESULT)
    get_last_child_element : Proc(IUIAutomationTreeWalker*, IUIAutomationElement, IUIAutomationElement*, HRESULT)
    get_next_sibling_element : Proc(IUIAutomationTreeWalker*, IUIAutomationElement, IUIAutomationElement*, HRESULT)
    get_previous_sibling_element : Proc(IUIAutomationTreeWalker*, IUIAutomationElement, IUIAutomationElement*, HRESULT)
    normalize_element : Proc(IUIAutomationTreeWalker*, IUIAutomationElement, IUIAutomationElement*, HRESULT)
    get_parent_element_build_cache : Proc(IUIAutomationTreeWalker*, IUIAutomationElement, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_first_child_element_build_cache : Proc(IUIAutomationTreeWalker*, IUIAutomationElement, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_last_child_element_build_cache : Proc(IUIAutomationTreeWalker*, IUIAutomationElement, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_next_sibling_element_build_cache : Proc(IUIAutomationTreeWalker*, IUIAutomationElement, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_previous_sibling_element_build_cache : Proc(IUIAutomationTreeWalker*, IUIAutomationElement, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    normalize_element_build_cache : Proc(IUIAutomationTreeWalker*, IUIAutomationElement, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_condition : Proc(IUIAutomationTreeWalker*, IUIAutomationCondition*, HRESULT)
  end

  IUIAutomationTreeWalker_GUID = "4042c624-389c-4afc-a630-9df854a541fc"
  IID_IUIAutomationTreeWalker = LibC::GUID.new(0x4042c624_u32, 0x389c_u16, 0x4afc_u16, StaticArray[0xa6_u8, 0x30_u8, 0x9d_u8, 0xf8_u8, 0x54_u8, 0xa5_u8, 0x41_u8, 0xfc_u8])
  struct IUIAutomationTreeWalker
    lpVtbl : IUIAutomationTreeWalkerVTbl*
  end

  struct IUIAutomationEventHandlerVTbl
    query_interface : Proc(IUIAutomationEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationEventHandler*, UInt32)
    release : Proc(IUIAutomationEventHandler*, UInt32)
    handle_automation_event : Proc(IUIAutomationEventHandler*, IUIAutomationElement, Int32, HRESULT)
  end

  IUIAutomationEventHandler_GUID = "146c3c17-f12e-4e22-8c27-f894b9b79c69"
  IID_IUIAutomationEventHandler = LibC::GUID.new(0x146c3c17_u32, 0xf12e_u16, 0x4e22_u16, StaticArray[0x8c_u8, 0x27_u8, 0xf8_u8, 0x94_u8, 0xb9_u8, 0xb7_u8, 0x9c_u8, 0x69_u8])
  struct IUIAutomationEventHandler
    lpVtbl : IUIAutomationEventHandlerVTbl*
  end

  struct IUIAutomationPropertyChangedEventHandlerVTbl
    query_interface : Proc(IUIAutomationPropertyChangedEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationPropertyChangedEventHandler*, UInt32)
    release : Proc(IUIAutomationPropertyChangedEventHandler*, UInt32)
    handle_property_changed_event : Proc(IUIAutomationPropertyChangedEventHandler*, IUIAutomationElement, Int32, VARIANT, HRESULT)
  end

  IUIAutomationPropertyChangedEventHandler_GUID = "40cd37d4-c756-4b0c-8c6f-bddfeeb13b50"
  IID_IUIAutomationPropertyChangedEventHandler = LibC::GUID.new(0x40cd37d4_u32, 0xc756_u16, 0x4b0c_u16, StaticArray[0x8c_u8, 0x6f_u8, 0xbd_u8, 0xdf_u8, 0xee_u8, 0xb1_u8, 0x3b_u8, 0x50_u8])
  struct IUIAutomationPropertyChangedEventHandler
    lpVtbl : IUIAutomationPropertyChangedEventHandlerVTbl*
  end

  struct IUIAutomationStructureChangedEventHandlerVTbl
    query_interface : Proc(IUIAutomationStructureChangedEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationStructureChangedEventHandler*, UInt32)
    release : Proc(IUIAutomationStructureChangedEventHandler*, UInt32)
    handle_structure_changed_event : Proc(IUIAutomationStructureChangedEventHandler*, IUIAutomationElement, StructureChangeType, SAFEARRAY*, HRESULT)
  end

  IUIAutomationStructureChangedEventHandler_GUID = "e81d1b4e-11c5-42f8-9754-e7036c79f054"
  IID_IUIAutomationStructureChangedEventHandler = LibC::GUID.new(0xe81d1b4e_u32, 0x11c5_u16, 0x42f8_u16, StaticArray[0x97_u8, 0x54_u8, 0xe7_u8, 0x3_u8, 0x6c_u8, 0x79_u8, 0xf0_u8, 0x54_u8])
  struct IUIAutomationStructureChangedEventHandler
    lpVtbl : IUIAutomationStructureChangedEventHandlerVTbl*
  end

  struct IUIAutomationFocusChangedEventHandlerVTbl
    query_interface : Proc(IUIAutomationFocusChangedEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationFocusChangedEventHandler*, UInt32)
    release : Proc(IUIAutomationFocusChangedEventHandler*, UInt32)
    handle_focus_changed_event : Proc(IUIAutomationFocusChangedEventHandler*, IUIAutomationElement, HRESULT)
  end

  IUIAutomationFocusChangedEventHandler_GUID = "c270f6b5-5c69-4290-9745-7a7f97169468"
  IID_IUIAutomationFocusChangedEventHandler = LibC::GUID.new(0xc270f6b5_u32, 0x5c69_u16, 0x4290_u16, StaticArray[0x97_u8, 0x45_u8, 0x7a_u8, 0x7f_u8, 0x97_u8, 0x16_u8, 0x94_u8, 0x68_u8])
  struct IUIAutomationFocusChangedEventHandler
    lpVtbl : IUIAutomationFocusChangedEventHandlerVTbl*
  end

  struct IUIAutomationTextEditTextChangedEventHandlerVTbl
    query_interface : Proc(IUIAutomationTextEditTextChangedEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTextEditTextChangedEventHandler*, UInt32)
    release : Proc(IUIAutomationTextEditTextChangedEventHandler*, UInt32)
    handle_text_edit_text_changed_event : Proc(IUIAutomationTextEditTextChangedEventHandler*, IUIAutomationElement, TextEditChangeType, SAFEARRAY*, HRESULT)
  end

  IUIAutomationTextEditTextChangedEventHandler_GUID = "92faa680-e704-4156-931a-e32d5bb38f3f"
  IID_IUIAutomationTextEditTextChangedEventHandler = LibC::GUID.new(0x92faa680_u32, 0xe704_u16, 0x4156_u16, StaticArray[0x93_u8, 0x1a_u8, 0xe3_u8, 0x2d_u8, 0x5b_u8, 0xb3_u8, 0x8f_u8, 0x3f_u8])
  struct IUIAutomationTextEditTextChangedEventHandler
    lpVtbl : IUIAutomationTextEditTextChangedEventHandlerVTbl*
  end

  struct IUIAutomationChangesEventHandlerVTbl
    query_interface : Proc(IUIAutomationChangesEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationChangesEventHandler*, UInt32)
    release : Proc(IUIAutomationChangesEventHandler*, UInt32)
    handle_changes_event : Proc(IUIAutomationChangesEventHandler*, IUIAutomationElement, UiaChangeInfo*, Int32, HRESULT)
  end

  IUIAutomationChangesEventHandler_GUID = "58edca55-2c3e-4980-b1b9-56c17f27a2a0"
  IID_IUIAutomationChangesEventHandler = LibC::GUID.new(0x58edca55_u32, 0x2c3e_u16, 0x4980_u16, StaticArray[0xb1_u8, 0xb9_u8, 0x56_u8, 0xc1_u8, 0x7f_u8, 0x27_u8, 0xa2_u8, 0xa0_u8])
  struct IUIAutomationChangesEventHandler
    lpVtbl : IUIAutomationChangesEventHandlerVTbl*
  end

  struct IUIAutomationNotificationEventHandlerVTbl
    query_interface : Proc(IUIAutomationNotificationEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationNotificationEventHandler*, UInt32)
    release : Proc(IUIAutomationNotificationEventHandler*, UInt32)
    handle_notification_event : Proc(IUIAutomationNotificationEventHandler*, IUIAutomationElement, NotificationKind, NotificationProcessing, UInt8*, UInt8*, HRESULT)
  end

  IUIAutomationNotificationEventHandler_GUID = "c7cb2637-e6c2-4d0c-85de-4948c02175c7"
  IID_IUIAutomationNotificationEventHandler = LibC::GUID.new(0xc7cb2637_u32, 0xe6c2_u16, 0x4d0c_u16, StaticArray[0x85_u8, 0xde_u8, 0x49_u8, 0x48_u8, 0xc0_u8, 0x21_u8, 0x75_u8, 0xc7_u8])
  struct IUIAutomationNotificationEventHandler
    lpVtbl : IUIAutomationNotificationEventHandlerVTbl*
  end

  struct IUIAutomationInvokePatternVTbl
    query_interface : Proc(IUIAutomationInvokePattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationInvokePattern*, UInt32)
    release : Proc(IUIAutomationInvokePattern*, UInt32)
    invoke : Proc(IUIAutomationInvokePattern*, HRESULT)
  end

  IUIAutomationInvokePattern_GUID = "fb377fbe-8ea6-46d5-9c73-6499642d3059"
  IID_IUIAutomationInvokePattern = LibC::GUID.new(0xfb377fbe_u32, 0x8ea6_u16, 0x46d5_u16, StaticArray[0x9c_u8, 0x73_u8, 0x64_u8, 0x99_u8, 0x64_u8, 0x2d_u8, 0x30_u8, 0x59_u8])
  struct IUIAutomationInvokePattern
    lpVtbl : IUIAutomationInvokePatternVTbl*
  end

  struct IUIAutomationDockPatternVTbl
    query_interface : Proc(IUIAutomationDockPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationDockPattern*, UInt32)
    release : Proc(IUIAutomationDockPattern*, UInt32)
    set_dock_position : Proc(IUIAutomationDockPattern*, DockPosition, HRESULT)
    get_current_dock_position : Proc(IUIAutomationDockPattern*, DockPosition*, HRESULT)
    get_cached_dock_position : Proc(IUIAutomationDockPattern*, DockPosition*, HRESULT)
  end

  IUIAutomationDockPattern_GUID = "fde5ef97-1464-48f6-90bf-43d0948e86ec"
  IID_IUIAutomationDockPattern = LibC::GUID.new(0xfde5ef97_u32, 0x1464_u16, 0x48f6_u16, StaticArray[0x90_u8, 0xbf_u8, 0x43_u8, 0xd0_u8, 0x94_u8, 0x8e_u8, 0x86_u8, 0xec_u8])
  struct IUIAutomationDockPattern
    lpVtbl : IUIAutomationDockPatternVTbl*
  end

  struct IUIAutomationExpandCollapsePatternVTbl
    query_interface : Proc(IUIAutomationExpandCollapsePattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationExpandCollapsePattern*, UInt32)
    release : Proc(IUIAutomationExpandCollapsePattern*, UInt32)
    expand : Proc(IUIAutomationExpandCollapsePattern*, HRESULT)
    collapse : Proc(IUIAutomationExpandCollapsePattern*, HRESULT)
    get_current_expand_collapse_state : Proc(IUIAutomationExpandCollapsePattern*, ExpandCollapseState*, HRESULT)
    get_cached_expand_collapse_state : Proc(IUIAutomationExpandCollapsePattern*, ExpandCollapseState*, HRESULT)
  end

  IUIAutomationExpandCollapsePattern_GUID = "619be086-1f4e-4ee4-bafa-210128738730"
  IID_IUIAutomationExpandCollapsePattern = LibC::GUID.new(0x619be086_u32, 0x1f4e_u16, 0x4ee4_u16, StaticArray[0xba_u8, 0xfa_u8, 0x21_u8, 0x1_u8, 0x28_u8, 0x73_u8, 0x87_u8, 0x30_u8])
  struct IUIAutomationExpandCollapsePattern
    lpVtbl : IUIAutomationExpandCollapsePatternVTbl*
  end

  struct IUIAutomationGridPatternVTbl
    query_interface : Proc(IUIAutomationGridPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationGridPattern*, UInt32)
    release : Proc(IUIAutomationGridPattern*, UInt32)
    get_item : Proc(IUIAutomationGridPattern*, Int32, Int32, IUIAutomationElement*, HRESULT)
    get_current_row_count : Proc(IUIAutomationGridPattern*, Int32*, HRESULT)
    get_current_column_count : Proc(IUIAutomationGridPattern*, Int32*, HRESULT)
    get_cached_row_count : Proc(IUIAutomationGridPattern*, Int32*, HRESULT)
    get_cached_column_count : Proc(IUIAutomationGridPattern*, Int32*, HRESULT)
  end

  IUIAutomationGridPattern_GUID = "414c3cdc-856b-4f5b-8538-3131c6302550"
  IID_IUIAutomationGridPattern = LibC::GUID.new(0x414c3cdc_u32, 0x856b_u16, 0x4f5b_u16, StaticArray[0x85_u8, 0x38_u8, 0x31_u8, 0x31_u8, 0xc6_u8, 0x30_u8, 0x25_u8, 0x50_u8])
  struct IUIAutomationGridPattern
    lpVtbl : IUIAutomationGridPatternVTbl*
  end

  struct IUIAutomationGridItemPatternVTbl
    query_interface : Proc(IUIAutomationGridItemPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationGridItemPattern*, UInt32)
    release : Proc(IUIAutomationGridItemPattern*, UInt32)
    get_current_containing_grid : Proc(IUIAutomationGridItemPattern*, IUIAutomationElement*, HRESULT)
    get_current_row : Proc(IUIAutomationGridItemPattern*, Int32*, HRESULT)
    get_current_column : Proc(IUIAutomationGridItemPattern*, Int32*, HRESULT)
    get_current_row_span : Proc(IUIAutomationGridItemPattern*, Int32*, HRESULT)
    get_current_column_span : Proc(IUIAutomationGridItemPattern*, Int32*, HRESULT)
    get_cached_containing_grid : Proc(IUIAutomationGridItemPattern*, IUIAutomationElement*, HRESULT)
    get_cached_row : Proc(IUIAutomationGridItemPattern*, Int32*, HRESULT)
    get_cached_column : Proc(IUIAutomationGridItemPattern*, Int32*, HRESULT)
    get_cached_row_span : Proc(IUIAutomationGridItemPattern*, Int32*, HRESULT)
    get_cached_column_span : Proc(IUIAutomationGridItemPattern*, Int32*, HRESULT)
  end

  IUIAutomationGridItemPattern_GUID = "78f8ef57-66c3-4e09-bd7c-e79b2004894d"
  IID_IUIAutomationGridItemPattern = LibC::GUID.new(0x78f8ef57_u32, 0x66c3_u16, 0x4e09_u16, StaticArray[0xbd_u8, 0x7c_u8, 0xe7_u8, 0x9b_u8, 0x20_u8, 0x4_u8, 0x89_u8, 0x4d_u8])
  struct IUIAutomationGridItemPattern
    lpVtbl : IUIAutomationGridItemPatternVTbl*
  end

  struct IUIAutomationMultipleViewPatternVTbl
    query_interface : Proc(IUIAutomationMultipleViewPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationMultipleViewPattern*, UInt32)
    release : Proc(IUIAutomationMultipleViewPattern*, UInt32)
    get_view_name : Proc(IUIAutomationMultipleViewPattern*, Int32, UInt8**, HRESULT)
    set_current_view : Proc(IUIAutomationMultipleViewPattern*, Int32, HRESULT)
    get_current_current_view : Proc(IUIAutomationMultipleViewPattern*, Int32*, HRESULT)
    get_current_supported_views : Proc(IUIAutomationMultipleViewPattern*, SAFEARRAY**, HRESULT)
    get_cached_current_view : Proc(IUIAutomationMultipleViewPattern*, Int32*, HRESULT)
    get_cached_supported_views : Proc(IUIAutomationMultipleViewPattern*, SAFEARRAY**, HRESULT)
  end

  IUIAutomationMultipleViewPattern_GUID = "8d253c91-1dc5-4bb5-b18f-ade16fa495e8"
  IID_IUIAutomationMultipleViewPattern = LibC::GUID.new(0x8d253c91_u32, 0x1dc5_u16, 0x4bb5_u16, StaticArray[0xb1_u8, 0x8f_u8, 0xad_u8, 0xe1_u8, 0x6f_u8, 0xa4_u8, 0x95_u8, 0xe8_u8])
  struct IUIAutomationMultipleViewPattern
    lpVtbl : IUIAutomationMultipleViewPatternVTbl*
  end

  struct IUIAutomationObjectModelPatternVTbl
    query_interface : Proc(IUIAutomationObjectModelPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationObjectModelPattern*, UInt32)
    release : Proc(IUIAutomationObjectModelPattern*, UInt32)
    get_underlying_object_model : Proc(IUIAutomationObjectModelPattern*, IUnknown*, HRESULT)
  end

  IUIAutomationObjectModelPattern_GUID = "71c284b3-c14d-4d14-981e-19751b0d756d"
  IID_IUIAutomationObjectModelPattern = LibC::GUID.new(0x71c284b3_u32, 0xc14d_u16, 0x4d14_u16, StaticArray[0x98_u8, 0x1e_u8, 0x19_u8, 0x75_u8, 0x1b_u8, 0xd_u8, 0x75_u8, 0x6d_u8])
  struct IUIAutomationObjectModelPattern
    lpVtbl : IUIAutomationObjectModelPatternVTbl*
  end

  struct IUIAutomationRangeValuePatternVTbl
    query_interface : Proc(IUIAutomationRangeValuePattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationRangeValuePattern*, UInt32)
    release : Proc(IUIAutomationRangeValuePattern*, UInt32)
    set_value : Proc(IUIAutomationRangeValuePattern*, Float64, HRESULT)
    get_current_value : Proc(IUIAutomationRangeValuePattern*, Float64*, HRESULT)
    get_current_is_read_only : Proc(IUIAutomationRangeValuePattern*, LibC::BOOL*, HRESULT)
    get_current_maximum : Proc(IUIAutomationRangeValuePattern*, Float64*, HRESULT)
    get_current_minimum : Proc(IUIAutomationRangeValuePattern*, Float64*, HRESULT)
    get_current_large_change : Proc(IUIAutomationRangeValuePattern*, Float64*, HRESULT)
    get_current_small_change : Proc(IUIAutomationRangeValuePattern*, Float64*, HRESULT)
    get_cached_value : Proc(IUIAutomationRangeValuePattern*, Float64*, HRESULT)
    get_cached_is_read_only : Proc(IUIAutomationRangeValuePattern*, LibC::BOOL*, HRESULT)
    get_cached_maximum : Proc(IUIAutomationRangeValuePattern*, Float64*, HRESULT)
    get_cached_minimum : Proc(IUIAutomationRangeValuePattern*, Float64*, HRESULT)
    get_cached_large_change : Proc(IUIAutomationRangeValuePattern*, Float64*, HRESULT)
    get_cached_small_change : Proc(IUIAutomationRangeValuePattern*, Float64*, HRESULT)
  end

  IUIAutomationRangeValuePattern_GUID = "59213f4f-7346-49e5-b120-80555987a148"
  IID_IUIAutomationRangeValuePattern = LibC::GUID.new(0x59213f4f_u32, 0x7346_u16, 0x49e5_u16, StaticArray[0xb1_u8, 0x20_u8, 0x80_u8, 0x55_u8, 0x59_u8, 0x87_u8, 0xa1_u8, 0x48_u8])
  struct IUIAutomationRangeValuePattern
    lpVtbl : IUIAutomationRangeValuePatternVTbl*
  end

  struct IUIAutomationScrollPatternVTbl
    query_interface : Proc(IUIAutomationScrollPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationScrollPattern*, UInt32)
    release : Proc(IUIAutomationScrollPattern*, UInt32)
    scroll : Proc(IUIAutomationScrollPattern*, ScrollAmount, ScrollAmount, HRESULT)
    set_scroll_percent : Proc(IUIAutomationScrollPattern*, Float64, Float64, HRESULT)
    get_current_horizontal_scroll_percent : Proc(IUIAutomationScrollPattern*, Float64*, HRESULT)
    get_current_vertical_scroll_percent : Proc(IUIAutomationScrollPattern*, Float64*, HRESULT)
    get_current_horizontal_view_size : Proc(IUIAutomationScrollPattern*, Float64*, HRESULT)
    get_current_vertical_view_size : Proc(IUIAutomationScrollPattern*, Float64*, HRESULT)
    get_current_horizontally_scrollable : Proc(IUIAutomationScrollPattern*, LibC::BOOL*, HRESULT)
    get_current_vertically_scrollable : Proc(IUIAutomationScrollPattern*, LibC::BOOL*, HRESULT)
    get_cached_horizontal_scroll_percent : Proc(IUIAutomationScrollPattern*, Float64*, HRESULT)
    get_cached_vertical_scroll_percent : Proc(IUIAutomationScrollPattern*, Float64*, HRESULT)
    get_cached_horizontal_view_size : Proc(IUIAutomationScrollPattern*, Float64*, HRESULT)
    get_cached_vertical_view_size : Proc(IUIAutomationScrollPattern*, Float64*, HRESULT)
    get_cached_horizontally_scrollable : Proc(IUIAutomationScrollPattern*, LibC::BOOL*, HRESULT)
    get_cached_vertically_scrollable : Proc(IUIAutomationScrollPattern*, LibC::BOOL*, HRESULT)
  end

  IUIAutomationScrollPattern_GUID = "88f4d42a-e881-459d-a77c-73bbbb7e02dc"
  IID_IUIAutomationScrollPattern = LibC::GUID.new(0x88f4d42a_u32, 0xe881_u16, 0x459d_u16, StaticArray[0xa7_u8, 0x7c_u8, 0x73_u8, 0xbb_u8, 0xbb_u8, 0x7e_u8, 0x2_u8, 0xdc_u8])
  struct IUIAutomationScrollPattern
    lpVtbl : IUIAutomationScrollPatternVTbl*
  end

  struct IUIAutomationScrollItemPatternVTbl
    query_interface : Proc(IUIAutomationScrollItemPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationScrollItemPattern*, UInt32)
    release : Proc(IUIAutomationScrollItemPattern*, UInt32)
    scroll_into_view : Proc(IUIAutomationScrollItemPattern*, HRESULT)
  end

  IUIAutomationScrollItemPattern_GUID = "b488300f-d015-4f19-9c29-bb595e3645ef"
  IID_IUIAutomationScrollItemPattern = LibC::GUID.new(0xb488300f_u32, 0xd015_u16, 0x4f19_u16, StaticArray[0x9c_u8, 0x29_u8, 0xbb_u8, 0x59_u8, 0x5e_u8, 0x36_u8, 0x45_u8, 0xef_u8])
  struct IUIAutomationScrollItemPattern
    lpVtbl : IUIAutomationScrollItemPatternVTbl*
  end

  struct IUIAutomationSelectionPatternVTbl
    query_interface : Proc(IUIAutomationSelectionPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationSelectionPattern*, UInt32)
    release : Proc(IUIAutomationSelectionPattern*, UInt32)
    get_current_selection : Proc(IUIAutomationSelectionPattern*, IUIAutomationElementArray*, HRESULT)
    get_current_can_select_multiple : Proc(IUIAutomationSelectionPattern*, LibC::BOOL*, HRESULT)
    get_current_is_selection_required : Proc(IUIAutomationSelectionPattern*, LibC::BOOL*, HRESULT)
    get_cached_selection : Proc(IUIAutomationSelectionPattern*, IUIAutomationElementArray*, HRESULT)
    get_cached_can_select_multiple : Proc(IUIAutomationSelectionPattern*, LibC::BOOL*, HRESULT)
    get_cached_is_selection_required : Proc(IUIAutomationSelectionPattern*, LibC::BOOL*, HRESULT)
  end

  IUIAutomationSelectionPattern_GUID = "5ed5202e-b2ac-47a6-b638-4b0bf140d78e"
  IID_IUIAutomationSelectionPattern = LibC::GUID.new(0x5ed5202e_u32, 0xb2ac_u16, 0x47a6_u16, StaticArray[0xb6_u8, 0x38_u8, 0x4b_u8, 0xb_u8, 0xf1_u8, 0x40_u8, 0xd7_u8, 0x8e_u8])
  struct IUIAutomationSelectionPattern
    lpVtbl : IUIAutomationSelectionPatternVTbl*
  end

  struct IUIAutomationSelectionPattern2VTbl
    query_interface : Proc(IUIAutomationSelectionPattern2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationSelectionPattern2*, UInt32)
    release : Proc(IUIAutomationSelectionPattern2*, UInt32)
    get_current_selection : Proc(IUIAutomationSelectionPattern2*, IUIAutomationElementArray*, HRESULT)
    get_current_can_select_multiple : Proc(IUIAutomationSelectionPattern2*, LibC::BOOL*, HRESULT)
    get_current_is_selection_required : Proc(IUIAutomationSelectionPattern2*, LibC::BOOL*, HRESULT)
    get_cached_selection : Proc(IUIAutomationSelectionPattern2*, IUIAutomationElementArray*, HRESULT)
    get_cached_can_select_multiple : Proc(IUIAutomationSelectionPattern2*, LibC::BOOL*, HRESULT)
    get_cached_is_selection_required : Proc(IUIAutomationSelectionPattern2*, LibC::BOOL*, HRESULT)
    get_current_first_selected_item : Proc(IUIAutomationSelectionPattern2*, IUIAutomationElement*, HRESULT)
    get_current_last_selected_item : Proc(IUIAutomationSelectionPattern2*, IUIAutomationElement*, HRESULT)
    get_current_current_selected_item : Proc(IUIAutomationSelectionPattern2*, IUIAutomationElement*, HRESULT)
    get_current_item_count : Proc(IUIAutomationSelectionPattern2*, Int32*, HRESULT)
    get_cached_first_selected_item : Proc(IUIAutomationSelectionPattern2*, IUIAutomationElement*, HRESULT)
    get_cached_last_selected_item : Proc(IUIAutomationSelectionPattern2*, IUIAutomationElement*, HRESULT)
    get_cached_current_selected_item : Proc(IUIAutomationSelectionPattern2*, IUIAutomationElement*, HRESULT)
    get_cached_item_count : Proc(IUIAutomationSelectionPattern2*, Int32*, HRESULT)
  end

  IUIAutomationSelectionPattern2_GUID = "0532bfae-c011-4e32-a343-6d642d798555"
  IID_IUIAutomationSelectionPattern2 = LibC::GUID.new(0x532bfae_u32, 0xc011_u16, 0x4e32_u16, StaticArray[0xa3_u8, 0x43_u8, 0x6d_u8, 0x64_u8, 0x2d_u8, 0x79_u8, 0x85_u8, 0x55_u8])
  struct IUIAutomationSelectionPattern2
    lpVtbl : IUIAutomationSelectionPattern2VTbl*
  end

  struct IUIAutomationSelectionItemPatternVTbl
    query_interface : Proc(IUIAutomationSelectionItemPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationSelectionItemPattern*, UInt32)
    release : Proc(IUIAutomationSelectionItemPattern*, UInt32)
    select : Proc(IUIAutomationSelectionItemPattern*, HRESULT)
    add_to_selection : Proc(IUIAutomationSelectionItemPattern*, HRESULT)
    remove_from_selection : Proc(IUIAutomationSelectionItemPattern*, HRESULT)
    get_current_is_selected : Proc(IUIAutomationSelectionItemPattern*, LibC::BOOL*, HRESULT)
    get_current_selection_container : Proc(IUIAutomationSelectionItemPattern*, IUIAutomationElement*, HRESULT)
    get_cached_is_selected : Proc(IUIAutomationSelectionItemPattern*, LibC::BOOL*, HRESULT)
    get_cached_selection_container : Proc(IUIAutomationSelectionItemPattern*, IUIAutomationElement*, HRESULT)
  end

  IUIAutomationSelectionItemPattern_GUID = "a8efa66a-0fda-421a-9194-38021f3578ea"
  IID_IUIAutomationSelectionItemPattern = LibC::GUID.new(0xa8efa66a_u32, 0xfda_u16, 0x421a_u16, StaticArray[0x91_u8, 0x94_u8, 0x38_u8, 0x2_u8, 0x1f_u8, 0x35_u8, 0x78_u8, 0xea_u8])
  struct IUIAutomationSelectionItemPattern
    lpVtbl : IUIAutomationSelectionItemPatternVTbl*
  end

  struct IUIAutomationSynchronizedInputPatternVTbl
    query_interface : Proc(IUIAutomationSynchronizedInputPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationSynchronizedInputPattern*, UInt32)
    release : Proc(IUIAutomationSynchronizedInputPattern*, UInt32)
    start_listening : Proc(IUIAutomationSynchronizedInputPattern*, SynchronizedInputType, HRESULT)
    cancel : Proc(IUIAutomationSynchronizedInputPattern*, HRESULT)
  end

  IUIAutomationSynchronizedInputPattern_GUID = "2233be0b-afb7-448b-9fda-3b378aa5eae1"
  IID_IUIAutomationSynchronizedInputPattern = LibC::GUID.new(0x2233be0b_u32, 0xafb7_u16, 0x448b_u16, StaticArray[0x9f_u8, 0xda_u8, 0x3b_u8, 0x37_u8, 0x8a_u8, 0xa5_u8, 0xea_u8, 0xe1_u8])
  struct IUIAutomationSynchronizedInputPattern
    lpVtbl : IUIAutomationSynchronizedInputPatternVTbl*
  end

  struct IUIAutomationTablePatternVTbl
    query_interface : Proc(IUIAutomationTablePattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTablePattern*, UInt32)
    release : Proc(IUIAutomationTablePattern*, UInt32)
    get_current_row_headers : Proc(IUIAutomationTablePattern*, IUIAutomationElementArray*, HRESULT)
    get_current_column_headers : Proc(IUIAutomationTablePattern*, IUIAutomationElementArray*, HRESULT)
    get_current_row_or_column_major : Proc(IUIAutomationTablePattern*, RowOrColumnMajor*, HRESULT)
    get_cached_row_headers : Proc(IUIAutomationTablePattern*, IUIAutomationElementArray*, HRESULT)
    get_cached_column_headers : Proc(IUIAutomationTablePattern*, IUIAutomationElementArray*, HRESULT)
    get_cached_row_or_column_major : Proc(IUIAutomationTablePattern*, RowOrColumnMajor*, HRESULT)
  end

  IUIAutomationTablePattern_GUID = "620e691c-ea96-4710-a850-754b24ce2417"
  IID_IUIAutomationTablePattern = LibC::GUID.new(0x620e691c_u32, 0xea96_u16, 0x4710_u16, StaticArray[0xa8_u8, 0x50_u8, 0x75_u8, 0x4b_u8, 0x24_u8, 0xce_u8, 0x24_u8, 0x17_u8])
  struct IUIAutomationTablePattern
    lpVtbl : IUIAutomationTablePatternVTbl*
  end

  struct IUIAutomationTableItemPatternVTbl
    query_interface : Proc(IUIAutomationTableItemPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTableItemPattern*, UInt32)
    release : Proc(IUIAutomationTableItemPattern*, UInt32)
    get_current_row_header_items : Proc(IUIAutomationTableItemPattern*, IUIAutomationElementArray*, HRESULT)
    get_current_column_header_items : Proc(IUIAutomationTableItemPattern*, IUIAutomationElementArray*, HRESULT)
    get_cached_row_header_items : Proc(IUIAutomationTableItemPattern*, IUIAutomationElementArray*, HRESULT)
    get_cached_column_header_items : Proc(IUIAutomationTableItemPattern*, IUIAutomationElementArray*, HRESULT)
  end

  IUIAutomationTableItemPattern_GUID = "0b964eb3-ef2e-4464-9c79-61d61737a27e"
  IID_IUIAutomationTableItemPattern = LibC::GUID.new(0xb964eb3_u32, 0xef2e_u16, 0x4464_u16, StaticArray[0x9c_u8, 0x79_u8, 0x61_u8, 0xd6_u8, 0x17_u8, 0x37_u8, 0xa2_u8, 0x7e_u8])
  struct IUIAutomationTableItemPattern
    lpVtbl : IUIAutomationTableItemPatternVTbl*
  end

  struct IUIAutomationTogglePatternVTbl
    query_interface : Proc(IUIAutomationTogglePattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTogglePattern*, UInt32)
    release : Proc(IUIAutomationTogglePattern*, UInt32)
    toggle : Proc(IUIAutomationTogglePattern*, HRESULT)
    get_current_toggle_state : Proc(IUIAutomationTogglePattern*, ToggleState*, HRESULT)
    get_cached_toggle_state : Proc(IUIAutomationTogglePattern*, ToggleState*, HRESULT)
  end

  IUIAutomationTogglePattern_GUID = "94cf8058-9b8d-4ab9-8bfd-4cd0a33c8c70"
  IID_IUIAutomationTogglePattern = LibC::GUID.new(0x94cf8058_u32, 0x9b8d_u16, 0x4ab9_u16, StaticArray[0x8b_u8, 0xfd_u8, 0x4c_u8, 0xd0_u8, 0xa3_u8, 0x3c_u8, 0x8c_u8, 0x70_u8])
  struct IUIAutomationTogglePattern
    lpVtbl : IUIAutomationTogglePatternVTbl*
  end

  struct IUIAutomationTransformPatternVTbl
    query_interface : Proc(IUIAutomationTransformPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTransformPattern*, UInt32)
    release : Proc(IUIAutomationTransformPattern*, UInt32)
    move : Proc(IUIAutomationTransformPattern*, Float64, Float64, HRESULT)
    resize : Proc(IUIAutomationTransformPattern*, Float64, Float64, HRESULT)
    rotate : Proc(IUIAutomationTransformPattern*, Float64, HRESULT)
    get_current_can_move : Proc(IUIAutomationTransformPattern*, LibC::BOOL*, HRESULT)
    get_current_can_resize : Proc(IUIAutomationTransformPattern*, LibC::BOOL*, HRESULT)
    get_current_can_rotate : Proc(IUIAutomationTransformPattern*, LibC::BOOL*, HRESULT)
    get_cached_can_move : Proc(IUIAutomationTransformPattern*, LibC::BOOL*, HRESULT)
    get_cached_can_resize : Proc(IUIAutomationTransformPattern*, LibC::BOOL*, HRESULT)
    get_cached_can_rotate : Proc(IUIAutomationTransformPattern*, LibC::BOOL*, HRESULT)
  end

  IUIAutomationTransformPattern_GUID = "a9b55844-a55d-4ef0-926d-569c16ff89bb"
  IID_IUIAutomationTransformPattern = LibC::GUID.new(0xa9b55844_u32, 0xa55d_u16, 0x4ef0_u16, StaticArray[0x92_u8, 0x6d_u8, 0x56_u8, 0x9c_u8, 0x16_u8, 0xff_u8, 0x89_u8, 0xbb_u8])
  struct IUIAutomationTransformPattern
    lpVtbl : IUIAutomationTransformPatternVTbl*
  end

  struct IUIAutomationValuePatternVTbl
    query_interface : Proc(IUIAutomationValuePattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationValuePattern*, UInt32)
    release : Proc(IUIAutomationValuePattern*, UInt32)
    set_value : Proc(IUIAutomationValuePattern*, UInt8*, HRESULT)
    get_current_value : Proc(IUIAutomationValuePattern*, UInt8**, HRESULT)
    get_current_is_read_only : Proc(IUIAutomationValuePattern*, LibC::BOOL*, HRESULT)
    get_cached_value : Proc(IUIAutomationValuePattern*, UInt8**, HRESULT)
    get_cached_is_read_only : Proc(IUIAutomationValuePattern*, LibC::BOOL*, HRESULT)
  end

  IUIAutomationValuePattern_GUID = "a94cd8b1-0844-4cd6-9d2d-640537ab39e9"
  IID_IUIAutomationValuePattern = LibC::GUID.new(0xa94cd8b1_u32, 0x844_u16, 0x4cd6_u16, StaticArray[0x9d_u8, 0x2d_u8, 0x64_u8, 0x5_u8, 0x37_u8, 0xab_u8, 0x39_u8, 0xe9_u8])
  struct IUIAutomationValuePattern
    lpVtbl : IUIAutomationValuePatternVTbl*
  end

  struct IUIAutomationWindowPatternVTbl
    query_interface : Proc(IUIAutomationWindowPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationWindowPattern*, UInt32)
    release : Proc(IUIAutomationWindowPattern*, UInt32)
    close : Proc(IUIAutomationWindowPattern*, HRESULT)
    wait_for_input_idle : Proc(IUIAutomationWindowPattern*, Int32, LibC::BOOL*, HRESULT)
    set_window_visual_state : Proc(IUIAutomationWindowPattern*, WindowVisualState, HRESULT)
    get_current_can_maximize : Proc(IUIAutomationWindowPattern*, LibC::BOOL*, HRESULT)
    get_current_can_minimize : Proc(IUIAutomationWindowPattern*, LibC::BOOL*, HRESULT)
    get_current_is_modal : Proc(IUIAutomationWindowPattern*, LibC::BOOL*, HRESULT)
    get_current_is_topmost : Proc(IUIAutomationWindowPattern*, LibC::BOOL*, HRESULT)
    get_current_window_visual_state : Proc(IUIAutomationWindowPattern*, WindowVisualState*, HRESULT)
    get_current_window_interaction_state : Proc(IUIAutomationWindowPattern*, WindowInteractionState*, HRESULT)
    get_cached_can_maximize : Proc(IUIAutomationWindowPattern*, LibC::BOOL*, HRESULT)
    get_cached_can_minimize : Proc(IUIAutomationWindowPattern*, LibC::BOOL*, HRESULT)
    get_cached_is_modal : Proc(IUIAutomationWindowPattern*, LibC::BOOL*, HRESULT)
    get_cached_is_topmost : Proc(IUIAutomationWindowPattern*, LibC::BOOL*, HRESULT)
    get_cached_window_visual_state : Proc(IUIAutomationWindowPattern*, WindowVisualState*, HRESULT)
    get_cached_window_interaction_state : Proc(IUIAutomationWindowPattern*, WindowInteractionState*, HRESULT)
  end

  IUIAutomationWindowPattern_GUID = "0faef453-9208-43ef-bbb2-3b485177864f"
  IID_IUIAutomationWindowPattern = LibC::GUID.new(0xfaef453_u32, 0x9208_u16, 0x43ef_u16, StaticArray[0xbb_u8, 0xb2_u8, 0x3b_u8, 0x48_u8, 0x51_u8, 0x77_u8, 0x86_u8, 0x4f_u8])
  struct IUIAutomationWindowPattern
    lpVtbl : IUIAutomationWindowPatternVTbl*
  end

  struct IUIAutomationTextRangeVTbl
    query_interface : Proc(IUIAutomationTextRange*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTextRange*, UInt32)
    release : Proc(IUIAutomationTextRange*, UInt32)
    clone : Proc(IUIAutomationTextRange*, IUIAutomationTextRange*, HRESULT)
    compare : Proc(IUIAutomationTextRange*, IUIAutomationTextRange, LibC::BOOL*, HRESULT)
    compare_endpoints : Proc(IUIAutomationTextRange*, TextPatternRangeEndpoint, IUIAutomationTextRange, TextPatternRangeEndpoint, Int32*, HRESULT)
    expand_to_enclosing_unit : Proc(IUIAutomationTextRange*, TextUnit, HRESULT)
    find_attribute : Proc(IUIAutomationTextRange*, Int32, VARIANT, LibC::BOOL, IUIAutomationTextRange*, HRESULT)
    find_text : Proc(IUIAutomationTextRange*, UInt8*, LibC::BOOL, LibC::BOOL, IUIAutomationTextRange*, HRESULT)
    get_attribute_value : Proc(IUIAutomationTextRange*, Int32, VARIANT*, HRESULT)
    get_bounding_rectangles : Proc(IUIAutomationTextRange*, SAFEARRAY**, HRESULT)
    get_enclosing_element : Proc(IUIAutomationTextRange*, IUIAutomationElement*, HRESULT)
    get_text : Proc(IUIAutomationTextRange*, Int32, UInt8**, HRESULT)
    move : Proc(IUIAutomationTextRange*, TextUnit, Int32, Int32*, HRESULT)
    move_endpoint_by_unit : Proc(IUIAutomationTextRange*, TextPatternRangeEndpoint, TextUnit, Int32, Int32*, HRESULT)
    move_endpoint_by_range : Proc(IUIAutomationTextRange*, TextPatternRangeEndpoint, IUIAutomationTextRange, TextPatternRangeEndpoint, HRESULT)
    select : Proc(IUIAutomationTextRange*, HRESULT)
    add_to_selection : Proc(IUIAutomationTextRange*, HRESULT)
    remove_from_selection : Proc(IUIAutomationTextRange*, HRESULT)
    scroll_into_view : Proc(IUIAutomationTextRange*, LibC::BOOL, HRESULT)
    get_children : Proc(IUIAutomationTextRange*, IUIAutomationElementArray*, HRESULT)
  end

  IUIAutomationTextRange_GUID = "a543cc6a-f4ae-494b-8239-c814481187a8"
  IID_IUIAutomationTextRange = LibC::GUID.new(0xa543cc6a_u32, 0xf4ae_u16, 0x494b_u16, StaticArray[0x82_u8, 0x39_u8, 0xc8_u8, 0x14_u8, 0x48_u8, 0x11_u8, 0x87_u8, 0xa8_u8])
  struct IUIAutomationTextRange
    lpVtbl : IUIAutomationTextRangeVTbl*
  end

  struct IUIAutomationTextRange2VTbl
    query_interface : Proc(IUIAutomationTextRange2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTextRange2*, UInt32)
    release : Proc(IUIAutomationTextRange2*, UInt32)
    clone : Proc(IUIAutomationTextRange2*, IUIAutomationTextRange*, HRESULT)
    compare : Proc(IUIAutomationTextRange2*, IUIAutomationTextRange, LibC::BOOL*, HRESULT)
    compare_endpoints : Proc(IUIAutomationTextRange2*, TextPatternRangeEndpoint, IUIAutomationTextRange, TextPatternRangeEndpoint, Int32*, HRESULT)
    expand_to_enclosing_unit : Proc(IUIAutomationTextRange2*, TextUnit, HRESULT)
    find_attribute : Proc(IUIAutomationTextRange2*, Int32, VARIANT, LibC::BOOL, IUIAutomationTextRange*, HRESULT)
    find_text : Proc(IUIAutomationTextRange2*, UInt8*, LibC::BOOL, LibC::BOOL, IUIAutomationTextRange*, HRESULT)
    get_attribute_value : Proc(IUIAutomationTextRange2*, Int32, VARIANT*, HRESULT)
    get_bounding_rectangles : Proc(IUIAutomationTextRange2*, SAFEARRAY**, HRESULT)
    get_enclosing_element : Proc(IUIAutomationTextRange2*, IUIAutomationElement*, HRESULT)
    get_text : Proc(IUIAutomationTextRange2*, Int32, UInt8**, HRESULT)
    move : Proc(IUIAutomationTextRange2*, TextUnit, Int32, Int32*, HRESULT)
    move_endpoint_by_unit : Proc(IUIAutomationTextRange2*, TextPatternRangeEndpoint, TextUnit, Int32, Int32*, HRESULT)
    move_endpoint_by_range : Proc(IUIAutomationTextRange2*, TextPatternRangeEndpoint, IUIAutomationTextRange, TextPatternRangeEndpoint, HRESULT)
    select : Proc(IUIAutomationTextRange2*, HRESULT)
    add_to_selection : Proc(IUIAutomationTextRange2*, HRESULT)
    remove_from_selection : Proc(IUIAutomationTextRange2*, HRESULT)
    scroll_into_view : Proc(IUIAutomationTextRange2*, LibC::BOOL, HRESULT)
    get_children : Proc(IUIAutomationTextRange2*, IUIAutomationElementArray*, HRESULT)
    show_context_menu : Proc(IUIAutomationTextRange2*, HRESULT)
  end

  IUIAutomationTextRange2_GUID = "bb9b40e0-5e04-46bd-9be0-4b601b9afad4"
  IID_IUIAutomationTextRange2 = LibC::GUID.new(0xbb9b40e0_u32, 0x5e04_u16, 0x46bd_u16, StaticArray[0x9b_u8, 0xe0_u8, 0x4b_u8, 0x60_u8, 0x1b_u8, 0x9a_u8, 0xfa_u8, 0xd4_u8])
  struct IUIAutomationTextRange2
    lpVtbl : IUIAutomationTextRange2VTbl*
  end

  struct IUIAutomationTextRange3VTbl
    query_interface : Proc(IUIAutomationTextRange3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTextRange3*, UInt32)
    release : Proc(IUIAutomationTextRange3*, UInt32)
    clone : Proc(IUIAutomationTextRange3*, IUIAutomationTextRange*, HRESULT)
    compare : Proc(IUIAutomationTextRange3*, IUIAutomationTextRange, LibC::BOOL*, HRESULT)
    compare_endpoints : Proc(IUIAutomationTextRange3*, TextPatternRangeEndpoint, IUIAutomationTextRange, TextPatternRangeEndpoint, Int32*, HRESULT)
    expand_to_enclosing_unit : Proc(IUIAutomationTextRange3*, TextUnit, HRESULT)
    find_attribute : Proc(IUIAutomationTextRange3*, Int32, VARIANT, LibC::BOOL, IUIAutomationTextRange*, HRESULT)
    find_text : Proc(IUIAutomationTextRange3*, UInt8*, LibC::BOOL, LibC::BOOL, IUIAutomationTextRange*, HRESULT)
    get_attribute_value : Proc(IUIAutomationTextRange3*, Int32, VARIANT*, HRESULT)
    get_bounding_rectangles : Proc(IUIAutomationTextRange3*, SAFEARRAY**, HRESULT)
    get_enclosing_element : Proc(IUIAutomationTextRange3*, IUIAutomationElement*, HRESULT)
    get_text : Proc(IUIAutomationTextRange3*, Int32, UInt8**, HRESULT)
    move : Proc(IUIAutomationTextRange3*, TextUnit, Int32, Int32*, HRESULT)
    move_endpoint_by_unit : Proc(IUIAutomationTextRange3*, TextPatternRangeEndpoint, TextUnit, Int32, Int32*, HRESULT)
    move_endpoint_by_range : Proc(IUIAutomationTextRange3*, TextPatternRangeEndpoint, IUIAutomationTextRange, TextPatternRangeEndpoint, HRESULT)
    select : Proc(IUIAutomationTextRange3*, HRESULT)
    add_to_selection : Proc(IUIAutomationTextRange3*, HRESULT)
    remove_from_selection : Proc(IUIAutomationTextRange3*, HRESULT)
    scroll_into_view : Proc(IUIAutomationTextRange3*, LibC::BOOL, HRESULT)
    get_children : Proc(IUIAutomationTextRange3*, IUIAutomationElementArray*, HRESULT)
    show_context_menu : Proc(IUIAutomationTextRange3*, HRESULT)
    get_enclosing_element_build_cache : Proc(IUIAutomationTextRange3*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_children_build_cache : Proc(IUIAutomationTextRange3*, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)
    get_attribute_values : Proc(IUIAutomationTextRange3*, Int32*, Int32, SAFEARRAY**, HRESULT)
  end

  IUIAutomationTextRange3_GUID = "6a315d69-5512-4c2e-85f0-53fce6dd4bc2"
  IID_IUIAutomationTextRange3 = LibC::GUID.new(0x6a315d69_u32, 0x5512_u16, 0x4c2e_u16, StaticArray[0x85_u8, 0xf0_u8, 0x53_u8, 0xfc_u8, 0xe6_u8, 0xdd_u8, 0x4b_u8, 0xc2_u8])
  struct IUIAutomationTextRange3
    lpVtbl : IUIAutomationTextRange3VTbl*
  end

  struct IUIAutomationTextRangeArrayVTbl
    query_interface : Proc(IUIAutomationTextRangeArray*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTextRangeArray*, UInt32)
    release : Proc(IUIAutomationTextRangeArray*, UInt32)
    get_length : Proc(IUIAutomationTextRangeArray*, Int32*, HRESULT)
    get_element : Proc(IUIAutomationTextRangeArray*, Int32, IUIAutomationTextRange*, HRESULT)
  end

  IUIAutomationTextRangeArray_GUID = "ce4ae76a-e717-4c98-81ea-47371d028eb6"
  IID_IUIAutomationTextRangeArray = LibC::GUID.new(0xce4ae76a_u32, 0xe717_u16, 0x4c98_u16, StaticArray[0x81_u8, 0xea_u8, 0x47_u8, 0x37_u8, 0x1d_u8, 0x2_u8, 0x8e_u8, 0xb6_u8])
  struct IUIAutomationTextRangeArray
    lpVtbl : IUIAutomationTextRangeArrayVTbl*
  end

  struct IUIAutomationTextPatternVTbl
    query_interface : Proc(IUIAutomationTextPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTextPattern*, UInt32)
    release : Proc(IUIAutomationTextPattern*, UInt32)
    range_from_point : Proc(IUIAutomationTextPattern*, POINT, IUIAutomationTextRange*, HRESULT)
    range_from_child : Proc(IUIAutomationTextPattern*, IUIAutomationElement, IUIAutomationTextRange*, HRESULT)
    get_selection : Proc(IUIAutomationTextPattern*, IUIAutomationTextRangeArray*, HRESULT)
    get_visible_ranges : Proc(IUIAutomationTextPattern*, IUIAutomationTextRangeArray*, HRESULT)
    get_document_range : Proc(IUIAutomationTextPattern*, IUIAutomationTextRange*, HRESULT)
    get_supported_text_selection : Proc(IUIAutomationTextPattern*, SupportedTextSelection*, HRESULT)
  end

  IUIAutomationTextPattern_GUID = "32eba289-3583-42c9-9c59-3b6d9a1e9b6a"
  IID_IUIAutomationTextPattern = LibC::GUID.new(0x32eba289_u32, 0x3583_u16, 0x42c9_u16, StaticArray[0x9c_u8, 0x59_u8, 0x3b_u8, 0x6d_u8, 0x9a_u8, 0x1e_u8, 0x9b_u8, 0x6a_u8])
  struct IUIAutomationTextPattern
    lpVtbl : IUIAutomationTextPatternVTbl*
  end

  struct IUIAutomationTextPattern2VTbl
    query_interface : Proc(IUIAutomationTextPattern2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTextPattern2*, UInt32)
    release : Proc(IUIAutomationTextPattern2*, UInt32)
    range_from_point : Proc(IUIAutomationTextPattern2*, POINT, IUIAutomationTextRange*, HRESULT)
    range_from_child : Proc(IUIAutomationTextPattern2*, IUIAutomationElement, IUIAutomationTextRange*, HRESULT)
    get_selection : Proc(IUIAutomationTextPattern2*, IUIAutomationTextRangeArray*, HRESULT)
    get_visible_ranges : Proc(IUIAutomationTextPattern2*, IUIAutomationTextRangeArray*, HRESULT)
    get_document_range : Proc(IUIAutomationTextPattern2*, IUIAutomationTextRange*, HRESULT)
    get_supported_text_selection : Proc(IUIAutomationTextPattern2*, SupportedTextSelection*, HRESULT)
    range_from_annotation : Proc(IUIAutomationTextPattern2*, IUIAutomationElement, IUIAutomationTextRange*, HRESULT)
    get_caret_range : Proc(IUIAutomationTextPattern2*, LibC::BOOL*, IUIAutomationTextRange*, HRESULT)
  end

  IUIAutomationTextPattern2_GUID = "506a921a-fcc9-409f-b23b-37eb74106872"
  IID_IUIAutomationTextPattern2 = LibC::GUID.new(0x506a921a_u32, 0xfcc9_u16, 0x409f_u16, StaticArray[0xb2_u8, 0x3b_u8, 0x37_u8, 0xeb_u8, 0x74_u8, 0x10_u8, 0x68_u8, 0x72_u8])
  struct IUIAutomationTextPattern2
    lpVtbl : IUIAutomationTextPattern2VTbl*
  end

  struct IUIAutomationTextEditPatternVTbl
    query_interface : Proc(IUIAutomationTextEditPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTextEditPattern*, UInt32)
    release : Proc(IUIAutomationTextEditPattern*, UInt32)
    range_from_point : Proc(IUIAutomationTextEditPattern*, POINT, IUIAutomationTextRange*, HRESULT)
    range_from_child : Proc(IUIAutomationTextEditPattern*, IUIAutomationElement, IUIAutomationTextRange*, HRESULT)
    get_selection : Proc(IUIAutomationTextEditPattern*, IUIAutomationTextRangeArray*, HRESULT)
    get_visible_ranges : Proc(IUIAutomationTextEditPattern*, IUIAutomationTextRangeArray*, HRESULT)
    get_document_range : Proc(IUIAutomationTextEditPattern*, IUIAutomationTextRange*, HRESULT)
    get_supported_text_selection : Proc(IUIAutomationTextEditPattern*, SupportedTextSelection*, HRESULT)
    get_active_composition : Proc(IUIAutomationTextEditPattern*, IUIAutomationTextRange*, HRESULT)
    get_conversion_target : Proc(IUIAutomationTextEditPattern*, IUIAutomationTextRange*, HRESULT)
  end

  IUIAutomationTextEditPattern_GUID = "17e21576-996c-4870-99d9-bff323380c06"
  IID_IUIAutomationTextEditPattern = LibC::GUID.new(0x17e21576_u32, 0x996c_u16, 0x4870_u16, StaticArray[0x99_u8, 0xd9_u8, 0xbf_u8, 0xf3_u8, 0x23_u8, 0x38_u8, 0xc_u8, 0x6_u8])
  struct IUIAutomationTextEditPattern
    lpVtbl : IUIAutomationTextEditPatternVTbl*
  end

  struct IUIAutomationCustomNavigationPatternVTbl
    query_interface : Proc(IUIAutomationCustomNavigationPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationCustomNavigationPattern*, UInt32)
    release : Proc(IUIAutomationCustomNavigationPattern*, UInt32)
    navigate : Proc(IUIAutomationCustomNavigationPattern*, NavigateDirection, IUIAutomationElement*, HRESULT)
  end

  IUIAutomationCustomNavigationPattern_GUID = "01ea217a-1766-47ed-a6cc-acf492854b1f"
  IID_IUIAutomationCustomNavigationPattern = LibC::GUID.new(0x1ea217a_u32, 0x1766_u16, 0x47ed_u16, StaticArray[0xa6_u8, 0xcc_u8, 0xac_u8, 0xf4_u8, 0x92_u8, 0x85_u8, 0x4b_u8, 0x1f_u8])
  struct IUIAutomationCustomNavigationPattern
    lpVtbl : IUIAutomationCustomNavigationPatternVTbl*
  end

  struct IUIAutomationActiveTextPositionChangedEventHandlerVTbl
    query_interface : Proc(IUIAutomationActiveTextPositionChangedEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationActiveTextPositionChangedEventHandler*, UInt32)
    release : Proc(IUIAutomationActiveTextPositionChangedEventHandler*, UInt32)
    handle_active_text_position_changed_event : Proc(IUIAutomationActiveTextPositionChangedEventHandler*, IUIAutomationElement, IUIAutomationTextRange, HRESULT)
  end

  IUIAutomationActiveTextPositionChangedEventHandler_GUID = "f97933b0-8dae-4496-8997-5ba015fe0d82"
  IID_IUIAutomationActiveTextPositionChangedEventHandler = LibC::GUID.new(0xf97933b0_u32, 0x8dae_u16, 0x4496_u16, StaticArray[0x89_u8, 0x97_u8, 0x5b_u8, 0xa0_u8, 0x15_u8, 0xfe_u8, 0xd_u8, 0x82_u8])
  struct IUIAutomationActiveTextPositionChangedEventHandler
    lpVtbl : IUIAutomationActiveTextPositionChangedEventHandlerVTbl*
  end

  struct IUIAutomationLegacyIAccessiblePatternVTbl
    query_interface : Proc(IUIAutomationLegacyIAccessiblePattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt32)
    release : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt32)
    select : Proc(IUIAutomationLegacyIAccessiblePattern*, Int32, HRESULT)
    do_default_action : Proc(IUIAutomationLegacyIAccessiblePattern*, HRESULT)
    set_value : Proc(IUIAutomationLegacyIAccessiblePattern*, LibC::LPWSTR, HRESULT)
    get_current_child_id : Proc(IUIAutomationLegacyIAccessiblePattern*, Int32*, HRESULT)
    get_current_name : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt8**, HRESULT)
    get_current_value : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt8**, HRESULT)
    get_current_description : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt8**, HRESULT)
    get_current_role : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt32*, HRESULT)
    get_current_state : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt32*, HRESULT)
    get_current_help : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt8**, HRESULT)
    get_current_keyboard_shortcut : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt8**, HRESULT)
    get_current_selection : Proc(IUIAutomationLegacyIAccessiblePattern*, IUIAutomationElementArray*, HRESULT)
    get_current_default_action : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt8**, HRESULT)
    get_cached_child_id : Proc(IUIAutomationLegacyIAccessiblePattern*, Int32*, HRESULT)
    get_cached_name : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt8**, HRESULT)
    get_cached_value : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt8**, HRESULT)
    get_cached_description : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt8**, HRESULT)
    get_cached_role : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt32*, HRESULT)
    get_cached_state : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt32*, HRESULT)
    get_cached_help : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt8**, HRESULT)
    get_cached_keyboard_shortcut : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt8**, HRESULT)
    get_cached_selection : Proc(IUIAutomationLegacyIAccessiblePattern*, IUIAutomationElementArray*, HRESULT)
    get_cached_default_action : Proc(IUIAutomationLegacyIAccessiblePattern*, UInt8**, HRESULT)
    get_i_accessible : Proc(IUIAutomationLegacyIAccessiblePattern*, IAccessible*, HRESULT)
  end

  IUIAutomationLegacyIAccessiblePattern_GUID = "828055ad-355b-4435-86d5-3b51c14a9b1b"
  IID_IUIAutomationLegacyIAccessiblePattern = LibC::GUID.new(0x828055ad_u32, 0x355b_u16, 0x4435_u16, StaticArray[0x86_u8, 0xd5_u8, 0x3b_u8, 0x51_u8, 0xc1_u8, 0x4a_u8, 0x9b_u8, 0x1b_u8])
  struct IUIAutomationLegacyIAccessiblePattern
    lpVtbl : IUIAutomationLegacyIAccessiblePatternVTbl*
  end

  struct IUIAutomationItemContainerPatternVTbl
    query_interface : Proc(IUIAutomationItemContainerPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationItemContainerPattern*, UInt32)
    release : Proc(IUIAutomationItemContainerPattern*, UInt32)
    find_item_by_property : Proc(IUIAutomationItemContainerPattern*, IUIAutomationElement, Int32, VARIANT, IUIAutomationElement*, HRESULT)
  end

  IUIAutomationItemContainerPattern_GUID = "c690fdb2-27a8-423c-812d-429773c9084e"
  IID_IUIAutomationItemContainerPattern = LibC::GUID.new(0xc690fdb2_u32, 0x27a8_u16, 0x423c_u16, StaticArray[0x81_u8, 0x2d_u8, 0x42_u8, 0x97_u8, 0x73_u8, 0xc9_u8, 0x8_u8, 0x4e_u8])
  struct IUIAutomationItemContainerPattern
    lpVtbl : IUIAutomationItemContainerPatternVTbl*
  end

  struct IUIAutomationVirtualizedItemPatternVTbl
    query_interface : Proc(IUIAutomationVirtualizedItemPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationVirtualizedItemPattern*, UInt32)
    release : Proc(IUIAutomationVirtualizedItemPattern*, UInt32)
    realize : Proc(IUIAutomationVirtualizedItemPattern*, HRESULT)
  end

  IUIAutomationVirtualizedItemPattern_GUID = "6ba3d7a6-04cf-4f11-8793-a8d1cde9969f"
  IID_IUIAutomationVirtualizedItemPattern = LibC::GUID.new(0x6ba3d7a6_u32, 0x4cf_u16, 0x4f11_u16, StaticArray[0x87_u8, 0x93_u8, 0xa8_u8, 0xd1_u8, 0xcd_u8, 0xe9_u8, 0x96_u8, 0x9f_u8])
  struct IUIAutomationVirtualizedItemPattern
    lpVtbl : IUIAutomationVirtualizedItemPatternVTbl*
  end

  struct IUIAutomationAnnotationPatternVTbl
    query_interface : Proc(IUIAutomationAnnotationPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationAnnotationPattern*, UInt32)
    release : Proc(IUIAutomationAnnotationPattern*, UInt32)
    get_current_annotation_type_id : Proc(IUIAutomationAnnotationPattern*, Int32*, HRESULT)
    get_current_annotation_type_name : Proc(IUIAutomationAnnotationPattern*, UInt8**, HRESULT)
    get_current_author : Proc(IUIAutomationAnnotationPattern*, UInt8**, HRESULT)
    get_current_date_time : Proc(IUIAutomationAnnotationPattern*, UInt8**, HRESULT)
    get_current_target : Proc(IUIAutomationAnnotationPattern*, IUIAutomationElement*, HRESULT)
    get_cached_annotation_type_id : Proc(IUIAutomationAnnotationPattern*, Int32*, HRESULT)
    get_cached_annotation_type_name : Proc(IUIAutomationAnnotationPattern*, UInt8**, HRESULT)
    get_cached_author : Proc(IUIAutomationAnnotationPattern*, UInt8**, HRESULT)
    get_cached_date_time : Proc(IUIAutomationAnnotationPattern*, UInt8**, HRESULT)
    get_cached_target : Proc(IUIAutomationAnnotationPattern*, IUIAutomationElement*, HRESULT)
  end

  IUIAutomationAnnotationPattern_GUID = "9a175b21-339e-41b1-8e8b-623f6b681098"
  IID_IUIAutomationAnnotationPattern = LibC::GUID.new(0x9a175b21_u32, 0x339e_u16, 0x41b1_u16, StaticArray[0x8e_u8, 0x8b_u8, 0x62_u8, 0x3f_u8, 0x6b_u8, 0x68_u8, 0x10_u8, 0x98_u8])
  struct IUIAutomationAnnotationPattern
    lpVtbl : IUIAutomationAnnotationPatternVTbl*
  end

  struct IUIAutomationStylesPatternVTbl
    query_interface : Proc(IUIAutomationStylesPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationStylesPattern*, UInt32)
    release : Proc(IUIAutomationStylesPattern*, UInt32)
    get_current_style_id : Proc(IUIAutomationStylesPattern*, Int32*, HRESULT)
    get_current_style_name : Proc(IUIAutomationStylesPattern*, UInt8**, HRESULT)
    get_current_fill_color : Proc(IUIAutomationStylesPattern*, Int32*, HRESULT)
    get_current_fill_pattern_style : Proc(IUIAutomationStylesPattern*, UInt8**, HRESULT)
    get_current_shape : Proc(IUIAutomationStylesPattern*, UInt8**, HRESULT)
    get_current_fill_pattern_color : Proc(IUIAutomationStylesPattern*, Int32*, HRESULT)
    get_current_extended_properties : Proc(IUIAutomationStylesPattern*, UInt8**, HRESULT)
    get_current_extended_properties_as_array : Proc(IUIAutomationStylesPattern*, ExtendedProperty**, Int32*, HRESULT)
    get_cached_style_id : Proc(IUIAutomationStylesPattern*, Int32*, HRESULT)
    get_cached_style_name : Proc(IUIAutomationStylesPattern*, UInt8**, HRESULT)
    get_cached_fill_color : Proc(IUIAutomationStylesPattern*, Int32*, HRESULT)
    get_cached_fill_pattern_style : Proc(IUIAutomationStylesPattern*, UInt8**, HRESULT)
    get_cached_shape : Proc(IUIAutomationStylesPattern*, UInt8**, HRESULT)
    get_cached_fill_pattern_color : Proc(IUIAutomationStylesPattern*, Int32*, HRESULT)
    get_cached_extended_properties : Proc(IUIAutomationStylesPattern*, UInt8**, HRESULT)
    get_cached_extended_properties_as_array : Proc(IUIAutomationStylesPattern*, ExtendedProperty**, Int32*, HRESULT)
  end

  IUIAutomationStylesPattern_GUID = "85b5f0a2-bd79-484a-ad2b-388c9838d5fb"
  IID_IUIAutomationStylesPattern = LibC::GUID.new(0x85b5f0a2_u32, 0xbd79_u16, 0x484a_u16, StaticArray[0xad_u8, 0x2b_u8, 0x38_u8, 0x8c_u8, 0x98_u8, 0x38_u8, 0xd5_u8, 0xfb_u8])
  struct IUIAutomationStylesPattern
    lpVtbl : IUIAutomationStylesPatternVTbl*
  end

  struct IUIAutomationSpreadsheetPatternVTbl
    query_interface : Proc(IUIAutomationSpreadsheetPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationSpreadsheetPattern*, UInt32)
    release : Proc(IUIAutomationSpreadsheetPattern*, UInt32)
    get_item_by_name : Proc(IUIAutomationSpreadsheetPattern*, UInt8*, IUIAutomationElement*, HRESULT)
  end

  IUIAutomationSpreadsheetPattern_GUID = "7517a7c8-faae-4de9-9f08-29b91e8595c1"
  IID_IUIAutomationSpreadsheetPattern = LibC::GUID.new(0x7517a7c8_u32, 0xfaae_u16, 0x4de9_u16, StaticArray[0x9f_u8, 0x8_u8, 0x29_u8, 0xb9_u8, 0x1e_u8, 0x85_u8, 0x95_u8, 0xc1_u8])
  struct IUIAutomationSpreadsheetPattern
    lpVtbl : IUIAutomationSpreadsheetPatternVTbl*
  end

  struct IUIAutomationSpreadsheetItemPatternVTbl
    query_interface : Proc(IUIAutomationSpreadsheetItemPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationSpreadsheetItemPattern*, UInt32)
    release : Proc(IUIAutomationSpreadsheetItemPattern*, UInt32)
    get_current_formula : Proc(IUIAutomationSpreadsheetItemPattern*, UInt8**, HRESULT)
    get_current_annotation_objects : Proc(IUIAutomationSpreadsheetItemPattern*, IUIAutomationElementArray*, HRESULT)
    get_current_annotation_types : Proc(IUIAutomationSpreadsheetItemPattern*, SAFEARRAY**, HRESULT)
    get_cached_formula : Proc(IUIAutomationSpreadsheetItemPattern*, UInt8**, HRESULT)
    get_cached_annotation_objects : Proc(IUIAutomationSpreadsheetItemPattern*, IUIAutomationElementArray*, HRESULT)
    get_cached_annotation_types : Proc(IUIAutomationSpreadsheetItemPattern*, SAFEARRAY**, HRESULT)
  end

  IUIAutomationSpreadsheetItemPattern_GUID = "7d4fb86c-8d34-40e1-8e83-62c15204e335"
  IID_IUIAutomationSpreadsheetItemPattern = LibC::GUID.new(0x7d4fb86c_u32, 0x8d34_u16, 0x40e1_u16, StaticArray[0x8e_u8, 0x83_u8, 0x62_u8, 0xc1_u8, 0x52_u8, 0x4_u8, 0xe3_u8, 0x35_u8])
  struct IUIAutomationSpreadsheetItemPattern
    lpVtbl : IUIAutomationSpreadsheetItemPatternVTbl*
  end

  struct IUIAutomationTransformPattern2VTbl
    query_interface : Proc(IUIAutomationTransformPattern2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTransformPattern2*, UInt32)
    release : Proc(IUIAutomationTransformPattern2*, UInt32)
    move : Proc(IUIAutomationTransformPattern2*, Float64, Float64, HRESULT)
    resize : Proc(IUIAutomationTransformPattern2*, Float64, Float64, HRESULT)
    rotate : Proc(IUIAutomationTransformPattern2*, Float64, HRESULT)
    get_current_can_move : Proc(IUIAutomationTransformPattern2*, LibC::BOOL*, HRESULT)
    get_current_can_resize : Proc(IUIAutomationTransformPattern2*, LibC::BOOL*, HRESULT)
    get_current_can_rotate : Proc(IUIAutomationTransformPattern2*, LibC::BOOL*, HRESULT)
    get_cached_can_move : Proc(IUIAutomationTransformPattern2*, LibC::BOOL*, HRESULT)
    get_cached_can_resize : Proc(IUIAutomationTransformPattern2*, LibC::BOOL*, HRESULT)
    get_cached_can_rotate : Proc(IUIAutomationTransformPattern2*, LibC::BOOL*, HRESULT)
    zoom : Proc(IUIAutomationTransformPattern2*, Float64, HRESULT)
    zoom_by_unit : Proc(IUIAutomationTransformPattern2*, ZoomUnit, HRESULT)
    get_current_can_zoom : Proc(IUIAutomationTransformPattern2*, LibC::BOOL*, HRESULT)
    get_cached_can_zoom : Proc(IUIAutomationTransformPattern2*, LibC::BOOL*, HRESULT)
    get_current_zoom_level : Proc(IUIAutomationTransformPattern2*, Float64*, HRESULT)
    get_cached_zoom_level : Proc(IUIAutomationTransformPattern2*, Float64*, HRESULT)
    get_current_zoom_minimum : Proc(IUIAutomationTransformPattern2*, Float64*, HRESULT)
    get_cached_zoom_minimum : Proc(IUIAutomationTransformPattern2*, Float64*, HRESULT)
    get_current_zoom_maximum : Proc(IUIAutomationTransformPattern2*, Float64*, HRESULT)
    get_cached_zoom_maximum : Proc(IUIAutomationTransformPattern2*, Float64*, HRESULT)
  end

  IUIAutomationTransformPattern2_GUID = "6d74d017-6ecb-4381-b38b-3c17a48ff1c2"
  IID_IUIAutomationTransformPattern2 = LibC::GUID.new(0x6d74d017_u32, 0x6ecb_u16, 0x4381_u16, StaticArray[0xb3_u8, 0x8b_u8, 0x3c_u8, 0x17_u8, 0xa4_u8, 0x8f_u8, 0xf1_u8, 0xc2_u8])
  struct IUIAutomationTransformPattern2
    lpVtbl : IUIAutomationTransformPattern2VTbl*
  end

  struct IUIAutomationTextChildPatternVTbl
    query_interface : Proc(IUIAutomationTextChildPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTextChildPattern*, UInt32)
    release : Proc(IUIAutomationTextChildPattern*, UInt32)
    get_text_container : Proc(IUIAutomationTextChildPattern*, IUIAutomationElement*, HRESULT)
    get_text_range : Proc(IUIAutomationTextChildPattern*, IUIAutomationTextRange*, HRESULT)
  end

  IUIAutomationTextChildPattern_GUID = "6552b038-ae05-40c8-abfd-aa08352aab86"
  IID_IUIAutomationTextChildPattern = LibC::GUID.new(0x6552b038_u32, 0xae05_u16, 0x40c8_u16, StaticArray[0xab_u8, 0xfd_u8, 0xaa_u8, 0x8_u8, 0x35_u8, 0x2a_u8, 0xab_u8, 0x86_u8])
  struct IUIAutomationTextChildPattern
    lpVtbl : IUIAutomationTextChildPatternVTbl*
  end

  struct IUIAutomationDragPatternVTbl
    query_interface : Proc(IUIAutomationDragPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationDragPattern*, UInt32)
    release : Proc(IUIAutomationDragPattern*, UInt32)
    get_current_is_grabbed : Proc(IUIAutomationDragPattern*, LibC::BOOL*, HRESULT)
    get_cached_is_grabbed : Proc(IUIAutomationDragPattern*, LibC::BOOL*, HRESULT)
    get_current_drop_effect : Proc(IUIAutomationDragPattern*, UInt8**, HRESULT)
    get_cached_drop_effect : Proc(IUIAutomationDragPattern*, UInt8**, HRESULT)
    get_current_drop_effects : Proc(IUIAutomationDragPattern*, SAFEARRAY**, HRESULT)
    get_cached_drop_effects : Proc(IUIAutomationDragPattern*, SAFEARRAY**, HRESULT)
    get_current_grabbed_items : Proc(IUIAutomationDragPattern*, IUIAutomationElementArray*, HRESULT)
    get_cached_grabbed_items : Proc(IUIAutomationDragPattern*, IUIAutomationElementArray*, HRESULT)
  end

  IUIAutomationDragPattern_GUID = "1dc7b570-1f54-4bad-bcda-d36a722fb7bd"
  IID_IUIAutomationDragPattern = LibC::GUID.new(0x1dc7b570_u32, 0x1f54_u16, 0x4bad_u16, StaticArray[0xbc_u8, 0xda_u8, 0xd3_u8, 0x6a_u8, 0x72_u8, 0x2f_u8, 0xb7_u8, 0xbd_u8])
  struct IUIAutomationDragPattern
    lpVtbl : IUIAutomationDragPatternVTbl*
  end

  struct IUIAutomationDropTargetPatternVTbl
    query_interface : Proc(IUIAutomationDropTargetPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationDropTargetPattern*, UInt32)
    release : Proc(IUIAutomationDropTargetPattern*, UInt32)
    get_current_drop_target_effect : Proc(IUIAutomationDropTargetPattern*, UInt8**, HRESULT)
    get_cached_drop_target_effect : Proc(IUIAutomationDropTargetPattern*, UInt8**, HRESULT)
    get_current_drop_target_effects : Proc(IUIAutomationDropTargetPattern*, SAFEARRAY**, HRESULT)
    get_cached_drop_target_effects : Proc(IUIAutomationDropTargetPattern*, SAFEARRAY**, HRESULT)
  end

  IUIAutomationDropTargetPattern_GUID = "69a095f7-eee4-430e-a46b-fb73b1ae39a5"
  IID_IUIAutomationDropTargetPattern = LibC::GUID.new(0x69a095f7_u32, 0xeee4_u16, 0x430e_u16, StaticArray[0xa4_u8, 0x6b_u8, 0xfb_u8, 0x73_u8, 0xb1_u8, 0xae_u8, 0x39_u8, 0xa5_u8])
  struct IUIAutomationDropTargetPattern
    lpVtbl : IUIAutomationDropTargetPatternVTbl*
  end

  struct IUIAutomationElement2VTbl
    query_interface : Proc(IUIAutomationElement2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationElement2*, UInt32)
    release : Proc(IUIAutomationElement2*, UInt32)
    set_focus : Proc(IUIAutomationElement2*, HRESULT)
    get_runtime_id : Proc(IUIAutomationElement2*, SAFEARRAY**, HRESULT)
    find_first : Proc(IUIAutomationElement2*, TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)
    find_all : Proc(IUIAutomationElement2*, TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)
    find_first_build_cache : Proc(IUIAutomationElement2*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    find_all_build_cache : Proc(IUIAutomationElement2*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)
    build_updated_cache : Proc(IUIAutomationElement2*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_current_property_value : Proc(IUIAutomationElement2*, Int32, VARIANT*, HRESULT)
    get_current_property_value_ex : Proc(IUIAutomationElement2*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_cached_property_value : Proc(IUIAutomationElement2*, Int32, VARIANT*, HRESULT)
    get_cached_property_value_ex : Proc(IUIAutomationElement2*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_current_pattern_as : Proc(IUIAutomationElement2*, Int32, Guid*, Void**, HRESULT)
    get_cached_pattern_as : Proc(IUIAutomationElement2*, Int32, Guid*, Void**, HRESULT)
    get_current_pattern : Proc(IUIAutomationElement2*, Int32, IUnknown*, HRESULT)
    get_cached_pattern : Proc(IUIAutomationElement2*, Int32, IUnknown*, HRESULT)
    get_cached_parent : Proc(IUIAutomationElement2*, IUIAutomationElement*, HRESULT)
    get_cached_children : Proc(IUIAutomationElement2*, IUIAutomationElementArray*, HRESULT)
    get_current_process_id : Proc(IUIAutomationElement2*, Int32*, HRESULT)
    get_current_control_type : Proc(IUIAutomationElement2*, Int32*, HRESULT)
    get_current_localized_control_type : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_current_name : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_current_accelerator_key : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_current_access_key : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_current_has_keyboard_focus : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_current_is_keyboard_focusable : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_current_is_enabled : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_current_automation_id : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_current_class_name : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_current_help_text : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_current_culture : Proc(IUIAutomationElement2*, Int32*, HRESULT)
    get_current_is_control_element : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_current_is_content_element : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_current_is_password : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_current_native_window_handle : Proc(IUIAutomationElement2*, LibC::HANDLE, HRESULT)
    get_current_item_type : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_current_is_offscreen : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_current_orientation : Proc(IUIAutomationElement2*, OrientationType*, HRESULT)
    get_current_framework_id : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_current_is_required_for_form : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_current_item_status : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_current_bounding_rectangle : Proc(IUIAutomationElement2*, RECT*, HRESULT)
    get_current_labeled_by : Proc(IUIAutomationElement2*, IUIAutomationElement*, HRESULT)
    get_current_aria_role : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_current_aria_properties : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_current_is_data_valid_for_form : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_current_controller_for : Proc(IUIAutomationElement2*, IUIAutomationElementArray*, HRESULT)
    get_current_described_by : Proc(IUIAutomationElement2*, IUIAutomationElementArray*, HRESULT)
    get_current_flows_to : Proc(IUIAutomationElement2*, IUIAutomationElementArray*, HRESULT)
    get_current_provider_description : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_cached_process_id : Proc(IUIAutomationElement2*, Int32*, HRESULT)
    get_cached_control_type : Proc(IUIAutomationElement2*, Int32*, HRESULT)
    get_cached_localized_control_type : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_cached_name : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_cached_accelerator_key : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_cached_access_key : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_cached_has_keyboard_focus : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_cached_is_keyboard_focusable : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_cached_is_enabled : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_cached_automation_id : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_cached_class_name : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_cached_help_text : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_cached_culture : Proc(IUIAutomationElement2*, Int32*, HRESULT)
    get_cached_is_control_element : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_cached_is_content_element : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_cached_is_password : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_cached_native_window_handle : Proc(IUIAutomationElement2*, LibC::HANDLE, HRESULT)
    get_cached_item_type : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_cached_is_offscreen : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_cached_orientation : Proc(IUIAutomationElement2*, OrientationType*, HRESULT)
    get_cached_framework_id : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_cached_is_required_for_form : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_cached_item_status : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_cached_bounding_rectangle : Proc(IUIAutomationElement2*, RECT*, HRESULT)
    get_cached_labeled_by : Proc(IUIAutomationElement2*, IUIAutomationElement*, HRESULT)
    get_cached_aria_role : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_cached_aria_properties : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_cached_is_data_valid_for_form : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_cached_controller_for : Proc(IUIAutomationElement2*, IUIAutomationElementArray*, HRESULT)
    get_cached_described_by : Proc(IUIAutomationElement2*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_to : Proc(IUIAutomationElement2*, IUIAutomationElementArray*, HRESULT)
    get_cached_provider_description : Proc(IUIAutomationElement2*, UInt8**, HRESULT)
    get_clickable_point : Proc(IUIAutomationElement2*, POINT*, LibC::BOOL*, HRESULT)
    get_current_optimize_for_visual_content : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_cached_optimize_for_visual_content : Proc(IUIAutomationElement2*, LibC::BOOL*, HRESULT)
    get_current_live_setting : Proc(IUIAutomationElement2*, LiveSetting*, HRESULT)
    get_cached_live_setting : Proc(IUIAutomationElement2*, LiveSetting*, HRESULT)
    get_current_flows_from : Proc(IUIAutomationElement2*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_from : Proc(IUIAutomationElement2*, IUIAutomationElementArray*, HRESULT)
  end

  IUIAutomationElement2_GUID = "6749c683-f70d-4487-a698-5f79d55290d6"
  IID_IUIAutomationElement2 = LibC::GUID.new(0x6749c683_u32, 0xf70d_u16, 0x4487_u16, StaticArray[0xa6_u8, 0x98_u8, 0x5f_u8, 0x79_u8, 0xd5_u8, 0x52_u8, 0x90_u8, 0xd6_u8])
  struct IUIAutomationElement2
    lpVtbl : IUIAutomationElement2VTbl*
  end

  struct IUIAutomationElement3VTbl
    query_interface : Proc(IUIAutomationElement3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationElement3*, UInt32)
    release : Proc(IUIAutomationElement3*, UInt32)
    set_focus : Proc(IUIAutomationElement3*, HRESULT)
    get_runtime_id : Proc(IUIAutomationElement3*, SAFEARRAY**, HRESULT)
    find_first : Proc(IUIAutomationElement3*, TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)
    find_all : Proc(IUIAutomationElement3*, TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)
    find_first_build_cache : Proc(IUIAutomationElement3*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    find_all_build_cache : Proc(IUIAutomationElement3*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)
    build_updated_cache : Proc(IUIAutomationElement3*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_current_property_value : Proc(IUIAutomationElement3*, Int32, VARIANT*, HRESULT)
    get_current_property_value_ex : Proc(IUIAutomationElement3*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_cached_property_value : Proc(IUIAutomationElement3*, Int32, VARIANT*, HRESULT)
    get_cached_property_value_ex : Proc(IUIAutomationElement3*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_current_pattern_as : Proc(IUIAutomationElement3*, Int32, Guid*, Void**, HRESULT)
    get_cached_pattern_as : Proc(IUIAutomationElement3*, Int32, Guid*, Void**, HRESULT)
    get_current_pattern : Proc(IUIAutomationElement3*, Int32, IUnknown*, HRESULT)
    get_cached_pattern : Proc(IUIAutomationElement3*, Int32, IUnknown*, HRESULT)
    get_cached_parent : Proc(IUIAutomationElement3*, IUIAutomationElement*, HRESULT)
    get_cached_children : Proc(IUIAutomationElement3*, IUIAutomationElementArray*, HRESULT)
    get_current_process_id : Proc(IUIAutomationElement3*, Int32*, HRESULT)
    get_current_control_type : Proc(IUIAutomationElement3*, Int32*, HRESULT)
    get_current_localized_control_type : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_current_name : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_current_accelerator_key : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_current_access_key : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_current_has_keyboard_focus : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_current_is_keyboard_focusable : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_current_is_enabled : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_current_automation_id : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_current_class_name : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_current_help_text : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_current_culture : Proc(IUIAutomationElement3*, Int32*, HRESULT)
    get_current_is_control_element : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_current_is_content_element : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_current_is_password : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_current_native_window_handle : Proc(IUIAutomationElement3*, LibC::HANDLE, HRESULT)
    get_current_item_type : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_current_is_offscreen : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_current_orientation : Proc(IUIAutomationElement3*, OrientationType*, HRESULT)
    get_current_framework_id : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_current_is_required_for_form : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_current_item_status : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_current_bounding_rectangle : Proc(IUIAutomationElement3*, RECT*, HRESULT)
    get_current_labeled_by : Proc(IUIAutomationElement3*, IUIAutomationElement*, HRESULT)
    get_current_aria_role : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_current_aria_properties : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_current_is_data_valid_for_form : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_current_controller_for : Proc(IUIAutomationElement3*, IUIAutomationElementArray*, HRESULT)
    get_current_described_by : Proc(IUIAutomationElement3*, IUIAutomationElementArray*, HRESULT)
    get_current_flows_to : Proc(IUIAutomationElement3*, IUIAutomationElementArray*, HRESULT)
    get_current_provider_description : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_cached_process_id : Proc(IUIAutomationElement3*, Int32*, HRESULT)
    get_cached_control_type : Proc(IUIAutomationElement3*, Int32*, HRESULT)
    get_cached_localized_control_type : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_cached_name : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_cached_accelerator_key : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_cached_access_key : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_cached_has_keyboard_focus : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_cached_is_keyboard_focusable : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_cached_is_enabled : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_cached_automation_id : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_cached_class_name : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_cached_help_text : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_cached_culture : Proc(IUIAutomationElement3*, Int32*, HRESULT)
    get_cached_is_control_element : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_cached_is_content_element : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_cached_is_password : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_cached_native_window_handle : Proc(IUIAutomationElement3*, LibC::HANDLE, HRESULT)
    get_cached_item_type : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_cached_is_offscreen : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_cached_orientation : Proc(IUIAutomationElement3*, OrientationType*, HRESULT)
    get_cached_framework_id : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_cached_is_required_for_form : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_cached_item_status : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_cached_bounding_rectangle : Proc(IUIAutomationElement3*, RECT*, HRESULT)
    get_cached_labeled_by : Proc(IUIAutomationElement3*, IUIAutomationElement*, HRESULT)
    get_cached_aria_role : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_cached_aria_properties : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_cached_is_data_valid_for_form : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_cached_controller_for : Proc(IUIAutomationElement3*, IUIAutomationElementArray*, HRESULT)
    get_cached_described_by : Proc(IUIAutomationElement3*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_to : Proc(IUIAutomationElement3*, IUIAutomationElementArray*, HRESULT)
    get_cached_provider_description : Proc(IUIAutomationElement3*, UInt8**, HRESULT)
    get_clickable_point : Proc(IUIAutomationElement3*, POINT*, LibC::BOOL*, HRESULT)
    get_current_optimize_for_visual_content : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_cached_optimize_for_visual_content : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_current_live_setting : Proc(IUIAutomationElement3*, LiveSetting*, HRESULT)
    get_cached_live_setting : Proc(IUIAutomationElement3*, LiveSetting*, HRESULT)
    get_current_flows_from : Proc(IUIAutomationElement3*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_from : Proc(IUIAutomationElement3*, IUIAutomationElementArray*, HRESULT)
    show_context_menu : Proc(IUIAutomationElement3*, HRESULT)
    get_current_is_peripheral : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
    get_cached_is_peripheral : Proc(IUIAutomationElement3*, LibC::BOOL*, HRESULT)
  end

  IUIAutomationElement3_GUID = "8471df34-aee0-4a01-a7de-7db9af12c296"
  IID_IUIAutomationElement3 = LibC::GUID.new(0x8471df34_u32, 0xaee0_u16, 0x4a01_u16, StaticArray[0xa7_u8, 0xde_u8, 0x7d_u8, 0xb9_u8, 0xaf_u8, 0x12_u8, 0xc2_u8, 0x96_u8])
  struct IUIAutomationElement3
    lpVtbl : IUIAutomationElement3VTbl*
  end

  struct IUIAutomationElement4VTbl
    query_interface : Proc(IUIAutomationElement4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationElement4*, UInt32)
    release : Proc(IUIAutomationElement4*, UInt32)
    set_focus : Proc(IUIAutomationElement4*, HRESULT)
    get_runtime_id : Proc(IUIAutomationElement4*, SAFEARRAY**, HRESULT)
    find_first : Proc(IUIAutomationElement4*, TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)
    find_all : Proc(IUIAutomationElement4*, TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)
    find_first_build_cache : Proc(IUIAutomationElement4*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    find_all_build_cache : Proc(IUIAutomationElement4*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)
    build_updated_cache : Proc(IUIAutomationElement4*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_current_property_value : Proc(IUIAutomationElement4*, Int32, VARIANT*, HRESULT)
    get_current_property_value_ex : Proc(IUIAutomationElement4*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_cached_property_value : Proc(IUIAutomationElement4*, Int32, VARIANT*, HRESULT)
    get_cached_property_value_ex : Proc(IUIAutomationElement4*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_current_pattern_as : Proc(IUIAutomationElement4*, Int32, Guid*, Void**, HRESULT)
    get_cached_pattern_as : Proc(IUIAutomationElement4*, Int32, Guid*, Void**, HRESULT)
    get_current_pattern : Proc(IUIAutomationElement4*, Int32, IUnknown*, HRESULT)
    get_cached_pattern : Proc(IUIAutomationElement4*, Int32, IUnknown*, HRESULT)
    get_cached_parent : Proc(IUIAutomationElement4*, IUIAutomationElement*, HRESULT)
    get_cached_children : Proc(IUIAutomationElement4*, IUIAutomationElementArray*, HRESULT)
    get_current_process_id : Proc(IUIAutomationElement4*, Int32*, HRESULT)
    get_current_control_type : Proc(IUIAutomationElement4*, Int32*, HRESULT)
    get_current_localized_control_type : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_current_name : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_current_accelerator_key : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_current_access_key : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_current_has_keyboard_focus : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_current_is_keyboard_focusable : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_current_is_enabled : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_current_automation_id : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_current_class_name : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_current_help_text : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_current_culture : Proc(IUIAutomationElement4*, Int32*, HRESULT)
    get_current_is_control_element : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_current_is_content_element : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_current_is_password : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_current_native_window_handle : Proc(IUIAutomationElement4*, LibC::HANDLE, HRESULT)
    get_current_item_type : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_current_is_offscreen : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_current_orientation : Proc(IUIAutomationElement4*, OrientationType*, HRESULT)
    get_current_framework_id : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_current_is_required_for_form : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_current_item_status : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_current_bounding_rectangle : Proc(IUIAutomationElement4*, RECT*, HRESULT)
    get_current_labeled_by : Proc(IUIAutomationElement4*, IUIAutomationElement*, HRESULT)
    get_current_aria_role : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_current_aria_properties : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_current_is_data_valid_for_form : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_current_controller_for : Proc(IUIAutomationElement4*, IUIAutomationElementArray*, HRESULT)
    get_current_described_by : Proc(IUIAutomationElement4*, IUIAutomationElementArray*, HRESULT)
    get_current_flows_to : Proc(IUIAutomationElement4*, IUIAutomationElementArray*, HRESULT)
    get_current_provider_description : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_cached_process_id : Proc(IUIAutomationElement4*, Int32*, HRESULT)
    get_cached_control_type : Proc(IUIAutomationElement4*, Int32*, HRESULT)
    get_cached_localized_control_type : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_cached_name : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_cached_accelerator_key : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_cached_access_key : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_cached_has_keyboard_focus : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_cached_is_keyboard_focusable : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_cached_is_enabled : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_cached_automation_id : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_cached_class_name : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_cached_help_text : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_cached_culture : Proc(IUIAutomationElement4*, Int32*, HRESULT)
    get_cached_is_control_element : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_cached_is_content_element : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_cached_is_password : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_cached_native_window_handle : Proc(IUIAutomationElement4*, LibC::HANDLE, HRESULT)
    get_cached_item_type : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_cached_is_offscreen : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_cached_orientation : Proc(IUIAutomationElement4*, OrientationType*, HRESULT)
    get_cached_framework_id : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_cached_is_required_for_form : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_cached_item_status : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_cached_bounding_rectangle : Proc(IUIAutomationElement4*, RECT*, HRESULT)
    get_cached_labeled_by : Proc(IUIAutomationElement4*, IUIAutomationElement*, HRESULT)
    get_cached_aria_role : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_cached_aria_properties : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_cached_is_data_valid_for_form : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_cached_controller_for : Proc(IUIAutomationElement4*, IUIAutomationElementArray*, HRESULT)
    get_cached_described_by : Proc(IUIAutomationElement4*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_to : Proc(IUIAutomationElement4*, IUIAutomationElementArray*, HRESULT)
    get_cached_provider_description : Proc(IUIAutomationElement4*, UInt8**, HRESULT)
    get_clickable_point : Proc(IUIAutomationElement4*, POINT*, LibC::BOOL*, HRESULT)
    get_current_optimize_for_visual_content : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_cached_optimize_for_visual_content : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_current_live_setting : Proc(IUIAutomationElement4*, LiveSetting*, HRESULT)
    get_cached_live_setting : Proc(IUIAutomationElement4*, LiveSetting*, HRESULT)
    get_current_flows_from : Proc(IUIAutomationElement4*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_from : Proc(IUIAutomationElement4*, IUIAutomationElementArray*, HRESULT)
    show_context_menu : Proc(IUIAutomationElement4*, HRESULT)
    get_current_is_peripheral : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_cached_is_peripheral : Proc(IUIAutomationElement4*, LibC::BOOL*, HRESULT)
    get_current_position_in_set : Proc(IUIAutomationElement4*, Int32*, HRESULT)
    get_current_size_of_set : Proc(IUIAutomationElement4*, Int32*, HRESULT)
    get_current_level : Proc(IUIAutomationElement4*, Int32*, HRESULT)
    get_current_annotation_types : Proc(IUIAutomationElement4*, SAFEARRAY**, HRESULT)
    get_current_annotation_objects : Proc(IUIAutomationElement4*, IUIAutomationElementArray*, HRESULT)
    get_cached_position_in_set : Proc(IUIAutomationElement4*, Int32*, HRESULT)
    get_cached_size_of_set : Proc(IUIAutomationElement4*, Int32*, HRESULT)
    get_cached_level : Proc(IUIAutomationElement4*, Int32*, HRESULT)
    get_cached_annotation_types : Proc(IUIAutomationElement4*, SAFEARRAY**, HRESULT)
    get_cached_annotation_objects : Proc(IUIAutomationElement4*, IUIAutomationElementArray*, HRESULT)
  end

  IUIAutomationElement4_GUID = "3b6e233c-52fb-4063-a4c9-77c075c2a06b"
  IID_IUIAutomationElement4 = LibC::GUID.new(0x3b6e233c_u32, 0x52fb_u16, 0x4063_u16, StaticArray[0xa4_u8, 0xc9_u8, 0x77_u8, 0xc0_u8, 0x75_u8, 0xc2_u8, 0xa0_u8, 0x6b_u8])
  struct IUIAutomationElement4
    lpVtbl : IUIAutomationElement4VTbl*
  end

  struct IUIAutomationElement5VTbl
    query_interface : Proc(IUIAutomationElement5*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationElement5*, UInt32)
    release : Proc(IUIAutomationElement5*, UInt32)
    set_focus : Proc(IUIAutomationElement5*, HRESULT)
    get_runtime_id : Proc(IUIAutomationElement5*, SAFEARRAY**, HRESULT)
    find_first : Proc(IUIAutomationElement5*, TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)
    find_all : Proc(IUIAutomationElement5*, TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)
    find_first_build_cache : Proc(IUIAutomationElement5*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    find_all_build_cache : Proc(IUIAutomationElement5*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)
    build_updated_cache : Proc(IUIAutomationElement5*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_current_property_value : Proc(IUIAutomationElement5*, Int32, VARIANT*, HRESULT)
    get_current_property_value_ex : Proc(IUIAutomationElement5*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_cached_property_value : Proc(IUIAutomationElement5*, Int32, VARIANT*, HRESULT)
    get_cached_property_value_ex : Proc(IUIAutomationElement5*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_current_pattern_as : Proc(IUIAutomationElement5*, Int32, Guid*, Void**, HRESULT)
    get_cached_pattern_as : Proc(IUIAutomationElement5*, Int32, Guid*, Void**, HRESULT)
    get_current_pattern : Proc(IUIAutomationElement5*, Int32, IUnknown*, HRESULT)
    get_cached_pattern : Proc(IUIAutomationElement5*, Int32, IUnknown*, HRESULT)
    get_cached_parent : Proc(IUIAutomationElement5*, IUIAutomationElement*, HRESULT)
    get_cached_children : Proc(IUIAutomationElement5*, IUIAutomationElementArray*, HRESULT)
    get_current_process_id : Proc(IUIAutomationElement5*, Int32*, HRESULT)
    get_current_control_type : Proc(IUIAutomationElement5*, Int32*, HRESULT)
    get_current_localized_control_type : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_current_name : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_current_accelerator_key : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_current_access_key : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_current_has_keyboard_focus : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_current_is_keyboard_focusable : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_current_is_enabled : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_current_automation_id : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_current_class_name : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_current_help_text : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_current_culture : Proc(IUIAutomationElement5*, Int32*, HRESULT)
    get_current_is_control_element : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_current_is_content_element : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_current_is_password : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_current_native_window_handle : Proc(IUIAutomationElement5*, LibC::HANDLE, HRESULT)
    get_current_item_type : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_current_is_offscreen : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_current_orientation : Proc(IUIAutomationElement5*, OrientationType*, HRESULT)
    get_current_framework_id : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_current_is_required_for_form : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_current_item_status : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_current_bounding_rectangle : Proc(IUIAutomationElement5*, RECT*, HRESULT)
    get_current_labeled_by : Proc(IUIAutomationElement5*, IUIAutomationElement*, HRESULT)
    get_current_aria_role : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_current_aria_properties : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_current_is_data_valid_for_form : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_current_controller_for : Proc(IUIAutomationElement5*, IUIAutomationElementArray*, HRESULT)
    get_current_described_by : Proc(IUIAutomationElement5*, IUIAutomationElementArray*, HRESULT)
    get_current_flows_to : Proc(IUIAutomationElement5*, IUIAutomationElementArray*, HRESULT)
    get_current_provider_description : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_cached_process_id : Proc(IUIAutomationElement5*, Int32*, HRESULT)
    get_cached_control_type : Proc(IUIAutomationElement5*, Int32*, HRESULT)
    get_cached_localized_control_type : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_cached_name : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_cached_accelerator_key : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_cached_access_key : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_cached_has_keyboard_focus : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_cached_is_keyboard_focusable : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_cached_is_enabled : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_cached_automation_id : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_cached_class_name : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_cached_help_text : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_cached_culture : Proc(IUIAutomationElement5*, Int32*, HRESULT)
    get_cached_is_control_element : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_cached_is_content_element : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_cached_is_password : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_cached_native_window_handle : Proc(IUIAutomationElement5*, LibC::HANDLE, HRESULT)
    get_cached_item_type : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_cached_is_offscreen : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_cached_orientation : Proc(IUIAutomationElement5*, OrientationType*, HRESULT)
    get_cached_framework_id : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_cached_is_required_for_form : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_cached_item_status : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_cached_bounding_rectangle : Proc(IUIAutomationElement5*, RECT*, HRESULT)
    get_cached_labeled_by : Proc(IUIAutomationElement5*, IUIAutomationElement*, HRESULT)
    get_cached_aria_role : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_cached_aria_properties : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_cached_is_data_valid_for_form : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_cached_controller_for : Proc(IUIAutomationElement5*, IUIAutomationElementArray*, HRESULT)
    get_cached_described_by : Proc(IUIAutomationElement5*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_to : Proc(IUIAutomationElement5*, IUIAutomationElementArray*, HRESULT)
    get_cached_provider_description : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_clickable_point : Proc(IUIAutomationElement5*, POINT*, LibC::BOOL*, HRESULT)
    get_current_optimize_for_visual_content : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_cached_optimize_for_visual_content : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_current_live_setting : Proc(IUIAutomationElement5*, LiveSetting*, HRESULT)
    get_cached_live_setting : Proc(IUIAutomationElement5*, LiveSetting*, HRESULT)
    get_current_flows_from : Proc(IUIAutomationElement5*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_from : Proc(IUIAutomationElement5*, IUIAutomationElementArray*, HRESULT)
    show_context_menu : Proc(IUIAutomationElement5*, HRESULT)
    get_current_is_peripheral : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_cached_is_peripheral : Proc(IUIAutomationElement5*, LibC::BOOL*, HRESULT)
    get_current_position_in_set : Proc(IUIAutomationElement5*, Int32*, HRESULT)
    get_current_size_of_set : Proc(IUIAutomationElement5*, Int32*, HRESULT)
    get_current_level : Proc(IUIAutomationElement5*, Int32*, HRESULT)
    get_current_annotation_types : Proc(IUIAutomationElement5*, SAFEARRAY**, HRESULT)
    get_current_annotation_objects : Proc(IUIAutomationElement5*, IUIAutomationElementArray*, HRESULT)
    get_cached_position_in_set : Proc(IUIAutomationElement5*, Int32*, HRESULT)
    get_cached_size_of_set : Proc(IUIAutomationElement5*, Int32*, HRESULT)
    get_cached_level : Proc(IUIAutomationElement5*, Int32*, HRESULT)
    get_cached_annotation_types : Proc(IUIAutomationElement5*, SAFEARRAY**, HRESULT)
    get_cached_annotation_objects : Proc(IUIAutomationElement5*, IUIAutomationElementArray*, HRESULT)
    get_current_landmark_type : Proc(IUIAutomationElement5*, Int32*, HRESULT)
    get_current_localized_landmark_type : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
    get_cached_landmark_type : Proc(IUIAutomationElement5*, Int32*, HRESULT)
    get_cached_localized_landmark_type : Proc(IUIAutomationElement5*, UInt8**, HRESULT)
  end

  IUIAutomationElement5_GUID = "98141c1d-0d0e-4175-bbe2-6bff455842a7"
  IID_IUIAutomationElement5 = LibC::GUID.new(0x98141c1d_u32, 0xd0e_u16, 0x4175_u16, StaticArray[0xbb_u8, 0xe2_u8, 0x6b_u8, 0xff_u8, 0x45_u8, 0x58_u8, 0x42_u8, 0xa7_u8])
  struct IUIAutomationElement5
    lpVtbl : IUIAutomationElement5VTbl*
  end

  struct IUIAutomationElement6VTbl
    query_interface : Proc(IUIAutomationElement6*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationElement6*, UInt32)
    release : Proc(IUIAutomationElement6*, UInt32)
    set_focus : Proc(IUIAutomationElement6*, HRESULT)
    get_runtime_id : Proc(IUIAutomationElement6*, SAFEARRAY**, HRESULT)
    find_first : Proc(IUIAutomationElement6*, TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)
    find_all : Proc(IUIAutomationElement6*, TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)
    find_first_build_cache : Proc(IUIAutomationElement6*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    find_all_build_cache : Proc(IUIAutomationElement6*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)
    build_updated_cache : Proc(IUIAutomationElement6*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_current_property_value : Proc(IUIAutomationElement6*, Int32, VARIANT*, HRESULT)
    get_current_property_value_ex : Proc(IUIAutomationElement6*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_cached_property_value : Proc(IUIAutomationElement6*, Int32, VARIANT*, HRESULT)
    get_cached_property_value_ex : Proc(IUIAutomationElement6*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_current_pattern_as : Proc(IUIAutomationElement6*, Int32, Guid*, Void**, HRESULT)
    get_cached_pattern_as : Proc(IUIAutomationElement6*, Int32, Guid*, Void**, HRESULT)
    get_current_pattern : Proc(IUIAutomationElement6*, Int32, IUnknown*, HRESULT)
    get_cached_pattern : Proc(IUIAutomationElement6*, Int32, IUnknown*, HRESULT)
    get_cached_parent : Proc(IUIAutomationElement6*, IUIAutomationElement*, HRESULT)
    get_cached_children : Proc(IUIAutomationElement6*, IUIAutomationElementArray*, HRESULT)
    get_current_process_id : Proc(IUIAutomationElement6*, Int32*, HRESULT)
    get_current_control_type : Proc(IUIAutomationElement6*, Int32*, HRESULT)
    get_current_localized_control_type : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_current_name : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_current_accelerator_key : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_current_access_key : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_current_has_keyboard_focus : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_current_is_keyboard_focusable : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_current_is_enabled : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_current_automation_id : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_current_class_name : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_current_help_text : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_current_culture : Proc(IUIAutomationElement6*, Int32*, HRESULT)
    get_current_is_control_element : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_current_is_content_element : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_current_is_password : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_current_native_window_handle : Proc(IUIAutomationElement6*, LibC::HANDLE, HRESULT)
    get_current_item_type : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_current_is_offscreen : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_current_orientation : Proc(IUIAutomationElement6*, OrientationType*, HRESULT)
    get_current_framework_id : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_current_is_required_for_form : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_current_item_status : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_current_bounding_rectangle : Proc(IUIAutomationElement6*, RECT*, HRESULT)
    get_current_labeled_by : Proc(IUIAutomationElement6*, IUIAutomationElement*, HRESULT)
    get_current_aria_role : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_current_aria_properties : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_current_is_data_valid_for_form : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_current_controller_for : Proc(IUIAutomationElement6*, IUIAutomationElementArray*, HRESULT)
    get_current_described_by : Proc(IUIAutomationElement6*, IUIAutomationElementArray*, HRESULT)
    get_current_flows_to : Proc(IUIAutomationElement6*, IUIAutomationElementArray*, HRESULT)
    get_current_provider_description : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_process_id : Proc(IUIAutomationElement6*, Int32*, HRESULT)
    get_cached_control_type : Proc(IUIAutomationElement6*, Int32*, HRESULT)
    get_cached_localized_control_type : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_name : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_accelerator_key : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_access_key : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_has_keyboard_focus : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_cached_is_keyboard_focusable : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_cached_is_enabled : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_cached_automation_id : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_class_name : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_help_text : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_culture : Proc(IUIAutomationElement6*, Int32*, HRESULT)
    get_cached_is_control_element : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_cached_is_content_element : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_cached_is_password : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_cached_native_window_handle : Proc(IUIAutomationElement6*, LibC::HANDLE, HRESULT)
    get_cached_item_type : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_is_offscreen : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_cached_orientation : Proc(IUIAutomationElement6*, OrientationType*, HRESULT)
    get_cached_framework_id : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_is_required_for_form : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_cached_item_status : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_bounding_rectangle : Proc(IUIAutomationElement6*, RECT*, HRESULT)
    get_cached_labeled_by : Proc(IUIAutomationElement6*, IUIAutomationElement*, HRESULT)
    get_cached_aria_role : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_aria_properties : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_is_data_valid_for_form : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_cached_controller_for : Proc(IUIAutomationElement6*, IUIAutomationElementArray*, HRESULT)
    get_cached_described_by : Proc(IUIAutomationElement6*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_to : Proc(IUIAutomationElement6*, IUIAutomationElementArray*, HRESULT)
    get_cached_provider_description : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_clickable_point : Proc(IUIAutomationElement6*, POINT*, LibC::BOOL*, HRESULT)
    get_current_optimize_for_visual_content : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_cached_optimize_for_visual_content : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_current_live_setting : Proc(IUIAutomationElement6*, LiveSetting*, HRESULT)
    get_cached_live_setting : Proc(IUIAutomationElement6*, LiveSetting*, HRESULT)
    get_current_flows_from : Proc(IUIAutomationElement6*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_from : Proc(IUIAutomationElement6*, IUIAutomationElementArray*, HRESULT)
    show_context_menu : Proc(IUIAutomationElement6*, HRESULT)
    get_current_is_peripheral : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_cached_is_peripheral : Proc(IUIAutomationElement6*, LibC::BOOL*, HRESULT)
    get_current_position_in_set : Proc(IUIAutomationElement6*, Int32*, HRESULT)
    get_current_size_of_set : Proc(IUIAutomationElement6*, Int32*, HRESULT)
    get_current_level : Proc(IUIAutomationElement6*, Int32*, HRESULT)
    get_current_annotation_types : Proc(IUIAutomationElement6*, SAFEARRAY**, HRESULT)
    get_current_annotation_objects : Proc(IUIAutomationElement6*, IUIAutomationElementArray*, HRESULT)
    get_cached_position_in_set : Proc(IUIAutomationElement6*, Int32*, HRESULT)
    get_cached_size_of_set : Proc(IUIAutomationElement6*, Int32*, HRESULT)
    get_cached_level : Proc(IUIAutomationElement6*, Int32*, HRESULT)
    get_cached_annotation_types : Proc(IUIAutomationElement6*, SAFEARRAY**, HRESULT)
    get_cached_annotation_objects : Proc(IUIAutomationElement6*, IUIAutomationElementArray*, HRESULT)
    get_current_landmark_type : Proc(IUIAutomationElement6*, Int32*, HRESULT)
    get_current_localized_landmark_type : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_landmark_type : Proc(IUIAutomationElement6*, Int32*, HRESULT)
    get_cached_localized_landmark_type : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_current_full_description : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
    get_cached_full_description : Proc(IUIAutomationElement6*, UInt8**, HRESULT)
  end

  IUIAutomationElement6_GUID = "4780d450-8bca-4977-afa5-a4a517f555e3"
  IID_IUIAutomationElement6 = LibC::GUID.new(0x4780d450_u32, 0x8bca_u16, 0x4977_u16, StaticArray[0xaf_u8, 0xa5_u8, 0xa4_u8, 0xa5_u8, 0x17_u8, 0xf5_u8, 0x55_u8, 0xe3_u8])
  struct IUIAutomationElement6
    lpVtbl : IUIAutomationElement6VTbl*
  end

  struct IUIAutomationElement7VTbl
    query_interface : Proc(IUIAutomationElement7*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationElement7*, UInt32)
    release : Proc(IUIAutomationElement7*, UInt32)
    set_focus : Proc(IUIAutomationElement7*, HRESULT)
    get_runtime_id : Proc(IUIAutomationElement7*, SAFEARRAY**, HRESULT)
    find_first : Proc(IUIAutomationElement7*, TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)
    find_all : Proc(IUIAutomationElement7*, TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)
    find_first_build_cache : Proc(IUIAutomationElement7*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    find_all_build_cache : Proc(IUIAutomationElement7*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)
    build_updated_cache : Proc(IUIAutomationElement7*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_current_property_value : Proc(IUIAutomationElement7*, Int32, VARIANT*, HRESULT)
    get_current_property_value_ex : Proc(IUIAutomationElement7*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_cached_property_value : Proc(IUIAutomationElement7*, Int32, VARIANT*, HRESULT)
    get_cached_property_value_ex : Proc(IUIAutomationElement7*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_current_pattern_as : Proc(IUIAutomationElement7*, Int32, Guid*, Void**, HRESULT)
    get_cached_pattern_as : Proc(IUIAutomationElement7*, Int32, Guid*, Void**, HRESULT)
    get_current_pattern : Proc(IUIAutomationElement7*, Int32, IUnknown*, HRESULT)
    get_cached_pattern : Proc(IUIAutomationElement7*, Int32, IUnknown*, HRESULT)
    get_cached_parent : Proc(IUIAutomationElement7*, IUIAutomationElement*, HRESULT)
    get_cached_children : Proc(IUIAutomationElement7*, IUIAutomationElementArray*, HRESULT)
    get_current_process_id : Proc(IUIAutomationElement7*, Int32*, HRESULT)
    get_current_control_type : Proc(IUIAutomationElement7*, Int32*, HRESULT)
    get_current_localized_control_type : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_current_name : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_current_accelerator_key : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_current_access_key : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_current_has_keyboard_focus : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_current_is_keyboard_focusable : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_current_is_enabled : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_current_automation_id : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_current_class_name : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_current_help_text : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_current_culture : Proc(IUIAutomationElement7*, Int32*, HRESULT)
    get_current_is_control_element : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_current_is_content_element : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_current_is_password : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_current_native_window_handle : Proc(IUIAutomationElement7*, LibC::HANDLE, HRESULT)
    get_current_item_type : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_current_is_offscreen : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_current_orientation : Proc(IUIAutomationElement7*, OrientationType*, HRESULT)
    get_current_framework_id : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_current_is_required_for_form : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_current_item_status : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_current_bounding_rectangle : Proc(IUIAutomationElement7*, RECT*, HRESULT)
    get_current_labeled_by : Proc(IUIAutomationElement7*, IUIAutomationElement*, HRESULT)
    get_current_aria_role : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_current_aria_properties : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_current_is_data_valid_for_form : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_current_controller_for : Proc(IUIAutomationElement7*, IUIAutomationElementArray*, HRESULT)
    get_current_described_by : Proc(IUIAutomationElement7*, IUIAutomationElementArray*, HRESULT)
    get_current_flows_to : Proc(IUIAutomationElement7*, IUIAutomationElementArray*, HRESULT)
    get_current_provider_description : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_process_id : Proc(IUIAutomationElement7*, Int32*, HRESULT)
    get_cached_control_type : Proc(IUIAutomationElement7*, Int32*, HRESULT)
    get_cached_localized_control_type : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_name : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_accelerator_key : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_access_key : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_has_keyboard_focus : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_cached_is_keyboard_focusable : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_cached_is_enabled : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_cached_automation_id : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_class_name : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_help_text : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_culture : Proc(IUIAutomationElement7*, Int32*, HRESULT)
    get_cached_is_control_element : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_cached_is_content_element : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_cached_is_password : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_cached_native_window_handle : Proc(IUIAutomationElement7*, LibC::HANDLE, HRESULT)
    get_cached_item_type : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_is_offscreen : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_cached_orientation : Proc(IUIAutomationElement7*, OrientationType*, HRESULT)
    get_cached_framework_id : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_is_required_for_form : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_cached_item_status : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_bounding_rectangle : Proc(IUIAutomationElement7*, RECT*, HRESULT)
    get_cached_labeled_by : Proc(IUIAutomationElement7*, IUIAutomationElement*, HRESULT)
    get_cached_aria_role : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_aria_properties : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_is_data_valid_for_form : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_cached_controller_for : Proc(IUIAutomationElement7*, IUIAutomationElementArray*, HRESULT)
    get_cached_described_by : Proc(IUIAutomationElement7*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_to : Proc(IUIAutomationElement7*, IUIAutomationElementArray*, HRESULT)
    get_cached_provider_description : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_clickable_point : Proc(IUIAutomationElement7*, POINT*, LibC::BOOL*, HRESULT)
    get_current_optimize_for_visual_content : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_cached_optimize_for_visual_content : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_current_live_setting : Proc(IUIAutomationElement7*, LiveSetting*, HRESULT)
    get_cached_live_setting : Proc(IUIAutomationElement7*, LiveSetting*, HRESULT)
    get_current_flows_from : Proc(IUIAutomationElement7*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_from : Proc(IUIAutomationElement7*, IUIAutomationElementArray*, HRESULT)
    show_context_menu : Proc(IUIAutomationElement7*, HRESULT)
    get_current_is_peripheral : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_cached_is_peripheral : Proc(IUIAutomationElement7*, LibC::BOOL*, HRESULT)
    get_current_position_in_set : Proc(IUIAutomationElement7*, Int32*, HRESULT)
    get_current_size_of_set : Proc(IUIAutomationElement7*, Int32*, HRESULT)
    get_current_level : Proc(IUIAutomationElement7*, Int32*, HRESULT)
    get_current_annotation_types : Proc(IUIAutomationElement7*, SAFEARRAY**, HRESULT)
    get_current_annotation_objects : Proc(IUIAutomationElement7*, IUIAutomationElementArray*, HRESULT)
    get_cached_position_in_set : Proc(IUIAutomationElement7*, Int32*, HRESULT)
    get_cached_size_of_set : Proc(IUIAutomationElement7*, Int32*, HRESULT)
    get_cached_level : Proc(IUIAutomationElement7*, Int32*, HRESULT)
    get_cached_annotation_types : Proc(IUIAutomationElement7*, SAFEARRAY**, HRESULT)
    get_cached_annotation_objects : Proc(IUIAutomationElement7*, IUIAutomationElementArray*, HRESULT)
    get_current_landmark_type : Proc(IUIAutomationElement7*, Int32*, HRESULT)
    get_current_localized_landmark_type : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_landmark_type : Proc(IUIAutomationElement7*, Int32*, HRESULT)
    get_cached_localized_landmark_type : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_current_full_description : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    get_cached_full_description : Proc(IUIAutomationElement7*, UInt8**, HRESULT)
    find_first_with_options : Proc(IUIAutomationElement7*, TreeScope, IUIAutomationCondition, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElement*, HRESULT)
    find_all_with_options : Proc(IUIAutomationElement7*, TreeScope, IUIAutomationCondition, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElementArray*, HRESULT)
    find_first_with_options_build_cache : Proc(IUIAutomationElement7*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElement*, HRESULT)
    find_all_with_options_build_cache : Proc(IUIAutomationElement7*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElementArray*, HRESULT)
    get_current_metadata_value : Proc(IUIAutomationElement7*, Int32, Int32, VARIANT*, HRESULT)
  end

  IUIAutomationElement7_GUID = "204e8572-cfc3-4c11-b0c8-7da7420750b7"
  IID_IUIAutomationElement7 = LibC::GUID.new(0x204e8572_u32, 0xcfc3_u16, 0x4c11_u16, StaticArray[0xb0_u8, 0xc8_u8, 0x7d_u8, 0xa7_u8, 0x42_u8, 0x7_u8, 0x50_u8, 0xb7_u8])
  struct IUIAutomationElement7
    lpVtbl : IUIAutomationElement7VTbl*
  end

  struct IUIAutomationElement8VTbl
    query_interface : Proc(IUIAutomationElement8*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationElement8*, UInt32)
    release : Proc(IUIAutomationElement8*, UInt32)
    set_focus : Proc(IUIAutomationElement8*, HRESULT)
    get_runtime_id : Proc(IUIAutomationElement8*, SAFEARRAY**, HRESULT)
    find_first : Proc(IUIAutomationElement8*, TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)
    find_all : Proc(IUIAutomationElement8*, TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)
    find_first_build_cache : Proc(IUIAutomationElement8*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    find_all_build_cache : Proc(IUIAutomationElement8*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)
    build_updated_cache : Proc(IUIAutomationElement8*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_current_property_value : Proc(IUIAutomationElement8*, Int32, VARIANT*, HRESULT)
    get_current_property_value_ex : Proc(IUIAutomationElement8*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_cached_property_value : Proc(IUIAutomationElement8*, Int32, VARIANT*, HRESULT)
    get_cached_property_value_ex : Proc(IUIAutomationElement8*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_current_pattern_as : Proc(IUIAutomationElement8*, Int32, Guid*, Void**, HRESULT)
    get_cached_pattern_as : Proc(IUIAutomationElement8*, Int32, Guid*, Void**, HRESULT)
    get_current_pattern : Proc(IUIAutomationElement8*, Int32, IUnknown*, HRESULT)
    get_cached_pattern : Proc(IUIAutomationElement8*, Int32, IUnknown*, HRESULT)
    get_cached_parent : Proc(IUIAutomationElement8*, IUIAutomationElement*, HRESULT)
    get_cached_children : Proc(IUIAutomationElement8*, IUIAutomationElementArray*, HRESULT)
    get_current_process_id : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_current_control_type : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_current_localized_control_type : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_current_name : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_current_accelerator_key : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_current_access_key : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_current_has_keyboard_focus : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_current_is_keyboard_focusable : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_current_is_enabled : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_current_automation_id : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_current_class_name : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_current_help_text : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_current_culture : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_current_is_control_element : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_current_is_content_element : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_current_is_password : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_current_native_window_handle : Proc(IUIAutomationElement8*, LibC::HANDLE, HRESULT)
    get_current_item_type : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_current_is_offscreen : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_current_orientation : Proc(IUIAutomationElement8*, OrientationType*, HRESULT)
    get_current_framework_id : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_current_is_required_for_form : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_current_item_status : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_current_bounding_rectangle : Proc(IUIAutomationElement8*, RECT*, HRESULT)
    get_current_labeled_by : Proc(IUIAutomationElement8*, IUIAutomationElement*, HRESULT)
    get_current_aria_role : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_current_aria_properties : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_current_is_data_valid_for_form : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_current_controller_for : Proc(IUIAutomationElement8*, IUIAutomationElementArray*, HRESULT)
    get_current_described_by : Proc(IUIAutomationElement8*, IUIAutomationElementArray*, HRESULT)
    get_current_flows_to : Proc(IUIAutomationElement8*, IUIAutomationElementArray*, HRESULT)
    get_current_provider_description : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_process_id : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_cached_control_type : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_cached_localized_control_type : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_name : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_accelerator_key : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_access_key : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_has_keyboard_focus : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_cached_is_keyboard_focusable : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_cached_is_enabled : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_cached_automation_id : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_class_name : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_help_text : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_culture : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_cached_is_control_element : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_cached_is_content_element : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_cached_is_password : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_cached_native_window_handle : Proc(IUIAutomationElement8*, LibC::HANDLE, HRESULT)
    get_cached_item_type : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_is_offscreen : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_cached_orientation : Proc(IUIAutomationElement8*, OrientationType*, HRESULT)
    get_cached_framework_id : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_is_required_for_form : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_cached_item_status : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_bounding_rectangle : Proc(IUIAutomationElement8*, RECT*, HRESULT)
    get_cached_labeled_by : Proc(IUIAutomationElement8*, IUIAutomationElement*, HRESULT)
    get_cached_aria_role : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_aria_properties : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_is_data_valid_for_form : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_cached_controller_for : Proc(IUIAutomationElement8*, IUIAutomationElementArray*, HRESULT)
    get_cached_described_by : Proc(IUIAutomationElement8*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_to : Proc(IUIAutomationElement8*, IUIAutomationElementArray*, HRESULT)
    get_cached_provider_description : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_clickable_point : Proc(IUIAutomationElement8*, POINT*, LibC::BOOL*, HRESULT)
    get_current_optimize_for_visual_content : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_cached_optimize_for_visual_content : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_current_live_setting : Proc(IUIAutomationElement8*, LiveSetting*, HRESULT)
    get_cached_live_setting : Proc(IUIAutomationElement8*, LiveSetting*, HRESULT)
    get_current_flows_from : Proc(IUIAutomationElement8*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_from : Proc(IUIAutomationElement8*, IUIAutomationElementArray*, HRESULT)
    show_context_menu : Proc(IUIAutomationElement8*, HRESULT)
    get_current_is_peripheral : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_cached_is_peripheral : Proc(IUIAutomationElement8*, LibC::BOOL*, HRESULT)
    get_current_position_in_set : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_current_size_of_set : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_current_level : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_current_annotation_types : Proc(IUIAutomationElement8*, SAFEARRAY**, HRESULT)
    get_current_annotation_objects : Proc(IUIAutomationElement8*, IUIAutomationElementArray*, HRESULT)
    get_cached_position_in_set : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_cached_size_of_set : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_cached_level : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_cached_annotation_types : Proc(IUIAutomationElement8*, SAFEARRAY**, HRESULT)
    get_cached_annotation_objects : Proc(IUIAutomationElement8*, IUIAutomationElementArray*, HRESULT)
    get_current_landmark_type : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_current_localized_landmark_type : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_landmark_type : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_cached_localized_landmark_type : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_current_full_description : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    get_cached_full_description : Proc(IUIAutomationElement8*, UInt8**, HRESULT)
    find_first_with_options : Proc(IUIAutomationElement8*, TreeScope, IUIAutomationCondition, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElement*, HRESULT)
    find_all_with_options : Proc(IUIAutomationElement8*, TreeScope, IUIAutomationCondition, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElementArray*, HRESULT)
    find_first_with_options_build_cache : Proc(IUIAutomationElement8*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElement*, HRESULT)
    find_all_with_options_build_cache : Proc(IUIAutomationElement8*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElementArray*, HRESULT)
    get_current_metadata_value : Proc(IUIAutomationElement8*, Int32, Int32, VARIANT*, HRESULT)
    get_current_heading_level : Proc(IUIAutomationElement8*, Int32*, HRESULT)
    get_cached_heading_level : Proc(IUIAutomationElement8*, Int32*, HRESULT)
  end

  IUIAutomationElement8_GUID = "8c60217d-5411-4cde-bcc0-1ceda223830c"
  IID_IUIAutomationElement8 = LibC::GUID.new(0x8c60217d_u32, 0x5411_u16, 0x4cde_u16, StaticArray[0xbc_u8, 0xc0_u8, 0x1c_u8, 0xed_u8, 0xa2_u8, 0x23_u8, 0x83_u8, 0xc_u8])
  struct IUIAutomationElement8
    lpVtbl : IUIAutomationElement8VTbl*
  end

  struct IUIAutomationElement9VTbl
    query_interface : Proc(IUIAutomationElement9*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationElement9*, UInt32)
    release : Proc(IUIAutomationElement9*, UInt32)
    set_focus : Proc(IUIAutomationElement9*, HRESULT)
    get_runtime_id : Proc(IUIAutomationElement9*, SAFEARRAY**, HRESULT)
    find_first : Proc(IUIAutomationElement9*, TreeScope, IUIAutomationCondition, IUIAutomationElement*, HRESULT)
    find_all : Proc(IUIAutomationElement9*, TreeScope, IUIAutomationCondition, IUIAutomationElementArray*, HRESULT)
    find_first_build_cache : Proc(IUIAutomationElement9*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    find_all_build_cache : Proc(IUIAutomationElement9*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, IUIAutomationElementArray*, HRESULT)
    build_updated_cache : Proc(IUIAutomationElement9*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_current_property_value : Proc(IUIAutomationElement9*, Int32, VARIANT*, HRESULT)
    get_current_property_value_ex : Proc(IUIAutomationElement9*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_cached_property_value : Proc(IUIAutomationElement9*, Int32, VARIANT*, HRESULT)
    get_cached_property_value_ex : Proc(IUIAutomationElement9*, Int32, LibC::BOOL, VARIANT*, HRESULT)
    get_current_pattern_as : Proc(IUIAutomationElement9*, Int32, Guid*, Void**, HRESULT)
    get_cached_pattern_as : Proc(IUIAutomationElement9*, Int32, Guid*, Void**, HRESULT)
    get_current_pattern : Proc(IUIAutomationElement9*, Int32, IUnknown*, HRESULT)
    get_cached_pattern : Proc(IUIAutomationElement9*, Int32, IUnknown*, HRESULT)
    get_cached_parent : Proc(IUIAutomationElement9*, IUIAutomationElement*, HRESULT)
    get_cached_children : Proc(IUIAutomationElement9*, IUIAutomationElementArray*, HRESULT)
    get_current_process_id : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_current_control_type : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_current_localized_control_type : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_current_name : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_current_accelerator_key : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_current_access_key : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_current_has_keyboard_focus : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_current_is_keyboard_focusable : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_current_is_enabled : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_current_automation_id : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_current_class_name : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_current_help_text : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_current_culture : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_current_is_control_element : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_current_is_content_element : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_current_is_password : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_current_native_window_handle : Proc(IUIAutomationElement9*, LibC::HANDLE, HRESULT)
    get_current_item_type : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_current_is_offscreen : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_current_orientation : Proc(IUIAutomationElement9*, OrientationType*, HRESULT)
    get_current_framework_id : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_current_is_required_for_form : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_current_item_status : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_current_bounding_rectangle : Proc(IUIAutomationElement9*, RECT*, HRESULT)
    get_current_labeled_by : Proc(IUIAutomationElement9*, IUIAutomationElement*, HRESULT)
    get_current_aria_role : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_current_aria_properties : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_current_is_data_valid_for_form : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_current_controller_for : Proc(IUIAutomationElement9*, IUIAutomationElementArray*, HRESULT)
    get_current_described_by : Proc(IUIAutomationElement9*, IUIAutomationElementArray*, HRESULT)
    get_current_flows_to : Proc(IUIAutomationElement9*, IUIAutomationElementArray*, HRESULT)
    get_current_provider_description : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_process_id : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_cached_control_type : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_cached_localized_control_type : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_name : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_accelerator_key : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_access_key : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_has_keyboard_focus : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_cached_is_keyboard_focusable : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_cached_is_enabled : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_cached_automation_id : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_class_name : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_help_text : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_culture : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_cached_is_control_element : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_cached_is_content_element : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_cached_is_password : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_cached_native_window_handle : Proc(IUIAutomationElement9*, LibC::HANDLE, HRESULT)
    get_cached_item_type : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_is_offscreen : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_cached_orientation : Proc(IUIAutomationElement9*, OrientationType*, HRESULT)
    get_cached_framework_id : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_is_required_for_form : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_cached_item_status : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_bounding_rectangle : Proc(IUIAutomationElement9*, RECT*, HRESULT)
    get_cached_labeled_by : Proc(IUIAutomationElement9*, IUIAutomationElement*, HRESULT)
    get_cached_aria_role : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_aria_properties : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_is_data_valid_for_form : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_cached_controller_for : Proc(IUIAutomationElement9*, IUIAutomationElementArray*, HRESULT)
    get_cached_described_by : Proc(IUIAutomationElement9*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_to : Proc(IUIAutomationElement9*, IUIAutomationElementArray*, HRESULT)
    get_cached_provider_description : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_clickable_point : Proc(IUIAutomationElement9*, POINT*, LibC::BOOL*, HRESULT)
    get_current_optimize_for_visual_content : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_cached_optimize_for_visual_content : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_current_live_setting : Proc(IUIAutomationElement9*, LiveSetting*, HRESULT)
    get_cached_live_setting : Proc(IUIAutomationElement9*, LiveSetting*, HRESULT)
    get_current_flows_from : Proc(IUIAutomationElement9*, IUIAutomationElementArray*, HRESULT)
    get_cached_flows_from : Proc(IUIAutomationElement9*, IUIAutomationElementArray*, HRESULT)
    show_context_menu : Proc(IUIAutomationElement9*, HRESULT)
    get_current_is_peripheral : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_cached_is_peripheral : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_current_position_in_set : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_current_size_of_set : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_current_level : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_current_annotation_types : Proc(IUIAutomationElement9*, SAFEARRAY**, HRESULT)
    get_current_annotation_objects : Proc(IUIAutomationElement9*, IUIAutomationElementArray*, HRESULT)
    get_cached_position_in_set : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_cached_size_of_set : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_cached_level : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_cached_annotation_types : Proc(IUIAutomationElement9*, SAFEARRAY**, HRESULT)
    get_cached_annotation_objects : Proc(IUIAutomationElement9*, IUIAutomationElementArray*, HRESULT)
    get_current_landmark_type : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_current_localized_landmark_type : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_landmark_type : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_cached_localized_landmark_type : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_current_full_description : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    get_cached_full_description : Proc(IUIAutomationElement9*, UInt8**, HRESULT)
    find_first_with_options : Proc(IUIAutomationElement9*, TreeScope, IUIAutomationCondition, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElement*, HRESULT)
    find_all_with_options : Proc(IUIAutomationElement9*, TreeScope, IUIAutomationCondition, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElementArray*, HRESULT)
    find_first_with_options_build_cache : Proc(IUIAutomationElement9*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElement*, HRESULT)
    find_all_with_options_build_cache : Proc(IUIAutomationElement9*, TreeScope, IUIAutomationCondition, IUIAutomationCacheRequest, TreeTraversalOptions, IUIAutomationElement, IUIAutomationElementArray*, HRESULT)
    get_current_metadata_value : Proc(IUIAutomationElement9*, Int32, Int32, VARIANT*, HRESULT)
    get_current_heading_level : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_cached_heading_level : Proc(IUIAutomationElement9*, Int32*, HRESULT)
    get_current_is_dialog : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
    get_cached_is_dialog : Proc(IUIAutomationElement9*, LibC::BOOL*, HRESULT)
  end

  IUIAutomationElement9_GUID = "39325fac-039d-440e-a3a3-5eb81a5cecc3"
  IID_IUIAutomationElement9 = LibC::GUID.new(0x39325fac_u32, 0x39d_u16, 0x440e_u16, StaticArray[0xa3_u8, 0xa3_u8, 0x5e_u8, 0xb8_u8, 0x1a_u8, 0x5c_u8, 0xec_u8, 0xc3_u8])
  struct IUIAutomationElement9
    lpVtbl : IUIAutomationElement9VTbl*
  end

  struct IUIAutomationProxyFactoryVTbl
    query_interface : Proc(IUIAutomationProxyFactory*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationProxyFactory*, UInt32)
    release : Proc(IUIAutomationProxyFactory*, UInt32)
    create_provider : Proc(IUIAutomationProxyFactory*, LibC::HANDLE, Int32, Int32, IRawElementProviderSimple*, HRESULT)
    get_proxy_factory_id : Proc(IUIAutomationProxyFactory*, UInt8**, HRESULT)
  end

  IUIAutomationProxyFactory_GUID = "85b94ecd-849d-42b6-b94d-d6db23fdf5a4"
  IID_IUIAutomationProxyFactory = LibC::GUID.new(0x85b94ecd_u32, 0x849d_u16, 0x42b6_u16, StaticArray[0xb9_u8, 0x4d_u8, 0xd6_u8, 0xdb_u8, 0x23_u8, 0xfd_u8, 0xf5_u8, 0xa4_u8])
  struct IUIAutomationProxyFactory
    lpVtbl : IUIAutomationProxyFactoryVTbl*
  end

  struct IUIAutomationProxyFactoryEntryVTbl
    query_interface : Proc(IUIAutomationProxyFactoryEntry*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationProxyFactoryEntry*, UInt32)
    release : Proc(IUIAutomationProxyFactoryEntry*, UInt32)
    get_proxy_factory : Proc(IUIAutomationProxyFactoryEntry*, IUIAutomationProxyFactory*, HRESULT)
    get_class_name : Proc(IUIAutomationProxyFactoryEntry*, UInt8**, HRESULT)
    get_image_name : Proc(IUIAutomationProxyFactoryEntry*, UInt8**, HRESULT)
    get_allow_substring_match : Proc(IUIAutomationProxyFactoryEntry*, LibC::BOOL*, HRESULT)
    get_can_check_base_class : Proc(IUIAutomationProxyFactoryEntry*, LibC::BOOL*, HRESULT)
    get_needs_advise_events : Proc(IUIAutomationProxyFactoryEntry*, LibC::BOOL*, HRESULT)
    put_class_name : Proc(IUIAutomationProxyFactoryEntry*, LibC::LPWSTR, HRESULT)
    put_image_name : Proc(IUIAutomationProxyFactoryEntry*, LibC::LPWSTR, HRESULT)
    put_allow_substring_match : Proc(IUIAutomationProxyFactoryEntry*, LibC::BOOL, HRESULT)
    put_can_check_base_class : Proc(IUIAutomationProxyFactoryEntry*, LibC::BOOL, HRESULT)
    put_needs_advise_events : Proc(IUIAutomationProxyFactoryEntry*, LibC::BOOL, HRESULT)
    set_win_events_for_automation_event : Proc(IUIAutomationProxyFactoryEntry*, Int32, Int32, SAFEARRAY*, HRESULT)
    get_win_events_for_automation_event : Proc(IUIAutomationProxyFactoryEntry*, Int32, Int32, SAFEARRAY**, HRESULT)
  end

  IUIAutomationProxyFactoryEntry_GUID = "d50e472e-b64b-490c-bca1-d30696f9f289"
  IID_IUIAutomationProxyFactoryEntry = LibC::GUID.new(0xd50e472e_u32, 0xb64b_u16, 0x490c_u16, StaticArray[0xbc_u8, 0xa1_u8, 0xd3_u8, 0x6_u8, 0x96_u8, 0xf9_u8, 0xf2_u8, 0x89_u8])
  struct IUIAutomationProxyFactoryEntry
    lpVtbl : IUIAutomationProxyFactoryEntryVTbl*
  end

  struct IUIAutomationProxyFactoryMappingVTbl
    query_interface : Proc(IUIAutomationProxyFactoryMapping*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationProxyFactoryMapping*, UInt32)
    release : Proc(IUIAutomationProxyFactoryMapping*, UInt32)
    get_count : Proc(IUIAutomationProxyFactoryMapping*, UInt32*, HRESULT)
    get_table : Proc(IUIAutomationProxyFactoryMapping*, SAFEARRAY**, HRESULT)
    get_entry : Proc(IUIAutomationProxyFactoryMapping*, UInt32, IUIAutomationProxyFactoryEntry*, HRESULT)
    set_table : Proc(IUIAutomationProxyFactoryMapping*, SAFEARRAY*, HRESULT)
    insert_entries : Proc(IUIAutomationProxyFactoryMapping*, UInt32, SAFEARRAY*, HRESULT)
    insert_entry : Proc(IUIAutomationProxyFactoryMapping*, UInt32, IUIAutomationProxyFactoryEntry, HRESULT)
    remove_entry : Proc(IUIAutomationProxyFactoryMapping*, UInt32, HRESULT)
    clear_table : Proc(IUIAutomationProxyFactoryMapping*, HRESULT)
    restore_default_table : Proc(IUIAutomationProxyFactoryMapping*, HRESULT)
  end

  IUIAutomationProxyFactoryMapping_GUID = "09e31e18-872d-4873-93d1-1e541ec133fd"
  IID_IUIAutomationProxyFactoryMapping = LibC::GUID.new(0x9e31e18_u32, 0x872d_u16, 0x4873_u16, StaticArray[0x93_u8, 0xd1_u8, 0x1e_u8, 0x54_u8, 0x1e_u8, 0xc1_u8, 0x33_u8, 0xfd_u8])
  struct IUIAutomationProxyFactoryMapping
    lpVtbl : IUIAutomationProxyFactoryMappingVTbl*
  end

  struct IUIAutomationEventHandlerGroupVTbl
    query_interface : Proc(IUIAutomationEventHandlerGroup*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationEventHandlerGroup*, UInt32)
    release : Proc(IUIAutomationEventHandlerGroup*, UInt32)
    add_active_text_position_changed_event_handler : Proc(IUIAutomationEventHandlerGroup*, TreeScope, IUIAutomationCacheRequest, IUIAutomationActiveTextPositionChangedEventHandler, HRESULT)
    add_automation_event_handler : Proc(IUIAutomationEventHandlerGroup*, Int32, TreeScope, IUIAutomationCacheRequest, IUIAutomationEventHandler, HRESULT)
    add_changes_event_handler : Proc(IUIAutomationEventHandlerGroup*, TreeScope, Int32*, Int32, IUIAutomationCacheRequest, IUIAutomationChangesEventHandler, HRESULT)
    add_notification_event_handler : Proc(IUIAutomationEventHandlerGroup*, TreeScope, IUIAutomationCacheRequest, IUIAutomationNotificationEventHandler, HRESULT)
    add_property_changed_event_handler : Proc(IUIAutomationEventHandlerGroup*, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, Int32*, Int32, HRESULT)
    add_structure_changed_event_handler : Proc(IUIAutomationEventHandlerGroup*, TreeScope, IUIAutomationCacheRequest, IUIAutomationStructureChangedEventHandler, HRESULT)
    add_text_edit_text_changed_event_handler : Proc(IUIAutomationEventHandlerGroup*, TreeScope, TextEditChangeType, IUIAutomationCacheRequest, IUIAutomationTextEditTextChangedEventHandler, HRESULT)
  end

  IUIAutomationEventHandlerGroup_GUID = "c9ee12f2-c13b-4408-997c-639914377f4e"
  IID_IUIAutomationEventHandlerGroup = LibC::GUID.new(0xc9ee12f2_u32, 0xc13b_u16, 0x4408_u16, StaticArray[0x99_u8, 0x7c_u8, 0x63_u8, 0x99_u8, 0x14_u8, 0x37_u8, 0x7f_u8, 0x4e_u8])
  struct IUIAutomationEventHandlerGroup
    lpVtbl : IUIAutomationEventHandlerGroupVTbl*
  end

  struct IUIAutomationVTbl
    query_interface : Proc(IUIAutomation*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomation*, UInt32)
    release : Proc(IUIAutomation*, UInt32)
    compare_elements : Proc(IUIAutomation*, IUIAutomationElement, IUIAutomationElement, LibC::BOOL*, HRESULT)
    compare_runtime_ids : Proc(IUIAutomation*, SAFEARRAY*, SAFEARRAY*, LibC::BOOL*, HRESULT)
    get_root_element : Proc(IUIAutomation*, IUIAutomationElement*, HRESULT)
    element_from_handle : Proc(IUIAutomation*, LibC::HANDLE, IUIAutomationElement*, HRESULT)
    element_from_point : Proc(IUIAutomation*, POINT, IUIAutomationElement*, HRESULT)
    get_focused_element : Proc(IUIAutomation*, IUIAutomationElement*, HRESULT)
    get_root_element_build_cache : Proc(IUIAutomation*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    element_from_handle_build_cache : Proc(IUIAutomation*, LibC::HANDLE, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    element_from_point_build_cache : Proc(IUIAutomation*, POINT, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_focused_element_build_cache : Proc(IUIAutomation*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    create_tree_walker : Proc(IUIAutomation*, IUIAutomationCondition, IUIAutomationTreeWalker*, HRESULT)
    get_control_view_walker : Proc(IUIAutomation*, IUIAutomationTreeWalker*, HRESULT)
    get_content_view_walker : Proc(IUIAutomation*, IUIAutomationTreeWalker*, HRESULT)
    get_raw_view_walker : Proc(IUIAutomation*, IUIAutomationTreeWalker*, HRESULT)
    get_raw_view_condition : Proc(IUIAutomation*, IUIAutomationCondition*, HRESULT)
    get_control_view_condition : Proc(IUIAutomation*, IUIAutomationCondition*, HRESULT)
    get_content_view_condition : Proc(IUIAutomation*, IUIAutomationCondition*, HRESULT)
    create_cache_request : Proc(IUIAutomation*, IUIAutomationCacheRequest*, HRESULT)
    create_true_condition : Proc(IUIAutomation*, IUIAutomationCondition*, HRESULT)
    create_false_condition : Proc(IUIAutomation*, IUIAutomationCondition*, HRESULT)
    create_property_condition : Proc(IUIAutomation*, Int32, VARIANT, IUIAutomationCondition*, HRESULT)
    create_property_condition_ex : Proc(IUIAutomation*, Int32, VARIANT, PropertyConditionFlags, IUIAutomationCondition*, HRESULT)
    create_and_condition : Proc(IUIAutomation*, IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    create_and_condition_from_array : Proc(IUIAutomation*, SAFEARRAY*, IUIAutomationCondition*, HRESULT)
    create_and_condition_from_native_array : Proc(IUIAutomation*, IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)
    create_or_condition : Proc(IUIAutomation*, IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    create_or_condition_from_array : Proc(IUIAutomation*, SAFEARRAY*, IUIAutomationCondition*, HRESULT)
    create_or_condition_from_native_array : Proc(IUIAutomation*, IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)
    create_not_condition : Proc(IUIAutomation*, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    add_automation_event_handler : Proc(IUIAutomation*, Int32, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationEventHandler, HRESULT)
    remove_automation_event_handler : Proc(IUIAutomation*, Int32, IUIAutomationElement, IUIAutomationEventHandler, HRESULT)
    add_property_changed_event_handler_native_array : Proc(IUIAutomation*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, Int32*, Int32, HRESULT)
    add_property_changed_event_handler : Proc(IUIAutomation*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, SAFEARRAY*, HRESULT)
    remove_property_changed_event_handler : Proc(IUIAutomation*, IUIAutomationElement, IUIAutomationPropertyChangedEventHandler, HRESULT)
    add_structure_changed_event_handler : Proc(IUIAutomation*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationStructureChangedEventHandler, HRESULT)
    remove_structure_changed_event_handler : Proc(IUIAutomation*, IUIAutomationElement, IUIAutomationStructureChangedEventHandler, HRESULT)
    add_focus_changed_event_handler : Proc(IUIAutomation*, IUIAutomationCacheRequest, IUIAutomationFocusChangedEventHandler, HRESULT)
    remove_focus_changed_event_handler : Proc(IUIAutomation*, IUIAutomationFocusChangedEventHandler, HRESULT)
    remove_all_event_handlers : Proc(IUIAutomation*, HRESULT)
    int_native_array_to_safe_array : Proc(IUIAutomation*, Int32*, Int32, SAFEARRAY**, HRESULT)
    int_safe_array_to_native_array : Proc(IUIAutomation*, SAFEARRAY*, Int32**, Int32*, HRESULT)
    rect_to_variant : Proc(IUIAutomation*, RECT, VARIANT*, HRESULT)
    variant_to_rect : Proc(IUIAutomation*, VARIANT, RECT*, HRESULT)
    safe_array_to_rect_native_array : Proc(IUIAutomation*, SAFEARRAY*, RECT**, Int32*, HRESULT)
    create_proxy_factory_entry : Proc(IUIAutomation*, IUIAutomationProxyFactory, IUIAutomationProxyFactoryEntry*, HRESULT)
    get_proxy_factory_mapping : Proc(IUIAutomation*, IUIAutomationProxyFactoryMapping*, HRESULT)
    get_property_programmatic_name : Proc(IUIAutomation*, Int32, UInt8**, HRESULT)
    get_pattern_programmatic_name : Proc(IUIAutomation*, Int32, UInt8**, HRESULT)
    poll_for_potential_supported_patterns : Proc(IUIAutomation*, IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)
    poll_for_potential_supported_properties : Proc(IUIAutomation*, IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)
    check_not_supported : Proc(IUIAutomation*, VARIANT, LibC::BOOL*, HRESULT)
    get_reserved_not_supported_value : Proc(IUIAutomation*, IUnknown*, HRESULT)
    get_reserved_mixed_attribute_value : Proc(IUIAutomation*, IUnknown*, HRESULT)
    element_from_i_accessible : Proc(IUIAutomation*, IAccessible, Int32, IUIAutomationElement*, HRESULT)
    element_from_i_accessible_build_cache : Proc(IUIAutomation*, IAccessible, Int32, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
  end

  IUIAutomation_GUID = "30cbe57d-d9d0-452a-ab13-7ac5ac4825ee"
  IID_IUIAutomation = LibC::GUID.new(0x30cbe57d_u32, 0xd9d0_u16, 0x452a_u16, StaticArray[0xab_u8, 0x13_u8, 0x7a_u8, 0xc5_u8, 0xac_u8, 0x48_u8, 0x25_u8, 0xee_u8])
  struct IUIAutomation
    lpVtbl : IUIAutomationVTbl*
  end

  struct IUIAutomation2VTbl
    query_interface : Proc(IUIAutomation2*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomation2*, UInt32)
    release : Proc(IUIAutomation2*, UInt32)
    compare_elements : Proc(IUIAutomation2*, IUIAutomationElement, IUIAutomationElement, LibC::BOOL*, HRESULT)
    compare_runtime_ids : Proc(IUIAutomation2*, SAFEARRAY*, SAFEARRAY*, LibC::BOOL*, HRESULT)
    get_root_element : Proc(IUIAutomation2*, IUIAutomationElement*, HRESULT)
    element_from_handle : Proc(IUIAutomation2*, LibC::HANDLE, IUIAutomationElement*, HRESULT)
    element_from_point : Proc(IUIAutomation2*, POINT, IUIAutomationElement*, HRESULT)
    get_focused_element : Proc(IUIAutomation2*, IUIAutomationElement*, HRESULT)
    get_root_element_build_cache : Proc(IUIAutomation2*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    element_from_handle_build_cache : Proc(IUIAutomation2*, LibC::HANDLE, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    element_from_point_build_cache : Proc(IUIAutomation2*, POINT, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_focused_element_build_cache : Proc(IUIAutomation2*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    create_tree_walker : Proc(IUIAutomation2*, IUIAutomationCondition, IUIAutomationTreeWalker*, HRESULT)
    get_control_view_walker : Proc(IUIAutomation2*, IUIAutomationTreeWalker*, HRESULT)
    get_content_view_walker : Proc(IUIAutomation2*, IUIAutomationTreeWalker*, HRESULT)
    get_raw_view_walker : Proc(IUIAutomation2*, IUIAutomationTreeWalker*, HRESULT)
    get_raw_view_condition : Proc(IUIAutomation2*, IUIAutomationCondition*, HRESULT)
    get_control_view_condition : Proc(IUIAutomation2*, IUIAutomationCondition*, HRESULT)
    get_content_view_condition : Proc(IUIAutomation2*, IUIAutomationCondition*, HRESULT)
    create_cache_request : Proc(IUIAutomation2*, IUIAutomationCacheRequest*, HRESULT)
    create_true_condition : Proc(IUIAutomation2*, IUIAutomationCondition*, HRESULT)
    create_false_condition : Proc(IUIAutomation2*, IUIAutomationCondition*, HRESULT)
    create_property_condition : Proc(IUIAutomation2*, Int32, VARIANT, IUIAutomationCondition*, HRESULT)
    create_property_condition_ex : Proc(IUIAutomation2*, Int32, VARIANT, PropertyConditionFlags, IUIAutomationCondition*, HRESULT)
    create_and_condition : Proc(IUIAutomation2*, IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    create_and_condition_from_array : Proc(IUIAutomation2*, SAFEARRAY*, IUIAutomationCondition*, HRESULT)
    create_and_condition_from_native_array : Proc(IUIAutomation2*, IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)
    create_or_condition : Proc(IUIAutomation2*, IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    create_or_condition_from_array : Proc(IUIAutomation2*, SAFEARRAY*, IUIAutomationCondition*, HRESULT)
    create_or_condition_from_native_array : Proc(IUIAutomation2*, IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)
    create_not_condition : Proc(IUIAutomation2*, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    add_automation_event_handler : Proc(IUIAutomation2*, Int32, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationEventHandler, HRESULT)
    remove_automation_event_handler : Proc(IUIAutomation2*, Int32, IUIAutomationElement, IUIAutomationEventHandler, HRESULT)
    add_property_changed_event_handler_native_array : Proc(IUIAutomation2*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, Int32*, Int32, HRESULT)
    add_property_changed_event_handler : Proc(IUIAutomation2*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, SAFEARRAY*, HRESULT)
    remove_property_changed_event_handler : Proc(IUIAutomation2*, IUIAutomationElement, IUIAutomationPropertyChangedEventHandler, HRESULT)
    add_structure_changed_event_handler : Proc(IUIAutomation2*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationStructureChangedEventHandler, HRESULT)
    remove_structure_changed_event_handler : Proc(IUIAutomation2*, IUIAutomationElement, IUIAutomationStructureChangedEventHandler, HRESULT)
    add_focus_changed_event_handler : Proc(IUIAutomation2*, IUIAutomationCacheRequest, IUIAutomationFocusChangedEventHandler, HRESULT)
    remove_focus_changed_event_handler : Proc(IUIAutomation2*, IUIAutomationFocusChangedEventHandler, HRESULT)
    remove_all_event_handlers : Proc(IUIAutomation2*, HRESULT)
    int_native_array_to_safe_array : Proc(IUIAutomation2*, Int32*, Int32, SAFEARRAY**, HRESULT)
    int_safe_array_to_native_array : Proc(IUIAutomation2*, SAFEARRAY*, Int32**, Int32*, HRESULT)
    rect_to_variant : Proc(IUIAutomation2*, RECT, VARIANT*, HRESULT)
    variant_to_rect : Proc(IUIAutomation2*, VARIANT, RECT*, HRESULT)
    safe_array_to_rect_native_array : Proc(IUIAutomation2*, SAFEARRAY*, RECT**, Int32*, HRESULT)
    create_proxy_factory_entry : Proc(IUIAutomation2*, IUIAutomationProxyFactory, IUIAutomationProxyFactoryEntry*, HRESULT)
    get_proxy_factory_mapping : Proc(IUIAutomation2*, IUIAutomationProxyFactoryMapping*, HRESULT)
    get_property_programmatic_name : Proc(IUIAutomation2*, Int32, UInt8**, HRESULT)
    get_pattern_programmatic_name : Proc(IUIAutomation2*, Int32, UInt8**, HRESULT)
    poll_for_potential_supported_patterns : Proc(IUIAutomation2*, IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)
    poll_for_potential_supported_properties : Proc(IUIAutomation2*, IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)
    check_not_supported : Proc(IUIAutomation2*, VARIANT, LibC::BOOL*, HRESULT)
    get_reserved_not_supported_value : Proc(IUIAutomation2*, IUnknown*, HRESULT)
    get_reserved_mixed_attribute_value : Proc(IUIAutomation2*, IUnknown*, HRESULT)
    element_from_i_accessible : Proc(IUIAutomation2*, IAccessible, Int32, IUIAutomationElement*, HRESULT)
    element_from_i_accessible_build_cache : Proc(IUIAutomation2*, IAccessible, Int32, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_auto_set_focus : Proc(IUIAutomation2*, LibC::BOOL*, HRESULT)
    put_auto_set_focus : Proc(IUIAutomation2*, LibC::BOOL, HRESULT)
    get_connection_timeout : Proc(IUIAutomation2*, UInt32*, HRESULT)
    put_connection_timeout : Proc(IUIAutomation2*, UInt32, HRESULT)
    get_transaction_timeout : Proc(IUIAutomation2*, UInt32*, HRESULT)
    put_transaction_timeout : Proc(IUIAutomation2*, UInt32, HRESULT)
  end

  IUIAutomation2_GUID = "34723aff-0c9d-49d0-9896-7ab52df8cd8a"
  IID_IUIAutomation2 = LibC::GUID.new(0x34723aff_u32, 0xc9d_u16, 0x49d0_u16, StaticArray[0x98_u8, 0x96_u8, 0x7a_u8, 0xb5_u8, 0x2d_u8, 0xf8_u8, 0xcd_u8, 0x8a_u8])
  struct IUIAutomation2
    lpVtbl : IUIAutomation2VTbl*
  end

  struct IUIAutomation3VTbl
    query_interface : Proc(IUIAutomation3*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomation3*, UInt32)
    release : Proc(IUIAutomation3*, UInt32)
    compare_elements : Proc(IUIAutomation3*, IUIAutomationElement, IUIAutomationElement, LibC::BOOL*, HRESULT)
    compare_runtime_ids : Proc(IUIAutomation3*, SAFEARRAY*, SAFEARRAY*, LibC::BOOL*, HRESULT)
    get_root_element : Proc(IUIAutomation3*, IUIAutomationElement*, HRESULT)
    element_from_handle : Proc(IUIAutomation3*, LibC::HANDLE, IUIAutomationElement*, HRESULT)
    element_from_point : Proc(IUIAutomation3*, POINT, IUIAutomationElement*, HRESULT)
    get_focused_element : Proc(IUIAutomation3*, IUIAutomationElement*, HRESULT)
    get_root_element_build_cache : Proc(IUIAutomation3*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    element_from_handle_build_cache : Proc(IUIAutomation3*, LibC::HANDLE, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    element_from_point_build_cache : Proc(IUIAutomation3*, POINT, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_focused_element_build_cache : Proc(IUIAutomation3*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    create_tree_walker : Proc(IUIAutomation3*, IUIAutomationCondition, IUIAutomationTreeWalker*, HRESULT)
    get_control_view_walker : Proc(IUIAutomation3*, IUIAutomationTreeWalker*, HRESULT)
    get_content_view_walker : Proc(IUIAutomation3*, IUIAutomationTreeWalker*, HRESULT)
    get_raw_view_walker : Proc(IUIAutomation3*, IUIAutomationTreeWalker*, HRESULT)
    get_raw_view_condition : Proc(IUIAutomation3*, IUIAutomationCondition*, HRESULT)
    get_control_view_condition : Proc(IUIAutomation3*, IUIAutomationCondition*, HRESULT)
    get_content_view_condition : Proc(IUIAutomation3*, IUIAutomationCondition*, HRESULT)
    create_cache_request : Proc(IUIAutomation3*, IUIAutomationCacheRequest*, HRESULT)
    create_true_condition : Proc(IUIAutomation3*, IUIAutomationCondition*, HRESULT)
    create_false_condition : Proc(IUIAutomation3*, IUIAutomationCondition*, HRESULT)
    create_property_condition : Proc(IUIAutomation3*, Int32, VARIANT, IUIAutomationCondition*, HRESULT)
    create_property_condition_ex : Proc(IUIAutomation3*, Int32, VARIANT, PropertyConditionFlags, IUIAutomationCondition*, HRESULT)
    create_and_condition : Proc(IUIAutomation3*, IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    create_and_condition_from_array : Proc(IUIAutomation3*, SAFEARRAY*, IUIAutomationCondition*, HRESULT)
    create_and_condition_from_native_array : Proc(IUIAutomation3*, IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)
    create_or_condition : Proc(IUIAutomation3*, IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    create_or_condition_from_array : Proc(IUIAutomation3*, SAFEARRAY*, IUIAutomationCondition*, HRESULT)
    create_or_condition_from_native_array : Proc(IUIAutomation3*, IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)
    create_not_condition : Proc(IUIAutomation3*, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    add_automation_event_handler : Proc(IUIAutomation3*, Int32, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationEventHandler, HRESULT)
    remove_automation_event_handler : Proc(IUIAutomation3*, Int32, IUIAutomationElement, IUIAutomationEventHandler, HRESULT)
    add_property_changed_event_handler_native_array : Proc(IUIAutomation3*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, Int32*, Int32, HRESULT)
    add_property_changed_event_handler : Proc(IUIAutomation3*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, SAFEARRAY*, HRESULT)
    remove_property_changed_event_handler : Proc(IUIAutomation3*, IUIAutomationElement, IUIAutomationPropertyChangedEventHandler, HRESULT)
    add_structure_changed_event_handler : Proc(IUIAutomation3*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationStructureChangedEventHandler, HRESULT)
    remove_structure_changed_event_handler : Proc(IUIAutomation3*, IUIAutomationElement, IUIAutomationStructureChangedEventHandler, HRESULT)
    add_focus_changed_event_handler : Proc(IUIAutomation3*, IUIAutomationCacheRequest, IUIAutomationFocusChangedEventHandler, HRESULT)
    remove_focus_changed_event_handler : Proc(IUIAutomation3*, IUIAutomationFocusChangedEventHandler, HRESULT)
    remove_all_event_handlers : Proc(IUIAutomation3*, HRESULT)
    int_native_array_to_safe_array : Proc(IUIAutomation3*, Int32*, Int32, SAFEARRAY**, HRESULT)
    int_safe_array_to_native_array : Proc(IUIAutomation3*, SAFEARRAY*, Int32**, Int32*, HRESULT)
    rect_to_variant : Proc(IUIAutomation3*, RECT, VARIANT*, HRESULT)
    variant_to_rect : Proc(IUIAutomation3*, VARIANT, RECT*, HRESULT)
    safe_array_to_rect_native_array : Proc(IUIAutomation3*, SAFEARRAY*, RECT**, Int32*, HRESULT)
    create_proxy_factory_entry : Proc(IUIAutomation3*, IUIAutomationProxyFactory, IUIAutomationProxyFactoryEntry*, HRESULT)
    get_proxy_factory_mapping : Proc(IUIAutomation3*, IUIAutomationProxyFactoryMapping*, HRESULT)
    get_property_programmatic_name : Proc(IUIAutomation3*, Int32, UInt8**, HRESULT)
    get_pattern_programmatic_name : Proc(IUIAutomation3*, Int32, UInt8**, HRESULT)
    poll_for_potential_supported_patterns : Proc(IUIAutomation3*, IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)
    poll_for_potential_supported_properties : Proc(IUIAutomation3*, IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)
    check_not_supported : Proc(IUIAutomation3*, VARIANT, LibC::BOOL*, HRESULT)
    get_reserved_not_supported_value : Proc(IUIAutomation3*, IUnknown*, HRESULT)
    get_reserved_mixed_attribute_value : Proc(IUIAutomation3*, IUnknown*, HRESULT)
    element_from_i_accessible : Proc(IUIAutomation3*, IAccessible, Int32, IUIAutomationElement*, HRESULT)
    element_from_i_accessible_build_cache : Proc(IUIAutomation3*, IAccessible, Int32, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_auto_set_focus : Proc(IUIAutomation3*, LibC::BOOL*, HRESULT)
    put_auto_set_focus : Proc(IUIAutomation3*, LibC::BOOL, HRESULT)
    get_connection_timeout : Proc(IUIAutomation3*, UInt32*, HRESULT)
    put_connection_timeout : Proc(IUIAutomation3*, UInt32, HRESULT)
    get_transaction_timeout : Proc(IUIAutomation3*, UInt32*, HRESULT)
    put_transaction_timeout : Proc(IUIAutomation3*, UInt32, HRESULT)
    add_text_edit_text_changed_event_handler : Proc(IUIAutomation3*, IUIAutomationElement, TreeScope, TextEditChangeType, IUIAutomationCacheRequest, IUIAutomationTextEditTextChangedEventHandler, HRESULT)
    remove_text_edit_text_changed_event_handler : Proc(IUIAutomation3*, IUIAutomationElement, IUIAutomationTextEditTextChangedEventHandler, HRESULT)
  end

  IUIAutomation3_GUID = "73d768da-9b51-4b89-936e-c209290973e7"
  IID_IUIAutomation3 = LibC::GUID.new(0x73d768da_u32, 0x9b51_u16, 0x4b89_u16, StaticArray[0x93_u8, 0x6e_u8, 0xc2_u8, 0x9_u8, 0x29_u8, 0x9_u8, 0x73_u8, 0xe7_u8])
  struct IUIAutomation3
    lpVtbl : IUIAutomation3VTbl*
  end

  struct IUIAutomation4VTbl
    query_interface : Proc(IUIAutomation4*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomation4*, UInt32)
    release : Proc(IUIAutomation4*, UInt32)
    compare_elements : Proc(IUIAutomation4*, IUIAutomationElement, IUIAutomationElement, LibC::BOOL*, HRESULT)
    compare_runtime_ids : Proc(IUIAutomation4*, SAFEARRAY*, SAFEARRAY*, LibC::BOOL*, HRESULT)
    get_root_element : Proc(IUIAutomation4*, IUIAutomationElement*, HRESULT)
    element_from_handle : Proc(IUIAutomation4*, LibC::HANDLE, IUIAutomationElement*, HRESULT)
    element_from_point : Proc(IUIAutomation4*, POINT, IUIAutomationElement*, HRESULT)
    get_focused_element : Proc(IUIAutomation4*, IUIAutomationElement*, HRESULT)
    get_root_element_build_cache : Proc(IUIAutomation4*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    element_from_handle_build_cache : Proc(IUIAutomation4*, LibC::HANDLE, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    element_from_point_build_cache : Proc(IUIAutomation4*, POINT, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_focused_element_build_cache : Proc(IUIAutomation4*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    create_tree_walker : Proc(IUIAutomation4*, IUIAutomationCondition, IUIAutomationTreeWalker*, HRESULT)
    get_control_view_walker : Proc(IUIAutomation4*, IUIAutomationTreeWalker*, HRESULT)
    get_content_view_walker : Proc(IUIAutomation4*, IUIAutomationTreeWalker*, HRESULT)
    get_raw_view_walker : Proc(IUIAutomation4*, IUIAutomationTreeWalker*, HRESULT)
    get_raw_view_condition : Proc(IUIAutomation4*, IUIAutomationCondition*, HRESULT)
    get_control_view_condition : Proc(IUIAutomation4*, IUIAutomationCondition*, HRESULT)
    get_content_view_condition : Proc(IUIAutomation4*, IUIAutomationCondition*, HRESULT)
    create_cache_request : Proc(IUIAutomation4*, IUIAutomationCacheRequest*, HRESULT)
    create_true_condition : Proc(IUIAutomation4*, IUIAutomationCondition*, HRESULT)
    create_false_condition : Proc(IUIAutomation4*, IUIAutomationCondition*, HRESULT)
    create_property_condition : Proc(IUIAutomation4*, Int32, VARIANT, IUIAutomationCondition*, HRESULT)
    create_property_condition_ex : Proc(IUIAutomation4*, Int32, VARIANT, PropertyConditionFlags, IUIAutomationCondition*, HRESULT)
    create_and_condition : Proc(IUIAutomation4*, IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    create_and_condition_from_array : Proc(IUIAutomation4*, SAFEARRAY*, IUIAutomationCondition*, HRESULT)
    create_and_condition_from_native_array : Proc(IUIAutomation4*, IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)
    create_or_condition : Proc(IUIAutomation4*, IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    create_or_condition_from_array : Proc(IUIAutomation4*, SAFEARRAY*, IUIAutomationCondition*, HRESULT)
    create_or_condition_from_native_array : Proc(IUIAutomation4*, IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)
    create_not_condition : Proc(IUIAutomation4*, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    add_automation_event_handler : Proc(IUIAutomation4*, Int32, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationEventHandler, HRESULT)
    remove_automation_event_handler : Proc(IUIAutomation4*, Int32, IUIAutomationElement, IUIAutomationEventHandler, HRESULT)
    add_property_changed_event_handler_native_array : Proc(IUIAutomation4*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, Int32*, Int32, HRESULT)
    add_property_changed_event_handler : Proc(IUIAutomation4*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, SAFEARRAY*, HRESULT)
    remove_property_changed_event_handler : Proc(IUIAutomation4*, IUIAutomationElement, IUIAutomationPropertyChangedEventHandler, HRESULT)
    add_structure_changed_event_handler : Proc(IUIAutomation4*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationStructureChangedEventHandler, HRESULT)
    remove_structure_changed_event_handler : Proc(IUIAutomation4*, IUIAutomationElement, IUIAutomationStructureChangedEventHandler, HRESULT)
    add_focus_changed_event_handler : Proc(IUIAutomation4*, IUIAutomationCacheRequest, IUIAutomationFocusChangedEventHandler, HRESULT)
    remove_focus_changed_event_handler : Proc(IUIAutomation4*, IUIAutomationFocusChangedEventHandler, HRESULT)
    remove_all_event_handlers : Proc(IUIAutomation4*, HRESULT)
    int_native_array_to_safe_array : Proc(IUIAutomation4*, Int32*, Int32, SAFEARRAY**, HRESULT)
    int_safe_array_to_native_array : Proc(IUIAutomation4*, SAFEARRAY*, Int32**, Int32*, HRESULT)
    rect_to_variant : Proc(IUIAutomation4*, RECT, VARIANT*, HRESULT)
    variant_to_rect : Proc(IUIAutomation4*, VARIANT, RECT*, HRESULT)
    safe_array_to_rect_native_array : Proc(IUIAutomation4*, SAFEARRAY*, RECT**, Int32*, HRESULT)
    create_proxy_factory_entry : Proc(IUIAutomation4*, IUIAutomationProxyFactory, IUIAutomationProxyFactoryEntry*, HRESULT)
    get_proxy_factory_mapping : Proc(IUIAutomation4*, IUIAutomationProxyFactoryMapping*, HRESULT)
    get_property_programmatic_name : Proc(IUIAutomation4*, Int32, UInt8**, HRESULT)
    get_pattern_programmatic_name : Proc(IUIAutomation4*, Int32, UInt8**, HRESULT)
    poll_for_potential_supported_patterns : Proc(IUIAutomation4*, IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)
    poll_for_potential_supported_properties : Proc(IUIAutomation4*, IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)
    check_not_supported : Proc(IUIAutomation4*, VARIANT, LibC::BOOL*, HRESULT)
    get_reserved_not_supported_value : Proc(IUIAutomation4*, IUnknown*, HRESULT)
    get_reserved_mixed_attribute_value : Proc(IUIAutomation4*, IUnknown*, HRESULT)
    element_from_i_accessible : Proc(IUIAutomation4*, IAccessible, Int32, IUIAutomationElement*, HRESULT)
    element_from_i_accessible_build_cache : Proc(IUIAutomation4*, IAccessible, Int32, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_auto_set_focus : Proc(IUIAutomation4*, LibC::BOOL*, HRESULT)
    put_auto_set_focus : Proc(IUIAutomation4*, LibC::BOOL, HRESULT)
    get_connection_timeout : Proc(IUIAutomation4*, UInt32*, HRESULT)
    put_connection_timeout : Proc(IUIAutomation4*, UInt32, HRESULT)
    get_transaction_timeout : Proc(IUIAutomation4*, UInt32*, HRESULT)
    put_transaction_timeout : Proc(IUIAutomation4*, UInt32, HRESULT)
    add_text_edit_text_changed_event_handler : Proc(IUIAutomation4*, IUIAutomationElement, TreeScope, TextEditChangeType, IUIAutomationCacheRequest, IUIAutomationTextEditTextChangedEventHandler, HRESULT)
    remove_text_edit_text_changed_event_handler : Proc(IUIAutomation4*, IUIAutomationElement, IUIAutomationTextEditTextChangedEventHandler, HRESULT)
    add_changes_event_handler : Proc(IUIAutomation4*, IUIAutomationElement, TreeScope, Int32*, Int32, IUIAutomationCacheRequest, IUIAutomationChangesEventHandler, HRESULT)
    remove_changes_event_handler : Proc(IUIAutomation4*, IUIAutomationElement, IUIAutomationChangesEventHandler, HRESULT)
  end

  IUIAutomation4_GUID = "1189c02a-05f8-4319-8e21-e817e3db2860"
  IID_IUIAutomation4 = LibC::GUID.new(0x1189c02a_u32, 0x5f8_u16, 0x4319_u16, StaticArray[0x8e_u8, 0x21_u8, 0xe8_u8, 0x17_u8, 0xe3_u8, 0xdb_u8, 0x28_u8, 0x60_u8])
  struct IUIAutomation4
    lpVtbl : IUIAutomation4VTbl*
  end

  struct IUIAutomation5VTbl
    query_interface : Proc(IUIAutomation5*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomation5*, UInt32)
    release : Proc(IUIAutomation5*, UInt32)
    compare_elements : Proc(IUIAutomation5*, IUIAutomationElement, IUIAutomationElement, LibC::BOOL*, HRESULT)
    compare_runtime_ids : Proc(IUIAutomation5*, SAFEARRAY*, SAFEARRAY*, LibC::BOOL*, HRESULT)
    get_root_element : Proc(IUIAutomation5*, IUIAutomationElement*, HRESULT)
    element_from_handle : Proc(IUIAutomation5*, LibC::HANDLE, IUIAutomationElement*, HRESULT)
    element_from_point : Proc(IUIAutomation5*, POINT, IUIAutomationElement*, HRESULT)
    get_focused_element : Proc(IUIAutomation5*, IUIAutomationElement*, HRESULT)
    get_root_element_build_cache : Proc(IUIAutomation5*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    element_from_handle_build_cache : Proc(IUIAutomation5*, LibC::HANDLE, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    element_from_point_build_cache : Proc(IUIAutomation5*, POINT, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_focused_element_build_cache : Proc(IUIAutomation5*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    create_tree_walker : Proc(IUIAutomation5*, IUIAutomationCondition, IUIAutomationTreeWalker*, HRESULT)
    get_control_view_walker : Proc(IUIAutomation5*, IUIAutomationTreeWalker*, HRESULT)
    get_content_view_walker : Proc(IUIAutomation5*, IUIAutomationTreeWalker*, HRESULT)
    get_raw_view_walker : Proc(IUIAutomation5*, IUIAutomationTreeWalker*, HRESULT)
    get_raw_view_condition : Proc(IUIAutomation5*, IUIAutomationCondition*, HRESULT)
    get_control_view_condition : Proc(IUIAutomation5*, IUIAutomationCondition*, HRESULT)
    get_content_view_condition : Proc(IUIAutomation5*, IUIAutomationCondition*, HRESULT)
    create_cache_request : Proc(IUIAutomation5*, IUIAutomationCacheRequest*, HRESULT)
    create_true_condition : Proc(IUIAutomation5*, IUIAutomationCondition*, HRESULT)
    create_false_condition : Proc(IUIAutomation5*, IUIAutomationCondition*, HRESULT)
    create_property_condition : Proc(IUIAutomation5*, Int32, VARIANT, IUIAutomationCondition*, HRESULT)
    create_property_condition_ex : Proc(IUIAutomation5*, Int32, VARIANT, PropertyConditionFlags, IUIAutomationCondition*, HRESULT)
    create_and_condition : Proc(IUIAutomation5*, IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    create_and_condition_from_array : Proc(IUIAutomation5*, SAFEARRAY*, IUIAutomationCondition*, HRESULT)
    create_and_condition_from_native_array : Proc(IUIAutomation5*, IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)
    create_or_condition : Proc(IUIAutomation5*, IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    create_or_condition_from_array : Proc(IUIAutomation5*, SAFEARRAY*, IUIAutomationCondition*, HRESULT)
    create_or_condition_from_native_array : Proc(IUIAutomation5*, IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)
    create_not_condition : Proc(IUIAutomation5*, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    add_automation_event_handler : Proc(IUIAutomation5*, Int32, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationEventHandler, HRESULT)
    remove_automation_event_handler : Proc(IUIAutomation5*, Int32, IUIAutomationElement, IUIAutomationEventHandler, HRESULT)
    add_property_changed_event_handler_native_array : Proc(IUIAutomation5*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, Int32*, Int32, HRESULT)
    add_property_changed_event_handler : Proc(IUIAutomation5*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, SAFEARRAY*, HRESULT)
    remove_property_changed_event_handler : Proc(IUIAutomation5*, IUIAutomationElement, IUIAutomationPropertyChangedEventHandler, HRESULT)
    add_structure_changed_event_handler : Proc(IUIAutomation5*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationStructureChangedEventHandler, HRESULT)
    remove_structure_changed_event_handler : Proc(IUIAutomation5*, IUIAutomationElement, IUIAutomationStructureChangedEventHandler, HRESULT)
    add_focus_changed_event_handler : Proc(IUIAutomation5*, IUIAutomationCacheRequest, IUIAutomationFocusChangedEventHandler, HRESULT)
    remove_focus_changed_event_handler : Proc(IUIAutomation5*, IUIAutomationFocusChangedEventHandler, HRESULT)
    remove_all_event_handlers : Proc(IUIAutomation5*, HRESULT)
    int_native_array_to_safe_array : Proc(IUIAutomation5*, Int32*, Int32, SAFEARRAY**, HRESULT)
    int_safe_array_to_native_array : Proc(IUIAutomation5*, SAFEARRAY*, Int32**, Int32*, HRESULT)
    rect_to_variant : Proc(IUIAutomation5*, RECT, VARIANT*, HRESULT)
    variant_to_rect : Proc(IUIAutomation5*, VARIANT, RECT*, HRESULT)
    safe_array_to_rect_native_array : Proc(IUIAutomation5*, SAFEARRAY*, RECT**, Int32*, HRESULT)
    create_proxy_factory_entry : Proc(IUIAutomation5*, IUIAutomationProxyFactory, IUIAutomationProxyFactoryEntry*, HRESULT)
    get_proxy_factory_mapping : Proc(IUIAutomation5*, IUIAutomationProxyFactoryMapping*, HRESULT)
    get_property_programmatic_name : Proc(IUIAutomation5*, Int32, UInt8**, HRESULT)
    get_pattern_programmatic_name : Proc(IUIAutomation5*, Int32, UInt8**, HRESULT)
    poll_for_potential_supported_patterns : Proc(IUIAutomation5*, IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)
    poll_for_potential_supported_properties : Proc(IUIAutomation5*, IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)
    check_not_supported : Proc(IUIAutomation5*, VARIANT, LibC::BOOL*, HRESULT)
    get_reserved_not_supported_value : Proc(IUIAutomation5*, IUnknown*, HRESULT)
    get_reserved_mixed_attribute_value : Proc(IUIAutomation5*, IUnknown*, HRESULT)
    element_from_i_accessible : Proc(IUIAutomation5*, IAccessible, Int32, IUIAutomationElement*, HRESULT)
    element_from_i_accessible_build_cache : Proc(IUIAutomation5*, IAccessible, Int32, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_auto_set_focus : Proc(IUIAutomation5*, LibC::BOOL*, HRESULT)
    put_auto_set_focus : Proc(IUIAutomation5*, LibC::BOOL, HRESULT)
    get_connection_timeout : Proc(IUIAutomation5*, UInt32*, HRESULT)
    put_connection_timeout : Proc(IUIAutomation5*, UInt32, HRESULT)
    get_transaction_timeout : Proc(IUIAutomation5*, UInt32*, HRESULT)
    put_transaction_timeout : Proc(IUIAutomation5*, UInt32, HRESULT)
    add_text_edit_text_changed_event_handler : Proc(IUIAutomation5*, IUIAutomationElement, TreeScope, TextEditChangeType, IUIAutomationCacheRequest, IUIAutomationTextEditTextChangedEventHandler, HRESULT)
    remove_text_edit_text_changed_event_handler : Proc(IUIAutomation5*, IUIAutomationElement, IUIAutomationTextEditTextChangedEventHandler, HRESULT)
    add_changes_event_handler : Proc(IUIAutomation5*, IUIAutomationElement, TreeScope, Int32*, Int32, IUIAutomationCacheRequest, IUIAutomationChangesEventHandler, HRESULT)
    remove_changes_event_handler : Proc(IUIAutomation5*, IUIAutomationElement, IUIAutomationChangesEventHandler, HRESULT)
    add_notification_event_handler : Proc(IUIAutomation5*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationNotificationEventHandler, HRESULT)
    remove_notification_event_handler : Proc(IUIAutomation5*, IUIAutomationElement, IUIAutomationNotificationEventHandler, HRESULT)
  end

  IUIAutomation5_GUID = "25f700c8-d816-4057-a9dc-3cbdee77e256"
  IID_IUIAutomation5 = LibC::GUID.new(0x25f700c8_u32, 0xd816_u16, 0x4057_u16, StaticArray[0xa9_u8, 0xdc_u8, 0x3c_u8, 0xbd_u8, 0xee_u8, 0x77_u8, 0xe2_u8, 0x56_u8])
  struct IUIAutomation5
    lpVtbl : IUIAutomation5VTbl*
  end

  struct IUIAutomation6VTbl
    query_interface : Proc(IUIAutomation6*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomation6*, UInt32)
    release : Proc(IUIAutomation6*, UInt32)
    compare_elements : Proc(IUIAutomation6*, IUIAutomationElement, IUIAutomationElement, LibC::BOOL*, HRESULT)
    compare_runtime_ids : Proc(IUIAutomation6*, SAFEARRAY*, SAFEARRAY*, LibC::BOOL*, HRESULT)
    get_root_element : Proc(IUIAutomation6*, IUIAutomationElement*, HRESULT)
    element_from_handle : Proc(IUIAutomation6*, LibC::HANDLE, IUIAutomationElement*, HRESULT)
    element_from_point : Proc(IUIAutomation6*, POINT, IUIAutomationElement*, HRESULT)
    get_focused_element : Proc(IUIAutomation6*, IUIAutomationElement*, HRESULT)
    get_root_element_build_cache : Proc(IUIAutomation6*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    element_from_handle_build_cache : Proc(IUIAutomation6*, LibC::HANDLE, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    element_from_point_build_cache : Proc(IUIAutomation6*, POINT, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_focused_element_build_cache : Proc(IUIAutomation6*, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    create_tree_walker : Proc(IUIAutomation6*, IUIAutomationCondition, IUIAutomationTreeWalker*, HRESULT)
    get_control_view_walker : Proc(IUIAutomation6*, IUIAutomationTreeWalker*, HRESULT)
    get_content_view_walker : Proc(IUIAutomation6*, IUIAutomationTreeWalker*, HRESULT)
    get_raw_view_walker : Proc(IUIAutomation6*, IUIAutomationTreeWalker*, HRESULT)
    get_raw_view_condition : Proc(IUIAutomation6*, IUIAutomationCondition*, HRESULT)
    get_control_view_condition : Proc(IUIAutomation6*, IUIAutomationCondition*, HRESULT)
    get_content_view_condition : Proc(IUIAutomation6*, IUIAutomationCondition*, HRESULT)
    create_cache_request : Proc(IUIAutomation6*, IUIAutomationCacheRequest*, HRESULT)
    create_true_condition : Proc(IUIAutomation6*, IUIAutomationCondition*, HRESULT)
    create_false_condition : Proc(IUIAutomation6*, IUIAutomationCondition*, HRESULT)
    create_property_condition : Proc(IUIAutomation6*, Int32, VARIANT, IUIAutomationCondition*, HRESULT)
    create_property_condition_ex : Proc(IUIAutomation6*, Int32, VARIANT, PropertyConditionFlags, IUIAutomationCondition*, HRESULT)
    create_and_condition : Proc(IUIAutomation6*, IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    create_and_condition_from_array : Proc(IUIAutomation6*, SAFEARRAY*, IUIAutomationCondition*, HRESULT)
    create_and_condition_from_native_array : Proc(IUIAutomation6*, IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)
    create_or_condition : Proc(IUIAutomation6*, IUIAutomationCondition, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    create_or_condition_from_array : Proc(IUIAutomation6*, SAFEARRAY*, IUIAutomationCondition*, HRESULT)
    create_or_condition_from_native_array : Proc(IUIAutomation6*, IUIAutomationCondition*, Int32, IUIAutomationCondition*, HRESULT)
    create_not_condition : Proc(IUIAutomation6*, IUIAutomationCondition, IUIAutomationCondition*, HRESULT)
    add_automation_event_handler : Proc(IUIAutomation6*, Int32, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationEventHandler, HRESULT)
    remove_automation_event_handler : Proc(IUIAutomation6*, Int32, IUIAutomationElement, IUIAutomationEventHandler, HRESULT)
    add_property_changed_event_handler_native_array : Proc(IUIAutomation6*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, Int32*, Int32, HRESULT)
    add_property_changed_event_handler : Proc(IUIAutomation6*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationPropertyChangedEventHandler, SAFEARRAY*, HRESULT)
    remove_property_changed_event_handler : Proc(IUIAutomation6*, IUIAutomationElement, IUIAutomationPropertyChangedEventHandler, HRESULT)
    add_structure_changed_event_handler : Proc(IUIAutomation6*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationStructureChangedEventHandler, HRESULT)
    remove_structure_changed_event_handler : Proc(IUIAutomation6*, IUIAutomationElement, IUIAutomationStructureChangedEventHandler, HRESULT)
    add_focus_changed_event_handler : Proc(IUIAutomation6*, IUIAutomationCacheRequest, IUIAutomationFocusChangedEventHandler, HRESULT)
    remove_focus_changed_event_handler : Proc(IUIAutomation6*, IUIAutomationFocusChangedEventHandler, HRESULT)
    remove_all_event_handlers : Proc(IUIAutomation6*, HRESULT)
    int_native_array_to_safe_array : Proc(IUIAutomation6*, Int32*, Int32, SAFEARRAY**, HRESULT)
    int_safe_array_to_native_array : Proc(IUIAutomation6*, SAFEARRAY*, Int32**, Int32*, HRESULT)
    rect_to_variant : Proc(IUIAutomation6*, RECT, VARIANT*, HRESULT)
    variant_to_rect : Proc(IUIAutomation6*, VARIANT, RECT*, HRESULT)
    safe_array_to_rect_native_array : Proc(IUIAutomation6*, SAFEARRAY*, RECT**, Int32*, HRESULT)
    create_proxy_factory_entry : Proc(IUIAutomation6*, IUIAutomationProxyFactory, IUIAutomationProxyFactoryEntry*, HRESULT)
    get_proxy_factory_mapping : Proc(IUIAutomation6*, IUIAutomationProxyFactoryMapping*, HRESULT)
    get_property_programmatic_name : Proc(IUIAutomation6*, Int32, UInt8**, HRESULT)
    get_pattern_programmatic_name : Proc(IUIAutomation6*, Int32, UInt8**, HRESULT)
    poll_for_potential_supported_patterns : Proc(IUIAutomation6*, IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)
    poll_for_potential_supported_properties : Proc(IUIAutomation6*, IUIAutomationElement, SAFEARRAY**, SAFEARRAY**, HRESULT)
    check_not_supported : Proc(IUIAutomation6*, VARIANT, LibC::BOOL*, HRESULT)
    get_reserved_not_supported_value : Proc(IUIAutomation6*, IUnknown*, HRESULT)
    get_reserved_mixed_attribute_value : Proc(IUIAutomation6*, IUnknown*, HRESULT)
    element_from_i_accessible : Proc(IUIAutomation6*, IAccessible, Int32, IUIAutomationElement*, HRESULT)
    element_from_i_accessible_build_cache : Proc(IUIAutomation6*, IAccessible, Int32, IUIAutomationCacheRequest, IUIAutomationElement*, HRESULT)
    get_auto_set_focus : Proc(IUIAutomation6*, LibC::BOOL*, HRESULT)
    put_auto_set_focus : Proc(IUIAutomation6*, LibC::BOOL, HRESULT)
    get_connection_timeout : Proc(IUIAutomation6*, UInt32*, HRESULT)
    put_connection_timeout : Proc(IUIAutomation6*, UInt32, HRESULT)
    get_transaction_timeout : Proc(IUIAutomation6*, UInt32*, HRESULT)
    put_transaction_timeout : Proc(IUIAutomation6*, UInt32, HRESULT)
    add_text_edit_text_changed_event_handler : Proc(IUIAutomation6*, IUIAutomationElement, TreeScope, TextEditChangeType, IUIAutomationCacheRequest, IUIAutomationTextEditTextChangedEventHandler, HRESULT)
    remove_text_edit_text_changed_event_handler : Proc(IUIAutomation6*, IUIAutomationElement, IUIAutomationTextEditTextChangedEventHandler, HRESULT)
    add_changes_event_handler : Proc(IUIAutomation6*, IUIAutomationElement, TreeScope, Int32*, Int32, IUIAutomationCacheRequest, IUIAutomationChangesEventHandler, HRESULT)
    remove_changes_event_handler : Proc(IUIAutomation6*, IUIAutomationElement, IUIAutomationChangesEventHandler, HRESULT)
    add_notification_event_handler : Proc(IUIAutomation6*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationNotificationEventHandler, HRESULT)
    remove_notification_event_handler : Proc(IUIAutomation6*, IUIAutomationElement, IUIAutomationNotificationEventHandler, HRESULT)
    create_event_handler_group : Proc(IUIAutomation6*, IUIAutomationEventHandlerGroup*, HRESULT)
    add_event_handler_group : Proc(IUIAutomation6*, IUIAutomationElement, IUIAutomationEventHandlerGroup, HRESULT)
    remove_event_handler_group : Proc(IUIAutomation6*, IUIAutomationElement, IUIAutomationEventHandlerGroup, HRESULT)
    get_connection_recovery_behavior : Proc(IUIAutomation6*, ConnectionRecoveryBehaviorOptions*, HRESULT)
    put_connection_recovery_behavior : Proc(IUIAutomation6*, ConnectionRecoveryBehaviorOptions, HRESULT)
    get_coalesce_events : Proc(IUIAutomation6*, CoalesceEventsOptions*, HRESULT)
    put_coalesce_events : Proc(IUIAutomation6*, CoalesceEventsOptions, HRESULT)
    add_active_text_position_changed_event_handler : Proc(IUIAutomation6*, IUIAutomationElement, TreeScope, IUIAutomationCacheRequest, IUIAutomationActiveTextPositionChangedEventHandler, HRESULT)
    remove_active_text_position_changed_event_handler : Proc(IUIAutomation6*, IUIAutomationElement, IUIAutomationActiveTextPositionChangedEventHandler, HRESULT)
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
  def query_interface(this : IRicheditWindowlessAccessibility*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRicheditWindowlessAccessibility*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRicheditWindowlessAccessibility*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_provider(this : IRicheditWindowlessAccessibility*, psite : IRawElementProviderWindowlessSite, ppprovider : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.create_provider.call(this, psite, ppprovider)
  end
end
struct LibWin32::IRichEditUiaInformation
  def query_interface(this : IRichEditUiaInformation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRichEditUiaInformation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRichEditUiaInformation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_boundary_rectangle(this : IRichEditUiaInformation*, puiarect : UiaRect*) : HRESULT
    @lpVtbl.value.get_boundary_rectangle.call(this, puiarect)
  end
  def is_visible(this : IRichEditUiaInformation*) : HRESULT
    @lpVtbl.value.is_visible.call(this)
  end
end
struct LibWin32::IAccessible
  def query_interface(this : IAccessible*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAccessible*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAccessible*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_type_info_count(this : IAccessible*, pctinfo : UInt32*) : HRESULT
    @lpVtbl.value.get_type_info_count.call(this, pctinfo)
  end
  def get_type_info(this : IAccessible*, itinfo : UInt32, lcid : UInt32, pptinfo : ITypeInfo*) : HRESULT
    @lpVtbl.value.get_type_info.call(this, itinfo, lcid, pptinfo)
  end
  def get_i_ds_of_names(this : IAccessible*, riid : Guid*, rgsznames : LibC::LPWSTR*, cnames : UInt32, lcid : UInt32, rgdispid : Int32*) : HRESULT
    @lpVtbl.value.get_i_ds_of_names.call(this, riid, rgsznames, cnames, lcid, rgdispid)
  end
  def invoke(this : IAccessible*, dispidmember : Int32, riid : Guid*, lcid : UInt32, wflags : UInt16, pdispparams : DISPPARAMS*, pvarresult : VARIANT*, pexcepinfo : EXCEPINFO*, puargerr : UInt32*) : HRESULT
    @lpVtbl.value.invoke.call(this, dispidmember, riid, lcid, wflags, pdispparams, pvarresult, pexcepinfo, puargerr)
  end
  def get_acc_parent(this : IAccessible*, ppdispparent : IDispatch*) : HRESULT
    @lpVtbl.value.get_acc_parent.call(this, ppdispparent)
  end
  def get_acc_child_count(this : IAccessible*, pcountchildren : Int32*) : HRESULT
    @lpVtbl.value.get_acc_child_count.call(this, pcountchildren)
  end
  def get_acc_child(this : IAccessible*, varchild : VARIANT, ppdispchild : IDispatch*) : HRESULT
    @lpVtbl.value.get_acc_child.call(this, varchild, ppdispchild)
  end
  def get_acc_name(this : IAccessible*, varchild : VARIANT, pszname : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_name.call(this, varchild, pszname)
  end
  def get_acc_value(this : IAccessible*, varchild : VARIANT, pszvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_value.call(this, varchild, pszvalue)
  end
  def get_acc_description(this : IAccessible*, varchild : VARIANT, pszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_description.call(this, varchild, pszdescription)
  end
  def get_acc_role(this : IAccessible*, varchild : VARIANT, pvarrole : VARIANT*) : HRESULT
    @lpVtbl.value.get_acc_role.call(this, varchild, pvarrole)
  end
  def get_acc_state(this : IAccessible*, varchild : VARIANT, pvarstate : VARIANT*) : HRESULT
    @lpVtbl.value.get_acc_state.call(this, varchild, pvarstate)
  end
  def get_acc_help(this : IAccessible*, varchild : VARIANT, pszhelp : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_help.call(this, varchild, pszhelp)
  end
  def get_acc_help_topic(this : IAccessible*, pszhelpfile : UInt8**, varchild : VARIANT, pidtopic : Int32*) : HRESULT
    @lpVtbl.value.get_acc_help_topic.call(this, pszhelpfile, varchild, pidtopic)
  end
  def get_acc_keyboard_shortcut(this : IAccessible*, varchild : VARIANT, pszkeyboardshortcut : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_keyboard_shortcut.call(this, varchild, pszkeyboardshortcut)
  end
  def get_acc_focus(this : IAccessible*, pvarchild : VARIANT*) : HRESULT
    @lpVtbl.value.get_acc_focus.call(this, pvarchild)
  end
  def get_acc_selection(this : IAccessible*, pvarchildren : VARIANT*) : HRESULT
    @lpVtbl.value.get_acc_selection.call(this, pvarchildren)
  end
  def get_acc_default_action(this : IAccessible*, varchild : VARIANT, pszdefaultaction : UInt8**) : HRESULT
    @lpVtbl.value.get_acc_default_action.call(this, varchild, pszdefaultaction)
  end
  def acc_select(this : IAccessible*, flagsselect : Int32, varchild : VARIANT) : HRESULT
    @lpVtbl.value.acc_select.call(this, flagsselect, varchild)
  end
  def acc_location(this : IAccessible*, pxleft : Int32*, pytop : Int32*, pcxwidth : Int32*, pcyheight : Int32*, varchild : VARIANT) : HRESULT
    @lpVtbl.value.acc_location.call(this, pxleft, pytop, pcxwidth, pcyheight, varchild)
  end
  def acc_navigate(this : IAccessible*, navdir : Int32, varstart : VARIANT, pvarendupat : VARIANT*) : HRESULT
    @lpVtbl.value.acc_navigate.call(this, navdir, varstart, pvarendupat)
  end
  def acc_hit_test(this : IAccessible*, xleft : Int32, ytop : Int32, pvarchild : VARIANT*) : HRESULT
    @lpVtbl.value.acc_hit_test.call(this, xleft, ytop, pvarchild)
  end
  def acc_do_default_action(this : IAccessible*, varchild : VARIANT) : HRESULT
    @lpVtbl.value.acc_do_default_action.call(this, varchild)
  end
  def put_acc_name(this : IAccessible*, varchild : VARIANT, szname : UInt8*) : HRESULT
    @lpVtbl.value.put_acc_name.call(this, varchild, szname)
  end
  def put_acc_value(this : IAccessible*, varchild : VARIANT, szvalue : UInt8*) : HRESULT
    @lpVtbl.value.put_acc_value.call(this, varchild, szvalue)
  end
end
struct LibWin32::IAccessibleHandler
  def query_interface(this : IAccessibleHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAccessibleHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAccessibleHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def accessible_object_from_id(this : IAccessibleHandler*, hwnd : Int32, lobjectid : Int32, piaccessible : IAccessible*) : HRESULT
    @lpVtbl.value.accessible_object_from_id.call(this, hwnd, lobjectid, piaccessible)
  end
end
struct LibWin32::IAccessibleWindowlessSite
  def query_interface(this : IAccessibleWindowlessSite*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAccessibleWindowlessSite*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAccessibleWindowlessSite*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def acquire_object_id_range(this : IAccessibleWindowlessSite*, rangesize : Int32, prangeowner : IAccessibleHandler, prangebase : Int32*) : HRESULT
    @lpVtbl.value.acquire_object_id_range.call(this, rangesize, prangeowner, prangebase)
  end
  def release_object_id_range(this : IAccessibleWindowlessSite*, rangebase : Int32, prangeowner : IAccessibleHandler) : HRESULT
    @lpVtbl.value.release_object_id_range.call(this, rangebase, prangeowner)
  end
  def query_object_id_ranges(this : IAccessibleWindowlessSite*, prangesowner : IAccessibleHandler, psaranges : SAFEARRAY**) : HRESULT
    @lpVtbl.value.query_object_id_ranges.call(this, prangesowner, psaranges)
  end
  def get_parent_accessible(this : IAccessibleWindowlessSite*, ppparent : IAccessible*) : HRESULT
    @lpVtbl.value.get_parent_accessible.call(this, ppparent)
  end
end
struct LibWin32::IAccIdentity
  def query_interface(this : IAccIdentity*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAccIdentity*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAccIdentity*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_identity_string(this : IAccIdentity*, dwidchild : UInt32, ppidstring : UInt8**, pdwidstringlen : UInt32*) : HRESULT
    @lpVtbl.value.get_identity_string.call(this, dwidchild, ppidstring, pdwidstringlen)
  end
end
struct LibWin32::IAccPropServer
  def query_interface(this : IAccPropServer*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAccPropServer*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAccPropServer*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_prop_value(this : IAccPropServer*, pidstring : UInt8*, dwidstringlen : UInt32, idprop : Guid, pvarvalue : VARIANT*, pfhasprop : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_prop_value.call(this, pidstring, dwidstringlen, idprop, pvarvalue, pfhasprop)
  end
end
struct LibWin32::IAccPropServices
  def query_interface(this : IAccPropServices*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAccPropServices*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAccPropServices*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_prop_value(this : IAccPropServices*, pidstring : UInt8*, dwidstringlen : UInt32, idprop : Guid, var : VARIANT) : HRESULT
    @lpVtbl.value.set_prop_value.call(this, pidstring, dwidstringlen, idprop, var)
  end
  def set_prop_server(this : IAccPropServices*, pidstring : UInt8*, dwidstringlen : UInt32, paprops : Guid*, cprops : Int32, pserver : IAccPropServer, annoscope : AnnoScope) : HRESULT
    @lpVtbl.value.set_prop_server.call(this, pidstring, dwidstringlen, paprops, cprops, pserver, annoscope)
  end
  def clear_props(this : IAccPropServices*, pidstring : UInt8*, dwidstringlen : UInt32, paprops : Guid*, cprops : Int32) : HRESULT
    @lpVtbl.value.clear_props.call(this, pidstring, dwidstringlen, paprops, cprops)
  end
  def set_hwnd_prop(this : IAccPropServices*, hwnd : LibC::HANDLE, idobject : UInt32, idchild : UInt32, idprop : Guid, var : VARIANT) : HRESULT
    @lpVtbl.value.set_hwnd_prop.call(this, hwnd, idobject, idchild, idprop, var)
  end
  def set_hwnd_prop_str(this : IAccPropServices*, hwnd : LibC::HANDLE, idobject : UInt32, idchild : UInt32, idprop : Guid, str : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_hwnd_prop_str.call(this, hwnd, idobject, idchild, idprop, str)
  end
  def set_hwnd_prop_server(this : IAccPropServices*, hwnd : LibC::HANDLE, idobject : UInt32, idchild : UInt32, paprops : Guid*, cprops : Int32, pserver : IAccPropServer, annoscope : AnnoScope) : HRESULT
    @lpVtbl.value.set_hwnd_prop_server.call(this, hwnd, idobject, idchild, paprops, cprops, pserver, annoscope)
  end
  def clear_hwnd_props(this : IAccPropServices*, hwnd : LibC::HANDLE, idobject : UInt32, idchild : UInt32, paprops : Guid*, cprops : Int32) : HRESULT
    @lpVtbl.value.clear_hwnd_props.call(this, hwnd, idobject, idchild, paprops, cprops)
  end
  def compose_hwnd_identity_string(this : IAccPropServices*, hwnd : LibC::HANDLE, idobject : UInt32, idchild : UInt32, ppidstring : UInt8**, pdwidstringlen : UInt32*) : HRESULT
    @lpVtbl.value.compose_hwnd_identity_string.call(this, hwnd, idobject, idchild, ppidstring, pdwidstringlen)
  end
  def decompose_hwnd_identity_string(this : IAccPropServices*, pidstring : UInt8*, dwidstringlen : UInt32, phwnd : HANDLE*, pidobject : UInt32*, pidchild : UInt32*) : HRESULT
    @lpVtbl.value.decompose_hwnd_identity_string.call(this, pidstring, dwidstringlen, phwnd, pidobject, pidchild)
  end
  def set_hmenu_prop(this : IAccPropServices*, hmenu : LibC::HANDLE, idchild : UInt32, idprop : Guid, var : VARIANT) : HRESULT
    @lpVtbl.value.set_hmenu_prop.call(this, hmenu, idchild, idprop, var)
  end
  def set_hmenu_prop_str(this : IAccPropServices*, hmenu : LibC::HANDLE, idchild : UInt32, idprop : Guid, str : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_hmenu_prop_str.call(this, hmenu, idchild, idprop, str)
  end
  def set_hmenu_prop_server(this : IAccPropServices*, hmenu : LibC::HANDLE, idchild : UInt32, paprops : Guid*, cprops : Int32, pserver : IAccPropServer, annoscope : AnnoScope) : HRESULT
    @lpVtbl.value.set_hmenu_prop_server.call(this, hmenu, idchild, paprops, cprops, pserver, annoscope)
  end
  def clear_hmenu_props(this : IAccPropServices*, hmenu : LibC::HANDLE, idchild : UInt32, paprops : Guid*, cprops : Int32) : HRESULT
    @lpVtbl.value.clear_hmenu_props.call(this, hmenu, idchild, paprops, cprops)
  end
  def compose_hmenu_identity_string(this : IAccPropServices*, hmenu : LibC::HANDLE, idchild : UInt32, ppidstring : UInt8**, pdwidstringlen : UInt32*) : HRESULT
    @lpVtbl.value.compose_hmenu_identity_string.call(this, hmenu, idchild, ppidstring, pdwidstringlen)
  end
  def decompose_hmenu_identity_string(this : IAccPropServices*, pidstring : UInt8*, dwidstringlen : UInt32, phmenu : HANDLE*, pidchild : UInt32*) : HRESULT
    @lpVtbl.value.decompose_hmenu_identity_string.call(this, pidstring, dwidstringlen, phmenu, pidchild)
  end
end
struct LibWin32::IRawElementProviderSimple
  def query_interface(this : IRawElementProviderSimple*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRawElementProviderSimple*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRawElementProviderSimple*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_provider_options(this : IRawElementProviderSimple*, pretval : ProviderOptions*) : HRESULT
    @lpVtbl.value.get_provider_options.call(this, pretval)
  end
  def get_pattern_provider(this : IRawElementProviderSimple*, patternid : Int32, pretval : IUnknown*) : HRESULT
    @lpVtbl.value.get_pattern_provider.call(this, patternid, pretval)
  end
  def get_property_value(this : IRawElementProviderSimple*, propertyid : Int32, pretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_property_value.call(this, propertyid, pretval)
  end
  def get_host_raw_element_provider(this : IRawElementProviderSimple*, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_host_raw_element_provider.call(this, pretval)
  end
end
struct LibWin32::IAccessibleEx
  def query_interface(this : IAccessibleEx*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAccessibleEx*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAccessibleEx*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_object_for_child(this : IAccessibleEx*, idchild : Int32, pretval : IAccessibleEx*) : HRESULT
    @lpVtbl.value.get_object_for_child.call(this, idchild, pretval)
  end
  def get_i_accessible_pair(this : IAccessibleEx*, ppacc : IAccessible*, pidchild : Int32*) : HRESULT
    @lpVtbl.value.get_i_accessible_pair.call(this, ppacc, pidchild)
  end
  def get_runtime_id(this : IAccessibleEx*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.call(this, pretval)
  end
  def convert_returned_element(this : IAccessibleEx*, pin : IRawElementProviderSimple, ppretvalout : IAccessibleEx*) : HRESULT
    @lpVtbl.value.convert_returned_element.call(this, pin, ppretvalout)
  end
end
struct LibWin32::IRawElementProviderSimple2
  def query_interface(this : IRawElementProviderSimple2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRawElementProviderSimple2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRawElementProviderSimple2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_provider_options(this : IRawElementProviderSimple2*, pretval : ProviderOptions*) : HRESULT
    @lpVtbl.value.get_provider_options.call(this, pretval)
  end
  def get_pattern_provider(this : IRawElementProviderSimple2*, patternid : Int32, pretval : IUnknown*) : HRESULT
    @lpVtbl.value.get_pattern_provider.call(this, patternid, pretval)
  end
  def get_property_value(this : IRawElementProviderSimple2*, propertyid : Int32, pretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_property_value.call(this, propertyid, pretval)
  end
  def get_host_raw_element_provider(this : IRawElementProviderSimple2*, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_host_raw_element_provider.call(this, pretval)
  end
  def show_context_menu(this : IRawElementProviderSimple2*) : HRESULT
    @lpVtbl.value.show_context_menu.call(this)
  end
end
struct LibWin32::IRawElementProviderSimple3
  def query_interface(this : IRawElementProviderSimple3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRawElementProviderSimple3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRawElementProviderSimple3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_provider_options(this : IRawElementProviderSimple3*, pretval : ProviderOptions*) : HRESULT
    @lpVtbl.value.get_provider_options.call(this, pretval)
  end
  def get_pattern_provider(this : IRawElementProviderSimple3*, patternid : Int32, pretval : IUnknown*) : HRESULT
    @lpVtbl.value.get_pattern_provider.call(this, patternid, pretval)
  end
  def get_property_value(this : IRawElementProviderSimple3*, propertyid : Int32, pretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_property_value.call(this, propertyid, pretval)
  end
  def get_host_raw_element_provider(this : IRawElementProviderSimple3*, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_host_raw_element_provider.call(this, pretval)
  end
  def show_context_menu(this : IRawElementProviderSimple3*) : HRESULT
    @lpVtbl.value.show_context_menu.call(this)
  end
  def get_metadata_value(this : IRawElementProviderSimple3*, targetid : Int32, metadataid : Int32, returnval : VARIANT*) : HRESULT
    @lpVtbl.value.get_metadata_value.call(this, targetid, metadataid, returnval)
  end
end
struct LibWin32::IRawElementProviderFragmentRoot
  def query_interface(this : IRawElementProviderFragmentRoot*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRawElementProviderFragmentRoot*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRawElementProviderFragmentRoot*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def element_provider_from_point(this : IRawElementProviderFragmentRoot*, x : Float64, y : Float64, pretval : IRawElementProviderFragment*) : HRESULT
    @lpVtbl.value.element_provider_from_point.call(this, x, y, pretval)
  end
  def get_focus(this : IRawElementProviderFragmentRoot*, pretval : IRawElementProviderFragment*) : HRESULT
    @lpVtbl.value.get_focus.call(this, pretval)
  end
end
struct LibWin32::IRawElementProviderFragment
  def query_interface(this : IRawElementProviderFragment*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRawElementProviderFragment*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRawElementProviderFragment*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def navigate(this : IRawElementProviderFragment*, direction : NavigateDirection, pretval : IRawElementProviderFragment*) : HRESULT
    @lpVtbl.value.navigate.call(this, direction, pretval)
  end
  def get_runtime_id(this : IRawElementProviderFragment*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.call(this, pretval)
  end
  def get_bounding_rectangle(this : IRawElementProviderFragment*, pretval : UiaRect*) : HRESULT
    @lpVtbl.value.get_bounding_rectangle.call(this, pretval)
  end
  def get_embedded_fragment_roots(this : IRawElementProviderFragment*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_embedded_fragment_roots.call(this, pretval)
  end
  def set_focus(this : IRawElementProviderFragment*) : HRESULT
    @lpVtbl.value.set_focus.call(this)
  end
  def get_fragment_root(this : IRawElementProviderFragment*, pretval : IRawElementProviderFragmentRoot*) : HRESULT
    @lpVtbl.value.get_fragment_root.call(this, pretval)
  end
end
struct LibWin32::IRawElementProviderAdviseEvents
  def query_interface(this : IRawElementProviderAdviseEvents*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRawElementProviderAdviseEvents*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRawElementProviderAdviseEvents*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def advise_event_added(this : IRawElementProviderAdviseEvents*, eventid : Int32, propertyids : SAFEARRAY*) : HRESULT
    @lpVtbl.value.advise_event_added.call(this, eventid, propertyids)
  end
  def advise_event_removed(this : IRawElementProviderAdviseEvents*, eventid : Int32, propertyids : SAFEARRAY*) : HRESULT
    @lpVtbl.value.advise_event_removed.call(this, eventid, propertyids)
  end
end
struct LibWin32::IRawElementProviderHwndOverride
  def query_interface(this : IRawElementProviderHwndOverride*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRawElementProviderHwndOverride*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRawElementProviderHwndOverride*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_override_provider_for_hwnd(this : IRawElementProviderHwndOverride*, hwnd : LibC::HANDLE, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_override_provider_for_hwnd.call(this, hwnd, pretval)
  end
end
struct LibWin32::IProxyProviderWinEventSink
  def query_interface(this : IProxyProviderWinEventSink*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IProxyProviderWinEventSink*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IProxyProviderWinEventSink*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_automation_property_changed_event(this : IProxyProviderWinEventSink*, pprovider : IRawElementProviderSimple, id : Int32, newvalue : VARIANT) : HRESULT
    @lpVtbl.value.add_automation_property_changed_event.call(this, pprovider, id, newvalue)
  end
  def add_automation_event(this : IProxyProviderWinEventSink*, pprovider : IRawElementProviderSimple, id : Int32) : HRESULT
    @lpVtbl.value.add_automation_event.call(this, pprovider, id)
  end
  def add_structure_changed_event(this : IProxyProviderWinEventSink*, pprovider : IRawElementProviderSimple, structurechangetype : StructureChangeType, runtimeid : SAFEARRAY*) : HRESULT
    @lpVtbl.value.add_structure_changed_event.call(this, pprovider, structurechangetype, runtimeid)
  end
end
struct LibWin32::IProxyProviderWinEventHandler
  def query_interface(this : IProxyProviderWinEventHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IProxyProviderWinEventHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IProxyProviderWinEventHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def respond_to_win_event(this : IProxyProviderWinEventHandler*, idwinevent : UInt32, hwnd : LibC::HANDLE, idobject : Int32, idchild : Int32, psink : IProxyProviderWinEventSink) : HRESULT
    @lpVtbl.value.respond_to_win_event.call(this, idwinevent, hwnd, idobject, idchild, psink)
  end
end
struct LibWin32::IRawElementProviderWindowlessSite
  def query_interface(this : IRawElementProviderWindowlessSite*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRawElementProviderWindowlessSite*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRawElementProviderWindowlessSite*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_adjacent_fragment(this : IRawElementProviderWindowlessSite*, direction : NavigateDirection, ppparent : IRawElementProviderFragment*) : HRESULT
    @lpVtbl.value.get_adjacent_fragment.call(this, direction, ppparent)
  end
  def get_runtime_id_prefix(this : IRawElementProviderWindowlessSite*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id_prefix.call(this, pretval)
  end
end
struct LibWin32::IAccessibleHostingElementProviders
  def query_interface(this : IAccessibleHostingElementProviders*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAccessibleHostingElementProviders*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAccessibleHostingElementProviders*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_embedded_fragment_roots(this : IAccessibleHostingElementProviders*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_embedded_fragment_roots.call(this, pretval)
  end
  def get_object_id_for_provider(this : IAccessibleHostingElementProviders*, pprovider : IRawElementProviderSimple, pidobject : Int32*) : HRESULT
    @lpVtbl.value.get_object_id_for_provider.call(this, pprovider, pidobject)
  end
end
struct LibWin32::IRawElementProviderHostingAccessibles
  def query_interface(this : IRawElementProviderHostingAccessibles*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRawElementProviderHostingAccessibles*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRawElementProviderHostingAccessibles*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_embedded_accessibles(this : IRawElementProviderHostingAccessibles*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_embedded_accessibles.call(this, pretval)
  end
end
struct LibWin32::IDockProvider
  def query_interface(this : IDockProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDockProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDockProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_dock_position(this : IDockProvider*, dockposition : DockPosition) : HRESULT
    @lpVtbl.value.set_dock_position.call(this, dockposition)
  end
  def get_dock_position(this : IDockProvider*, pretval : DockPosition*) : HRESULT
    @lpVtbl.value.get_dock_position.call(this, pretval)
  end
end
struct LibWin32::IExpandCollapseProvider
  def query_interface(this : IExpandCollapseProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IExpandCollapseProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IExpandCollapseProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def expand(this : IExpandCollapseProvider*) : HRESULT
    @lpVtbl.value.expand.call(this)
  end
  def collapse(this : IExpandCollapseProvider*) : HRESULT
    @lpVtbl.value.collapse.call(this)
  end
  def get_expand_collapse_state(this : IExpandCollapseProvider*, pretval : ExpandCollapseState*) : HRESULT
    @lpVtbl.value.get_expand_collapse_state.call(this, pretval)
  end
end
struct LibWin32::IGridProvider
  def query_interface(this : IGridProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGridProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGridProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_item(this : IGridProvider*, row : Int32, column : Int32, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_item.call(this, row, column, pretval)
  end
  def get_row_count(this : IGridProvider*, pretval : Int32*) : HRESULT
    @lpVtbl.value.get_row_count.call(this, pretval)
  end
  def get_column_count(this : IGridProvider*, pretval : Int32*) : HRESULT
    @lpVtbl.value.get_column_count.call(this, pretval)
  end
end
struct LibWin32::IGridItemProvider
  def query_interface(this : IGridItemProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IGridItemProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IGridItemProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_row(this : IGridItemProvider*, pretval : Int32*) : HRESULT
    @lpVtbl.value.get_row.call(this, pretval)
  end
  def get_column(this : IGridItemProvider*, pretval : Int32*) : HRESULT
    @lpVtbl.value.get_column.call(this, pretval)
  end
  def get_row_span(this : IGridItemProvider*, pretval : Int32*) : HRESULT
    @lpVtbl.value.get_row_span.call(this, pretval)
  end
  def get_column_span(this : IGridItemProvider*, pretval : Int32*) : HRESULT
    @lpVtbl.value.get_column_span.call(this, pretval)
  end
  def get_containing_grid(this : IGridItemProvider*, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_containing_grid.call(this, pretval)
  end
end
struct LibWin32::IInvokeProvider
  def query_interface(this : IInvokeProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IInvokeProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IInvokeProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def invoke(this : IInvokeProvider*) : HRESULT
    @lpVtbl.value.invoke.call(this)
  end
end
struct LibWin32::IMultipleViewProvider
  def query_interface(this : IMultipleViewProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IMultipleViewProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IMultipleViewProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_view_name(this : IMultipleViewProvider*, viewid : Int32, pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_view_name.call(this, viewid, pretval)
  end
  def set_current_view(this : IMultipleViewProvider*, viewid : Int32) : HRESULT
    @lpVtbl.value.set_current_view.call(this, viewid)
  end
  def get_current_view(this : IMultipleViewProvider*, pretval : Int32*) : HRESULT
    @lpVtbl.value.get_current_view.call(this, pretval)
  end
  def get_supported_views(this : IMultipleViewProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_supported_views.call(this, pretval)
  end
end
struct LibWin32::IRangeValueProvider
  def query_interface(this : IRangeValueProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IRangeValueProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IRangeValueProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_value(this : IRangeValueProvider*, val : Float64) : HRESULT
    @lpVtbl.value.set_value.call(this, val)
  end
  def get_value(this : IRangeValueProvider*, pretval : Float64*) : HRESULT
    @lpVtbl.value.get_value.call(this, pretval)
  end
  def get_is_read_only(this : IRangeValueProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_read_only.call(this, pretval)
  end
  def get_maximum(this : IRangeValueProvider*, pretval : Float64*) : HRESULT
    @lpVtbl.value.get_maximum.call(this, pretval)
  end
  def get_minimum(this : IRangeValueProvider*, pretval : Float64*) : HRESULT
    @lpVtbl.value.get_minimum.call(this, pretval)
  end
  def get_large_change(this : IRangeValueProvider*, pretval : Float64*) : HRESULT
    @lpVtbl.value.get_large_change.call(this, pretval)
  end
  def get_small_change(this : IRangeValueProvider*, pretval : Float64*) : HRESULT
    @lpVtbl.value.get_small_change.call(this, pretval)
  end
end
struct LibWin32::IScrollItemProvider
  def query_interface(this : IScrollItemProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IScrollItemProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IScrollItemProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def scroll_into_view(this : IScrollItemProvider*) : HRESULT
    @lpVtbl.value.scroll_into_view.call(this)
  end
end
struct LibWin32::ISelectionProvider
  def query_interface(this : ISelectionProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISelectionProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISelectionProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_selection(this : ISelectionProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_selection.call(this, pretval)
  end
  def get_can_select_multiple(this : ISelectionProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_select_multiple.call(this, pretval)
  end
  def get_is_selection_required(this : ISelectionProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_selection_required.call(this, pretval)
  end
end
struct LibWin32::ISelectionProvider2
  def query_interface(this : ISelectionProvider2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISelectionProvider2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISelectionProvider2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_selection(this : ISelectionProvider2*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_selection.call(this, pretval)
  end
  def get_can_select_multiple(this : ISelectionProvider2*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_select_multiple.call(this, pretval)
  end
  def get_is_selection_required(this : ISelectionProvider2*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_selection_required.call(this, pretval)
  end
  def get_first_selected_item(this : ISelectionProvider2*, retval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_first_selected_item.call(this, retval)
  end
  def get_last_selected_item(this : ISelectionProvider2*, retval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_last_selected_item.call(this, retval)
  end
  def get_current_selected_item(this : ISelectionProvider2*, retval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_current_selected_item.call(this, retval)
  end
  def get_item_count(this : ISelectionProvider2*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_item_count.call(this, retval)
  end
end
struct LibWin32::IScrollProvider
  def query_interface(this : IScrollProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IScrollProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IScrollProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def scroll(this : IScrollProvider*, horizontalamount : ScrollAmount, verticalamount : ScrollAmount) : HRESULT
    @lpVtbl.value.scroll.call(this, horizontalamount, verticalamount)
  end
  def set_scroll_percent(this : IScrollProvider*, horizontalpercent : Float64, verticalpercent : Float64) : HRESULT
    @lpVtbl.value.set_scroll_percent.call(this, horizontalpercent, verticalpercent)
  end
  def get_horizontal_scroll_percent(this : IScrollProvider*, pretval : Float64*) : HRESULT
    @lpVtbl.value.get_horizontal_scroll_percent.call(this, pretval)
  end
  def get_vertical_scroll_percent(this : IScrollProvider*, pretval : Float64*) : HRESULT
    @lpVtbl.value.get_vertical_scroll_percent.call(this, pretval)
  end
  def get_horizontal_view_size(this : IScrollProvider*, pretval : Float64*) : HRESULT
    @lpVtbl.value.get_horizontal_view_size.call(this, pretval)
  end
  def get_vertical_view_size(this : IScrollProvider*, pretval : Float64*) : HRESULT
    @lpVtbl.value.get_vertical_view_size.call(this, pretval)
  end
  def get_horizontally_scrollable(this : IScrollProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_horizontally_scrollable.call(this, pretval)
  end
  def get_vertically_scrollable(this : IScrollProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_vertically_scrollable.call(this, pretval)
  end
end
struct LibWin32::ISelectionItemProvider
  def query_interface(this : ISelectionItemProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISelectionItemProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISelectionItemProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def select(this : ISelectionItemProvider*) : HRESULT
    @lpVtbl.value.select.call(this)
  end
  def add_to_selection(this : ISelectionItemProvider*) : HRESULT
    @lpVtbl.value.add_to_selection.call(this)
  end
  def remove_from_selection(this : ISelectionItemProvider*) : HRESULT
    @lpVtbl.value.remove_from_selection.call(this)
  end
  def get_is_selected(this : ISelectionItemProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_selected.call(this, pretval)
  end
  def get_selection_container(this : ISelectionItemProvider*, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_selection_container.call(this, pretval)
  end
end
struct LibWin32::ISynchronizedInputProvider
  def query_interface(this : ISynchronizedInputProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISynchronizedInputProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISynchronizedInputProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def start_listening(this : ISynchronizedInputProvider*, inputtype : SynchronizedInputType) : HRESULT
    @lpVtbl.value.start_listening.call(this, inputtype)
  end
  def cancel(this : ISynchronizedInputProvider*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
end
struct LibWin32::ITableProvider
  def query_interface(this : ITableProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITableProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITableProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_row_headers(this : ITableProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_row_headers.call(this, pretval)
  end
  def get_column_headers(this : ITableProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_column_headers.call(this, pretval)
  end
  def get_row_or_column_major(this : ITableProvider*, pretval : RowOrColumnMajor*) : HRESULT
    @lpVtbl.value.get_row_or_column_major.call(this, pretval)
  end
end
struct LibWin32::ITableItemProvider
  def query_interface(this : ITableItemProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITableItemProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITableItemProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_row_header_items(this : ITableItemProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_row_header_items.call(this, pretval)
  end
  def get_column_header_items(this : ITableItemProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_column_header_items.call(this, pretval)
  end
end
struct LibWin32::IToggleProvider
  def query_interface(this : IToggleProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IToggleProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IToggleProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def toggle(this : IToggleProvider*) : HRESULT
    @lpVtbl.value.toggle.call(this)
  end
  def get_toggle_state(this : IToggleProvider*, pretval : ToggleState*) : HRESULT
    @lpVtbl.value.get_toggle_state.call(this, pretval)
  end
end
struct LibWin32::ITransformProvider
  def query_interface(this : ITransformProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransformProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransformProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def move(this : ITransformProvider*, x : Float64, y : Float64) : HRESULT
    @lpVtbl.value.move.call(this, x, y)
  end
  def resize(this : ITransformProvider*, width : Float64, height : Float64) : HRESULT
    @lpVtbl.value.resize.call(this, width, height)
  end
  def rotate(this : ITransformProvider*, degrees : Float64) : HRESULT
    @lpVtbl.value.rotate.call(this, degrees)
  end
  def get_can_move(this : ITransformProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_move.call(this, pretval)
  end
  def get_can_resize(this : ITransformProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_resize.call(this, pretval)
  end
  def get_can_rotate(this : ITransformProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_rotate.call(this, pretval)
  end
end
struct LibWin32::IValueProvider
  def query_interface(this : IValueProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IValueProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IValueProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_value(this : IValueProvider*, val : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_value.call(this, val)
  end
  def get_value(this : IValueProvider*, pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_value.call(this, pretval)
  end
  def get_is_read_only(this : IValueProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_read_only.call(this, pretval)
  end
end
struct LibWin32::IWindowProvider
  def query_interface(this : IWindowProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IWindowProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IWindowProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_visual_state(this : IWindowProvider*, state : WindowVisualState) : HRESULT
    @lpVtbl.value.set_visual_state.call(this, state)
  end
  def close(this : IWindowProvider*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def wait_for_input_idle(this : IWindowProvider*, milliseconds : Int32, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.wait_for_input_idle.call(this, milliseconds, pretval)
  end
  def get_can_maximize(this : IWindowProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_maximize.call(this, pretval)
  end
  def get_can_minimize(this : IWindowProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_minimize.call(this, pretval)
  end
  def get_is_modal(this : IWindowProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_modal.call(this, pretval)
  end
  def get_window_visual_state(this : IWindowProvider*, pretval : WindowVisualState*) : HRESULT
    @lpVtbl.value.get_window_visual_state.call(this, pretval)
  end
  def get_window_interaction_state(this : IWindowProvider*, pretval : WindowInteractionState*) : HRESULT
    @lpVtbl.value.get_window_interaction_state.call(this, pretval)
  end
  def get_is_topmost(this : IWindowProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_topmost.call(this, pretval)
  end
end
struct LibWin32::ILegacyIAccessibleProvider
  def query_interface(this : ILegacyIAccessibleProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ILegacyIAccessibleProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ILegacyIAccessibleProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def select(this : ILegacyIAccessibleProvider*, flagsselect : Int32) : HRESULT
    @lpVtbl.value.select.call(this, flagsselect)
  end
  def do_default_action(this : ILegacyIAccessibleProvider*) : HRESULT
    @lpVtbl.value.do_default_action.call(this)
  end
  def set_value(this : ILegacyIAccessibleProvider*, szvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_value.call(this, szvalue)
  end
  def get_i_accessible(this : ILegacyIAccessibleProvider*, ppaccessible : IAccessible*) : HRESULT
    @lpVtbl.value.get_i_accessible.call(this, ppaccessible)
  end
  def get_child_id(this : ILegacyIAccessibleProvider*, pretval : Int32*) : HRESULT
    @lpVtbl.value.get_child_id.call(this, pretval)
  end
  def get_name(this : ILegacyIAccessibleProvider*, pszname : UInt8**) : HRESULT
    @lpVtbl.value.get_name.call(this, pszname)
  end
  def get_value(this : ILegacyIAccessibleProvider*, pszvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_value.call(this, pszvalue)
  end
  def get_description(this : ILegacyIAccessibleProvider*, pszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_description.call(this, pszdescription)
  end
  def get_role(this : ILegacyIAccessibleProvider*, pdwrole : UInt32*) : HRESULT
    @lpVtbl.value.get_role.call(this, pdwrole)
  end
  def get_state(this : ILegacyIAccessibleProvider*, pdwstate : UInt32*) : HRESULT
    @lpVtbl.value.get_state.call(this, pdwstate)
  end
  def get_help(this : ILegacyIAccessibleProvider*, pszhelp : UInt8**) : HRESULT
    @lpVtbl.value.get_help.call(this, pszhelp)
  end
  def get_keyboard_shortcut(this : ILegacyIAccessibleProvider*, pszkeyboardshortcut : UInt8**) : HRESULT
    @lpVtbl.value.get_keyboard_shortcut.call(this, pszkeyboardshortcut)
  end
  def get_selection(this : ILegacyIAccessibleProvider*, pvarselectedchildren : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_selection.call(this, pvarselectedchildren)
  end
  def get_default_action(this : ILegacyIAccessibleProvider*, pszdefaultaction : UInt8**) : HRESULT
    @lpVtbl.value.get_default_action.call(this, pszdefaultaction)
  end
end
struct LibWin32::IItemContainerProvider
  def query_interface(this : IItemContainerProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IItemContainerProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IItemContainerProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def find_item_by_property(this : IItemContainerProvider*, pstartafter : IRawElementProviderSimple, propertyid : Int32, value : VARIANT, pfound : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.find_item_by_property.call(this, pstartafter, propertyid, value, pfound)
  end
end
struct LibWin32::IVirtualizedItemProvider
  def query_interface(this : IVirtualizedItemProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IVirtualizedItemProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IVirtualizedItemProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def realize(this : IVirtualizedItemProvider*) : HRESULT
    @lpVtbl.value.realize.call(this)
  end
end
struct LibWin32::IObjectModelProvider
  def query_interface(this : IObjectModelProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IObjectModelProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IObjectModelProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_underlying_object_model(this : IObjectModelProvider*, ppunknown : IUnknown*) : HRESULT
    @lpVtbl.value.get_underlying_object_model.call(this, ppunknown)
  end
end
struct LibWin32::IAnnotationProvider
  def query_interface(this : IAnnotationProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IAnnotationProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IAnnotationProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_annotation_type_id(this : IAnnotationProvider*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_annotation_type_id.call(this, retval)
  end
  def get_annotation_type_name(this : IAnnotationProvider*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_annotation_type_name.call(this, retval)
  end
  def get_author(this : IAnnotationProvider*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_author.call(this, retval)
  end
  def get_date_time(this : IAnnotationProvider*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_date_time.call(this, retval)
  end
  def get_target(this : IAnnotationProvider*, retval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_target.call(this, retval)
  end
end
struct LibWin32::IStylesProvider
  def query_interface(this : IStylesProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IStylesProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IStylesProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_style_id(this : IStylesProvider*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_style_id.call(this, retval)
  end
  def get_style_name(this : IStylesProvider*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_style_name.call(this, retval)
  end
  def get_fill_color(this : IStylesProvider*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_fill_color.call(this, retval)
  end
  def get_fill_pattern_style(this : IStylesProvider*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_fill_pattern_style.call(this, retval)
  end
  def get_shape(this : IStylesProvider*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_shape.call(this, retval)
  end
  def get_fill_pattern_color(this : IStylesProvider*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_fill_pattern_color.call(this, retval)
  end
  def get_extended_properties(this : IStylesProvider*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_extended_properties.call(this, retval)
  end
end
struct LibWin32::ISpreadsheetProvider
  def query_interface(this : ISpreadsheetProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISpreadsheetProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISpreadsheetProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_item_by_name(this : ISpreadsheetProvider*, name : LibC::LPWSTR, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_item_by_name.call(this, name, pretval)
  end
end
struct LibWin32::ISpreadsheetItemProvider
  def query_interface(this : ISpreadsheetItemProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ISpreadsheetItemProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ISpreadsheetItemProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_formula(this : ISpreadsheetItemProvider*, pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_formula.call(this, pretval)
  end
  def get_annotation_objects(this : ISpreadsheetItemProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_annotation_objects.call(this, pretval)
  end
  def get_annotation_types(this : ISpreadsheetItemProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_annotation_types.call(this, pretval)
  end
end
struct LibWin32::ITransformProvider2
  def query_interface(this : ITransformProvider2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITransformProvider2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITransformProvider2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def move(this : ITransformProvider2*, x : Float64, y : Float64) : HRESULT
    @lpVtbl.value.move.call(this, x, y)
  end
  def resize(this : ITransformProvider2*, width : Float64, height : Float64) : HRESULT
    @lpVtbl.value.resize.call(this, width, height)
  end
  def rotate(this : ITransformProvider2*, degrees : Float64) : HRESULT
    @lpVtbl.value.rotate.call(this, degrees)
  end
  def get_can_move(this : ITransformProvider2*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_move.call(this, pretval)
  end
  def get_can_resize(this : ITransformProvider2*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_resize.call(this, pretval)
  end
  def get_can_rotate(this : ITransformProvider2*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_rotate.call(this, pretval)
  end
  def zoom(this : ITransformProvider2*, zoom : Float64) : HRESULT
    @lpVtbl.value.zoom.call(this, zoom)
  end
  def get_can_zoom(this : ITransformProvider2*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_zoom.call(this, pretval)
  end
  def get_zoom_level(this : ITransformProvider2*, pretval : Float64*) : HRESULT
    @lpVtbl.value.get_zoom_level.call(this, pretval)
  end
  def get_zoom_minimum(this : ITransformProvider2*, pretval : Float64*) : HRESULT
    @lpVtbl.value.get_zoom_minimum.call(this, pretval)
  end
  def get_zoom_maximum(this : ITransformProvider2*, pretval : Float64*) : HRESULT
    @lpVtbl.value.get_zoom_maximum.call(this, pretval)
  end
  def zoom_by_unit(this : ITransformProvider2*, zoomunit : ZoomUnit) : HRESULT
    @lpVtbl.value.zoom_by_unit.call(this, zoomunit)
  end
end
struct LibWin32::IDragProvider
  def query_interface(this : IDragProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDragProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDragProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_is_grabbed(this : IDragProvider*, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_is_grabbed.call(this, pretval)
  end
  def get_drop_effect(this : IDragProvider*, pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_drop_effect.call(this, pretval)
  end
  def get_drop_effects(this : IDragProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_drop_effects.call(this, pretval)
  end
  def get_grabbed_items(this : IDragProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_grabbed_items.call(this, pretval)
  end
end
struct LibWin32::IDropTargetProvider
  def query_interface(this : IDropTargetProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IDropTargetProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IDropTargetProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_drop_target_effect(this : IDropTargetProvider*, pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_drop_target_effect.call(this, pretval)
  end
  def get_drop_target_effects(this : IDropTargetProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_drop_target_effects.call(this, pretval)
  end
end
struct LibWin32::ITextRangeProvider
  def query_interface(this : ITextRangeProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITextRangeProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITextRangeProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def clone(this : ITextRangeProvider*, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.clone.call(this, pretval)
  end
  def compare(this : ITextRangeProvider*, range : ITextRangeProvider, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare.call(this, range, pretval)
  end
  def compare_endpoints(this : ITextRangeProvider*, endpoint : TextPatternRangeEndpoint, targetrange : ITextRangeProvider, targetendpoint : TextPatternRangeEndpoint, pretval : Int32*) : HRESULT
    @lpVtbl.value.compare_endpoints.call(this, endpoint, targetrange, targetendpoint, pretval)
  end
  def expand_to_enclosing_unit(this : ITextRangeProvider*, unit : TextUnit) : HRESULT
    @lpVtbl.value.expand_to_enclosing_unit.call(this, unit)
  end
  def find_attribute(this : ITextRangeProvider*, attributeid : Int32, val : VARIANT, backward : LibC::BOOL, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.find_attribute.call(this, attributeid, val, backward, pretval)
  end
  def find_text(this : ITextRangeProvider*, text : UInt8*, backward : LibC::BOOL, ignorecase : LibC::BOOL, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.find_text.call(this, text, backward, ignorecase, pretval)
  end
  def get_attribute_value(this : ITextRangeProvider*, attributeid : Int32, pretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute_value.call(this, attributeid, pretval)
  end
  def get_bounding_rectangles(this : ITextRangeProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_bounding_rectangles.call(this, pretval)
  end
  def get_enclosing_element(this : ITextRangeProvider*, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_enclosing_element.call(this, pretval)
  end
  def get_text(this : ITextRangeProvider*, maxlength : Int32, pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_text.call(this, maxlength, pretval)
  end
  def move(this : ITextRangeProvider*, unit : TextUnit, count : Int32, pretval : Int32*) : HRESULT
    @lpVtbl.value.move.call(this, unit, count, pretval)
  end
  def move_endpoint_by_unit(this : ITextRangeProvider*, endpoint : TextPatternRangeEndpoint, unit : TextUnit, count : Int32, pretval : Int32*) : HRESULT
    @lpVtbl.value.move_endpoint_by_unit.call(this, endpoint, unit, count, pretval)
  end
  def move_endpoint_by_range(this : ITextRangeProvider*, endpoint : TextPatternRangeEndpoint, targetrange : ITextRangeProvider, targetendpoint : TextPatternRangeEndpoint) : HRESULT
    @lpVtbl.value.move_endpoint_by_range.call(this, endpoint, targetrange, targetendpoint)
  end
  def select(this : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.select.call(this)
  end
  def add_to_selection(this : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.add_to_selection.call(this)
  end
  def remove_from_selection(this : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.remove_from_selection.call(this)
  end
  def scroll_into_view(this : ITextRangeProvider*, aligntotop : LibC::BOOL) : HRESULT
    @lpVtbl.value.scroll_into_view.call(this, aligntotop)
  end
  def get_children(this : ITextRangeProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_children.call(this, pretval)
  end
end
struct LibWin32::ITextProvider
  def query_interface(this : ITextProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITextProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITextProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_selection(this : ITextProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_selection.call(this, pretval)
  end
  def get_visible_ranges(this : ITextProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_visible_ranges.call(this, pretval)
  end
  def range_from_child(this : ITextProvider*, childelement : IRawElementProviderSimple, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.range_from_child.call(this, childelement, pretval)
  end
  def range_from_point(this : ITextProvider*, point : UiaPoint, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.range_from_point.call(this, point, pretval)
  end
  def get_document_range(this : ITextProvider*, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.get_document_range.call(this, pretval)
  end
  def get_supported_text_selection(this : ITextProvider*, pretval : SupportedTextSelection*) : HRESULT
    @lpVtbl.value.get_supported_text_selection.call(this, pretval)
  end
end
struct LibWin32::ITextProvider2
  def query_interface(this : ITextProvider2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITextProvider2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITextProvider2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_selection(this : ITextProvider2*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_selection.call(this, pretval)
  end
  def get_visible_ranges(this : ITextProvider2*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_visible_ranges.call(this, pretval)
  end
  def range_from_child(this : ITextProvider2*, childelement : IRawElementProviderSimple, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.range_from_child.call(this, childelement, pretval)
  end
  def range_from_point(this : ITextProvider2*, point : UiaPoint, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.range_from_point.call(this, point, pretval)
  end
  def get_document_range(this : ITextProvider2*, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.get_document_range.call(this, pretval)
  end
  def get_supported_text_selection(this : ITextProvider2*, pretval : SupportedTextSelection*) : HRESULT
    @lpVtbl.value.get_supported_text_selection.call(this, pretval)
  end
  def range_from_annotation(this : ITextProvider2*, annotationelement : IRawElementProviderSimple, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.range_from_annotation.call(this, annotationelement, pretval)
  end
  def get_caret_range(this : ITextProvider2*, isactive : LibC::BOOL*, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.get_caret_range.call(this, isactive, pretval)
  end
end
struct LibWin32::ITextEditProvider
  def query_interface(this : ITextEditProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITextEditProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITextEditProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_selection(this : ITextEditProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_selection.call(this, pretval)
  end
  def get_visible_ranges(this : ITextEditProvider*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_visible_ranges.call(this, pretval)
  end
  def range_from_child(this : ITextEditProvider*, childelement : IRawElementProviderSimple, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.range_from_child.call(this, childelement, pretval)
  end
  def range_from_point(this : ITextEditProvider*, point : UiaPoint, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.range_from_point.call(this, point, pretval)
  end
  def get_document_range(this : ITextEditProvider*, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.get_document_range.call(this, pretval)
  end
  def get_supported_text_selection(this : ITextEditProvider*, pretval : SupportedTextSelection*) : HRESULT
    @lpVtbl.value.get_supported_text_selection.call(this, pretval)
  end
  def get_active_composition(this : ITextEditProvider*, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.get_active_composition.call(this, pretval)
  end
  def get_conversion_target(this : ITextEditProvider*, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.get_conversion_target.call(this, pretval)
  end
end
struct LibWin32::ITextRangeProvider2
  def query_interface(this : ITextRangeProvider2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITextRangeProvider2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITextRangeProvider2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def clone(this : ITextRangeProvider2*, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.clone.call(this, pretval)
  end
  def compare(this : ITextRangeProvider2*, range : ITextRangeProvider, pretval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare.call(this, range, pretval)
  end
  def compare_endpoints(this : ITextRangeProvider2*, endpoint : TextPatternRangeEndpoint, targetrange : ITextRangeProvider, targetendpoint : TextPatternRangeEndpoint, pretval : Int32*) : HRESULT
    @lpVtbl.value.compare_endpoints.call(this, endpoint, targetrange, targetendpoint, pretval)
  end
  def expand_to_enclosing_unit(this : ITextRangeProvider2*, unit : TextUnit) : HRESULT
    @lpVtbl.value.expand_to_enclosing_unit.call(this, unit)
  end
  def find_attribute(this : ITextRangeProvider2*, attributeid : Int32, val : VARIANT, backward : LibC::BOOL, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.find_attribute.call(this, attributeid, val, backward, pretval)
  end
  def find_text(this : ITextRangeProvider2*, text : UInt8*, backward : LibC::BOOL, ignorecase : LibC::BOOL, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.find_text.call(this, text, backward, ignorecase, pretval)
  end
  def get_attribute_value(this : ITextRangeProvider2*, attributeid : Int32, pretval : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute_value.call(this, attributeid, pretval)
  end
  def get_bounding_rectangles(this : ITextRangeProvider2*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_bounding_rectangles.call(this, pretval)
  end
  def get_enclosing_element(this : ITextRangeProvider2*, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_enclosing_element.call(this, pretval)
  end
  def get_text(this : ITextRangeProvider2*, maxlength : Int32, pretval : UInt8**) : HRESULT
    @lpVtbl.value.get_text.call(this, maxlength, pretval)
  end
  def move(this : ITextRangeProvider2*, unit : TextUnit, count : Int32, pretval : Int32*) : HRESULT
    @lpVtbl.value.move.call(this, unit, count, pretval)
  end
  def move_endpoint_by_unit(this : ITextRangeProvider2*, endpoint : TextPatternRangeEndpoint, unit : TextUnit, count : Int32, pretval : Int32*) : HRESULT
    @lpVtbl.value.move_endpoint_by_unit.call(this, endpoint, unit, count, pretval)
  end
  def move_endpoint_by_range(this : ITextRangeProvider2*, endpoint : TextPatternRangeEndpoint, targetrange : ITextRangeProvider, targetendpoint : TextPatternRangeEndpoint) : HRESULT
    @lpVtbl.value.move_endpoint_by_range.call(this, endpoint, targetrange, targetendpoint)
  end
  def select(this : ITextRangeProvider2*) : HRESULT
    @lpVtbl.value.select.call(this)
  end
  def add_to_selection(this : ITextRangeProvider2*) : HRESULT
    @lpVtbl.value.add_to_selection.call(this)
  end
  def remove_from_selection(this : ITextRangeProvider2*) : HRESULT
    @lpVtbl.value.remove_from_selection.call(this)
  end
  def scroll_into_view(this : ITextRangeProvider2*, aligntotop : LibC::BOOL) : HRESULT
    @lpVtbl.value.scroll_into_view.call(this, aligntotop)
  end
  def get_children(this : ITextRangeProvider2*, pretval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_children.call(this, pretval)
  end
  def show_context_menu(this : ITextRangeProvider2*) : HRESULT
    @lpVtbl.value.show_context_menu.call(this)
  end
end
struct LibWin32::ITextChildProvider
  def query_interface(this : ITextChildProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ITextChildProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ITextChildProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_text_container(this : ITextChildProvider*, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.get_text_container.call(this, pretval)
  end
  def get_text_range(this : ITextChildProvider*, pretval : ITextRangeProvider*) : HRESULT
    @lpVtbl.value.get_text_range.call(this, pretval)
  end
end
struct LibWin32::ICustomNavigationProvider
  def query_interface(this : ICustomNavigationProvider*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : ICustomNavigationProvider*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : ICustomNavigationProvider*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def navigate(this : ICustomNavigationProvider*, direction : NavigateDirection, pretval : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.navigate.call(this, direction, pretval)
  end
end
struct LibWin32::IUIAutomationPatternInstance
  def query_interface(this : IUIAutomationPatternInstance*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationPatternInstance*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationPatternInstance*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_property(this : IUIAutomationPatternInstance*, index : UInt32, cached : LibC::BOOL, type : UIAutomationType, pptr : Void*) : HRESULT
    @lpVtbl.value.get_property.call(this, index, cached, type, pptr)
  end
  def call_method(this : IUIAutomationPatternInstance*, index : UInt32, pparams : UIAutomationParameter*, cparams : UInt32) : HRESULT
    @lpVtbl.value.call_method.call(this, index, pparams, cparams)
  end
end
struct LibWin32::IUIAutomationPatternHandler
  def query_interface(this : IUIAutomationPatternHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationPatternHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationPatternHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_client_wrapper(this : IUIAutomationPatternHandler*, ppatterninstance : IUIAutomationPatternInstance, pclientwrapper : IUnknown*) : HRESULT
    @lpVtbl.value.create_client_wrapper.call(this, ppatterninstance, pclientwrapper)
  end
  def dispatch(this : IUIAutomationPatternHandler*, ptarget : IUnknown, index : UInt32, pparams : UIAutomationParameter*, cparams : UInt32) : HRESULT
    @lpVtbl.value.dispatch.call(this, ptarget, index, pparams, cparams)
  end
end
struct LibWin32::IUIAutomationRegistrar
  def query_interface(this : IUIAutomationRegistrar*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationRegistrar*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationRegistrar*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def register_property(this : IUIAutomationRegistrar*, property : UIAutomationPropertyInfo*, propertyid : Int32*) : HRESULT
    @lpVtbl.value.register_property.call(this, property, propertyid)
  end
  def register_event(this : IUIAutomationRegistrar*, event : UIAutomationEventInfo*, eventid : Int32*) : HRESULT
    @lpVtbl.value.register_event.call(this, event, eventid)
  end
  def register_pattern(this : IUIAutomationRegistrar*, pattern : UIAutomationPatternInfo*, ppatternid : Int32*, ppatternavailablepropertyid : Int32*, propertyidcount : UInt32, ppropertyids : Int32*, eventidcount : UInt32, peventids : Int32*) : HRESULT
    @lpVtbl.value.register_pattern.call(this, pattern, ppatternid, ppatternavailablepropertyid, propertyidcount, ppropertyids, eventidcount, peventids)
  end
end
struct LibWin32::IUIAutomationElement
  def query_interface(this : IUIAutomationElement*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationElement*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationElement*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_focus(this : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.set_focus.call(this)
  end
  def get_runtime_id(this : IUIAutomationElement*, runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.call(this, runtimeid)
  end
  def find_first(this : IUIAutomationElement*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.call(this, scope, condition, found)
  end
  def find_all(this : IUIAutomationElement*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.call(this, scope, condition, found)
  end
  def find_first_build_cache(this : IUIAutomationElement*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def find_all_build_cache(this : IUIAutomationElement*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def build_updated_cache(this : IUIAutomationElement*, cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.call(this, cacherequest, updatedelement)
  end
  def get_current_property_value(this : IUIAutomationElement*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.call(this, propertyid, retval)
  end
  def get_current_property_value_ex(this : IUIAutomationElement*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(this : IUIAutomationElement*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.call(this, propertyid, retval)
  end
  def get_cached_property_value_ex(this : IUIAutomationElement*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(this : IUIAutomationElement*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_cached_pattern_as(this : IUIAutomationElement*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_current_pattern(this : IUIAutomationElement*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.call(this, patternid, patternobject)
  end
  def get_cached_pattern(this : IUIAutomationElement*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.call(this, patternid, patternobject)
  end
  def get_cached_parent(this : IUIAutomationElement*, parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.call(this, parent)
  end
  def get_cached_children(this : IUIAutomationElement*, children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.call(this, children)
  end
  def get_current_process_id(this : IUIAutomationElement*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.call(this, retval)
  end
  def get_current_control_type(this : IUIAutomationElement*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.call(this, retval)
  end
  def get_current_localized_control_type(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.call(this, retval)
  end
  def get_current_name(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.call(this, retval)
  end
  def get_current_accelerator_key(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.call(this, retval)
  end
  def get_current_access_key(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.call(this, retval)
  end
  def get_current_has_keyboard_focus(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.call(this, retval)
  end
  def get_current_is_keyboard_focusable(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.call(this, retval)
  end
  def get_current_is_enabled(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.call(this, retval)
  end
  def get_current_automation_id(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.call(this, retval)
  end
  def get_current_class_name(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.call(this, retval)
  end
  def get_current_help_text(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.call(this, retval)
  end
  def get_current_culture(this : IUIAutomationElement*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.call(this, retval)
  end
  def get_current_is_control_element(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.call(this, retval)
  end
  def get_current_is_content_element(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.call(this, retval)
  end
  def get_current_is_password(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.call(this, retval)
  end
  def get_current_native_window_handle(this : IUIAutomationElement*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.call(this, retval)
  end
  def get_current_item_type(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.call(this, retval)
  end
  def get_current_is_offscreen(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.call(this, retval)
  end
  def get_current_orientation(this : IUIAutomationElement*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.call(this, retval)
  end
  def get_current_framework_id(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.call(this, retval)
  end
  def get_current_is_required_for_form(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.call(this, retval)
  end
  def get_current_item_status(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.call(this, retval)
  end
  def get_current_bounding_rectangle(this : IUIAutomationElement*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.call(this, retval)
  end
  def get_current_labeled_by(this : IUIAutomationElement*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.call(this, retval)
  end
  def get_current_aria_role(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.call(this, retval)
  end
  def get_current_aria_properties(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.call(this, retval)
  end
  def get_current_is_data_valid_for_form(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.call(this, retval)
  end
  def get_current_controller_for(this : IUIAutomationElement*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.call(this, retval)
  end
  def get_current_described_by(this : IUIAutomationElement*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.call(this, retval)
  end
  def get_current_flows_to(this : IUIAutomationElement*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.call(this, retval)
  end
  def get_current_provider_description(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.call(this, retval)
  end
  def get_cached_process_id(this : IUIAutomationElement*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.call(this, retval)
  end
  def get_cached_control_type(this : IUIAutomationElement*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.call(this, retval)
  end
  def get_cached_localized_control_type(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.call(this, retval)
  end
  def get_cached_name(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.call(this, retval)
  end
  def get_cached_accelerator_key(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.call(this, retval)
  end
  def get_cached_access_key(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.call(this, retval)
  end
  def get_cached_has_keyboard_focus(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.call(this, retval)
  end
  def get_cached_is_keyboard_focusable(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.call(this, retval)
  end
  def get_cached_is_enabled(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.call(this, retval)
  end
  def get_cached_automation_id(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.call(this, retval)
  end
  def get_cached_class_name(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.call(this, retval)
  end
  def get_cached_help_text(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.call(this, retval)
  end
  def get_cached_culture(this : IUIAutomationElement*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.call(this, retval)
  end
  def get_cached_is_control_element(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.call(this, retval)
  end
  def get_cached_is_content_element(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.call(this, retval)
  end
  def get_cached_is_password(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.call(this, retval)
  end
  def get_cached_native_window_handle(this : IUIAutomationElement*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.call(this, retval)
  end
  def get_cached_item_type(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.call(this, retval)
  end
  def get_cached_is_offscreen(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.call(this, retval)
  end
  def get_cached_orientation(this : IUIAutomationElement*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.call(this, retval)
  end
  def get_cached_framework_id(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.call(this, retval)
  end
  def get_cached_is_required_for_form(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.call(this, retval)
  end
  def get_cached_item_status(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.call(this, retval)
  end
  def get_cached_bounding_rectangle(this : IUIAutomationElement*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.call(this, retval)
  end
  def get_cached_labeled_by(this : IUIAutomationElement*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.call(this, retval)
  end
  def get_cached_aria_role(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.call(this, retval)
  end
  def get_cached_aria_properties(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.call(this, retval)
  end
  def get_cached_is_data_valid_for_form(this : IUIAutomationElement*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.call(this, retval)
  end
  def get_cached_controller_for(this : IUIAutomationElement*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.call(this, retval)
  end
  def get_cached_described_by(this : IUIAutomationElement*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.call(this, retval)
  end
  def get_cached_flows_to(this : IUIAutomationElement*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.call(this, retval)
  end
  def get_cached_provider_description(this : IUIAutomationElement*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.call(this, retval)
  end
  def get_clickable_point(this : IUIAutomationElement*, clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.call(this, clickable, gotclickable)
  end
end
struct LibWin32::IUIAutomationElementArray
  def query_interface(this : IUIAutomationElementArray*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationElementArray*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationElementArray*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_length(this : IUIAutomationElementArray*, length : Int32*) : HRESULT
    @lpVtbl.value.get_length.call(this, length)
  end
  def get_element(this : IUIAutomationElementArray*, index : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_element.call(this, index, element)
  end
end
struct LibWin32::IUIAutomationCondition
  def query_interface(this : IUIAutomationCondition*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationCondition*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationCondition*) : UInt32
    @lpVtbl.value.release.call(this)
  end
end
struct LibWin32::IUIAutomationBoolCondition
  def query_interface(this : IUIAutomationBoolCondition*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationBoolCondition*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationBoolCondition*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_boolean_value(this : IUIAutomationBoolCondition*, boolval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_boolean_value.call(this, boolval)
  end
end
struct LibWin32::IUIAutomationPropertyCondition
  def query_interface(this : IUIAutomationPropertyCondition*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationPropertyCondition*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationPropertyCondition*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_property_id(this : IUIAutomationPropertyCondition*, propertyid : Int32*) : HRESULT
    @lpVtbl.value.get_property_id.call(this, propertyid)
  end
  def get_property_value(this : IUIAutomationPropertyCondition*, propertyvalue : VARIANT*) : HRESULT
    @lpVtbl.value.get_property_value.call(this, propertyvalue)
  end
  def get_property_condition_flags(this : IUIAutomationPropertyCondition*, flags : PropertyConditionFlags*) : HRESULT
    @lpVtbl.value.get_property_condition_flags.call(this, flags)
  end
end
struct LibWin32::IUIAutomationAndCondition
  def query_interface(this : IUIAutomationAndCondition*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationAndCondition*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationAndCondition*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_child_count(this : IUIAutomationAndCondition*, childcount : Int32*) : HRESULT
    @lpVtbl.value.get_child_count.call(this, childcount)
  end
  def get_children_as_native_array(this : IUIAutomationAndCondition*, childarray : IUIAutomationCondition**, childarraycount : Int32*) : HRESULT
    @lpVtbl.value.get_children_as_native_array.call(this, childarray, childarraycount)
  end
  def get_children(this : IUIAutomationAndCondition*, childarray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_children.call(this, childarray)
  end
end
struct LibWin32::IUIAutomationOrCondition
  def query_interface(this : IUIAutomationOrCondition*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationOrCondition*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationOrCondition*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_child_count(this : IUIAutomationOrCondition*, childcount : Int32*) : HRESULT
    @lpVtbl.value.get_child_count.call(this, childcount)
  end
  def get_children_as_native_array(this : IUIAutomationOrCondition*, childarray : IUIAutomationCondition**, childarraycount : Int32*) : HRESULT
    @lpVtbl.value.get_children_as_native_array.call(this, childarray, childarraycount)
  end
  def get_children(this : IUIAutomationOrCondition*, childarray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_children.call(this, childarray)
  end
end
struct LibWin32::IUIAutomationNotCondition
  def query_interface(this : IUIAutomationNotCondition*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationNotCondition*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationNotCondition*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_child(this : IUIAutomationNotCondition*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_child.call(this, condition)
  end
end
struct LibWin32::IUIAutomationCacheRequest
  def query_interface(this : IUIAutomationCacheRequest*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationCacheRequest*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationCacheRequest*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_property(this : IUIAutomationCacheRequest*, propertyid : Int32) : HRESULT
    @lpVtbl.value.add_property.call(this, propertyid)
  end
  def add_pattern(this : IUIAutomationCacheRequest*, patternid : Int32) : HRESULT
    @lpVtbl.value.add_pattern.call(this, patternid)
  end
  def clone(this : IUIAutomationCacheRequest*, clonedrequest : IUIAutomationCacheRequest*) : HRESULT
    @lpVtbl.value.clone.call(this, clonedrequest)
  end
  def get_tree_scope(this : IUIAutomationCacheRequest*, scope : TreeScope*) : HRESULT
    @lpVtbl.value.get_tree_scope.call(this, scope)
  end
  def put_tree_scope(this : IUIAutomationCacheRequest*, scope : TreeScope) : HRESULT
    @lpVtbl.value.put_tree_scope.call(this, scope)
  end
  def get_tree_filter(this : IUIAutomationCacheRequest*, filter : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_tree_filter.call(this, filter)
  end
  def put_tree_filter(this : IUIAutomationCacheRequest*, filter : IUIAutomationCondition) : HRESULT
    @lpVtbl.value.put_tree_filter.call(this, filter)
  end
  def get_automation_element_mode(this : IUIAutomationCacheRequest*, mode : AutomationElementMode*) : HRESULT
    @lpVtbl.value.get_automation_element_mode.call(this, mode)
  end
  def put_automation_element_mode(this : IUIAutomationCacheRequest*, mode : AutomationElementMode) : HRESULT
    @lpVtbl.value.put_automation_element_mode.call(this, mode)
  end
end
struct LibWin32::IUIAutomationTreeWalker
  def query_interface(this : IUIAutomationTreeWalker*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTreeWalker*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTreeWalker*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_parent_element(this : IUIAutomationTreeWalker*, element : IUIAutomationElement, parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_parent_element.call(this, element, parent)
  end
  def get_first_child_element(this : IUIAutomationTreeWalker*, element : IUIAutomationElement, first : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_first_child_element.call(this, element, first)
  end
  def get_last_child_element(this : IUIAutomationTreeWalker*, element : IUIAutomationElement, last : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_last_child_element.call(this, element, last)
  end
  def get_next_sibling_element(this : IUIAutomationTreeWalker*, element : IUIAutomationElement, _next : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_next_sibling_element.call(this, element, _next)
  end
  def get_previous_sibling_element(this : IUIAutomationTreeWalker*, element : IUIAutomationElement, previous : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_previous_sibling_element.call(this, element, previous)
  end
  def normalize_element(this : IUIAutomationTreeWalker*, element : IUIAutomationElement, normalized : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.normalize_element.call(this, element, normalized)
  end
  def get_parent_element_build_cache(this : IUIAutomationTreeWalker*, element : IUIAutomationElement, cacherequest : IUIAutomationCacheRequest, parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_parent_element_build_cache.call(this, element, cacherequest, parent)
  end
  def get_first_child_element_build_cache(this : IUIAutomationTreeWalker*, element : IUIAutomationElement, cacherequest : IUIAutomationCacheRequest, first : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_first_child_element_build_cache.call(this, element, cacherequest, first)
  end
  def get_last_child_element_build_cache(this : IUIAutomationTreeWalker*, element : IUIAutomationElement, cacherequest : IUIAutomationCacheRequest, last : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_last_child_element_build_cache.call(this, element, cacherequest, last)
  end
  def get_next_sibling_element_build_cache(this : IUIAutomationTreeWalker*, element : IUIAutomationElement, cacherequest : IUIAutomationCacheRequest, _next : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_next_sibling_element_build_cache.call(this, element, cacherequest, _next)
  end
  def get_previous_sibling_element_build_cache(this : IUIAutomationTreeWalker*, element : IUIAutomationElement, cacherequest : IUIAutomationCacheRequest, previous : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_previous_sibling_element_build_cache.call(this, element, cacherequest, previous)
  end
  def normalize_element_build_cache(this : IUIAutomationTreeWalker*, element : IUIAutomationElement, cacherequest : IUIAutomationCacheRequest, normalized : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.normalize_element_build_cache.call(this, element, cacherequest, normalized)
  end
  def get_condition(this : IUIAutomationTreeWalker*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_condition.call(this, condition)
  end
end
struct LibWin32::IUIAutomationEventHandler
  def query_interface(this : IUIAutomationEventHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationEventHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationEventHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def handle_automation_event(this : IUIAutomationEventHandler*, sender : IUIAutomationElement, eventid : Int32) : HRESULT
    @lpVtbl.value.handle_automation_event.call(this, sender, eventid)
  end
end
struct LibWin32::IUIAutomationPropertyChangedEventHandler
  def query_interface(this : IUIAutomationPropertyChangedEventHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationPropertyChangedEventHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationPropertyChangedEventHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def handle_property_changed_event(this : IUIAutomationPropertyChangedEventHandler*, sender : IUIAutomationElement, propertyid : Int32, newvalue : VARIANT) : HRESULT
    @lpVtbl.value.handle_property_changed_event.call(this, sender, propertyid, newvalue)
  end
end
struct LibWin32::IUIAutomationStructureChangedEventHandler
  def query_interface(this : IUIAutomationStructureChangedEventHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationStructureChangedEventHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationStructureChangedEventHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def handle_structure_changed_event(this : IUIAutomationStructureChangedEventHandler*, sender : IUIAutomationElement, changetype : StructureChangeType, runtimeid : SAFEARRAY*) : HRESULT
    @lpVtbl.value.handle_structure_changed_event.call(this, sender, changetype, runtimeid)
  end
end
struct LibWin32::IUIAutomationFocusChangedEventHandler
  def query_interface(this : IUIAutomationFocusChangedEventHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationFocusChangedEventHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationFocusChangedEventHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def handle_focus_changed_event(this : IUIAutomationFocusChangedEventHandler*, sender : IUIAutomationElement) : HRESULT
    @lpVtbl.value.handle_focus_changed_event.call(this, sender)
  end
end
struct LibWin32::IUIAutomationTextEditTextChangedEventHandler
  def query_interface(this : IUIAutomationTextEditTextChangedEventHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTextEditTextChangedEventHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTextEditTextChangedEventHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def handle_text_edit_text_changed_event(this : IUIAutomationTextEditTextChangedEventHandler*, sender : IUIAutomationElement, texteditchangetype : TextEditChangeType, eventstrings : SAFEARRAY*) : HRESULT
    @lpVtbl.value.handle_text_edit_text_changed_event.call(this, sender, texteditchangetype, eventstrings)
  end
end
struct LibWin32::IUIAutomationChangesEventHandler
  def query_interface(this : IUIAutomationChangesEventHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationChangesEventHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationChangesEventHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def handle_changes_event(this : IUIAutomationChangesEventHandler*, sender : IUIAutomationElement, uiachanges : UiaChangeInfo*, changescount : Int32) : HRESULT
    @lpVtbl.value.handle_changes_event.call(this, sender, uiachanges, changescount)
  end
end
struct LibWin32::IUIAutomationNotificationEventHandler
  def query_interface(this : IUIAutomationNotificationEventHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationNotificationEventHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationNotificationEventHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def handle_notification_event(this : IUIAutomationNotificationEventHandler*, sender : IUIAutomationElement, notificationkind : NotificationKind, notificationprocessing : NotificationProcessing, displaystring : UInt8*, activityid : UInt8*) : HRESULT
    @lpVtbl.value.handle_notification_event.call(this, sender, notificationkind, notificationprocessing, displaystring, activityid)
  end
end
struct LibWin32::IUIAutomationInvokePattern
  def query_interface(this : IUIAutomationInvokePattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationInvokePattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationInvokePattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def invoke(this : IUIAutomationInvokePattern*) : HRESULT
    @lpVtbl.value.invoke.call(this)
  end
end
struct LibWin32::IUIAutomationDockPattern
  def query_interface(this : IUIAutomationDockPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationDockPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationDockPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_dock_position(this : IUIAutomationDockPattern*, dockpos : DockPosition) : HRESULT
    @lpVtbl.value.set_dock_position.call(this, dockpos)
  end
  def get_current_dock_position(this : IUIAutomationDockPattern*, retval : DockPosition*) : HRESULT
    @lpVtbl.value.get_current_dock_position.call(this, retval)
  end
  def get_cached_dock_position(this : IUIAutomationDockPattern*, retval : DockPosition*) : HRESULT
    @lpVtbl.value.get_cached_dock_position.call(this, retval)
  end
end
struct LibWin32::IUIAutomationExpandCollapsePattern
  def query_interface(this : IUIAutomationExpandCollapsePattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationExpandCollapsePattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationExpandCollapsePattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def expand(this : IUIAutomationExpandCollapsePattern*) : HRESULT
    @lpVtbl.value.expand.call(this)
  end
  def collapse(this : IUIAutomationExpandCollapsePattern*) : HRESULT
    @lpVtbl.value.collapse.call(this)
  end
  def get_current_expand_collapse_state(this : IUIAutomationExpandCollapsePattern*, retval : ExpandCollapseState*) : HRESULT
    @lpVtbl.value.get_current_expand_collapse_state.call(this, retval)
  end
  def get_cached_expand_collapse_state(this : IUIAutomationExpandCollapsePattern*, retval : ExpandCollapseState*) : HRESULT
    @lpVtbl.value.get_cached_expand_collapse_state.call(this, retval)
  end
end
struct LibWin32::IUIAutomationGridPattern
  def query_interface(this : IUIAutomationGridPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationGridPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationGridPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_item(this : IUIAutomationGridPattern*, row : Int32, column : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_item.call(this, row, column, element)
  end
  def get_current_row_count(this : IUIAutomationGridPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_row_count.call(this, retval)
  end
  def get_current_column_count(this : IUIAutomationGridPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_column_count.call(this, retval)
  end
  def get_cached_row_count(this : IUIAutomationGridPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_row_count.call(this, retval)
  end
  def get_cached_column_count(this : IUIAutomationGridPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_column_count.call(this, retval)
  end
end
struct LibWin32::IUIAutomationGridItemPattern
  def query_interface(this : IUIAutomationGridItemPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationGridItemPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationGridItemPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_current_containing_grid(this : IUIAutomationGridItemPattern*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_containing_grid.call(this, retval)
  end
  def get_current_row(this : IUIAutomationGridItemPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_row.call(this, retval)
  end
  def get_current_column(this : IUIAutomationGridItemPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_column.call(this, retval)
  end
  def get_current_row_span(this : IUIAutomationGridItemPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_row_span.call(this, retval)
  end
  def get_current_column_span(this : IUIAutomationGridItemPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_column_span.call(this, retval)
  end
  def get_cached_containing_grid(this : IUIAutomationGridItemPattern*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_containing_grid.call(this, retval)
  end
  def get_cached_row(this : IUIAutomationGridItemPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_row.call(this, retval)
  end
  def get_cached_column(this : IUIAutomationGridItemPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_column.call(this, retval)
  end
  def get_cached_row_span(this : IUIAutomationGridItemPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_row_span.call(this, retval)
  end
  def get_cached_column_span(this : IUIAutomationGridItemPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_column_span.call(this, retval)
  end
end
struct LibWin32::IUIAutomationMultipleViewPattern
  def query_interface(this : IUIAutomationMultipleViewPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationMultipleViewPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationMultipleViewPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_view_name(this : IUIAutomationMultipleViewPattern*, view : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_view_name.call(this, view, name)
  end
  def set_current_view(this : IUIAutomationMultipleViewPattern*, view : Int32) : HRESULT
    @lpVtbl.value.set_current_view.call(this, view)
  end
  def get_current_current_view(this : IUIAutomationMultipleViewPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_current_view.call(this, retval)
  end
  def get_current_supported_views(this : IUIAutomationMultipleViewPattern*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_supported_views.call(this, retval)
  end
  def get_cached_current_view(this : IUIAutomationMultipleViewPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_current_view.call(this, retval)
  end
  def get_cached_supported_views(this : IUIAutomationMultipleViewPattern*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_supported_views.call(this, retval)
  end
end
struct LibWin32::IUIAutomationObjectModelPattern
  def query_interface(this : IUIAutomationObjectModelPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationObjectModelPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationObjectModelPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_underlying_object_model(this : IUIAutomationObjectModelPattern*, retval : IUnknown*) : HRESULT
    @lpVtbl.value.get_underlying_object_model.call(this, retval)
  end
end
struct LibWin32::IUIAutomationRangeValuePattern
  def query_interface(this : IUIAutomationRangeValuePattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationRangeValuePattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationRangeValuePattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_value(this : IUIAutomationRangeValuePattern*, val : Float64) : HRESULT
    @lpVtbl.value.set_value.call(this, val)
  end
  def get_current_value(this : IUIAutomationRangeValuePattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_value.call(this, retval)
  end
  def get_current_is_read_only(this : IUIAutomationRangeValuePattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_read_only.call(this, retval)
  end
  def get_current_maximum(this : IUIAutomationRangeValuePattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_maximum.call(this, retval)
  end
  def get_current_minimum(this : IUIAutomationRangeValuePattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_minimum.call(this, retval)
  end
  def get_current_large_change(this : IUIAutomationRangeValuePattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_large_change.call(this, retval)
  end
  def get_current_small_change(this : IUIAutomationRangeValuePattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_small_change.call(this, retval)
  end
  def get_cached_value(this : IUIAutomationRangeValuePattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_value.call(this, retval)
  end
  def get_cached_is_read_only(this : IUIAutomationRangeValuePattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_read_only.call(this, retval)
  end
  def get_cached_maximum(this : IUIAutomationRangeValuePattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_maximum.call(this, retval)
  end
  def get_cached_minimum(this : IUIAutomationRangeValuePattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_minimum.call(this, retval)
  end
  def get_cached_large_change(this : IUIAutomationRangeValuePattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_large_change.call(this, retval)
  end
  def get_cached_small_change(this : IUIAutomationRangeValuePattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_small_change.call(this, retval)
  end
end
struct LibWin32::IUIAutomationScrollPattern
  def query_interface(this : IUIAutomationScrollPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationScrollPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationScrollPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def scroll(this : IUIAutomationScrollPattern*, horizontalamount : ScrollAmount, verticalamount : ScrollAmount) : HRESULT
    @lpVtbl.value.scroll.call(this, horizontalamount, verticalamount)
  end
  def set_scroll_percent(this : IUIAutomationScrollPattern*, horizontalpercent : Float64, verticalpercent : Float64) : HRESULT
    @lpVtbl.value.set_scroll_percent.call(this, horizontalpercent, verticalpercent)
  end
  def get_current_horizontal_scroll_percent(this : IUIAutomationScrollPattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_horizontal_scroll_percent.call(this, retval)
  end
  def get_current_vertical_scroll_percent(this : IUIAutomationScrollPattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_vertical_scroll_percent.call(this, retval)
  end
  def get_current_horizontal_view_size(this : IUIAutomationScrollPattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_horizontal_view_size.call(this, retval)
  end
  def get_current_vertical_view_size(this : IUIAutomationScrollPattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_vertical_view_size.call(this, retval)
  end
  def get_current_horizontally_scrollable(this : IUIAutomationScrollPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_horizontally_scrollable.call(this, retval)
  end
  def get_current_vertically_scrollable(this : IUIAutomationScrollPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_vertically_scrollable.call(this, retval)
  end
  def get_cached_horizontal_scroll_percent(this : IUIAutomationScrollPattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_horizontal_scroll_percent.call(this, retval)
  end
  def get_cached_vertical_scroll_percent(this : IUIAutomationScrollPattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_vertical_scroll_percent.call(this, retval)
  end
  def get_cached_horizontal_view_size(this : IUIAutomationScrollPattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_horizontal_view_size.call(this, retval)
  end
  def get_cached_vertical_view_size(this : IUIAutomationScrollPattern*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_vertical_view_size.call(this, retval)
  end
  def get_cached_horizontally_scrollable(this : IUIAutomationScrollPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_horizontally_scrollable.call(this, retval)
  end
  def get_cached_vertically_scrollable(this : IUIAutomationScrollPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_vertically_scrollable.call(this, retval)
  end
end
struct LibWin32::IUIAutomationScrollItemPattern
  def query_interface(this : IUIAutomationScrollItemPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationScrollItemPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationScrollItemPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def scroll_into_view(this : IUIAutomationScrollItemPattern*) : HRESULT
    @lpVtbl.value.scroll_into_view.call(this)
  end
end
struct LibWin32::IUIAutomationSelectionPattern
  def query_interface(this : IUIAutomationSelectionPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationSelectionPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationSelectionPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_current_selection(this : IUIAutomationSelectionPattern*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_selection.call(this, retval)
  end
  def get_current_can_select_multiple(this : IUIAutomationSelectionPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_select_multiple.call(this, retval)
  end
  def get_current_is_selection_required(this : IUIAutomationSelectionPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_selection_required.call(this, retval)
  end
  def get_cached_selection(this : IUIAutomationSelectionPattern*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_selection.call(this, retval)
  end
  def get_cached_can_select_multiple(this : IUIAutomationSelectionPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_select_multiple.call(this, retval)
  end
  def get_cached_is_selection_required(this : IUIAutomationSelectionPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_selection_required.call(this, retval)
  end
end
struct LibWin32::IUIAutomationSelectionPattern2
  def query_interface(this : IUIAutomationSelectionPattern2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationSelectionPattern2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationSelectionPattern2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_current_selection(this : IUIAutomationSelectionPattern2*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_selection.call(this, retval)
  end
  def get_current_can_select_multiple(this : IUIAutomationSelectionPattern2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_select_multiple.call(this, retval)
  end
  def get_current_is_selection_required(this : IUIAutomationSelectionPattern2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_selection_required.call(this, retval)
  end
  def get_cached_selection(this : IUIAutomationSelectionPattern2*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_selection.call(this, retval)
  end
  def get_cached_can_select_multiple(this : IUIAutomationSelectionPattern2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_select_multiple.call(this, retval)
  end
  def get_cached_is_selection_required(this : IUIAutomationSelectionPattern2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_selection_required.call(this, retval)
  end
  def get_current_first_selected_item(this : IUIAutomationSelectionPattern2*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_first_selected_item.call(this, retval)
  end
  def get_current_last_selected_item(this : IUIAutomationSelectionPattern2*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_last_selected_item.call(this, retval)
  end
  def get_current_current_selected_item(this : IUIAutomationSelectionPattern2*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_current_selected_item.call(this, retval)
  end
  def get_current_item_count(this : IUIAutomationSelectionPattern2*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_item_count.call(this, retval)
  end
  def get_cached_first_selected_item(this : IUIAutomationSelectionPattern2*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_first_selected_item.call(this, retval)
  end
  def get_cached_last_selected_item(this : IUIAutomationSelectionPattern2*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_last_selected_item.call(this, retval)
  end
  def get_cached_current_selected_item(this : IUIAutomationSelectionPattern2*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_current_selected_item.call(this, retval)
  end
  def get_cached_item_count(this : IUIAutomationSelectionPattern2*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_item_count.call(this, retval)
  end
end
struct LibWin32::IUIAutomationSelectionItemPattern
  def query_interface(this : IUIAutomationSelectionItemPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationSelectionItemPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationSelectionItemPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def select(this : IUIAutomationSelectionItemPattern*) : HRESULT
    @lpVtbl.value.select.call(this)
  end
  def add_to_selection(this : IUIAutomationSelectionItemPattern*) : HRESULT
    @lpVtbl.value.add_to_selection.call(this)
  end
  def remove_from_selection(this : IUIAutomationSelectionItemPattern*) : HRESULT
    @lpVtbl.value.remove_from_selection.call(this)
  end
  def get_current_is_selected(this : IUIAutomationSelectionItemPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_selected.call(this, retval)
  end
  def get_current_selection_container(this : IUIAutomationSelectionItemPattern*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_selection_container.call(this, retval)
  end
  def get_cached_is_selected(this : IUIAutomationSelectionItemPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_selected.call(this, retval)
  end
  def get_cached_selection_container(this : IUIAutomationSelectionItemPattern*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_selection_container.call(this, retval)
  end
end
struct LibWin32::IUIAutomationSynchronizedInputPattern
  def query_interface(this : IUIAutomationSynchronizedInputPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationSynchronizedInputPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationSynchronizedInputPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def start_listening(this : IUIAutomationSynchronizedInputPattern*, inputtype : SynchronizedInputType) : HRESULT
    @lpVtbl.value.start_listening.call(this, inputtype)
  end
  def cancel(this : IUIAutomationSynchronizedInputPattern*) : HRESULT
    @lpVtbl.value.cancel.call(this)
  end
end
struct LibWin32::IUIAutomationTablePattern
  def query_interface(this : IUIAutomationTablePattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTablePattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTablePattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_current_row_headers(this : IUIAutomationTablePattern*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_row_headers.call(this, retval)
  end
  def get_current_column_headers(this : IUIAutomationTablePattern*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_column_headers.call(this, retval)
  end
  def get_current_row_or_column_major(this : IUIAutomationTablePattern*, retval : RowOrColumnMajor*) : HRESULT
    @lpVtbl.value.get_current_row_or_column_major.call(this, retval)
  end
  def get_cached_row_headers(this : IUIAutomationTablePattern*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_row_headers.call(this, retval)
  end
  def get_cached_column_headers(this : IUIAutomationTablePattern*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_column_headers.call(this, retval)
  end
  def get_cached_row_or_column_major(this : IUIAutomationTablePattern*, retval : RowOrColumnMajor*) : HRESULT
    @lpVtbl.value.get_cached_row_or_column_major.call(this, retval)
  end
end
struct LibWin32::IUIAutomationTableItemPattern
  def query_interface(this : IUIAutomationTableItemPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTableItemPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTableItemPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_current_row_header_items(this : IUIAutomationTableItemPattern*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_row_header_items.call(this, retval)
  end
  def get_current_column_header_items(this : IUIAutomationTableItemPattern*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_column_header_items.call(this, retval)
  end
  def get_cached_row_header_items(this : IUIAutomationTableItemPattern*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_row_header_items.call(this, retval)
  end
  def get_cached_column_header_items(this : IUIAutomationTableItemPattern*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_column_header_items.call(this, retval)
  end
end
struct LibWin32::IUIAutomationTogglePattern
  def query_interface(this : IUIAutomationTogglePattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTogglePattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTogglePattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def toggle(this : IUIAutomationTogglePattern*) : HRESULT
    @lpVtbl.value.toggle.call(this)
  end
  def get_current_toggle_state(this : IUIAutomationTogglePattern*, retval : ToggleState*) : HRESULT
    @lpVtbl.value.get_current_toggle_state.call(this, retval)
  end
  def get_cached_toggle_state(this : IUIAutomationTogglePattern*, retval : ToggleState*) : HRESULT
    @lpVtbl.value.get_cached_toggle_state.call(this, retval)
  end
end
struct LibWin32::IUIAutomationTransformPattern
  def query_interface(this : IUIAutomationTransformPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTransformPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTransformPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def move(this : IUIAutomationTransformPattern*, x : Float64, y : Float64) : HRESULT
    @lpVtbl.value.move.call(this, x, y)
  end
  def resize(this : IUIAutomationTransformPattern*, width : Float64, height : Float64) : HRESULT
    @lpVtbl.value.resize.call(this, width, height)
  end
  def rotate(this : IUIAutomationTransformPattern*, degrees : Float64) : HRESULT
    @lpVtbl.value.rotate.call(this, degrees)
  end
  def get_current_can_move(this : IUIAutomationTransformPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_move.call(this, retval)
  end
  def get_current_can_resize(this : IUIAutomationTransformPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_resize.call(this, retval)
  end
  def get_current_can_rotate(this : IUIAutomationTransformPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_rotate.call(this, retval)
  end
  def get_cached_can_move(this : IUIAutomationTransformPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_move.call(this, retval)
  end
  def get_cached_can_resize(this : IUIAutomationTransformPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_resize.call(this, retval)
  end
  def get_cached_can_rotate(this : IUIAutomationTransformPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_rotate.call(this, retval)
  end
end
struct LibWin32::IUIAutomationValuePattern
  def query_interface(this : IUIAutomationValuePattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationValuePattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationValuePattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_value(this : IUIAutomationValuePattern*, val : UInt8*) : HRESULT
    @lpVtbl.value.set_value.call(this, val)
  end
  def get_current_value(this : IUIAutomationValuePattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_value.call(this, retval)
  end
  def get_current_is_read_only(this : IUIAutomationValuePattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_read_only.call(this, retval)
  end
  def get_cached_value(this : IUIAutomationValuePattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_value.call(this, retval)
  end
  def get_cached_is_read_only(this : IUIAutomationValuePattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_read_only.call(this, retval)
  end
end
struct LibWin32::IUIAutomationWindowPattern
  def query_interface(this : IUIAutomationWindowPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationWindowPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationWindowPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def close(this : IUIAutomationWindowPattern*) : HRESULT
    @lpVtbl.value.close.call(this)
  end
  def wait_for_input_idle(this : IUIAutomationWindowPattern*, milliseconds : Int32, success : LibC::BOOL*) : HRESULT
    @lpVtbl.value.wait_for_input_idle.call(this, milliseconds, success)
  end
  def set_window_visual_state(this : IUIAutomationWindowPattern*, state : WindowVisualState) : HRESULT
    @lpVtbl.value.set_window_visual_state.call(this, state)
  end
  def get_current_can_maximize(this : IUIAutomationWindowPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_maximize.call(this, retval)
  end
  def get_current_can_minimize(this : IUIAutomationWindowPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_minimize.call(this, retval)
  end
  def get_current_is_modal(this : IUIAutomationWindowPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_modal.call(this, retval)
  end
  def get_current_is_topmost(this : IUIAutomationWindowPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_topmost.call(this, retval)
  end
  def get_current_window_visual_state(this : IUIAutomationWindowPattern*, retval : WindowVisualState*) : HRESULT
    @lpVtbl.value.get_current_window_visual_state.call(this, retval)
  end
  def get_current_window_interaction_state(this : IUIAutomationWindowPattern*, retval : WindowInteractionState*) : HRESULT
    @lpVtbl.value.get_current_window_interaction_state.call(this, retval)
  end
  def get_cached_can_maximize(this : IUIAutomationWindowPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_maximize.call(this, retval)
  end
  def get_cached_can_minimize(this : IUIAutomationWindowPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_minimize.call(this, retval)
  end
  def get_cached_is_modal(this : IUIAutomationWindowPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_modal.call(this, retval)
  end
  def get_cached_is_topmost(this : IUIAutomationWindowPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_topmost.call(this, retval)
  end
  def get_cached_window_visual_state(this : IUIAutomationWindowPattern*, retval : WindowVisualState*) : HRESULT
    @lpVtbl.value.get_cached_window_visual_state.call(this, retval)
  end
  def get_cached_window_interaction_state(this : IUIAutomationWindowPattern*, retval : WindowInteractionState*) : HRESULT
    @lpVtbl.value.get_cached_window_interaction_state.call(this, retval)
  end
end
struct LibWin32::IUIAutomationTextRange
  def query_interface(this : IUIAutomationTextRange*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTextRange*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTextRange*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def clone(this : IUIAutomationTextRange*, clonedrange : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.clone.call(this, clonedrange)
  end
  def compare(this : IUIAutomationTextRange*, range : IUIAutomationTextRange, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare.call(this, range, aresame)
  end
  def compare_endpoints(this : IUIAutomationTextRange*, srcendpoint : TextPatternRangeEndpoint, range : IUIAutomationTextRange, targetendpoint : TextPatternRangeEndpoint, compvalue : Int32*) : HRESULT
    @lpVtbl.value.compare_endpoints.call(this, srcendpoint, range, targetendpoint, compvalue)
  end
  def expand_to_enclosing_unit(this : IUIAutomationTextRange*, textunit : TextUnit) : HRESULT
    @lpVtbl.value.expand_to_enclosing_unit.call(this, textunit)
  end
  def find_attribute(this : IUIAutomationTextRange*, attr : Int32, val : VARIANT, backward : LibC::BOOL, found : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.find_attribute.call(this, attr, val, backward, found)
  end
  def find_text(this : IUIAutomationTextRange*, text : UInt8*, backward : LibC::BOOL, ignorecase : LibC::BOOL, found : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.find_text.call(this, text, backward, ignorecase, found)
  end
  def get_attribute_value(this : IUIAutomationTextRange*, attr : Int32, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute_value.call(this, attr, value)
  end
  def get_bounding_rectangles(this : IUIAutomationTextRange*, boundingrects : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_bounding_rectangles.call(this, boundingrects)
  end
  def get_enclosing_element(this : IUIAutomationTextRange*, enclosingelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_enclosing_element.call(this, enclosingelement)
  end
  def get_text(this : IUIAutomationTextRange*, maxlength : Int32, text : UInt8**) : HRESULT
    @lpVtbl.value.get_text.call(this, maxlength, text)
  end
  def move(this : IUIAutomationTextRange*, unit : TextUnit, count : Int32, moved : Int32*) : HRESULT
    @lpVtbl.value.move.call(this, unit, count, moved)
  end
  def move_endpoint_by_unit(this : IUIAutomationTextRange*, endpoint : TextPatternRangeEndpoint, unit : TextUnit, count : Int32, moved : Int32*) : HRESULT
    @lpVtbl.value.move_endpoint_by_unit.call(this, endpoint, unit, count, moved)
  end
  def move_endpoint_by_range(this : IUIAutomationTextRange*, srcendpoint : TextPatternRangeEndpoint, range : IUIAutomationTextRange, targetendpoint : TextPatternRangeEndpoint) : HRESULT
    @lpVtbl.value.move_endpoint_by_range.call(this, srcendpoint, range, targetendpoint)
  end
  def select(this : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.select.call(this)
  end
  def add_to_selection(this : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.add_to_selection.call(this)
  end
  def remove_from_selection(this : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.remove_from_selection.call(this)
  end
  def scroll_into_view(this : IUIAutomationTextRange*, aligntotop : LibC::BOOL) : HRESULT
    @lpVtbl.value.scroll_into_view.call(this, aligntotop)
  end
  def get_children(this : IUIAutomationTextRange*, children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_children.call(this, children)
  end
end
struct LibWin32::IUIAutomationTextRange2
  def query_interface(this : IUIAutomationTextRange2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTextRange2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTextRange2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def clone(this : IUIAutomationTextRange2*, clonedrange : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.clone.call(this, clonedrange)
  end
  def compare(this : IUIAutomationTextRange2*, range : IUIAutomationTextRange, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare.call(this, range, aresame)
  end
  def compare_endpoints(this : IUIAutomationTextRange2*, srcendpoint : TextPatternRangeEndpoint, range : IUIAutomationTextRange, targetendpoint : TextPatternRangeEndpoint, compvalue : Int32*) : HRESULT
    @lpVtbl.value.compare_endpoints.call(this, srcendpoint, range, targetendpoint, compvalue)
  end
  def expand_to_enclosing_unit(this : IUIAutomationTextRange2*, textunit : TextUnit) : HRESULT
    @lpVtbl.value.expand_to_enclosing_unit.call(this, textunit)
  end
  def find_attribute(this : IUIAutomationTextRange2*, attr : Int32, val : VARIANT, backward : LibC::BOOL, found : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.find_attribute.call(this, attr, val, backward, found)
  end
  def find_text(this : IUIAutomationTextRange2*, text : UInt8*, backward : LibC::BOOL, ignorecase : LibC::BOOL, found : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.find_text.call(this, text, backward, ignorecase, found)
  end
  def get_attribute_value(this : IUIAutomationTextRange2*, attr : Int32, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute_value.call(this, attr, value)
  end
  def get_bounding_rectangles(this : IUIAutomationTextRange2*, boundingrects : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_bounding_rectangles.call(this, boundingrects)
  end
  def get_enclosing_element(this : IUIAutomationTextRange2*, enclosingelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_enclosing_element.call(this, enclosingelement)
  end
  def get_text(this : IUIAutomationTextRange2*, maxlength : Int32, text : UInt8**) : HRESULT
    @lpVtbl.value.get_text.call(this, maxlength, text)
  end
  def move(this : IUIAutomationTextRange2*, unit : TextUnit, count : Int32, moved : Int32*) : HRESULT
    @lpVtbl.value.move.call(this, unit, count, moved)
  end
  def move_endpoint_by_unit(this : IUIAutomationTextRange2*, endpoint : TextPatternRangeEndpoint, unit : TextUnit, count : Int32, moved : Int32*) : HRESULT
    @lpVtbl.value.move_endpoint_by_unit.call(this, endpoint, unit, count, moved)
  end
  def move_endpoint_by_range(this : IUIAutomationTextRange2*, srcendpoint : TextPatternRangeEndpoint, range : IUIAutomationTextRange, targetendpoint : TextPatternRangeEndpoint) : HRESULT
    @lpVtbl.value.move_endpoint_by_range.call(this, srcendpoint, range, targetendpoint)
  end
  def select(this : IUIAutomationTextRange2*) : HRESULT
    @lpVtbl.value.select.call(this)
  end
  def add_to_selection(this : IUIAutomationTextRange2*) : HRESULT
    @lpVtbl.value.add_to_selection.call(this)
  end
  def remove_from_selection(this : IUIAutomationTextRange2*) : HRESULT
    @lpVtbl.value.remove_from_selection.call(this)
  end
  def scroll_into_view(this : IUIAutomationTextRange2*, aligntotop : LibC::BOOL) : HRESULT
    @lpVtbl.value.scroll_into_view.call(this, aligntotop)
  end
  def get_children(this : IUIAutomationTextRange2*, children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_children.call(this, children)
  end
  def show_context_menu(this : IUIAutomationTextRange2*) : HRESULT
    @lpVtbl.value.show_context_menu.call(this)
  end
end
struct LibWin32::IUIAutomationTextRange3
  def query_interface(this : IUIAutomationTextRange3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTextRange3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTextRange3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def clone(this : IUIAutomationTextRange3*, clonedrange : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.clone.call(this, clonedrange)
  end
  def compare(this : IUIAutomationTextRange3*, range : IUIAutomationTextRange, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare.call(this, range, aresame)
  end
  def compare_endpoints(this : IUIAutomationTextRange3*, srcendpoint : TextPatternRangeEndpoint, range : IUIAutomationTextRange, targetendpoint : TextPatternRangeEndpoint, compvalue : Int32*) : HRESULT
    @lpVtbl.value.compare_endpoints.call(this, srcendpoint, range, targetendpoint, compvalue)
  end
  def expand_to_enclosing_unit(this : IUIAutomationTextRange3*, textunit : TextUnit) : HRESULT
    @lpVtbl.value.expand_to_enclosing_unit.call(this, textunit)
  end
  def find_attribute(this : IUIAutomationTextRange3*, attr : Int32, val : VARIANT, backward : LibC::BOOL, found : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.find_attribute.call(this, attr, val, backward, found)
  end
  def find_text(this : IUIAutomationTextRange3*, text : UInt8*, backward : LibC::BOOL, ignorecase : LibC::BOOL, found : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.find_text.call(this, text, backward, ignorecase, found)
  end
  def get_attribute_value(this : IUIAutomationTextRange3*, attr : Int32, value : VARIANT*) : HRESULT
    @lpVtbl.value.get_attribute_value.call(this, attr, value)
  end
  def get_bounding_rectangles(this : IUIAutomationTextRange3*, boundingrects : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_bounding_rectangles.call(this, boundingrects)
  end
  def get_enclosing_element(this : IUIAutomationTextRange3*, enclosingelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_enclosing_element.call(this, enclosingelement)
  end
  def get_text(this : IUIAutomationTextRange3*, maxlength : Int32, text : UInt8**) : HRESULT
    @lpVtbl.value.get_text.call(this, maxlength, text)
  end
  def move(this : IUIAutomationTextRange3*, unit : TextUnit, count : Int32, moved : Int32*) : HRESULT
    @lpVtbl.value.move.call(this, unit, count, moved)
  end
  def move_endpoint_by_unit(this : IUIAutomationTextRange3*, endpoint : TextPatternRangeEndpoint, unit : TextUnit, count : Int32, moved : Int32*) : HRESULT
    @lpVtbl.value.move_endpoint_by_unit.call(this, endpoint, unit, count, moved)
  end
  def move_endpoint_by_range(this : IUIAutomationTextRange3*, srcendpoint : TextPatternRangeEndpoint, range : IUIAutomationTextRange, targetendpoint : TextPatternRangeEndpoint) : HRESULT
    @lpVtbl.value.move_endpoint_by_range.call(this, srcendpoint, range, targetendpoint)
  end
  def select(this : IUIAutomationTextRange3*) : HRESULT
    @lpVtbl.value.select.call(this)
  end
  def add_to_selection(this : IUIAutomationTextRange3*) : HRESULT
    @lpVtbl.value.add_to_selection.call(this)
  end
  def remove_from_selection(this : IUIAutomationTextRange3*) : HRESULT
    @lpVtbl.value.remove_from_selection.call(this)
  end
  def scroll_into_view(this : IUIAutomationTextRange3*, aligntotop : LibC::BOOL) : HRESULT
    @lpVtbl.value.scroll_into_view.call(this, aligntotop)
  end
  def get_children(this : IUIAutomationTextRange3*, children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_children.call(this, children)
  end
  def show_context_menu(this : IUIAutomationTextRange3*) : HRESULT
    @lpVtbl.value.show_context_menu.call(this)
  end
  def get_enclosing_element_build_cache(this : IUIAutomationTextRange3*, cacherequest : IUIAutomationCacheRequest, enclosingelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_enclosing_element_build_cache.call(this, cacherequest, enclosingelement)
  end
  def get_children_build_cache(this : IUIAutomationTextRange3*, cacherequest : IUIAutomationCacheRequest, children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_children_build_cache.call(this, cacherequest, children)
  end
  def get_attribute_values(this : IUIAutomationTextRange3*, attributeids : Int32*, attributeidcount : Int32, attributevalues : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_attribute_values.call(this, attributeids, attributeidcount, attributevalues)
  end
end
struct LibWin32::IUIAutomationTextRangeArray
  def query_interface(this : IUIAutomationTextRangeArray*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTextRangeArray*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTextRangeArray*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_length(this : IUIAutomationTextRangeArray*, length : Int32*) : HRESULT
    @lpVtbl.value.get_length.call(this, length)
  end
  def get_element(this : IUIAutomationTextRangeArray*, index : Int32, element : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_element.call(this, index, element)
  end
end
struct LibWin32::IUIAutomationTextPattern
  def query_interface(this : IUIAutomationTextPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTextPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTextPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def range_from_point(this : IUIAutomationTextPattern*, pt : POINT, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.range_from_point.call(this, pt, range)
  end
  def range_from_child(this : IUIAutomationTextPattern*, child : IUIAutomationElement, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.range_from_child.call(this, child, range)
  end
  def get_selection(this : IUIAutomationTextPattern*, ranges : IUIAutomationTextRangeArray*) : HRESULT
    @lpVtbl.value.get_selection.call(this, ranges)
  end
  def get_visible_ranges(this : IUIAutomationTextPattern*, ranges : IUIAutomationTextRangeArray*) : HRESULT
    @lpVtbl.value.get_visible_ranges.call(this, ranges)
  end
  def get_document_range(this : IUIAutomationTextPattern*, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_document_range.call(this, range)
  end
  def get_supported_text_selection(this : IUIAutomationTextPattern*, supportedtextselection : SupportedTextSelection*) : HRESULT
    @lpVtbl.value.get_supported_text_selection.call(this, supportedtextselection)
  end
end
struct LibWin32::IUIAutomationTextPattern2
  def query_interface(this : IUIAutomationTextPattern2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTextPattern2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTextPattern2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def range_from_point(this : IUIAutomationTextPattern2*, pt : POINT, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.range_from_point.call(this, pt, range)
  end
  def range_from_child(this : IUIAutomationTextPattern2*, child : IUIAutomationElement, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.range_from_child.call(this, child, range)
  end
  def get_selection(this : IUIAutomationTextPattern2*, ranges : IUIAutomationTextRangeArray*) : HRESULT
    @lpVtbl.value.get_selection.call(this, ranges)
  end
  def get_visible_ranges(this : IUIAutomationTextPattern2*, ranges : IUIAutomationTextRangeArray*) : HRESULT
    @lpVtbl.value.get_visible_ranges.call(this, ranges)
  end
  def get_document_range(this : IUIAutomationTextPattern2*, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_document_range.call(this, range)
  end
  def get_supported_text_selection(this : IUIAutomationTextPattern2*, supportedtextselection : SupportedTextSelection*) : HRESULT
    @lpVtbl.value.get_supported_text_selection.call(this, supportedtextselection)
  end
  def range_from_annotation(this : IUIAutomationTextPattern2*, _annotation : IUIAutomationElement, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.range_from_annotation.call(this, _annotation, range)
  end
  def get_caret_range(this : IUIAutomationTextPattern2*, isactive : LibC::BOOL*, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_caret_range.call(this, isactive, range)
  end
end
struct LibWin32::IUIAutomationTextEditPattern
  def query_interface(this : IUIAutomationTextEditPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTextEditPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTextEditPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def range_from_point(this : IUIAutomationTextEditPattern*, pt : POINT, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.range_from_point.call(this, pt, range)
  end
  def range_from_child(this : IUIAutomationTextEditPattern*, child : IUIAutomationElement, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.range_from_child.call(this, child, range)
  end
  def get_selection(this : IUIAutomationTextEditPattern*, ranges : IUIAutomationTextRangeArray*) : HRESULT
    @lpVtbl.value.get_selection.call(this, ranges)
  end
  def get_visible_ranges(this : IUIAutomationTextEditPattern*, ranges : IUIAutomationTextRangeArray*) : HRESULT
    @lpVtbl.value.get_visible_ranges.call(this, ranges)
  end
  def get_document_range(this : IUIAutomationTextEditPattern*, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_document_range.call(this, range)
  end
  def get_supported_text_selection(this : IUIAutomationTextEditPattern*, supportedtextselection : SupportedTextSelection*) : HRESULT
    @lpVtbl.value.get_supported_text_selection.call(this, supportedtextselection)
  end
  def get_active_composition(this : IUIAutomationTextEditPattern*, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_active_composition.call(this, range)
  end
  def get_conversion_target(this : IUIAutomationTextEditPattern*, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_conversion_target.call(this, range)
  end
end
struct LibWin32::IUIAutomationCustomNavigationPattern
  def query_interface(this : IUIAutomationCustomNavigationPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationCustomNavigationPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationCustomNavigationPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def navigate(this : IUIAutomationCustomNavigationPattern*, direction : NavigateDirection, pretval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.navigate.call(this, direction, pretval)
  end
end
struct LibWin32::IUIAutomationActiveTextPositionChangedEventHandler
  def query_interface(this : IUIAutomationActiveTextPositionChangedEventHandler*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationActiveTextPositionChangedEventHandler*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationActiveTextPositionChangedEventHandler*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def handle_active_text_position_changed_event(this : IUIAutomationActiveTextPositionChangedEventHandler*, sender : IUIAutomationElement, range : IUIAutomationTextRange) : HRESULT
    @lpVtbl.value.handle_active_text_position_changed_event.call(this, sender, range)
  end
end
struct LibWin32::IUIAutomationLegacyIAccessiblePattern
  def query_interface(this : IUIAutomationLegacyIAccessiblePattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationLegacyIAccessiblePattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationLegacyIAccessiblePattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def select(this : IUIAutomationLegacyIAccessiblePattern*, flagsselect : Int32) : HRESULT
    @lpVtbl.value.select.call(this, flagsselect)
  end
  def do_default_action(this : IUIAutomationLegacyIAccessiblePattern*) : HRESULT
    @lpVtbl.value.do_default_action.call(this)
  end
  def set_value(this : IUIAutomationLegacyIAccessiblePattern*, szvalue : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.set_value.call(this, szvalue)
  end
  def get_current_child_id(this : IUIAutomationLegacyIAccessiblePattern*, pretval : Int32*) : HRESULT
    @lpVtbl.value.get_current_child_id.call(this, pretval)
  end
  def get_current_name(this : IUIAutomationLegacyIAccessiblePattern*, pszname : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.call(this, pszname)
  end
  def get_current_value(this : IUIAutomationLegacyIAccessiblePattern*, pszvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_current_value.call(this, pszvalue)
  end
  def get_current_description(this : IUIAutomationLegacyIAccessiblePattern*, pszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_current_description.call(this, pszdescription)
  end
  def get_current_role(this : IUIAutomationLegacyIAccessiblePattern*, pdwrole : UInt32*) : HRESULT
    @lpVtbl.value.get_current_role.call(this, pdwrole)
  end
  def get_current_state(this : IUIAutomationLegacyIAccessiblePattern*, pdwstate : UInt32*) : HRESULT
    @lpVtbl.value.get_current_state.call(this, pdwstate)
  end
  def get_current_help(this : IUIAutomationLegacyIAccessiblePattern*, pszhelp : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help.call(this, pszhelp)
  end
  def get_current_keyboard_shortcut(this : IUIAutomationLegacyIAccessiblePattern*, pszkeyboardshortcut : UInt8**) : HRESULT
    @lpVtbl.value.get_current_keyboard_shortcut.call(this, pszkeyboardshortcut)
  end
  def get_current_selection(this : IUIAutomationLegacyIAccessiblePattern*, pvarselectedchildren : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_selection.call(this, pvarselectedchildren)
  end
  def get_current_default_action(this : IUIAutomationLegacyIAccessiblePattern*, pszdefaultaction : UInt8**) : HRESULT
    @lpVtbl.value.get_current_default_action.call(this, pszdefaultaction)
  end
  def get_cached_child_id(this : IUIAutomationLegacyIAccessiblePattern*, pretval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_child_id.call(this, pretval)
  end
  def get_cached_name(this : IUIAutomationLegacyIAccessiblePattern*, pszname : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.call(this, pszname)
  end
  def get_cached_value(this : IUIAutomationLegacyIAccessiblePattern*, pszvalue : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_value.call(this, pszvalue)
  end
  def get_cached_description(this : IUIAutomationLegacyIAccessiblePattern*, pszdescription : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_description.call(this, pszdescription)
  end
  def get_cached_role(this : IUIAutomationLegacyIAccessiblePattern*, pdwrole : UInt32*) : HRESULT
    @lpVtbl.value.get_cached_role.call(this, pdwrole)
  end
  def get_cached_state(this : IUIAutomationLegacyIAccessiblePattern*, pdwstate : UInt32*) : HRESULT
    @lpVtbl.value.get_cached_state.call(this, pdwstate)
  end
  def get_cached_help(this : IUIAutomationLegacyIAccessiblePattern*, pszhelp : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help.call(this, pszhelp)
  end
  def get_cached_keyboard_shortcut(this : IUIAutomationLegacyIAccessiblePattern*, pszkeyboardshortcut : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_keyboard_shortcut.call(this, pszkeyboardshortcut)
  end
  def get_cached_selection(this : IUIAutomationLegacyIAccessiblePattern*, pvarselectedchildren : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_selection.call(this, pvarselectedchildren)
  end
  def get_cached_default_action(this : IUIAutomationLegacyIAccessiblePattern*, pszdefaultaction : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_default_action.call(this, pszdefaultaction)
  end
  def get_i_accessible(this : IUIAutomationLegacyIAccessiblePattern*, ppaccessible : IAccessible*) : HRESULT
    @lpVtbl.value.get_i_accessible.call(this, ppaccessible)
  end
end
struct LibWin32::IUIAutomationItemContainerPattern
  def query_interface(this : IUIAutomationItemContainerPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationItemContainerPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationItemContainerPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def find_item_by_property(this : IUIAutomationItemContainerPattern*, pstartafter : IUIAutomationElement, propertyid : Int32, value : VARIANT, pfound : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_item_by_property.call(this, pstartafter, propertyid, value, pfound)
  end
end
struct LibWin32::IUIAutomationVirtualizedItemPattern
  def query_interface(this : IUIAutomationVirtualizedItemPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationVirtualizedItemPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationVirtualizedItemPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def realize(this : IUIAutomationVirtualizedItemPattern*) : HRESULT
    @lpVtbl.value.realize.call(this)
  end
end
struct LibWin32::IUIAutomationAnnotationPattern
  def query_interface(this : IUIAutomationAnnotationPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationAnnotationPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationAnnotationPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_current_annotation_type_id(this : IUIAutomationAnnotationPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_annotation_type_id.call(this, retval)
  end
  def get_current_annotation_type_name(this : IUIAutomationAnnotationPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_annotation_type_name.call(this, retval)
  end
  def get_current_author(this : IUIAutomationAnnotationPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_author.call(this, retval)
  end
  def get_current_date_time(this : IUIAutomationAnnotationPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_date_time.call(this, retval)
  end
  def get_current_target(this : IUIAutomationAnnotationPattern*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_target.call(this, retval)
  end
  def get_cached_annotation_type_id(this : IUIAutomationAnnotationPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_annotation_type_id.call(this, retval)
  end
  def get_cached_annotation_type_name(this : IUIAutomationAnnotationPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_annotation_type_name.call(this, retval)
  end
  def get_cached_author(this : IUIAutomationAnnotationPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_author.call(this, retval)
  end
  def get_cached_date_time(this : IUIAutomationAnnotationPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_date_time.call(this, retval)
  end
  def get_cached_target(this : IUIAutomationAnnotationPattern*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_target.call(this, retval)
  end
end
struct LibWin32::IUIAutomationStylesPattern
  def query_interface(this : IUIAutomationStylesPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationStylesPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationStylesPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_current_style_id(this : IUIAutomationStylesPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_style_id.call(this, retval)
  end
  def get_current_style_name(this : IUIAutomationStylesPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_style_name.call(this, retval)
  end
  def get_current_fill_color(this : IUIAutomationStylesPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_fill_color.call(this, retval)
  end
  def get_current_fill_pattern_style(this : IUIAutomationStylesPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_fill_pattern_style.call(this, retval)
  end
  def get_current_shape(this : IUIAutomationStylesPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_shape.call(this, retval)
  end
  def get_current_fill_pattern_color(this : IUIAutomationStylesPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_fill_pattern_color.call(this, retval)
  end
  def get_current_extended_properties(this : IUIAutomationStylesPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_extended_properties.call(this, retval)
  end
  def get_current_extended_properties_as_array(this : IUIAutomationStylesPattern*, propertyarray : ExtendedProperty**, propertycount : Int32*) : HRESULT
    @lpVtbl.value.get_current_extended_properties_as_array.call(this, propertyarray, propertycount)
  end
  def get_cached_style_id(this : IUIAutomationStylesPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_style_id.call(this, retval)
  end
  def get_cached_style_name(this : IUIAutomationStylesPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_style_name.call(this, retval)
  end
  def get_cached_fill_color(this : IUIAutomationStylesPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_fill_color.call(this, retval)
  end
  def get_cached_fill_pattern_style(this : IUIAutomationStylesPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_fill_pattern_style.call(this, retval)
  end
  def get_cached_shape(this : IUIAutomationStylesPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_shape.call(this, retval)
  end
  def get_cached_fill_pattern_color(this : IUIAutomationStylesPattern*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_fill_pattern_color.call(this, retval)
  end
  def get_cached_extended_properties(this : IUIAutomationStylesPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_extended_properties.call(this, retval)
  end
  def get_cached_extended_properties_as_array(this : IUIAutomationStylesPattern*, propertyarray : ExtendedProperty**, propertycount : Int32*) : HRESULT
    @lpVtbl.value.get_cached_extended_properties_as_array.call(this, propertyarray, propertycount)
  end
end
struct LibWin32::IUIAutomationSpreadsheetPattern
  def query_interface(this : IUIAutomationSpreadsheetPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationSpreadsheetPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationSpreadsheetPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_item_by_name(this : IUIAutomationSpreadsheetPattern*, name : UInt8*, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_item_by_name.call(this, name, element)
  end
end
struct LibWin32::IUIAutomationSpreadsheetItemPattern
  def query_interface(this : IUIAutomationSpreadsheetItemPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationSpreadsheetItemPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationSpreadsheetItemPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_current_formula(this : IUIAutomationSpreadsheetItemPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_formula.call(this, retval)
  end
  def get_current_annotation_objects(this : IUIAutomationSpreadsheetItemPattern*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_annotation_objects.call(this, retval)
  end
  def get_current_annotation_types(this : IUIAutomationSpreadsheetItemPattern*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_annotation_types.call(this, retval)
  end
  def get_cached_formula(this : IUIAutomationSpreadsheetItemPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_formula.call(this, retval)
  end
  def get_cached_annotation_objects(this : IUIAutomationSpreadsheetItemPattern*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_annotation_objects.call(this, retval)
  end
  def get_cached_annotation_types(this : IUIAutomationSpreadsheetItemPattern*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_annotation_types.call(this, retval)
  end
end
struct LibWin32::IUIAutomationTransformPattern2
  def query_interface(this : IUIAutomationTransformPattern2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTransformPattern2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTransformPattern2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def move(this : IUIAutomationTransformPattern2*, x : Float64, y : Float64) : HRESULT
    @lpVtbl.value.move.call(this, x, y)
  end
  def resize(this : IUIAutomationTransformPattern2*, width : Float64, height : Float64) : HRESULT
    @lpVtbl.value.resize.call(this, width, height)
  end
  def rotate(this : IUIAutomationTransformPattern2*, degrees : Float64) : HRESULT
    @lpVtbl.value.rotate.call(this, degrees)
  end
  def get_current_can_move(this : IUIAutomationTransformPattern2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_move.call(this, retval)
  end
  def get_current_can_resize(this : IUIAutomationTransformPattern2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_resize.call(this, retval)
  end
  def get_current_can_rotate(this : IUIAutomationTransformPattern2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_rotate.call(this, retval)
  end
  def get_cached_can_move(this : IUIAutomationTransformPattern2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_move.call(this, retval)
  end
  def get_cached_can_resize(this : IUIAutomationTransformPattern2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_resize.call(this, retval)
  end
  def get_cached_can_rotate(this : IUIAutomationTransformPattern2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_rotate.call(this, retval)
  end
  def zoom(this : IUIAutomationTransformPattern2*, zoomvalue : Float64) : HRESULT
    @lpVtbl.value.zoom.call(this, zoomvalue)
  end
  def zoom_by_unit(this : IUIAutomationTransformPattern2*, zoomunit : ZoomUnit) : HRESULT
    @lpVtbl.value.zoom_by_unit.call(this, zoomunit)
  end
  def get_current_can_zoom(this : IUIAutomationTransformPattern2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_can_zoom.call(this, retval)
  end
  def get_cached_can_zoom(this : IUIAutomationTransformPattern2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_can_zoom.call(this, retval)
  end
  def get_current_zoom_level(this : IUIAutomationTransformPattern2*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_zoom_level.call(this, retval)
  end
  def get_cached_zoom_level(this : IUIAutomationTransformPattern2*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_zoom_level.call(this, retval)
  end
  def get_current_zoom_minimum(this : IUIAutomationTransformPattern2*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_zoom_minimum.call(this, retval)
  end
  def get_cached_zoom_minimum(this : IUIAutomationTransformPattern2*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_zoom_minimum.call(this, retval)
  end
  def get_current_zoom_maximum(this : IUIAutomationTransformPattern2*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_current_zoom_maximum.call(this, retval)
  end
  def get_cached_zoom_maximum(this : IUIAutomationTransformPattern2*, retval : Float64*) : HRESULT
    @lpVtbl.value.get_cached_zoom_maximum.call(this, retval)
  end
end
struct LibWin32::IUIAutomationTextChildPattern
  def query_interface(this : IUIAutomationTextChildPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationTextChildPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationTextChildPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_text_container(this : IUIAutomationTextChildPattern*, container : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_text_container.call(this, container)
  end
  def get_text_range(this : IUIAutomationTextChildPattern*, range : IUIAutomationTextRange*) : HRESULT
    @lpVtbl.value.get_text_range.call(this, range)
  end
end
struct LibWin32::IUIAutomationDragPattern
  def query_interface(this : IUIAutomationDragPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationDragPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationDragPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_current_is_grabbed(this : IUIAutomationDragPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_grabbed.call(this, retval)
  end
  def get_cached_is_grabbed(this : IUIAutomationDragPattern*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_grabbed.call(this, retval)
  end
  def get_current_drop_effect(this : IUIAutomationDragPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_drop_effect.call(this, retval)
  end
  def get_cached_drop_effect(this : IUIAutomationDragPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_drop_effect.call(this, retval)
  end
  def get_current_drop_effects(this : IUIAutomationDragPattern*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_drop_effects.call(this, retval)
  end
  def get_cached_drop_effects(this : IUIAutomationDragPattern*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_drop_effects.call(this, retval)
  end
  def get_current_grabbed_items(this : IUIAutomationDragPattern*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_grabbed_items.call(this, retval)
  end
  def get_cached_grabbed_items(this : IUIAutomationDragPattern*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_grabbed_items.call(this, retval)
  end
end
struct LibWin32::IUIAutomationDropTargetPattern
  def query_interface(this : IUIAutomationDropTargetPattern*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationDropTargetPattern*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationDropTargetPattern*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_current_drop_target_effect(this : IUIAutomationDropTargetPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_drop_target_effect.call(this, retval)
  end
  def get_cached_drop_target_effect(this : IUIAutomationDropTargetPattern*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_drop_target_effect.call(this, retval)
  end
  def get_current_drop_target_effects(this : IUIAutomationDropTargetPattern*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_drop_target_effects.call(this, retval)
  end
  def get_cached_drop_target_effects(this : IUIAutomationDropTargetPattern*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_drop_target_effects.call(this, retval)
  end
end
struct LibWin32::IUIAutomationElement2
  def query_interface(this : IUIAutomationElement2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationElement2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationElement2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_focus(this : IUIAutomationElement2*) : HRESULT
    @lpVtbl.value.set_focus.call(this)
  end
  def get_runtime_id(this : IUIAutomationElement2*, runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.call(this, runtimeid)
  end
  def find_first(this : IUIAutomationElement2*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.call(this, scope, condition, found)
  end
  def find_all(this : IUIAutomationElement2*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.call(this, scope, condition, found)
  end
  def find_first_build_cache(this : IUIAutomationElement2*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def find_all_build_cache(this : IUIAutomationElement2*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def build_updated_cache(this : IUIAutomationElement2*, cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.call(this, cacherequest, updatedelement)
  end
  def get_current_property_value(this : IUIAutomationElement2*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.call(this, propertyid, retval)
  end
  def get_current_property_value_ex(this : IUIAutomationElement2*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(this : IUIAutomationElement2*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.call(this, propertyid, retval)
  end
  def get_cached_property_value_ex(this : IUIAutomationElement2*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(this : IUIAutomationElement2*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_cached_pattern_as(this : IUIAutomationElement2*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_current_pattern(this : IUIAutomationElement2*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.call(this, patternid, patternobject)
  end
  def get_cached_pattern(this : IUIAutomationElement2*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.call(this, patternid, patternobject)
  end
  def get_cached_parent(this : IUIAutomationElement2*, parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.call(this, parent)
  end
  def get_cached_children(this : IUIAutomationElement2*, children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.call(this, children)
  end
  def get_current_process_id(this : IUIAutomationElement2*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.call(this, retval)
  end
  def get_current_control_type(this : IUIAutomationElement2*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.call(this, retval)
  end
  def get_current_localized_control_type(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.call(this, retval)
  end
  def get_current_name(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.call(this, retval)
  end
  def get_current_accelerator_key(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.call(this, retval)
  end
  def get_current_access_key(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.call(this, retval)
  end
  def get_current_has_keyboard_focus(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.call(this, retval)
  end
  def get_current_is_keyboard_focusable(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.call(this, retval)
  end
  def get_current_is_enabled(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.call(this, retval)
  end
  def get_current_automation_id(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.call(this, retval)
  end
  def get_current_class_name(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.call(this, retval)
  end
  def get_current_help_text(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.call(this, retval)
  end
  def get_current_culture(this : IUIAutomationElement2*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.call(this, retval)
  end
  def get_current_is_control_element(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.call(this, retval)
  end
  def get_current_is_content_element(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.call(this, retval)
  end
  def get_current_is_password(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.call(this, retval)
  end
  def get_current_native_window_handle(this : IUIAutomationElement2*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.call(this, retval)
  end
  def get_current_item_type(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.call(this, retval)
  end
  def get_current_is_offscreen(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.call(this, retval)
  end
  def get_current_orientation(this : IUIAutomationElement2*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.call(this, retval)
  end
  def get_current_framework_id(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.call(this, retval)
  end
  def get_current_is_required_for_form(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.call(this, retval)
  end
  def get_current_item_status(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.call(this, retval)
  end
  def get_current_bounding_rectangle(this : IUIAutomationElement2*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.call(this, retval)
  end
  def get_current_labeled_by(this : IUIAutomationElement2*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.call(this, retval)
  end
  def get_current_aria_role(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.call(this, retval)
  end
  def get_current_aria_properties(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.call(this, retval)
  end
  def get_current_is_data_valid_for_form(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.call(this, retval)
  end
  def get_current_controller_for(this : IUIAutomationElement2*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.call(this, retval)
  end
  def get_current_described_by(this : IUIAutomationElement2*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.call(this, retval)
  end
  def get_current_flows_to(this : IUIAutomationElement2*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.call(this, retval)
  end
  def get_current_provider_description(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.call(this, retval)
  end
  def get_cached_process_id(this : IUIAutomationElement2*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.call(this, retval)
  end
  def get_cached_control_type(this : IUIAutomationElement2*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.call(this, retval)
  end
  def get_cached_localized_control_type(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.call(this, retval)
  end
  def get_cached_name(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.call(this, retval)
  end
  def get_cached_accelerator_key(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.call(this, retval)
  end
  def get_cached_access_key(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.call(this, retval)
  end
  def get_cached_has_keyboard_focus(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.call(this, retval)
  end
  def get_cached_is_keyboard_focusable(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.call(this, retval)
  end
  def get_cached_is_enabled(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.call(this, retval)
  end
  def get_cached_automation_id(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.call(this, retval)
  end
  def get_cached_class_name(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.call(this, retval)
  end
  def get_cached_help_text(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.call(this, retval)
  end
  def get_cached_culture(this : IUIAutomationElement2*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.call(this, retval)
  end
  def get_cached_is_control_element(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.call(this, retval)
  end
  def get_cached_is_content_element(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.call(this, retval)
  end
  def get_cached_is_password(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.call(this, retval)
  end
  def get_cached_native_window_handle(this : IUIAutomationElement2*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.call(this, retval)
  end
  def get_cached_item_type(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.call(this, retval)
  end
  def get_cached_is_offscreen(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.call(this, retval)
  end
  def get_cached_orientation(this : IUIAutomationElement2*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.call(this, retval)
  end
  def get_cached_framework_id(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.call(this, retval)
  end
  def get_cached_is_required_for_form(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.call(this, retval)
  end
  def get_cached_item_status(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.call(this, retval)
  end
  def get_cached_bounding_rectangle(this : IUIAutomationElement2*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.call(this, retval)
  end
  def get_cached_labeled_by(this : IUIAutomationElement2*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.call(this, retval)
  end
  def get_cached_aria_role(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.call(this, retval)
  end
  def get_cached_aria_properties(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.call(this, retval)
  end
  def get_cached_is_data_valid_for_form(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.call(this, retval)
  end
  def get_cached_controller_for(this : IUIAutomationElement2*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.call(this, retval)
  end
  def get_cached_described_by(this : IUIAutomationElement2*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.call(this, retval)
  end
  def get_cached_flows_to(this : IUIAutomationElement2*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.call(this, retval)
  end
  def get_cached_provider_description(this : IUIAutomationElement2*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.call(this, retval)
  end
  def get_clickable_point(this : IUIAutomationElement2*, clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.call(this, clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.call(this, retval)
  end
  def get_cached_optimize_for_visual_content(this : IUIAutomationElement2*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.call(this, retval)
  end
  def get_current_live_setting(this : IUIAutomationElement2*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.call(this, retval)
  end
  def get_cached_live_setting(this : IUIAutomationElement2*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.call(this, retval)
  end
  def get_current_flows_from(this : IUIAutomationElement2*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.call(this, retval)
  end
  def get_cached_flows_from(this : IUIAutomationElement2*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.call(this, retval)
  end
end
struct LibWin32::IUIAutomationElement3
  def query_interface(this : IUIAutomationElement3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationElement3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationElement3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_focus(this : IUIAutomationElement3*) : HRESULT
    @lpVtbl.value.set_focus.call(this)
  end
  def get_runtime_id(this : IUIAutomationElement3*, runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.call(this, runtimeid)
  end
  def find_first(this : IUIAutomationElement3*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.call(this, scope, condition, found)
  end
  def find_all(this : IUIAutomationElement3*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.call(this, scope, condition, found)
  end
  def find_first_build_cache(this : IUIAutomationElement3*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def find_all_build_cache(this : IUIAutomationElement3*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def build_updated_cache(this : IUIAutomationElement3*, cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.call(this, cacherequest, updatedelement)
  end
  def get_current_property_value(this : IUIAutomationElement3*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.call(this, propertyid, retval)
  end
  def get_current_property_value_ex(this : IUIAutomationElement3*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(this : IUIAutomationElement3*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.call(this, propertyid, retval)
  end
  def get_cached_property_value_ex(this : IUIAutomationElement3*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(this : IUIAutomationElement3*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_cached_pattern_as(this : IUIAutomationElement3*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_current_pattern(this : IUIAutomationElement3*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.call(this, patternid, patternobject)
  end
  def get_cached_pattern(this : IUIAutomationElement3*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.call(this, patternid, patternobject)
  end
  def get_cached_parent(this : IUIAutomationElement3*, parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.call(this, parent)
  end
  def get_cached_children(this : IUIAutomationElement3*, children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.call(this, children)
  end
  def get_current_process_id(this : IUIAutomationElement3*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.call(this, retval)
  end
  def get_current_control_type(this : IUIAutomationElement3*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.call(this, retval)
  end
  def get_current_localized_control_type(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.call(this, retval)
  end
  def get_current_name(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.call(this, retval)
  end
  def get_current_accelerator_key(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.call(this, retval)
  end
  def get_current_access_key(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.call(this, retval)
  end
  def get_current_has_keyboard_focus(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.call(this, retval)
  end
  def get_current_is_keyboard_focusable(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.call(this, retval)
  end
  def get_current_is_enabled(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.call(this, retval)
  end
  def get_current_automation_id(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.call(this, retval)
  end
  def get_current_class_name(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.call(this, retval)
  end
  def get_current_help_text(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.call(this, retval)
  end
  def get_current_culture(this : IUIAutomationElement3*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.call(this, retval)
  end
  def get_current_is_control_element(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.call(this, retval)
  end
  def get_current_is_content_element(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.call(this, retval)
  end
  def get_current_is_password(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.call(this, retval)
  end
  def get_current_native_window_handle(this : IUIAutomationElement3*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.call(this, retval)
  end
  def get_current_item_type(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.call(this, retval)
  end
  def get_current_is_offscreen(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.call(this, retval)
  end
  def get_current_orientation(this : IUIAutomationElement3*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.call(this, retval)
  end
  def get_current_framework_id(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.call(this, retval)
  end
  def get_current_is_required_for_form(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.call(this, retval)
  end
  def get_current_item_status(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.call(this, retval)
  end
  def get_current_bounding_rectangle(this : IUIAutomationElement3*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.call(this, retval)
  end
  def get_current_labeled_by(this : IUIAutomationElement3*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.call(this, retval)
  end
  def get_current_aria_role(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.call(this, retval)
  end
  def get_current_aria_properties(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.call(this, retval)
  end
  def get_current_is_data_valid_for_form(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.call(this, retval)
  end
  def get_current_controller_for(this : IUIAutomationElement3*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.call(this, retval)
  end
  def get_current_described_by(this : IUIAutomationElement3*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.call(this, retval)
  end
  def get_current_flows_to(this : IUIAutomationElement3*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.call(this, retval)
  end
  def get_current_provider_description(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.call(this, retval)
  end
  def get_cached_process_id(this : IUIAutomationElement3*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.call(this, retval)
  end
  def get_cached_control_type(this : IUIAutomationElement3*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.call(this, retval)
  end
  def get_cached_localized_control_type(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.call(this, retval)
  end
  def get_cached_name(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.call(this, retval)
  end
  def get_cached_accelerator_key(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.call(this, retval)
  end
  def get_cached_access_key(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.call(this, retval)
  end
  def get_cached_has_keyboard_focus(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.call(this, retval)
  end
  def get_cached_is_keyboard_focusable(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.call(this, retval)
  end
  def get_cached_is_enabled(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.call(this, retval)
  end
  def get_cached_automation_id(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.call(this, retval)
  end
  def get_cached_class_name(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.call(this, retval)
  end
  def get_cached_help_text(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.call(this, retval)
  end
  def get_cached_culture(this : IUIAutomationElement3*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.call(this, retval)
  end
  def get_cached_is_control_element(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.call(this, retval)
  end
  def get_cached_is_content_element(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.call(this, retval)
  end
  def get_cached_is_password(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.call(this, retval)
  end
  def get_cached_native_window_handle(this : IUIAutomationElement3*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.call(this, retval)
  end
  def get_cached_item_type(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.call(this, retval)
  end
  def get_cached_is_offscreen(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.call(this, retval)
  end
  def get_cached_orientation(this : IUIAutomationElement3*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.call(this, retval)
  end
  def get_cached_framework_id(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.call(this, retval)
  end
  def get_cached_is_required_for_form(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.call(this, retval)
  end
  def get_cached_item_status(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.call(this, retval)
  end
  def get_cached_bounding_rectangle(this : IUIAutomationElement3*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.call(this, retval)
  end
  def get_cached_labeled_by(this : IUIAutomationElement3*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.call(this, retval)
  end
  def get_cached_aria_role(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.call(this, retval)
  end
  def get_cached_aria_properties(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.call(this, retval)
  end
  def get_cached_is_data_valid_for_form(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.call(this, retval)
  end
  def get_cached_controller_for(this : IUIAutomationElement3*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.call(this, retval)
  end
  def get_cached_described_by(this : IUIAutomationElement3*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.call(this, retval)
  end
  def get_cached_flows_to(this : IUIAutomationElement3*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.call(this, retval)
  end
  def get_cached_provider_description(this : IUIAutomationElement3*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.call(this, retval)
  end
  def get_clickable_point(this : IUIAutomationElement3*, clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.call(this, clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.call(this, retval)
  end
  def get_cached_optimize_for_visual_content(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.call(this, retval)
  end
  def get_current_live_setting(this : IUIAutomationElement3*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.call(this, retval)
  end
  def get_cached_live_setting(this : IUIAutomationElement3*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.call(this, retval)
  end
  def get_current_flows_from(this : IUIAutomationElement3*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.call(this, retval)
  end
  def get_cached_flows_from(this : IUIAutomationElement3*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.call(this, retval)
  end
  def show_context_menu(this : IUIAutomationElement3*) : HRESULT
    @lpVtbl.value.show_context_menu.call(this)
  end
  def get_current_is_peripheral(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_peripheral.call(this, retval)
  end
  def get_cached_is_peripheral(this : IUIAutomationElement3*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_peripheral.call(this, retval)
  end
end
struct LibWin32::IUIAutomationElement4
  def query_interface(this : IUIAutomationElement4*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationElement4*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationElement4*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_focus(this : IUIAutomationElement4*) : HRESULT
    @lpVtbl.value.set_focus.call(this)
  end
  def get_runtime_id(this : IUIAutomationElement4*, runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.call(this, runtimeid)
  end
  def find_first(this : IUIAutomationElement4*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.call(this, scope, condition, found)
  end
  def find_all(this : IUIAutomationElement4*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.call(this, scope, condition, found)
  end
  def find_first_build_cache(this : IUIAutomationElement4*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def find_all_build_cache(this : IUIAutomationElement4*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def build_updated_cache(this : IUIAutomationElement4*, cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.call(this, cacherequest, updatedelement)
  end
  def get_current_property_value(this : IUIAutomationElement4*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.call(this, propertyid, retval)
  end
  def get_current_property_value_ex(this : IUIAutomationElement4*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(this : IUIAutomationElement4*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.call(this, propertyid, retval)
  end
  def get_cached_property_value_ex(this : IUIAutomationElement4*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(this : IUIAutomationElement4*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_cached_pattern_as(this : IUIAutomationElement4*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_current_pattern(this : IUIAutomationElement4*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.call(this, patternid, patternobject)
  end
  def get_cached_pattern(this : IUIAutomationElement4*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.call(this, patternid, patternobject)
  end
  def get_cached_parent(this : IUIAutomationElement4*, parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.call(this, parent)
  end
  def get_cached_children(this : IUIAutomationElement4*, children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.call(this, children)
  end
  def get_current_process_id(this : IUIAutomationElement4*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.call(this, retval)
  end
  def get_current_control_type(this : IUIAutomationElement4*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.call(this, retval)
  end
  def get_current_localized_control_type(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.call(this, retval)
  end
  def get_current_name(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.call(this, retval)
  end
  def get_current_accelerator_key(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.call(this, retval)
  end
  def get_current_access_key(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.call(this, retval)
  end
  def get_current_has_keyboard_focus(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.call(this, retval)
  end
  def get_current_is_keyboard_focusable(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.call(this, retval)
  end
  def get_current_is_enabled(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.call(this, retval)
  end
  def get_current_automation_id(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.call(this, retval)
  end
  def get_current_class_name(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.call(this, retval)
  end
  def get_current_help_text(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.call(this, retval)
  end
  def get_current_culture(this : IUIAutomationElement4*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.call(this, retval)
  end
  def get_current_is_control_element(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.call(this, retval)
  end
  def get_current_is_content_element(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.call(this, retval)
  end
  def get_current_is_password(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.call(this, retval)
  end
  def get_current_native_window_handle(this : IUIAutomationElement4*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.call(this, retval)
  end
  def get_current_item_type(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.call(this, retval)
  end
  def get_current_is_offscreen(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.call(this, retval)
  end
  def get_current_orientation(this : IUIAutomationElement4*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.call(this, retval)
  end
  def get_current_framework_id(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.call(this, retval)
  end
  def get_current_is_required_for_form(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.call(this, retval)
  end
  def get_current_item_status(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.call(this, retval)
  end
  def get_current_bounding_rectangle(this : IUIAutomationElement4*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.call(this, retval)
  end
  def get_current_labeled_by(this : IUIAutomationElement4*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.call(this, retval)
  end
  def get_current_aria_role(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.call(this, retval)
  end
  def get_current_aria_properties(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.call(this, retval)
  end
  def get_current_is_data_valid_for_form(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.call(this, retval)
  end
  def get_current_controller_for(this : IUIAutomationElement4*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.call(this, retval)
  end
  def get_current_described_by(this : IUIAutomationElement4*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.call(this, retval)
  end
  def get_current_flows_to(this : IUIAutomationElement4*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.call(this, retval)
  end
  def get_current_provider_description(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.call(this, retval)
  end
  def get_cached_process_id(this : IUIAutomationElement4*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.call(this, retval)
  end
  def get_cached_control_type(this : IUIAutomationElement4*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.call(this, retval)
  end
  def get_cached_localized_control_type(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.call(this, retval)
  end
  def get_cached_name(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.call(this, retval)
  end
  def get_cached_accelerator_key(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.call(this, retval)
  end
  def get_cached_access_key(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.call(this, retval)
  end
  def get_cached_has_keyboard_focus(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.call(this, retval)
  end
  def get_cached_is_keyboard_focusable(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.call(this, retval)
  end
  def get_cached_is_enabled(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.call(this, retval)
  end
  def get_cached_automation_id(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.call(this, retval)
  end
  def get_cached_class_name(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.call(this, retval)
  end
  def get_cached_help_text(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.call(this, retval)
  end
  def get_cached_culture(this : IUIAutomationElement4*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.call(this, retval)
  end
  def get_cached_is_control_element(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.call(this, retval)
  end
  def get_cached_is_content_element(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.call(this, retval)
  end
  def get_cached_is_password(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.call(this, retval)
  end
  def get_cached_native_window_handle(this : IUIAutomationElement4*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.call(this, retval)
  end
  def get_cached_item_type(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.call(this, retval)
  end
  def get_cached_is_offscreen(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.call(this, retval)
  end
  def get_cached_orientation(this : IUIAutomationElement4*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.call(this, retval)
  end
  def get_cached_framework_id(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.call(this, retval)
  end
  def get_cached_is_required_for_form(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.call(this, retval)
  end
  def get_cached_item_status(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.call(this, retval)
  end
  def get_cached_bounding_rectangle(this : IUIAutomationElement4*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.call(this, retval)
  end
  def get_cached_labeled_by(this : IUIAutomationElement4*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.call(this, retval)
  end
  def get_cached_aria_role(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.call(this, retval)
  end
  def get_cached_aria_properties(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.call(this, retval)
  end
  def get_cached_is_data_valid_for_form(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.call(this, retval)
  end
  def get_cached_controller_for(this : IUIAutomationElement4*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.call(this, retval)
  end
  def get_cached_described_by(this : IUIAutomationElement4*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.call(this, retval)
  end
  def get_cached_flows_to(this : IUIAutomationElement4*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.call(this, retval)
  end
  def get_cached_provider_description(this : IUIAutomationElement4*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.call(this, retval)
  end
  def get_clickable_point(this : IUIAutomationElement4*, clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.call(this, clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.call(this, retval)
  end
  def get_cached_optimize_for_visual_content(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.call(this, retval)
  end
  def get_current_live_setting(this : IUIAutomationElement4*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.call(this, retval)
  end
  def get_cached_live_setting(this : IUIAutomationElement4*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.call(this, retval)
  end
  def get_current_flows_from(this : IUIAutomationElement4*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.call(this, retval)
  end
  def get_cached_flows_from(this : IUIAutomationElement4*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.call(this, retval)
  end
  def show_context_menu(this : IUIAutomationElement4*) : HRESULT
    @lpVtbl.value.show_context_menu.call(this)
  end
  def get_current_is_peripheral(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_peripheral.call(this, retval)
  end
  def get_cached_is_peripheral(this : IUIAutomationElement4*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_peripheral.call(this, retval)
  end
  def get_current_position_in_set(this : IUIAutomationElement4*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_position_in_set.call(this, retval)
  end
  def get_current_size_of_set(this : IUIAutomationElement4*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_size_of_set.call(this, retval)
  end
  def get_current_level(this : IUIAutomationElement4*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_level.call(this, retval)
  end
  def get_current_annotation_types(this : IUIAutomationElement4*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_annotation_types.call(this, retval)
  end
  def get_current_annotation_objects(this : IUIAutomationElement4*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_annotation_objects.call(this, retval)
  end
  def get_cached_position_in_set(this : IUIAutomationElement4*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_position_in_set.call(this, retval)
  end
  def get_cached_size_of_set(this : IUIAutomationElement4*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_size_of_set.call(this, retval)
  end
  def get_cached_level(this : IUIAutomationElement4*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_level.call(this, retval)
  end
  def get_cached_annotation_types(this : IUIAutomationElement4*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_annotation_types.call(this, retval)
  end
  def get_cached_annotation_objects(this : IUIAutomationElement4*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_annotation_objects.call(this, retval)
  end
end
struct LibWin32::IUIAutomationElement5
  def query_interface(this : IUIAutomationElement5*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationElement5*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationElement5*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_focus(this : IUIAutomationElement5*) : HRESULT
    @lpVtbl.value.set_focus.call(this)
  end
  def get_runtime_id(this : IUIAutomationElement5*, runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.call(this, runtimeid)
  end
  def find_first(this : IUIAutomationElement5*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.call(this, scope, condition, found)
  end
  def find_all(this : IUIAutomationElement5*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.call(this, scope, condition, found)
  end
  def find_first_build_cache(this : IUIAutomationElement5*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def find_all_build_cache(this : IUIAutomationElement5*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def build_updated_cache(this : IUIAutomationElement5*, cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.call(this, cacherequest, updatedelement)
  end
  def get_current_property_value(this : IUIAutomationElement5*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.call(this, propertyid, retval)
  end
  def get_current_property_value_ex(this : IUIAutomationElement5*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(this : IUIAutomationElement5*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.call(this, propertyid, retval)
  end
  def get_cached_property_value_ex(this : IUIAutomationElement5*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(this : IUIAutomationElement5*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_cached_pattern_as(this : IUIAutomationElement5*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_current_pattern(this : IUIAutomationElement5*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.call(this, patternid, patternobject)
  end
  def get_cached_pattern(this : IUIAutomationElement5*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.call(this, patternid, patternobject)
  end
  def get_cached_parent(this : IUIAutomationElement5*, parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.call(this, parent)
  end
  def get_cached_children(this : IUIAutomationElement5*, children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.call(this, children)
  end
  def get_current_process_id(this : IUIAutomationElement5*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.call(this, retval)
  end
  def get_current_control_type(this : IUIAutomationElement5*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.call(this, retval)
  end
  def get_current_localized_control_type(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.call(this, retval)
  end
  def get_current_name(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.call(this, retval)
  end
  def get_current_accelerator_key(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.call(this, retval)
  end
  def get_current_access_key(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.call(this, retval)
  end
  def get_current_has_keyboard_focus(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.call(this, retval)
  end
  def get_current_is_keyboard_focusable(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.call(this, retval)
  end
  def get_current_is_enabled(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.call(this, retval)
  end
  def get_current_automation_id(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.call(this, retval)
  end
  def get_current_class_name(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.call(this, retval)
  end
  def get_current_help_text(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.call(this, retval)
  end
  def get_current_culture(this : IUIAutomationElement5*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.call(this, retval)
  end
  def get_current_is_control_element(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.call(this, retval)
  end
  def get_current_is_content_element(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.call(this, retval)
  end
  def get_current_is_password(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.call(this, retval)
  end
  def get_current_native_window_handle(this : IUIAutomationElement5*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.call(this, retval)
  end
  def get_current_item_type(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.call(this, retval)
  end
  def get_current_is_offscreen(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.call(this, retval)
  end
  def get_current_orientation(this : IUIAutomationElement5*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.call(this, retval)
  end
  def get_current_framework_id(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.call(this, retval)
  end
  def get_current_is_required_for_form(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.call(this, retval)
  end
  def get_current_item_status(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.call(this, retval)
  end
  def get_current_bounding_rectangle(this : IUIAutomationElement5*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.call(this, retval)
  end
  def get_current_labeled_by(this : IUIAutomationElement5*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.call(this, retval)
  end
  def get_current_aria_role(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.call(this, retval)
  end
  def get_current_aria_properties(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.call(this, retval)
  end
  def get_current_is_data_valid_for_form(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.call(this, retval)
  end
  def get_current_controller_for(this : IUIAutomationElement5*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.call(this, retval)
  end
  def get_current_described_by(this : IUIAutomationElement5*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.call(this, retval)
  end
  def get_current_flows_to(this : IUIAutomationElement5*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.call(this, retval)
  end
  def get_current_provider_description(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.call(this, retval)
  end
  def get_cached_process_id(this : IUIAutomationElement5*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.call(this, retval)
  end
  def get_cached_control_type(this : IUIAutomationElement5*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.call(this, retval)
  end
  def get_cached_localized_control_type(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.call(this, retval)
  end
  def get_cached_name(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.call(this, retval)
  end
  def get_cached_accelerator_key(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.call(this, retval)
  end
  def get_cached_access_key(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.call(this, retval)
  end
  def get_cached_has_keyboard_focus(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.call(this, retval)
  end
  def get_cached_is_keyboard_focusable(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.call(this, retval)
  end
  def get_cached_is_enabled(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.call(this, retval)
  end
  def get_cached_automation_id(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.call(this, retval)
  end
  def get_cached_class_name(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.call(this, retval)
  end
  def get_cached_help_text(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.call(this, retval)
  end
  def get_cached_culture(this : IUIAutomationElement5*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.call(this, retval)
  end
  def get_cached_is_control_element(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.call(this, retval)
  end
  def get_cached_is_content_element(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.call(this, retval)
  end
  def get_cached_is_password(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.call(this, retval)
  end
  def get_cached_native_window_handle(this : IUIAutomationElement5*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.call(this, retval)
  end
  def get_cached_item_type(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.call(this, retval)
  end
  def get_cached_is_offscreen(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.call(this, retval)
  end
  def get_cached_orientation(this : IUIAutomationElement5*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.call(this, retval)
  end
  def get_cached_framework_id(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.call(this, retval)
  end
  def get_cached_is_required_for_form(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.call(this, retval)
  end
  def get_cached_item_status(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.call(this, retval)
  end
  def get_cached_bounding_rectangle(this : IUIAutomationElement5*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.call(this, retval)
  end
  def get_cached_labeled_by(this : IUIAutomationElement5*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.call(this, retval)
  end
  def get_cached_aria_role(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.call(this, retval)
  end
  def get_cached_aria_properties(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.call(this, retval)
  end
  def get_cached_is_data_valid_for_form(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.call(this, retval)
  end
  def get_cached_controller_for(this : IUIAutomationElement5*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.call(this, retval)
  end
  def get_cached_described_by(this : IUIAutomationElement5*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.call(this, retval)
  end
  def get_cached_flows_to(this : IUIAutomationElement5*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.call(this, retval)
  end
  def get_cached_provider_description(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.call(this, retval)
  end
  def get_clickable_point(this : IUIAutomationElement5*, clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.call(this, clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.call(this, retval)
  end
  def get_cached_optimize_for_visual_content(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.call(this, retval)
  end
  def get_current_live_setting(this : IUIAutomationElement5*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.call(this, retval)
  end
  def get_cached_live_setting(this : IUIAutomationElement5*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.call(this, retval)
  end
  def get_current_flows_from(this : IUIAutomationElement5*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.call(this, retval)
  end
  def get_cached_flows_from(this : IUIAutomationElement5*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.call(this, retval)
  end
  def show_context_menu(this : IUIAutomationElement5*) : HRESULT
    @lpVtbl.value.show_context_menu.call(this)
  end
  def get_current_is_peripheral(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_peripheral.call(this, retval)
  end
  def get_cached_is_peripheral(this : IUIAutomationElement5*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_peripheral.call(this, retval)
  end
  def get_current_position_in_set(this : IUIAutomationElement5*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_position_in_set.call(this, retval)
  end
  def get_current_size_of_set(this : IUIAutomationElement5*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_size_of_set.call(this, retval)
  end
  def get_current_level(this : IUIAutomationElement5*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_level.call(this, retval)
  end
  def get_current_annotation_types(this : IUIAutomationElement5*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_annotation_types.call(this, retval)
  end
  def get_current_annotation_objects(this : IUIAutomationElement5*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_annotation_objects.call(this, retval)
  end
  def get_cached_position_in_set(this : IUIAutomationElement5*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_position_in_set.call(this, retval)
  end
  def get_cached_size_of_set(this : IUIAutomationElement5*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_size_of_set.call(this, retval)
  end
  def get_cached_level(this : IUIAutomationElement5*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_level.call(this, retval)
  end
  def get_cached_annotation_types(this : IUIAutomationElement5*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_annotation_types.call(this, retval)
  end
  def get_cached_annotation_objects(this : IUIAutomationElement5*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_annotation_objects.call(this, retval)
  end
  def get_current_landmark_type(this : IUIAutomationElement5*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_landmark_type.call(this, retval)
  end
  def get_current_localized_landmark_type(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_landmark_type.call(this, retval)
  end
  def get_cached_landmark_type(this : IUIAutomationElement5*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_landmark_type.call(this, retval)
  end
  def get_cached_localized_landmark_type(this : IUIAutomationElement5*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_landmark_type.call(this, retval)
  end
end
struct LibWin32::IUIAutomationElement6
  def query_interface(this : IUIAutomationElement6*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationElement6*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationElement6*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_focus(this : IUIAutomationElement6*) : HRESULT
    @lpVtbl.value.set_focus.call(this)
  end
  def get_runtime_id(this : IUIAutomationElement6*, runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.call(this, runtimeid)
  end
  def find_first(this : IUIAutomationElement6*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.call(this, scope, condition, found)
  end
  def find_all(this : IUIAutomationElement6*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.call(this, scope, condition, found)
  end
  def find_first_build_cache(this : IUIAutomationElement6*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def find_all_build_cache(this : IUIAutomationElement6*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def build_updated_cache(this : IUIAutomationElement6*, cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.call(this, cacherequest, updatedelement)
  end
  def get_current_property_value(this : IUIAutomationElement6*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.call(this, propertyid, retval)
  end
  def get_current_property_value_ex(this : IUIAutomationElement6*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(this : IUIAutomationElement6*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.call(this, propertyid, retval)
  end
  def get_cached_property_value_ex(this : IUIAutomationElement6*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(this : IUIAutomationElement6*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_cached_pattern_as(this : IUIAutomationElement6*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_current_pattern(this : IUIAutomationElement6*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.call(this, patternid, patternobject)
  end
  def get_cached_pattern(this : IUIAutomationElement6*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.call(this, patternid, patternobject)
  end
  def get_cached_parent(this : IUIAutomationElement6*, parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.call(this, parent)
  end
  def get_cached_children(this : IUIAutomationElement6*, children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.call(this, children)
  end
  def get_current_process_id(this : IUIAutomationElement6*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.call(this, retval)
  end
  def get_current_control_type(this : IUIAutomationElement6*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.call(this, retval)
  end
  def get_current_localized_control_type(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.call(this, retval)
  end
  def get_current_name(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.call(this, retval)
  end
  def get_current_accelerator_key(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.call(this, retval)
  end
  def get_current_access_key(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.call(this, retval)
  end
  def get_current_has_keyboard_focus(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.call(this, retval)
  end
  def get_current_is_keyboard_focusable(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.call(this, retval)
  end
  def get_current_is_enabled(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.call(this, retval)
  end
  def get_current_automation_id(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.call(this, retval)
  end
  def get_current_class_name(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.call(this, retval)
  end
  def get_current_help_text(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.call(this, retval)
  end
  def get_current_culture(this : IUIAutomationElement6*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.call(this, retval)
  end
  def get_current_is_control_element(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.call(this, retval)
  end
  def get_current_is_content_element(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.call(this, retval)
  end
  def get_current_is_password(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.call(this, retval)
  end
  def get_current_native_window_handle(this : IUIAutomationElement6*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.call(this, retval)
  end
  def get_current_item_type(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.call(this, retval)
  end
  def get_current_is_offscreen(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.call(this, retval)
  end
  def get_current_orientation(this : IUIAutomationElement6*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.call(this, retval)
  end
  def get_current_framework_id(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.call(this, retval)
  end
  def get_current_is_required_for_form(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.call(this, retval)
  end
  def get_current_item_status(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.call(this, retval)
  end
  def get_current_bounding_rectangle(this : IUIAutomationElement6*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.call(this, retval)
  end
  def get_current_labeled_by(this : IUIAutomationElement6*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.call(this, retval)
  end
  def get_current_aria_role(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.call(this, retval)
  end
  def get_current_aria_properties(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.call(this, retval)
  end
  def get_current_is_data_valid_for_form(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.call(this, retval)
  end
  def get_current_controller_for(this : IUIAutomationElement6*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.call(this, retval)
  end
  def get_current_described_by(this : IUIAutomationElement6*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.call(this, retval)
  end
  def get_current_flows_to(this : IUIAutomationElement6*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.call(this, retval)
  end
  def get_current_provider_description(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.call(this, retval)
  end
  def get_cached_process_id(this : IUIAutomationElement6*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.call(this, retval)
  end
  def get_cached_control_type(this : IUIAutomationElement6*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.call(this, retval)
  end
  def get_cached_localized_control_type(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.call(this, retval)
  end
  def get_cached_name(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.call(this, retval)
  end
  def get_cached_accelerator_key(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.call(this, retval)
  end
  def get_cached_access_key(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.call(this, retval)
  end
  def get_cached_has_keyboard_focus(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.call(this, retval)
  end
  def get_cached_is_keyboard_focusable(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.call(this, retval)
  end
  def get_cached_is_enabled(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.call(this, retval)
  end
  def get_cached_automation_id(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.call(this, retval)
  end
  def get_cached_class_name(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.call(this, retval)
  end
  def get_cached_help_text(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.call(this, retval)
  end
  def get_cached_culture(this : IUIAutomationElement6*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.call(this, retval)
  end
  def get_cached_is_control_element(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.call(this, retval)
  end
  def get_cached_is_content_element(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.call(this, retval)
  end
  def get_cached_is_password(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.call(this, retval)
  end
  def get_cached_native_window_handle(this : IUIAutomationElement6*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.call(this, retval)
  end
  def get_cached_item_type(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.call(this, retval)
  end
  def get_cached_is_offscreen(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.call(this, retval)
  end
  def get_cached_orientation(this : IUIAutomationElement6*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.call(this, retval)
  end
  def get_cached_framework_id(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.call(this, retval)
  end
  def get_cached_is_required_for_form(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.call(this, retval)
  end
  def get_cached_item_status(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.call(this, retval)
  end
  def get_cached_bounding_rectangle(this : IUIAutomationElement6*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.call(this, retval)
  end
  def get_cached_labeled_by(this : IUIAutomationElement6*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.call(this, retval)
  end
  def get_cached_aria_role(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.call(this, retval)
  end
  def get_cached_aria_properties(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.call(this, retval)
  end
  def get_cached_is_data_valid_for_form(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.call(this, retval)
  end
  def get_cached_controller_for(this : IUIAutomationElement6*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.call(this, retval)
  end
  def get_cached_described_by(this : IUIAutomationElement6*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.call(this, retval)
  end
  def get_cached_flows_to(this : IUIAutomationElement6*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.call(this, retval)
  end
  def get_cached_provider_description(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.call(this, retval)
  end
  def get_clickable_point(this : IUIAutomationElement6*, clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.call(this, clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.call(this, retval)
  end
  def get_cached_optimize_for_visual_content(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.call(this, retval)
  end
  def get_current_live_setting(this : IUIAutomationElement6*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.call(this, retval)
  end
  def get_cached_live_setting(this : IUIAutomationElement6*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.call(this, retval)
  end
  def get_current_flows_from(this : IUIAutomationElement6*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.call(this, retval)
  end
  def get_cached_flows_from(this : IUIAutomationElement6*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.call(this, retval)
  end
  def show_context_menu(this : IUIAutomationElement6*) : HRESULT
    @lpVtbl.value.show_context_menu.call(this)
  end
  def get_current_is_peripheral(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_peripheral.call(this, retval)
  end
  def get_cached_is_peripheral(this : IUIAutomationElement6*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_peripheral.call(this, retval)
  end
  def get_current_position_in_set(this : IUIAutomationElement6*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_position_in_set.call(this, retval)
  end
  def get_current_size_of_set(this : IUIAutomationElement6*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_size_of_set.call(this, retval)
  end
  def get_current_level(this : IUIAutomationElement6*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_level.call(this, retval)
  end
  def get_current_annotation_types(this : IUIAutomationElement6*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_annotation_types.call(this, retval)
  end
  def get_current_annotation_objects(this : IUIAutomationElement6*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_annotation_objects.call(this, retval)
  end
  def get_cached_position_in_set(this : IUIAutomationElement6*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_position_in_set.call(this, retval)
  end
  def get_cached_size_of_set(this : IUIAutomationElement6*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_size_of_set.call(this, retval)
  end
  def get_cached_level(this : IUIAutomationElement6*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_level.call(this, retval)
  end
  def get_cached_annotation_types(this : IUIAutomationElement6*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_annotation_types.call(this, retval)
  end
  def get_cached_annotation_objects(this : IUIAutomationElement6*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_annotation_objects.call(this, retval)
  end
  def get_current_landmark_type(this : IUIAutomationElement6*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_landmark_type.call(this, retval)
  end
  def get_current_localized_landmark_type(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_landmark_type.call(this, retval)
  end
  def get_cached_landmark_type(this : IUIAutomationElement6*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_landmark_type.call(this, retval)
  end
  def get_cached_localized_landmark_type(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_landmark_type.call(this, retval)
  end
  def get_current_full_description(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_full_description.call(this, retval)
  end
  def get_cached_full_description(this : IUIAutomationElement6*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_full_description.call(this, retval)
  end
end
struct LibWin32::IUIAutomationElement7
  def query_interface(this : IUIAutomationElement7*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationElement7*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationElement7*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_focus(this : IUIAutomationElement7*) : HRESULT
    @lpVtbl.value.set_focus.call(this)
  end
  def get_runtime_id(this : IUIAutomationElement7*, runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.call(this, runtimeid)
  end
  def find_first(this : IUIAutomationElement7*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.call(this, scope, condition, found)
  end
  def find_all(this : IUIAutomationElement7*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.call(this, scope, condition, found)
  end
  def find_first_build_cache(this : IUIAutomationElement7*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def find_all_build_cache(this : IUIAutomationElement7*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def build_updated_cache(this : IUIAutomationElement7*, cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.call(this, cacherequest, updatedelement)
  end
  def get_current_property_value(this : IUIAutomationElement7*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.call(this, propertyid, retval)
  end
  def get_current_property_value_ex(this : IUIAutomationElement7*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(this : IUIAutomationElement7*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.call(this, propertyid, retval)
  end
  def get_cached_property_value_ex(this : IUIAutomationElement7*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(this : IUIAutomationElement7*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_cached_pattern_as(this : IUIAutomationElement7*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_current_pattern(this : IUIAutomationElement7*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.call(this, patternid, patternobject)
  end
  def get_cached_pattern(this : IUIAutomationElement7*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.call(this, patternid, patternobject)
  end
  def get_cached_parent(this : IUIAutomationElement7*, parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.call(this, parent)
  end
  def get_cached_children(this : IUIAutomationElement7*, children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.call(this, children)
  end
  def get_current_process_id(this : IUIAutomationElement7*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.call(this, retval)
  end
  def get_current_control_type(this : IUIAutomationElement7*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.call(this, retval)
  end
  def get_current_localized_control_type(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.call(this, retval)
  end
  def get_current_name(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.call(this, retval)
  end
  def get_current_accelerator_key(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.call(this, retval)
  end
  def get_current_access_key(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.call(this, retval)
  end
  def get_current_has_keyboard_focus(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.call(this, retval)
  end
  def get_current_is_keyboard_focusable(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.call(this, retval)
  end
  def get_current_is_enabled(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.call(this, retval)
  end
  def get_current_automation_id(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.call(this, retval)
  end
  def get_current_class_name(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.call(this, retval)
  end
  def get_current_help_text(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.call(this, retval)
  end
  def get_current_culture(this : IUIAutomationElement7*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.call(this, retval)
  end
  def get_current_is_control_element(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.call(this, retval)
  end
  def get_current_is_content_element(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.call(this, retval)
  end
  def get_current_is_password(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.call(this, retval)
  end
  def get_current_native_window_handle(this : IUIAutomationElement7*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.call(this, retval)
  end
  def get_current_item_type(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.call(this, retval)
  end
  def get_current_is_offscreen(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.call(this, retval)
  end
  def get_current_orientation(this : IUIAutomationElement7*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.call(this, retval)
  end
  def get_current_framework_id(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.call(this, retval)
  end
  def get_current_is_required_for_form(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.call(this, retval)
  end
  def get_current_item_status(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.call(this, retval)
  end
  def get_current_bounding_rectangle(this : IUIAutomationElement7*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.call(this, retval)
  end
  def get_current_labeled_by(this : IUIAutomationElement7*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.call(this, retval)
  end
  def get_current_aria_role(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.call(this, retval)
  end
  def get_current_aria_properties(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.call(this, retval)
  end
  def get_current_is_data_valid_for_form(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.call(this, retval)
  end
  def get_current_controller_for(this : IUIAutomationElement7*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.call(this, retval)
  end
  def get_current_described_by(this : IUIAutomationElement7*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.call(this, retval)
  end
  def get_current_flows_to(this : IUIAutomationElement7*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.call(this, retval)
  end
  def get_current_provider_description(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.call(this, retval)
  end
  def get_cached_process_id(this : IUIAutomationElement7*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.call(this, retval)
  end
  def get_cached_control_type(this : IUIAutomationElement7*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.call(this, retval)
  end
  def get_cached_localized_control_type(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.call(this, retval)
  end
  def get_cached_name(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.call(this, retval)
  end
  def get_cached_accelerator_key(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.call(this, retval)
  end
  def get_cached_access_key(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.call(this, retval)
  end
  def get_cached_has_keyboard_focus(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.call(this, retval)
  end
  def get_cached_is_keyboard_focusable(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.call(this, retval)
  end
  def get_cached_is_enabled(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.call(this, retval)
  end
  def get_cached_automation_id(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.call(this, retval)
  end
  def get_cached_class_name(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.call(this, retval)
  end
  def get_cached_help_text(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.call(this, retval)
  end
  def get_cached_culture(this : IUIAutomationElement7*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.call(this, retval)
  end
  def get_cached_is_control_element(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.call(this, retval)
  end
  def get_cached_is_content_element(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.call(this, retval)
  end
  def get_cached_is_password(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.call(this, retval)
  end
  def get_cached_native_window_handle(this : IUIAutomationElement7*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.call(this, retval)
  end
  def get_cached_item_type(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.call(this, retval)
  end
  def get_cached_is_offscreen(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.call(this, retval)
  end
  def get_cached_orientation(this : IUIAutomationElement7*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.call(this, retval)
  end
  def get_cached_framework_id(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.call(this, retval)
  end
  def get_cached_is_required_for_form(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.call(this, retval)
  end
  def get_cached_item_status(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.call(this, retval)
  end
  def get_cached_bounding_rectangle(this : IUIAutomationElement7*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.call(this, retval)
  end
  def get_cached_labeled_by(this : IUIAutomationElement7*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.call(this, retval)
  end
  def get_cached_aria_role(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.call(this, retval)
  end
  def get_cached_aria_properties(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.call(this, retval)
  end
  def get_cached_is_data_valid_for_form(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.call(this, retval)
  end
  def get_cached_controller_for(this : IUIAutomationElement7*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.call(this, retval)
  end
  def get_cached_described_by(this : IUIAutomationElement7*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.call(this, retval)
  end
  def get_cached_flows_to(this : IUIAutomationElement7*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.call(this, retval)
  end
  def get_cached_provider_description(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.call(this, retval)
  end
  def get_clickable_point(this : IUIAutomationElement7*, clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.call(this, clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.call(this, retval)
  end
  def get_cached_optimize_for_visual_content(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.call(this, retval)
  end
  def get_current_live_setting(this : IUIAutomationElement7*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.call(this, retval)
  end
  def get_cached_live_setting(this : IUIAutomationElement7*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.call(this, retval)
  end
  def get_current_flows_from(this : IUIAutomationElement7*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.call(this, retval)
  end
  def get_cached_flows_from(this : IUIAutomationElement7*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.call(this, retval)
  end
  def show_context_menu(this : IUIAutomationElement7*) : HRESULT
    @lpVtbl.value.show_context_menu.call(this)
  end
  def get_current_is_peripheral(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_peripheral.call(this, retval)
  end
  def get_cached_is_peripheral(this : IUIAutomationElement7*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_peripheral.call(this, retval)
  end
  def get_current_position_in_set(this : IUIAutomationElement7*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_position_in_set.call(this, retval)
  end
  def get_current_size_of_set(this : IUIAutomationElement7*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_size_of_set.call(this, retval)
  end
  def get_current_level(this : IUIAutomationElement7*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_level.call(this, retval)
  end
  def get_current_annotation_types(this : IUIAutomationElement7*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_annotation_types.call(this, retval)
  end
  def get_current_annotation_objects(this : IUIAutomationElement7*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_annotation_objects.call(this, retval)
  end
  def get_cached_position_in_set(this : IUIAutomationElement7*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_position_in_set.call(this, retval)
  end
  def get_cached_size_of_set(this : IUIAutomationElement7*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_size_of_set.call(this, retval)
  end
  def get_cached_level(this : IUIAutomationElement7*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_level.call(this, retval)
  end
  def get_cached_annotation_types(this : IUIAutomationElement7*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_annotation_types.call(this, retval)
  end
  def get_cached_annotation_objects(this : IUIAutomationElement7*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_annotation_objects.call(this, retval)
  end
  def get_current_landmark_type(this : IUIAutomationElement7*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_landmark_type.call(this, retval)
  end
  def get_current_localized_landmark_type(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_landmark_type.call(this, retval)
  end
  def get_cached_landmark_type(this : IUIAutomationElement7*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_landmark_type.call(this, retval)
  end
  def get_cached_localized_landmark_type(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_landmark_type.call(this, retval)
  end
  def get_current_full_description(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_full_description.call(this, retval)
  end
  def get_cached_full_description(this : IUIAutomationElement7*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_full_description.call(this, retval)
  end
  def find_first_with_options(this : IUIAutomationElement7*, scope : TreeScope, condition : IUIAutomationCondition, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_with_options.call(this, scope, condition, traversaloptions, root, found)
  end
  def find_all_with_options(this : IUIAutomationElement7*, scope : TreeScope, condition : IUIAutomationCondition, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_with_options.call(this, scope, condition, traversaloptions, root, found)
  end
  def find_first_with_options_build_cache(this : IUIAutomationElement7*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_with_options_build_cache.call(this, scope, condition, cacherequest, traversaloptions, root, found)
  end
  def find_all_with_options_build_cache(this : IUIAutomationElement7*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_with_options_build_cache.call(this, scope, condition, cacherequest, traversaloptions, root, found)
  end
  def get_current_metadata_value(this : IUIAutomationElement7*, targetid : Int32, metadataid : Int32, returnval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_metadata_value.call(this, targetid, metadataid, returnval)
  end
end
struct LibWin32::IUIAutomationElement8
  def query_interface(this : IUIAutomationElement8*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationElement8*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationElement8*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_focus(this : IUIAutomationElement8*) : HRESULT
    @lpVtbl.value.set_focus.call(this)
  end
  def get_runtime_id(this : IUIAutomationElement8*, runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.call(this, runtimeid)
  end
  def find_first(this : IUIAutomationElement8*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.call(this, scope, condition, found)
  end
  def find_all(this : IUIAutomationElement8*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.call(this, scope, condition, found)
  end
  def find_first_build_cache(this : IUIAutomationElement8*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def find_all_build_cache(this : IUIAutomationElement8*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def build_updated_cache(this : IUIAutomationElement8*, cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.call(this, cacherequest, updatedelement)
  end
  def get_current_property_value(this : IUIAutomationElement8*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.call(this, propertyid, retval)
  end
  def get_current_property_value_ex(this : IUIAutomationElement8*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(this : IUIAutomationElement8*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.call(this, propertyid, retval)
  end
  def get_cached_property_value_ex(this : IUIAutomationElement8*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(this : IUIAutomationElement8*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_cached_pattern_as(this : IUIAutomationElement8*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_current_pattern(this : IUIAutomationElement8*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.call(this, patternid, patternobject)
  end
  def get_cached_pattern(this : IUIAutomationElement8*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.call(this, patternid, patternobject)
  end
  def get_cached_parent(this : IUIAutomationElement8*, parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.call(this, parent)
  end
  def get_cached_children(this : IUIAutomationElement8*, children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.call(this, children)
  end
  def get_current_process_id(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.call(this, retval)
  end
  def get_current_control_type(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.call(this, retval)
  end
  def get_current_localized_control_type(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.call(this, retval)
  end
  def get_current_name(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.call(this, retval)
  end
  def get_current_accelerator_key(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.call(this, retval)
  end
  def get_current_access_key(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.call(this, retval)
  end
  def get_current_has_keyboard_focus(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.call(this, retval)
  end
  def get_current_is_keyboard_focusable(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.call(this, retval)
  end
  def get_current_is_enabled(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.call(this, retval)
  end
  def get_current_automation_id(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.call(this, retval)
  end
  def get_current_class_name(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.call(this, retval)
  end
  def get_current_help_text(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.call(this, retval)
  end
  def get_current_culture(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.call(this, retval)
  end
  def get_current_is_control_element(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.call(this, retval)
  end
  def get_current_is_content_element(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.call(this, retval)
  end
  def get_current_is_password(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.call(this, retval)
  end
  def get_current_native_window_handle(this : IUIAutomationElement8*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.call(this, retval)
  end
  def get_current_item_type(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.call(this, retval)
  end
  def get_current_is_offscreen(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.call(this, retval)
  end
  def get_current_orientation(this : IUIAutomationElement8*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.call(this, retval)
  end
  def get_current_framework_id(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.call(this, retval)
  end
  def get_current_is_required_for_form(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.call(this, retval)
  end
  def get_current_item_status(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.call(this, retval)
  end
  def get_current_bounding_rectangle(this : IUIAutomationElement8*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.call(this, retval)
  end
  def get_current_labeled_by(this : IUIAutomationElement8*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.call(this, retval)
  end
  def get_current_aria_role(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.call(this, retval)
  end
  def get_current_aria_properties(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.call(this, retval)
  end
  def get_current_is_data_valid_for_form(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.call(this, retval)
  end
  def get_current_controller_for(this : IUIAutomationElement8*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.call(this, retval)
  end
  def get_current_described_by(this : IUIAutomationElement8*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.call(this, retval)
  end
  def get_current_flows_to(this : IUIAutomationElement8*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.call(this, retval)
  end
  def get_current_provider_description(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.call(this, retval)
  end
  def get_cached_process_id(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.call(this, retval)
  end
  def get_cached_control_type(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.call(this, retval)
  end
  def get_cached_localized_control_type(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.call(this, retval)
  end
  def get_cached_name(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.call(this, retval)
  end
  def get_cached_accelerator_key(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.call(this, retval)
  end
  def get_cached_access_key(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.call(this, retval)
  end
  def get_cached_has_keyboard_focus(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.call(this, retval)
  end
  def get_cached_is_keyboard_focusable(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.call(this, retval)
  end
  def get_cached_is_enabled(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.call(this, retval)
  end
  def get_cached_automation_id(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.call(this, retval)
  end
  def get_cached_class_name(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.call(this, retval)
  end
  def get_cached_help_text(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.call(this, retval)
  end
  def get_cached_culture(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.call(this, retval)
  end
  def get_cached_is_control_element(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.call(this, retval)
  end
  def get_cached_is_content_element(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.call(this, retval)
  end
  def get_cached_is_password(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.call(this, retval)
  end
  def get_cached_native_window_handle(this : IUIAutomationElement8*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.call(this, retval)
  end
  def get_cached_item_type(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.call(this, retval)
  end
  def get_cached_is_offscreen(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.call(this, retval)
  end
  def get_cached_orientation(this : IUIAutomationElement8*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.call(this, retval)
  end
  def get_cached_framework_id(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.call(this, retval)
  end
  def get_cached_is_required_for_form(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.call(this, retval)
  end
  def get_cached_item_status(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.call(this, retval)
  end
  def get_cached_bounding_rectangle(this : IUIAutomationElement8*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.call(this, retval)
  end
  def get_cached_labeled_by(this : IUIAutomationElement8*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.call(this, retval)
  end
  def get_cached_aria_role(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.call(this, retval)
  end
  def get_cached_aria_properties(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.call(this, retval)
  end
  def get_cached_is_data_valid_for_form(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.call(this, retval)
  end
  def get_cached_controller_for(this : IUIAutomationElement8*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.call(this, retval)
  end
  def get_cached_described_by(this : IUIAutomationElement8*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.call(this, retval)
  end
  def get_cached_flows_to(this : IUIAutomationElement8*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.call(this, retval)
  end
  def get_cached_provider_description(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.call(this, retval)
  end
  def get_clickable_point(this : IUIAutomationElement8*, clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.call(this, clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.call(this, retval)
  end
  def get_cached_optimize_for_visual_content(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.call(this, retval)
  end
  def get_current_live_setting(this : IUIAutomationElement8*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.call(this, retval)
  end
  def get_cached_live_setting(this : IUIAutomationElement8*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.call(this, retval)
  end
  def get_current_flows_from(this : IUIAutomationElement8*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.call(this, retval)
  end
  def get_cached_flows_from(this : IUIAutomationElement8*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.call(this, retval)
  end
  def show_context_menu(this : IUIAutomationElement8*) : HRESULT
    @lpVtbl.value.show_context_menu.call(this)
  end
  def get_current_is_peripheral(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_peripheral.call(this, retval)
  end
  def get_cached_is_peripheral(this : IUIAutomationElement8*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_peripheral.call(this, retval)
  end
  def get_current_position_in_set(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_position_in_set.call(this, retval)
  end
  def get_current_size_of_set(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_size_of_set.call(this, retval)
  end
  def get_current_level(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_level.call(this, retval)
  end
  def get_current_annotation_types(this : IUIAutomationElement8*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_annotation_types.call(this, retval)
  end
  def get_current_annotation_objects(this : IUIAutomationElement8*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_annotation_objects.call(this, retval)
  end
  def get_cached_position_in_set(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_position_in_set.call(this, retval)
  end
  def get_cached_size_of_set(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_size_of_set.call(this, retval)
  end
  def get_cached_level(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_level.call(this, retval)
  end
  def get_cached_annotation_types(this : IUIAutomationElement8*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_annotation_types.call(this, retval)
  end
  def get_cached_annotation_objects(this : IUIAutomationElement8*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_annotation_objects.call(this, retval)
  end
  def get_current_landmark_type(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_landmark_type.call(this, retval)
  end
  def get_current_localized_landmark_type(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_landmark_type.call(this, retval)
  end
  def get_cached_landmark_type(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_landmark_type.call(this, retval)
  end
  def get_cached_localized_landmark_type(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_landmark_type.call(this, retval)
  end
  def get_current_full_description(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_full_description.call(this, retval)
  end
  def get_cached_full_description(this : IUIAutomationElement8*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_full_description.call(this, retval)
  end
  def find_first_with_options(this : IUIAutomationElement8*, scope : TreeScope, condition : IUIAutomationCondition, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_with_options.call(this, scope, condition, traversaloptions, root, found)
  end
  def find_all_with_options(this : IUIAutomationElement8*, scope : TreeScope, condition : IUIAutomationCondition, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_with_options.call(this, scope, condition, traversaloptions, root, found)
  end
  def find_first_with_options_build_cache(this : IUIAutomationElement8*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_with_options_build_cache.call(this, scope, condition, cacherequest, traversaloptions, root, found)
  end
  def find_all_with_options_build_cache(this : IUIAutomationElement8*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_with_options_build_cache.call(this, scope, condition, cacherequest, traversaloptions, root, found)
  end
  def get_current_metadata_value(this : IUIAutomationElement8*, targetid : Int32, metadataid : Int32, returnval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_metadata_value.call(this, targetid, metadataid, returnval)
  end
  def get_current_heading_level(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_heading_level.call(this, retval)
  end
  def get_cached_heading_level(this : IUIAutomationElement8*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_heading_level.call(this, retval)
  end
end
struct LibWin32::IUIAutomationElement9
  def query_interface(this : IUIAutomationElement9*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationElement9*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationElement9*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def set_focus(this : IUIAutomationElement9*) : HRESULT
    @lpVtbl.value.set_focus.call(this)
  end
  def get_runtime_id(this : IUIAutomationElement9*, runtimeid : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_runtime_id.call(this, runtimeid)
  end
  def find_first(this : IUIAutomationElement9*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first.call(this, scope, condition, found)
  end
  def find_all(this : IUIAutomationElement9*, scope : TreeScope, condition : IUIAutomationCondition, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all.call(this, scope, condition, found)
  end
  def find_first_build_cache(this : IUIAutomationElement9*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def find_all_build_cache(this : IUIAutomationElement9*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_build_cache.call(this, scope, condition, cacherequest, found)
  end
  def build_updated_cache(this : IUIAutomationElement9*, cacherequest : IUIAutomationCacheRequest, updatedelement : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.build_updated_cache.call(this, cacherequest, updatedelement)
  end
  def get_current_property_value(this : IUIAutomationElement9*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value.call(this, propertyid, retval)
  end
  def get_current_property_value_ex(this : IUIAutomationElement9*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_cached_property_value(this : IUIAutomationElement9*, propertyid : Int32, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value.call(this, propertyid, retval)
  end
  def get_cached_property_value_ex(this : IUIAutomationElement9*, propertyid : Int32, ignoredefaultvalue : LibC::BOOL, retval : VARIANT*) : HRESULT
    @lpVtbl.value.get_cached_property_value_ex.call(this, propertyid, ignoredefaultvalue, retval)
  end
  def get_current_pattern_as(this : IUIAutomationElement9*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_current_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_cached_pattern_as(this : IUIAutomationElement9*, patternid : Int32, riid : Guid*, patternobject : Void**) : HRESULT
    @lpVtbl.value.get_cached_pattern_as.call(this, patternid, riid, patternobject)
  end
  def get_current_pattern(this : IUIAutomationElement9*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_current_pattern.call(this, patternid, patternobject)
  end
  def get_cached_pattern(this : IUIAutomationElement9*, patternid : Int32, patternobject : IUnknown*) : HRESULT
    @lpVtbl.value.get_cached_pattern.call(this, patternid, patternobject)
  end
  def get_cached_parent(this : IUIAutomationElement9*, parent : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_parent.call(this, parent)
  end
  def get_cached_children(this : IUIAutomationElement9*, children : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_children.call(this, children)
  end
  def get_current_process_id(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_process_id.call(this, retval)
  end
  def get_current_control_type(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_control_type.call(this, retval)
  end
  def get_current_localized_control_type(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_control_type.call(this, retval)
  end
  def get_current_name(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_name.call(this, retval)
  end
  def get_current_accelerator_key(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_accelerator_key.call(this, retval)
  end
  def get_current_access_key(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_access_key.call(this, retval)
  end
  def get_current_has_keyboard_focus(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_has_keyboard_focus.call(this, retval)
  end
  def get_current_is_keyboard_focusable(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_keyboard_focusable.call(this, retval)
  end
  def get_current_is_enabled(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_enabled.call(this, retval)
  end
  def get_current_automation_id(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_automation_id.call(this, retval)
  end
  def get_current_class_name(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_class_name.call(this, retval)
  end
  def get_current_help_text(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_help_text.call(this, retval)
  end
  def get_current_culture(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_culture.call(this, retval)
  end
  def get_current_is_control_element(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_control_element.call(this, retval)
  end
  def get_current_is_content_element(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_content_element.call(this, retval)
  end
  def get_current_is_password(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_password.call(this, retval)
  end
  def get_current_native_window_handle(this : IUIAutomationElement9*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_current_native_window_handle.call(this, retval)
  end
  def get_current_item_type(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_type.call(this, retval)
  end
  def get_current_is_offscreen(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_offscreen.call(this, retval)
  end
  def get_current_orientation(this : IUIAutomationElement9*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_current_orientation.call(this, retval)
  end
  def get_current_framework_id(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_framework_id.call(this, retval)
  end
  def get_current_is_required_for_form(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_required_for_form.call(this, retval)
  end
  def get_current_item_status(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_item_status.call(this, retval)
  end
  def get_current_bounding_rectangle(this : IUIAutomationElement9*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_current_bounding_rectangle.call(this, retval)
  end
  def get_current_labeled_by(this : IUIAutomationElement9*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_current_labeled_by.call(this, retval)
  end
  def get_current_aria_role(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_role.call(this, retval)
  end
  def get_current_aria_properties(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_aria_properties.call(this, retval)
  end
  def get_current_is_data_valid_for_form(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_data_valid_for_form.call(this, retval)
  end
  def get_current_controller_for(this : IUIAutomationElement9*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_controller_for.call(this, retval)
  end
  def get_current_described_by(this : IUIAutomationElement9*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_described_by.call(this, retval)
  end
  def get_current_flows_to(this : IUIAutomationElement9*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_to.call(this, retval)
  end
  def get_current_provider_description(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_provider_description.call(this, retval)
  end
  def get_cached_process_id(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_process_id.call(this, retval)
  end
  def get_cached_control_type(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_control_type.call(this, retval)
  end
  def get_cached_localized_control_type(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_control_type.call(this, retval)
  end
  def get_cached_name(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_name.call(this, retval)
  end
  def get_cached_accelerator_key(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_accelerator_key.call(this, retval)
  end
  def get_cached_access_key(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_access_key.call(this, retval)
  end
  def get_cached_has_keyboard_focus(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_has_keyboard_focus.call(this, retval)
  end
  def get_cached_is_keyboard_focusable(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_keyboard_focusable.call(this, retval)
  end
  def get_cached_is_enabled(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_enabled.call(this, retval)
  end
  def get_cached_automation_id(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_automation_id.call(this, retval)
  end
  def get_cached_class_name(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_class_name.call(this, retval)
  end
  def get_cached_help_text(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_help_text.call(this, retval)
  end
  def get_cached_culture(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_culture.call(this, retval)
  end
  def get_cached_is_control_element(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_control_element.call(this, retval)
  end
  def get_cached_is_content_element(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_content_element.call(this, retval)
  end
  def get_cached_is_password(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_password.call(this, retval)
  end
  def get_cached_native_window_handle(this : IUIAutomationElement9*, retval : LibC::HANDLE) : HRESULT
    @lpVtbl.value.get_cached_native_window_handle.call(this, retval)
  end
  def get_cached_item_type(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_type.call(this, retval)
  end
  def get_cached_is_offscreen(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_offscreen.call(this, retval)
  end
  def get_cached_orientation(this : IUIAutomationElement9*, retval : OrientationType*) : HRESULT
    @lpVtbl.value.get_cached_orientation.call(this, retval)
  end
  def get_cached_framework_id(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_framework_id.call(this, retval)
  end
  def get_cached_is_required_for_form(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_required_for_form.call(this, retval)
  end
  def get_cached_item_status(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_item_status.call(this, retval)
  end
  def get_cached_bounding_rectangle(this : IUIAutomationElement9*, retval : RECT*) : HRESULT
    @lpVtbl.value.get_cached_bounding_rectangle.call(this, retval)
  end
  def get_cached_labeled_by(this : IUIAutomationElement9*, retval : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_cached_labeled_by.call(this, retval)
  end
  def get_cached_aria_role(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_role.call(this, retval)
  end
  def get_cached_aria_properties(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_aria_properties.call(this, retval)
  end
  def get_cached_is_data_valid_for_form(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_data_valid_for_form.call(this, retval)
  end
  def get_cached_controller_for(this : IUIAutomationElement9*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_controller_for.call(this, retval)
  end
  def get_cached_described_by(this : IUIAutomationElement9*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_described_by.call(this, retval)
  end
  def get_cached_flows_to(this : IUIAutomationElement9*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_to.call(this, retval)
  end
  def get_cached_provider_description(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_provider_description.call(this, retval)
  end
  def get_clickable_point(this : IUIAutomationElement9*, clickable : POINT*, gotclickable : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_clickable_point.call(this, clickable, gotclickable)
  end
  def get_current_optimize_for_visual_content(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_optimize_for_visual_content.call(this, retval)
  end
  def get_cached_optimize_for_visual_content(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_optimize_for_visual_content.call(this, retval)
  end
  def get_current_live_setting(this : IUIAutomationElement9*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_current_live_setting.call(this, retval)
  end
  def get_cached_live_setting(this : IUIAutomationElement9*, retval : LiveSetting*) : HRESULT
    @lpVtbl.value.get_cached_live_setting.call(this, retval)
  end
  def get_current_flows_from(this : IUIAutomationElement9*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_flows_from.call(this, retval)
  end
  def get_cached_flows_from(this : IUIAutomationElement9*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_flows_from.call(this, retval)
  end
  def show_context_menu(this : IUIAutomationElement9*) : HRESULT
    @lpVtbl.value.show_context_menu.call(this)
  end
  def get_current_is_peripheral(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_peripheral.call(this, retval)
  end
  def get_cached_is_peripheral(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_peripheral.call(this, retval)
  end
  def get_current_position_in_set(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_position_in_set.call(this, retval)
  end
  def get_current_size_of_set(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_size_of_set.call(this, retval)
  end
  def get_current_level(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_level.call(this, retval)
  end
  def get_current_annotation_types(this : IUIAutomationElement9*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_current_annotation_types.call(this, retval)
  end
  def get_current_annotation_objects(this : IUIAutomationElement9*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_current_annotation_objects.call(this, retval)
  end
  def get_cached_position_in_set(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_position_in_set.call(this, retval)
  end
  def get_cached_size_of_set(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_size_of_set.call(this, retval)
  end
  def get_cached_level(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_level.call(this, retval)
  end
  def get_cached_annotation_types(this : IUIAutomationElement9*, retval : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_cached_annotation_types.call(this, retval)
  end
  def get_cached_annotation_objects(this : IUIAutomationElement9*, retval : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.get_cached_annotation_objects.call(this, retval)
  end
  def get_current_landmark_type(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_landmark_type.call(this, retval)
  end
  def get_current_localized_landmark_type(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_localized_landmark_type.call(this, retval)
  end
  def get_cached_landmark_type(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_landmark_type.call(this, retval)
  end
  def get_cached_localized_landmark_type(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_localized_landmark_type.call(this, retval)
  end
  def get_current_full_description(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_current_full_description.call(this, retval)
  end
  def get_cached_full_description(this : IUIAutomationElement9*, retval : UInt8**) : HRESULT
    @lpVtbl.value.get_cached_full_description.call(this, retval)
  end
  def find_first_with_options(this : IUIAutomationElement9*, scope : TreeScope, condition : IUIAutomationCondition, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_with_options.call(this, scope, condition, traversaloptions, root, found)
  end
  def find_all_with_options(this : IUIAutomationElement9*, scope : TreeScope, condition : IUIAutomationCondition, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_with_options.call(this, scope, condition, traversaloptions, root, found)
  end
  def find_first_with_options_build_cache(this : IUIAutomationElement9*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.find_first_with_options_build_cache.call(this, scope, condition, cacherequest, traversaloptions, root, found)
  end
  def find_all_with_options_build_cache(this : IUIAutomationElement9*, scope : TreeScope, condition : IUIAutomationCondition, cacherequest : IUIAutomationCacheRequest, traversaloptions : TreeTraversalOptions, root : IUIAutomationElement, found : IUIAutomationElementArray*) : HRESULT
    @lpVtbl.value.find_all_with_options_build_cache.call(this, scope, condition, cacherequest, traversaloptions, root, found)
  end
  def get_current_metadata_value(this : IUIAutomationElement9*, targetid : Int32, metadataid : Int32, returnval : VARIANT*) : HRESULT
    @lpVtbl.value.get_current_metadata_value.call(this, targetid, metadataid, returnval)
  end
  def get_current_heading_level(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_current_heading_level.call(this, retval)
  end
  def get_cached_heading_level(this : IUIAutomationElement9*, retval : Int32*) : HRESULT
    @lpVtbl.value.get_cached_heading_level.call(this, retval)
  end
  def get_current_is_dialog(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_current_is_dialog.call(this, retval)
  end
  def get_cached_is_dialog(this : IUIAutomationElement9*, retval : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_cached_is_dialog.call(this, retval)
  end
end
struct LibWin32::IUIAutomationProxyFactory
  def query_interface(this : IUIAutomationProxyFactory*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationProxyFactory*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationProxyFactory*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def create_provider(this : IUIAutomationProxyFactory*, hwnd : LibC::HANDLE, idobject : Int32, idchild : Int32, provider : IRawElementProviderSimple*) : HRESULT
    @lpVtbl.value.create_provider.call(this, hwnd, idobject, idchild, provider)
  end
  def get_proxy_factory_id(this : IUIAutomationProxyFactory*, factoryid : UInt8**) : HRESULT
    @lpVtbl.value.get_proxy_factory_id.call(this, factoryid)
  end
end
struct LibWin32::IUIAutomationProxyFactoryEntry
  def query_interface(this : IUIAutomationProxyFactoryEntry*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationProxyFactoryEntry*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationProxyFactoryEntry*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_proxy_factory(this : IUIAutomationProxyFactoryEntry*, factory : IUIAutomationProxyFactory*) : HRESULT
    @lpVtbl.value.get_proxy_factory.call(this, factory)
  end
  def get_class_name(this : IUIAutomationProxyFactoryEntry*, classname : UInt8**) : HRESULT
    @lpVtbl.value.get_class_name.call(this, classname)
  end
  def get_image_name(this : IUIAutomationProxyFactoryEntry*, imagename : UInt8**) : HRESULT
    @lpVtbl.value.get_image_name.call(this, imagename)
  end
  def get_allow_substring_match(this : IUIAutomationProxyFactoryEntry*, allowsubstringmatch : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_allow_substring_match.call(this, allowsubstringmatch)
  end
  def get_can_check_base_class(this : IUIAutomationProxyFactoryEntry*, cancheckbaseclass : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_can_check_base_class.call(this, cancheckbaseclass)
  end
  def get_needs_advise_events(this : IUIAutomationProxyFactoryEntry*, adviseevents : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_needs_advise_events.call(this, adviseevents)
  end
  def put_class_name(this : IUIAutomationProxyFactoryEntry*, classname : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_class_name.call(this, classname)
  end
  def put_image_name(this : IUIAutomationProxyFactoryEntry*, imagename : LibC::LPWSTR) : HRESULT
    @lpVtbl.value.put_image_name.call(this, imagename)
  end
  def put_allow_substring_match(this : IUIAutomationProxyFactoryEntry*, allowsubstringmatch : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_allow_substring_match.call(this, allowsubstringmatch)
  end
  def put_can_check_base_class(this : IUIAutomationProxyFactoryEntry*, cancheckbaseclass : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_can_check_base_class.call(this, cancheckbaseclass)
  end
  def put_needs_advise_events(this : IUIAutomationProxyFactoryEntry*, adviseevents : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_needs_advise_events.call(this, adviseevents)
  end
  def set_win_events_for_automation_event(this : IUIAutomationProxyFactoryEntry*, eventid : Int32, propertyid : Int32, winevents : SAFEARRAY*) : HRESULT
    @lpVtbl.value.set_win_events_for_automation_event.call(this, eventid, propertyid, winevents)
  end
  def get_win_events_for_automation_event(this : IUIAutomationProxyFactoryEntry*, eventid : Int32, propertyid : Int32, winevents : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_win_events_for_automation_event.call(this, eventid, propertyid, winevents)
  end
end
struct LibWin32::IUIAutomationProxyFactoryMapping
  def query_interface(this : IUIAutomationProxyFactoryMapping*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationProxyFactoryMapping*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationProxyFactoryMapping*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def get_count(this : IUIAutomationProxyFactoryMapping*, count : UInt32*) : HRESULT
    @lpVtbl.value.get_count.call(this, count)
  end
  def get_table(this : IUIAutomationProxyFactoryMapping*, table : SAFEARRAY**) : HRESULT
    @lpVtbl.value.get_table.call(this, table)
  end
  def get_entry(this : IUIAutomationProxyFactoryMapping*, index : UInt32, entry : IUIAutomationProxyFactoryEntry*) : HRESULT
    @lpVtbl.value.get_entry.call(this, index, entry)
  end
  def set_table(this : IUIAutomationProxyFactoryMapping*, factorylist : SAFEARRAY*) : HRESULT
    @lpVtbl.value.set_table.call(this, factorylist)
  end
  def insert_entries(this : IUIAutomationProxyFactoryMapping*, before : UInt32, factorylist : SAFEARRAY*) : HRESULT
    @lpVtbl.value.insert_entries.call(this, before, factorylist)
  end
  def insert_entry(this : IUIAutomationProxyFactoryMapping*, before : UInt32, factory : IUIAutomationProxyFactoryEntry) : HRESULT
    @lpVtbl.value.insert_entry.call(this, before, factory)
  end
  def remove_entry(this : IUIAutomationProxyFactoryMapping*, index : UInt32) : HRESULT
    @lpVtbl.value.remove_entry.call(this, index)
  end
  def clear_table(this : IUIAutomationProxyFactoryMapping*) : HRESULT
    @lpVtbl.value.clear_table.call(this)
  end
  def restore_default_table(this : IUIAutomationProxyFactoryMapping*) : HRESULT
    @lpVtbl.value.restore_default_table.call(this)
  end
end
struct LibWin32::IUIAutomationEventHandlerGroup
  def query_interface(this : IUIAutomationEventHandlerGroup*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomationEventHandlerGroup*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomationEventHandlerGroup*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def add_active_text_position_changed_event_handler(this : IUIAutomationEventHandlerGroup*, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationActiveTextPositionChangedEventHandler) : HRESULT
    @lpVtbl.value.add_active_text_position_changed_event_handler.call(this, scope, cacherequest, handler)
  end
  def add_automation_event_handler(this : IUIAutomationEventHandlerGroup*, eventid : Int32, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.add_automation_event_handler.call(this, eventid, scope, cacherequest, handler)
  end
  def add_changes_event_handler(this : IUIAutomationEventHandlerGroup*, scope : TreeScope, changetypes : Int32*, changescount : Int32, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationChangesEventHandler) : HRESULT
    @lpVtbl.value.add_changes_event_handler.call(this, scope, changetypes, changescount, cacherequest, handler)
  end
  def add_notification_event_handler(this : IUIAutomationEventHandlerGroup*, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationNotificationEventHandler) : HRESULT
    @lpVtbl.value.add_notification_event_handler.call(this, scope, cacherequest, handler)
  end
  def add_property_changed_event_handler(this : IUIAutomationEventHandlerGroup*, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : Int32*, propertycount : Int32) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler.call(this, scope, cacherequest, handler, propertyarray, propertycount)
  end
  def add_structure_changed_event_handler(this : IUIAutomationEventHandlerGroup*, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.add_structure_changed_event_handler.call(this, scope, cacherequest, handler)
  end
  def add_text_edit_text_changed_event_handler(this : IUIAutomationEventHandlerGroup*, scope : TreeScope, texteditchangetype : TextEditChangeType, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.add_text_edit_text_changed_event_handler.call(this, scope, texteditchangetype, cacherequest, handler)
  end
end
struct LibWin32::IUIAutomation
  def query_interface(this : IUIAutomation*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomation*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomation*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def compare_elements(this : IUIAutomation*, el1 : IUIAutomationElement, el2 : IUIAutomationElement, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_elements.call(this, el1, el2, aresame)
  end
  def compare_runtime_ids(this : IUIAutomation*, runtimeid1 : SAFEARRAY*, runtimeid2 : SAFEARRAY*, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_runtime_ids.call(this, runtimeid1, runtimeid2, aresame)
  end
  def get_root_element(this : IUIAutomation*, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element.call(this, root)
  end
  def element_from_handle(this : IUIAutomation*, hwnd : LibC::HANDLE, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle.call(this, hwnd, element)
  end
  def element_from_point(this : IUIAutomation*, pt : POINT, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point.call(this, pt, element)
  end
  def get_focused_element(this : IUIAutomation*, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element.call(this, element)
  end
  def get_root_element_build_cache(this : IUIAutomation*, cacherequest : IUIAutomationCacheRequest, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element_build_cache.call(this, cacherequest, root)
  end
  def element_from_handle_build_cache(this : IUIAutomation*, hwnd : LibC::HANDLE, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle_build_cache.call(this, hwnd, cacherequest, element)
  end
  def element_from_point_build_cache(this : IUIAutomation*, pt : POINT, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point_build_cache.call(this, pt, cacherequest, element)
  end
  def get_focused_element_build_cache(this : IUIAutomation*, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element_build_cache.call(this, cacherequest, element)
  end
  def create_tree_walker(this : IUIAutomation*, pcondition : IUIAutomationCondition, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.create_tree_walker.call(this, pcondition, walker)
  end
  def get_control_view_walker(this : IUIAutomation*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_control_view_walker.call(this, walker)
  end
  def get_content_view_walker(this : IUIAutomation*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_content_view_walker.call(this, walker)
  end
  def get_raw_view_walker(this : IUIAutomation*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_raw_view_walker.call(this, walker)
  end
  def get_raw_view_condition(this : IUIAutomation*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_raw_view_condition.call(this, condition)
  end
  def get_control_view_condition(this : IUIAutomation*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_control_view_condition.call(this, condition)
  end
  def get_content_view_condition(this : IUIAutomation*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_content_view_condition.call(this, condition)
  end
  def create_cache_request(this : IUIAutomation*, cacherequest : IUIAutomationCacheRequest*) : HRESULT
    @lpVtbl.value.create_cache_request.call(this, cacherequest)
  end
  def create_true_condition(this : IUIAutomation*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_true_condition.call(this, newcondition)
  end
  def create_false_condition(this : IUIAutomation*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_false_condition.call(this, newcondition)
  end
  def create_property_condition(this : IUIAutomation*, propertyid : Int32, value : VARIANT, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition.call(this, propertyid, value, newcondition)
  end
  def create_property_condition_ex(this : IUIAutomation*, propertyid : Int32, value : VARIANT, flags : PropertyConditionFlags, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition_ex.call(this, propertyid, value, flags, newcondition)
  end
  def create_and_condition(this : IUIAutomation*, condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition.call(this, condition1, condition2, newcondition)
  end
  def create_and_condition_from_array(this : IUIAutomation*, conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_array.call(this, conditions, newcondition)
  end
  def create_and_condition_from_native_array(this : IUIAutomation*, conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_native_array.call(this, conditions, conditioncount, newcondition)
  end
  def create_or_condition(this : IUIAutomation*, condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition.call(this, condition1, condition2, newcondition)
  end
  def create_or_condition_from_array(this : IUIAutomation*, conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_array.call(this, conditions, newcondition)
  end
  def create_or_condition_from_native_array(this : IUIAutomation*, conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_native_array.call(this, conditions, conditioncount, newcondition)
  end
  def create_not_condition(this : IUIAutomation*, condition : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_not_condition.call(this, condition, newcondition)
  end
  def add_automation_event_handler(this : IUIAutomation*, eventid : Int32, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.add_automation_event_handler.call(this, eventid, element, scope, cacherequest, handler)
  end
  def remove_automation_event_handler(this : IUIAutomation*, eventid : Int32, element : IUIAutomationElement, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.remove_automation_event_handler.call(this, eventid, element, handler)
  end
  def add_property_changed_event_handler_native_array(this : IUIAutomation*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : Int32*, propertycount : Int32) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler_native_array.call(this, element, scope, cacherequest, handler, propertyarray, propertycount)
  end
  def add_property_changed_event_handler(this : IUIAutomation*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : SAFEARRAY*) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler.call(this, element, scope, cacherequest, handler, propertyarray)
  end
  def remove_property_changed_event_handler(this : IUIAutomation*, element : IUIAutomationElement, handler : IUIAutomationPropertyChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_property_changed_event_handler.call(this, element, handler)
  end
  def add_structure_changed_event_handler(this : IUIAutomation*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.add_structure_changed_event_handler.call(this, element, scope, cacherequest, handler)
  end
  def remove_structure_changed_event_handler(this : IUIAutomation*, element : IUIAutomationElement, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_structure_changed_event_handler.call(this, element, handler)
  end
  def add_focus_changed_event_handler(this : IUIAutomation*, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.add_focus_changed_event_handler.call(this, cacherequest, handler)
  end
  def remove_focus_changed_event_handler(this : IUIAutomation*, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_focus_changed_event_handler.call(this, handler)
  end
  def remove_all_event_handlers(this : IUIAutomation*) : HRESULT
    @lpVtbl.value.remove_all_event_handlers.call(this)
  end
  def int_native_array_to_safe_array(this : IUIAutomation*, array : Int32*, arraycount : Int32, safearray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.int_native_array_to_safe_array.call(this, array, arraycount, safearray)
  end
  def int_safe_array_to_native_array(this : IUIAutomation*, intarray : SAFEARRAY*, array : Int32**, arraycount : Int32*) : HRESULT
    @lpVtbl.value.int_safe_array_to_native_array.call(this, intarray, array, arraycount)
  end
  def rect_to_variant(this : IUIAutomation*, rc : RECT, var : VARIANT*) : HRESULT
    @lpVtbl.value.rect_to_variant.call(this, rc, var)
  end
  def variant_to_rect(this : IUIAutomation*, var : VARIANT, rc : RECT*) : HRESULT
    @lpVtbl.value.variant_to_rect.call(this, var, rc)
  end
  def safe_array_to_rect_native_array(this : IUIAutomation*, rects : SAFEARRAY*, rectarray : RECT**, rectarraycount : Int32*) : HRESULT
    @lpVtbl.value.safe_array_to_rect_native_array.call(this, rects, rectarray, rectarraycount)
  end
  def create_proxy_factory_entry(this : IUIAutomation*, factory : IUIAutomationProxyFactory, factoryentry : IUIAutomationProxyFactoryEntry*) : HRESULT
    @lpVtbl.value.create_proxy_factory_entry.call(this, factory, factoryentry)
  end
  def get_proxy_factory_mapping(this : IUIAutomation*, factorymapping : IUIAutomationProxyFactoryMapping*) : HRESULT
    @lpVtbl.value.get_proxy_factory_mapping.call(this, factorymapping)
  end
  def get_property_programmatic_name(this : IUIAutomation*, property : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_property_programmatic_name.call(this, property, name)
  end
  def get_pattern_programmatic_name(this : IUIAutomation*, pattern : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_pattern_programmatic_name.call(this, pattern, name)
  end
  def poll_for_potential_supported_patterns(this : IUIAutomation*, pelement : IUIAutomationElement, patternids : SAFEARRAY**, patternnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_patterns.call(this, pelement, patternids, patternnames)
  end
  def poll_for_potential_supported_properties(this : IUIAutomation*, pelement : IUIAutomationElement, propertyids : SAFEARRAY**, propertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_properties.call(this, pelement, propertyids, propertynames)
  end
  def check_not_supported(this : IUIAutomation*, value : VARIANT, isnotsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_not_supported.call(this, value, isnotsupported)
  end
  def get_reserved_not_supported_value(this : IUIAutomation*, notsupportedvalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_not_supported_value.call(this, notsupportedvalue)
  end
  def get_reserved_mixed_attribute_value(this : IUIAutomation*, mixedattributevalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_mixed_attribute_value.call(this, mixedattributevalue)
  end
  def element_from_i_accessible(this : IUIAutomation*, accessible : IAccessible, childid : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible.call(this, accessible, childid, element)
  end
  def element_from_i_accessible_build_cache(this : IUIAutomation*, accessible : IAccessible, childid : Int32, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible_build_cache.call(this, accessible, childid, cacherequest, element)
  end
end
struct LibWin32::IUIAutomation2
  def query_interface(this : IUIAutomation2*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomation2*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomation2*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def compare_elements(this : IUIAutomation2*, el1 : IUIAutomationElement, el2 : IUIAutomationElement, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_elements.call(this, el1, el2, aresame)
  end
  def compare_runtime_ids(this : IUIAutomation2*, runtimeid1 : SAFEARRAY*, runtimeid2 : SAFEARRAY*, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_runtime_ids.call(this, runtimeid1, runtimeid2, aresame)
  end
  def get_root_element(this : IUIAutomation2*, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element.call(this, root)
  end
  def element_from_handle(this : IUIAutomation2*, hwnd : LibC::HANDLE, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle.call(this, hwnd, element)
  end
  def element_from_point(this : IUIAutomation2*, pt : POINT, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point.call(this, pt, element)
  end
  def get_focused_element(this : IUIAutomation2*, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element.call(this, element)
  end
  def get_root_element_build_cache(this : IUIAutomation2*, cacherequest : IUIAutomationCacheRequest, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element_build_cache.call(this, cacherequest, root)
  end
  def element_from_handle_build_cache(this : IUIAutomation2*, hwnd : LibC::HANDLE, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle_build_cache.call(this, hwnd, cacherequest, element)
  end
  def element_from_point_build_cache(this : IUIAutomation2*, pt : POINT, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point_build_cache.call(this, pt, cacherequest, element)
  end
  def get_focused_element_build_cache(this : IUIAutomation2*, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element_build_cache.call(this, cacherequest, element)
  end
  def create_tree_walker(this : IUIAutomation2*, pcondition : IUIAutomationCondition, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.create_tree_walker.call(this, pcondition, walker)
  end
  def get_control_view_walker(this : IUIAutomation2*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_control_view_walker.call(this, walker)
  end
  def get_content_view_walker(this : IUIAutomation2*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_content_view_walker.call(this, walker)
  end
  def get_raw_view_walker(this : IUIAutomation2*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_raw_view_walker.call(this, walker)
  end
  def get_raw_view_condition(this : IUIAutomation2*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_raw_view_condition.call(this, condition)
  end
  def get_control_view_condition(this : IUIAutomation2*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_control_view_condition.call(this, condition)
  end
  def get_content_view_condition(this : IUIAutomation2*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_content_view_condition.call(this, condition)
  end
  def create_cache_request(this : IUIAutomation2*, cacherequest : IUIAutomationCacheRequest*) : HRESULT
    @lpVtbl.value.create_cache_request.call(this, cacherequest)
  end
  def create_true_condition(this : IUIAutomation2*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_true_condition.call(this, newcondition)
  end
  def create_false_condition(this : IUIAutomation2*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_false_condition.call(this, newcondition)
  end
  def create_property_condition(this : IUIAutomation2*, propertyid : Int32, value : VARIANT, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition.call(this, propertyid, value, newcondition)
  end
  def create_property_condition_ex(this : IUIAutomation2*, propertyid : Int32, value : VARIANT, flags : PropertyConditionFlags, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition_ex.call(this, propertyid, value, flags, newcondition)
  end
  def create_and_condition(this : IUIAutomation2*, condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition.call(this, condition1, condition2, newcondition)
  end
  def create_and_condition_from_array(this : IUIAutomation2*, conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_array.call(this, conditions, newcondition)
  end
  def create_and_condition_from_native_array(this : IUIAutomation2*, conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_native_array.call(this, conditions, conditioncount, newcondition)
  end
  def create_or_condition(this : IUIAutomation2*, condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition.call(this, condition1, condition2, newcondition)
  end
  def create_or_condition_from_array(this : IUIAutomation2*, conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_array.call(this, conditions, newcondition)
  end
  def create_or_condition_from_native_array(this : IUIAutomation2*, conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_native_array.call(this, conditions, conditioncount, newcondition)
  end
  def create_not_condition(this : IUIAutomation2*, condition : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_not_condition.call(this, condition, newcondition)
  end
  def add_automation_event_handler(this : IUIAutomation2*, eventid : Int32, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.add_automation_event_handler.call(this, eventid, element, scope, cacherequest, handler)
  end
  def remove_automation_event_handler(this : IUIAutomation2*, eventid : Int32, element : IUIAutomationElement, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.remove_automation_event_handler.call(this, eventid, element, handler)
  end
  def add_property_changed_event_handler_native_array(this : IUIAutomation2*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : Int32*, propertycount : Int32) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler_native_array.call(this, element, scope, cacherequest, handler, propertyarray, propertycount)
  end
  def add_property_changed_event_handler(this : IUIAutomation2*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : SAFEARRAY*) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler.call(this, element, scope, cacherequest, handler, propertyarray)
  end
  def remove_property_changed_event_handler(this : IUIAutomation2*, element : IUIAutomationElement, handler : IUIAutomationPropertyChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_property_changed_event_handler.call(this, element, handler)
  end
  def add_structure_changed_event_handler(this : IUIAutomation2*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.add_structure_changed_event_handler.call(this, element, scope, cacherequest, handler)
  end
  def remove_structure_changed_event_handler(this : IUIAutomation2*, element : IUIAutomationElement, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_structure_changed_event_handler.call(this, element, handler)
  end
  def add_focus_changed_event_handler(this : IUIAutomation2*, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.add_focus_changed_event_handler.call(this, cacherequest, handler)
  end
  def remove_focus_changed_event_handler(this : IUIAutomation2*, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_focus_changed_event_handler.call(this, handler)
  end
  def remove_all_event_handlers(this : IUIAutomation2*) : HRESULT
    @lpVtbl.value.remove_all_event_handlers.call(this)
  end
  def int_native_array_to_safe_array(this : IUIAutomation2*, array : Int32*, arraycount : Int32, safearray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.int_native_array_to_safe_array.call(this, array, arraycount, safearray)
  end
  def int_safe_array_to_native_array(this : IUIAutomation2*, intarray : SAFEARRAY*, array : Int32**, arraycount : Int32*) : HRESULT
    @lpVtbl.value.int_safe_array_to_native_array.call(this, intarray, array, arraycount)
  end
  def rect_to_variant(this : IUIAutomation2*, rc : RECT, var : VARIANT*) : HRESULT
    @lpVtbl.value.rect_to_variant.call(this, rc, var)
  end
  def variant_to_rect(this : IUIAutomation2*, var : VARIANT, rc : RECT*) : HRESULT
    @lpVtbl.value.variant_to_rect.call(this, var, rc)
  end
  def safe_array_to_rect_native_array(this : IUIAutomation2*, rects : SAFEARRAY*, rectarray : RECT**, rectarraycount : Int32*) : HRESULT
    @lpVtbl.value.safe_array_to_rect_native_array.call(this, rects, rectarray, rectarraycount)
  end
  def create_proxy_factory_entry(this : IUIAutomation2*, factory : IUIAutomationProxyFactory, factoryentry : IUIAutomationProxyFactoryEntry*) : HRESULT
    @lpVtbl.value.create_proxy_factory_entry.call(this, factory, factoryentry)
  end
  def get_proxy_factory_mapping(this : IUIAutomation2*, factorymapping : IUIAutomationProxyFactoryMapping*) : HRESULT
    @lpVtbl.value.get_proxy_factory_mapping.call(this, factorymapping)
  end
  def get_property_programmatic_name(this : IUIAutomation2*, property : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_property_programmatic_name.call(this, property, name)
  end
  def get_pattern_programmatic_name(this : IUIAutomation2*, pattern : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_pattern_programmatic_name.call(this, pattern, name)
  end
  def poll_for_potential_supported_patterns(this : IUIAutomation2*, pelement : IUIAutomationElement, patternids : SAFEARRAY**, patternnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_patterns.call(this, pelement, patternids, patternnames)
  end
  def poll_for_potential_supported_properties(this : IUIAutomation2*, pelement : IUIAutomationElement, propertyids : SAFEARRAY**, propertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_properties.call(this, pelement, propertyids, propertynames)
  end
  def check_not_supported(this : IUIAutomation2*, value : VARIANT, isnotsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_not_supported.call(this, value, isnotsupported)
  end
  def get_reserved_not_supported_value(this : IUIAutomation2*, notsupportedvalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_not_supported_value.call(this, notsupportedvalue)
  end
  def get_reserved_mixed_attribute_value(this : IUIAutomation2*, mixedattributevalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_mixed_attribute_value.call(this, mixedattributevalue)
  end
  def element_from_i_accessible(this : IUIAutomation2*, accessible : IAccessible, childid : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible.call(this, accessible, childid, element)
  end
  def element_from_i_accessible_build_cache(this : IUIAutomation2*, accessible : IAccessible, childid : Int32, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible_build_cache.call(this, accessible, childid, cacherequest, element)
  end
  def get_auto_set_focus(this : IUIAutomation2*, autosetfocus : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_auto_set_focus.call(this, autosetfocus)
  end
  def put_auto_set_focus(this : IUIAutomation2*, autosetfocus : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_auto_set_focus.call(this, autosetfocus)
  end
  def get_connection_timeout(this : IUIAutomation2*, timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_timeout.call(this, timeout)
  end
  def put_connection_timeout(this : IUIAutomation2*, timeout : UInt32) : HRESULT
    @lpVtbl.value.put_connection_timeout.call(this, timeout)
  end
  def get_transaction_timeout(this : IUIAutomation2*, timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_transaction_timeout.call(this, timeout)
  end
  def put_transaction_timeout(this : IUIAutomation2*, timeout : UInt32) : HRESULT
    @lpVtbl.value.put_transaction_timeout.call(this, timeout)
  end
end
struct LibWin32::IUIAutomation3
  def query_interface(this : IUIAutomation3*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomation3*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomation3*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def compare_elements(this : IUIAutomation3*, el1 : IUIAutomationElement, el2 : IUIAutomationElement, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_elements.call(this, el1, el2, aresame)
  end
  def compare_runtime_ids(this : IUIAutomation3*, runtimeid1 : SAFEARRAY*, runtimeid2 : SAFEARRAY*, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_runtime_ids.call(this, runtimeid1, runtimeid2, aresame)
  end
  def get_root_element(this : IUIAutomation3*, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element.call(this, root)
  end
  def element_from_handle(this : IUIAutomation3*, hwnd : LibC::HANDLE, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle.call(this, hwnd, element)
  end
  def element_from_point(this : IUIAutomation3*, pt : POINT, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point.call(this, pt, element)
  end
  def get_focused_element(this : IUIAutomation3*, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element.call(this, element)
  end
  def get_root_element_build_cache(this : IUIAutomation3*, cacherequest : IUIAutomationCacheRequest, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element_build_cache.call(this, cacherequest, root)
  end
  def element_from_handle_build_cache(this : IUIAutomation3*, hwnd : LibC::HANDLE, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle_build_cache.call(this, hwnd, cacherequest, element)
  end
  def element_from_point_build_cache(this : IUIAutomation3*, pt : POINT, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point_build_cache.call(this, pt, cacherequest, element)
  end
  def get_focused_element_build_cache(this : IUIAutomation3*, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element_build_cache.call(this, cacherequest, element)
  end
  def create_tree_walker(this : IUIAutomation3*, pcondition : IUIAutomationCondition, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.create_tree_walker.call(this, pcondition, walker)
  end
  def get_control_view_walker(this : IUIAutomation3*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_control_view_walker.call(this, walker)
  end
  def get_content_view_walker(this : IUIAutomation3*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_content_view_walker.call(this, walker)
  end
  def get_raw_view_walker(this : IUIAutomation3*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_raw_view_walker.call(this, walker)
  end
  def get_raw_view_condition(this : IUIAutomation3*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_raw_view_condition.call(this, condition)
  end
  def get_control_view_condition(this : IUIAutomation3*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_control_view_condition.call(this, condition)
  end
  def get_content_view_condition(this : IUIAutomation3*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_content_view_condition.call(this, condition)
  end
  def create_cache_request(this : IUIAutomation3*, cacherequest : IUIAutomationCacheRequest*) : HRESULT
    @lpVtbl.value.create_cache_request.call(this, cacherequest)
  end
  def create_true_condition(this : IUIAutomation3*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_true_condition.call(this, newcondition)
  end
  def create_false_condition(this : IUIAutomation3*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_false_condition.call(this, newcondition)
  end
  def create_property_condition(this : IUIAutomation3*, propertyid : Int32, value : VARIANT, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition.call(this, propertyid, value, newcondition)
  end
  def create_property_condition_ex(this : IUIAutomation3*, propertyid : Int32, value : VARIANT, flags : PropertyConditionFlags, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition_ex.call(this, propertyid, value, flags, newcondition)
  end
  def create_and_condition(this : IUIAutomation3*, condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition.call(this, condition1, condition2, newcondition)
  end
  def create_and_condition_from_array(this : IUIAutomation3*, conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_array.call(this, conditions, newcondition)
  end
  def create_and_condition_from_native_array(this : IUIAutomation3*, conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_native_array.call(this, conditions, conditioncount, newcondition)
  end
  def create_or_condition(this : IUIAutomation3*, condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition.call(this, condition1, condition2, newcondition)
  end
  def create_or_condition_from_array(this : IUIAutomation3*, conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_array.call(this, conditions, newcondition)
  end
  def create_or_condition_from_native_array(this : IUIAutomation3*, conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_native_array.call(this, conditions, conditioncount, newcondition)
  end
  def create_not_condition(this : IUIAutomation3*, condition : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_not_condition.call(this, condition, newcondition)
  end
  def add_automation_event_handler(this : IUIAutomation3*, eventid : Int32, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.add_automation_event_handler.call(this, eventid, element, scope, cacherequest, handler)
  end
  def remove_automation_event_handler(this : IUIAutomation3*, eventid : Int32, element : IUIAutomationElement, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.remove_automation_event_handler.call(this, eventid, element, handler)
  end
  def add_property_changed_event_handler_native_array(this : IUIAutomation3*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : Int32*, propertycount : Int32) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler_native_array.call(this, element, scope, cacherequest, handler, propertyarray, propertycount)
  end
  def add_property_changed_event_handler(this : IUIAutomation3*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : SAFEARRAY*) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler.call(this, element, scope, cacherequest, handler, propertyarray)
  end
  def remove_property_changed_event_handler(this : IUIAutomation3*, element : IUIAutomationElement, handler : IUIAutomationPropertyChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_property_changed_event_handler.call(this, element, handler)
  end
  def add_structure_changed_event_handler(this : IUIAutomation3*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.add_structure_changed_event_handler.call(this, element, scope, cacherequest, handler)
  end
  def remove_structure_changed_event_handler(this : IUIAutomation3*, element : IUIAutomationElement, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_structure_changed_event_handler.call(this, element, handler)
  end
  def add_focus_changed_event_handler(this : IUIAutomation3*, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.add_focus_changed_event_handler.call(this, cacherequest, handler)
  end
  def remove_focus_changed_event_handler(this : IUIAutomation3*, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_focus_changed_event_handler.call(this, handler)
  end
  def remove_all_event_handlers(this : IUIAutomation3*) : HRESULT
    @lpVtbl.value.remove_all_event_handlers.call(this)
  end
  def int_native_array_to_safe_array(this : IUIAutomation3*, array : Int32*, arraycount : Int32, safearray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.int_native_array_to_safe_array.call(this, array, arraycount, safearray)
  end
  def int_safe_array_to_native_array(this : IUIAutomation3*, intarray : SAFEARRAY*, array : Int32**, arraycount : Int32*) : HRESULT
    @lpVtbl.value.int_safe_array_to_native_array.call(this, intarray, array, arraycount)
  end
  def rect_to_variant(this : IUIAutomation3*, rc : RECT, var : VARIANT*) : HRESULT
    @lpVtbl.value.rect_to_variant.call(this, rc, var)
  end
  def variant_to_rect(this : IUIAutomation3*, var : VARIANT, rc : RECT*) : HRESULT
    @lpVtbl.value.variant_to_rect.call(this, var, rc)
  end
  def safe_array_to_rect_native_array(this : IUIAutomation3*, rects : SAFEARRAY*, rectarray : RECT**, rectarraycount : Int32*) : HRESULT
    @lpVtbl.value.safe_array_to_rect_native_array.call(this, rects, rectarray, rectarraycount)
  end
  def create_proxy_factory_entry(this : IUIAutomation3*, factory : IUIAutomationProxyFactory, factoryentry : IUIAutomationProxyFactoryEntry*) : HRESULT
    @lpVtbl.value.create_proxy_factory_entry.call(this, factory, factoryentry)
  end
  def get_proxy_factory_mapping(this : IUIAutomation3*, factorymapping : IUIAutomationProxyFactoryMapping*) : HRESULT
    @lpVtbl.value.get_proxy_factory_mapping.call(this, factorymapping)
  end
  def get_property_programmatic_name(this : IUIAutomation3*, property : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_property_programmatic_name.call(this, property, name)
  end
  def get_pattern_programmatic_name(this : IUIAutomation3*, pattern : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_pattern_programmatic_name.call(this, pattern, name)
  end
  def poll_for_potential_supported_patterns(this : IUIAutomation3*, pelement : IUIAutomationElement, patternids : SAFEARRAY**, patternnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_patterns.call(this, pelement, patternids, patternnames)
  end
  def poll_for_potential_supported_properties(this : IUIAutomation3*, pelement : IUIAutomationElement, propertyids : SAFEARRAY**, propertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_properties.call(this, pelement, propertyids, propertynames)
  end
  def check_not_supported(this : IUIAutomation3*, value : VARIANT, isnotsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_not_supported.call(this, value, isnotsupported)
  end
  def get_reserved_not_supported_value(this : IUIAutomation3*, notsupportedvalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_not_supported_value.call(this, notsupportedvalue)
  end
  def get_reserved_mixed_attribute_value(this : IUIAutomation3*, mixedattributevalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_mixed_attribute_value.call(this, mixedattributevalue)
  end
  def element_from_i_accessible(this : IUIAutomation3*, accessible : IAccessible, childid : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible.call(this, accessible, childid, element)
  end
  def element_from_i_accessible_build_cache(this : IUIAutomation3*, accessible : IAccessible, childid : Int32, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible_build_cache.call(this, accessible, childid, cacherequest, element)
  end
  def get_auto_set_focus(this : IUIAutomation3*, autosetfocus : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_auto_set_focus.call(this, autosetfocus)
  end
  def put_auto_set_focus(this : IUIAutomation3*, autosetfocus : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_auto_set_focus.call(this, autosetfocus)
  end
  def get_connection_timeout(this : IUIAutomation3*, timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_timeout.call(this, timeout)
  end
  def put_connection_timeout(this : IUIAutomation3*, timeout : UInt32) : HRESULT
    @lpVtbl.value.put_connection_timeout.call(this, timeout)
  end
  def get_transaction_timeout(this : IUIAutomation3*, timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_transaction_timeout.call(this, timeout)
  end
  def put_transaction_timeout(this : IUIAutomation3*, timeout : UInt32) : HRESULT
    @lpVtbl.value.put_transaction_timeout.call(this, timeout)
  end
  def add_text_edit_text_changed_event_handler(this : IUIAutomation3*, element : IUIAutomationElement, scope : TreeScope, texteditchangetype : TextEditChangeType, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.add_text_edit_text_changed_event_handler.call(this, element, scope, texteditchangetype, cacherequest, handler)
  end
  def remove_text_edit_text_changed_event_handler(this : IUIAutomation3*, element : IUIAutomationElement, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_text_edit_text_changed_event_handler.call(this, element, handler)
  end
end
struct LibWin32::IUIAutomation4
  def query_interface(this : IUIAutomation4*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomation4*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomation4*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def compare_elements(this : IUIAutomation4*, el1 : IUIAutomationElement, el2 : IUIAutomationElement, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_elements.call(this, el1, el2, aresame)
  end
  def compare_runtime_ids(this : IUIAutomation4*, runtimeid1 : SAFEARRAY*, runtimeid2 : SAFEARRAY*, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_runtime_ids.call(this, runtimeid1, runtimeid2, aresame)
  end
  def get_root_element(this : IUIAutomation4*, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element.call(this, root)
  end
  def element_from_handle(this : IUIAutomation4*, hwnd : LibC::HANDLE, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle.call(this, hwnd, element)
  end
  def element_from_point(this : IUIAutomation4*, pt : POINT, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point.call(this, pt, element)
  end
  def get_focused_element(this : IUIAutomation4*, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element.call(this, element)
  end
  def get_root_element_build_cache(this : IUIAutomation4*, cacherequest : IUIAutomationCacheRequest, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element_build_cache.call(this, cacherequest, root)
  end
  def element_from_handle_build_cache(this : IUIAutomation4*, hwnd : LibC::HANDLE, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle_build_cache.call(this, hwnd, cacherequest, element)
  end
  def element_from_point_build_cache(this : IUIAutomation4*, pt : POINT, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point_build_cache.call(this, pt, cacherequest, element)
  end
  def get_focused_element_build_cache(this : IUIAutomation4*, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element_build_cache.call(this, cacherequest, element)
  end
  def create_tree_walker(this : IUIAutomation4*, pcondition : IUIAutomationCondition, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.create_tree_walker.call(this, pcondition, walker)
  end
  def get_control_view_walker(this : IUIAutomation4*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_control_view_walker.call(this, walker)
  end
  def get_content_view_walker(this : IUIAutomation4*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_content_view_walker.call(this, walker)
  end
  def get_raw_view_walker(this : IUIAutomation4*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_raw_view_walker.call(this, walker)
  end
  def get_raw_view_condition(this : IUIAutomation4*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_raw_view_condition.call(this, condition)
  end
  def get_control_view_condition(this : IUIAutomation4*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_control_view_condition.call(this, condition)
  end
  def get_content_view_condition(this : IUIAutomation4*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_content_view_condition.call(this, condition)
  end
  def create_cache_request(this : IUIAutomation4*, cacherequest : IUIAutomationCacheRequest*) : HRESULT
    @lpVtbl.value.create_cache_request.call(this, cacherequest)
  end
  def create_true_condition(this : IUIAutomation4*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_true_condition.call(this, newcondition)
  end
  def create_false_condition(this : IUIAutomation4*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_false_condition.call(this, newcondition)
  end
  def create_property_condition(this : IUIAutomation4*, propertyid : Int32, value : VARIANT, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition.call(this, propertyid, value, newcondition)
  end
  def create_property_condition_ex(this : IUIAutomation4*, propertyid : Int32, value : VARIANT, flags : PropertyConditionFlags, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition_ex.call(this, propertyid, value, flags, newcondition)
  end
  def create_and_condition(this : IUIAutomation4*, condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition.call(this, condition1, condition2, newcondition)
  end
  def create_and_condition_from_array(this : IUIAutomation4*, conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_array.call(this, conditions, newcondition)
  end
  def create_and_condition_from_native_array(this : IUIAutomation4*, conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_native_array.call(this, conditions, conditioncount, newcondition)
  end
  def create_or_condition(this : IUIAutomation4*, condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition.call(this, condition1, condition2, newcondition)
  end
  def create_or_condition_from_array(this : IUIAutomation4*, conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_array.call(this, conditions, newcondition)
  end
  def create_or_condition_from_native_array(this : IUIAutomation4*, conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_native_array.call(this, conditions, conditioncount, newcondition)
  end
  def create_not_condition(this : IUIAutomation4*, condition : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_not_condition.call(this, condition, newcondition)
  end
  def add_automation_event_handler(this : IUIAutomation4*, eventid : Int32, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.add_automation_event_handler.call(this, eventid, element, scope, cacherequest, handler)
  end
  def remove_automation_event_handler(this : IUIAutomation4*, eventid : Int32, element : IUIAutomationElement, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.remove_automation_event_handler.call(this, eventid, element, handler)
  end
  def add_property_changed_event_handler_native_array(this : IUIAutomation4*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : Int32*, propertycount : Int32) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler_native_array.call(this, element, scope, cacherequest, handler, propertyarray, propertycount)
  end
  def add_property_changed_event_handler(this : IUIAutomation4*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : SAFEARRAY*) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler.call(this, element, scope, cacherequest, handler, propertyarray)
  end
  def remove_property_changed_event_handler(this : IUIAutomation4*, element : IUIAutomationElement, handler : IUIAutomationPropertyChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_property_changed_event_handler.call(this, element, handler)
  end
  def add_structure_changed_event_handler(this : IUIAutomation4*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.add_structure_changed_event_handler.call(this, element, scope, cacherequest, handler)
  end
  def remove_structure_changed_event_handler(this : IUIAutomation4*, element : IUIAutomationElement, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_structure_changed_event_handler.call(this, element, handler)
  end
  def add_focus_changed_event_handler(this : IUIAutomation4*, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.add_focus_changed_event_handler.call(this, cacherequest, handler)
  end
  def remove_focus_changed_event_handler(this : IUIAutomation4*, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_focus_changed_event_handler.call(this, handler)
  end
  def remove_all_event_handlers(this : IUIAutomation4*) : HRESULT
    @lpVtbl.value.remove_all_event_handlers.call(this)
  end
  def int_native_array_to_safe_array(this : IUIAutomation4*, array : Int32*, arraycount : Int32, safearray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.int_native_array_to_safe_array.call(this, array, arraycount, safearray)
  end
  def int_safe_array_to_native_array(this : IUIAutomation4*, intarray : SAFEARRAY*, array : Int32**, arraycount : Int32*) : HRESULT
    @lpVtbl.value.int_safe_array_to_native_array.call(this, intarray, array, arraycount)
  end
  def rect_to_variant(this : IUIAutomation4*, rc : RECT, var : VARIANT*) : HRESULT
    @lpVtbl.value.rect_to_variant.call(this, rc, var)
  end
  def variant_to_rect(this : IUIAutomation4*, var : VARIANT, rc : RECT*) : HRESULT
    @lpVtbl.value.variant_to_rect.call(this, var, rc)
  end
  def safe_array_to_rect_native_array(this : IUIAutomation4*, rects : SAFEARRAY*, rectarray : RECT**, rectarraycount : Int32*) : HRESULT
    @lpVtbl.value.safe_array_to_rect_native_array.call(this, rects, rectarray, rectarraycount)
  end
  def create_proxy_factory_entry(this : IUIAutomation4*, factory : IUIAutomationProxyFactory, factoryentry : IUIAutomationProxyFactoryEntry*) : HRESULT
    @lpVtbl.value.create_proxy_factory_entry.call(this, factory, factoryentry)
  end
  def get_proxy_factory_mapping(this : IUIAutomation4*, factorymapping : IUIAutomationProxyFactoryMapping*) : HRESULT
    @lpVtbl.value.get_proxy_factory_mapping.call(this, factorymapping)
  end
  def get_property_programmatic_name(this : IUIAutomation4*, property : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_property_programmatic_name.call(this, property, name)
  end
  def get_pattern_programmatic_name(this : IUIAutomation4*, pattern : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_pattern_programmatic_name.call(this, pattern, name)
  end
  def poll_for_potential_supported_patterns(this : IUIAutomation4*, pelement : IUIAutomationElement, patternids : SAFEARRAY**, patternnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_patterns.call(this, pelement, patternids, patternnames)
  end
  def poll_for_potential_supported_properties(this : IUIAutomation4*, pelement : IUIAutomationElement, propertyids : SAFEARRAY**, propertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_properties.call(this, pelement, propertyids, propertynames)
  end
  def check_not_supported(this : IUIAutomation4*, value : VARIANT, isnotsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_not_supported.call(this, value, isnotsupported)
  end
  def get_reserved_not_supported_value(this : IUIAutomation4*, notsupportedvalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_not_supported_value.call(this, notsupportedvalue)
  end
  def get_reserved_mixed_attribute_value(this : IUIAutomation4*, mixedattributevalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_mixed_attribute_value.call(this, mixedattributevalue)
  end
  def element_from_i_accessible(this : IUIAutomation4*, accessible : IAccessible, childid : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible.call(this, accessible, childid, element)
  end
  def element_from_i_accessible_build_cache(this : IUIAutomation4*, accessible : IAccessible, childid : Int32, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible_build_cache.call(this, accessible, childid, cacherequest, element)
  end
  def get_auto_set_focus(this : IUIAutomation4*, autosetfocus : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_auto_set_focus.call(this, autosetfocus)
  end
  def put_auto_set_focus(this : IUIAutomation4*, autosetfocus : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_auto_set_focus.call(this, autosetfocus)
  end
  def get_connection_timeout(this : IUIAutomation4*, timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_timeout.call(this, timeout)
  end
  def put_connection_timeout(this : IUIAutomation4*, timeout : UInt32) : HRESULT
    @lpVtbl.value.put_connection_timeout.call(this, timeout)
  end
  def get_transaction_timeout(this : IUIAutomation4*, timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_transaction_timeout.call(this, timeout)
  end
  def put_transaction_timeout(this : IUIAutomation4*, timeout : UInt32) : HRESULT
    @lpVtbl.value.put_transaction_timeout.call(this, timeout)
  end
  def add_text_edit_text_changed_event_handler(this : IUIAutomation4*, element : IUIAutomationElement, scope : TreeScope, texteditchangetype : TextEditChangeType, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.add_text_edit_text_changed_event_handler.call(this, element, scope, texteditchangetype, cacherequest, handler)
  end
  def remove_text_edit_text_changed_event_handler(this : IUIAutomation4*, element : IUIAutomationElement, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_text_edit_text_changed_event_handler.call(this, element, handler)
  end
  def add_changes_event_handler(this : IUIAutomation4*, element : IUIAutomationElement, scope : TreeScope, changetypes : Int32*, changescount : Int32, pcacherequest : IUIAutomationCacheRequest, handler : IUIAutomationChangesEventHandler) : HRESULT
    @lpVtbl.value.add_changes_event_handler.call(this, element, scope, changetypes, changescount, pcacherequest, handler)
  end
  def remove_changes_event_handler(this : IUIAutomation4*, element : IUIAutomationElement, handler : IUIAutomationChangesEventHandler) : HRESULT
    @lpVtbl.value.remove_changes_event_handler.call(this, element, handler)
  end
end
struct LibWin32::IUIAutomation5
  def query_interface(this : IUIAutomation5*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomation5*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomation5*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def compare_elements(this : IUIAutomation5*, el1 : IUIAutomationElement, el2 : IUIAutomationElement, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_elements.call(this, el1, el2, aresame)
  end
  def compare_runtime_ids(this : IUIAutomation5*, runtimeid1 : SAFEARRAY*, runtimeid2 : SAFEARRAY*, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_runtime_ids.call(this, runtimeid1, runtimeid2, aresame)
  end
  def get_root_element(this : IUIAutomation5*, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element.call(this, root)
  end
  def element_from_handle(this : IUIAutomation5*, hwnd : LibC::HANDLE, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle.call(this, hwnd, element)
  end
  def element_from_point(this : IUIAutomation5*, pt : POINT, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point.call(this, pt, element)
  end
  def get_focused_element(this : IUIAutomation5*, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element.call(this, element)
  end
  def get_root_element_build_cache(this : IUIAutomation5*, cacherequest : IUIAutomationCacheRequest, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element_build_cache.call(this, cacherequest, root)
  end
  def element_from_handle_build_cache(this : IUIAutomation5*, hwnd : LibC::HANDLE, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle_build_cache.call(this, hwnd, cacherequest, element)
  end
  def element_from_point_build_cache(this : IUIAutomation5*, pt : POINT, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point_build_cache.call(this, pt, cacherequest, element)
  end
  def get_focused_element_build_cache(this : IUIAutomation5*, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element_build_cache.call(this, cacherequest, element)
  end
  def create_tree_walker(this : IUIAutomation5*, pcondition : IUIAutomationCondition, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.create_tree_walker.call(this, pcondition, walker)
  end
  def get_control_view_walker(this : IUIAutomation5*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_control_view_walker.call(this, walker)
  end
  def get_content_view_walker(this : IUIAutomation5*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_content_view_walker.call(this, walker)
  end
  def get_raw_view_walker(this : IUIAutomation5*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_raw_view_walker.call(this, walker)
  end
  def get_raw_view_condition(this : IUIAutomation5*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_raw_view_condition.call(this, condition)
  end
  def get_control_view_condition(this : IUIAutomation5*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_control_view_condition.call(this, condition)
  end
  def get_content_view_condition(this : IUIAutomation5*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_content_view_condition.call(this, condition)
  end
  def create_cache_request(this : IUIAutomation5*, cacherequest : IUIAutomationCacheRequest*) : HRESULT
    @lpVtbl.value.create_cache_request.call(this, cacherequest)
  end
  def create_true_condition(this : IUIAutomation5*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_true_condition.call(this, newcondition)
  end
  def create_false_condition(this : IUIAutomation5*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_false_condition.call(this, newcondition)
  end
  def create_property_condition(this : IUIAutomation5*, propertyid : Int32, value : VARIANT, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition.call(this, propertyid, value, newcondition)
  end
  def create_property_condition_ex(this : IUIAutomation5*, propertyid : Int32, value : VARIANT, flags : PropertyConditionFlags, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition_ex.call(this, propertyid, value, flags, newcondition)
  end
  def create_and_condition(this : IUIAutomation5*, condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition.call(this, condition1, condition2, newcondition)
  end
  def create_and_condition_from_array(this : IUIAutomation5*, conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_array.call(this, conditions, newcondition)
  end
  def create_and_condition_from_native_array(this : IUIAutomation5*, conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_native_array.call(this, conditions, conditioncount, newcondition)
  end
  def create_or_condition(this : IUIAutomation5*, condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition.call(this, condition1, condition2, newcondition)
  end
  def create_or_condition_from_array(this : IUIAutomation5*, conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_array.call(this, conditions, newcondition)
  end
  def create_or_condition_from_native_array(this : IUIAutomation5*, conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_native_array.call(this, conditions, conditioncount, newcondition)
  end
  def create_not_condition(this : IUIAutomation5*, condition : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_not_condition.call(this, condition, newcondition)
  end
  def add_automation_event_handler(this : IUIAutomation5*, eventid : Int32, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.add_automation_event_handler.call(this, eventid, element, scope, cacherequest, handler)
  end
  def remove_automation_event_handler(this : IUIAutomation5*, eventid : Int32, element : IUIAutomationElement, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.remove_automation_event_handler.call(this, eventid, element, handler)
  end
  def add_property_changed_event_handler_native_array(this : IUIAutomation5*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : Int32*, propertycount : Int32) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler_native_array.call(this, element, scope, cacherequest, handler, propertyarray, propertycount)
  end
  def add_property_changed_event_handler(this : IUIAutomation5*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : SAFEARRAY*) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler.call(this, element, scope, cacherequest, handler, propertyarray)
  end
  def remove_property_changed_event_handler(this : IUIAutomation5*, element : IUIAutomationElement, handler : IUIAutomationPropertyChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_property_changed_event_handler.call(this, element, handler)
  end
  def add_structure_changed_event_handler(this : IUIAutomation5*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.add_structure_changed_event_handler.call(this, element, scope, cacherequest, handler)
  end
  def remove_structure_changed_event_handler(this : IUIAutomation5*, element : IUIAutomationElement, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_structure_changed_event_handler.call(this, element, handler)
  end
  def add_focus_changed_event_handler(this : IUIAutomation5*, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.add_focus_changed_event_handler.call(this, cacherequest, handler)
  end
  def remove_focus_changed_event_handler(this : IUIAutomation5*, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_focus_changed_event_handler.call(this, handler)
  end
  def remove_all_event_handlers(this : IUIAutomation5*) : HRESULT
    @lpVtbl.value.remove_all_event_handlers.call(this)
  end
  def int_native_array_to_safe_array(this : IUIAutomation5*, array : Int32*, arraycount : Int32, safearray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.int_native_array_to_safe_array.call(this, array, arraycount, safearray)
  end
  def int_safe_array_to_native_array(this : IUIAutomation5*, intarray : SAFEARRAY*, array : Int32**, arraycount : Int32*) : HRESULT
    @lpVtbl.value.int_safe_array_to_native_array.call(this, intarray, array, arraycount)
  end
  def rect_to_variant(this : IUIAutomation5*, rc : RECT, var : VARIANT*) : HRESULT
    @lpVtbl.value.rect_to_variant.call(this, rc, var)
  end
  def variant_to_rect(this : IUIAutomation5*, var : VARIANT, rc : RECT*) : HRESULT
    @lpVtbl.value.variant_to_rect.call(this, var, rc)
  end
  def safe_array_to_rect_native_array(this : IUIAutomation5*, rects : SAFEARRAY*, rectarray : RECT**, rectarraycount : Int32*) : HRESULT
    @lpVtbl.value.safe_array_to_rect_native_array.call(this, rects, rectarray, rectarraycount)
  end
  def create_proxy_factory_entry(this : IUIAutomation5*, factory : IUIAutomationProxyFactory, factoryentry : IUIAutomationProxyFactoryEntry*) : HRESULT
    @lpVtbl.value.create_proxy_factory_entry.call(this, factory, factoryentry)
  end
  def get_proxy_factory_mapping(this : IUIAutomation5*, factorymapping : IUIAutomationProxyFactoryMapping*) : HRESULT
    @lpVtbl.value.get_proxy_factory_mapping.call(this, factorymapping)
  end
  def get_property_programmatic_name(this : IUIAutomation5*, property : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_property_programmatic_name.call(this, property, name)
  end
  def get_pattern_programmatic_name(this : IUIAutomation5*, pattern : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_pattern_programmatic_name.call(this, pattern, name)
  end
  def poll_for_potential_supported_patterns(this : IUIAutomation5*, pelement : IUIAutomationElement, patternids : SAFEARRAY**, patternnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_patterns.call(this, pelement, patternids, patternnames)
  end
  def poll_for_potential_supported_properties(this : IUIAutomation5*, pelement : IUIAutomationElement, propertyids : SAFEARRAY**, propertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_properties.call(this, pelement, propertyids, propertynames)
  end
  def check_not_supported(this : IUIAutomation5*, value : VARIANT, isnotsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_not_supported.call(this, value, isnotsupported)
  end
  def get_reserved_not_supported_value(this : IUIAutomation5*, notsupportedvalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_not_supported_value.call(this, notsupportedvalue)
  end
  def get_reserved_mixed_attribute_value(this : IUIAutomation5*, mixedattributevalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_mixed_attribute_value.call(this, mixedattributevalue)
  end
  def element_from_i_accessible(this : IUIAutomation5*, accessible : IAccessible, childid : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible.call(this, accessible, childid, element)
  end
  def element_from_i_accessible_build_cache(this : IUIAutomation5*, accessible : IAccessible, childid : Int32, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible_build_cache.call(this, accessible, childid, cacherequest, element)
  end
  def get_auto_set_focus(this : IUIAutomation5*, autosetfocus : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_auto_set_focus.call(this, autosetfocus)
  end
  def put_auto_set_focus(this : IUIAutomation5*, autosetfocus : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_auto_set_focus.call(this, autosetfocus)
  end
  def get_connection_timeout(this : IUIAutomation5*, timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_timeout.call(this, timeout)
  end
  def put_connection_timeout(this : IUIAutomation5*, timeout : UInt32) : HRESULT
    @lpVtbl.value.put_connection_timeout.call(this, timeout)
  end
  def get_transaction_timeout(this : IUIAutomation5*, timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_transaction_timeout.call(this, timeout)
  end
  def put_transaction_timeout(this : IUIAutomation5*, timeout : UInt32) : HRESULT
    @lpVtbl.value.put_transaction_timeout.call(this, timeout)
  end
  def add_text_edit_text_changed_event_handler(this : IUIAutomation5*, element : IUIAutomationElement, scope : TreeScope, texteditchangetype : TextEditChangeType, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.add_text_edit_text_changed_event_handler.call(this, element, scope, texteditchangetype, cacherequest, handler)
  end
  def remove_text_edit_text_changed_event_handler(this : IUIAutomation5*, element : IUIAutomationElement, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_text_edit_text_changed_event_handler.call(this, element, handler)
  end
  def add_changes_event_handler(this : IUIAutomation5*, element : IUIAutomationElement, scope : TreeScope, changetypes : Int32*, changescount : Int32, pcacherequest : IUIAutomationCacheRequest, handler : IUIAutomationChangesEventHandler) : HRESULT
    @lpVtbl.value.add_changes_event_handler.call(this, element, scope, changetypes, changescount, pcacherequest, handler)
  end
  def remove_changes_event_handler(this : IUIAutomation5*, element : IUIAutomationElement, handler : IUIAutomationChangesEventHandler) : HRESULT
    @lpVtbl.value.remove_changes_event_handler.call(this, element, handler)
  end
  def add_notification_event_handler(this : IUIAutomation5*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationNotificationEventHandler) : HRESULT
    @lpVtbl.value.add_notification_event_handler.call(this, element, scope, cacherequest, handler)
  end
  def remove_notification_event_handler(this : IUIAutomation5*, element : IUIAutomationElement, handler : IUIAutomationNotificationEventHandler) : HRESULT
    @lpVtbl.value.remove_notification_event_handler.call(this, element, handler)
  end
end
struct LibWin32::IUIAutomation6
  def query_interface(this : IUIAutomation6*, riid : Guid*, ppvobject : Void**) : HRESULT
    @lpVtbl.value.query_interface.call(this, riid, ppvobject)
  end
  def add_ref(this : IUIAutomation6*) : UInt32
    @lpVtbl.value.add_ref.call(this)
  end
  def release(this : IUIAutomation6*) : UInt32
    @lpVtbl.value.release.call(this)
  end
  def compare_elements(this : IUIAutomation6*, el1 : IUIAutomationElement, el2 : IUIAutomationElement, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_elements.call(this, el1, el2, aresame)
  end
  def compare_runtime_ids(this : IUIAutomation6*, runtimeid1 : SAFEARRAY*, runtimeid2 : SAFEARRAY*, aresame : LibC::BOOL*) : HRESULT
    @lpVtbl.value.compare_runtime_ids.call(this, runtimeid1, runtimeid2, aresame)
  end
  def get_root_element(this : IUIAutomation6*, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element.call(this, root)
  end
  def element_from_handle(this : IUIAutomation6*, hwnd : LibC::HANDLE, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle.call(this, hwnd, element)
  end
  def element_from_point(this : IUIAutomation6*, pt : POINT, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point.call(this, pt, element)
  end
  def get_focused_element(this : IUIAutomation6*, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element.call(this, element)
  end
  def get_root_element_build_cache(this : IUIAutomation6*, cacherequest : IUIAutomationCacheRequest, root : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_root_element_build_cache.call(this, cacherequest, root)
  end
  def element_from_handle_build_cache(this : IUIAutomation6*, hwnd : LibC::HANDLE, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_handle_build_cache.call(this, hwnd, cacherequest, element)
  end
  def element_from_point_build_cache(this : IUIAutomation6*, pt : POINT, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_point_build_cache.call(this, pt, cacherequest, element)
  end
  def get_focused_element_build_cache(this : IUIAutomation6*, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.get_focused_element_build_cache.call(this, cacherequest, element)
  end
  def create_tree_walker(this : IUIAutomation6*, pcondition : IUIAutomationCondition, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.create_tree_walker.call(this, pcondition, walker)
  end
  def get_control_view_walker(this : IUIAutomation6*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_control_view_walker.call(this, walker)
  end
  def get_content_view_walker(this : IUIAutomation6*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_content_view_walker.call(this, walker)
  end
  def get_raw_view_walker(this : IUIAutomation6*, walker : IUIAutomationTreeWalker*) : HRESULT
    @lpVtbl.value.get_raw_view_walker.call(this, walker)
  end
  def get_raw_view_condition(this : IUIAutomation6*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_raw_view_condition.call(this, condition)
  end
  def get_control_view_condition(this : IUIAutomation6*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_control_view_condition.call(this, condition)
  end
  def get_content_view_condition(this : IUIAutomation6*, condition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.get_content_view_condition.call(this, condition)
  end
  def create_cache_request(this : IUIAutomation6*, cacherequest : IUIAutomationCacheRequest*) : HRESULT
    @lpVtbl.value.create_cache_request.call(this, cacherequest)
  end
  def create_true_condition(this : IUIAutomation6*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_true_condition.call(this, newcondition)
  end
  def create_false_condition(this : IUIAutomation6*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_false_condition.call(this, newcondition)
  end
  def create_property_condition(this : IUIAutomation6*, propertyid : Int32, value : VARIANT, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition.call(this, propertyid, value, newcondition)
  end
  def create_property_condition_ex(this : IUIAutomation6*, propertyid : Int32, value : VARIANT, flags : PropertyConditionFlags, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_property_condition_ex.call(this, propertyid, value, flags, newcondition)
  end
  def create_and_condition(this : IUIAutomation6*, condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition.call(this, condition1, condition2, newcondition)
  end
  def create_and_condition_from_array(this : IUIAutomation6*, conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_array.call(this, conditions, newcondition)
  end
  def create_and_condition_from_native_array(this : IUIAutomation6*, conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_and_condition_from_native_array.call(this, conditions, conditioncount, newcondition)
  end
  def create_or_condition(this : IUIAutomation6*, condition1 : IUIAutomationCondition, condition2 : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition.call(this, condition1, condition2, newcondition)
  end
  def create_or_condition_from_array(this : IUIAutomation6*, conditions : SAFEARRAY*, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_array.call(this, conditions, newcondition)
  end
  def create_or_condition_from_native_array(this : IUIAutomation6*, conditions : IUIAutomationCondition*, conditioncount : Int32, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_or_condition_from_native_array.call(this, conditions, conditioncount, newcondition)
  end
  def create_not_condition(this : IUIAutomation6*, condition : IUIAutomationCondition, newcondition : IUIAutomationCondition*) : HRESULT
    @lpVtbl.value.create_not_condition.call(this, condition, newcondition)
  end
  def add_automation_event_handler(this : IUIAutomation6*, eventid : Int32, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.add_automation_event_handler.call(this, eventid, element, scope, cacherequest, handler)
  end
  def remove_automation_event_handler(this : IUIAutomation6*, eventid : Int32, element : IUIAutomationElement, handler : IUIAutomationEventHandler) : HRESULT
    @lpVtbl.value.remove_automation_event_handler.call(this, eventid, element, handler)
  end
  def add_property_changed_event_handler_native_array(this : IUIAutomation6*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : Int32*, propertycount : Int32) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler_native_array.call(this, element, scope, cacherequest, handler, propertyarray, propertycount)
  end
  def add_property_changed_event_handler(this : IUIAutomation6*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationPropertyChangedEventHandler, propertyarray : SAFEARRAY*) : HRESULT
    @lpVtbl.value.add_property_changed_event_handler.call(this, element, scope, cacherequest, handler, propertyarray)
  end
  def remove_property_changed_event_handler(this : IUIAutomation6*, element : IUIAutomationElement, handler : IUIAutomationPropertyChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_property_changed_event_handler.call(this, element, handler)
  end
  def add_structure_changed_event_handler(this : IUIAutomation6*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.add_structure_changed_event_handler.call(this, element, scope, cacherequest, handler)
  end
  def remove_structure_changed_event_handler(this : IUIAutomation6*, element : IUIAutomationElement, handler : IUIAutomationStructureChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_structure_changed_event_handler.call(this, element, handler)
  end
  def add_focus_changed_event_handler(this : IUIAutomation6*, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.add_focus_changed_event_handler.call(this, cacherequest, handler)
  end
  def remove_focus_changed_event_handler(this : IUIAutomation6*, handler : IUIAutomationFocusChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_focus_changed_event_handler.call(this, handler)
  end
  def remove_all_event_handlers(this : IUIAutomation6*) : HRESULT
    @lpVtbl.value.remove_all_event_handlers.call(this)
  end
  def int_native_array_to_safe_array(this : IUIAutomation6*, array : Int32*, arraycount : Int32, safearray : SAFEARRAY**) : HRESULT
    @lpVtbl.value.int_native_array_to_safe_array.call(this, array, arraycount, safearray)
  end
  def int_safe_array_to_native_array(this : IUIAutomation6*, intarray : SAFEARRAY*, array : Int32**, arraycount : Int32*) : HRESULT
    @lpVtbl.value.int_safe_array_to_native_array.call(this, intarray, array, arraycount)
  end
  def rect_to_variant(this : IUIAutomation6*, rc : RECT, var : VARIANT*) : HRESULT
    @lpVtbl.value.rect_to_variant.call(this, rc, var)
  end
  def variant_to_rect(this : IUIAutomation6*, var : VARIANT, rc : RECT*) : HRESULT
    @lpVtbl.value.variant_to_rect.call(this, var, rc)
  end
  def safe_array_to_rect_native_array(this : IUIAutomation6*, rects : SAFEARRAY*, rectarray : RECT**, rectarraycount : Int32*) : HRESULT
    @lpVtbl.value.safe_array_to_rect_native_array.call(this, rects, rectarray, rectarraycount)
  end
  def create_proxy_factory_entry(this : IUIAutomation6*, factory : IUIAutomationProxyFactory, factoryentry : IUIAutomationProxyFactoryEntry*) : HRESULT
    @lpVtbl.value.create_proxy_factory_entry.call(this, factory, factoryentry)
  end
  def get_proxy_factory_mapping(this : IUIAutomation6*, factorymapping : IUIAutomationProxyFactoryMapping*) : HRESULT
    @lpVtbl.value.get_proxy_factory_mapping.call(this, factorymapping)
  end
  def get_property_programmatic_name(this : IUIAutomation6*, property : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_property_programmatic_name.call(this, property, name)
  end
  def get_pattern_programmatic_name(this : IUIAutomation6*, pattern : Int32, name : UInt8**) : HRESULT
    @lpVtbl.value.get_pattern_programmatic_name.call(this, pattern, name)
  end
  def poll_for_potential_supported_patterns(this : IUIAutomation6*, pelement : IUIAutomationElement, patternids : SAFEARRAY**, patternnames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_patterns.call(this, pelement, patternids, patternnames)
  end
  def poll_for_potential_supported_properties(this : IUIAutomation6*, pelement : IUIAutomationElement, propertyids : SAFEARRAY**, propertynames : SAFEARRAY**) : HRESULT
    @lpVtbl.value.poll_for_potential_supported_properties.call(this, pelement, propertyids, propertynames)
  end
  def check_not_supported(this : IUIAutomation6*, value : VARIANT, isnotsupported : LibC::BOOL*) : HRESULT
    @lpVtbl.value.check_not_supported.call(this, value, isnotsupported)
  end
  def get_reserved_not_supported_value(this : IUIAutomation6*, notsupportedvalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_not_supported_value.call(this, notsupportedvalue)
  end
  def get_reserved_mixed_attribute_value(this : IUIAutomation6*, mixedattributevalue : IUnknown*) : HRESULT
    @lpVtbl.value.get_reserved_mixed_attribute_value.call(this, mixedattributevalue)
  end
  def element_from_i_accessible(this : IUIAutomation6*, accessible : IAccessible, childid : Int32, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible.call(this, accessible, childid, element)
  end
  def element_from_i_accessible_build_cache(this : IUIAutomation6*, accessible : IAccessible, childid : Int32, cacherequest : IUIAutomationCacheRequest, element : IUIAutomationElement*) : HRESULT
    @lpVtbl.value.element_from_i_accessible_build_cache.call(this, accessible, childid, cacherequest, element)
  end
  def get_auto_set_focus(this : IUIAutomation6*, autosetfocus : LibC::BOOL*) : HRESULT
    @lpVtbl.value.get_auto_set_focus.call(this, autosetfocus)
  end
  def put_auto_set_focus(this : IUIAutomation6*, autosetfocus : LibC::BOOL) : HRESULT
    @lpVtbl.value.put_auto_set_focus.call(this, autosetfocus)
  end
  def get_connection_timeout(this : IUIAutomation6*, timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_connection_timeout.call(this, timeout)
  end
  def put_connection_timeout(this : IUIAutomation6*, timeout : UInt32) : HRESULT
    @lpVtbl.value.put_connection_timeout.call(this, timeout)
  end
  def get_transaction_timeout(this : IUIAutomation6*, timeout : UInt32*) : HRESULT
    @lpVtbl.value.get_transaction_timeout.call(this, timeout)
  end
  def put_transaction_timeout(this : IUIAutomation6*, timeout : UInt32) : HRESULT
    @lpVtbl.value.put_transaction_timeout.call(this, timeout)
  end
  def add_text_edit_text_changed_event_handler(this : IUIAutomation6*, element : IUIAutomationElement, scope : TreeScope, texteditchangetype : TextEditChangeType, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.add_text_edit_text_changed_event_handler.call(this, element, scope, texteditchangetype, cacherequest, handler)
  end
  def remove_text_edit_text_changed_event_handler(this : IUIAutomation6*, element : IUIAutomationElement, handler : IUIAutomationTextEditTextChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_text_edit_text_changed_event_handler.call(this, element, handler)
  end
  def add_changes_event_handler(this : IUIAutomation6*, element : IUIAutomationElement, scope : TreeScope, changetypes : Int32*, changescount : Int32, pcacherequest : IUIAutomationCacheRequest, handler : IUIAutomationChangesEventHandler) : HRESULT
    @lpVtbl.value.add_changes_event_handler.call(this, element, scope, changetypes, changescount, pcacherequest, handler)
  end
  def remove_changes_event_handler(this : IUIAutomation6*, element : IUIAutomationElement, handler : IUIAutomationChangesEventHandler) : HRESULT
    @lpVtbl.value.remove_changes_event_handler.call(this, element, handler)
  end
  def add_notification_event_handler(this : IUIAutomation6*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationNotificationEventHandler) : HRESULT
    @lpVtbl.value.add_notification_event_handler.call(this, element, scope, cacherequest, handler)
  end
  def remove_notification_event_handler(this : IUIAutomation6*, element : IUIAutomationElement, handler : IUIAutomationNotificationEventHandler) : HRESULT
    @lpVtbl.value.remove_notification_event_handler.call(this, element, handler)
  end
  def create_event_handler_group(this : IUIAutomation6*, handlergroup : IUIAutomationEventHandlerGroup*) : HRESULT
    @lpVtbl.value.create_event_handler_group.call(this, handlergroup)
  end
  def add_event_handler_group(this : IUIAutomation6*, element : IUIAutomationElement, handlergroup : IUIAutomationEventHandlerGroup) : HRESULT
    @lpVtbl.value.add_event_handler_group.call(this, element, handlergroup)
  end
  def remove_event_handler_group(this : IUIAutomation6*, element : IUIAutomationElement, handlergroup : IUIAutomationEventHandlerGroup) : HRESULT
    @lpVtbl.value.remove_event_handler_group.call(this, element, handlergroup)
  end
  def get_connection_recovery_behavior(this : IUIAutomation6*, connectionrecoverybehavioroptions : ConnectionRecoveryBehaviorOptions*) : HRESULT
    @lpVtbl.value.get_connection_recovery_behavior.call(this, connectionrecoverybehavioroptions)
  end
  def put_connection_recovery_behavior(this : IUIAutomation6*, connectionrecoverybehavioroptions : ConnectionRecoveryBehaviorOptions) : HRESULT
    @lpVtbl.value.put_connection_recovery_behavior.call(this, connectionrecoverybehavioroptions)
  end
  def get_coalesce_events(this : IUIAutomation6*, coalesceeventsoptions : CoalesceEventsOptions*) : HRESULT
    @lpVtbl.value.get_coalesce_events.call(this, coalesceeventsoptions)
  end
  def put_coalesce_events(this : IUIAutomation6*, coalesceeventsoptions : CoalesceEventsOptions) : HRESULT
    @lpVtbl.value.put_coalesce_events.call(this, coalesceeventsoptions)
  end
  def add_active_text_position_changed_event_handler(this : IUIAutomation6*, element : IUIAutomationElement, scope : TreeScope, cacherequest : IUIAutomationCacheRequest, handler : IUIAutomationActiveTextPositionChangedEventHandler) : HRESULT
    @lpVtbl.value.add_active_text_position_changed_event_handler.call(this, element, scope, cacherequest, handler)
  end
  def remove_active_text_position_changed_event_handler(this : IUIAutomation6*, element : IUIAutomationElement, handler : IUIAutomationActiveTextPositionChangedEventHandler) : HRESULT
    @lpVtbl.value.remove_active_text_position_changed_event_handler.call(this, element, handler)
  end
end
