class ReturnValuesController < ApplicationController
  before_filter :set_return_value, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @return_values = ReturnValue.all
    respond_with(@return_values)
  end

  def show
    respond_with(@return_value)
  end

  def new
    method_member_id = params[:method_member_id]
    @method_member = nil
    if method_member_id
      @method_member = MethodMember.find(method_member_id)
    end
    @return_value = ReturnValue.new
    respond_with(@return_value)
  end

  def edit
    method_member_id = params[:method_member_id]
    @method_member = nil
    if method_member_id
      @method_member = MethodMember.find(method_member_id)
    end
  end

  def create
    @return_value = ReturnValue.new(params[:return_value])
    @return_value.save
    respond_with(@return_value.method_member)
  end

  def update
    @return_value.update_attributes(params[:return_value])
    respond_with(@return_value.method_member)
  end

  def destroy
    @return_value.destroy
    respond_with(@return_value.method_member)
  end

  private
    def set_return_value
      @return_value = ReturnValue.find(params[:id])
    end
end
