
require_relative "lib/book"
require_relative "lib/library"

module LibraryTaka
  class ISBNEmptyError < StandardError
    def initialize(title)
      super("ISBN cannot be empty: book with title: #{title}")
    end
  end

  class AddingDuplicateError < StandardError
    def initialize(isbn)
      super("Book already added: book with isbn: #{isbn}")
    end
  end

  class BookNotFoundError < StandardError
    def initialize(isbn)
      super("Book not found: book with isbn: #{isbn}")
    end
  end

  class BookUnavailableError < StandardError
    def initialize(isbn)
      super("Book is currently not available: book with isbn: #{isbn}")
    end
  end
end