module LibraryTaka
  #
  # The Book class for storing books object.
  # It ensures that isbn number is not null or empty
  #
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