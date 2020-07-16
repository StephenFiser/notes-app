class ParagraphsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_paragraph, only: [:update, :destroy]

  # POST /paragraphs
  # POST /paragraphs.json
  def create
    @notebook = current_user.notebooks.find(params[:notebook_id])
    @page = @notebook.pages.find(params[:page_id])
    @page.paragraphs.create
    redirect_to notebook_page_path(@notebook, @page)
  end

  # PATCH/PUT /paragraphs/1
  # PATCH/PUT /paragraphs/1.json
  def update
    @notebook = current_user.notebooks.find(params[:notebook_id])
    @page = @notebook.pages.find(params[:page_id])
    @paragraph = @page.paragraphs.find(params[:id])
    if @paragraph.update(paragraph_params)
      redirect_to notebook_page_path(@notebook, @page), notice: 'Paragraph was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /paragraphs/1
  # DELETE /paragraphs/1.json
  def destroy
    @paragraph.destroy
    respond_to do |format|
      format.html { redirect_to paragraphs_url, notice: 'Paragraph was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paragraph
      @paragraph = Paragraph.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paragraph_params
      params.require(:paragraph).permit(:content)
    end
end
