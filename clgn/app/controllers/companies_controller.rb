class CompaniesController < BaseController
  skip_before_filter :require_login, :only => [:new, :create]
 
  def index
    @table_id = "companies"
    @companies = Company.page(params[:page]).order("id ASC")
    respond_to do |format|
      format.html
      format.json { render json: @companies }
    end
  end

  def show
    @company = Company.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @company }
    end
  end

  def new
    @company = Company.new
    respond_to do |format|
      format.html
      format.json { render json: @company }
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(params[:company])
    respond_to do |format|
      if @company.save
        format.html { redirect_to @company }
        format.json { render json: @company, status: :created }
      else
      	puts "error on creating company"
        puts @company.errors.count
        format.html { render action: "new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @company = Company.find(params[:id])
    respond_to do |format|
      if @company.update_attributes(params[:company])
        format.html { redirect_to @company }
        format.json { head :no_content }
      else
        puts "error on updating company"
        format.html { render action: "edit" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @company = Company.find(params[:id])
    if @company.destroy
      respond_to do |format|
        format.html { redirect_to companies_path}
        format.json { head :no_content }
      end
    else
      respond_to do |format|
      	puts "error on destroying company"
        format.html { redirect_to companies_path, alert: @company.errors.full_messages.to_sentence }
        format.json { head :no_content }
      end
    end
  end

end
