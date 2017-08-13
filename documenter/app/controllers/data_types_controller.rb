class DataTypesController < ApplicationController
  before_filter :set_data_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @data_types = DataType.all
    respond_with(@data_types)
  end

  def show
    respond_with(@data_type)
  end

  def new
    @data_type = DataType.new
    respond_with(@data_type)
  end

  def edit
  end

  def create
    @data_type = DataType.new(params[:data_type])
    @data_type.save
    respond_with(@data_type)
  end

  def update
    @data_type.update_attributes(params[:data_type])
    respond_with(@data_type)
  end

  def destroy
    @data_type.destroy
    respond_with(@data_type)
  end

  private
    def set_data_type
      @data_type = DataType.find(params[:id])
    end
end
