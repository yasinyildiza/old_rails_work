class ProjectsController < ApplicationController
  def index
    @table_id = "projects"
    @projects = Project.page(params[:page]).order("id ASC")
    respond_to do |format|
      format.html
      format.json { render json: @projects }
    end
  end

  def show
    @project = Project.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
  end

  def new
    @project = Project.new
    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
  end

  def edit
    @project = Project.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @project }
    end
  end

  def create
    @project = Project.new(params[:project])
    respond_to do |format|
      if @project.save
        @general_work = Work.new(:project_id => @project.id, :category_id => 1, :name => "General")
        @general_work.save
        format.html { redirect_to root_path }
        format.json { render json: @project, status: :created }
      else
        puts "error on creating Project"
        puts @project.errors.count
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project }
        format.json { head :no_content }
      else
        puts "error on updating Project"
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.destroy
      respond_to do |format|
        format.html { redirect_to projects_path}
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        puts "error on destroying Project"
        format.html { redirect_to project_path, alert: @project.errors.full_messages.to_sentence }
        format.json { head :no_content }
      end
    end
  end
end
