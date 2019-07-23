class CourseController < ApplicationController

  def index
    render 'index.html.erb'
  end

  def create
   @course = Course.new(name: params[:name],
                  description: params[:description]
                 )
   @course.save
   render json: {message: "Element successfully created"} 
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

end
