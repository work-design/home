class Post < ApplicationRecord
  attribute :title, :string
  attribute :code, :string
  include RailsDetail::ContentModel

end
