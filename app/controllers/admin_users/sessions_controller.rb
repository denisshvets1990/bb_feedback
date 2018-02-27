class AdminUsers::SessionsController < Devise::SessionsController
  private

  def after_sign_in_path_for(_resource)
    :admin_feedbacks
  end
end