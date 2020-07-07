class Page < ApplicationRecord
  belongs_to :notebook
  has_many :paragraphs
  has_many :image_elements
  has_many :checklists
end
