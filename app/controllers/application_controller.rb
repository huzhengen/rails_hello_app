class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session

  def render_resource(resource)
    return head 404 if resource.nil?
    if resource.errors.empty?
      render json: { resource: resource }, status: 200
    else
      render json: { errors: resource.errors }, status: 422
    end
  end

  def current_user
    @current_user ||= User.find_by_id session[:current_user_id]
  end

end
