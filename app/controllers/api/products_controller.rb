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

    def get_by_name
      @product = Product.where(name: params[:name])
      render :json => @product
    end

    def create
      @image = params[:product_image]
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
      params.permit(:name, :description, :quantity, :price, :product_image)
    end

  end
end


