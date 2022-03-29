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

    def update
      being

      rescue
      @product = Product.find(params[:id])
      # @product = Product.find(id: params[:id]) # you can also write the id parameter
      @product.update(product_params)
      render json: @product
    end

    def destroy
      @product = Product.find_by_id(params[:id])
      if @product
        @product.destroy
        render json: @product
      else
        render :json => "PRODUCT NOT FOUND!"
      end
    end

    def product_params
      @my_params = params.permit(:name, :description, :quantity, :price)
      pp @my_params
      @my_params
    end
  end
end


