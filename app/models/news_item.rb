class NewsItem < ActiveRecord::Base
  belongs_to :user

  validates :name, :body, :user, presence: true

  scope :newest,    -> { order(updated_at: :desc)}
  scope :last_news, ->(news_id) { where.not(id: news_id).newest.limit(6) }
end
