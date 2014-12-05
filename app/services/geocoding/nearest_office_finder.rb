require 'timeout'

class Geocoding::NearestOfficeFinder
  def initialize(user_ip)
    @user_ip = user_ip
  end

  def nearest_office
    Office.active.all.min_by { |office| distance_to_user_from(office) }
  end

  private

  def distance_to_user_from(office)
    begin
        Timeout::timeout(200) do
          ipgeobase_result = Ipgeobase.lookup(@user_ip)
          user_coordinates = [ipgeobase_result.lat || 55.75, ipgeobase_result.lng || 37.62]
          return office.distance_to(user_coordinates)
        end
    rescue
      user_coordinates = [55.75, 37.62]
      return office.distance_to(user_coordinates)
    end
  end
end
