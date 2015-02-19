class HomeController < ApplicationController
  load_and_authorize_resource :news_item, parent: false, only: [:index]
  def index
    @news_items = @news_items.active.limit(4).newest.decorate
    @user_request = UserRequest.new
    try_to_set_meta_tags title: Settings.home_page_meta_title,
                  description: Settings.home_page_meta_description,
                  keywords:    Settings.home_page_keywords

  end

  def about
    @about_page = ContentPage.find_or_create_by(page_url: 'about')
    fill_meta_info @about_page
  end

  def dealers
    @dealers_page = ContentPage.find_or_create_by(page_url: 'dealers')
    @dealer_request = DealerRequest.new
    fill_meta_info @dealers_page
  end

  def contacts
    if session[:no_city_office]
      redirect_to :contacts_nooffice
    else
      redirect_to @nearest_office
    end
  end

  def contacts_nooffice
    @city_name = session[:user_city]
    @contacts_page = ContentPage.find_or_create_by(page_url: 'contacts_nooffice')
  end

end
