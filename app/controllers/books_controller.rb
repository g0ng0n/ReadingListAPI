class BooksController < ApplicationController
	def show
		books = Book.all

		if rating = params[:rating]
			books =  books.where(rating: rating)
		end

		render json: books, status: 200
	end


end