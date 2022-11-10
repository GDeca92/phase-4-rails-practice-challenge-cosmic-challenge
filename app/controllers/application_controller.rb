class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
    
    private

    def render_not_found_response(object)
        render json: {error: "#{object.model} not found"}, status: :not_found
    end

    def record_invalid(object)
        render json: { errors: object.record.errors.full_messages }, status: :unprocessable_entity
    end
end
