class MainController < ApplicationController
  before_action :authenticate_user!, only: %i[my_properties show profile]

  def index
    render json: {msg: "This is the GetThatHome-API"}
  end

end
