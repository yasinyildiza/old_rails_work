class HousesController < BaseController
 
  def index
    '''
    @table_id = "houses"
    @houses = House.page(params[:page]).order("id ASC")
    respond_to do |format|
      format.html
      format.json { render json: @houses }
    end
    '''
    @table_id = "houses"
    my_params= get_search_params(params[:q])
    my_params = Hash.new if my_params.nil?
    if my_params #search is done
      @q = House.search(my_params)
      @q.build_grouping if @q.groupings.empty?
      @q.build_sort if @q.sorts.empty?
      @houses = @q.result.page(params[:page]).order("id DESC")
    else
      @houses = House.page(params[:page]).order("id DESC")
    end
    respond_to do |format|
      format.html
      format.json { render json: @houses }
    end
  end

  def show
    @house = House.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @house }
    end
  end

  def new
    @house = House.new
    @towns = []
    respond_to do |format|
      format.html
      format.json { render json: @house }
    end
  end

  def edit
    @house = House.find(params[:id])
    @towns = Town.find_all_by_city_id(@house.city.id)
  end

  def create
    @house = House.new(params[:house])
    respond_to do |format|
      if @house.save
        SnCode.create(:house_id => @house.id, :code => createSnCode(@house))
        format.html { redirect_to @house }
        format.json { render json: @house, status: :created }
      else
      	puts "error on creating house"
        puts @house.errors.count
        format.html { render action: "new" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @house = House.find(params[:id])
    respond_to do |format|
      if @house.update_attributes(params[:house])
        format.html { redirect_to @house }
        format.json { head :no_content }
      else
        puts "error on updating house"
        format.html { render action: "edit" }
        format.json { render json: @house.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @house = House.find(params[:id])
    if @house.destroy
      respond_to do |format|
        format.html { redirect_to houses_path}
        format.json { head :no_content }
      end
    else
      respond_to do |format|
      	puts "error on destroying house"
        format.html { redirect_to houses_path, alert: @house.errors.full_messages.to_sentence }
        format.json { head :no_content }
      end
    end
  end

end
