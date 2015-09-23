class Patient < ActiveRecord::Base
  has_one   :background, :dependent => :destroy
  has_many  :laboratories, :dependent => :destroy
  has_many  :pregnancies, :dependent => :destroy

  accepts_nested_attributes_for :background


  validates :nombre, presence: true
  validates :apellido, presence: true
  validates :edad, presence: true
  validates :direccion, presence: true
  validates :cedula, presence: true

  validates :cedula, uniqueness: true

  mount_uploader :avatar, AvatarUploader
end