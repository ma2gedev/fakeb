class AccountsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = t("flash.accounts.create.notice")
      redirect_to "/"
    else
      render :new
    end
  end

  def destroy
    # @task: delete user
  end
end
