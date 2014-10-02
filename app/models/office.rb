class Office < ActiveRecord::Base
  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? }

  def address
    [postindex, city, street_address].compact.join(', ')
  end

  def distance_to_user(user_ip)
    user_coordinates = Geocoder.coordinates(user_ip)
    distance_to(user_coordinates)
  end
end
