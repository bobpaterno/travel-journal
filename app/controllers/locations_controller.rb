require_relative 'base.rb'

class LocationsController < ControllerBase
  def list
    puts "=============="
    puts "Locations View"
    puts "==============\n"
    locations.each_with_index do |location, index|
      puts "#{index+1}. #{location.city}"
    end
    command = clean_gets
    matched_location = @locations[command.to_i-1]

    if matched_location.nil?
      puts "Wrong number"
      Router.route('locations', "view", {location_id: matched_location.id})
    else
      Router.route("locations", "show", location_id: matched_location.id)
    end
  end

  def show
    location = Location.find(params[:location_id])
    puts "#{location.city}, #{location.country} => Latitude #{location.lat}  Longitude #{location.long}"
  end

  def create
    puts "Enter the city, country, latitude, and longitude separated by commas"
    record = clean_gets
    record = record.split(",").map! { |m| m.strip } # doesn't error check
    Location.create(city: record[0], country: record[1], lat: record[2], long: record[3])
  end

  def locations
    @locations ||= Location.all
  end

end
