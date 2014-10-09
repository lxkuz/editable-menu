# == Schema Information
#
# Table name: content_page_chapters
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  anchor          :string(255)
#  content         :text
#  content_page_id :integer
#  position        :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class ContentPageChapter < ActiveRecord::Base
  belongs_to :content_page

  validates :anchor, :name, :content, :content_page_id, :position, presence: true

  scope :by_position, -> { order(:position)}
end
