class NewsItemsController < ResourcesController
  actions :index, :show

  def show
    super do
      @last_news = NewsItem.last_news(params[:id]).decorate
      @news_item = @news_item.decorate
      set_meta_tags title:       @news_item.title,
                    description: @news_item.description,
                    keywords:    @news_item.keywords
    end
  end

  protected

    def collection
      @news_items = end_of_association_chain.newest.page(params[:page]).decorate
    end
end
