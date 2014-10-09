# == Schema Information
#
# Table name: news_items
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  description :text
#  keywords    :text
#  name        :string(255)
#  body        :text
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  slug        :string(255)
#  custom_url  :string(255)
#

require 'rails_helper'

describe NewsItem do
  before do
    admin = User.create! email: 'admin@example.com', password: 'password', role: 'admin'
    @valid_attributes = { name: 'news title', body: 'body', user: admin }
  end

  subject { NewsItem.create @valid_attributes }

  it { is_expected.to be_valid }

  describe :class do
    it 'should respond to :newest' do
      news_item1 = NewsItem.create @valid_attributes.merge(updated_at: Date.current - 1.day)
      news_item2 = NewsItem.create @valid_attributes.merge(updated_at: Date.current - 2.day)

      expect(NewsItem.newest).to eq([news_item1, news_item2])
    end

    it 'should respond to :last_news' do
      news_item1 = NewsItem.create @valid_attributes.merge(updated_at: Date.current - 1.day)
      news_item2 = NewsItem.create @valid_attributes.merge(updated_at: Date.current - 2.day)
      news_item3 = NewsItem.create @valid_attributes.merge(updated_at: Date.current - 3.day)

      expect(NewsItem.last_news(news_item2)).to eq([news_item1, news_item3])
    end
  end
end
