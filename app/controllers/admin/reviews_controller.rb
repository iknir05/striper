class Admin::ReviewsController < AdminController

  def index
    @reviews = Review.paginate(page: params[:page], per_page: 10).order("created_at ASC")
  end

  def search_filter
      @reviews = Review.all

      if params[:search].present?
        @reviews = @reviews.where("full_name like (?) or country like (?)or description like (?)", "%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%")
      end  

      @reviews = @reviews.paginate(page: params[:page], per_page: 10).order("created_at DESC")

      respond_to do |format|
        format.js 
      end

  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
    @action = "create"   
  end

  def create
    @review = Review.new(reviews_params)

    if @review.save
      flash[:notice] = "New Review item created successfully"
      redirect_to admin_reviews_path
    else
      render 'new'
    end
  end

  def edit
    @review = Review.find(params[:id])
    @action = "update"   
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(reviews_params)
      flash[:notice] = "New Review item updated successfully"
      redirect_to admin_reviews_path
    else
      render 'edit'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
        flash[:notice] = "Review has been successfully deleted"
    end 
    redirect_to admin_reviews_path
  end

  private

  def reviews_params
    params.require(:review).permit(:review_image,:full_name,:country,:description)
  end
end
