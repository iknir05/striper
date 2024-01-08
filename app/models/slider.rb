class Slider < ApplicationRecord
	has_attached_file :slider_image
	# styles: {
    #       large: "500x500",
    #       medium: "300x300",
    #       thumb: "100x100"
    #   },
    #   default_url: "/images/:style/missing_profile_media.png"

  # Validate content type
  validates_attachment_content_type :slider_image, content_type: /\Aimage/
  # Validate filename
  validates_attachment_file_name :slider_image, matches: [/png\Z/, /jpe?g\Z/]
  # # Explicitly do not validate
  # do_not_validate_attachment_file_type :avatar
end
