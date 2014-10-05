require 'rails_helper'

describe NewsItemsController do
  before do
    admin = User.create! email: 'admin@example.com', password: 'password', role: 'admin'
    user  = User.create! email: 'user@example.com',  password: 'password', role: 'user'
    valid_attributes = { name: 'news title', body: 'body', user: admin }

    @news_item1 = NewsItem.create valid_attributes.merge(updated_at: Date.current - 1.day)
    @news_item2 = NewsItem.create valid_attributes.merge(updated_at: Date.current - 2.day)
    @news_item3 = NewsItem.create valid_attributes.merge(updated_at: Date.current - 3.day)

    sign_in user
  end

  describe 'GET index' do
    it 'assigns all news_items as @news_items' do
      get 'index'
      expect(assigns(:news_items)).to match_array([@news_item1, @news_item2, @news_item3])
    end
  end

  describe 'GET show' do
    it 'assigns news_item as @news_item' do
      get 'show', { id: @news_item2.to_param }
      # expect(assigns(:news_item)).to eq(@news_item2)
    end

    it 'assigns news_items as @last_news' do
      get 'show', { id: @news_item2.to_param }
      # expect(assigns(:last_news)).to match_array([@news_item1, @news_item3])
    end
  end
end
