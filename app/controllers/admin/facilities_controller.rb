class Admin::FacilitiesController < ApplicationController
  layout 'admin'
  def index
 
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facilities_params)

    if @facility.save
        flash[:notice] = "New Facility created successfully"
        redirect_to admin_facilities_path
    else
      render 'new'
    end

  end

  def edit
    @facility = Facility.find(params[:id])
    @action = "update"
  end

  def update
    @facility = Facility.find(params[:id])

    if @facility.update(facilities_params)
        flash[:notice] = "New facility updated successfully"
        redirect_to admin_facilities_path
    else
      render 'edit'
    end
  end

  def destroy
    @facility = Facility.find(params[:id])
    if @facility.destroy
      flash[:notice] = "Facility has been successfully deleted"
    end 
    redirect_to admin_facilities_path
  end

  private
  def facilities_params
    params.require(:facility).permit(:icon_class,:title)
  end
end
