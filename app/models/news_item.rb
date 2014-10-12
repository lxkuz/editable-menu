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

class NewsItem < ActiveRecord::Base
  extend FriendlyId
  friendly_id :custom_url, use: [:slugged, :finders]

  belongs_to :user

  validates :name, :body, :user ,presence: true

  scope :newest,    -> { order(updated_at: :desc)}
  scope :last_news, ->(news_id) { where.not(id: news_id).newest.limit(6) }

  def should_generate_new_friendly_id?
    custom_url_changed?
  end
end
