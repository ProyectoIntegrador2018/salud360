class Document < ApplicationRecord
  mount_uploader :asset, AssetUploader
end
