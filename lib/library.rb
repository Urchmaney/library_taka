module LibraryTaka
  class Library
    def initialize
      @store = {}
    end

    def add_book(book)
      raise AddingDuplicateError.new book.isbn if !@store[book.isbn].nil?
  
      @store[book.isbn] = { available: true, book: book }
    end

    def available_books
      @store.values.filter_map {|store| store[:book] if store[:available] }
    end

    def borrow_book(book)
      raise BookNotFoundError.new(book.isbn) if @store[book.isbn].nil?
      raise BookUnavailableError.new(book.isbn) if !@store[book.isbn][:available]

      @store[book.isbn][:available] = false
    end
  end
end