class Geocoding::NearestOfficeFinder
  def initialize(user_ip)
    @user_ip = user_ip
  end

  def nearest_office
    Office.all.select { |office| !distance_to_user_from(office).nan? }
              .min_by { |office| distance_to_user_from(office) }
  end

  private

  def distance_to_user_from(office)
    user_coordinates = Geocoder.coordinates(@user_ip)
    office.distance_to(user_coordinates)
  end
end
