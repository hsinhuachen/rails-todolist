class MissionsController < ApplicationController
	def edit
	end

	def create
		@mission = Mission.new(mission_params)

		respond_to do |format|
		  if @mission.save

		  else
		    format.html { render :new }
		    format.json { render json: mission.errors, status: :unprocessable_entity }
		  end
		end
	end

	private
    def mission_params
      params.require(:mission).permit(:item, :duedate)
    end
end
