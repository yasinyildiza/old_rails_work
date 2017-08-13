class MethodParametersController < ApplicationController
  before_filter :set_method_parameter, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @method_parameters = MethodParameter.all
    respond_with(@method_parameters)
  end

  def show
    respond_with(@method_parameter)
  end

  def new
    method_member_id = params[:method_member_id]
    @method_member = nil
    if method_member_id
      @method_member = MethodMember.find(method_member_id)
    end
    @method_parameter = MethodParameter.new
    respond_with(@method_parameter)
  end

  def edit
    method_member_id = params[:method_member_id]
    @method_member = nil
    if method_member_id
      @method_member = MethodMember.find(method_member_id)
    end
  end

  def create
    @method_parameter = MethodParameter.new(params[:method_parameter])
    @method_parameter.save
    respond_with(@method_parameter.method_member)
  end

  def update
    @method_parameter.update_attributes(params[:method_parameter])
    respond_with(@method_parameter.method_member)
  end

  def destroy
    @method_parameter.destroy
    respond_with(@method_parameter.method_member)
  end

  private
    def set_method_parameter
      @method_parameter = MethodParameter.find(params[:id])
    end
end
