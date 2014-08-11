class LocationsController
  def list_view(num)
    puts "=============="
    puts "Locations View"
    puts "==============\n"
    locations.each_with_index do |location, index|
      puts "#{index+1}. #{location.city}"
    end
    command = clean_gets
    Router.route("show", command.to_i)

  end

  def show(location_id)
    location = Location.find(location_id)
    puts "#{location.city}, #{location.country} => Latitude #{location.lat}  Longitude #{location.long}"
  end

  def locations
    @locations ||= Location.all
  end

end
