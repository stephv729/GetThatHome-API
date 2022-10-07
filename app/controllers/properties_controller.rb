# frozen_string_literal: true

class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[create update destroy]
  def index
    @properties = Property.all # array
    render json: @properties
  end

  def create
    return render status: :unauthorized unless current_user.role_name == "Landlord"
    address = Address.create(modify_params(params[:address],["name"]))
    photos = params[:photo_urls]
    op_type = params[:operation_type]
    other_data_keys = ["bedrooms", "bathrooms", "area", "description", "active", "property_type_id"]
    other_data = property_params.select { |k, _v| other_data_keys.include?(k) }
    body = other_data.merge!({ photo_urls: photos, address: address })

    @property = Property.new(body)
    if @property.save && change_operation_type(op_type)
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  # GET /properties/1
  def show
    render json: @property, serializer: PropertyDetailsSerializer
  end

  def update
    return render status: :unauthorized unless current_user.role_name == "Landlord"

    address = Address.find(@property.address.id)
    address.update(modify_params(params[:address],["name"]))
    photos = params[:photo_urls]
    op_type = params[:operation_type]
    other_data_keys = ["bedrooms", "bathrooms", "area", "description", "active", "property_type_id"]
    other_data = property_params.select { |k, _v| other_data_keys.include?(k) }

    body = other_data.merge!({ photo_urls: photos })

    is_same_op_type = @property.operation_type[:type] == op_type[:type]
    change_op_type = is_same_op_type ? change_operation_data(op_type) : change_operation_type(op_type)

    if @property.update(body) && change_op_type
      render json: @property
    else
      render json: @property.errors, status: :unprocessable_entity
    end
  end

  def destroy; end

  # Use callbacks to share common setup or constraints between actions.
  private

  def set_property
    Rails.logger.debug @property = Property.find(params[:id])
  end

  def property_params
    params.permit(:bedrooms, :bathrooms, :area, :description, :active, :property_type_id, :address,
                  :photo_urls, :operation_type)
  end

  def modify_params(hash, exceptions)
    keys = hash.keys
    new_hash = {}
    keys.each { |k| new_hash[k] = hash[k] }
    new_hash.map { |k, v| { k => exceptions.include?(k) ? v : v.to_f } }.reduce(:merge)
  end

  def change_operation_type(op_type)
    data = op_type.except("type").merge!({ property_id: @property.id })
    modified_data = modify_params(data,data.keys)

    case op_type[:type]
    when "for rent"
      model = PropertyForRent
      other_model = PropertyForSale
    when "for sale"
      model = PropertyForSale
      other_model = PropertyForRent
    end
   
    attrs = model.attribute_names
    modified_data.keys.all?{|k| attrs.include?(k)}
    return false unless modified_data.keys.all?{|k| attrs.include?(k)}
    new_prop = model.create(modified_data)
    other_model.delete_by(property: @property) if new_prop.persisted?
    new_prop.persisted?
  end

  def change_operation_data(op_type)
    data = op_type.except("type")
    modified_data = modify_params(data,data.keys)
    case op_type[:type]
    when "for rent"
      model = PropertyForRent
    when "for sale"
      model = PropertyForSale
    end
    prop = model.find_by(property: @property)
    attrs = model.attribute_names
    return false unless modified_data.keys.all?{|k| attrs.include?(k)}
    prop.update(modified_data) 
  end
end
