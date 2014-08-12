require_relative 'base.rb'

class AppController < ControllerBase
  def list_view
    puts "View what?\n1. Locations\n2. Landmarks\n3. Journal Entries\n"
    command = clean_gets
    controller = get_controller(command)
    if controller.nil?
      Router.route("app", "unknown_command")
    else
      Router.route(controller, "list")
    end
  end

  def list_new
    puts "New what?\n1. Locations\n2. Landmarks\n3. Journal Entries\n"
    command = clean_gets
    controller = get_controller(command)
    if controller.nil?
      Router.route("app", "unknown_command")
    else
      Router.route(controller, "create")
    end
  end

  def list
    puts "\n=================\nWelcome Traveler!\n=================\n"
    puts "Do you want to view existing records or create new ones?"
    puts "Type: View or New\n"
    command = clean_gets
    if command.downcase == "view"
      list_view
    elsif command.downcase == "new"
      list_new
    else
      unknown_command
    end
  end

  def unknown_command
    puts "Sorry, Travel doesn't support that command\n\n"
  end

  def get_controller(command)
    controller = ["app", "locations", "landmarks", "entries"]
    if command.match(/\d+/).nil?
      nil
    else
      controller[command.to_i]
    end
  end

  def controller_type
    @controller_type = { app: true, locations: true, landmarks: true, entries: true }
  end
end
