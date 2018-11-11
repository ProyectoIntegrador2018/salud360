class Document < ApplicationRecord
  mount_uploader :asset, AssetUploader
  validates :asset, presence: true
end
