class PropertyTypesController < ApplicationController
  def index
    @property_type = PropertyType.all # array
    render json: @property_type
  end
end
