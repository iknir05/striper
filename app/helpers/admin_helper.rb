module AdminHelper
	def get_current_admin_user
	   Admin.find(session[:admin_id])
	end
end
