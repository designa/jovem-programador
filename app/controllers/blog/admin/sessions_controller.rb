class Blog::Admin::SessionsController < Blog::Admin::AdminController

  def new
  end

  def create
    if params[:login][:username] == BLOG_USER && params[:login][:password] == BLOG_PASSWORD
      session[:user] = true
      redirect_to :blog_posts
    else
      render :new
    end
  end

  def destroy
    reset_sessions
    redirect_to :root
  end
    
end