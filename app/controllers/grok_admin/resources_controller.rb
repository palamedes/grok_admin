module GrokAdmin
  class ResourcesController < ApplicationController

    before_action :set_model, only: [:index, :update, :destroy]
    before_action :set_resource, only: [:update, :destroy]

    # Default dashboard view
    # GET /resources&model={model}&page={page}
    def index
      # Get the "page" from the params too, if there is no page give them page zero
      page = params['page'] || 0
      offset = page.to_i * GrokAdmin::PAGINATION_SIZE
      # Get our records
      @records = @model.limit(GrokAdmin::PAGINATION_SIZE).offset(offset)
      # Return as a json response
      render json: {
          records: @records,
          page: page,
          offset: offset,
          model: @model.name,
          showing: "Showing #{offset + 1} - #{offset + @records.count} of #{@model.all.count}"
      }
    end

    # PATCH/PUT /projects/1
    def update
      if @resource.update(resource_params)
        format.json { head :no_content }
      else
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end

    private

    # Before filter to set the model we are talking about
    def set_model
      # Get the resource we are asking for from the params ~ If there is no resource, redirect to root
      resource = params['model']
      # Convert it to a model, or nil (Rescue isn't the best way to do this but it works)
      @model = resource.classify.constantize rescue nil

      # todo if @model is nil, get us out of here
    end

    # Load the resource we are talking about here
    def set_resource
      @resource = @model.find id: params[:id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(@model.get_grok_admin_fields_allowed)
    end

  end
end
