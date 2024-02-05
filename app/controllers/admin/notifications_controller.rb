class Admin::NotificationsController < AdminController
	

	def notification_status_reset
		notifications =  Notification.order(:created_at).where(status:"pending").last(10)
		if notifications.present?
			Notification.where(status:"pending").order(created_at: :desc).limit(10).update_all(status: "active")
		end

		
	end

	def update_notification_read_status
		notification = Notification.find(params[:id])
		notification.is_read = true
		notification.save
		
		redirect_to "#{helpers.get_notification_url(notification.category)}"
	end

	def destroy
		notification = Notification.find(params[:id])
		notification.delete
	end
end
