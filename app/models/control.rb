class Control < ActiveRecord::Base
  belongs_to :pregnancy

  validates  :pregnancy_id, presence: true
end