class Snippet < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
end
