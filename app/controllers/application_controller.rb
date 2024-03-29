class ApplicationController < ActionController::Base

	protect_from_forgery with: :exception

	before_action :update_allowed_parameters, if: :devise_controller?

	protected

	def update_allowed_parameters
		devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :contact_number, :email, :password)}
		devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name,:contact_number, :email, :password, :current_password)}
	end

end
