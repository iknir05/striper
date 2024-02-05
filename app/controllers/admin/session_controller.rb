class Admin::SessionController < AdminController
  skip_before_action :authenticate_admin_user, only: [:new, :login]

  
  def new 
    if session[:admin_id].present?
      redirect_to admin_home_path
    else
       @admin = Admin.new  
    end
  end

  def login
     @admin = Admin.find_by(email: params[:admin][:email])
     if @admin.present? && @admin.authenticate(params[:admin][:password]) && (@admin.is_admin_approved == true)
        flash[:notice] = "Admin has successfully logged in"
        session[:admin_id] = @admin.id
        if @admin.role == "superadmin"
          redirect_to admin_home_path 
        else
          redirect_to admin_sliders_path 
        end
      else
        if @admin.present? && @admin.authenticate(params[:admin][:password])   
          flash[:notice] = "Super admin approval pending!"
        else
          flash[:notice] = "Invalid credentials entered!"
        end
        @admin = Admin.new  
        render 'new'
      end    
  end

  def destroy
    session[:admin_id] = nil 
    flash[:notice] ="Admin is logged out"
    redirect_to admin_login_path
  end
  
end
