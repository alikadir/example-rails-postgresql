class Product < ApplicationRecord
  has_one_attached :product_image # for connection from ProductModel to ActiveStorage item

  validates :quantity, numericality: { message: "%{value} not a number!" }
  validates :name, presence: { message: "name is required!" }, length: { maximum: 20, minimum: 3 }

  belongs_to :category
end
