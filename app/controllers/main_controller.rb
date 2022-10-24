class MainController < ApplicationController
  def index
    render json: {msg: "This is the GetThatHome-API"}
  end

end
