class User < ApplicationRecord
    has_secure_password
    validates :email, :presence => true, :uniqueness => true
    has_many :feeds
    has_many :posts, :through => :feeds
end
