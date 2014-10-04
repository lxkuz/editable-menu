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
    if user_coordinates == [60, 100]
      ipgeobase_result = Ipgeobase.lookup(@user_ip)
      user_coordinates = [ipgeobase_result.lat, ipgeobase_result.lng]
    end

    office.distance_to(user_coordinates)
  end
end
