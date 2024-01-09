class HomeController < ApplicationController
  def index
    @menus = Menu.all
    @sliders = Slider.all
    @facilities = Facility.all
    @jobs = Job.all
    @reviews = Review.all 
    @news = News.all
    @benefits = Benefit.all
    @galleries = Gallery.all
  end

  def about
  end

  def contact
  end
end
