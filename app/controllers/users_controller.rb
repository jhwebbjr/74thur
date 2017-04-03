class UsersController < ApplicationController

  def new
    @user = User.new
  end

  # def index
  #   @users = User.all
  # end

  def create
    @user = User.new

    @user.username = user_params[:username]
    @user.name = user_params[:name]
    @user.email =  user_params[:email]
    @user.password_digest = user_params[:password_digest]

    if @user.save
      redirect_to user_path, notice: "Your youTwit account has been created!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end
end

private def user_params
  params.require(:user).permit(
  :username,
  :name,
  :email,
  :password_digest
  )
end
