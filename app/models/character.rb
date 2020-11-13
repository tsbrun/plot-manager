class Character < ActiveRecord::Base
    belongs_to :plot
    validates :name, :role, :description, presence: true
end