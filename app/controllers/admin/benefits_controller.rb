class Admin::BenefitsController < AdminController
	

  def index
    @benefits = Benefit.paginate(page: params[:page], per_page: 10).order("created_at ASC")
  end

  def search_filter
      @benefits = Benefit.all

      if params[:search].present?
        @benefits = @benefits.where("title like (?) or description like (?)", "%#{params[:search]}%","%#{params[:search]}%")
      end  

      @benefits = @benefits.paginate(page: params[:page], per_page: 10).order("created_at DESC")

      respond_to do |format|
        format.js 
      end
  end

  def show
    @benefit = Benefit.find(params[:id])
  end

  def new
    @benefit = Benefit.new
    @action = "create"   
  end

  def create
    @benefit = Benefit.new(benefits_params)

    if @benefit.save
      flash[:notice] = "New Benefit item created successfully"
      redirect_to admin_benefits_path
    else
      render 'new'
    end
  end

  def edit
    @benefit = Benefit.find(params[:id])
    @action = "update"   
  end

  def update
    @benefit = Benefit.find(params[:id])

    if @benefit.update(benefits_params)
      flash[:notice] = "New Benefit item updated successfully"
      redirect_to admin_benefits_path
    else
      render 'edit'
    end
  end

  def destroy
    @benefit = Benefit.find(params[:id])
    if @benefit.destroy
        flash[:notice] = "Benefit has been successfully deleted"
    end 
    redirect_to admin_benefits_path
  end

  private

  def benefits_params
    params.require(:benefit).permit(:icon_class,:title,:description)
  end

end
