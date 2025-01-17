class UsersController < ApplicationController
  before_action :user_params, only: [:create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_later
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end