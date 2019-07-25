class CoursesController < ApplicationController

  def about
    @courses = Course.all
    render 'courses/about.html.erb'
  end


  def index
    @courses = Course.all
    render 'courses/index.html.erb'
  end

  def show
    @course = Course.find(params[:id]) 
    render 'courses/show.html.erb'
  end

  def classes
    render 'courses/classes.html.erb'
  end

  def new
    @course = Course.new
    render 'courses/new.html.erb'
  end

  def create
   @course = Course.new(name: params[:name],
                  description: params[:description]
                 )
   @course.save
   render json: {message: "Element successfully created"}
     
   # render json: {message: "Element successfully created"}
   # redirect_to :index 
  end

  def update
    @course = Course.find(params[:id])
    @course.name = params[:name] || @course.name
    @course.description = params[:description] || @course.description
    @course.save
    render json: {message: "Element successfully updated"} 
  end

  def destroy
   @course = Course.find(params[:id])
   @course.destroy
   render json: {message: "Element successfully destroyed"} 
  end

  def contact
    render 'courses/contact.html.erb'
  end

end


