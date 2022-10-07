class CategoriesController < ApplicationController

  # GET / categories
  def index
    @categories = Category.all
    render json: @categories
  end

  # POST / categories
  def create
    @category = Category.new(category: params[:category])

    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category.update(catagory_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])
    p params
    @category.destroy
  end

  private

  def category_params
    params.require(:category)
  end
end
