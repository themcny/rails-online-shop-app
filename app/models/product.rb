class Product < ActiveRecord::Base
  mount_uploader :product_img, ProductImgUploader

  scope :location, -> (location) { where location: location }
  scope :expiration_date, -> (expiration_date) { where expiration_date: expiration_date }
  scope :cheap_price, -> (price) { where 'price < ?', price }

  validates :title, :body, :location, :category, presence: true
  validates :price, :quantity,  presence: true
  # \A[a-zA-Z]+\z
  validates :title, format: { with: /\A+[a-zA-Z\s]+\z/,
                              message: "only allows letters" }
  # [A-Za-z0-9,\. ]{3,50}
  validates :location, :category, format: { with: /\A[\D]+\z/,
                                            message: "only allows letters, spaces, and punctuation." }
  validates :price, :quantity, numericality: { only_integer: true }

  validates :body, length: { in: 20..1000 }
  validates :title, length: { in: 3..15 }
  validates :category, length: { in: 5..30 }

  validates :location, inclusion: { :in => %w( In-Stock   Out-of-Stock   In-Transit   Everywhere   Expired ) ,
                                   message: ": \'%{value}\' is not included in the list, try dashes instead of spaces!" }

end
