class Admin::NewsController < AdminController

  def index
    @news = News.paginate(page: params[:page], per_page: 10).order("created_at ASC")
  end

  def search_filter
      @news = News.all

      if params[:search].present?
        @news = @news.where("description like (?) or url like (?)", "%#{params[:search]}%","%#{params[:search]}%")
      end  

      @news = @news.paginate(page: params[:page], per_page: 10).order("created_at DESC")

      respond_to do |format|
        format.js 
      end

  end

  def show
    @news = News.find(params[:id])
  end

  def new
    @news = News.new
    @action = "create"   
  end

  def create
    @news = News.new(news_params)

    if @news.save
      flash[:notice] = "New News created successfully"
      redirect_to admin_news_index_path
    else
      render 'new'
    end
  end

  def edit
    @news = News.find(params[:id])
    @action = "update"   
  end

  def update
    @news = News.find(params[:id])

    if @news.update(news_params)
      flash[:notice] = "New News item updated successfully"
      redirect_to admin_news_index_path
    else
      render 'edit'
    end
  end

  def destroy
    @news = News.find(params[:id])
    if @news.destroy
        flash[:notice] = "News has been successfully deleted"
    end 
    redirect_to admin_news_index_path
  end

  private

  def news_params
    params.require(:news).permit(:news_image,:description,:url)
  end
end
