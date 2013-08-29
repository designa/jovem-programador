class Admin::UsersController < Admin::AdminController
  before_filter :authenticated?

  def index
    @users = User.all.reverse
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "User successfully created!"
      redirect_to :admin_users
    else
      flash[:alert] = "Something goes wrong!"
      render :new
    end
  end


end