module Api
  class ProductsController < ApplicationController

    def index
      @products = Product.order(id: :desc)
      render :json => @products
    end

    def show
      begin
        @product = Product.find(params[:id])
        render :json => @product
      rescue
        render :json => { error: "PRODUCT ID #{params[:id]} NOT FOUND!" }, status: :not_found
      end
    end

    def create
      @product = Product.create(product_params)
      @product.save
      render json: @product, status: :created
    end

    def update
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
        render :json => "PRODUCT ID #{params[:id]} NOT FOUND!", status: :bad_request
      end
    end

    private

    def product_params
      params.permit(:name, :description, :quantity, :price)
    end


  end
end


