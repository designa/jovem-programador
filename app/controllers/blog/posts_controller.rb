class Blog::PostsController < Blog::BlogController

  def show
    @post = Post.find(params[:id])
  end
    
end