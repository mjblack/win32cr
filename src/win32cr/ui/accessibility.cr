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
  CAccPropServices = LibC::GUID.new(0xb5f8350b_u32, 0x548_u16, 0x48b1_u16, StaticArray[0xa6_u8, 0xee_u8, 0x88_u8, 0xbd_u8, 0x0_u8, 0xb4_u8, 0xa5_u8, 0xe7_u8])
  CUIAutomation = LibC::GUID.new(0xff48dba4_u32, 0x60ef_u16, 0x4201_u16, StaticArray[0xaa_u8, 0x87_u8, 0x54_u8, 0x10_u8, 0x3e_u8, 0xef_u8, 0x59_u8, 0x4e_u8])
  CUIAutomation8 = LibC::GUID.new(0xe22ad333_u32, 0xb25f_u16, 0x460c_u16, StaticArray[0x83_u8, 0xd0_u8, 0x5_u8, 0x81_u8, 0x10_u8, 0x73_u8, 0x95_u8, 0xc9_u8])
  CUIAutomationRegistrar = LibC::GUID.new(0x6e29fabf_u32, 0x9977_u16, 0x42d1_u16, StaticArray[0x8d_u8, 0xe_u8, 0xca_u8, 0x7e_u8, 0x61_u8, 0xad_u8, 0x87_u8, 0xe6_u8])

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

  IAccessible_GUID = LibC::GUID.new("618736e0-3c3d-11cf-810c-00aa00389b71")
  CLSID_IAccessible = "618736e0-3c3d-11cf-810c-00aa00389b71"
  struct IAccessible
    lpVtbl : IAccessibleVTbl*
  end

  struct IAccessibleHandlerVTbl
    query_interface : Proc(IAccessibleHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccessibleHandler*, UInt32)
    release : Proc(IAccessibleHandler*, UInt32)
    accessible_object_from_id : Proc(IAccessibleHandler*, Int32, Int32, IAccessible*, HRESULT)
  end

  IAccessibleHandler_GUID = LibC::GUID.new("03022430-abc4-11d0-bde2-00aa001a1953")
  CLSID_IAccessibleHandler = "03022430-abc4-11d0-bde2-00aa001a1953"
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

  IAccessibleWindowlessSite_GUID = LibC::GUID.new("bf3abd9c-76da-4389-9eb6-1427d25abab7")
  CLSID_IAccessibleWindowlessSite = "bf3abd9c-76da-4389-9eb6-1427d25abab7"
  struct IAccessibleWindowlessSite
    lpVtbl : IAccessibleWindowlessSiteVTbl*
  end

  struct IAccIdentityVTbl
    query_interface : Proc(IAccIdentity*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccIdentity*, UInt32)
    release : Proc(IAccIdentity*, UInt32)
    get_identity_string : Proc(IAccIdentity*, UInt32, UInt8**, UInt32*, HRESULT)
  end

  IAccIdentity_GUID = LibC::GUID.new("7852b78d-1cfd-41c1-a615-9c0c85960b5f")
  CLSID_IAccIdentity = "7852b78d-1cfd-41c1-a615-9c0c85960b5f"
  struct IAccIdentity
    lpVtbl : IAccIdentityVTbl*
  end

  struct IAccPropServerVTbl
    query_interface : Proc(IAccPropServer*, Guid*, Void**, HRESULT)
    add_ref : Proc(IAccPropServer*, UInt32)
    release : Proc(IAccPropServer*, UInt32)
    get_prop_value : Proc(IAccPropServer*, UInt8*, UInt32, Guid, VARIANT*, LibC::BOOL*, HRESULT)
  end

  IAccPropServer_GUID = LibC::GUID.new("76c0dbbb-15e0-4e7b-b61b-20eeea2001e0")
  CLSID_IAccPropServer = "76c0dbbb-15e0-4e7b-b61b-20eeea2001e0"
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

  IAccPropServices_GUID = LibC::GUID.new("6e26e776-04f0-495d-80e4-3330352e3169")
  CLSID_IAccPropServices = "6e26e776-04f0-495d-80e4-3330352e3169"
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

  IRawElementProviderSimple_GUID = LibC::GUID.new("d6dd68d1-86fd-4332-8666-9abedea2d24c")
  CLSID_IRawElementProviderSimple = "d6dd68d1-86fd-4332-8666-9abedea2d24c"
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

  IAccessibleEx_GUID = LibC::GUID.new("f8b80ada-2c44-48d0-89be-5ff23c9cd875")
  CLSID_IAccessibleEx = "f8b80ada-2c44-48d0-89be-5ff23c9cd875"
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

  IRawElementProviderSimple2_GUID = LibC::GUID.new("a0a839a9-8da1-4a82-806a-8e0d44e79f56")
  CLSID_IRawElementProviderSimple2 = "a0a839a9-8da1-4a82-806a-8e0d44e79f56"
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

  IRawElementProviderSimple3_GUID = LibC::GUID.new("fcf5d820-d7ec-4613-bdf6-42a84ce7daaf")
  CLSID_IRawElementProviderSimple3 = "fcf5d820-d7ec-4613-bdf6-42a84ce7daaf"
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

  IRawElementProviderFragmentRoot_GUID = LibC::GUID.new("620ce2a5-ab8f-40a9-86cb-de3c75599b58")
  CLSID_IRawElementProviderFragmentRoot = "620ce2a5-ab8f-40a9-86cb-de3c75599b58"
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

  IRawElementProviderFragment_GUID = LibC::GUID.new("f7063da8-8359-439c-9297-bbc5299a7d87")
  CLSID_IRawElementProviderFragment = "f7063da8-8359-439c-9297-bbc5299a7d87"
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

  IRawElementProviderAdviseEvents_GUID = LibC::GUID.new("a407b27b-0f6d-4427-9292-473c7bf93258")
  CLSID_IRawElementProviderAdviseEvents = "a407b27b-0f6d-4427-9292-473c7bf93258"
  struct IRawElementProviderAdviseEvents
    lpVtbl : IRawElementProviderAdviseEventsVTbl*
  end

  struct IRawElementProviderHwndOverrideVTbl
    query_interface : Proc(IRawElementProviderHwndOverride*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRawElementProviderHwndOverride*, UInt32)
    release : Proc(IRawElementProviderHwndOverride*, UInt32)
    get_override_provider_for_hwnd : Proc(IRawElementProviderHwndOverride*, LibC::HANDLE, IRawElementProviderSimple*, HRESULT)
  end

  IRawElementProviderHwndOverride_GUID = LibC::GUID.new("1d5df27c-8947-4425-b8d9-79787bb460b8")
  CLSID_IRawElementProviderHwndOverride = "1d5df27c-8947-4425-b8d9-79787bb460b8"
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

  IProxyProviderWinEventSink_GUID = LibC::GUID.new("4fd82b78-a43e-46ac-9803-0a6969c7c183")
  CLSID_IProxyProviderWinEventSink = "4fd82b78-a43e-46ac-9803-0a6969c7c183"
  struct IProxyProviderWinEventSink
    lpVtbl : IProxyProviderWinEventSinkVTbl*
  end

  struct IProxyProviderWinEventHandlerVTbl
    query_interface : Proc(IProxyProviderWinEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IProxyProviderWinEventHandler*, UInt32)
    release : Proc(IProxyProviderWinEventHandler*, UInt32)
    respond_to_win_event : Proc(IProxyProviderWinEventHandler*, UInt32, LibC::HANDLE, Int32, Int32, IProxyProviderWinEventSink, HRESULT)
  end

  IProxyProviderWinEventHandler_GUID = LibC::GUID.new("89592ad4-f4e0-43d5-a3b6-bad7e111b435")
  CLSID_IProxyProviderWinEventHandler = "89592ad4-f4e0-43d5-a3b6-bad7e111b435"
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

  IRawElementProviderWindowlessSite_GUID = LibC::GUID.new("0a2a93cc-bfad-42ac-9b2e-0991fb0d3ea0")
  CLSID_IRawElementProviderWindowlessSite = "0a2a93cc-bfad-42ac-9b2e-0991fb0d3ea0"
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

  IAccessibleHostingElementProviders_GUID = LibC::GUID.new("33ac331b-943e-4020-b295-db37784974a3")
  CLSID_IAccessibleHostingElementProviders = "33ac331b-943e-4020-b295-db37784974a3"
  struct IAccessibleHostingElementProviders
    lpVtbl : IAccessibleHostingElementProvidersVTbl*
  end

  struct IRawElementProviderHostingAccessiblesVTbl
    query_interface : Proc(IRawElementProviderHostingAccessibles*, Guid*, Void**, HRESULT)
    add_ref : Proc(IRawElementProviderHostingAccessibles*, UInt32)
    release : Proc(IRawElementProviderHostingAccessibles*, UInt32)
    get_embedded_accessibles : Proc(IRawElementProviderHostingAccessibles*, SAFEARRAY**, HRESULT)
  end

  IRawElementProviderHostingAccessibles_GUID = LibC::GUID.new("24be0b07-d37d-487a-98cf-a13ed465e9b3")
  CLSID_IRawElementProviderHostingAccessibles = "24be0b07-d37d-487a-98cf-a13ed465e9b3"
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

  IDockProvider_GUID = LibC::GUID.new("159bc72c-4ad3-485e-9637-d7052edf0146")
  CLSID_IDockProvider = "159bc72c-4ad3-485e-9637-d7052edf0146"
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

  IExpandCollapseProvider_GUID = LibC::GUID.new("d847d3a5-cab0-4a98-8c32-ecb45c59ad24")
  CLSID_IExpandCollapseProvider = "d847d3a5-cab0-4a98-8c32-ecb45c59ad24"
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

  IGridProvider_GUID = LibC::GUID.new("b17d6187-0907-464b-a168-0ef17a1572b1")
  CLSID_IGridProvider = "b17d6187-0907-464b-a168-0ef17a1572b1"
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

  IGridItemProvider_GUID = LibC::GUID.new("d02541f1-fb81-4d64-ae32-f520f8a6dbd1")
  CLSID_IGridItemProvider = "d02541f1-fb81-4d64-ae32-f520f8a6dbd1"
  struct IGridItemProvider
    lpVtbl : IGridItemProviderVTbl*
  end

  struct IInvokeProviderVTbl
    query_interface : Proc(IInvokeProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IInvokeProvider*, UInt32)
    release : Proc(IInvokeProvider*, UInt32)
    invoke : Proc(IInvokeProvider*, HRESULT)
  end

  IInvokeProvider_GUID = LibC::GUID.new("54fcb24b-e18e-47a2-b4d3-eccbe77599a2")
  CLSID_IInvokeProvider = "54fcb24b-e18e-47a2-b4d3-eccbe77599a2"
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

  IMultipleViewProvider_GUID = LibC::GUID.new("6278cab1-b556-4a1a-b4e0-418acc523201")
  CLSID_IMultipleViewProvider = "6278cab1-b556-4a1a-b4e0-418acc523201"
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

  IRangeValueProvider_GUID = LibC::GUID.new("36dc7aef-33e6-4691-afe1-2be7274b3d33")
  CLSID_IRangeValueProvider = "36dc7aef-33e6-4691-afe1-2be7274b3d33"
  struct IRangeValueProvider
    lpVtbl : IRangeValueProviderVTbl*
  end

  struct IScrollItemProviderVTbl
    query_interface : Proc(IScrollItemProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IScrollItemProvider*, UInt32)
    release : Proc(IScrollItemProvider*, UInt32)
    scroll_into_view : Proc(IScrollItemProvider*, HRESULT)
  end

  IScrollItemProvider_GUID = LibC::GUID.new("2360c714-4bf1-4b26-ba65-9b21316127eb")
  CLSID_IScrollItemProvider = "2360c714-4bf1-4b26-ba65-9b21316127eb"
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

  ISelectionProvider_GUID = LibC::GUID.new("fb8b03af-3bdf-48d4-bd36-1a65793be168")
  CLSID_ISelectionProvider = "fb8b03af-3bdf-48d4-bd36-1a65793be168"
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

  ISelectionProvider2_GUID = LibC::GUID.new("14f68475-ee1c-44f6-a869-d239381f0fe7")
  CLSID_ISelectionProvider2 = "14f68475-ee1c-44f6-a869-d239381f0fe7"
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

  IScrollProvider_GUID = LibC::GUID.new("b38b8077-1fc3-42a5-8cae-d40c2215055a")
  CLSID_IScrollProvider = "b38b8077-1fc3-42a5-8cae-d40c2215055a"
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

  ISelectionItemProvider_GUID = LibC::GUID.new("2acad808-b2d4-452d-a407-91ff1ad167b2")
  CLSID_ISelectionItemProvider = "2acad808-b2d4-452d-a407-91ff1ad167b2"
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

  ISynchronizedInputProvider_GUID = LibC::GUID.new("29db1a06-02ce-4cf7-9b42-565d4fab20ee")
  CLSID_ISynchronizedInputProvider = "29db1a06-02ce-4cf7-9b42-565d4fab20ee"
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

  ITableProvider_GUID = LibC::GUID.new("9c860395-97b3-490a-b52a-858cc22af166")
  CLSID_ITableProvider = "9c860395-97b3-490a-b52a-858cc22af166"
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

  ITableItemProvider_GUID = LibC::GUID.new("b9734fa6-771f-4d78-9c90-2517999349cd")
  CLSID_ITableItemProvider = "b9734fa6-771f-4d78-9c90-2517999349cd"
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

  IToggleProvider_GUID = LibC::GUID.new("56d00bd0-c4f4-433c-a836-1a52a57e0892")
  CLSID_IToggleProvider = "56d00bd0-c4f4-433c-a836-1a52a57e0892"
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

  ITransformProvider_GUID = LibC::GUID.new("6829ddc4-4f91-4ffa-b86f-bd3e2987cb4c")
  CLSID_ITransformProvider = "6829ddc4-4f91-4ffa-b86f-bd3e2987cb4c"
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

  IValueProvider_GUID = LibC::GUID.new("c7935180-6fb3-4201-b174-7df73adbf64a")
  CLSID_IValueProvider = "c7935180-6fb3-4201-b174-7df73adbf64a"
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

  IWindowProvider_GUID = LibC::GUID.new("987df77b-db06-4d77-8f8a-86a9c3bb90b9")
  CLSID_IWindowProvider = "987df77b-db06-4d77-8f8a-86a9c3bb90b9"
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

  ILegacyIAccessibleProvider_GUID = LibC::GUID.new("e44c3566-915d-4070-99c6-047bff5a08f5")
  CLSID_ILegacyIAccessibleProvider = "e44c3566-915d-4070-99c6-047bff5a08f5"
  struct ILegacyIAccessibleProvider
    lpVtbl : ILegacyIAccessibleProviderVTbl*
  end

  struct IItemContainerProviderVTbl
    query_interface : Proc(IItemContainerProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IItemContainerProvider*, UInt32)
    release : Proc(IItemContainerProvider*, UInt32)
    find_item_by_property : Proc(IItemContainerProvider*, IRawElementProviderSimple, Int32, VARIANT, IRawElementProviderSimple*, HRESULT)
  end

  IItemContainerProvider_GUID = LibC::GUID.new("e747770b-39ce-4382-ab30-d8fb3f336f24")
  CLSID_IItemContainerProvider = "e747770b-39ce-4382-ab30-d8fb3f336f24"
  struct IItemContainerProvider
    lpVtbl : IItemContainerProviderVTbl*
  end

  struct IVirtualizedItemProviderVTbl
    query_interface : Proc(IVirtualizedItemProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IVirtualizedItemProvider*, UInt32)
    release : Proc(IVirtualizedItemProvider*, UInt32)
    realize : Proc(IVirtualizedItemProvider*, HRESULT)
  end

  IVirtualizedItemProvider_GUID = LibC::GUID.new("cb98b665-2d35-4fac-ad35-f3c60d0c0b8b")
  CLSID_IVirtualizedItemProvider = "cb98b665-2d35-4fac-ad35-f3c60d0c0b8b"
  struct IVirtualizedItemProvider
    lpVtbl : IVirtualizedItemProviderVTbl*
  end

  struct IObjectModelProviderVTbl
    query_interface : Proc(IObjectModelProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(IObjectModelProvider*, UInt32)
    release : Proc(IObjectModelProvider*, UInt32)
    get_underlying_object_model : Proc(IObjectModelProvider*, IUnknown*, HRESULT)
  end

  IObjectModelProvider_GUID = LibC::GUID.new("3ad86ebd-f5ef-483d-bb18-b1042a475d64")
  CLSID_IObjectModelProvider = "3ad86ebd-f5ef-483d-bb18-b1042a475d64"
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

  IAnnotationProvider_GUID = LibC::GUID.new("f95c7e80-bd63-4601-9782-445ebff011fc")
  CLSID_IAnnotationProvider = "f95c7e80-bd63-4601-9782-445ebff011fc"
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

  IStylesProvider_GUID = LibC::GUID.new("19b6b649-f5d7-4a6d-bdcb-129252be588a")
  CLSID_IStylesProvider = "19b6b649-f5d7-4a6d-bdcb-129252be588a"
  struct IStylesProvider
    lpVtbl : IStylesProviderVTbl*
  end

  struct ISpreadsheetProviderVTbl
    query_interface : Proc(ISpreadsheetProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ISpreadsheetProvider*, UInt32)
    release : Proc(ISpreadsheetProvider*, UInt32)
    get_item_by_name : Proc(ISpreadsheetProvider*, LibC::LPWSTR, IRawElementProviderSimple*, HRESULT)
  end

  ISpreadsheetProvider_GUID = LibC::GUID.new("6f6b5d35-5525-4f80-b758-85473832ffc7")
  CLSID_ISpreadsheetProvider = "6f6b5d35-5525-4f80-b758-85473832ffc7"
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

  ISpreadsheetItemProvider_GUID = LibC::GUID.new("eaed4660-7b3d-4879-a2e6-365ce603f3d0")
  CLSID_ISpreadsheetItemProvider = "eaed4660-7b3d-4879-a2e6-365ce603f3d0"
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

  ITransformProvider2_GUID = LibC::GUID.new("4758742f-7ac2-460c-bc48-09fc09308a93")
  CLSID_ITransformProvider2 = "4758742f-7ac2-460c-bc48-09fc09308a93"
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

  IDragProvider_GUID = LibC::GUID.new("6aa7bbbb-7ff9-497d-904f-d20b897929d8")
  CLSID_IDragProvider = "6aa7bbbb-7ff9-497d-904f-d20b897929d8"
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

  IDropTargetProvider_GUID = LibC::GUID.new("bae82bfd-358a-481c-85a0-d8b4d90a5d61")
  CLSID_IDropTargetProvider = "bae82bfd-358a-481c-85a0-d8b4d90a5d61"
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

  ITextRangeProvider_GUID = LibC::GUID.new("5347ad7b-c355-46f8-aff5-909033582f63")
  CLSID_ITextRangeProvider = "5347ad7b-c355-46f8-aff5-909033582f63"
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

  ITextProvider_GUID = LibC::GUID.new("3589c92c-63f3-4367-99bb-ada653b77cf2")
  CLSID_ITextProvider = "3589c92c-63f3-4367-99bb-ada653b77cf2"
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

  ITextProvider2_GUID = LibC::GUID.new("0dc5e6ed-3e16-4bf1-8f9a-a979878bc195")
  CLSID_ITextProvider2 = "0dc5e6ed-3e16-4bf1-8f9a-a979878bc195"
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

  ITextEditProvider_GUID = LibC::GUID.new("ea3605b4-3a05-400e-b5f9-4e91b40f6176")
  CLSID_ITextEditProvider = "ea3605b4-3a05-400e-b5f9-4e91b40f6176"
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

  ITextRangeProvider2_GUID = LibC::GUID.new("9bbce42c-1921-4f18-89ca-dba1910a0386")
  CLSID_ITextRangeProvider2 = "9bbce42c-1921-4f18-89ca-dba1910a0386"
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

  ITextChildProvider_GUID = LibC::GUID.new("4c2de2b9-c88f-4f88-a111-f1d336b7d1a9")
  CLSID_ITextChildProvider = "4c2de2b9-c88f-4f88-a111-f1d336b7d1a9"
  struct ITextChildProvider
    lpVtbl : ITextChildProviderVTbl*
  end

  struct ICustomNavigationProviderVTbl
    query_interface : Proc(ICustomNavigationProvider*, Guid*, Void**, HRESULT)
    add_ref : Proc(ICustomNavigationProvider*, UInt32)
    release : Proc(ICustomNavigationProvider*, UInt32)
    navigate : Proc(ICustomNavigationProvider*, NavigateDirection, IRawElementProviderSimple*, HRESULT)
  end

  ICustomNavigationProvider_GUID = LibC::GUID.new("2062a28a-8c07-4b94-8e12-7037c622aeb8")
  CLSID_ICustomNavigationProvider = "2062a28a-8c07-4b94-8e12-7037c622aeb8"
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

  IUIAutomationPatternInstance_GUID = LibC::GUID.new("c03a7fe4-9431-409f-bed8-ae7c2299bc8d")
  CLSID_IUIAutomationPatternInstance = "c03a7fe4-9431-409f-bed8-ae7c2299bc8d"
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

  IUIAutomationPatternHandler_GUID = LibC::GUID.new("d97022f3-a947-465e-8b2a-ac4315fa54e8")
  CLSID_IUIAutomationPatternHandler = "d97022f3-a947-465e-8b2a-ac4315fa54e8"
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

  IUIAutomationRegistrar_GUID = LibC::GUID.new("8609c4ec-4a1a-4d88-a357-5a66e060e1cf")
  CLSID_IUIAutomationRegistrar = "8609c4ec-4a1a-4d88-a357-5a66e060e1cf"
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

  IUIAutomationElement_GUID = LibC::GUID.new("d22108aa-8ac5-49a5-837b-37bbb3d7591e")
  CLSID_IUIAutomationElement = "d22108aa-8ac5-49a5-837b-37bbb3d7591e"
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

  IUIAutomationElementArray_GUID = LibC::GUID.new("14314595-b4bc-4055-95f2-58f2e42c9855")
  CLSID_IUIAutomationElementArray = "14314595-b4bc-4055-95f2-58f2e42c9855"
  struct IUIAutomationElementArray
    lpVtbl : IUIAutomationElementArrayVTbl*
  end

  struct IUIAutomationConditionVTbl
    query_interface : Proc(IUIAutomationCondition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationCondition*, UInt32)
    release : Proc(IUIAutomationCondition*, UInt32)
  end

  IUIAutomationCondition_GUID = LibC::GUID.new("352ffba8-0973-437c-a61f-f64cafd81df9")
  CLSID_IUIAutomationCondition = "352ffba8-0973-437c-a61f-f64cafd81df9"
  struct IUIAutomationCondition
    lpVtbl : IUIAutomationConditionVTbl*
  end

  struct IUIAutomationBoolConditionVTbl
    query_interface : Proc(IUIAutomationBoolCondition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationBoolCondition*, UInt32)
    release : Proc(IUIAutomationBoolCondition*, UInt32)
    get_boolean_value : Proc(IUIAutomationBoolCondition*, LibC::BOOL*, HRESULT)
  end

  IUIAutomationBoolCondition_GUID = LibC::GUID.new("1b4e1f2e-75eb-4d0b-8952-5a69988e2307")
  CLSID_IUIAutomationBoolCondition = "1b4e1f2e-75eb-4d0b-8952-5a69988e2307"
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

  IUIAutomationPropertyCondition_GUID = LibC::GUID.new("99ebf2cb-5578-4267-9ad4-afd6ea77e94b")
  CLSID_IUIAutomationPropertyCondition = "99ebf2cb-5578-4267-9ad4-afd6ea77e94b"
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

  IUIAutomationAndCondition_GUID = LibC::GUID.new("a7d0af36-b912-45fe-9855-091ddc174aec")
  CLSID_IUIAutomationAndCondition = "a7d0af36-b912-45fe-9855-091ddc174aec"
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

  IUIAutomationOrCondition_GUID = LibC::GUID.new("8753f032-3db1-47b5-a1fc-6e34a266c712")
  CLSID_IUIAutomationOrCondition = "8753f032-3db1-47b5-a1fc-6e34a266c712"
  struct IUIAutomationOrCondition
    lpVtbl : IUIAutomationOrConditionVTbl*
  end

  struct IUIAutomationNotConditionVTbl
    query_interface : Proc(IUIAutomationNotCondition*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationNotCondition*, UInt32)
    release : Proc(IUIAutomationNotCondition*, UInt32)
    get_child : Proc(IUIAutomationNotCondition*, IUIAutomationCondition*, HRESULT)
  end

  IUIAutomationNotCondition_GUID = LibC::GUID.new("f528b657-847b-498c-8896-d52b565407a1")
  CLSID_IUIAutomationNotCondition = "f528b657-847b-498c-8896-d52b565407a1"
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

  IUIAutomationCacheRequest_GUID = LibC::GUID.new("b32a92b5-bc25-4078-9c08-d7ee95c48e03")
  CLSID_IUIAutomationCacheRequest = "b32a92b5-bc25-4078-9c08-d7ee95c48e03"
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

  IUIAutomationTreeWalker_GUID = LibC::GUID.new("4042c624-389c-4afc-a630-9df854a541fc")
  CLSID_IUIAutomationTreeWalker = "4042c624-389c-4afc-a630-9df854a541fc"
  struct IUIAutomationTreeWalker
    lpVtbl : IUIAutomationTreeWalkerVTbl*
  end

  struct IUIAutomationEventHandlerVTbl
    query_interface : Proc(IUIAutomationEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationEventHandler*, UInt32)
    release : Proc(IUIAutomationEventHandler*, UInt32)
    handle_automation_event : Proc(IUIAutomationEventHandler*, IUIAutomationElement, Int32, HRESULT)
  end

  IUIAutomationEventHandler_GUID = LibC::GUID.new("146c3c17-f12e-4e22-8c27-f894b9b79c69")
  CLSID_IUIAutomationEventHandler = "146c3c17-f12e-4e22-8c27-f894b9b79c69"
  struct IUIAutomationEventHandler
    lpVtbl : IUIAutomationEventHandlerVTbl*
  end

  struct IUIAutomationPropertyChangedEventHandlerVTbl
    query_interface : Proc(IUIAutomationPropertyChangedEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationPropertyChangedEventHandler*, UInt32)
    release : Proc(IUIAutomationPropertyChangedEventHandler*, UInt32)
    handle_property_changed_event : Proc(IUIAutomationPropertyChangedEventHandler*, IUIAutomationElement, Int32, VARIANT, HRESULT)
  end

  IUIAutomationPropertyChangedEventHandler_GUID = LibC::GUID.new("40cd37d4-c756-4b0c-8c6f-bddfeeb13b50")
  CLSID_IUIAutomationPropertyChangedEventHandler = "40cd37d4-c756-4b0c-8c6f-bddfeeb13b50"
  struct IUIAutomationPropertyChangedEventHandler
    lpVtbl : IUIAutomationPropertyChangedEventHandlerVTbl*
  end

  struct IUIAutomationStructureChangedEventHandlerVTbl
    query_interface : Proc(IUIAutomationStructureChangedEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationStructureChangedEventHandler*, UInt32)
    release : Proc(IUIAutomationStructureChangedEventHandler*, UInt32)
    handle_structure_changed_event : Proc(IUIAutomationStructureChangedEventHandler*, IUIAutomationElement, StructureChangeType, SAFEARRAY*, HRESULT)
  end

  IUIAutomationStructureChangedEventHandler_GUID = LibC::GUID.new("e81d1b4e-11c5-42f8-9754-e7036c79f054")
  CLSID_IUIAutomationStructureChangedEventHandler = "e81d1b4e-11c5-42f8-9754-e7036c79f054"
  struct IUIAutomationStructureChangedEventHandler
    lpVtbl : IUIAutomationStructureChangedEventHandlerVTbl*
  end

  struct IUIAutomationFocusChangedEventHandlerVTbl
    query_interface : Proc(IUIAutomationFocusChangedEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationFocusChangedEventHandler*, UInt32)
    release : Proc(IUIAutomationFocusChangedEventHandler*, UInt32)
    handle_focus_changed_event : Proc(IUIAutomationFocusChangedEventHandler*, IUIAutomationElement, HRESULT)
  end

  IUIAutomationFocusChangedEventHandler_GUID = LibC::GUID.new("c270f6b5-5c69-4290-9745-7a7f97169468")
  CLSID_IUIAutomationFocusChangedEventHandler = "c270f6b5-5c69-4290-9745-7a7f97169468"
  struct IUIAutomationFocusChangedEventHandler
    lpVtbl : IUIAutomationFocusChangedEventHandlerVTbl*
  end

  struct IUIAutomationTextEditTextChangedEventHandlerVTbl
    query_interface : Proc(IUIAutomationTextEditTextChangedEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationTextEditTextChangedEventHandler*, UInt32)
    release : Proc(IUIAutomationTextEditTextChangedEventHandler*, UInt32)
    handle_text_edit_text_changed_event : Proc(IUIAutomationTextEditTextChangedEventHandler*, IUIAutomationElement, TextEditChangeType, SAFEARRAY*, HRESULT)
  end

  IUIAutomationTextEditTextChangedEventHandler_GUID = LibC::GUID.new("92faa680-e704-4156-931a-e32d5bb38f3f")
  CLSID_IUIAutomationTextEditTextChangedEventHandler = "92faa680-e704-4156-931a-e32d5bb38f3f"
  struct IUIAutomationTextEditTextChangedEventHandler
    lpVtbl : IUIAutomationTextEditTextChangedEventHandlerVTbl*
  end

  struct IUIAutomationChangesEventHandlerVTbl
    query_interface : Proc(IUIAutomationChangesEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationChangesEventHandler*, UInt32)
    release : Proc(IUIAutomationChangesEventHandler*, UInt32)
    handle_changes_event : Proc(IUIAutomationChangesEventHandler*, IUIAutomationElement, UiaChangeInfo*, Int32, HRESULT)
  end

  IUIAutomationChangesEventHandler_GUID = LibC::GUID.new("58edca55-2c3e-4980-b1b9-56c17f27a2a0")
  CLSID_IUIAutomationChangesEventHandler = "58edca55-2c3e-4980-b1b9-56c17f27a2a0"
  struct IUIAutomationChangesEventHandler
    lpVtbl : IUIAutomationChangesEventHandlerVTbl*
  end

  struct IUIAutomationNotificationEventHandlerVTbl
    query_interface : Proc(IUIAutomationNotificationEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationNotificationEventHandler*, UInt32)
    release : Proc(IUIAutomationNotificationEventHandler*, UInt32)
    handle_notification_event : Proc(IUIAutomationNotificationEventHandler*, IUIAutomationElement, NotificationKind, NotificationProcessing, UInt8*, UInt8*, HRESULT)
  end

  IUIAutomationNotificationEventHandler_GUID = LibC::GUID.new("c7cb2637-e6c2-4d0c-85de-4948c02175c7")
  CLSID_IUIAutomationNotificationEventHandler = "c7cb2637-e6c2-4d0c-85de-4948c02175c7"
  struct IUIAutomationNotificationEventHandler
    lpVtbl : IUIAutomationNotificationEventHandlerVTbl*
  end

  struct IUIAutomationInvokePatternVTbl
    query_interface : Proc(IUIAutomationInvokePattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationInvokePattern*, UInt32)
    release : Proc(IUIAutomationInvokePattern*, UInt32)
    invoke : Proc(IUIAutomationInvokePattern*, HRESULT)
  end

  IUIAutomationInvokePattern_GUID = LibC::GUID.new("fb377fbe-8ea6-46d5-9c73-6499642d3059")
  CLSID_IUIAutomationInvokePattern = "fb377fbe-8ea6-46d5-9c73-6499642d3059"
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

  IUIAutomationDockPattern_GUID = LibC::GUID.new("fde5ef97-1464-48f6-90bf-43d0948e86ec")
  CLSID_IUIAutomationDockPattern = "fde5ef97-1464-48f6-90bf-43d0948e86ec"
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

  IUIAutomationExpandCollapsePattern_GUID = LibC::GUID.new("619be086-1f4e-4ee4-bafa-210128738730")
  CLSID_IUIAutomationExpandCollapsePattern = "619be086-1f4e-4ee4-bafa-210128738730"
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

  IUIAutomationGridPattern_GUID = LibC::GUID.new("414c3cdc-856b-4f5b-8538-3131c6302550")
  CLSID_IUIAutomationGridPattern = "414c3cdc-856b-4f5b-8538-3131c6302550"
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

  IUIAutomationGridItemPattern_GUID = LibC::GUID.new("78f8ef57-66c3-4e09-bd7c-e79b2004894d")
  CLSID_IUIAutomationGridItemPattern = "78f8ef57-66c3-4e09-bd7c-e79b2004894d"
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

  IUIAutomationMultipleViewPattern_GUID = LibC::GUID.new("8d253c91-1dc5-4bb5-b18f-ade16fa495e8")
  CLSID_IUIAutomationMultipleViewPattern = "8d253c91-1dc5-4bb5-b18f-ade16fa495e8"
  struct IUIAutomationMultipleViewPattern
    lpVtbl : IUIAutomationMultipleViewPatternVTbl*
  end

  struct IUIAutomationObjectModelPatternVTbl
    query_interface : Proc(IUIAutomationObjectModelPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationObjectModelPattern*, UInt32)
    release : Proc(IUIAutomationObjectModelPattern*, UInt32)
    get_underlying_object_model : Proc(IUIAutomationObjectModelPattern*, IUnknown*, HRESULT)
  end

  IUIAutomationObjectModelPattern_GUID = LibC::GUID.new("71c284b3-c14d-4d14-981e-19751b0d756d")
  CLSID_IUIAutomationObjectModelPattern = "71c284b3-c14d-4d14-981e-19751b0d756d"
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

  IUIAutomationRangeValuePattern_GUID = LibC::GUID.new("59213f4f-7346-49e5-b120-80555987a148")
  CLSID_IUIAutomationRangeValuePattern = "59213f4f-7346-49e5-b120-80555987a148"
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

  IUIAutomationScrollPattern_GUID = LibC::GUID.new("88f4d42a-e881-459d-a77c-73bbbb7e02dc")
  CLSID_IUIAutomationScrollPattern = "88f4d42a-e881-459d-a77c-73bbbb7e02dc"
  struct IUIAutomationScrollPattern
    lpVtbl : IUIAutomationScrollPatternVTbl*
  end

  struct IUIAutomationScrollItemPatternVTbl
    query_interface : Proc(IUIAutomationScrollItemPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationScrollItemPattern*, UInt32)
    release : Proc(IUIAutomationScrollItemPattern*, UInt32)
    scroll_into_view : Proc(IUIAutomationScrollItemPattern*, HRESULT)
  end

  IUIAutomationScrollItemPattern_GUID = LibC::GUID.new("b488300f-d015-4f19-9c29-bb595e3645ef")
  CLSID_IUIAutomationScrollItemPattern = "b488300f-d015-4f19-9c29-bb595e3645ef"
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

  IUIAutomationSelectionPattern_GUID = LibC::GUID.new("5ed5202e-b2ac-47a6-b638-4b0bf140d78e")
  CLSID_IUIAutomationSelectionPattern = "5ed5202e-b2ac-47a6-b638-4b0bf140d78e"
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

  IUIAutomationSelectionPattern2_GUID = LibC::GUID.new("0532bfae-c011-4e32-a343-6d642d798555")
  CLSID_IUIAutomationSelectionPattern2 = "0532bfae-c011-4e32-a343-6d642d798555"
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

  IUIAutomationSelectionItemPattern_GUID = LibC::GUID.new("a8efa66a-0fda-421a-9194-38021f3578ea")
  CLSID_IUIAutomationSelectionItemPattern = "a8efa66a-0fda-421a-9194-38021f3578ea"
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

  IUIAutomationSynchronizedInputPattern_GUID = LibC::GUID.new("2233be0b-afb7-448b-9fda-3b378aa5eae1")
  CLSID_IUIAutomationSynchronizedInputPattern = "2233be0b-afb7-448b-9fda-3b378aa5eae1"
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

  IUIAutomationTablePattern_GUID = LibC::GUID.new("620e691c-ea96-4710-a850-754b24ce2417")
  CLSID_IUIAutomationTablePattern = "620e691c-ea96-4710-a850-754b24ce2417"
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

  IUIAutomationTableItemPattern_GUID = LibC::GUID.new("0b964eb3-ef2e-4464-9c79-61d61737a27e")
  CLSID_IUIAutomationTableItemPattern = "0b964eb3-ef2e-4464-9c79-61d61737a27e"
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

  IUIAutomationTogglePattern_GUID = LibC::GUID.new("94cf8058-9b8d-4ab9-8bfd-4cd0a33c8c70")
  CLSID_IUIAutomationTogglePattern = "94cf8058-9b8d-4ab9-8bfd-4cd0a33c8c70"
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

  IUIAutomationTransformPattern_GUID = LibC::GUID.new("a9b55844-a55d-4ef0-926d-569c16ff89bb")
  CLSID_IUIAutomationTransformPattern = "a9b55844-a55d-4ef0-926d-569c16ff89bb"
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

  IUIAutomationValuePattern_GUID = LibC::GUID.new("a94cd8b1-0844-4cd6-9d2d-640537ab39e9")
  CLSID_IUIAutomationValuePattern = "a94cd8b1-0844-4cd6-9d2d-640537ab39e9"
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

  IUIAutomationWindowPattern_GUID = LibC::GUID.new("0faef453-9208-43ef-bbb2-3b485177864f")
  CLSID_IUIAutomationWindowPattern = "0faef453-9208-43ef-bbb2-3b485177864f"
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

  IUIAutomationTextRange_GUID = LibC::GUID.new("a543cc6a-f4ae-494b-8239-c814481187a8")
  CLSID_IUIAutomationTextRange = "a543cc6a-f4ae-494b-8239-c814481187a8"
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

  IUIAutomationTextRange2_GUID = LibC::GUID.new("bb9b40e0-5e04-46bd-9be0-4b601b9afad4")
  CLSID_IUIAutomationTextRange2 = "bb9b40e0-5e04-46bd-9be0-4b601b9afad4"
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

  IUIAutomationTextRange3_GUID = LibC::GUID.new("6a315d69-5512-4c2e-85f0-53fce6dd4bc2")
  CLSID_IUIAutomationTextRange3 = "6a315d69-5512-4c2e-85f0-53fce6dd4bc2"
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

  IUIAutomationTextRangeArray_GUID = LibC::GUID.new("ce4ae76a-e717-4c98-81ea-47371d028eb6")
  CLSID_IUIAutomationTextRangeArray = "ce4ae76a-e717-4c98-81ea-47371d028eb6"
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

  IUIAutomationTextPattern_GUID = LibC::GUID.new("32eba289-3583-42c9-9c59-3b6d9a1e9b6a")
  CLSID_IUIAutomationTextPattern = "32eba289-3583-42c9-9c59-3b6d9a1e9b6a"
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

  IUIAutomationTextPattern2_GUID = LibC::GUID.new("506a921a-fcc9-409f-b23b-37eb74106872")
  CLSID_IUIAutomationTextPattern2 = "506a921a-fcc9-409f-b23b-37eb74106872"
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

  IUIAutomationTextEditPattern_GUID = LibC::GUID.new("17e21576-996c-4870-99d9-bff323380c06")
  CLSID_IUIAutomationTextEditPattern = "17e21576-996c-4870-99d9-bff323380c06"
  struct IUIAutomationTextEditPattern
    lpVtbl : IUIAutomationTextEditPatternVTbl*
  end

  struct IUIAutomationCustomNavigationPatternVTbl
    query_interface : Proc(IUIAutomationCustomNavigationPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationCustomNavigationPattern*, UInt32)
    release : Proc(IUIAutomationCustomNavigationPattern*, UInt32)
    navigate : Proc(IUIAutomationCustomNavigationPattern*, NavigateDirection, IUIAutomationElement*, HRESULT)
  end

  IUIAutomationCustomNavigationPattern_GUID = LibC::GUID.new("01ea217a-1766-47ed-a6cc-acf492854b1f")
  CLSID_IUIAutomationCustomNavigationPattern = "01ea217a-1766-47ed-a6cc-acf492854b1f"
  struct IUIAutomationCustomNavigationPattern
    lpVtbl : IUIAutomationCustomNavigationPatternVTbl*
  end

  struct IUIAutomationActiveTextPositionChangedEventHandlerVTbl
    query_interface : Proc(IUIAutomationActiveTextPositionChangedEventHandler*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationActiveTextPositionChangedEventHandler*, UInt32)
    release : Proc(IUIAutomationActiveTextPositionChangedEventHandler*, UInt32)
    handle_active_text_position_changed_event : Proc(IUIAutomationActiveTextPositionChangedEventHandler*, IUIAutomationElement, IUIAutomationTextRange, HRESULT)
  end

  IUIAutomationActiveTextPositionChangedEventHandler_GUID = LibC::GUID.new("f97933b0-8dae-4496-8997-5ba015fe0d82")
  CLSID_IUIAutomationActiveTextPositionChangedEventHandler = "f97933b0-8dae-4496-8997-5ba015fe0d82"
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

  IUIAutomationLegacyIAccessiblePattern_GUID = LibC::GUID.new("828055ad-355b-4435-86d5-3b51c14a9b1b")
  CLSID_IUIAutomationLegacyIAccessiblePattern = "828055ad-355b-4435-86d5-3b51c14a9b1b"
  struct IUIAutomationLegacyIAccessiblePattern
    lpVtbl : IUIAutomationLegacyIAccessiblePatternVTbl*
  end

  struct IUIAutomationItemContainerPatternVTbl
    query_interface : Proc(IUIAutomationItemContainerPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationItemContainerPattern*, UInt32)
    release : Proc(IUIAutomationItemContainerPattern*, UInt32)
    find_item_by_property : Proc(IUIAutomationItemContainerPattern*, IUIAutomationElement, Int32, VARIANT, IUIAutomationElement*, HRESULT)
  end

  IUIAutomationItemContainerPattern_GUID = LibC::GUID.new("c690fdb2-27a8-423c-812d-429773c9084e")
  CLSID_IUIAutomationItemContainerPattern = "c690fdb2-27a8-423c-812d-429773c9084e"
  struct IUIAutomationItemContainerPattern
    lpVtbl : IUIAutomationItemContainerPatternVTbl*
  end

  struct IUIAutomationVirtualizedItemPatternVTbl
    query_interface : Proc(IUIAutomationVirtualizedItemPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationVirtualizedItemPattern*, UInt32)
    release : Proc(IUIAutomationVirtualizedItemPattern*, UInt32)
    realize : Proc(IUIAutomationVirtualizedItemPattern*, HRESULT)
  end

  IUIAutomationVirtualizedItemPattern_GUID = LibC::GUID.new("6ba3d7a6-04cf-4f11-8793-a8d1cde9969f")
  CLSID_IUIAutomationVirtualizedItemPattern = "6ba3d7a6-04cf-4f11-8793-a8d1cde9969f"
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

  IUIAutomationAnnotationPattern_GUID = LibC::GUID.new("9a175b21-339e-41b1-8e8b-623f6b681098")
  CLSID_IUIAutomationAnnotationPattern = "9a175b21-339e-41b1-8e8b-623f6b681098"
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

  IUIAutomationStylesPattern_GUID = LibC::GUID.new("85b5f0a2-bd79-484a-ad2b-388c9838d5fb")
  CLSID_IUIAutomationStylesPattern = "85b5f0a2-bd79-484a-ad2b-388c9838d5fb"
  struct IUIAutomationStylesPattern
    lpVtbl : IUIAutomationStylesPatternVTbl*
  end

  struct IUIAutomationSpreadsheetPatternVTbl
    query_interface : Proc(IUIAutomationSpreadsheetPattern*, Guid*, Void**, HRESULT)
    add_ref : Proc(IUIAutomationSpreadsheetPattern*, UInt32)
    release : Proc(IUIAutomationSpreadsheetPattern*, UInt32)
    get_item_by_name : Proc(IUIAutomationSpreadsheetPattern*, UInt8*, IUIAutomationElement*, HRESULT)
  end

  IUIAutomationSpreadsheetPattern_GUID = LibC::GUID.new("7517a7c8-faae-4de9-9f08-29b91e8595c1")
  CLSID_IUIAutomationSpreadsheetPattern = "7517a7c8-faae-4de9-9f08-29b91e8595c1"
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

  IUIAutomationSpreadsheetItemPattern_GUID = LibC::GUID.new("7d4fb86c-8d34-40e1-8e83-62c15204e335")
  CLSID_IUIAutomationSpreadsheetItemPattern = "7d4fb86c-8d34-40e1-8e83-62c15204e335"
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

  IUIAutomationTransformPattern2_GUID = LibC::GUID.new("6d74d017-6ecb-4381-b38b-3c17a48ff1c2")
  CLSID_IUIAutomationTransformPattern2 = "6d74d017-6ecb-4381-b38b-3c17a48ff1c2"
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

  IUIAutomationTextChildPattern_GUID = LibC::GUID.new("6552b038-ae05-40c8-abfd-aa08352aab86")
  CLSID_IUIAutomationTextChildPattern = "6552b038-ae05-40c8-abfd-aa08352aab86"
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

  IUIAutomationDragPattern_GUID = LibC::GUID.new("1dc7b570-1f54-4bad-bcda-d36a722fb7bd")
  CLSID_IUIAutomationDragPattern = "1dc7b570-1f54-4bad-bcda-d36a722fb7bd"
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

  IUIAutomationDropTargetPattern_GUID = LibC::GUID.new("69a095f7-eee4-430e-a46b-fb73b1ae39a5")
  CLSID_IUIAutomationDropTargetPattern = "69a095f7-eee4-430e-a46b-fb73b1ae39a5"
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

  IUIAutomationElement2_GUID = LibC::GUID.new("6749c683-f70d-4487-a698-5f79d55290d6")
  CLSID_IUIAutomationElement2 = "6749c683-f70d-4487-a698-5f79d55290d6"
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

  IUIAutomationElement3_GUID = LibC::GUID.new("8471df34-aee0-4a01-a7de-7db9af12c296")
  CLSID_IUIAutomationElement3 = "8471df34-aee0-4a01-a7de-7db9af12c296"
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

  IUIAutomationElement4_GUID = LibC::GUID.new("3b6e233c-52fb-4063-a4c9-77c075c2a06b")
  CLSID_IUIAutomationElement4 = "3b6e233c-52fb-4063-a4c9-77c075c2a06b"
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

  IUIAutomationElement5_GUID = LibC::GUID.new("98141c1d-0d0e-4175-bbe2-6bff455842a7")
  CLSID_IUIAutomationElement5 = "98141c1d-0d0e-4175-bbe2-6bff455842a7"
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

  IUIAutomationElement6_GUID = LibC::GUID.new("4780d450-8bca-4977-afa5-a4a517f555e3")
  CLSID_IUIAutomationElement6 = "4780d450-8bca-4977-afa5-a4a517f555e3"
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

  IUIAutomationElement7_GUID = LibC::GUID.new("204e8572-cfc3-4c11-b0c8-7da7420750b7")
  CLSID_IUIAutomationElement7 = "204e8572-cfc3-4c11-b0c8-7da7420750b7"
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

  IUIAutomationElement8_GUID = LibC::GUID.new("8c60217d-5411-4cde-bcc0-1ceda223830c")
  CLSID_IUIAutomationElement8 = "8c60217d-5411-4cde-bcc0-1ceda223830c"
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

  IUIAutomationElement9_GUID = LibC::GUID.new("39325fac-039d-440e-a3a3-5eb81a5cecc3")
  CLSID_IUIAutomationElement9 = "39325fac-039d-440e-a3a3-5eb81a5cecc3"
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

  IUIAutomationProxyFactory_GUID = LibC::GUID.new("85b94ecd-849d-42b6-b94d-d6db23fdf5a4")
  CLSID_IUIAutomationProxyFactory = "85b94ecd-849d-42b6-b94d-d6db23fdf5a4"
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

  IUIAutomationProxyFactoryEntry_GUID = LibC::GUID.new("d50e472e-b64b-490c-bca1-d30696f9f289")
  CLSID_IUIAutomationProxyFactoryEntry = "d50e472e-b64b-490c-bca1-d30696f9f289"
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

  IUIAutomationProxyFactoryMapping_GUID = LibC::GUID.new("09e31e18-872d-4873-93d1-1e541ec133fd")
  CLSID_IUIAutomationProxyFactoryMapping = "09e31e18-872d-4873-93d1-1e541ec133fd"
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

  IUIAutomationEventHandlerGroup_GUID = LibC::GUID.new("c9ee12f2-c13b-4408-997c-639914377f4e")
  CLSID_IUIAutomationEventHandlerGroup = "c9ee12f2-c13b-4408-997c-639914377f4e"
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

  IUIAutomation_GUID = LibC::GUID.new("30cbe57d-d9d0-452a-ab13-7ac5ac4825ee")
  CLSID_IUIAutomation = "30cbe57d-d9d0-452a-ab13-7ac5ac4825ee"
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

  IUIAutomation2_GUID = LibC::GUID.new("34723aff-0c9d-49d0-9896-7ab52df8cd8a")
  CLSID_IUIAutomation2 = "34723aff-0c9d-49d0-9896-7ab52df8cd8a"
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

  IUIAutomation3_GUID = LibC::GUID.new("73d768da-9b51-4b89-936e-c209290973e7")
  CLSID_IUIAutomation3 = "73d768da-9b51-4b89-936e-c209290973e7"
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

  IUIAutomation4_GUID = LibC::GUID.new("1189c02a-05f8-4319-8e21-e817e3db2860")
  CLSID_IUIAutomation4 = "1189c02a-05f8-4319-8e21-e817e3db2860"
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

  IUIAutomation5_GUID = LibC::GUID.new("25f700c8-d816-4057-a9dc-3cbdee77e256")
  CLSID_IUIAutomation5 = "25f700c8-d816-4057-a9dc-3cbdee77e256"
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

  IUIAutomation6_GUID = LibC::GUID.new("aae072da-29e3-413d-87a7-192dbf81ed10")
  CLSID_IUIAutomation6 = "aae072da-29e3-413d-87a7-192dbf81ed10"
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
  fun GetOleaccVersionInfo(pver : UInt32*, pbuild : UInt32*)

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
  fun UiaRegisterProviderCallback(pcallback : UiaProviderCallback*)

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
  fun NotifyWinEvent(event : UInt32, hwnd : LibC::HANDLE, idobject : Int32, idchild : Int32)

  # Params # eventmin : UInt32 [In],eventmax : UInt32 [In],hmodwineventproc : HINSTANCE [In],pfnwineventproc : WINEVENTPROC [In],idprocess : UInt32 [In],idthread : UInt32 [In],dwflags : UInt32 [In]
  fun SetWinEventHook(eventmin : UInt32, eventmax : UInt32, hmodwineventproc : HINSTANCE, pfnwineventproc : WINEVENTPROC, idprocess : UInt32, idthread : UInt32, dwflags : UInt32) : HWINEVENTHOOK

  # Params # event : UInt32 [In]
  fun IsWinEventHookInstalled(event : UInt32) : LibC::BOOL

  # Params # hwineventhook : HWINEVENTHOOK [In]
  fun UnhookWinEvent(hwineventhook : HWINEVENTHOOK) : LibC::BOOL
end
