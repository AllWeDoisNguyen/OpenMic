class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :current_comedian

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id])
  end

  def current_comedian
  	@current_comedian ||= Comedian.find_by(id: session[:comedian_id])
  end

  def require_logged_in
  	return true if current_user || current_comedian

  	return redirect_to root_path
  end

  def require_comedian_logged_in
  	return true if current_comedian

  	return redirect_to root_path
  end

end
