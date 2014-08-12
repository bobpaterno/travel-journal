require 'active_support/inflector'
include ActiveSupport::Inflector

class Router

  def self.route( controller = "app", action = "list", params = {} )
    valid_controllers = { app: true, locations: true, landmarks: true, entries: true }

    if valid_controllers[controller.to_sym].nil?
      route = { controller: "app", action: "unknown_command" }
    else
      route = { controller: controller, action: action }
    end

    controller_name = "#{route[:controller]}_controller"

    controller_class = constantize(classify(controller_name))
    controller = controller_class.new(params)
    controller.send route[:action]
  end
end
