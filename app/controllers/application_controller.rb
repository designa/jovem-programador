class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :html
  before_filter :load_sidebar_content

  protected
  def load_sidebar_content
   @categories = Category.all
   @latest_posts = Post.order("created_at DESC").limit(3)
 end

end
