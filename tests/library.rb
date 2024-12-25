module LibraryTaka
  class TestLibrary
    class AddBook < Test::Unit::TestCase
      def setup
        @library = Library.new
      end

      def sample_book
        isbn = "978-92-95055-02-5"
        author = "Micheal Scoffield"
        title = "Breaking Free"
        publication_year = "2000"
        Book.new isbn, title, author, publication_year
      end

      def test_add_book_without_error
        count = @library.available_books.count
        assert_nothing_raised do
          @library.add_book sample_book
        end
        assert_equal @library.available_books.count, count + 1
      end

      def test_error_adding_duplicate_book
        assert_raise AddingDuplicateError do
          @library.add_book sample_book
          @library.add_book sample_book
        end
      end
    end
  end
end