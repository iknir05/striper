class HomeController < ApplicationController
  def index
    @enquiry = Enquiry.new
  end

  def blogs
    @enquiry = Enquiry.new
  end

  def blog_details
    @enquiry = Enquiry.new
    @blog = Blog.find_by(title: params[:title])
  end

  def create
    @msg = "Update Failed!!!"

    @enquiry = Enquiry.new(enquiry_params)

    if @enquiry.save
      @msg = "Form successfully submitted"
    end
  end


  private
  
  def enquiry_params
    params.require(:enquiry).permit(:first_name,:last_name,:email,:phone_number,:zip_code,:city,:state)
  end
end
