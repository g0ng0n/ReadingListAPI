require 'test_helper'

class CreatingBooksTest < ActionDispatch::IntegrationTest
	test 'creates new books with valid Data' do 
		post '/api/books', { book: {
			title: 'Pragmatic Programmer',
			rating: 5,
			author: 'Dave Thomas',
			genre_id: 1,
			review: 'Excelent book for any programmer.',
			amazon_id: '13123'
		} }.to_json,
		{ 'Accept' => 'application/json',
			'Content-Type' =>'application/json'
		}

		assert_equal 201, response.status
		assert_equal Mime::JSON, response.content_type

		book = json(response.body)[:book]
		assert_equal api_book_url(book[:id]), response.location
		assert_equal 'Pragmatic Programmer', book[:title]
		assert_equal 5, book[:rating].to_i
		assert_equal 'Dave Thomas', book[:author]
		assert_equal 1, book[:genre_id].to_i
		assert_equal 'Excelent book for any programmer.', book[:review]
		assert_equal '13123', book[:amazon_id]

	end

	test 'does not create books with invalid data' do 
		post '/api/books', { book: {
			title: nil,
			rating: 5
		} }.to_json,
		{ 'Accept' => 'application/json',
			'Content-Type' =>'application/json'
		}

		assert_equal 422, response.status
		assert_equal Mime::JSON, response.content_type

		

	end

end
