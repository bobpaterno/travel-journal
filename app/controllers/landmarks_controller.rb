require_relative 'base.rb'

class LandmarksController < ControllerBase
  # def list
  #   puts "=============="
  #   puts "Locations View"
  #   puts "==============\n"
  #   locations.each_with_index do |location, index|
  #     puts "#{index+1}. #{location.city}"
  #   end
  #   command = clean_gets
  #   matched_location = @locations[command.to_i-1]
  #
  #   if matched_location.nil?
  #     puts "Wrong number"
  #     Router.route('locations', "view", {location_id: matched_location.id})
  #   else
  #     Router.route("locations", "show", location_id: matched_location.id)
  #   end
  # end
  #
  # def show
  #   location = Location.find(params[:location_id])
  #   puts "#{location.city}, #{location.country} => Latitude #{location.lat}  Longitude #{location.long}"
  # end

  def create
    if Location.count == 0
      puts "You must first create a new location for the landmark"
      exit
    end
    puts "In what city is your landmark?"
    locations = Location.all
    locations.each_with_index do |location, i|
      puts "#{i+1}. #{location.city}"
    end
    location_index = clean_gets
    if location_index.match(/\d+/).nil?
      Router.route("error")
    elsif location_index.to_i > 0 && location_index.to_i <= Location.count
      puts "Enter the name of the landmark"
      landmark_name = clean_gets
      Landmark.create(name: landmark_name)
    end

    # record = record.split(",").map! { |m| m.strip } # doesn't error check
    # Location.create(city: record[0], country: record[1], lat: record[2], long: record[3])
  end

  # def landmarks
  #   @landmarks ||= Landmarks.all
  # end

end
