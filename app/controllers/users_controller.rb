class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[my_properties show profile]

  def my_properties
    return render status: :unprocessable_entity unless current_user.role_name == "Landlord"
    @my_properties = Own.where(user: current_user)
    render json: @my_properties
  end

  def create
    puts role = Role.find_by(name:user_params[:role] )
    @user = User.new(user_params.except("role").merge!({role: role}))

    if @user.save
      render json: @user, status: :created # 201
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def profile
    render json: current_user
  end

  def show
    render json: User.find(params[:id])
  end

  private

  def user_params
    params.permit(:email, :password, :phone, :name,:role)
  end
end
