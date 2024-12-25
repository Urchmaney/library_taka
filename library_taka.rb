
require_relative "lib/book"

module LibraryTaka
  class ISBNEmptyError < StandardError
    def initialize(title)
      super("ISBN cannot be empty: book with title: #{title}")
    end
  end
end