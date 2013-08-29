module ApplicationHelper
  def body_id_and_class
    "id=#{current_controller} class=#{action_name}"
  end

  def current_controller
    controller_name = controller.class.name.underscore
    controller_name.gsub!(/\//, "_")
    controller_name.gsub!(/_controller$/, "")
  end

  def current_user
    User.find(session[:admin]) if session[:admin]
  end

  def is_active?(path, controller = nil)
    if (current_page?(path) || (params[:controller] == controller))
      "active"
    end
  end

  def admin?
    true if current_user.id == 1
  end

  def show_post_categories(post)
    html = ""
    post.categories.each do |category|
      html << " #{content_tag :span, (link_to category.name, root_path(slug: category.slug)), class: 'label'}"
    end
    html.html_safe
  end

end
