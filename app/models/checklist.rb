class Checklist < ApplicationRecord
  belongs_to :page
  has_many :checklist_items

  def new_item
    checklist_items.build
  end

  def percent_complete
    return 0 if total_items == 0
    ((checklist_items.select(&:complete?).count.to_f / total_items) * 100).round
  end

  def percent_in_progress
    return 0 if total_items == 0
    ((checklist_items.select(&:in_progress?).count.to_f / total_items) * 100).round
  end

  def total_items
    @total_items ||= checklist_items.count
  end
end
