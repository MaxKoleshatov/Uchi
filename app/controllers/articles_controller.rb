class ArticlesController < ApplicationController
  def index
    @articles = Article.all       
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def articles_params
    params.require(:article).permit(:title, :body)
  end
end