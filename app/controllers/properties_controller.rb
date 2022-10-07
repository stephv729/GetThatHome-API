# frozen_string_literal: true

class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[create update destroy]
  def index
    @properties = Property.all # array
    render json: @properties
  end

  def create
    if current_user.role.name != ""
  end

  # GET /properties/1
  def show
    render json: @property, serializer: PropertyDetailsSerializer
  end

  def update
    name = property_params[:address_name]
    lat = property_params[:address_lat].to_f
    lng = property_params[:address_lng].to_f
    address = Address.find(@property.address.id)
    address.update(name:name, latitude:lat, longitude: lng)
    p op_type = params[:operation_type]
    p_type = property_params[:property_type_id]
    other_data_keys = ["bedrooms", "bathrooms", "area", "description", "active"]
    other_data = property_params.select {|k,v| other_data_keys.include?(k) }
    photos = params[:photo_urls]
    body = other_data.merge!({property_type_id: p_type, photo_urls: photos})

    if PropertyForRent.find_by(property: @property)
      puts "here:*****"
      PropertyForRent.delete_by(property: @property.id) unless op_type[:type ]== "for rent"
      PropertyForSale.create(property: @property, price: op_type[:price]) unless op_type[:type] == "for rent"
    elsif PropertyForSale.find_by(property: @property)
      puts "here:------"
      PropertyForSale.delete_by(property: @property.id) unless op_type[:type] == "for sale"
      PropertyForRent.create(property: @property, maintenance: op_type[:maintenance], monthly_rent: op_type[:monthly_rent], pets_allowed: op_type[:pets_allowed]) unless op_type[:type] == "for sale"
    end
   
    if @property.update(body)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def destroy; end

  # Use callbacks to share common setup or constraints between actions.
  def set_property
    Rails.logger.debug @property = Property.find(params[:id])
  end

  def property_params
    params.permit(:bedrooms, :bathrooms, :area, :description, :active, :property_type_id, :address_name, :address_lat, :address_lng, :photo_urls, :operation_type)
  end
end
