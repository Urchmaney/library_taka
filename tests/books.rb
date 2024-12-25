module LibraryTaka
  class TestBook < Test::Unit::TestCase
    def test_book_creation
      assert_nothing_raised do
        isbn = "978-92-95055-02-5"
        author = "Micheal Scoffield"
        title = "Breaking Free"
        publication_year = "2000"
        Book.new isbn, title, author, publication_year
      end
    end

    def test_error_for_empty_isbn
      assert_raise ISBNEmptyError do
        isbn = ""
        author = "Micheal Scoffield"
        title = "Breaking Free"
        publication_year = "2000"
        Book.new isbn, title, author, publication_year
      end
    end
  end
end