class Admin::AdminController < ApplicationController
  layout "sessions"
    def authenticated?
      return :admin_session_new if session[:user].blank?
    end
end