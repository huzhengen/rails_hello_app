class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /blogs or /blogs.json
  def index
    blogs = Blog.all
    if blogs
      render json: {
        "status": "ok",
        "msg": "获取成功",
        "total": 200,
        "page": 2,
        "totalPage": 10,
        "data": blogs
      }
    else
      render json: { "status": "fail", "msg": "系统异常" }
    end
  end

  # GET /blogs/1 or /blogs/1.json
  def show
    blog = Blog.find(params[:id])
    if blog
      render json: blog, status: 200
    else
      render json: { error: "Blog Not Found." }
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs or /blogs.json
  def create
    blog = Blog.new(
      title: blog_params[:title],
      description: blog_params[:description],
      content: blog_params[:content],
      user_id: blog_params[:user_id]
    )

    if blog.save
      render json: blog, status: 200
      # render json: blog, status: :created
      # format.json { render :show, status: :created, location: @blog }
    else
      render json: { error: "Error creating review." }
    end
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: "Blog was successfully updated." }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_blog
    @blog = Blog.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def blog_params
    params.permit([:title, :description, :content, :user_id])
  end
end
