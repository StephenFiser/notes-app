# frozen_string_literal: true

class ChecklistItemReflex < ApplicationReflex

  def change_status
    checklist_item = ChecklistItem.find(element.dataset.id)
    checklist_item.update(status: element.dataset.status)
  end

end
