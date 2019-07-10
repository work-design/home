module SmsHelper

  def self.send(mobile, vars = {})
    url = 'https://api.mysubmail.com/message/xsend'
    body = {
      appid: SETTING.dig(:sms, :appid),
      sign_type: 'normal',
      signature: SETTING.dig(:sms, :signture),
      to: mobile,
      vars: vars,
      project: '6aGCz3'
    }

    HTTParty.post(url, body: body)
  end

  def self.quota
    host = 'https://api.mysubmail.com/'
    url = "#{host}balance/sms"
    options = {
      appid: SETTING.dig(:sms, :appid),
      sign_type: 'normal',
      signature: SETTING.dig(:sms, :signture)
    }

    HTTParty.post(url, body: options)
  end


end
