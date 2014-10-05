class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title_translit, use: [:slugged, :finders]

  default_scope { order :position }
  scope :newest, -> { order(updated_at: :desc) }

  validates :title_translit, presence: true

  before_save :set_published_at

  private

  def set_published_at
    self.published_at ||= Time.now
  end

  def should_generate_new_friendly_id?
    title_translit_changed?
  end
end
