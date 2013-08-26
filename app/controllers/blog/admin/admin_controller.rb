class Blog::Admin::AdminController < Blog::BlogController

    def authenticated?
      return :session_new unless session[:user]
    end
end