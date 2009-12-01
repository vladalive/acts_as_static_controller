module ActsAsStaticController #:nodoc:
  module Routing #:nodoc:
    module MapperExtensions
      def static_pages
        @set.add_route("*path", {:controller => "static_pages", :action => "index"})
      end
    end
  end
end

ActionController::Routing::RouteSet::Mapper.send :include, ActsAsStaticController::Routing::MapperExtensions
