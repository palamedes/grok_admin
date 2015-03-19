# Add a class to the routing mapper to allow us to custom set the route name
module ActionDispatch
  module Routing
    class Mapper

      # Allow a user to set the route path to anything
      def grokadmin_to route_name
        # todo Make sure the route name is a legal one?
        mount GrokAdmin::Engine => route_name
      end

    end
  end
end