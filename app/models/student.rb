class Student < ApplicationRecord
     belongs_to :user
     belongs_to :course # course id in school table
     #form field validation
     validates :name, presence: true, length: {maximum: 255}, format: { :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "may only contain letters and numbers." }
     #validates :code,  presence: true
     scope :course_ordered, ->(order) { includes(:course).order("courses.title" + " " + order) }
 
     #simple search form
     def self.search(search)
         if search.present? 
             where('user_id = ?', search).order(created_at: :desc)
         else
             all.order(created_at: :desc)
         end
     end

     def self.filter(term)
        if term.present?
            where('name LIKE ?', "%#{search}%")
        else
            all
        end
    end
 
     def self.to_csv(options = {})
         CSV.generate(options) do |csv|
           csv << column_names
           all.each do |student|
             csv << student.attributes.values_at(*column_names)
           end
        end
    end
end
