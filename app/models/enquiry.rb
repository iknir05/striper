class Enquiry < ApplicationRecord
	validates :first_name,:last_name, presence: true
	validates :email, presence: true, uniqueness: true
	validates :phone_number, presence: true, :numericality => true
	validates :zip_code, presence: true, :numericality => true
	validates :city,:state, presence: true
end
