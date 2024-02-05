class Admin::RegistrationController < AdminController
	skip_before_action :authenticate_admin_user, only: [:new, :create]

	def new 
		if session[:admin_id].present?
      		redirect_to admin_home_path
    	else
       		@admin = Admin.new  
    	end
	end

	def create
		@admin = Admin.new(admin_params)

		if params[:admin][:role] == "1"
			@admin.role = "superadmin"
		else
			@admin.role = "admin"

		end

		if @admin.save
		  Notification.send_notification(@admin.id,"users")

	      flash[:notice] = "New Admin created successfully"
	      redirect_to admin_login_path
	    else
	      render 'new'
    	end
	end

	private
	def admin_params
		params.require(:admin).permit(:first_name,:last_name,:phone_number,:email,:password,:password_confirmation,:role)
	end
end
