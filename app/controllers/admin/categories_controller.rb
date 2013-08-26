class Admin::CategoriesController < Admin::AdminController
  before_filter :authenticated?
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
    respond_with @category, location: :admin_categories
  end
    
end