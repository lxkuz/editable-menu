class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title_translit, use: [:slugged, :finders]

  default_scope { order :position }

  validates :title_translit, presence: true

  before_save :set_published_at

  private

  def set_published_at
    self.published_at ||= Time.now
  end
end
