class Post < ApplicationRecord
  include RailsDetail::Post
  include RailsWechat::Post
  include RailsQuip::Post
  
end
