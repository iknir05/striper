module ApplicationHelper

	def get_all_menus
	   Menu.all
	end

	def get_all_sliders
	   Slider.all
	end
	
	def get_all_facilities
	   Facility.all
	end
	
	def get_all_jobs
		Job.all
	end
	
	def get_all_reviews
		Review.all
	end
	
	def get_all_news
		News.all
	end
	
	def get_all_benefits
		 Benefit.all
	end

	def get_all_galleries
		Gallery.all
	end

	def get_all_blogs
		Blog.all
	end

	def get_few_notifications
		# Notification.order(created_at: :desc).where(status:"pending").last(10)
		Notification.order(created_at: :desc).last(10)
	end

	def get_all_notifications
		# Notification.order(:created_at).where(status:"pending")
		Notification.order(created_at: :desc).all
	end

	def format_date(date)
		date.strftime('%b, %mth %Y')
	end

	def blog_likes_count(id,preference)
		BlogLike.where(blog_id: id, status: preference).count
	end

	def blog_status(id)

		if BlogLike.find_by(blog_id: id, user_id: current_user.id)
			blog_like = BlogLike.find_by(blog_id: id, user_id: current_user.id)
			if  blog_like.status == "like"
				return "Unlike"
			else
				return "Like"
			end
		else
			return "Like"
		end
	end

	def get_pending_notification_count
		Notification.where(status:"pending").count
	end

	def get_notification_icon(category)
		icon_class = ""
		case category
		when "users"
			icon_class = "fa fa-users text-aqua"
		when "sliders"
			icon_class = "fa fa-users text-aqua"
		when "blogs"
			icon_class = "fa fa-users text-aqua"
		when "reviews"
			icon_class = "fa fa-users text-aqua"
		when "enquiries"
			icon_class = "fa fa-users text-aqua"
		else
			icon_class = "fa fa-users text-aqua"
		end
		return icon_class
	end



	def get_notification_description(notification)
		description = ""
		case notification.category
			when "users"
				description = "#{notification.sender.first_name} has been added as new admin user"
			when "sliders"
				description = "This is default text"
			when "blogs"
				description = "This is default text"
			when "reviews"
				description = "This is default text"
			when "enquiries"
				description = "This is default text"
			else
				description = "This is default text"
		end
		return description
	end


	def get_notification_url(category)
		url = ""
		case category
			when "users"
				url = "/admin/admin_users"
			when "sliders"
				description = "This is default text"
			when "blogs"
				description = "This is default text"
			when "reviews"
				description = "This is default text"
			when "enquiries"
				description = "This is default text"
			else
				description = "This is default text"
		end
		return url
		
	end

end
