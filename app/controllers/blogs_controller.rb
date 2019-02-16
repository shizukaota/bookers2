class BlogsController < ApplicationController
	def show
		@blog = Blog.find(params[:id])
	end
	def destory
		blog = Blog.find(params[:id])
		blog.delete
		redirect_to blogs_path
	end

	def home
	end

	def index
		@blogs = Blog.all
		@blog = Blog.new
	end

	def new
		@blogs = Blog.all
		@blog = Blog.new
	end
	def create
		blog =  Blog.new(blog_params)
		blog.save
		flash[:id] = "successfully"
		redirect_to blogs_path
	end
	def edit
		@blogs = Blog.all
		@blog = Blog.find(params[:id])
		p @blogs
	end
	def destroy
		blog = Blog.find(params[:id])
        blog.destroy
        redirect_to blogs_path
    end
	def update
		blog = Blog.find(params[:id])
		blog.update(blog_params)
		flash[:id] = "successfully"
		redirect_to blog_path(blog)
	end
	private
	def blog_params
		params.require(:blog).permit(:title, :body)
	end




end

