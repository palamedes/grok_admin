module GrokAdmin
  module ApplicationHelper

    # Reflect on all the associations and tell me if the column I'm sending is an association
    def is_relation? model, column
      # Get associations from the model, Only those that are :belongs_to, map to foreign_key, is column one of them?
      model.reflect_on_all_associations.select{|assoc| assoc.macro == :belongs_to }.map(&:foreign_key).include?(column)
    end

    # Reflect on all the associations and tell me the actual model of the column I'm sending as an association
    def get_relation_model model, column
      # Get associations from the model, Only those that are :belongs_to, and map those to key, model
      associations = Assignment.reflect_on_all_associations
                               .select{|assoc| assoc.macro == :belongs_to }
                               .map{|assoc| [ assoc.foreign_key, assoc.plural_name.singularize.classify.constantize ] }
      # now return the model
      Hash[*associations.flatten][column]
    end

    # Output the models columns in the correct order; Primary key ... columns ... Rails dates
    #  otherwise if you just use column_names it will output them in the order they were created in the db
    def get_columns model
      # Get our models primary key name
      primary_key = model.primary_key
      # Get all the column names from the model minus the primary key and time stamps
      columns = model.column_names - [primary_key, 'created_at', 'updated_at']
      # Now put the primary key on the front of the array
      # This will be redundant for 99.9% of the tables out there
      #  but I always want the primary key to be the left most column in the list
      columns.unshift(primary_key)
      # Now put the two rails time stamps on the far right of the array
      columns << 'created_at'
      columns << 'updated_at'
    end

  end
end
