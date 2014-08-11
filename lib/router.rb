require 'active_support/inflector'
include ActiveSupport::Inflector



class Router

  def self.route( command )
      routes = { "new" => { controller: :app, action: :list_new },
                "view" => { controller: :app, action: :list_view },
                "view locations" => { controller: :locations, action: :list },
                "landmark" => { controller: :locations, action: :list },
                "entry" => { controller: :locations, action: :list }
               }
      fallback = { controller: :app, action: :unknown_command }

      route = routes[command] || fallback
      controller_name = "#{route[:controller]}_controller"
      controller_class = constantize(classify(controller_name))
      controller = controller_class.new
      controller.send route[:action]
  end

end
