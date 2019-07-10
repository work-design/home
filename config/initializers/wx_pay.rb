WxPay.appid = Rails.application.credentials.dig(Rails.env.to_sym, :wechat, :appid)
WxPay.key = Rails.application.credentials.dig(Rails.env.to_sym, :wxpay, :key)
WxPay.mch_id = Rails.application.credentials.dig(Rails.env.to_sym, :wxpay, :mch_id)
#
# filepath = File.expand_path('../config/apiclient_cert.p12', __dir__)
# WxPay.set_apiclient_by_pkcs12(File.read(filepath), WxPay.mch_id)
#
# WxPay.extra_rest_client_options = { timeout: 2, open_timeout: 3 }
