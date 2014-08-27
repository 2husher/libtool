module ReadersHelper
    def full_name reader
        "#{reader.last_name} #{reader.first_name} #{reader.middle_name}"
    end

    def birthday reader
        reader.date_of_birth.strftime("%d %B %Y")
    end

    def registration reader
        reader.date_of_registration.strftime("%d %B %Y")
    end

    def age reader
        age = reader.age
        case age % 10
        when 1                   
            "#{age} год"
        when 2..4
            "#{age} года"
        else
            "#{age} лет"
        end
    end

    def address reader
        building = ""
        building = "к.#{reader.building} " if reader.building
        "#{reader.street} д.#{reader.home_number} " + building + "кв.#{reader.flat_number}"
    end
end
