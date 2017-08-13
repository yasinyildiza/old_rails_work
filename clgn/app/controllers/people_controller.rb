class PeopleController < BaseController
  skip_before_filter :require_login, :only => [:new, :create]
 
  def index
    @table_id = "people"
    @people = Person.page(params[:page]).order("id ASC")
    respond_to do |format|
      format.html
      format.json { render json: @people }
    end
  end

  def show
    @person = Person.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @person }
    end
  end

  def new
    @person = Person.new
    respond_to do |format|
      format.html
      format.json { render json: @person }
    end
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(params[:person])
    respond_to do |format|
      if @person.save
        format.html { redirect_to @person }
        format.json { render json: @person, status: :created }
      else
      	puts "error on creating person"
        puts @person.errors.count
        format.html { render action: "new" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @person = Person.find(params[:id])
    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to @person }
        format.json { head :no_content }
      else
        puts "error on updating person"
        format.html { render action: "edit" }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @person = Person.find(params[:id])
    if @person.destroy
      respond_to do |format|
        format.html { redirect_to people_path}
        format.json { head :no_content }
      end
    else
      respond_to do |format|
      	puts "error on destroying person"
        format.html { redirect_to people_path, alert: @person.errors.full_messages.to_sentence }
        format.json { head :no_content }
      end
    end
  end

end
