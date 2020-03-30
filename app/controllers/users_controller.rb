class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.create(user_params)
  	if @user.save
  		redirect_to :sessions_new
  	else
  		render "new"
  	end
  end

  def show
    @user = User.find(session[:user_id])
    @mission = Mission.new
    @missions = @user.missions
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
