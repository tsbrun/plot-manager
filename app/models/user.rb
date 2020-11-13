class User < ActiveRecord::Base
    has_many :plots 
    has_many :characters, through: :plots
    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true 
    has_secure_password
end