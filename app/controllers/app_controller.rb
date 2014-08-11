class AppController
  def list_view
    puts "View what?\n1. Locations\n2. Landmarks\n3. Journal Entries\n"
    command = clean_gets
    Router.route("list", command)
  end

  def list_new
    puts "New what?\n1. Locations\n2. Landmarks\n3. Journal Entries\n"
    command = clean_gets
    Router.route("create", command)

  end

  def unknown_command
    puts "Sorry, Travel doesn't support that command\n\n"
  end
end
