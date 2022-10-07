class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[my_properties]

  def my_properties
    return render status: :unprocessable_entity unless current_user.role_name == "Landlord"
    @my_properties = Own.where(user: current_user)
    render json: @my_properties
  end
end
