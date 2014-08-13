require_relative 'base.rb'

class EntriesController < ControllerBase
  # def list
  #   puts "=============="
  #   puts "Entries View"
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
    check_if_no_locations

    puts "In what location is your journal entry?"
    locations = Location.all
    locations.each_with_index do |location, i|
      puts "#{i+1}. #{location.city}"
    end

    location_index = clean_gets.to_i
    if location_index == 0 || location_index > Location.count
      puts "Sorry that is not a valid location"
      Router.route()
    else
      puts "Type your journal entry below:\n"
      entry = clean_gets
      matched_location = locations[location_index.to_i - 1]
      Entry.create(journal_entry: entry, location_id: matched_location.id)
    end
  end

  def check_if_no_locations
    if Location.count == 0
      puts "You must first create at least one location to make a journal entry"
      puts "Perhaps you'd like to create a new location?"
      sleep(2)
      Router.route("locations", "create")
    end
  end

end
