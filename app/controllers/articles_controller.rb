class ArticlesController < ResourcesController
  actions :index, :show, :destroy

  def index
    @articles_page = Article.find_or_create_by(title_translit: 'articles');
    @articles = collection
    set_meta_tags title:       Settings.articles_title,
                  description: Settings.articles_subtitle,
                  keywords:    Settings.articles_keywords
  end

  def show
    @chapters = @article.chapters
    set_meta_tags title: @article.title,
                  description: @article.description,
                  keywords: @article.keywords
  end

  protected

  def collection
    @articles.present? ? @articles.active : end_of_association_chain.active.by_position.limit(10)
  end
end

