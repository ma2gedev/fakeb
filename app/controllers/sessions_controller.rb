class SessionsController < ApplicationController
  def create
    user = User.find_by_name(params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      if params[:remember_me]
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent.signed[:auto_login_token] = user.auto_login_token
      end
      flash[:notice] = t("flash.sessions.create.notice")
      redirect_to "/"
    else
      flash.now[:alert] = t("flash.sessions.create.alert")
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    cookies.delete(:user_id)
    cookies.delete(:auto_login_token)
    flash[:notice] = t("flash.sessions.destroy.notice")
    redirect_to "/"
  end
end
