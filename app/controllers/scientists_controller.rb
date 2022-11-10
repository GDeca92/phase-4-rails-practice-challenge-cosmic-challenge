class ScientistsController < ApplicationController

    def index
        render json: Scientist.all, status: :ok
    end

    def show
        render json: find_scientist, status: :ok, serializer: ScientistPlanetsSerializer
    end

    def create
        render json: Scientist.create!(scientist_params), status: :created
    end

    # def update
    #     render json: find_scientist.update!(scientist_params), status: :accepted
    # end
    def update #returning boolean value
        find_scientist.update!(scientist_params)
        render json: find_scientist, status: :accepted
    end

    def destroy
        find_scientist.destroy
        head :no_content
    end

    private

    def find_scientist
        Scientist.find(params[:id])
    end

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end
end
