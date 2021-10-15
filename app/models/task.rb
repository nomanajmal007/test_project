class Task < ApplicationRecord
    
    belongs_to :business
    validates :title, uniqueness: true
end
