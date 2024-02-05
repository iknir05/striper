class Admin::SlidersController < AdminController

  
  def index
    @sliders = Slider.paginate(page: params[:page], per_page: 10).order("created_at ASC")
  end

  def show
    @slider = Slider.find(params[:id])
  end

  def new
    @slider =Slider.new
    @action = "create"  
  end

  def create
    @slider = Slider.new(sliders_params)

    if @slider.save
        flash[:notice] = "New Slider created successfully"
        redirect_to admin_sliders_path
    else
      render 'new'
    end
  end

  def edit
    @slider = Slider.find(params[:id])
    @action = "update"
  end

  def update
    @slider = Slider.find(params[:id])

    if @slider.update(sliders_params)
        flash[:notice] = "New slider updated successfully"
        redirect_to admin_sliders_path
    else
      render 'edit'
    end
  end

  def destroy
    @slider = Slider.find(params[:id])
        if @slider.destroy
          flash[:notice] = "Slider has been successfully deleted"
        end 
        redirect_to admin_sliders_path
  end

  def search_filter
      @sliders = Slider.all

      if params[:search].present?
        @sliders = @sliders.where("title like (?) or description like (?) or button_title like (?) or button_url like (?)", "%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%")
      end  

      @sliders = @sliders.paginate(page: params[:page], per_page: 10).order("created_at DESC")

      respond_to do |format|
        format.js 
      end

  end

  private
  def sliders_params
    params.require(:slider).permit(:slider_image,:title,:description,:button_title,:button_url)
  end
end
