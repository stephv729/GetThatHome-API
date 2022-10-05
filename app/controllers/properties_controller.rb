# frozen_string_literal: true

class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show update destroy]
  def index
    @properties = Property.all # array
    render json: @properties
  end

  # GET /properties/1
  def show
    render json: @property, serializer: PropertyDetailsSerializer
  end

  def update; end

  def destroy; end

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    Rails.logger.debug @property = Property.find(params[:id])
  end
end
