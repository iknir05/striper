class Admin::MenusController < ApplicationController
	  layout 'admin'
	  def index
	  	
	  end

	  def show
	  	@menu = Menu.find(params[:id])
	  end

	  def new
	  	@menu = Menu.new
	  	@action = "create"	  	
	  end

	  def create
	  	@menu = Menu.new(menus_params)
	  	
	  	if @menu.save
	  		flash[:notice] = "New Menu item created successfully"
	  		redirect_to admin_menus_path
	  	else
	  		render 'new'
	  	end
	  end

	  def edit
	  	@menu = Menu.find(params[:id])
	  	@action = "update"
	  end

	  def update
	  	 @menu = Menu.find(params[:id])
	  	if @menu.update(menus_params)
	  		flash[:notice] = "New Menu item updated successfully"
	  		redirect_to admin_menus_path
	  	else
	  		render 'edit'
	  	end
	  end

	  def destroy
	  	    @menu = Menu.find(params[:id])
		    if @menu.destroy
		      flash[:notice] = "Menu ite, has been successfully deleted"
		    end 
		    redirect_to admin_menus_path
	  	
	  end

	  private

	  def menus_params()
	  		params.require(:menu).permit(:title,:url,:menu_header,:menu_footer)
	end
end
