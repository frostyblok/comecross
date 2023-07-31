class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  private

  def record_invalid(error)
    redirect_to visits_path, alert: error.message
  end
end
