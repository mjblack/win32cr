require "./../foundation.cr"

module Win32cr::System::PasswordManagement
  extend self


  @[Extern]
  struct CYPHER_BLOCK
    property data : Win32cr::Foundation::CHAR[8]
    def initialize(@data : Win32cr::Foundation::CHAR[8])
    end
  end

  @[Extern]
  struct LM_OWF_PASSWORD
    property data : Win32cr::System::PasswordManagement::CYPHER_BLOCK[2]
    def initialize(@data : Win32cr::System::PasswordManagement::CYPHER_BLOCK[2])
    end
  end

  @[Extern]
  struct SAMPR_ENCRYPTED_USER_PASSWORD
    property buffer : UInt8[516]
    def initialize(@buffer : UInt8[516])
    end
  end

  @[Extern]
  struct ENCRYPTED_LM_OWF_PASSWORD
    property data : Win32cr::System::PasswordManagement::CYPHER_BLOCK[2]
    def initialize(@data : Win32cr::System::PasswordManagement::CYPHER_BLOCK[2])
    end
  end

  def mSChapSrvChangePassword(server_name : Win32cr::Foundation::PWSTR, user_name : Win32cr::Foundation::PWSTR, lm_old_present : Win32cr::Foundation::BOOLEAN, lm_old_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD*, lm_new_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD*, nt_old_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD*, nt_new_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD*) : UInt32
    C.MSChapSrvChangePassword(server_name, user_name, lm_old_present, lm_old_owf_password, lm_new_owf_password, nt_old_owf_password, nt_new_owf_password)
  end

  def mSChapSrvChangePassword2(server_name : Win32cr::Foundation::PWSTR, user_name : Win32cr::Foundation::PWSTR, new_password_encrypted_with_old_nt : Win32cr::System::PasswordManagement::SAMPR_ENCRYPTED_USER_PASSWORD*, old_nt_owf_password_encrypted_with_new_nt : Win32cr::System::PasswordManagement::ENCRYPTED_LM_OWF_PASSWORD*, lm_present : Win32cr::Foundation::BOOLEAN, new_password_encrypted_with_old_lm : Win32cr::System::PasswordManagement::SAMPR_ENCRYPTED_USER_PASSWORD*, old_lm_owf_password_encrypted_with_new_lm_or_nt : Win32cr::System::PasswordManagement::ENCRYPTED_LM_OWF_PASSWORD*) : UInt32
    C.MSChapSrvChangePassword2(server_name, user_name, new_password_encrypted_with_old_nt, old_nt_owf_password_encrypted_with_new_nt, lm_present, new_password_encrypted_with_old_lm, old_lm_owf_password_encrypted_with_new_lm_or_nt)
  end

  @[Link("advapi32")]
  lib C
    # :nodoc:
    fun MSChapSrvChangePassword(server_name : Win32cr::Foundation::PWSTR, user_name : Win32cr::Foundation::PWSTR, lm_old_present : Win32cr::Foundation::BOOLEAN, lm_old_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD*, lm_new_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD*, nt_old_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD*, nt_new_owf_password : Win32cr::System::PasswordManagement::LM_OWF_PASSWORD*) : UInt32

    # :nodoc:
    fun MSChapSrvChangePassword2(server_name : Win32cr::Foundation::PWSTR, user_name : Win32cr::Foundation::PWSTR, new_password_encrypted_with_old_nt : Win32cr::System::PasswordManagement::SAMPR_ENCRYPTED_USER_PASSWORD*, old_nt_owf_password_encrypted_with_new_nt : Win32cr::System::PasswordManagement::ENCRYPTED_LM_OWF_PASSWORD*, lm_present : Win32cr::Foundation::BOOLEAN, new_password_encrypted_with_old_lm : Win32cr::System::PasswordManagement::SAMPR_ENCRYPTED_USER_PASSWORD*, old_lm_owf_password_encrypted_with_new_lm_or_nt : Win32cr::System::PasswordManagement::ENCRYPTED_LM_OWF_PASSWORD*) : UInt32

  end
end