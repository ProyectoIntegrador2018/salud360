class Dieta < ApplicationRecord
  mount_uploader :dietaPDF, AssetUploader
  validates :dietaPDF, presence: true

  belongs_to :nutriologo
  belongs_to :paciente
end
