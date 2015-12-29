class Product < ActiveRecord::Base
  validates :title, :body, :location, :category, presence: true
  validates :price, :quantity,  presence: true

  validates :title, format: { with: /[A-Za-z\s]+/,
                              message: "only allows letters" }
  validates :location, :category, format: { with: /[A-Za-z0-9,\. ]{3,50}/,
                                            message: "only allows letters, spaces, and punctuation." }
  validates :price, :quantity, numericality: { only_integer: true }
  validates :body, length: { in: 20..1000 }
end
