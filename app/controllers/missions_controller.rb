class MissionsController < ApplicationController
	def create
		user = User.find(session[:user_id])
		@mission = user.missions.create(mission_params)

		if @mission.save
			flash[:notice] = "任務新增成功"
			redirect_to user_path(user)
		else
			format.html { render :new }
			format.json { render json: mission.errors, status: :unprocessable_entity }
		end
	end

	def update
		@mission = Mission.find(params[:id])
		@mission.update(mission_params)

		flash[:notice] = "任務更新成功"
		redirect_to user_path(session[:user_id])
	end

	def destroy
		@mission = Mission.find(params[:id])
		@mission.destroy
    	flash[:notice] = "任務已成功刪除"
      	redirect_to user_path(session[:user_id])
	end

	private
    def mission_params
      params.require(:mission).permit(:item, :duedate, :status, :sorting)
    end
end
