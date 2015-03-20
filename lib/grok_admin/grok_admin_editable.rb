# Add a method to the active record base model for allowing edits
module GrokAdmin
  module GrokAdminEditable
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      # Class method which allows you to set which fields are editable
      #  for now they are just stored in a class variable.
      def grok_admin_editable *arguments
        @@grok_admin_fields_allowed = []
        arguments.each do |arg|
          @@grok_admin_fields_allowed << arg if arg.is_a? Symbol
        end
      end

      # A test to see if there are editable items
      def is_grok_admin_editable column
        if defined? @@grok_admin_fields_allowed
          @@grok_admin_fields_allowed.include? column.to_sym
        else
          true
        end
      end

      # Get a list of all columns disallowed
      def get_grok_admin_disallowed_fields
        if defined? @@grok_admin_fields_allowed
          self.column_names - @@grok_admin_fields_allowed.map(&:to_s)
        else
          [self.primary_key, 'created_at', 'updated_at']
        end
      end

    end
  end
end

ActiveRecord::Base.send :include, GrokAdmin::GrokAdminEditable