class User < ActiveRecord::Base
    has_many :plots 
    has_many :characters, through: :plots
    has_secure_password
end