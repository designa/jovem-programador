module PostDecorator
  
  def show_categories
    content = ""
    post_categories.each do |category|
      content << content_tag(:span, category.name, class: "label", style: "background-color: #{category.color}")
    end
    content.html_safe
  end

end