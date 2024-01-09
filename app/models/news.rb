class News < ApplicationRecord
	has_attached_file :news_image

  # Validate content type
  	validates_attachment_content_type :news_image, content_type: /\Aimage/
  # Validate filename
  	validates_attachment_file_name :news_image, matches: [/png\Z/, /jpe?g\Z/]

    validates :description,:url, presence: true
end
