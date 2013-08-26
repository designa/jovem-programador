class Admin::SessionsController < Admin::AdminController

  def new
  end

  def create
    if params[:login][:username] == BLOG_USER && params[:login][:password] == BLOG_PASSWORD
      session[:user] = true
      redirect_to :admin_posts
    else
      render :new
    end
  end

  def destroy
    reset_sessions
    redirect_to :root
  end
    
end