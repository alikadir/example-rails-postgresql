module Api
  class CategoriesController < ApplicationController

    before_action :input_validation, only: %i[create update]
    before_action :my_before_action, only: %i[update destroy]
    #after_action

    def index
      render json: { message: 'hi' }
    end

    def show
      @category = get_category_by_id
      if @category.blank?
        render json: { message: 'not found' }, status: :not_found
      else
        render json: @category
      end
    end

    def create
      @category = Category.create(params_category)
      if !@category.valid?
        render @category.errors.full_messages
      elsif @category.save
        render json: @category, status: :created
      else
        render json: { error: 'cannot create category' }, status: :bad_request
      end
    end

    def update
      if !@category.blank?
        @category.update(params_category)
        render json: @category
      else
        render json: { error: 'not found' }, status: :not_found
      end
    end

    def destroy
      if @category.destroy
        render json: @category
      else
        render json: { error: 'cannot delete' }, status: :bad_request
      end
    end

    private

    def get_category_by_id
      Category.find_by_id(params[:id])
    end

    def params_category
      params.permit(:name) # result {name: "Electronics"}
    end

    def my_before_action
      @category = get_category_by_id
    end

    def input_validation
      render json: { message: 'name is required!' } unless params[:name]
    end
  end
end
