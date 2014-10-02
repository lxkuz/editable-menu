class NewsItem < ActiveRecord::Base
  belongs_to :user

  validates :name, :body, :user, presence: true

  scope :newest, -> { order(updated_at: :desc) }
end
