class CategoriesController < ApplicationController
  def index
    @table_id = "categories"
    @categories = Category.page(params[:page]).order("id ASC")
    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
  end

  def show
    @category = Category.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @category }
    end
  end

  def new
    @category = Category.new
    respond_to do |format|
      format.html
      format.json { render json: @category }
    end
  end

  def edit
    @category = Category.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @category }
    end
  end

  def create
    @category = Category.new(params[:category])
    respond_to do |format|
      if @category.save
        format.html { redirect_to root_path }
        format.json { render json: @category, status: :created }
      else
        puts "error on creating Category"
        puts @category.errors.count
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to @category }
        format.json { head :no_content }
      else
        puts "error on updating Category"
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      respond_to do |format|
        format.html { redirect_to categories_path}
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        puts "error on destroying Category"
        format.html { redirect_to category_path, alert: @category.errors.full_messages.to_sentence }
        format.json { head :no_content }
      end
    end
  end
end