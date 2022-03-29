module Api
  class ProductsController < ApplicationController

    def index
      p "index == call"
    end

    def create
      @product = Product.create(product_params)
      @product.save
      render json: @product
    end

    def product_params
      params.permit(:name, :description, :quantity, :price)
    end
  end
end


