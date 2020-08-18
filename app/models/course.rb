class Course < ApplicationRecord
    has_many :students
    belongs_to :user
    validates :name, presence: true
    scope :branch_ordered, ->(order) { includes(:user).order("users.name" + " " + order) }
end
