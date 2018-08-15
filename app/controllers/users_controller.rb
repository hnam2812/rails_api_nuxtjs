class UsersController < ApplicationController
  before_action :authenticate_user!, except: :create

  def index
    users = User.all.select(:id, :email)
    render json: users
  end

  def create
    user = User.create user_params
    render json: user
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end