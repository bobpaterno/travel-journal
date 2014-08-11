class AppController
  def list_view
    puts "View what?\n1. Locations\n2. Landmarks\n3. Journal Entries\n"
    command = "view #{clean_gets.downcase}"
    puts command
    Router.route(command)
  end

  def list_new
    puts "New what?\n1. Locations\n2. Landmarks\n3. Journal Entries\n"
  end

  def unknown_command
    puts "Sorry, Travel doesn't support that command\n\n"
  end
end
