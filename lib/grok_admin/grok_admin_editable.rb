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
        cattr_accessor :grok_admin_fields_allowed
        write_attribute :grok_admin_fields_allowed, []
        arguments.each do |arg|
          write_attribute(:grok_admin_fields_allowed, self.grok_admin_fields_allowed << arg) if arg.is_a? Symbol
        end
      end

      def get_grok_admin_fields_allowed
        @@grok_admin_fields_allowed
      end

      # A test to see if there are editable items
      def is_grok_admin_editable column
        if @@grok_admin_fields_allowed
          @@grok_admin_fields_allowed.include? column.to_sym
        else
          true
        end
      end

      # Get a list of all columns disallowed
      def get_grok_admin_disallowed_fields
        if @@grok_admin_fields_allowed
          self.column_names - @@grok_admin_fields_allowed
        else
          [self.primary_key, 'created_at', 'updated_at']
        end
      end

    end
  end
end

ActiveRecord::Base.send :include, GrokAdmin::GrokAdminEditable