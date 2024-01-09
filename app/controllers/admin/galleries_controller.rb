class Admin::GalleriesController < ApplicationController
  layout 'admin'
  
  def index
    @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
    @action = "create"   
  end

  def create
    @gallery = Gallery.new(galleries_params)

    if @gallery.save
      flash[:notice] = "New Gallery item created successfully"
      redirect_to admin_galleries_path
    else
      render 'new'
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
    @action = "update"   
  end

  def update
    @gallery = Gallery.find(params[:id])

    if @gallery.update(galleries_params)
      flash[:notice] = "New Gallery item updated successfully"
      redirect_to admin_galleries_path
    else
      render 'edit'
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    if @gallery.destroy
        flash[:notice] = "Gallery has been successfully deleted"
    end 
    redirect_to admin_galleries_path
  end

  private

  def galleries_params
    params.require(:gallery).permit(:gallery_image)
  end

end
