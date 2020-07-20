# frozen_string_literal: true

class ChecklistItemReflex < ApplicationReflex

  def change_status
    checklist_item = ChecklistItem.includes(:checklist).find(element.dataset.id)
    checklist_item.update(status: element.dataset.status)
    morph "#checklist-#{checklist_item.checklist_id}", ApplicationController.render(
      partial: 'checklists/checklist',
      locals: { checklist: checklist_item.checklist }
    )
  end

end
