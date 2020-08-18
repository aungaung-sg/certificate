class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attr_accessor :login, :skip_validation
  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: {maximum: 255}, uniqueness: { case_sensitive: false }, format: { :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/, message: "may only contain letters and numbers." }
  validates :password, length: { minimum: 8}
  validate :password_complexity, unless: :skip_validation
  validate :validate_name, unless: :skip_validation
  has_many :students
  has_many :courses
  belongs_to :theme

  #overrrite the build method to login with name or email
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_h).where(["lower(name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:name) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def password_complexity
    if password.present?
        if !password.match(/\A[0-9A-Za-z\+\*\.\-\?_!#$%&=\/]+\z/) 
          errors.add :password, "Password complexity requirement not met"
        end
    end
  end

  def validate_name
    if User.where(email: name).exists?
      errors.add(:name, :invalid)
    end
  end
end
