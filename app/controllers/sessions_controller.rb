class SessionsController < ApplicationController
	def new
	end

	# 使用者登入
	def create
		# @user = User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])
		@user = User.find_by(name: params[:session][:name])

		if @user && @user.authenticate(params[:session][:password])
			session[:user_id] = @user.id
			flash[:notice] = "登入成功"
			redirect_to user_path(@user)
		else
			flash.now[:login_error] = "invalid username or password"
			render "new"
		end
	end

	# 使用者登出
	def destroy
		session[:user_id] = nil
		flash[:notice] = "使用者已登出"
		redirect_to root_path
	end

	private
	def user_params
		params.require(:session).permit(:name, :password)
	end
end