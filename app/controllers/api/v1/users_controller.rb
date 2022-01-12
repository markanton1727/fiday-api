class Api::V1::UsersController < ApiController
  def index
    authorize User
    render json: User.all
  end
end