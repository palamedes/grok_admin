# Add a method to the active record base model for allowing edits
# module ActiveRecord
#   class Base
#
#     @@grok_admin_fields_allowed = []
#
#     # Define whats allowed to be edited for this method
#     def grok_admin_editable *arguments
#       arguments.each do |arg|
#         @@grok_admin_fields_allowed << arg if arg.is_a? Symbol
#       end
#     end
#
#   end
# end


module GrokAdmin
  module GrokAdminEditable
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def is_grok_admin_editable(options = {})

        include GrokAdmin::GrokAdminEditable::LocalInstanceMethods
      end
    end

    module LocalInstanceMethods
      def grok_admin_editable (string)
        write_attribute(self.class.grok_admin_fields_allowed, string)
      end
    end
  end
end

ActiveRecord::Base.send :include, GrokAdmin::GrokAdminEditable