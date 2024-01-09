class Admin::NewsController < ApplicationController
  layout 'admin'
def index
    @news = News.all
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
