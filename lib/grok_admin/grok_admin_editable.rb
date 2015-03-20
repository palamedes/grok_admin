# Add a method to the active record base model for allowing edits
module GrokAdmin
  module GrokAdminEditable
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      @@grok_admin_fields_allowed = []

      # Class method which allows you to set which fields are editable
      #  for now they are just stored in a class variable.
      def grok_admin_editable *arguments
        arguments.each do |arg|
          @@grok_admin_fields_allowed << arg if arg.is_a? Symbol
        end
      end

      # A test to see if there are editable items
      def is_grok_admin_editable column
        @@grok_admin_fields_allowed.include? column.to_sym
      end

      # Get a list of all columns disallowed
      def get_grok_admin_disallowed_fields
        self.column_names - @@grok_admin_fields_allowed.map(&:to_s)
      end

      # Simple getter
      def get_grok_admin_fields_allowed
        @@grok_admin_fields_allowed
      end

      # Are there ANY editable fields?
      def any_grok_admin_editable_columns?
        self.column_names != self.get_grok_admin_disallowed_fields
      end

    end
  end
end

ActiveRecord::Base.send :include, GrokAdmin::GrokAdminEditable