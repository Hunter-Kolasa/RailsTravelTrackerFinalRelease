class User < ApplicationRecord
    has_many :vacations
    has_secure_password
    accepts_nested_attributes_for :vacations, allow_destroy: true
    before_save { self.email = email.downcase }
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
end
