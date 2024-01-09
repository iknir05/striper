class Review < ApplicationRecord
	has_attached_file :review_image

  # Validate content type
  	validates_attachment_content_type :review_image, content_type: /\Aimage/
  # Validate filename
  	validates_attachment_file_name :review_image, matches: [/png\Z/, /jpe?g\Z/]

    validates :full_name,:country,:description, presence: true
    
end
