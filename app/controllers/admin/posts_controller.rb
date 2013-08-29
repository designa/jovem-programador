class Admin::PostsController < Admin::AdminController
  before_filter :authenticated?

  def index
    @posts = Post.find_all_by_user_id(session[:admin].id).reverse
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Artigo salvo com sucesso!"
      respond_with @post, location: :admin_posts
    else
      flash[:alert] = "Ops!"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.attributes = params[:post]
    if @post.save
      flash[:notice] = "Post successfully updated!"
      respond_with @post, location: :admin_posts
    else
      flash[:alert] = "Something goes wrong!"
      render :new
    end
  end

  def delete
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:notice] = "Post was successfully removed"
    redirect_to admin_posts_path
  end

end