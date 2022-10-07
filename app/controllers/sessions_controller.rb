# # frozen_string_literal: true

# class SessionsController < ApplicationController
#   def create
#     user = User.find_by(email: params[:email])
#     if user&.valid_password?(params[:password])
#       # extract client from auth header
#       client = request.headers["client"]

#       # update token, generate updated auth headers for response
#       new_auth_header = user.create_new_auth_token(client)
#       token = new_auth_header['Authorization'].sub("Bearer ","")
#       # update response with the header that will be required by the next request
#       response.headers.merge!(new_auth_header)
#       render json: user.as_json(only: %i[id email]).merge!({token: token}), status: :created
#     else
#       head(:unauthorized)
#     end
#   end

#   def destroy; end
# end
class SessionsController < DeviseTokenAuth::SessionsController
  def render_create_success
    # p @resource.authorization
    token = {
      "access-token": @token.token,
      "token-type": "Bearer",
      client: @token.client,
      uid: @resource.uid
    }
    render json: @resource.as_json(only: %i[email id]).merge!({ token: })
  end
end
