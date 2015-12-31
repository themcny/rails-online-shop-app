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

end
