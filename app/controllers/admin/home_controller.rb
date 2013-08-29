class Admin::HomeController < Admin::AdminController
  before_filter :authenticated?

  def index
  end

end