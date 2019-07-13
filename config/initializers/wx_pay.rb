WxPay.appid = CREDENT.dig(:wechat, :appid)
WxPay.key = CREDENT.dig(:wxpay, :key)
WxPay.mch_id = CREDENT.dig(:wxpay, :mch_id)
#
# filepath = File.expand_path('../config/apiclient_cert.p12', __dir__)
# WxPay.set_apiclient_by_pkcs12(File.read(filepath), WxPay.mch_id)
#
# WxPay.extra_rest_client_options = { timeout: 2, open_timeout: 3 }
