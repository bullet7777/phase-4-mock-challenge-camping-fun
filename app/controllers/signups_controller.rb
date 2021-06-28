class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def create
        activity=Activity.find(params[:activity_id])
        signup=activity.signups.create(signup_params)
        render json: signup, status: :created
    end
    private

  def render_not_found_response
    render json: { error: "Signup not found" }, status: :not_found
  end
  def signup_params
    params.permit(:time, :activity_id, :camper_id)
  end
end
