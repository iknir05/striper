class Job < ApplicationRecord
	has_attached_file :job_image

  # Validate content type
  	validates_attachment_content_type :job_image, content_type: /\Aimage/
  # Validate filename
  	validates_attachment_file_name :job_image, matches: [/png\Z/, /jpe?g\Z/]

    validates :title,:url, presence: true

end
