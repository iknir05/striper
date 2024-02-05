class Admin::FacilitiesController < AdminController

  def index
    @facilities = Facility.paginate(page: params[:page], per_page: 10).order("created_at ASC")
  end

  def search_filter
      @facilities = Facility.all

      if params[:search].present?
        @facilities = @facilities.where("title like (?)", "%#{params[:search]}%")
      end  

      @facilities = @facilities.paginate(page: params[:page], per_page: 10).order("created_at DESC")

      respond_to do |format|
        format.js 
      end

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
