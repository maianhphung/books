class BooksController < ApplicationController
	before_action :find_book, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :edit]

	def index
		@books = Book.order("created_at DESC")

		@books = @books.where(category_id: params[:category_id]) if params[:category_id]


		user_id = current_user.id
		user_id = params[:user_id] if params[:user_id]

		@books = @books.where(user_id: user_id)
	end

	def show
	end

	def new
		@book = current_user.books.build
		@categories= Category.all.map{|c| [c.name, c.id]}
	end

	def edit
		@categories= Category.all.map{|c| [c.name, c.id]}
	end

	def update
		@book.category_id = params[:category_id]
		if @book.update(book_params)
			redirect_to book_path(@book)
		else 
			render 'edit'
		end
	end

	def destroy
		@book.destroy
		redirect_to root_path
	end

	def create
		@book = current_user.books.build(book_params)
		@categories= Category.all.map{|c| [c.name, c.id]}
		@book.category_id = params[:category_id]

		if @book.save
			redirect_to root_path
		else 
			render 'new'
		end
	end

	private
		def book_params
			params.require(:book).permit(:title, :description, :author, :category_id, :book_img)
		end 

		def find_book
			@book = Book.find(params[:id])
		end


end