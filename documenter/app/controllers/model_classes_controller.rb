class ModelClassesController < ApplicationController
  before_filter :set_model_class, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @model_classes = ModelClass.all
    respond_with(@model_classes)
  end

  def show
    @void = DataType.find(1)
    respond_with(@model_class)
  end

  def new
    project_id = params[:project_id]
    @project = nil
    if project_id
      @project = Project.find(project_id)
    end
    @model_class = ModelClass.new
    @model_class_collection = ModelClass.all
    respond_with(@model_class)
  end

  def edit
    project_id = params[:project_id]
    @project = nil
    if project_id
      @project = Project.find(project_id)
    end

    @model_class_collection = ModelClass.where("id != ?", @model_class.id)
  end

  def create
    @model_class = ModelClass.new(params[:model_class])
    @model_class.save
    data_type = DataType.find_or_create_by_name(:name => @model_class.name)
    data_type.save
    array_type = DataType.find_or_create_by_name(:name => "Array.#{@model_class.name}")
    array_type.save
    respond_with(@model_class.project)
  end

  def update
    data_type = DataType.find_or_create_by_name(:name => @model_class.name)
    array_type = DataType.find_or_create_by_name(:name => "Array.#{@model_class.name}")
    @model_class.update_attributes(params[:model_class])
    data_type.update_attributes(:name => @model_class.name)
    array_type.update_attributes(:name => "Array.#{@model_class.name}")
    respond_with(@model_class.project)
  end

  def destroy
    data_type = DataType.find_by_name(@model_class.name)
    array_type = DataType.find_by_name("Array.#{@model_class.name}")
    @model_class.destroy
    if data_type
      data_type.destroy
    end
    if array_type
      array_type.destroy
    end
    respond_with(@model_class.project)
  end

  private
    def set_model_class
      @model_class = ModelClass.find(params[:id])
    end
end
