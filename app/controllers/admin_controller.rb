class AdminController < ActionController::Base
	layout 'admin'
 	before_action :authenticate_admin_user

 	private

 	def authenticate_admin_user
 		if session[:admin_id].present? 
 			return true	
 		else
 			redirect_to admin_login_path
 		end
 	end

 	def check_authority
 		if Admin.find(session[:admin_id]).role == "superadmin"
 			return true	
 		else
 			flash[:notice] = "Only Super Admin is authorized to access this page!"
 			redirect_to admin_sliders_path
 		end
 	end
	
end
