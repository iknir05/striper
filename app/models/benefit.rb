class Benefit < ApplicationRecord
	validates :icon_class,:title,:description, presence: true
end
