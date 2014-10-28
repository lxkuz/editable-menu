# == Schema Information
#
# Table name: articles
#
#  id             :integer          not null, primary key
#  title          :string(255)
#  title_translit :string(255)
#  description    :text
#  keywords       :text
#  content        :text
#  position       :integer
#  published_at   :datetime
#  created_at     :datetime
#  updated_at     :datetime
#  slug           :string(255)
#

class Article < ActiveRecord::Base
  extend FriendlyId

  include SearchByLike
  has_search_by_like_for :title

  include HasMenuItems

  friendly_id :title_translit, use: [:slugged, :finders]

  scope :by_position, -> { order(:position)}

  has_many :chapters, dependent: :destroy
  accepts_nested_attributes_for :chapters, allow_destroy: true

  validates :content, :title, presence: true
  validates :title_translit, presence: true, uniqueness: true

  before_save :set_published_at

  def to_s
    title
  end

  def translit_field
    title_translit
  end

  private

  def set_published_at
    self.published_at ||= Time.now
  end

  def should_generate_new_friendly_id?
    title_translit_changed?
  end
end
