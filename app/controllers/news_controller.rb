class NewsController < ApplicationController
  
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
    @news.update(news_params)
    redirect_to news_path(@news)
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
end