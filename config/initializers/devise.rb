Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.saml_create_user = true
  config.saml_update_user = true
  config.saml_default_user_key = :email
  config.saml_session_index_key = :session_index
  config.saml_use_subject = true
  config.idp_settings_adapter = nil
  config.allowed_clock_drift_in_seconds = 5.second
  config.saml_configure do |settings|
    settings.assertion_consumer_service_url     = "https://<sp_host>/users/saml/auth"
    settings.issuer                             = "https://<sp_host>/users/saml/metadata"
    settings.idp_sso_target_url                 = "https://<idp_host>/adfs/ls/idpinitiatedsignon.aspx"
    settings.idp_slo_target_url                 = "https://<idp_host>/adfs/ls/idpinitiatedsignon.aspx"
    settings.idp_cert                           = <<-CERT.chomp
      <Replace text here with your IDP certificate>
    CERT
    settings.name_identifier_format         = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"
  end
end
