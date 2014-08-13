require_relative 'base.rb'

class EntriesController < ControllerBase
  def list
    puts "\n=============="
    puts "Entries View"
    puts "==============\n"
    check_if_no_entries
    puts "1. Select all\n2. Select by location\n"
    listing_type = clean_gets.to_i
    if listing_type == 0 || listing_type > 2
      Router.route("error")
    elsif listing_type == 1
      print_entries(Entry.all)
    else
      get_entries_by_location
    end
  end

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

  def check_if_no_entries
    if Entry.count == 0
      puts "Sorry, no journal entries exist"
      Router.route("entries", "create")
    end
  end

  def print_entries(entries_list)
    entries_list.each_with_index do |entry, i|
      puts "\n#{i+1}. #{entry.location.city}, #{entry.location.country}\n\n#{entry.journal_entry}\n"
    end
  end

  def get_entries_by_location
    puts "Which location?"
    locations = Location.all
    locations.each_with_index do |location, i|
      puts "#{i+1}. #{location.city}, #{location.country}"
    end
    location_index = clean_gets.to_i
    if location_index == 0 || location_index > Location.count
      Router.route("error")
    else
      puts "not implemented yet"
      # matched_location = locations[location_index.to_i - 1]
      # puts "Entries in #{matched_location.city}"
      # print_landmarks(matched_location.landmarks)
    end

  end

end
