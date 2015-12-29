class Product < ActiveRecord::Base
  validates :title, :body, :price, :quantity, :location, :category, presence: true
end
