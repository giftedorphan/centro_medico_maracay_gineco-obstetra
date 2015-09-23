class Pregnancy < ActiveRecord::Base
  belongs_to :patient
  has_many   :controls, :dependent => :destroy
  has_many   :images, :dependent => :destroy

  validates  :patient_id, presence: true

  validates  :status, uniqueness: true, if: :pregnancy_is_true?

  def pregnancy_is_true?
    status == true
  end
end