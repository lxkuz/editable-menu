class HomeController < ApplicationController
  load_and_authorize_resource :news_item, parent: false, only: [:index]
  def index
    @news_items = @news_items.limit(4).newest.decorate
    @user_request = UserRequest.new
  end

  def about
  end
end
