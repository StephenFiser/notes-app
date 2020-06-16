class NotebooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_notebook, only: [:show, :edit, :update, :destroy]
  before_action :set_base_breadcrumbs, only: [:show, :new, :edit]


  # GET /notebooks
  # GET /notebooks.json
  def index
    @notebooks = current_user.notebooks
    add_breadcrumb('Notebooks')
  end

  # GET /notebooks/1
  # GET /notebooks/1.json
  def show
    add_breadcrumb(@notebook.title)
  end

  # GET /notebooks/new
  def new
    @notebook = Notebook.new
    add_breadcrumb('New')
  end

  # GET /notebooks/1/edit
  def edit
    add_breadcrumb(@notebook.title, notebook_path(@notebook))
    add_breadcrumb('Edit')
  end

  # POST /notebooks
  # POST /notebooks.json
  def create
    @notebook = current_user.notebooks.build(notebook_params)

    respond_to do |format|
      if @notebook.save
        format.html { redirect_to @notebook, notice: 'Notebook was successfully created.' }
        format.json { render :show, status: :created, location: @notebook }
      else
        format.html { render :new }
        format.json { render json: @notebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notebooks/1
  # PATCH/PUT /notebooks/1.json
  def update
    respond_to do |format|
      if @notebook.update(notebook_params)
        format.html { redirect_to @notebook, notice: 'Notebook was successfully updated.' }
        format.json { render :show, status: :ok, location: @notebook }
      else
        format.html { render :edit }
        format.json { render json: @notebook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notebooks/1
  # DELETE /notebooks/1.json
  def destroy
    @notebook.destroy
    respond_to do |format|
      format.html { redirect_to notebooks_url, notice: 'Notebook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notebook
      @notebook = current_user.notebooks.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notebook_params
      params.require(:notebook).permit(:title)
    end

    def set_base_breadcrumbs
      add_breadcrumb('Notebooks', notebooks_path)
    end
end
