class NotificationsController < ApplicationController
	def index
	  @table_id = "notifications"
	  @notifications = Notification.page(params[:page]).order("id DESC")
	end

	def show
	  @table_id = "notifications"
	  @notification = Notification.find(params[:id])

	  respond_to do |format|
	    format.html
	    format.json { render json: @notification }
	  end
	end

	def new
	  @table_id = "notifications"
	  @notification = Notification.new

	  respond_to do |format|
        format.html
      	format.json { render json: @notification }
      end
	end

	def create
	  @table_id = "notifications"
	  params[:notification][:user_id] = 1
	  params[:notification][:day] = "2013/12/13"
	  @notification = Notification.new(params[:notification])
	  if @notification.save
	  	#InformMailer.notify(@notification).deliver
	  	respond_to do |format|
          format.html { redirect_to notifications_path(@notification.id), notice: 'Notification saved' }
        end
	  else
	  	puts @notification.errors.full_messages.to_sentence
	  	respond_to do |format|
	  	  format.html { render action: "new" }
	    end
	  end
	end

	def edit
	  @table_id = "notifications"
	  @notification = Notification.find(params[:id])
	end

	def update
	  @table_id = "notifications"
	  @notification = Notification.find(params[:id])

	  respond_to do |format|
	    if @notification.update_attributes(params[:notification])
	      format.html { redirect_to @notification, notice: 'Notification updated' }
	      format.json { head :no_content }
	      #InformMailer.notify(@notification).deliver
	    else
	      format.html { render action: "edit" }
	      format.json { render json: @notification.errors.full_messages.to_sentence, status: :unprocessable_entity }
	    end
	  end
	end

	def destroy
	  @table_id = "notifications"
	  @notification = Notification.find(params[:id])
	  @notification.update_attributes(:notification_status_id => NotificationStatus.find_by_name("cancelled").id)
	  respond_to do |format|
	    format.html { redirect_to notifications_path, notice: 'Notification cancelled.' }
	    format.json { head :no_content }
	  end
	end
end