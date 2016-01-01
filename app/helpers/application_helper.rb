module ApplicationHelper

  def display_error(object, field)
    if object.errors[field].any?
      "#{field.capitalize} #{object.errors[field].first}"
    end
  end

  def render_errors_conditionally(object, field)
    unless object.errors.messages[field].empty?
      render :partial => 'display_error', locals: { object: object, label: field }
    end
  end

  def change_timezone(time)
    if current_user
      time.in_time_zone(current_user.timezone).strftime(" %m/%d/%Y at %I:%M%p")
    else
      time.localtime.strftime(" %m/%d/%Y at %I:%M%p")
    end
  end

  def buyable(product_object)
    if product_object.quantity <= 0
      return false
    elsif product_object.expiration_date < DateTime.now.utc
      return false
    else
      return true
    end
  end
end
