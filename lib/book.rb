module LibraryTaka
  class Book
    def initialize(isbn, title, author, publication_year)
      raise ISBNEmptyError.new title if isbn.nil? || isbn.empty?
      @isbn = isbn
      @title = title
      @author = author
      @publication_year = publication_year
    end
  end
end