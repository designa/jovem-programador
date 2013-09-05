class Blog::HomeController < Blog::BlogController

  def index
    if params[:slug]
      @category = Category.find_by_slug(params[:slug])

      @headline =  @category.posts.all.reverse.first
      @sec_headline =  @category.posts.offset(1).limit(2)
      @posts =  @category.posts.offset(3).reverse
    
    else
      @headline = Post.all.reverse.first
      @sec_headline = Post.order("CREATED_AT desc").offset(1).limit(2)
      @posts = Post.order("CREATED_AT desc").offset(3).limit(6)
    end
  end
end