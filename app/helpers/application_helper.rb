module ApplicationHelper
    def sortable(column, title = nil)
        title ||= column.titleize
        if sort_direction == "asc"
            @sort_class = "fas fa-sort-up"
        else
            @sort_class = "fas fa-sort-down"
        end
        css_class = column == sort_column ? "#{@sort_class}" : nil
        direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
        link = link_to title, {:sort => column, :direction => direction}
        link + content_tag(:i, nil, :class => css_class)
    end
end
