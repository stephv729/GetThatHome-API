class RegistrationsController < DeviseTokenAuth::RegistrationsController
   def sign_up_params
    user_params = params.permit(:email, :password, :phone, :name,:role)
    role = Role.find_by(name:user_params[:role] )
    user_params.except("role").merge!({role: role})
  end
  
  def render_create_success
    token = {
      "access-token": @token.token,
      "token-type": "Bearer",
      client: @token.client,
      uid: @resource.uid
    }
    render json: @resource.as_json(only: %i[id
                                            email]).merge!({ token:,
                                                             role_name: @resource.role_name })
  end
end
