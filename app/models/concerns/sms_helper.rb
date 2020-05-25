module SmsHelper
  APPID = Rails.application.credentials.dig(:sms, :appid)
  SIGNATURE = Rails.application.credentials.dig(:sms, :signature)

  def self.send(mobile, vars = {})
    url = 'https://api.mysubmail.com/message/xsend'
    body = {
      appid: APPID,
      sign_type: 'normal',
      signature: SIGNATURE,
      to: mobile,
      vars: vars,
      project: '6aGCz3'
    }

    HTTPX.post(url, json: body)
  end

  def self.quota
    host = 'https://api.mysubmail.com/'
    url = "#{host}balance/sms"
    options = {
      appid: APPID,
      sign_type: 'normal',
      signature: SIGNATURE
    }

    HTTPX.post(url, form: options)
  end


end
