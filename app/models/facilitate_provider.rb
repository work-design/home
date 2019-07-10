class FacilitateProvider < ApplicationRecord
  
  has_many :pipelines, as: :piping, dependent: :destroy
  has_many :task_templates, as: :tasking, dependent: :nullify



end
