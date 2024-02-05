desc "Update roles of exisint users to admin"

namespace :rinki do
	task roles: [:environment] do
		puts "hello its a rake task"

		Admin.where(role: nil)
			.update_all(role: "admin",is_admin_approved: true)
				
		Admin.all.each do |admin|
			puts admin.first_name
			puts admin.role
			puts admin.is_admin_approved
		end
	end
end