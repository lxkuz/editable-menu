class Office < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? }

  def address
    [postindex, city, street_address].compact.join(', ')
  end
end
