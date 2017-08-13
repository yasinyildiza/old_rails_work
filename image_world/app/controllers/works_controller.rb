class WorksController < ApplicationController
  def index
    @table_id = "works"
    @works = Work.page(params[:page]).order("id ASC")
    respond_to do |format|
      format.html
      format.json { render json: @works }
    end
  end

  def show
    @work = nil
    if params[:project_id]
      @work = Project.find(params[:project_id]).general_work
    else
      @work = Work.find(params[:id])
    end
    session[:work_id] = params[:id]
    session[:work_action] = "show"
    @images = @work.images.order("version DESC")
    respond_to do |format|
      format.html
      format.json { render json: @work }
    end
  end

  def new
    @work = Work.new
    respond_to do |format|
      format.html
      format.json { render json: @work }
    end
  end

  def edit
    @work = Work.find(params[:id])
    session[:work_id] = params[:id]
    session[:work_action] = "edit"
    @images = @work.images.order("version DESC")
    respond_to do |format|
      format.html
      format.json { render json: @work }
    end
  end

  def create
    @work = Work.new(params[:work])
    respond_to do |format|
      if @work.save
        format.html { redirect_to @work }
        format.json { render json: @work, status: :created }
      else
        puts "error on creating Work"
        puts @work.errors.count
        format.html { render action: "new" }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @work = Work.find(params[:id])
    respond_to do |format|
      if @work.update_attributes(params[:work])
        if params[:work] and params[:work][:images_attributes]
          version = 0
          if @work.images.last.version.nil?
            if @work.images.count == 1
              version = 1
            else
              version = @work.images.order("version ASC").last.version + 1
            end
            @work.images.last.update_attributes(:version => version)
          end
        end
        format.html { redirect_to @work }
        format.json { head :no_content }
      else
        puts "error on updating Work"
        format.html { render action: "edit" }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @work = Work.find(params[:id])
    if @work.destroy
      respond_to do |format|
        format.html { redirect_to works_path}
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        puts "error on destroying Work"
        format.html { redirect_to Work_path, alert: @work.errors.full_messages.to_sentence }
        format.json { head :no_content }
      end
    end
  end
end
