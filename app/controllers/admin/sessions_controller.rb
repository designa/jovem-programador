class Admin::SessionsController < Admin::AdminController
  layout "login"

  def new
    @users = User.all
  end

  def create
    user = params[:login][:email]
    password = params[:login][:password]
    @user = User.find_by_email_and_password(user,password)

    if @user
      session[:admin] = @user
      flash[:notice] = "Welcome (:"
      redirect_to :admin_root
    else
      flash[:alert] = "Something goes wrong!"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end
end