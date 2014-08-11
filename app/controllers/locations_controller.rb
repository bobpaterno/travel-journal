class LocationsController
  def list
    puts "=============="
    puts "Locations View"
    puts "==============\n"
    locations.each_with_index do |location, index|
      puts "#{index}. #{location.city}"
    end
  end

  def locations
    @locations ||= Location.all
  end

end
