class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    if resource.is_a?(User)
      dashboard_path
    elsif resource.is_a?(AdminUser)
      admin_path
    end
  end

end
