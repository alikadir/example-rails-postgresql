module Api
  class ProductsController < ApplicationController

    def index
      @products = Product.order(id: :desc)
      render :json => @products
    end

    def show
      begin
        @product = Product.find(params[:id])
        @image = rails_blob_url(@product.product_image)
        render :json => { product: @product, image: @image }
      rescue
        render :json => { error: "PRODUCT ID #{params[:id]} NOT FOUND!" }, status: :not_found
      end
    end

    def get_by_price_range
      # we can write sql in where method
      @product = Product.where("price > :min and price < :max", max: params[:max], min: params[:min])
      render :json => @product
    end

    def create
      @image = params[:product_image]
      @product = Product.create(product_params)
      if @product.save
        render json: @product, status: :created
      else
        render json: @product.errors.full_messages
      end
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
      params.permit(:name, :description, :quantity, :price, :product_image)
    end

  end
end


