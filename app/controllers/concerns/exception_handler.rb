module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      respond_to do |format|
        format.json { render json: { error: e.message }, status: :not_found }
      end
    end
  end
end