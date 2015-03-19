module GrokAdmin
  class ApplicationController < ActionController::Base

    # Default dashboard view
    def index
      # Get all of the model classes in the system
      @models = ActiveRecord::Base.connection.tables.collect{|t| t.classify.constantize rescue nil }.compact

    end

  end
end
