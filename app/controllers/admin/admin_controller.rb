class Admin::AdminController < ApplicationController
  layout "admin"
  before_filter :logged_user

  protected

  def logged_user
    @user = User.find(session[:admin]) if session[:admin]
  end

  def authenticated?
    if !session[:admin]
      flash[:alert] = "You must be loggend in."
      redirect_to :admin_login
    end
  end

end