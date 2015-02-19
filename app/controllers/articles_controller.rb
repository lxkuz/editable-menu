class ArticlesController < ResourcesController
  actions :index, :show, :destroy

  def index
    @articles_page = Article.find_or_create_by(title_translit: 'articles');
    @articles = collection
    try_to_set_meta_tags title:       Settings.articles_title,
                  description: Settings.articles_subtitle,
                  keywords:    Settings.articles_keywords
  end

  def show
    @chapters = @article.chapters
    fill_meta_info @article
  end

  protected

  def collection
    @articles.present? ? @articles.active : end_of_association_chain.active.by_position.limit(10)
  end
end

