require 'test_helper'

class DeletingBooksTest < ActionDispatch::IntegrationTest
	setup do 
		@book = Book.create!(title: 'Pragmatic Programmer')
	end

	test 'deleting books' do
		delete "/books/#{@book.id}"
	
		assert_equal 204, response.status
	end
end
