class Blog::UsersController < Blog::BlogController

  def show
    @author = User.find(params[:id])
  end
end