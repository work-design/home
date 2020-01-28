class Notification < ApplicationRecord
  include RailsNotice::Notification
  include RailsNoticeSend::Socket
  include RailsNoticeSend::Wechat
end
