class Product < ApplicationRecord
  has_one_attached :product_image #for connection from ProductModel to ActiveStorage item


end
