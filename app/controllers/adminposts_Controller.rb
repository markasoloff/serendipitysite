class AdminpostsController < ApplicationController
  before_action :set_adminpost, only: [:show, :edit, :update, :destroy]

  def adminpost_params
    params.require(:adminpost).permit(:title, :content)
  end
  
  # GET /admin/adminposts
  # GET /admin/adminposts.json
  def index
    @adminposts = Adminpost.all
    render 'adminposts/index.html.erb'
    # render json: @adminposts
  end

  # GET /admin/adminposts/1
  # GET /admin/adminposts/1.json
  def show
    @adminpost = Adminpost.find(params[:id])
    render json: @adminpost
  end

  def new
    @adminpost = Adminpost.new
    render 'adminposts/_form.html.erb'
    # render 'admin/adminposts/_form.html.erb'
  end

  # GET /admin/posts/1/edit
  def edit
  end

  # POST /admin/posts
  # POST /admin/posts.json
  def create
    @adminpost = Adminpost.new(adminpost_params[:title, :content])

    respond_to do |format|
      if @adminpost.save
        format.html { redirect_to [:admin, @adminpost], notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @adminpost }
      else
        format.html { render :new }
        format.json { render json: @adminpost.errors, status: :unprocessable_entity }
      end
    end
  end


# course create action (adapt to save adminposts as new course entries)
#   def create
#    @course = Course.new(name: params[:name],
#                   description: params[:description]
#                  )
#    @course.save
#    render json: {message: "Element successfully created"} 
#   end



  # PATCH/PUT /admin/posts/1
  # PATCH/PUT /admin/posts/1.json
  def update
    respond_to do |format|
      if @adminpost.update(adminpost_params)
        format.html { redirect_to [:admin, @adminpost], notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @adminpost }
      else
        format.html { render :edit }
        format.json { render json: @adminpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.json
  def destroy
    @adminpost.destroy
    respond_to do |format|
      format.html { redirect_to [:admin, @adminpost], notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adminpost
      @adminpost = Adminpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def adminpost_params
    #   params.fetch(:admin_post, {})
    # end
end
