class User < ApplicationRecord
    has_many :reviews
    has_many :movies, through: :reviews
    validates :username, presence: true
    validates :password, length: {minimum: 6, message:"Are you dumb? Make it more secure!"}
end
