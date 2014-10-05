class Geocoding::NearestOfficeFinder
  def initialize(user_ip)
    @user_ip = user_ip
  end

  def nearest_office
    Office.all.min_by { |office| distance_to_user_from(office) }
  end

  private

  def distance_to_user_from(office)
    ipgeobase_result = Ipgeobase.lookup(@user_ip)

    # If User IP address wrong, use Moscow center coordinates
    user_coordinates = [ipgeobase_result.lat || 55.75, ipgeobase_result.lng || 37.62]

    office.distance_to(user_coordinates)
  end
end
