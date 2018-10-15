class User < ApplicationRecord
    validates :user, :email, :password presence: true
end
