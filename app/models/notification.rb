class Notification < ApplicationRecord
	belongs_to :sender, class_name: 'Admin'
	belongs_to :receiver, class_name: 'Admin'

	def self.send_notification(sender_id,category)
		notification = Notification.new
		notification.sender_id = sender_id
		notification.receiver_id = Admin.find_by(role: "superadmin").id
		notification.category = category
		notification.is_read = false
		notification.status = "pending"
		notification.save		
	end
end
