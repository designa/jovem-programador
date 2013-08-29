class Admin::CategoriesController < Admin::AdminController
  before_filter :authenticated?
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = "Category successfully created!"
      redirect_to :admin_categories
    else
      flash[:alert] = "Something goes wrong!"
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.attributes = params[:category]
    if @category.save
      flash[:notice] = "Category successfully updated!"
      redirect_to :admin_categories
    else
      flash[:alert] = "Something goes wrong!"
      render :new
    end
  end

  def delete
    @category = Category.find(params[:id])
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:notice] = "Category was successfully removed"
  end
end