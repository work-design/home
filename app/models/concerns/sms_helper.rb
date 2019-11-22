module SmsHelper

  def self.send(mobile, vars = {})
    url = 'https://api.mysubmail.com/message/xsend'
    body = {
      appid: CREDENT.dig(:sms, :appid),
      sign_type: 'normal',
      signature: CREDENT.dig(:sms, :signature),
      to: mobile,
      vars: vars,
      project: '6aGCz3'
    }

    HTTPX.post(url, body: body.to_json)
  end

  def self.quota
    host = 'https://api.mysubmail.com/'
    url = "#{host}balance/sms"
    options = {
      appid: CREDENT.dig(:sms, :appid),
      sign_type: 'normal',
      signature: CREDENT.dig(:sms, :signature)
    }

    HTTPX.post(url, body: options.to_json)
  end


end
