class NewsItemsController < ResourcesController
  actions :index, :show, :destroy

  def show
    super do
      @last_news = NewsItem.active.last_news(params[:id]).decorate
      @news_item = @news_item.decorate
      fill_meta_info @news_item
    end
  end

  def destroy
    destroy! do |format|
      format.html { redirect_to :back }
    end
  end

  protected

    def collection
      @news_items = end_of_association_chain.active.newest.page(params[:page]).decorate
    end
end
