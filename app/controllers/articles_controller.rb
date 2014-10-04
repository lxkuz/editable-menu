class ArticlesController < ApplicationController
  def index
    @articles = Article.limit(10)
  end

  def show
    @article = Article.find(params[:id])

    set_meta_tags title: @article.title,
                  description: @article.description,
                  keywords: @article.keywords
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :content, :published_at)
  end
end
