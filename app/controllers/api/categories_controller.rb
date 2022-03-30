module Api
  class CategoriesController < ApplicationController
    def index
      render :json => { message: "hi" }
    end

    def show
      @category = get_category_by_id
      unless @category.blank?
        render :json => @category
      else
        render :json => { message: "not found" }, status: :not_found
      end
    end

    def create
      @category = Category.create(params_category)
      if @category.save
        render :json => @category, status: :created
      else
        render :json => { error: "cannot create category" }, status: :bad_request
      end
    end

    def update
      @category = get_category_by_id
      if !@category.blank?
        @category.update(params_category)
        render :json => @category
      else
        render :json => { error: "not found" }, status: :not_found
      end
    end

    def destroy
      @category = get_category_by_id
      if @category.destroy
        render :json => @category
      else
        render :json => { error: "cannot delete" }, status: :bad_request
      end
    end

    private

    def get_category_by_id
      Category.find_by_id(params[:id])
    end

    def params_category
      params.permit(:name)
    end
  end
end
