class HomeController < ApplicationController
  load_and_authorize_resource :news_item, parent: false
  def index
    @news_items = @news_items.newest.limit(4)
  end
end
