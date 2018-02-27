class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :render_page_not_found

  def render_page_not_found
    render 'errors/not_found', status: :not_found, formats: :html
  end
end
