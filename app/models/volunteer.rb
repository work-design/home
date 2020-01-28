class Volunteer < ApplicationRecord
  attribute :name, :string
  attribute :mobile, :string
  attribute :place, :string

  has_many :requirement_volunteers, dependent: :delete_all
  has_many :requirements, through: :requirement_volunteers

end
