class User < ApplicationRecord
	validates :first_name,:last_name, presence: true, length: {minimum:4, maximum:10}
	validates :email, presence: true, uniqueness: true
	validates :phone_number, presence: true, numericality: true , length:{minimum:5, maximum:10}
	validates :password, confirmation: true, length: {minum:4,maximum:4}, if: :password_required?

	def password_required?
		password.present?
	end
end
