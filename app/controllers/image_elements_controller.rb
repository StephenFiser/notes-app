class ImageElementsController < ApplicationController
  before_action :authenticate_user!

  def create
    notebook = current_user.notebooks.find(params[:notebook_id])
    page = notebook.pages.find(params[:page_id])
    page.image_elements.create
    redirect_to notebook_page_path(notebook, page)
  end

  def update
    notebook = current_user.notebooks.find(params[:notebook_id])
    page = notebook.pages.find(params[:page_id])
    image_element = page.image_elements.find(params[:id])
    if image_element.image.attach(image_element_params[:image])
      redirect_to notebook_page_path(notebook, page)
    else
      render :edit
    end
  end

  def image_element_params
    params.require(:image_element).permit(:image)
  end

end
