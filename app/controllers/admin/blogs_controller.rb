class Admin::BlogsController < AdminController

  def index
    @blogs = Blog.paginate(page: params[:page], per_page: 10).order("created_at ASC")
  end

  def search_filter
      @blogs = Blog.all

      if params[:search].present?
        @blogs = @blogs.where("title like (?) or description like (?) or publish_date like (?)or author like (?)or slug like (?)", "%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%")
      end  

      @blogs = @blogs.paginate(page: params[:page], per_page: 10).order("created_at DESC")

      respond_to do |format|
        format.js 
      end

  end  

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
    @action = "create"   
  end

  def create
    @blog = Blog.new(blogs_params)

    if @blog.save
      flash[:notice] = "New Blog item created successfully"
      redirect_to admin_blogs_path
    else
      render 'new'
    end
  end

  def edit
    @blog = Blog.find(params[:id])
    @action = "update"   
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update(blogs_params)
      flash[:notice] = "New Blog item updated successfully"
      redirect_to admin_blogs_path
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
        flash[:notice] = "Blog has been successfully deleted"
    end 
    redirect_to admin_blogs_path
  end

  private

  def blogs_params
    params.require(:blog).permit(:image,:title,:description,:publish_date,:author,:slug)
  end

end
