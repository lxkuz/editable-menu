class HomeController < ApplicationController
  load_and_authorize_resource :news_item, parent: false, only: [:index]
  def index
    @news_items = @news_items.limit(4).newest.decorate
    @user_request = UserRequest.new
    set_meta_tags title:       Settings.home_page_meta_title,
                  description: Settings.home_page_meta_description,
                  keywords:    Settings.home_page_keywords

  end

  def about
    @about_page = ContentPage.find_or_create_by(page_url: 'about');
  end

  def dealers
    @dealers_page = ContentPage.find_or_create_by(page_url: 'dealers');
  end

  def contacts
    if session[:no_city_office]
      redirect_to :contacts_nooffice
    else
      @contacts_page = ContentPage.find_or_create_by(page_url: 'contacts')
    end
  end

  def contacts_nooffice
    @city_name = session[:user_city]
    @contacts_page = ContentPage.find_or_create_by(page_url: 'contacts_nooffice')
  end
end
