class PostsController < ApplicationController
	before_action :find_book
	before_action :find_post, only: [:edit, :update, :destroy]

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.book_id = @book.id
		@post.user_id = current_user.id

		if @post.save
			redirect_to book_path(@book)
		else 
			render 'new'
		end
	end  

	def edit
	end

	def update

		if @post.update(post_params)
			redirect_to book_path(@book)
		else 
			render 'edit'
		end 
	end	

	def destroy
		@post.destroy
		redirect_to book_path(@book)
	end

	def show
		@book.show(@book)
	end

	private 
		def post_params
			params.require(:post).permit(:title, :comment)
		end

		def find_book
			@book =Book.find(params[:book_id])
		end

		def find_post
			@post = Post.find(params[:id])
		end 


end
