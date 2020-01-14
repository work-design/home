class Post < ApplicationRecord
  include RailsDetail::Post
  include RailsWechat::Post
  include RailsQuip::Post

  has_many_attached :pictures

end
