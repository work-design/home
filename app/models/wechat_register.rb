class WechatRegister < ApplicationRecord
  include RailsWechat::WechatRegister
  include RailsBench::Tasking
end
