class Admin::JobsController < AdminController

  def index
    @jobs = Job.paginate(page: params[:page], per_page: 10).order("created_at ASC")
  end

  def search_filter
      @jobs = Job.all

      if params[:search].present?
        @jobs = @jobs.where("title like (?) or url like (?)", "%#{params[:search]}%","%#{params[:search]}%")
      end  

      @jobs = @jobs.paginate(page: params[:page], per_page: 10).order("created_at DESC")

      respond_to do |format|
        format.js 
      end

  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @action = "create"   
  end

  def create
    @job = Job.new(jobs_params)

    if @job.save
      flash[:notice] = "New Job item created successfully"
      redirect_to admin_jobs_path
    else
      render 'new'
    end
  end

  def edit
    @job = Job.find(params[:id])
    @action = "update"   
  end

  def update
    @job = Job.find(params[:id])

    if @job.update(jobs_params)
      flash[:notice] = "New Job item updated successfully"
      redirect_to admin_jobs_path
    else
      render 'edit'
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
        flash[:notice] = "Job has been successfully deleted"
    end 
    redirect_to admin_jobs_path
  end

  private

  def jobs_params
    params.require(:job).permit(:job_image,:title,:url)
  end

end
