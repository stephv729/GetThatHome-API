class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[my_properties show profile]

  def my_properties
    errors = {errors: "Must be Landlord"}
    return render json: errors, status: :unprocessable_entity unless current_user.role_name == "Landlord"
    @my_properties = Own.where(user: current_user)
    render json: @my_properties
  end

  def profile
    render json: current_user
  end

  def show
    render json: User.find(params[:id])
  end
end
