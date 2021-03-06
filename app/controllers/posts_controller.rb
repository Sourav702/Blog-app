class PostsController < ApplicationController
  before_action :check_user_access, only: [:edit,:update,:destroy]
	def index
		@posts = Post.all.order('created_at DESC')
		# @posts=Post.includes
	end

	def new
		@post = Post.new
	end

	def show
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(post_params)
@post.user_id=current_user.id
		if @post.save
      flash[:success]="new post created"
			redirect_to @post
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
   
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(params[:post].permit(:title, :body))
      flash[:success]="post updated"
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
    flash[:success]="post deleted"
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end
  def check_user_access
    @post = Post.find(params[:id])
    if @post.user !=current_user
      flash[:alert]="unauthorized access"
      redirect_to root_path
    end
  end
end
