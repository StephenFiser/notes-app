class Checklist < ApplicationRecord
  belongs_to :page
  has_many :checklist_items

  def new_item
    checklist_items.build
  end
end
