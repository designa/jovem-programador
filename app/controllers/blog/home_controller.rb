class Blog::HomeController < Blog::BlogController

  def index
    @headline = Post.all.reverse.first
    @sec_headline = Post.offset(1).limit(2).reverse
    @posts = Post.offset(3).reverse
  end
end