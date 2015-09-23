class Background < ActiveRecord::Base
  belongs_to :patient

  validates  :patient_id, presence: true

  validates  :patient_id, uniqueness: true
end