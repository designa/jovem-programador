class Blog::Admin::CategoriesController < Blog::Admin::AdminController

  def index
    @categories = PostCategory.all
  end

  def new
    @category = PostCategory.new
  end

  def create
    @category = PostCategory.new(params[:post_category])
    if @category.save
      flash[:notice] = "Categoria criada com sucesso."
    else
      flash[:alert] = "Por favor, verifique os error abaixo."
    end
    respond_with @category, location: :blog_categories
  end
    
end