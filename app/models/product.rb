class Product < ActiveRecord::Base
  validates :title, :body, :location, :category, presence: true
  validates :price, :quantity,  presence: true
  # \A[a-zA-Z]+\z
  validates :title, format: { with: /\A[a-zA-Z\s]+\z/,
                              message: "only allows letters" }
  validates :location, :category, format: { with: /[A-Za-z0-9,\. ]{3,50}/,
                                            message: "only allows letters, spaces, and punctuation." }
  validates :price, :quantity, numericality: { only_integer: true }
  validates :body, length: { in: 20..1000 }
  validates :title, length: { in: 5..15 }
  validates :category, length: { in: 5..30 }
end
