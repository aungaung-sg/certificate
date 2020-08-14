class Course < ApplicationRecord
    has_many :students
    belongs_to :user
    validates :name, presence: true
end
