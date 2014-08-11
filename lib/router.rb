require 'active_support/inflector'
include ActiveSupport::Inflector

class Router

  def self.route( command, arg = nil )
    invalid_arg = arg.nil? ? false : arg.to_s.match(/[1-3]/).nil?

    command_type = [:locations, :landmarks, :entries]
    controller_type = :app
    controller_type = command_type[arg.to_i-1] unless arg.to_s.match(/[1-3]/).nil?
    command = "invalid" if invalid_arg

    routes = { "new" => { controller: controller_type, action: :list_new },
              "view" => { controller: controller_type, action: :list_view },
              "list" => { controller: controller_type, action: :list_view },
              "show" => { controller: @last_controller_type, action: :show }
             }
    fallback = { controller: :app, action: :unknown_command }
    @last_controller_type = controller_type

    route = routes[command] || fallback
    controller_name = "#{route[:controller]}_controller"
    controller_class = constantize(classify(controller_name))
    controller = controller_class.new

    if invalid_arg || arg.nil?
      controller.send route[:action]
    else
      controller.send route[:action], arg
    end
  end

end
