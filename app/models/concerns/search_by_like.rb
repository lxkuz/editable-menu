module SearchByLike
  extend ActiveSupport::Concern

  included do
    def self.has_search_by_like_for *fields
      scope :search_by_like, -> (query) {
        where(fields.map{|field| "(#{table_name}.#{field} ILIKE '%#{query}%')" }.join " OR ")
      }
    end
  end
end