class RequirementVolunteer < ApplicationRecord
  attribute :state, :string


  belongs_to :requirement
  belongs_to :volunteer


end
