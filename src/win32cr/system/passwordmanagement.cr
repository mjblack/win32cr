require "../foundation.cr"

@[Link("delayimp")]
@[Link("user32")]
@[Link(ldflags: "/IGNORE:4199")]
@[Link(ldflags: "/DELAYLOAD:advapi32.dll")]
lib LibWin32
  struct CYPHER_BLOCK
    data : CHAR[8]*
  end
  struct LM_OWF_PASSWORD
    data : CYPHER_BLOCK[2]*
  end
  struct SAMPR_ENCRYPTED_USER_PASSWORD
    buffer : UInt8[516]*
  end
  struct ENCRYPTED_LM_OWF_PASSWORD
    data : CYPHER_BLOCK[2]*
  end


  # Params # servername : LibC::LPWSTR [In],username : LibC::LPWSTR [In],lmoldpresent : BOOLEAN [In],lmoldowfpassword : LM_OWF_PASSWORD* [In],lmnewowfpassword : LM_OWF_PASSWORD* [In],ntoldowfpassword : LM_OWF_PASSWORD* [In],ntnewowfpassword : LM_OWF_PASSWORD* [In]
  fun MSChapSrvChangePassword(servername : LibC::LPWSTR, username : LibC::LPWSTR, lmoldpresent : BOOLEAN, lmoldowfpassword : LM_OWF_PASSWORD*, lmnewowfpassword : LM_OWF_PASSWORD*, ntoldowfpassword : LM_OWF_PASSWORD*, ntnewowfpassword : LM_OWF_PASSWORD*) : UInt32

  # Params # servername : LibC::LPWSTR [In],username : LibC::LPWSTR [In],newpasswordencryptedwitholdnt : SAMPR_ENCRYPTED_USER_PASSWORD* [In],oldntowfpasswordencryptedwithnewnt : ENCRYPTED_LM_OWF_PASSWORD* [In],lmpresent : BOOLEAN [In],newpasswordencryptedwitholdlm : SAMPR_ENCRYPTED_USER_PASSWORD* [In],oldlmowfpasswordencryptedwithnewlmornt : ENCRYPTED_LM_OWF_PASSWORD* [In]
  fun MSChapSrvChangePassword2(servername : LibC::LPWSTR, username : LibC::LPWSTR, newpasswordencryptedwitholdnt : SAMPR_ENCRYPTED_USER_PASSWORD*, oldntowfpasswordencryptedwithnewnt : ENCRYPTED_LM_OWF_PASSWORD*, lmpresent : BOOLEAN, newpasswordencryptedwitholdlm : SAMPR_ENCRYPTED_USER_PASSWORD*, oldlmowfpasswordencryptedwithnewlmornt : ENCRYPTED_LM_OWF_PASSWORD*) : UInt32
end
