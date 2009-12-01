module ActsAsStaticController
  
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def acts_as_static_controller
      include ActsAsStaticController::InstanceMethods 
    end  
  end
  
  module InstanceMethods
    
    def index
      if template_exists? path = "#{self.controller_name}/#{params[:path].join('/')}" 
        render :template => path
      elsif template_exists? path += "/index" 
        render :template => path
      else
        # pass through to the global error page handler
        # method_missing params[:path].to_s
        raise ActionController::RoutingError, params[:path].join('/')
      end
    end
    
    protected
    
      def each_page
        template_root = "#{RAILS_ROOT}/app/views/#{self.controller_name}" 
        excluded_actions = ['.', '..'].concat(self.hidden_actions)
        Dir.foreach(template_root) do |action|
          if !excluded_actions.include? action
            template_path = "#{template_root}/#{action}" 
            yield action, template_path
          end      
        end
      end  
    
    private
    
      unless ActionController::Base.private_instance_methods.include? 'template_exists?'
        def template_exists?(path)
          self.view_paths.find_template(path, response.template.template_format)
        rescue ActionView::MissingTemplate
          false
        end
      end
      
  end
end    

ActionController::Base.send(:include, ActsAsStaticController)
