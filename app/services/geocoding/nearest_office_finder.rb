require 'timeout'

class Geocoding::NearestOfficeFinder
  def initialize(user_ip)
    @user_ip = user_ip
  end

  def nearest_office
    Office.active.all.min_by { |office| distance_to_user_from(office) }
  end

  def nearest_office_in_user_city
    no_city_office = false
    begin
      Timeout::timeout(200) do
        ipgeobase_result = Ipgeobase.lookup(@user_ip)
        user_city = ipgeobase_result.city || :none
      end
    rescue
      user_city = :none
    end
    if user_city != :none
      user_city_offices = Office.where(city: city).all
      if user_city_offices.any?
        office = user_city_offices.min_by {|office| distance_to_user_from(office)}
      end
    end
    if office.nil?
      office = Office.all.min_by { |office| distance_to_user_from(office) }
      no_city_office = true
    end
    return [office, user_city, no_city_office]
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
