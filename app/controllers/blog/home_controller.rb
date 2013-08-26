class Blog::HomeController < Blog::BlogController

  def index
    @posts = Post.all
  end
    
end