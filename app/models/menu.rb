class Menu < ApplicationRecord
	validates :title,:url, presence: true, length: {minimum:3,maximum:10}
end
