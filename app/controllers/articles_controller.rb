class ArticlesController < ResourcesController
  actions :index, :show, :destroy

  def show
    set_meta_tags title: @article.title,
                  description: @article.description,
                  keywords: @article.keywords
  end

  protected

  def collection
    @articles ||= end_of_association_chain.newest.limit(10)
  end
end
