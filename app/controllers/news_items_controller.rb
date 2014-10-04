class NewsItemsController < ResourcesController
  actions :index

  protected

    def collection
      @news_items = end_of_association_chain.newest.page(params[:page])
    end
end
