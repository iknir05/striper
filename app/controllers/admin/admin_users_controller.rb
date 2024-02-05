class Admin::AdminUsersController < AdminController
  before_action :check_authority
  def index
    # @filter_status = nil
    @admins = Admin.where(is_admin_approved: nil)
    @admins = @admins.paginate(page: params[:page], per_page: 10).order("created_at ASC")
  end


  def confirm_admin
    @admin = Admin.find(params[:id])

    if @admin.present?
      @admin.is_admin_approved = params[:status]
      @admin.save

      @filter_status = params[:filter_status]
      @admins = Admin.where(is_admin_approved: params[:filter_status])
      @admins = @admins.paginate(page: params[:page], per_page: 10).order("created_at ASC")
    end
  end

  def show_admin
      if params[:filter_status] == ""
        @admins = Admin.where(is_admin_approved: nil)
      else
        @admins = Admin.where(is_admin_approved: params[:filter_status])
      end
      @filter_status = params[:filter_status]
      @admins = @admins.paginate(page: params[:page], per_page: 10).order("created_at ASC")
  end


end
