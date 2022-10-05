# frozen_string_literal: true

class PropertiesController < ApplicationController
  def index
    @properties = Property.all #array
    render json: @properties
  end
end
