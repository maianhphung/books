class ReviewsController < ApplicationController
	before_action :find_book

	def new
		#@review = Review.new
		@review=@book.build_review
	end

	def create
		@review = Review.new (review_params)
		@review.book_id = @book.book_id
		@review.user_id = current_user.user_id

		if @review.save
			redirect_to_book_path(@book)
		else 
			render 'new'
		end
	end

	private 
		def review_params
			params.require(:review).permit(:rating, :comment)
		end

		def find_book
			@book = Book.find(params[:book_id])
		end

end
