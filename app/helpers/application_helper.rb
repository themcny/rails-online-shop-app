module ApplicationHelper

  def display_error(field)
    if @product.errors[field].any?
      "#{field.capitalize} #{@product.errors[field].first}"
    end
  end


  def display_user_error(field)
    if @user.errors[field].any?
      "#{field.capitalize} #{@user.errors[field].first}"
    end
  end

  def render_errors_conditionally(object, field)
    unless object.errors.messages[field].empty?
      render :partial => 'display_error', locals: { label: field }
    end
  end

end
