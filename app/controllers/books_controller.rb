class BooksController < ApplicationController
	def show
		books = Book.all
		render json: books, status: 200
	end

end