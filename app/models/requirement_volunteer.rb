class RequirementVolunteer < ApplicationRecord
  attribute :state, :string


  belongs_to :requirement, counter_cache: true
  belongs_to :volunteer, class_name: 'User'


end
