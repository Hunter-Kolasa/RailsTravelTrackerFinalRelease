class User < ApplicationRecord
    validates :username, presence: true
    validates :password, length: {minimum: 6, message:"Are you dumb? Make it more secure!"}
end
