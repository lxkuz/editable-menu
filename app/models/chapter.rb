# == Schema Information
#
# Table name: chapters
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  anchor          :string(255)
#  content         :text
#  content_page_id :integer
#  position        :integer
#  created_at      :datetime
#  updated_at      :datetime
#  article_id      :integer
#

class Chapter < ActiveRecord::Base
  include HasSnippets

  belongs_to :content_page
  belongs_to :article

  validates :name, :content, presence: true

  before_validation :set_anchor
  before_save :set_position

  default_scope { order(:position, :created_at) }

  private

  def set_anchor
    self.anchor = Russian::translit(name.split.join('-')) if name.present?
  end

  def set_position
    if self.position.blank?
      parent = self.content_page || self.article
      last_chapter = parent.reload.chapters.last
      self.position = last_chapter.present? ? (last_chapter.position + 1) : 1
    end
  end
end

