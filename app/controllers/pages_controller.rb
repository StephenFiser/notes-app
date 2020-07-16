class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notebook
  before_action :set_page, only: [:show, :edit, :update, :destroy]
  before_action :set_base_breadcrumbs, only: [:show, :new, :edit]

  # GET /pages/1
  def show
    add_breadcrumb(@page.title)
    @paragraph = @page.paragraphs.build
    @image_element = @page.image_elements.build
    @checklist = @page.checklists.build
  end

  # GET /pages/new
  def new
    add_breadcrumb('New Page')
    @page = Page.new
  end

  # GET /pages/1/edit
  def edit
    add_breadcrumb(@page.title, notebook_page_path(@notebook, @page))
    add_breadcrumb('Edit')
  end

  # POST /pages
  def create
    @page = @notebook.pages.build(page_params)

    @page.position = @notebook.get_next_page_position

    if @page.save
      redirect_to notebook_page_path(@notebook, @page), notice: 'Page was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /pages/1
  def update
    if @page.update(page_params)
      redirect_to notebook_page_path(@notebook, @page), notice: 'Page was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /pages/1
  def destroy
    @page.destroy
    redirect_to @notebook, notice: 'Page was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # e.g. /notebooks/5/pages
    def set_notebook
      @notebook = current_user.notebooks.find(params[:notebook_id])
    end

    def set_page
      @page = @notebook.pages.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def page_params
      params.require(:page).permit(:title)
    end

    def set_base_breadcrumbs
      add_breadcrumb('Notebooks', notebooks_path)
      add_breadcrumb(@notebook.title, notebook_path(@notebook))
    end
end
