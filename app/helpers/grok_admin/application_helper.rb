module GrokAdmin
  module ApplicationHelper

    # Reflect on all the associations and tell me if the column I'm sending is an association
    def isRelation? model, column
      # Get associations from the model, Only those that are :belongs_to, map to foreign_key, is column one of them?
      model.reflect_on_all_associations.select{|assoc| assoc.macro == :belongs_to }.map(&:foreign_key).include?(column)
    end


  end
end
