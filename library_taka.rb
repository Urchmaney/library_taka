
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
end