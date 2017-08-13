class SnUrlsController < ApplicationController

  def index
    @table_id = "sn_urls"
    @sn_urls = SnUrl.page(params[:page]).order("id ASC")
    respond_to do |format|
      format.html
      format.json { render json: @sn_urls }
    end
  end

  def show
    @sn_url = SnUrl.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @sn_url }
    end
  end

  def new
    @sn_url = SnUrl.new
    respond_to do |format|
      format.html
      format.json { render json: @sn_url }
    end
  end

  def edit
    @sn_url = SnUrl.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @sn_url }
    end
  end

  def create
    @sn_url = SnUrl.new(params[:sn_url])
    sn_code_check = createSnCode(@sn_url, params[:number_of_digits].to_i, params[:short_name])
    respond_to do |format|
      if sn_code_check == 0 and @sn_url.save
        format.html { redirect_to @sn_url }
        format.json { render json: @sn_url, status: :created }
      else
        if sn_code_check == -1
          flash[:error] = (t "errors.short_name_exists")
        elsif sn_code_check == -2
          flash[:error] = (t "errors.full_number_of_digits")
        end
        puts "error on creating SnUrl"
        puts @sn_url.errors.count
        format.html { render action: "new" }
        format.json { render json: @sn_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @sn_url = SnUrl.find(params[:id])
    respond_to do |format|
      if @sn_url.update_attributes(params[:sn_url])
        format.html { redirect_to @sn_url }
        format.json { head :no_content }
      else
        puts "error on updating SnUrl"
        format.html { render action: "edit" }
        format.json { render json: @sn_url.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sn_url = SnUrl.find(params[:id])
    if @sn_url.destroy
      respond_to do |format|
        format.html { redirect_to sn_urls_path}
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        puts "error on destroying SnUrl"
        format.html { redirect_to sn_url_path, alert: @sn_url.errors.full_messages.to_sentence }
        format.json { head :no_content }
      end
    end
  end

  def search
  end

  def go
    sn_code = SnCode.find_by_value(params[:q])
    if sn_code
      @sn_url = SnUrl.find_all_by_sn_code_id(sn_code.id).first
    else
      sn_code = SnCode.find_by_short_name(params[:q])
        if sn_code
          @sn_url = SnUrl.find_all_by_sn_code_id(sn_code.id).first
        else
          puts "no SN URL found for SN Code #{params[:q]}"
          flash[:error] = (t "errors.no_sn_url_found")
        end
    end
    respond_to do |format|
      if sn_code
        format.html
        format.json { render json: @sn_url }
      else
        format.html { redirect_to sn_url_search_path}
        format.json {head :no_content}
      end
    end
  end

end
