class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index,:contact,:about]
  def index
    @enquiry = Enquiry.new
  end

  def blogs
    @enquiry = Enquiry.new
  end

  def about
    @enquiry = Enquiry.new
  end

  def services
    @enquiry = Enquiry.new
  end

  def blog_details
    @enquiry = Enquiry.new
    @blog = Blog.find_by(title: params[:title])
  end

  def create
    @msg = "Update Failed!!!"

    @enquiry = Enquiry.new(enquiry_params)

    if @enquiry.save
      @msg = "Form successfully submitted"
    end
  end

  def like_manager
     if BlogLike.find_by(user_id: params[:user_id], blog_id: params[:blog_id]).present? 
      @blog_like = BlogLike.find_by(user_id: params[:user_id], blog_id: params[:blog_id])
      if @blog_like.status == "like"
        @blog_like.status = "unlike"
        @status = "like"
      else
        @blog_like.status = "like"
        @status = "unlike"
      end
      @blog_like.save
     else 
      @blog_like =BlogLike.new
      @blog_like.status = "like"
      @blog_like.blog_id = params[:blog_id]
      @blog_like.user_id = params[:user_id]
      @blog_like.save
      @status = "unlike"
    end
      
    @blog_id  = params[:blog_id]
    
   respond_to do |format|
      format.js 
    end
  end

  def liked_by_users
    @blog_id =  params[:blog_id]
    respond_to do |format|
      format.js 
    end
    
  end

  def unliked_by_users
    @blog_id =  params[:blog_id]
    respond_to do |format|
      format.js 
    end
    
  end

  private
  
  def enquiry_params
    params.require(:enquiry).permit(:first_name,:last_name,:email,:phone_number,:zip_code,:city,:state)
  end

  def blog_likes_params
    params.require(:blog_like).permit(:status,:blog_id,:user_id)
  end
end
