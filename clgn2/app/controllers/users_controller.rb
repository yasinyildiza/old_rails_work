class UsersController < BaseController
  skip_before_filter :require_login, :only => [:new, :create]
 
  def index
    @table_id = "users"
    @users = User.page(params[:page]).order("id ASC")
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def create
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user }
        format.json { render json: @user, status: :created }
      else
        puts "error on creating user"
        puts @user.errors.count
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user }
        format.json { head :no_content }
      else
        puts "error on updating user"
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      respond_to do |format|
        format.html { redirect_to users_path}
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        puts "error on destroying user"
        format.html { redirect_to users_path, alert: @user.errors.full_messages.to_sentence }
        format.json { head :no_content }
      end
    end
  end

   def search_with_params
    redirect_to action: "index", :q => params[:q], :page => params[:page]
  end

  def forget_password
    @user = User.find(params[:id])
  end

  def save_password
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    session[:user] = user
    redirect_to user_path(user), :message => "Login with your new password"
  end

end
