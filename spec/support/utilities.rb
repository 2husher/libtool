def full_title(page_title)
    if page_title.empty?
        "Library"
    else
        "#{page_title} | Library"
    end
end