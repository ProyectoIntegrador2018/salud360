class Dieta < ApplicationRecord
  mount_uploader :dietaPDF, AssetUploader
  validates :dietaPDF, presence: true
end
