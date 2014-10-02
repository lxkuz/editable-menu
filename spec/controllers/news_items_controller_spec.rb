require 'rails_helper'

describe NewsItemsController do
  before do
    admin = User.create! email: 'admin@example.com', password: 'password', role: 'admin'
    user  = User.create! email: 'user@example.com',  password: 'password', role: 'user'
    valid_attributes = { name: 'news title', body: 'body', user: admin }

    @news_item1 = NewsItem.create valid_attributes.merge(updated_at: Date.current - 1.day)
    @news_item2 = NewsItem.create valid_attributes.merge(updated_at: Date.current - 2.day)

    sign_in user
  end

  describe 'GET index' do
    it 'assigns all news_items as @news_items' do
      get 'index'
      expect(assigns(:news_items)).to match_array([@news_item1, @news_item2])
    end
  end
end
