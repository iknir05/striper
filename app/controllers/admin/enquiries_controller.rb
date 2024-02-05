class Admin::EnquiriesController < AdminController
   before_action :check_authority
  
  def index
   @enquiries = Enquiry.paginate(page: params[:page], per_page: 10).order("created_at DESC")
  end

  def search_filter
    @enquiries = Enquiry.all

    if params[:search].present?
      @enquiries = @enquiries.where("first_name like (?) or last_name like (?) or email like (?) or phone_number like (?) or zip_code like (?) or city like (?)", "%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%", "%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%")
    end  

    if params[:state].present?
      @enquiries = @enquiries.where(:state => params[:state])
    end  

    if params[:search_date].present?
      @enquiries = @enquiries.where("created_at >= ?",Date.strptime(params[:search_date],'%m/%d/%Y').strftime('%Y-%m-%d %H:%M:%S'))
     
    end 

    @enquiries = @enquiries.paginate(page: params[:page], per_page: 10).order("created_at DESC")


    respond_to do |format|
      format.js 
    end
  end

end
