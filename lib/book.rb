module LibraryTaka
  class Book
    attr_reader :isbn
    
    def initialize(isbn, title, author, publication_year)
      raise ISBNEmptyError.new title if isbn.nil? || isbn.empty?
      @isbn = isbn
      @title = title
      @author = author
      @publication_year = publication_year
    end
  end
end