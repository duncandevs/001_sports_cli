class Adapters::GoogleBooks
  attr_reader :query

  BASE_URL = "https://www.googleapis.com/books/v1"
  BASE_SEARCH_QUERIES = ['ruby programming', 'dan brown', 'elmore leonard', 'coffee']

  def self.set_default_items
    BASE_SEARCH_QUERIES.each {|query| self.new(query).fetch_and_seed_books }
  end

  def initialize(query)
    @query = query
  end

  def fetch_and_seed_books
    books_data.each do |book_data|
      if has_author_info?(book_data)
        create_book_and_author(book_data)
      end
    end
  end

  private

  def create_book_and_author(book_data)
    author_name = book_data["volumeInfo"]["authors"].first
    author = Author.find_or_create_by(name: author_name)
    title = book_data["volumeInfo"]["title"]
    book = Book.find_or_create_by(title: title, author: author)
  end

  def books_data
    response = RestClient.get("#{BASE_URL}/volumes?q=#{query}")
    data = JSON.parse(response)
    data["items"]
  end

  def has_author_info?(book_data)
    !!book_data["volumeInfo"]["authors"]
  end
end
