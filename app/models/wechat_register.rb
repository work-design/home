class WechatRegister < ApplicationRecord
  include RailsWechat::WechatRegister
  include RailsBenchExt::Tasking
end
