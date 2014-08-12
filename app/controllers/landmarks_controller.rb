require_relative 'base.rb'

class LandmarksController < ControllerBase
  def list
    if Landmark.count == 0
      puts "No landmarks exist"
      exit
    end
    puts "=============="
    puts "Landmarks View"
    puts "==============\n"
    puts "1. See all landmarks\n2. By location\n"
    list_by = clean_gets.to_i
    if list_by == 0 || list_by > 2
      Router.route("error")
    else
      if list_by == 1
        print_landmarks(landmarks)
      else
        get_landmarks_by_location
      end
    end
  end

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
    if location_index.to_i == 0 || location_index.to_i > Location.count
      Router.route("error")
    else
      puts "Enter the name of the landmark"
      landmark_name = clean_gets
      matched_location = locations[location_index.to_i - 1]
      Landmark.create(name: landmark_name, location_id: matched_location.id)
    end
  end

  def print_landmarks(landmark_list)
    landmark_list.each_with_index do |landmark, i|
      puts "  (#{i+1})  #{landmark.name} - #{landmark.location.city}, #{landmark.location.country}"
    end
  end

  def get_landmarks_by_location
    puts "Which location?"
    locations = Location.all
    locations.each_with_index do |location, i|
      puts "#{i+1}. #{location.city}"
    end
    location_index = clean_gets.to_i
    if location_index == 0 || location_index > Location.count
      Router.route("error")
    else
      matched_location = locations[location_index.to_i - 1]
      puts "  Landmarks in #{matched_location.city}"
      print_landmarks(matched_location.landmarks)
    end

  end

  def landmarks
    @landmarks ||= Landmark.all
  end



end
