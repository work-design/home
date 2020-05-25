RailsRole.configure do |config|
  config.default_admin_accounts = Rails.application.credentials[:admin_email]
end
