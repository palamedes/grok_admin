module GrokAdmin
  class ResourcesController < ApplicationController

    # Default dashboard view
    def index
      # Get the resource we are asking for from the params ~ If there is no resource, redirect to root
      resource = params['model']
      # Convert it to a model, or nil (Rescue isn't the best way to do this but it works)
      @model = resource.classify.constantize rescue nil

      # todo if @model is nil, get us out of here

      # Get the "page" from the params too, if there is no page give them page zero
      page = params['page'] || 0
      offset = page * GrokAdmin::PAGINATION_SIZE
      # Get our records
      @records = @model.limit(GrokAdmin::PAGINATION_SIZE).offset(offset)
      # Return as a json response
      render json: {records: @records}
    end

  end
end
