class Gallery < ApplicationRecord
	has_attached_file :gallery_image

  # Validate content type
  	validates_attachment_content_type :gallery_image, content_type: /\Aimage/
  # Validate filename
  	validates_attachment_file_name :gallery_image, matches: [/png\Z/, /jpe?g\Z/]
end
