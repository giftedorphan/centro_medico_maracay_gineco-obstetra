class Image < ActiveRecord::Base
  belongs_to :pregnancy

  validates  :pregnancy_id, presence: true
  validates  :imagen, presence: true

  mount_uploader :imagen, PregnancyImagesUploader
end