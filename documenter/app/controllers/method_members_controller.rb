class MethodMembersController < ApplicationController
  before_filter :set_method_member, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @method_members = MethodMember.all
    respond_with(@method_members)
  end

  def show
    respond_with(@method_member)
  end

  def new
    model_class_id = params[:model_class_id]
    @model_class = nil
    if model_class_id
      @model_class = ModelClass.find(model_class_id)
    end
    @method_member = MethodMember.new
    respond_with(@method_member)
  end

  def edit
  end

  def create
    @method_member = MethodMember.new(params[:method_member])
    @method_member.save
    respond_with(@method_member)
  end

  def update
    @method_member.update_attributes(params[:method_member])
    if params[:commit] == "Add Parameter" or params[:commit] == "Add Return Value"
      respond_with(@method_member)
    else
      respond_with(@method_member.model_class)
    end
  end

  def destroy
    @method_member.destroy
    respond_with(@method_member.model_class)
  end

  private
    def set_method_member
      @method_member = MethodMember.find(params[:id])
    end
end
