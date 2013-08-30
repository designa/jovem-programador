class Blog::HomeController < Blog::BlogController

  def index
    if params[:slug]
      @category = Category.find_by_slug(params[:slug])
      @headline =  @category.posts.all.reverse.first
      @sec_headline =  @category.posts.offset(1).limit(2).reverse
      @posts =  @category.posts.offset(3).reverse
    else
      @headline = Post.all.reverse.first
      @sec_headline = Post.offset(1).limit(2).reverse
      @posts = Post.offset(3).reverse
    end
  end
end