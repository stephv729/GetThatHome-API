class SavedPropertiesController < ApplicationController
  before_action :authenticate_user!
  def index
    return render status: :unprocessable_entity unless current_user.role_name == "Homeseeker"
    @saved_properties = SavedProperty.where(user: current_user) # array
    render json: @saved_properties
  end
end
