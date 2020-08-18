module CoursesHelper
    include ApplicationHelper
    def sort_column
        params[:sort].present? ? params[:sort] : "created_at"
    end
      
    def sort_direction
        params[:direction].present? ? params[:direction] : "asc"
    end
end
