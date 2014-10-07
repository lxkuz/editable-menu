class ContentPageChapter < ActiveRecord::Base
  belongs_to :content_page

  validates :anchor, :name, :content, :content_page_id, :position, presence: true

  scope :by_position, -> { order(:position)}
end
