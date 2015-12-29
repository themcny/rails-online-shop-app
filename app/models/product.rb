class Product < ActiveRecord::Base
  validates :title, :body, :location, :category, presence: true
  validates :price, :quantity,  presence: true
  # \A[a-zA-Z]+\z
  validates :title, format: { with: /\A[a-zA-Z\s]+\z/,
                              message: "only allows letters" }
  # [A-Za-z0-9,\. ]{3,50}
  validates :location, :category, format: { with: /\A[\D]+\z/,
                                            message: "only allows letters, spaces, and punctuation." }
  validates :price, :quantity, numericality: { only_integer: true }

  validates :body, length: { in: 20..1000 }
  validates :title, length: { in: 5..15 }
  validates :category, length: { in: 5..30 }

  validates :location, inclusion: { in: %w(instock outofstock intransit),
                                    message: "not a valid location" }

  # def location_exists(location)
  #   p :location
  #   location = location.downcase
  #   p location
  #   unless location.downcase == 'in stock' || location.downcase == 'out of stock' || location.downcase == 'in transit'
  #     errors.add(:location, "not a proper location")
  #   end
  # end

  # self.location_exists(:location)

end
