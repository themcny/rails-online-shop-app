module ApplicationHelper

def display_error(field)
  if @product.errors[field].any?
    "#{field.capitalize} #{@product.errors[field].first}"
  end
end

end
