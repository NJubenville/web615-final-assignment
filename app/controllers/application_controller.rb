# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery prepend: true, unless: -> { request.format.json? }
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    json_response = {}
    json_response['error'] = 'You are forbidden to perform this action'
    flash[:alert] = 'You are not authorized to perform this action.'
    respond_to do |format|
      format.html { redirect_to(request.referrer || root_path) }
      format.json { render json: json_response, status: :forbidden }
    end
  end
end
