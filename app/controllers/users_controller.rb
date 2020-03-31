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
    @missions = @user.missions

    if params[:mission_id]
      @mission = Mission.find(params[:mission_id])
    else
      @mission = Mission.new
    end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
