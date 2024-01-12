module ApplicationHelper

	def get_all_menus
	   Menu.paginate(page: params[:page], per_page: 10).order("created_at ASC")
	end

	def get_all_sliders
	   Slider.paginate(page: params[:page], per_page: 10).order("created_at ASC")
	end
	
	def get_all_facilities
	   Facility.paginate(page: params[:page], per_page: 10).order("created_at ASC")
	end
	
	def get_all_jobs
		Job.paginate(page: params[:page], per_page: 10).order("created_at ASC")
	end
	
	def get_all_reviews
		Review.paginate(page: params[:page], per_page: 10).order("created_at ASC")
	end
	
	def get_all_news
		News.paginate(page: params[:page], per_page: 10).order("created_at ASC")
	end
	
	def get_all_benefits
		 Benefit.paginate(page: params[:page], per_page: 10).order("created_at ASC")
	end

	def get_all_galleries
		Gallery.paginate(page: params[:page], per_page: 10).order("created_at ASC")
	end
	
	def get_all_enquiries
		Enquiry.paginate(page: params[:page], per_page: 10).order("created_at DESC")
	end

	def get_all_blogs
		Blog.paginate(page: params[:page], per_page: 10).order("created_at ASC")
	end

	def format_date(date)
		date.strftime('%b, %mth %Y')
	end
end
