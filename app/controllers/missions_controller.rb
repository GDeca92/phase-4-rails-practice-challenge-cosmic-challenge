class MissionsController < ApplicationController
    def create
        render json: Mission.create!(mission_params).planet, status: :created
    end

    private
    
    def mission_params
        params.permit(:name, :scientist_id, :planet_id)
    end
end
