class SessionsController < DeviseTokenAuth::SessionsController
  def render_create_success
    token = {
      "access-token": @token.token,
      "token-type": "Bearer",
      client: @token.client,
      uid: @resource.uid
    }
    render json: @resource.as_json(only: %i[id
                                            email name phone]).merge!({ token:,
                                                             role_name: @resource.role_name })
  end
end
