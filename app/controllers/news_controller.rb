class NewsController < ApplicationController
  before_action :if_not_admin

  def new
    @news = News.new
  end

  def index
    @news = News.all
  end

  def show
    @news = News.find(params[:id])
  end

  def create
    @news = News.new(news_params)
    if @news.save
      redirect_to news_index_path
    else
      render ("news/new")
    end
  end

  def edit
    @news = News.find(params[:id])

  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
     redirect_to news_path(@news)
   else
     render ("news/edit")
   end
  end

  def destroy
    news = News.find(params[:id])
    news.destroy
    redirect_to news_index_path
  end






private
  def news_params
    params.require(:news).permit(:message, :creation_date, affiliation_ids: [])
  end

  def if_not_admin
    redirect_to top_path unless current_user.is_admin?
  end

end