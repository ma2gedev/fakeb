class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :reset_session instead.
  protect_from_forgery with: :exception

  private
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    elsif cookies.signed[:user_id]
      @current_user ||= User.find_by_id_and_auto_login_token(
                                                            cookies.signed[:user_id],
                                                            cookies.signed[:auto_login_token])
    end
  end
  helper_method :current_user

  def authenticate_user
    redirect_to :new_session unless current_user
  end
end
