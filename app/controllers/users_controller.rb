class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:username, :plan)
  end
end