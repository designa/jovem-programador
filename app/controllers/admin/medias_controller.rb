class Admin::MediasController < Admin::AdminController

  def index
    @medias = Ckeditor::Picture.all
  end

end