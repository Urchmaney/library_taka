require_relative "sample_data"
module LibraryTaka
  class TestLibrary
    class AddBook < Test::Unit::TestCase
      def setup
        @library = Library.new
      end

      def test_add_book_without_error
        count = @library.available_books.count
        assert_nothing_raised do
          @library.add_book SAMPLE_BOOKS[0]
        end
        assert_equal @library.available_books.count, count + 1
      end

      def test_error_adding_duplicate_book
        assert_raise AddingDuplicateError do
          @library.add_book SAMPLE_BOOKS[0]
          @library.add_book SAMPLE_BOOKS[0]
        end
      end
    end


    class BorrowBook < Test::Unit::TestCase
      def setup
        @library = Library.new
        SAMPLE_BOOKS.each {|book| @library.add_book book }
      end

      def test_borrow_book_without_error
        count = @library.available_books.count
        assert_nothing_raised do
          @library.borrow_book SAMPLE_BOOKS[0]
        end
        assert_equal @library.available_books.count, count - 1
      end

      def test_error_borrow_unavailable_book
        assert_raise BookUnavailableError do
          @library.borrow_book SAMPLE_BOOKS[1]
          @library.borrow_book SAMPLE_BOOKS[1]
        end
      end

      def test_error_borrow_unadded_book
        assert_raise BookNotFoundError do
          @library.borrow_book Book.new("978-92-95111-00-2", "Elon Musk", "Building X", "2024")
        end
      end
    end
  end
end