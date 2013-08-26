class Blog::Admin::PostsController < Blog::Admin::AdminController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Post gravado com sucesso!"
    else
      flash[:alert] = "Por favor, verifique os erros abaixo."
    end
    respond_with @post, location: blog_post_path(@post)
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
      flash[:notice] = "Post atualizado com sucesso!"
    else
      flash[:alert] = "Por favor, verifique os erros abaixo."
    end
    respond_with @post, location: blog_post_path(@post)
  end

  def delete
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Post deletado com sucesso."
    end
    redirect_to :blog_posts
  end

end