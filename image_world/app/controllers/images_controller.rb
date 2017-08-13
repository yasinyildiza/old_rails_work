class ImagesController < ApplicationController
  def index
    @table_id = "images"
    @images = Image.page(params[:page]).order("id ASC")
    respond_to do |format|
      format.html
      format.json { render json: @images }
    end
  end

  def show
    @image = Image.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @image }
    end
  end

  def new
    @image = Image.new
    respond_to do |format|
      format.html
      format.json { render json: @image }
    end
  end

  def edit
    @image = Image.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @image }
    end
  end

  def create
    @image = Image.new(params[:image])
    respond_to do |format|
      if @image.save
        format.html { redirect_to @image }
        format.json { render json: @image, status: :created }
      else
        puts "error on creating Image"
        puts @image.errors.count
        format.html { render action: "new" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @image = Image.find(params[:id])
    @image.attributes = params[:image]
    '''
    puts "********************"
    puts "list of changed attributes"
    puts @image.changed
    puts "list of changed attributes end"
    puts "********************"
    '''
    respond_to do |format|
      if @image.update_attributes(params[:image])
        format.html { redirect_to @image }
        format.json { head :no_content }
      else
        puts "error on updating Image"
        format.html { render action: "edit" }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      respond_to do |format|
        if session[:work_action] == "show"
          format.html { redirect_to work_path(session[:work_id])}
        elsif session[:work_action] == "edit"
          format.html { redirect_to edit_work_path(session[:work_id])}
        end
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        puts "error on destroying Image"
        format.html { redirect_to image_path, alert: @image.errors.full_messages.to_sentence }
        format.json { head :no_content }
      end
    end
  end
end
