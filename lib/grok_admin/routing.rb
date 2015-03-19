module ActionDispatch
  module Routing
    module Mapper

      # Allow a user to set the route path to anything
      def grokadmin_to route_name
        mount GrokAdmin::Engine => route_name
      end

    end
  end
end