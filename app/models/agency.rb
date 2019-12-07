class Agency < ApplicationRecord
  include RailsAgency::Agency
  include RailsCrm::Agency
end
