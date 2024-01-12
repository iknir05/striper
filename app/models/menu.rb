class Menu < ApplicationRecord
	validates :title,:url, presence: true
end
