class ChecklistItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_checklist_item, only: [:update, :destroy]

  # POST /checklist_items
  def create
    notebook = current_user.notebooks.find(params[:notebook_id])
    page = notebook.pages.find(params[:page_id])
    checklist = page.checklists.find(params[:checklist_id])
    checklist_item = checklist.checklist_items.new(checklist_item_params)
    checklist_item.status = 'not-started'
    checklist_item.save
    redirect_to notebook_page_path(notebook, page)
  end

  # PATCH/PUT /checklist_items/1
  def update
    if @checklist_item.update(checklist_item_params)
      redirect_to @checklist_item, notice: 'Checklist item was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /checklist_items/1
  def destroy
    notebook = current_user.notebooks.find(params[:notebook_id])
    page = notebook.pages.find(params[:page_id])
    checklist = page.checklists.find(params[:checklist_id])
    checklist_item = checklist.checklist_items.find(params[:id])
    checklist_item.destroy
    redirect_to notebook_page_path(notebook, page)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_checklist_item
      @checklist_item = ChecklistItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def checklist_item_params
      params.require(:checklist_item).permit(:checklist_id, :title, :status)
    end
end
