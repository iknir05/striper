desc "Seeding admin users data"

namespace :rinki do
	task seed_admin_users: [:environment] do 
		current_count = Admin.all.count + 1
		2.times do 
			puts " #{current_count}"
			user = Admin.create(
				first_name: "User #{current_count}",
				last_name: "Igotsar",
				phone_number: 111111,
				email:"a#{current_count}@gmail.com",
				is_admin_approved: true,
				role: "admin",
				password: '1234',
				password_confirmation: '1234'
				)
			current_count +=1
		end
	end
	
end