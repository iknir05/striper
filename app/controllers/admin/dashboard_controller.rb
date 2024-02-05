class Admin::DashboardController < AdminController
  before_action :check_authority
  def home
    @admin =  Admin.find(session[:admin_id])
    if @admin.role != "superadmin"
      redirect_to admin_sliders_path
    end
  end
  


  
end
