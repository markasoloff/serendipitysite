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
    @course = Course.all
    render 'courses/classes.html.erb'
  end

  def new
    @course = Course.new
    render 'courses/_form.html.erb'
  end


  def create
    course = Course.new(course_params)

    if course.save
        redirect_to course_path(course), alert: "Class created successfully."
    else
        redirect_to new_course_path, alert: "Error creating user."
    end


   # @course = Course.new(name: params[:name],
   #                description: params[:description]
   #               )

   # render json: {message: "Element successfully created"}
     
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

  def list
    @courses = Course.all
    render 'courses/list.html.erb'
  end

  private
  def course_params
    params.require(:course).permit(:name, :description)
  end

end


