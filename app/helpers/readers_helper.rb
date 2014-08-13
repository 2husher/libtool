module ReadersHelper
    def full_name
        "#{@reader.last_name} #{@reader.first_name} #{@reader.middle_name}"
    end

    def birthday
        @reader.date_of_birth.strftime("%d %B %Y")
    end

    def registration
        @reader.date_of_registration.strftime("%d %B %Y")
    end

    def age
        date_from = Date.today
        date_orig = @reader.date_of_birth
        age = date_from.year - date_orig.year
        age -= 1 if date_from.month < date_orig.month || 
                   (date_from.month == date_orig.month) && (date_from.day < date_from.day)
        case age % 10
        when 1                   
            "#{age} год"
        when 2..4
            "#{age} года"
        else
            "#{age} лет"
        end
    end

    def address
        building = ""
        building = "к.#{@reader.building} " unless @reader.building.nil?
        "#{@reader.street} д.#{@reader.home_number} " + building + "кв.#{@reader.flat_number}"
    end
end
