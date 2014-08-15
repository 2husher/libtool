module BooksHelper
    def days_to_return book
        days_left = (book.returning_date - Date.today).round
        if days_left > 0
            "#{pluralize days_left, 'day'} left"
        elsif days_left == 0
            "today"
        else
            "#{pluralize -days_left, 'day'} ago"
        end
    end
end
