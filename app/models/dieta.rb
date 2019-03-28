class Dieta < ApplicationRecord
  mount_uploader :dietaPDF, AssetUploader
  validates :dietaPDF, presence: true

  has_one :user
end
