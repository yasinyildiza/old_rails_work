class DataMembersController < ApplicationController
  before_filter :set_data_member, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @data_members = DataMember.all
    respond_with(@data_members)
  end

  def show
    respond_with(@data_member)
  end

  def new
    model_class_id = params[:model_class_id]
    @model_class = nil
    if model_class_id
      @model_class = ModelClass.find(model_class_id)
    end
    @data_member = DataMember.new
    respond_with(@data_member)
  end

  def edit
    model_class_id = params[:model_class_id]
    @model_class = nil
    if model_class_id
      @model_class = ModelClass.find(model_class_id)
    end
  end

  def create
    @data_member = DataMember.new(params[:data_member])
    @data_member.save
    respond_with(@data_member.model_class)
  end

  def update
    @data_member.update_attributes(params[:data_member])
    respond_with(@data_member.model_class)
  end

  def destroy
    @data_member.destroy
    respond_with(@data_member.model_class)
  end

  private
    def set_data_member
      @data_member = DataMember.find(params[:id])
    end
end
