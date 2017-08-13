class ClassTypesController < ApplicationController
  before_filter :set_class_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @class_types = ClassType.all
    respond_with(@class_types)
  end

  def show
    respond_with(@class_type)
  end

  def new
    @class_type = ClassType.new
    respond_with(@class_type)
  end

  def edit
  end

  def create
    @class_type = ClassType.new(params[:class_type])
    @class_type.save
    respond_with(@class_type)
  end

  def update
    @class_type.update_attributes(params[:class_type])
    respond_with(@class_type)
  end

  def destroy
    @class_type.destroy
    respond_with(@class_type)
  end

  private
    def set_class_type
      @class_type = ClassType.find(params[:id])
    end
end
