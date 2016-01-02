module ProductsHelper
  def sortable(object_collection, attribute)
    product_array = []
    object_collection.each do |product|
      product_array << product
    end
    object_collection = product_array.sort! { |x,y| x[attribute] <=> y[attribute] }
  end
end
