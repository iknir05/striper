class Facility < ApplicationRecord
	validates :title,:icon_class, presence: true, length: {minimum:3,maximum:30}
end
