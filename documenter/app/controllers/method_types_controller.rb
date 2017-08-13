class MethodTypesController < ApplicationController
  before_filter :set_method_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @method_types = MethodType.all
    respond_with(@method_types)
  end

  def show
    respond_with(@method_type)
  end

  def new
    @method_type = MethodType.new
    respond_with(@method_type)
  end

  def edit
  end

  def create
    @method_type = MethodType.new(params[:method_type])
    @method_type.save
    respond_with(@method_type)
  end

  def update
    @method_type.update_attributes(params[:method_type])
    respond_with(@method_type)
  end

  def destroy
    @method_type.destroy
    respond_with(@method_type)
  end

  private
    def set_method_type
      @method_type = MethodType.find(params[:id])
    end
end
