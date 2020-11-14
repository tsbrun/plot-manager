class User < ActiveRecord::Base
    has_many :plots 
    has_many :characters, through: :plots
    validates :name, :email, :password, presence: true
    validates :email, 
    format: { with: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/  },
            uniqueness: { case_sensitive: false }
    has_secure_password
end