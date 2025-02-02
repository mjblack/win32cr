require "./com.cr"
require "./../foundation.cr"

module Win32cr::System::Contacts
  extend self
  CGD_DEFAULT = 0_u32
  CGD_UNKNOWN_PROPERTY = 0_u32
  CGD_STRING_PROPERTY = 1_u32
  CGD_DATE_PROPERTY = 2_u32
  CGD_BINARY_PROPERTY = 4_u32
  CGD_ARRAY_NODE = 8_u32
  CLSID_ContactAggregationManager = "96c8ad95-c199-44de-b34e-ac33c442df39"
  CONTACTPROP_PUB_NOTES = "Notes"
  CONTACTPROP_PUB_MAILER = "Mailer"
  CONTACTPROP_PUB_PROGID = "ProgID"
  CONTACTPROP_PUB_GENDER = "Gender"
  CONTACTPROP_PUB_GENDER_UNSPECIFIED = "Unspecified"
  CONTACTPROP_PUB_GENDER_MALE = "Male"
  CONTACTPROP_PUB_GENDER_FEMALE = "Female"
  CONTACTPROP_PUB_CREATIONDATE = "CreationDate"
  CONTACTPROP_PUB_L1_CONTACTIDCOLLECTION = "ContactIDCollection"
  CONTACTPROP_PUB_L2_CONTACTID = "/ContactID"
  CONTACTPROP_PUB_L3_VALUE = "/Value"
  CONTACTPROP_PUB_L1_NAMECOLLECTION = "NameCollection"
  CONTACTPROP_PUB_L2_NAME = "/Name"
  CONTACTPROP_PUB_L3_FORMATTEDNAME = "/FormattedName"
  CONTACTPROP_PUB_L3_PHONETIC = "/Phonetic"
  CONTACTPROP_PUB_L3_PREFIX = "/Prefix"
  CONTACTPROP_PUB_L3_TITLE = "/Title"
  CONTACTPROP_PUB_L3_GIVENNAME = "/GivenName"
  CONTACTPROP_PUB_L3_FAMILYNAME = "/FamilyName"
  CONTACTPROP_PUB_L3_MIDDLENAME = "/MiddleName"
  CONTACTPROP_PUB_L3_GENERATION = "/Generation"
  CONTACTPROP_PUB_L3_SUFFIX = "/Suffix"
  CONTACTPROP_PUB_L3_NICKNAME = "/NickName"
  CONTACTPROP_PUB_L1_POSITIONCOLLECTION = "PositionCollection"
  CONTACTPROP_PUB_L2_POSITION = "/Position"
  CONTACTPROP_PUB_L3_ORGANIZATION = "/Organization"
  CONTACTPROP_PUB_L3_COMPANY = "/Company"
  CONTACTPROP_PUB_L3_DEPARTMENT = "/Department"
  CONTACTPROP_PUB_L3_OFFICE = "/Office"
  CONTACTPROP_PUB_L3_JOB_TITLE = "/JobTitle"
  CONTACTPROP_PUB_L3_PROFESSION = "/Profession"
  CONTACTPROP_PUB_L3_ROLE = "/Role"
  CONTACTPROP_PUB_L1_PERSONCOLLECTION = "PersonCollection"
  CONTACTPROP_PUB_L2_PERSON = "/Person"
  CONTACTPROP_PUB_L3_PERSONID = "/PersonID"
  CONTACTPROP_PUB_L1_DATECOLLECTION = "DateCollection"
  CONTACTPROP_PUB_L2_DATE = "/Date"
  CONTACTPROP_PUB_L1_EMAILADDRESSCOLLECTION = "EmailAddressCollection"
  CONTACTPROP_PUB_L2_EMAILADDRESS = "/EmailAddress"
  CONTACTPROP_PUB_L3_ADDRESS = "/Address"
  CONTACTPROP_PUB_L3_TYPE = "/Type"
  CONTACTPROP_PUB_L1_CERTIFICATECOLLECTION = "CertificateCollection"
  CONTACTPROP_PUB_L2_CERTIFICATE = "/Certificate"
  CONTACTPROP_PUB_L3_THUMBPRINT = "/ThumbPrint"
  CONTACTPROP_PUB_L1_PHONENUMBERCOLLECTION = "PhoneNumberCollection"
  CONTACTPROP_PUB_L2_PHONENUMBER = "/PhoneNumber"
  CONTACTPROP_PUB_L3_NUMBER = "/Number"
  CONTACTPROP_PUB_L3_ALTERNATE = "/Alternate"
  CONTACTPROP_PUB_L1_PHYSICALADDRESSCOLLECTION = "PhysicalAddressCollection"
  CONTACTPROP_PUB_L2_PHYSICALADDRESS = "/PhysicalAddress"
  CONTACTPROP_PUB_L3_ADDRESSLABEL = "/AddressLabel"
  CONTACTPROP_PUB_L3_STREET = "/Street"
  CONTACTPROP_PUB_L3_LOCALITY = "/Locality"
  CONTACTPROP_PUB_L3_REGION = "/Region"
  CONTACTPROP_PUB_L3_POSTALCODE = "/PostalCode"
  CONTACTPROP_PUB_L3_COUNTRY = "/Country"
  CONTACTPROP_PUB_L3_POBOX = "/POBox"
  CONTACTPROP_PUB_L3_EXTENDEDADDRESS = "/ExtendedAddress"
  CONTACTPROP_PUB_L1_IMADDRESSCOLLECTION = "IMAddressCollection"
  CONTACTPROP_PUB_L2_IMADDRESSENTRY = "/IMAddress"
  CONTACTPROP_PUB_L3_PROTOCOL = "/Protocol"
  CONTACTPROP_PUB_L1_URLCOLLECTION = "UrlCollection"
  CONTACTPROP_PUB_L2_URL = "/Url"
  CONTACTPROP_PUB_L1_PHOTOCOLLECTION = "PhotoCollection"
  CONTACTPROP_PUB_L2_PHOTO = "/Photo"
  CONTACTPROP_PUB_L3_URL = "/Url"
  CONTACTLABEL_PUB_PREFERRED = "Preferred"
  CONTACTLABEL_PUB_PERSONAL = "Personal"
  CONTACTLABEL_PUB_BUSINESS = "Business"
  CONTACTLABEL_PUB_OTHER = "Other"
  CONTACTLABEL_PUB_VOICE = "Voice"
  CONTACTLABEL_PUB_MOBILE = "Mobile"
  CONTACTLABEL_PUB_PCS = "PCS"
  CONTACTLABEL_PUB_CELLULAR = "Cellular"
  CONTACTLABEL_PUB_CAR = "Car"
  CONTACTLABEL_PUB_PAGER = "Pager"
  CONTACTLABEL_PUB_TTY = "TTY"
  CONTACTLABEL_PUB_FAX = "Fax"
  CONTACTLABEL_PUB_VIDEO = "Video"
  CONTACTLABEL_PUB_MODEM = "Modem"
  CONTACTLABEL_PUB_BBS = "BBS"
  CONTACTLABEL_PUB_ISDN = "ISDN"
  CONTACTLABEL_PUB_AGENT = "Agent"
  CONTACTLABEL_PUB_DOMESTIC = "Domestic"
  CONTACTLABEL_PUB_INTERNATIONAL = "International"
  CONTACTLABEL_PUB_POSTAL = "Postal"
  CONTACTLABEL_PUB_PARCEL = "Parcel"
  CONTACTLABEL_PUB_USERTILE = "UserTile"
  CONTACTLABEL_PUB_LOGO = "Logo"
  CONTACTLABEL_WAB_SPOUSE = "wab:Spouse"
  CONTACTLABEL_WAB_CHILD = "wab:Child"
  CONTACTLABEL_WAB_MANAGER = "wab:Manager"
  CONTACTLABEL_WAB_ASSISTANT = "wab:Assistant"
  CONTACTLABEL_WAB_BIRTHDAY = "wab:Birthday"
  CONTACTLABEL_WAB_ANNIVERSARY = "wab:Anniversary"
  CONTACTLABEL_WAB_SOCIALNETWORK = "wab:SocialNetwork"
  CONTACTLABEL_WAB_SCHOOL = "wab:School"
  CONTACTLABEL_WAB_WISHLIST = "wab:WishList"

  CLSID_Contact = LibC::GUID.new(0x61b68808_u32, 0x8eee_u16, 0x4fd1_u16, StaticArray[0xac_u8, 0xb8_u8, 0x3d_u8, 0x80_u8, 0x4c_u8, 0x8d_u8, 0xb0_u8, 0x56_u8])

  CLSID_ContactManager = LibC::GUID.new(0x7165c8ab_u32, 0xaf88_u16, 0x42bd_u16, StaticArray[0x86_u8, 0xfd_u8, 0x53_u8, 0x10_u8, 0xb4_u8, 0x28_u8, 0x5a_u8, 0x2_u8])

  enum CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS
    CA_CREATE_LOCAL = 0_i32
    CA_CREATE_EXTERNAL = 1_i32
  end
  enum CONTACT_AGGREGATION_COLLECTION_OPTIONS
    CACO_DEFAULT = 0_i32
    CACO_INCLUDE_EXTERNAL = 1_i32
    CACO_EXTERNAL_ONLY = 2_i32
  end

  @[Extern]
  struct CONTACT_AGGREGATION_BLOB
    property dwCount : UInt32
    property lpb : UInt8*
    def initialize(@dwCount : UInt32, @lpb : UInt8*)
    end
  end

  @[Extern]
  record IContactManagerVtbl,
    query_interface : Proc(IContactManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactManager*, UInt32),
    release : Proc(IContactManager*, UInt32),
    initialize__ : Proc(IContactManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    load : Proc(IContactManager*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    merge_contact_i_ds : Proc(IContactManager*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_me_contact : Proc(IContactManager*, Void**, Win32cr::Foundation::HRESULT),
    set_me_contact : Proc(IContactManager*, Void*, Win32cr::Foundation::HRESULT),
    get_contact_collection : Proc(IContactManager*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactManager, lpVtbl : IContactManagerVtbl* do
    GUID = LibC::GUID.new(0xad553d98_u32, 0xdeb1_u16, 0x474a_u16, StaticArray[0x8e_u8, 0x17_u8, 0xfc_u8, 0xc_u8, 0x20_u8, 0x75_u8, 0xb7_u8, 0x38_u8])
    def query_interface(this : IContactManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def initialize__(this : IContactManager*, pszAppName : Win32cr::Foundation::PWSTR, pszAppVersion : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.initialize__.call(this, pszAppName, pszAppVersion)
    end
    def load(this : IContactManager*, pszContactID : Win32cr::Foundation::PWSTR, ppContact : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.load.call(this, pszContactID, ppContact)
    end
    def merge_contact_i_ds(this : IContactManager*, pszNewContactID : Win32cr::Foundation::PWSTR, pszOldContactID : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.merge_contact_i_ds.call(this, pszNewContactID, pszOldContactID)
    end
    def get_me_contact(this : IContactManager*, ppMeContact : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_me_contact.call(this, ppMeContact)
    end
    def set_me_contact(this : IContactManager*, pMeContact : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_me_contact.call(this, pMeContact)
    end
    def get_contact_collection(this : IContactManager*, ppContactCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_contact_collection.call(this, ppContactCollection)
    end

  end

  @[Extern]
  record IContactCollectionVtbl,
    query_interface : Proc(IContactCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactCollection*, UInt32),
    release : Proc(IContactCollection*, UInt32),
    reset : Proc(IContactCollection*, Win32cr::Foundation::HRESULT),
    next__ : Proc(IContactCollection*, Win32cr::Foundation::HRESULT),
    get_current : Proc(IContactCollection*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactCollection, lpVtbl : IContactCollectionVtbl* do
    GUID = LibC::GUID.new(0xb6afa338_u32, 0xd779_u16, 0x11d9_u16, StaticArray[0x8b_u8, 0xde_u8, 0xf6_u8, 0x6b_u8, 0xad_u8, 0x1e_u8, 0x3f_u8, 0x3a_u8])
    def query_interface(this : IContactCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def reset(this : IContactCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def next__(this : IContactCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this)
    end
    def get_current(this : IContactCollection*, ppContact : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_current.call(this, ppContact)
    end

  end

  @[Extern]
  record IContactPropertiesVtbl,
    query_interface : Proc(IContactProperties*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactProperties*, UInt32),
    release : Proc(IContactProperties*, UInt32),
    get_string : Proc(IContactProperties*, Win32cr::Foundation::PWSTR, UInt32, UInt16*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_date : Proc(IContactProperties*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    get_binary : Proc(IContactProperties*, Win32cr::Foundation::PWSTR, UInt32, UInt16*, UInt32, UInt32*, Void**, Win32cr::Foundation::HRESULT),
    get_labels : Proc(IContactProperties*, Win32cr::Foundation::PWSTR, UInt32, UInt16*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    set_string : Proc(IContactProperties*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    set_date : Proc(IContactProperties*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::FILETIME, Win32cr::Foundation::HRESULT),
    set_binary : Proc(IContactProperties*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR, Void*, Win32cr::Foundation::HRESULT),
    set_labels : Proc(IContactProperties*, Win32cr::Foundation::PWSTR, UInt32, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    create_array_node : Proc(IContactProperties*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::BOOL, UInt16*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    delete_property : Proc(IContactProperties*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    delete_array_node : Proc(IContactProperties*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    delete_labels : Proc(IContactProperties*, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::HRESULT),
    get_property_collection : Proc(IContactProperties*, Void**, UInt32, Win32cr::Foundation::PWSTR, UInt32, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactProperties, lpVtbl : IContactPropertiesVtbl* do
    GUID = LibC::GUID.new(0x70dd27dd_u32, 0x5cbd_u16, 0x46e8_u16, StaticArray[0xbe_u8, 0xf0_u8, 0x23_u8, 0xb6_u8, 0xb3_u8, 0x46_u8, 0x28_u8, 0x8f_u8])
    def query_interface(this : IContactProperties*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactProperties*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactProperties*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_string(this : IContactProperties*, pszPropertyName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pszValue : UInt16*, cchValue : UInt32, pdwcchPropertyValueRequired : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_string.call(this, pszPropertyName, dwFlags, pszValue, cchValue, pdwcchPropertyValueRequired)
    end
    def get_date(this : IContactProperties*, pszPropertyName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pftDateTime : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_date.call(this, pszPropertyName, dwFlags, pftDateTime)
    end
    def get_binary(this : IContactProperties*, pszPropertyName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pszContentType : UInt16*, cchContentType : UInt32, pdwcchContentTypeRequired : UInt32*, ppStream : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_binary.call(this, pszPropertyName, dwFlags, pszContentType, cchContentType, pdwcchContentTypeRequired, ppStream)
    end
    def get_labels(this : IContactProperties*, pszArrayElementName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pszLabels : UInt16*, cchLabels : UInt32, pdwcchLabelsRequired : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_labels.call(this, pszArrayElementName, dwFlags, pszLabels, cchLabels, pdwcchLabelsRequired)
    end
    def set_string(this : IContactProperties*, pszPropertyName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pszValue : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_string.call(this, pszPropertyName, dwFlags, pszValue)
    end
    def set_date(this : IContactProperties*, pszPropertyName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, ftDateTime : Win32cr::Foundation::FILETIME) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_date.call(this, pszPropertyName, dwFlags, ftDateTime)
    end
    def set_binary(this : IContactProperties*, pszPropertyName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, pszContentType : Win32cr::Foundation::PWSTR, pStream : Void*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_binary.call(this, pszPropertyName, dwFlags, pszContentType, pStream)
    end
    def set_labels(this : IContactProperties*, pszArrayElementName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, dwLabelCount : UInt32, ppszLabels : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.set_labels.call(this, pszArrayElementName, dwFlags, dwLabelCount, ppszLabels)
    end
    def create_array_node(this : IContactProperties*, pszArrayName : Win32cr::Foundation::PWSTR, dwFlags : UInt32, fAppend : Win32cr::Foundation::BOOL, pszNewArrayElementName : UInt16*, cchNewArrayElementName : UInt32, pdwcchNewArrayElementNameRequired : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_array_node.call(this, pszArrayName, dwFlags, fAppend, pszNewArrayElementName, cchNewArrayElementName, pdwcchNewArrayElementNameRequired)
    end
    def delete_property(this : IContactProperties*, pszPropertyName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_property.call(this, pszPropertyName, dwFlags)
    end
    def delete_array_node(this : IContactProperties*, pszArrayElementName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_array_node.call(this, pszArrayElementName, dwFlags)
    end
    def delete_labels(this : IContactProperties*, pszArrayElementName : Win32cr::Foundation::PWSTR, dwFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete_labels.call(this, pszArrayElementName, dwFlags)
    end
    def get_property_collection(this : IContactProperties*, ppPropertyCollection : Void**, dwFlags : UInt32, pszMultiValueName : Win32cr::Foundation::PWSTR, dwLabelCount : UInt32, ppszLabels : Win32cr::Foundation::PWSTR*, fAnyLabelMatches : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_collection.call(this, ppPropertyCollection, dwFlags, pszMultiValueName, dwLabelCount, ppszLabels, fAnyLabelMatches)
    end

  end

  @[Extern]
  record IContactVtbl,
    query_interface : Proc(IContact*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContact*, UInt32),
    release : Proc(IContact*, UInt32),
    get_contact_id : Proc(IContact*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_path : Proc(IContact*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    commit_changes : Proc(IContact*, UInt32, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContact, lpVtbl : IContactVtbl* do
    GUID = LibC::GUID.new(0xf941b671_u32, 0xbda7_u16, 0x4f77_u16, StaticArray[0x88_u8, 0x4a_u8, 0xf4_u8, 0x64_u8, 0x62_u8, 0xf2_u8, 0x26_u8, 0xa7_u8])
    def query_interface(this : IContact*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContact*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContact*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_contact_id(this : IContact*, pszContactID : UInt16*, cchContactID : UInt32, pdwcchContactIDRequired : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_contact_id.call(this, pszContactID, cchContactID, pdwcchContactIDRequired)
    end
    def get_path(this : IContact*, pszPath : UInt16*, cchPath : UInt32, pdwcchPathRequired : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_path.call(this, pszPath, cchPath, pdwcchPathRequired)
    end
    def commit_changes(this : IContact*, dwCommitFlags : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.commit_changes.call(this, dwCommitFlags)
    end

  end

  @[Extern]
  record IContactPropertyCollectionVtbl,
    query_interface : Proc(IContactPropertyCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactPropertyCollection*, UInt32),
    release : Proc(IContactPropertyCollection*, UInt32),
    reset : Proc(IContactPropertyCollection*, Win32cr::Foundation::HRESULT),
    next__ : Proc(IContactPropertyCollection*, Win32cr::Foundation::HRESULT),
    get_property_name : Proc(IContactPropertyCollection*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::HRESULT),
    get_property_type : Proc(IContactPropertyCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_property_version : Proc(IContactPropertyCollection*, UInt32*, Win32cr::Foundation::HRESULT),
    get_property_modification_date : Proc(IContactPropertyCollection*, Win32cr::Foundation::FILETIME*, Win32cr::Foundation::HRESULT),
    get_property_array_element_id : Proc(IContactPropertyCollection*, UInt16*, UInt32, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactPropertyCollection, lpVtbl : IContactPropertyCollectionVtbl* do
    GUID = LibC::GUID.new(0xffd3adf8_u32, 0xfa64_u16, 0x4328_u16, StaticArray[0xb1_u8, 0xb6_u8, 0x2e_u8, 0xd_u8, 0xb5_u8, 0x9_u8, 0xcb_u8, 0x3c_u8])
    def query_interface(this : IContactPropertyCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactPropertyCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactPropertyCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def reset(this : IContactPropertyCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.reset.call(this)
    end
    def next__(this : IContactPropertyCollection*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.next__.call(this)
    end
    def get_property_name(this : IContactPropertyCollection*, pszPropertyName : UInt16*, cchPropertyName : UInt32, pdwcchPropertyNameRequired : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_name.call(this, pszPropertyName, cchPropertyName, pdwcchPropertyNameRequired)
    end
    def get_property_type(this : IContactPropertyCollection*, pdwType : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_type.call(this, pdwType)
    end
    def get_property_version(this : IContactPropertyCollection*, pdwVersion : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_version.call(this, pdwVersion)
    end
    def get_property_modification_date(this : IContactPropertyCollection*, pftModificationDate : Win32cr::Foundation::FILETIME*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_modification_date.call(this, pftModificationDate)
    end
    def get_property_array_element_id(this : IContactPropertyCollection*, pszArrayElementID : UInt16*, cchArrayElementID : UInt32, pdwcchArrayElementIDRequired : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_property_array_element_id.call(this, pszArrayElementID, cchArrayElementID, pdwcchArrayElementIDRequired)
    end

  end

  @[Extern]
  record IContactAggregationManagerVtbl,
    query_interface : Proc(IContactAggregationManager*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactAggregationManager*, UInt32),
    release : Proc(IContactAggregationManager*, UInt32),
    get_version_info : Proc(IContactAggregationManager*, Int32*, Int32*, Win32cr::Foundation::HRESULT),
    create_or_open_group : Proc(IContactAggregationManager*, Win32cr::Foundation::PWSTR, Win32cr::System::Contacts::CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS, Win32cr::Foundation::BOOL*, Void**, Win32cr::Foundation::HRESULT),
    create_external_contact : Proc(IContactAggregationManager*, Void**, Win32cr::Foundation::HRESULT),
    create_server_person : Proc(IContactAggregationManager*, Void**, Win32cr::Foundation::HRESULT),
    create_server_contact_link : Proc(IContactAggregationManager*, Void**, Win32cr::Foundation::HRESULT),
    flush : Proc(IContactAggregationManager*, Win32cr::Foundation::HRESULT),
    open_aggregate_contact : Proc(IContactAggregationManager*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    open_contact : Proc(IContactAggregationManager*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    open_server_contact_link : Proc(IContactAggregationManager*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    open_server_person : Proc(IContactAggregationManager*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    get_Contacts : Proc(IContactAggregationManager*, Win32cr::System::Contacts::CONTACT_AGGREGATION_COLLECTION_OPTIONS, Void**, Win32cr::Foundation::HRESULT),
    get_AggregateContacts : Proc(IContactAggregationManager*, Win32cr::System::Contacts::CONTACT_AGGREGATION_COLLECTION_OPTIONS, Void**, Win32cr::Foundation::HRESULT),
    get_Groups : Proc(IContactAggregationManager*, Win32cr::System::Contacts::CONTACT_AGGREGATION_COLLECTION_OPTIONS, Void**, Win32cr::Foundation::HRESULT),
    get_ServerPersons : Proc(IContactAggregationManager*, Void**, Win32cr::Foundation::HRESULT),
    get_ServerContactLinks : Proc(IContactAggregationManager*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactAggregationManager, lpVtbl : IContactAggregationManagerVtbl* do
    GUID = LibC::GUID.new(0x1d865989_u32, 0x4b1f_u16, 0x4b60_u16, StaticArray[0x8f_u8, 0x34_u8, 0xc2_u8, 0xad_u8, 0x46_u8, 0x8b_u8, 0x2b_u8, 0x50_u8])
    def query_interface(this : IContactAggregationManager*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactAggregationManager*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactAggregationManager*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def get_version_info(this : IContactAggregationManager*, plMajorVersion : Int32*, plMinorVersion : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_version_info.call(this, plMajorVersion, plMinorVersion)
    end
    def create_or_open_group(this : IContactAggregationManager*, pGroupName : Win32cr::Foundation::PWSTR, options : Win32cr::System::Contacts::CONTACT_AGGREGATION_CREATE_OR_OPEN_OPTIONS, pCreatedGroup : Win32cr::Foundation::BOOL*, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_or_open_group.call(this, pGroupName, options, pCreatedGroup, ppGroup)
    end
    def create_external_contact(this : IContactAggregationManager*, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_external_contact.call(this, ppItem)
    end
    def create_server_person(this : IContactAggregationManager*, ppServerPerson : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_server_person.call(this, ppServerPerson)
    end
    def create_server_contact_link(this : IContactAggregationManager*, ppServerContactLink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.create_server_contact_link.call(this, ppServerContactLink)
    end
    def flush(this : IContactAggregationManager*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.flush.call(this)
    end
    def open_aggregate_contact(this : IContactAggregationManager*, pItemId : Win32cr::Foundation::PWSTR, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_aggregate_contact.call(this, pItemId, ppItem)
    end
    def open_contact(this : IContactAggregationManager*, pItemId : Win32cr::Foundation::PWSTR, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_contact.call(this, pItemId, ppItem)
    end
    def open_server_contact_link(this : IContactAggregationManager*, pItemId : Win32cr::Foundation::PWSTR, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_server_contact_link.call(this, pItemId, ppItem)
    end
    def open_server_person(this : IContactAggregationManager*, pItemId : Win32cr::Foundation::PWSTR, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.open_server_person.call(this, pItemId, ppItem)
    end
    def get_Contacts(this : IContactAggregationManager*, options : Win32cr::System::Contacts::CONTACT_AGGREGATION_COLLECTION_OPTIONS, ppItems : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Contacts.call(this, options, ppItems)
    end
    def get_AggregateContacts(this : IContactAggregationManager*, options : Win32cr::System::Contacts::CONTACT_AGGREGATION_COLLECTION_OPTIONS, ppAggregates : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AggregateContacts.call(this, options, ppAggregates)
    end
    def get_Groups(this : IContactAggregationManager*, options : Win32cr::System::Contacts::CONTACT_AGGREGATION_COLLECTION_OPTIONS, ppGroups : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Groups.call(this, options, ppGroups)
    end
    def get_ServerPersons(this : IContactAggregationManager*, ppServerPersonCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServerPersons.call(this, ppServerPersonCollection)
    end
    def get_ServerContactLinks(this : IContactAggregationManager*, pPersonItemId : Win32cr::Foundation::PWSTR, ppServerContactLinkCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServerContactLinks.call(this, pPersonItemId, ppServerContactLinkCollection)
    end

  end

  @[Extern]
  record IContactAggregationContactVtbl,
    query_interface : Proc(IContactAggregationContact*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactAggregationContact*, UInt32),
    release : Proc(IContactAggregationContact*, UInt32),
    delete : Proc(IContactAggregationContact*, Win32cr::Foundation::HRESULT),
    save : Proc(IContactAggregationContact*, Win32cr::Foundation::HRESULT),
    move_to_aggregate : Proc(IContactAggregationContact*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    unlink : Proc(IContactAggregationContact*, Win32cr::Foundation::HRESULT),
    get_AccountId : Proc(IContactAggregationContact*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_AccountId : Proc(IContactAggregationContact*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_AggregateId : Proc(IContactAggregationContact*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IContactAggregationContact*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_IsMe : Proc(IContactAggregationContact*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_IsExternal : Proc(IContactAggregationContact*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    get_NetworkSourceId : Proc(IContactAggregationContact*, UInt32*, Win32cr::Foundation::HRESULT),
    put_NetworkSourceId : Proc(IContactAggregationContact*, UInt32, Win32cr::Foundation::HRESULT),
    get_NetworkSourceIdString : Proc(IContactAggregationContact*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_NetworkSourceIdString : Proc(IContactAggregationContact*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_RemoteObjectId : Proc(IContactAggregationContact*, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB**, Win32cr::Foundation::HRESULT),
    put_RemoteObjectId : Proc(IContactAggregationContact*, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*, Win32cr::Foundation::HRESULT),
    get_SyncIdentityHash : Proc(IContactAggregationContact*, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB**, Win32cr::Foundation::HRESULT),
    put_SyncIdentityHash : Proc(IContactAggregationContact*, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactAggregationContact, lpVtbl : IContactAggregationContactVtbl* do
    GUID = LibC::GUID.new(0x1eb22e86_u32, 0x4c86_u16, 0x41f0_u16, StaticArray[0x9f_u8, 0x9f_u8, 0xc2_u8, 0x51_u8, 0xe9_u8, 0xfd_u8, 0xa6_u8, 0xc3_u8])
    def query_interface(this : IContactAggregationContact*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactAggregationContact*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactAggregationContact*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def delete(this : IContactAggregationContact*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def save(this : IContactAggregationContact*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def move_to_aggregate(this : IContactAggregationContact*, pAggregateId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.move_to_aggregate.call(this, pAggregateId)
    end
    def unlink(this : IContactAggregationContact*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.unlink.call(this)
    end
    def get_AccountId(this : IContactAggregationContact*, ppAccountId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AccountId.call(this, ppAccountId)
    end
    def put_AccountId(this : IContactAggregationContact*, pAccountId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AccountId.call(this, pAccountId)
    end
    def get_AggregateId(this : IContactAggregationContact*, ppAggregateId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AggregateId.call(this, ppAggregateId)
    end
    def get_Id(this : IContactAggregationContact*, ppItemId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, ppItemId)
    end
    def get_IsMe(this : IContactAggregationContact*, pIsMe : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsMe.call(this, pIsMe)
    end
    def get_IsExternal(this : IContactAggregationContact*, pIsExternal : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsExternal.call(this, pIsExternal)
    end
    def get_NetworkSourceId(this : IContactAggregationContact*, pNetworkSourceId : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkSourceId.call(this, pNetworkSourceId)
    end
    def put_NetworkSourceId(this : IContactAggregationContact*, networkSourceId : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NetworkSourceId.call(this, networkSourceId)
    end
    def get_NetworkSourceIdString(this : IContactAggregationContact*, ppNetworkSourceId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkSourceIdString.call(this, ppNetworkSourceId)
    end
    def put_NetworkSourceIdString(this : IContactAggregationContact*, pNetworkSourceId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NetworkSourceIdString.call(this, pNetworkSourceId)
    end
    def get_RemoteObjectId(this : IContactAggregationContact*, ppRemoteObjectId : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteObjectId.call(this, ppRemoteObjectId)
    end
    def put_RemoteObjectId(this : IContactAggregationContact*, pRemoteObjectId : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RemoteObjectId.call(this, pRemoteObjectId)
    end
    def get_SyncIdentityHash(this : IContactAggregationContact*, ppSyncIdentityHash : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SyncIdentityHash.call(this, ppSyncIdentityHash)
    end
    def put_SyncIdentityHash(this : IContactAggregationContact*, pSyncIdentityHash : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SyncIdentityHash.call(this, pSyncIdentityHash)
    end

  end

  @[Extern]
  record IContactAggregationContactCollectionVtbl,
    query_interface : Proc(IContactAggregationContactCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactAggregationContactCollection*, UInt32),
    release : Proc(IContactAggregationContactCollection*, UInt32),
    find_first : Proc(IContactAggregationContactCollection*, Void**, Win32cr::Foundation::HRESULT),
    find_next : Proc(IContactAggregationContactCollection*, Void**, Win32cr::Foundation::HRESULT),
    find_first_by_identity_hash : Proc(IContactAggregationContactCollection*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IContactAggregationContactCollection*, Int32*, Win32cr::Foundation::HRESULT),
    find_first_by_remote_id : Proc(IContactAggregationContactCollection*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*, Void**, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactAggregationContactCollection, lpVtbl : IContactAggregationContactCollectionVtbl* do
    GUID = LibC::GUID.new(0x826e66fa_u32, 0x81de_u16, 0x43ca_u16, StaticArray[0xa6_u8, 0xfb_u8, 0x8c_u8, 0x78_u8, 0x5c_u8, 0xd9_u8, 0x96_u8, 0xc6_u8])
    def query_interface(this : IContactAggregationContactCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactAggregationContactCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactAggregationContactCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def find_first(this : IContactAggregationContactCollection*, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first.call(this, ppItem)
    end
    def find_next(this : IContactAggregationContactCollection*, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_next.call(this, ppItem)
    end
    def find_first_by_identity_hash(this : IContactAggregationContactCollection*, pSourceType : Win32cr::Foundation::PWSTR, pAccountId : Win32cr::Foundation::PWSTR, pIdentityHash : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_by_identity_hash.call(this, pSourceType, pAccountId, pIdentityHash, ppItem)
    end
    def get_Count(this : IContactAggregationContactCollection*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pCount)
    end
    def find_first_by_remote_id(this : IContactAggregationContactCollection*, pSourceType : Win32cr::Foundation::PWSTR, pAccountId : Win32cr::Foundation::PWSTR, pRemoteObjectId : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*, ppItem : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_by_remote_id.call(this, pSourceType, pAccountId, pRemoteObjectId, ppItem)
    end

  end

  @[Extern]
  record IContactAggregationAggregateVtbl,
    query_interface : Proc(IContactAggregationAggregate*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactAggregationAggregate*, UInt32),
    release : Proc(IContactAggregationAggregate*, UInt32),
    save : Proc(IContactAggregationAggregate*, Win32cr::Foundation::HRESULT),
    get_component_items : Proc(IContactAggregationAggregate*, Void**, Win32cr::Foundation::HRESULT),
    link : Proc(IContactAggregationAggregate*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_Groups : Proc(IContactAggregationAggregate*, Win32cr::System::Contacts::CONTACT_AGGREGATION_COLLECTION_OPTIONS, Void**, Win32cr::Foundation::HRESULT),
    get_AntiLink : Proc(IContactAggregationAggregate*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_AntiLink : Proc(IContactAggregationAggregate*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_FavoriteOrder : Proc(IContactAggregationAggregate*, UInt32*, Win32cr::Foundation::HRESULT),
    put_FavoriteOrder : Proc(IContactAggregationAggregate*, UInt32, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IContactAggregationAggregate*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactAggregationAggregate, lpVtbl : IContactAggregationAggregateVtbl* do
    GUID = LibC::GUID.new(0x7ed1c814_u32, 0xcd30_u16, 0x43c8_u16, StaticArray[0x9b_u8, 0x8d_u8, 0x2e_u8, 0x48_u8, 0x9e_u8, 0x53_u8, 0xd5_u8, 0x4b_u8])
    def query_interface(this : IContactAggregationAggregate*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactAggregationAggregate*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactAggregationAggregate*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def save(this : IContactAggregationAggregate*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def get_component_items(this : IContactAggregationAggregate*, pComponentItems : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_component_items.call(this, pComponentItems)
    end
    def link(this : IContactAggregationAggregate*, pAggregateId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.link.call(this, pAggregateId)
    end
    def get_Groups(this : IContactAggregationAggregate*, options : Win32cr::System::Contacts::CONTACT_AGGREGATION_COLLECTION_OPTIONS, ppGroups : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Groups.call(this, options, ppGroups)
    end
    def get_AntiLink(this : IContactAggregationAggregate*, ppAntiLink : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AntiLink.call(this, ppAntiLink)
    end
    def put_AntiLink(this : IContactAggregationAggregate*, pAntiLink : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AntiLink.call(this, pAntiLink)
    end
    def get_FavoriteOrder(this : IContactAggregationAggregate*, pFavoriteOrder : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FavoriteOrder.call(this, pFavoriteOrder)
    end
    def put_FavoriteOrder(this : IContactAggregationAggregate*, favoriteOrder : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FavoriteOrder.call(this, favoriteOrder)
    end
    def get_Id(this : IContactAggregationAggregate*, ppItemId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, ppItemId)
    end

  end

  @[Extern]
  record IContactAggregationAggregateCollectionVtbl,
    query_interface : Proc(IContactAggregationAggregateCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactAggregationAggregateCollection*, UInt32),
    release : Proc(IContactAggregationAggregateCollection*, UInt32),
    find_first : Proc(IContactAggregationAggregateCollection*, Void**, Win32cr::Foundation::HRESULT),
    find_first_by_anti_link_id : Proc(IContactAggregationAggregateCollection*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    find_next : Proc(IContactAggregationAggregateCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IContactAggregationAggregateCollection*, Int32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactAggregationAggregateCollection, lpVtbl : IContactAggregationAggregateCollectionVtbl* do
    GUID = LibC::GUID.new(0x2359f3a6_u32, 0x3a68_u16, 0x40af_u16, StaticArray[0x98_u8, 0xdb_u8, 0xf_u8, 0x9e_u8, 0xb1_u8, 0x43_u8, 0xc3_u8, 0xbb_u8])
    def query_interface(this : IContactAggregationAggregateCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactAggregationAggregateCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactAggregationAggregateCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def find_first(this : IContactAggregationAggregateCollection*, ppAggregate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first.call(this, ppAggregate)
    end
    def find_first_by_anti_link_id(this : IContactAggregationAggregateCollection*, pAntiLinkId : Win32cr::Foundation::PWSTR, ppAggregate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_by_anti_link_id.call(this, pAntiLinkId, ppAggregate)
    end
    def find_next(this : IContactAggregationAggregateCollection*, ppAggregate : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_next.call(this, ppAggregate)
    end
    def get_Count(this : IContactAggregationAggregateCollection*, pCount : Int32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pCount)
    end

  end

  @[Extern]
  record IContactAggregationGroupVtbl,
    query_interface : Proc(IContactAggregationGroup*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactAggregationGroup*, UInt32),
    release : Proc(IContactAggregationGroup*, UInt32),
    delete : Proc(IContactAggregationGroup*, Win32cr::Foundation::HRESULT),
    save : Proc(IContactAggregationGroup*, Win32cr::Foundation::HRESULT),
    add : Proc(IContactAggregationGroup*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    remove : Proc(IContactAggregationGroup*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_Members : Proc(IContactAggregationGroup*, Void**, Win32cr::Foundation::HRESULT),
    get_GlobalObjectId : Proc(IContactAggregationGroup*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    put_GlobalObjectId : Proc(IContactAggregationGroup*, LibC::GUID*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IContactAggregationGroup*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_Name : Proc(IContactAggregationGroup*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_Name : Proc(IContactAggregationGroup*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactAggregationGroup, lpVtbl : IContactAggregationGroupVtbl* do
    GUID = LibC::GUID.new(0xc93c545f_u32, 0x1284_u16, 0x499b_u16, StaticArray[0x96_u8, 0xaf_u8, 0x7_u8, 0x37_u8, 0x2a_u8, 0xf4_u8, 0x73_u8, 0xe0_u8])
    def query_interface(this : IContactAggregationGroup*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactAggregationGroup*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactAggregationGroup*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def delete(this : IContactAggregationGroup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def save(this : IContactAggregationGroup*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def add(this : IContactAggregationGroup*, pAggregateId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.add.call(this, pAggregateId)
    end
    def remove(this : IContactAggregationGroup*, pAggregateId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.remove.call(this, pAggregateId)
    end
    def get_Members(this : IContactAggregationGroup*, ppAggregateContactCollection : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Members.call(this, ppAggregateContactCollection)
    end
    def get_GlobalObjectId(this : IContactAggregationGroup*, pGlobalObjectId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GlobalObjectId.call(this, pGlobalObjectId)
    end
    def put_GlobalObjectId(this : IContactAggregationGroup*, pGlobalObjectId : LibC::GUID*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GlobalObjectId.call(this, pGlobalObjectId)
    end
    def get_Id(this : IContactAggregationGroup*, ppItemId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, ppItemId)
    end
    def get_Name(this : IContactAggregationGroup*, ppName : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Name.call(this, ppName)
    end
    def put_Name(this : IContactAggregationGroup*, pName : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Name.call(this, pName)
    end

  end

  @[Extern]
  record IContactAggregationGroupCollectionVtbl,
    query_interface : Proc(IContactAggregationGroupCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactAggregationGroupCollection*, UInt32),
    release : Proc(IContactAggregationGroupCollection*, UInt32),
    find_first : Proc(IContactAggregationGroupCollection*, Void**, Win32cr::Foundation::HRESULT),
    find_first_by_global_object_id : Proc(IContactAggregationGroupCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    find_next : Proc(IContactAggregationGroupCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IContactAggregationGroupCollection*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactAggregationGroupCollection, lpVtbl : IContactAggregationGroupCollectionVtbl* do
    GUID = LibC::GUID.new(0x20a19a9c_u32, 0xd2f3_u16, 0x4b83_u16, StaticArray[0x91_u8, 0x43_u8, 0xbe_u8, 0xff_u8, 0xd2_u8, 0xcc_u8, 0x22_u8, 0x6d_u8])
    def query_interface(this : IContactAggregationGroupCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactAggregationGroupCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactAggregationGroupCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def find_first(this : IContactAggregationGroupCollection*, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first.call(this, ppGroup)
    end
    def find_first_by_global_object_id(this : IContactAggregationGroupCollection*, pGlobalObjectId : LibC::GUID*, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_by_global_object_id.call(this, pGlobalObjectId, ppGroup)
    end
    def find_next(this : IContactAggregationGroupCollection*, ppGroup : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_next.call(this, ppGroup)
    end
    def get_Count(this : IContactAggregationGroupCollection*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pCount)
    end

  end

  @[Extern]
  record IContactAggregationLinkVtbl,
    query_interface : Proc(IContactAggregationLink*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactAggregationLink*, UInt32),
    release : Proc(IContactAggregationLink*, UInt32),
    delete : Proc(IContactAggregationLink*, Win32cr::Foundation::HRESULT),
    save : Proc(IContactAggregationLink*, Win32cr::Foundation::HRESULT),
    get_AccountId : Proc(IContactAggregationLink*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_AccountId : Proc(IContactAggregationLink*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IContactAggregationLink*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_IsLinkResolved : Proc(IContactAggregationLink*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_IsLinkResolved : Proc(IContactAggregationLink*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_NetworkSourceIdString : Proc(IContactAggregationLink*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_NetworkSourceIdString : Proc(IContactAggregationLink*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_RemoteObjectId : Proc(IContactAggregationLink*, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB**, Win32cr::Foundation::HRESULT),
    put_RemoteObjectId : Proc(IContactAggregationLink*, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*, Win32cr::Foundation::HRESULT),
    get_ServerPerson : Proc(IContactAggregationLink*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_ServerPerson : Proc(IContactAggregationLink*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_ServerPersonBaseline : Proc(IContactAggregationLink*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_ServerPersonBaseline : Proc(IContactAggregationLink*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_SyncIdentityHash : Proc(IContactAggregationLink*, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB**, Win32cr::Foundation::HRESULT),
    put_SyncIdentityHash : Proc(IContactAggregationLink*, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactAggregationLink, lpVtbl : IContactAggregationLinkVtbl* do
    GUID = LibC::GUID.new(0xb6813323_u32, 0xa183_u16, 0x4654_u16, StaticArray[0x86_u8, 0x27_u8, 0x79_u8, 0xb3_u8, 0xd_u8, 0xe3_u8, 0xa0_u8, 0xec_u8])
    def query_interface(this : IContactAggregationLink*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactAggregationLink*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactAggregationLink*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def delete(this : IContactAggregationLink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def save(this : IContactAggregationLink*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def get_AccountId(this : IContactAggregationLink*, ppAccountId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AccountId.call(this, ppAccountId)
    end
    def put_AccountId(this : IContactAggregationLink*, pAccountId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AccountId.call(this, pAccountId)
    end
    def get_Id(this : IContactAggregationLink*, ppItemId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, ppItemId)
    end
    def get_IsLinkResolved(this : IContactAggregationLink*, pIsLinkResolved : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsLinkResolved.call(this, pIsLinkResolved)
    end
    def put_IsLinkResolved(this : IContactAggregationLink*, isLinkResolved : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsLinkResolved.call(this, isLinkResolved)
    end
    def get_NetworkSourceIdString(this : IContactAggregationLink*, ppNetworkSourceId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_NetworkSourceIdString.call(this, ppNetworkSourceId)
    end
    def put_NetworkSourceIdString(this : IContactAggregationLink*, pNetworkSourceId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_NetworkSourceIdString.call(this, pNetworkSourceId)
    end
    def get_RemoteObjectId(this : IContactAggregationLink*, ppRemoteObjectId : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_RemoteObjectId.call(this, ppRemoteObjectId)
    end
    def put_RemoteObjectId(this : IContactAggregationLink*, pRemoteObjectId : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_RemoteObjectId.call(this, pRemoteObjectId)
    end
    def get_ServerPerson(this : IContactAggregationLink*, ppServerPersonId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServerPerson.call(this, ppServerPersonId)
    end
    def put_ServerPerson(this : IContactAggregationLink*, pServerPersonId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServerPerson.call(this, pServerPersonId)
    end
    def get_ServerPersonBaseline(this : IContactAggregationLink*, ppServerPersonId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ServerPersonBaseline.call(this, ppServerPersonId)
    end
    def put_ServerPersonBaseline(this : IContactAggregationLink*, pServerPersonId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ServerPersonBaseline.call(this, pServerPersonId)
    end
    def get_SyncIdentityHash(this : IContactAggregationLink*, ppSyncIdentityHash : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_SyncIdentityHash.call(this, ppSyncIdentityHash)
    end
    def put_SyncIdentityHash(this : IContactAggregationLink*, pSyncIdentityHash : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_SyncIdentityHash.call(this, pSyncIdentityHash)
    end

  end

  @[Extern]
  record IContactAggregationLinkCollectionVtbl,
    query_interface : Proc(IContactAggregationLinkCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactAggregationLinkCollection*, UInt32),
    release : Proc(IContactAggregationLinkCollection*, UInt32),
    find_first : Proc(IContactAggregationLinkCollection*, Void**, Win32cr::Foundation::HRESULT),
    find_first_by_remote_id : Proc(IContactAggregationLinkCollection*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::PWSTR, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*, Void**, Win32cr::Foundation::HRESULT),
    find_next : Proc(IContactAggregationLinkCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IContactAggregationLinkCollection*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactAggregationLinkCollection, lpVtbl : IContactAggregationLinkCollectionVtbl* do
    GUID = LibC::GUID.new(0xf8bc0e93_u32, 0xfb55_u16, 0x4f28_u16, StaticArray[0xb9_u8, 0xfa_u8, 0xb1_u8, 0xc2_u8, 0x74_u8, 0x15_u8, 0x32_u8, 0x92_u8])
    def query_interface(this : IContactAggregationLinkCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactAggregationLinkCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactAggregationLinkCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def find_first(this : IContactAggregationLinkCollection*, ppServerContactLink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first.call(this, ppServerContactLink)
    end
    def find_first_by_remote_id(this : IContactAggregationLinkCollection*, pSourceType : Win32cr::Foundation::PWSTR, pAccountId : Win32cr::Foundation::PWSTR, pRemoteId : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*, ppServerContactLink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_by_remote_id.call(this, pSourceType, pAccountId, pRemoteId, ppServerContactLink)
    end
    def find_next(this : IContactAggregationLinkCollection*, ppServerContactLink : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_next.call(this, ppServerContactLink)
    end
    def get_Count(this : IContactAggregationLinkCollection*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pCount)
    end

  end

  @[Extern]
  record IContactAggregationServerPersonVtbl,
    query_interface : Proc(IContactAggregationServerPerson*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactAggregationServerPerson*, UInt32),
    release : Proc(IContactAggregationServerPerson*, UInt32),
    delete : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::HRESULT),
    save : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::HRESULT),
    get_AggregateId : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_AggregateId : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_AntiLink : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_AntiLink : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_AntiLinkBaseline : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_AntiLinkBaseline : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_FavoriteOrder : Proc(IContactAggregationServerPerson*, UInt32*, Win32cr::Foundation::HRESULT),
    put_FavoriteOrder : Proc(IContactAggregationServerPerson*, UInt32, Win32cr::Foundation::HRESULT),
    get_FavoriteOrderBaseline : Proc(IContactAggregationServerPerson*, UInt32*, Win32cr::Foundation::HRESULT),
    put_FavoriteOrderBaseline : Proc(IContactAggregationServerPerson*, UInt32, Win32cr::Foundation::HRESULT),
    get_Groups : Proc(IContactAggregationServerPerson*, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB**, Win32cr::Foundation::HRESULT),
    put_Groups : Proc(IContactAggregationServerPerson*, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*, Win32cr::Foundation::HRESULT),
    get_GroupsBaseline : Proc(IContactAggregationServerPerson*, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB**, Win32cr::Foundation::HRESULT),
    put_GroupsBaseline : Proc(IContactAggregationServerPerson*, Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*, Win32cr::Foundation::HRESULT),
    get_Id : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    get_IsTombstone : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::BOOL*, Win32cr::Foundation::HRESULT),
    put_IsTombstone : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::BOOL, Win32cr::Foundation::HRESULT),
    get_LinkedAggregateId : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_LinkedAggregateId : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT),
    get_ObjectId : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::PWSTR*, Win32cr::Foundation::HRESULT),
    put_ObjectId : Proc(IContactAggregationServerPerson*, Win32cr::Foundation::PWSTR, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactAggregationServerPerson, lpVtbl : IContactAggregationServerPersonVtbl* do
    GUID = LibC::GUID.new(0x7fdc3d4b_u32, 0x1b82_u16, 0x4334_u16, StaticArray[0x85_u8, 0xc5_u8, 0x25_u8, 0x18_u8, 0x4e_u8, 0xe5_u8, 0xa5_u8, 0xf2_u8])
    def query_interface(this : IContactAggregationServerPerson*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactAggregationServerPerson*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactAggregationServerPerson*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def delete(this : IContactAggregationServerPerson*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.delete.call(this)
    end
    def save(this : IContactAggregationServerPerson*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.save.call(this)
    end
    def get_AggregateId(this : IContactAggregationServerPerson*, ppAggregateId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AggregateId.call(this, ppAggregateId)
    end
    def put_AggregateId(this : IContactAggregationServerPerson*, pAggregateId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AggregateId.call(this, pAggregateId)
    end
    def get_AntiLink(this : IContactAggregationServerPerson*, ppAntiLink : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AntiLink.call(this, ppAntiLink)
    end
    def put_AntiLink(this : IContactAggregationServerPerson*, pAntiLink : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AntiLink.call(this, pAntiLink)
    end
    def get_AntiLinkBaseline(this : IContactAggregationServerPerson*, ppAntiLink : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_AntiLinkBaseline.call(this, ppAntiLink)
    end
    def put_AntiLinkBaseline(this : IContactAggregationServerPerson*, pAntiLink : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_AntiLinkBaseline.call(this, pAntiLink)
    end
    def get_FavoriteOrder(this : IContactAggregationServerPerson*, pFavoriteOrder : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FavoriteOrder.call(this, pFavoriteOrder)
    end
    def put_FavoriteOrder(this : IContactAggregationServerPerson*, favoriteOrder : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FavoriteOrder.call(this, favoriteOrder)
    end
    def get_FavoriteOrderBaseline(this : IContactAggregationServerPerson*, pFavoriteOrder : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_FavoriteOrderBaseline.call(this, pFavoriteOrder)
    end
    def put_FavoriteOrderBaseline(this : IContactAggregationServerPerson*, favoriteOrder : UInt32) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_FavoriteOrderBaseline.call(this, favoriteOrder)
    end
    def get_Groups(this : IContactAggregationServerPerson*, pGroups : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Groups.call(this, pGroups)
    end
    def put_Groups(this : IContactAggregationServerPerson*, pGroups : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_Groups.call(this, pGroups)
    end
    def get_GroupsBaseline(this : IContactAggregationServerPerson*, ppGroups : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_GroupsBaseline.call(this, ppGroups)
    end
    def put_GroupsBaseline(this : IContactAggregationServerPerson*, pGroups : Win32cr::System::Contacts::CONTACT_AGGREGATION_BLOB*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_GroupsBaseline.call(this, pGroups)
    end
    def get_Id(this : IContactAggregationServerPerson*, ppId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Id.call(this, ppId)
    end
    def get_IsTombstone(this : IContactAggregationServerPerson*, pIsTombstone : Win32cr::Foundation::BOOL*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_IsTombstone.call(this, pIsTombstone)
    end
    def put_IsTombstone(this : IContactAggregationServerPerson*, isTombstone : Win32cr::Foundation::BOOL) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_IsTombstone.call(this, isTombstone)
    end
    def get_LinkedAggregateId(this : IContactAggregationServerPerson*, ppLinkedAggregateId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_LinkedAggregateId.call(this, ppLinkedAggregateId)
    end
    def put_LinkedAggregateId(this : IContactAggregationServerPerson*, pLinkedAggregateId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_LinkedAggregateId.call(this, pLinkedAggregateId)
    end
    def get_ObjectId(this : IContactAggregationServerPerson*, ppObjectId : Win32cr::Foundation::PWSTR*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_ObjectId.call(this, ppObjectId)
    end
    def put_ObjectId(this : IContactAggregationServerPerson*, pObjectId : Win32cr::Foundation::PWSTR) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.put_ObjectId.call(this, pObjectId)
    end

  end

  @[Extern]
  record IContactAggregationServerPersonCollectionVtbl,
    query_interface : Proc(IContactAggregationServerPersonCollection*, LibC::GUID*, Void**, Win32cr::Foundation::HRESULT),
    add_ref : Proc(IContactAggregationServerPersonCollection*, UInt32),
    release : Proc(IContactAggregationServerPersonCollection*, UInt32),
    find_first : Proc(IContactAggregationServerPersonCollection*, Void**, Win32cr::Foundation::HRESULT),
    find_first_by_server_id : Proc(IContactAggregationServerPersonCollection*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    find_first_by_aggregate_id : Proc(IContactAggregationServerPersonCollection*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    find_first_by_linked_aggregate_id : Proc(IContactAggregationServerPersonCollection*, Win32cr::Foundation::PWSTR, Void**, Win32cr::Foundation::HRESULT),
    find_next : Proc(IContactAggregationServerPersonCollection*, Void**, Win32cr::Foundation::HRESULT),
    get_Count : Proc(IContactAggregationServerPersonCollection*, UInt32*, Win32cr::Foundation::HRESULT)


  @[Extern]
  record IContactAggregationServerPersonCollection, lpVtbl : IContactAggregationServerPersonCollectionVtbl* do
    GUID = LibC::GUID.new(0x4f730a4a_u32, 0x6604_u16, 0x47b6_u16, StaticArray[0xa9_u8, 0x87_u8, 0x66_u8, 0x9e_u8, 0xcf_u8, 0x1e_u8, 0x57_u8, 0x51_u8])
    def query_interface(this : IContactAggregationServerPersonCollection*, riid : LibC::GUID*, ppvObject : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.query_interface.call(this, riid, ppvObject)
    end
    def add_ref(this : IContactAggregationServerPersonCollection*) : UInt32
      @lpVtbl.try &.value.add_ref.call(this)
    end
    def release(this : IContactAggregationServerPersonCollection*) : UInt32
      @lpVtbl.try &.value.release.call(this)
    end
    def find_first(this : IContactAggregationServerPersonCollection*, ppServerPerson : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first.call(this, ppServerPerson)
    end
    def find_first_by_server_id(this : IContactAggregationServerPersonCollection*, pServerId : Win32cr::Foundation::PWSTR, ppServerPerson : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_by_server_id.call(this, pServerId, ppServerPerson)
    end
    def find_first_by_aggregate_id(this : IContactAggregationServerPersonCollection*, pAggregateId : Win32cr::Foundation::PWSTR, ppServerPerson : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_by_aggregate_id.call(this, pAggregateId, ppServerPerson)
    end
    def find_first_by_linked_aggregate_id(this : IContactAggregationServerPersonCollection*, pAggregateId : Win32cr::Foundation::PWSTR, ppServerPerson : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_first_by_linked_aggregate_id.call(this, pAggregateId, ppServerPerson)
    end
    def find_next(this : IContactAggregationServerPersonCollection*, ppServerPerson : Void**) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.find_next.call(this, ppServerPerson)
    end
    def get_Count(this : IContactAggregationServerPersonCollection*, pCount : UInt32*) : Win32cr::Foundation::HRESULT
      @lpVtbl.try &.value.get_Count.call(this, pCount)
    end

  end

end