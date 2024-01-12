class Admin::ReviewsController < ApplicationController
  layout 'admin'
  def index
  
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
