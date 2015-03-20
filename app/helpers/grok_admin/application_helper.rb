module GrokAdmin
  module ApplicationHelper

    # Reflect on all the associations and tell me if the column I'm sending is an association
    def isRelation? model, column
      # Get associations from the model, Only those that are :belongs_to, map to foreign_key, is column one of them?
      model.reflect_on_all_associations.select{|assoc| assoc.macro == :belongs_to }.map(&:foreign_key).include?(column)
    end

    # Reflect on all the associations and tell me the actual model of the column I'm sending as an association
    def getRelationModel model, column
      # Get associations from the model, Only those that are :belongs_to, and map those to key, model
      associations = Assignment.reflect_on_all_associations
                               .select{|assoc| assoc.macro == :belongs_to }
                               .map{|assoc| [ assoc.foreign_key, assoc.plural_name.singularize.classify.constantize ] }
      # now return the model
      Hash[*associations.flatten][column]
    end

  end
end
