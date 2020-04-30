Rails.application.config.content_security_policy do |policy|
  policy.default_src :self, :https, :http, :wss, :ws
  policy.font_src :self, :https, :http, :data
  policy.img_src :http, :https, :data
  policy.style_src :self, :https, :http, :unsafe_inline
  policy.script_src :self, :https, :http, :unsafe_inline
  if Rails.env.development?
    policy.connect_src :self, :ws, 'localhost:3100', 'lvh.me:3000'
  end
  policy.report_uri '/csp_violation_report'
end

Rails.configuration.content_security_policy_nonce_directives = ['script-src']
