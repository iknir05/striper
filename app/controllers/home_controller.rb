class HomeController < ApplicationController
  def index
    @menus = Menu.all
    @sliders = Slider.all
    @facilities = Facility.all
  end

  def about
  end

  def contact
  end
end
