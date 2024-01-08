class Admin::SessionController < ApplicationController
  layout 'admin'
  
  def new 
    if session[:user_id].present?
      redirect_to admin_home_path
    else
       @user = User.new  
    end
  end

  def login
     @user = User.find_by(email: params[:user][:email])

     if @user.present? && @user.password == params[:user][:password]
        flash[:notice] = "Admin has successfully logged in"
        session[:user_id] = @user.id
        redirect_to admin_home_path
      else
        @user = User.new    
        flash[:notice] = "Invalid credentials entered"
        render 'new'
      end    
  end

  def destroy
    session[:user_id] = nil 
    flash[:notice] ="Admin is logged out"
    redirect_to admin_login_path
  end
  
end
