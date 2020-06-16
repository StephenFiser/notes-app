class ImageElement < ApplicationRecord
  belongs_to :page
  has_one_attached :image
end
