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

end
